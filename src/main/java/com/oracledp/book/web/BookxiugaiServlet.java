package com.oracledp.book.web;

import com.oracledp.book.biz.BookListbiz;
import com.oracledp.book.biz.SmallBiz;
import com.oracledp.book.biz.impl.BookListzimpl;
import com.oracledp.book.biz.impl.SmallBizimpl;
import com.oracledp.book.model.BookTuShu;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "BookxiugaiServlet",value = "/bookxiugai")
public class BookxiugaiServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {




    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

     //获得参数
        String strId = request.getParameter("id");
        System.out.println(strId);
        int id = Integer.parseInt(strId);
        //调业成
        //把数据库的所有值映射出来
        BookListbiz bookListbiz = new BookListzimpl();
        BookTuShu book = bookListbiz.bookAll(id);

        SmallBiz smallBiz = new SmallBizimpl();
        int bid = smallBiz.huitian(book.getSib());


        request.setAttribute("book",book);
        request.setAttribute("bid",bid);
        request.getRequestDispatcher("bookxiugai.jsp").forward(request,response);

    }


}
