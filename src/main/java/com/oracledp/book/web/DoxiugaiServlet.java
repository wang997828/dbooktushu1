package com.oracledp.book.web;

import com.oracledp.book.biz.Booktushubiz;
import com.oracledp.book.biz.impl.Booktushuimpl;
import com.oracledp.book.model.BookTuShu;
import com.oracledp.book.util.MyBeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.util.UUID;

@WebServlet(name = "DoxiugaiServlet",value = "/dobook")
@MultipartConfig
public class DoxiugaiServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获得参数
        BookTuShu bookshuji = new BookTuShu();

        MyBeanUtils.populate(bookshuji, request.getParameterMap(),"yyyy-MM-dd");
        Part part = request.getPart("photo");
        String newfile =null;
        if (part.getHeader("Content-Disposition").contains("; filename=")) {
            if(part.getSubmittedFileName()!=null&&!part.getSubmittedFileName().equals("")) {
                String exe = part.getSubmittedFileName().substring(part.getSubmittedFileName().lastIndexOf(".") + 1);
                newfile = UUID.randomUUID() + "." + exe;
                part.write(request.getServletContext().getRealPath("/upload/") + newfile);
            }
        }
        bookshuji.setTupian(newfile);

        Booktushubiz bootushu = new Booktushuimpl();

        boolean b = bootushu.dobook(bookshuji);
        System.out.println(b +"aaaaaaaaaaaaaaaaaa");
        if(b) {
            response.sendRedirect("bookList");

        }else {


            request.setAttribute("bookshuji", bookshuji);

            request.getRequestDispatcher("bookxiugai.jsp").forward(request, response);

        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
