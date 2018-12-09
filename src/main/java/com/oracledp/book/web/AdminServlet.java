package com.oracledp.book.web;

import com.oracledp.book.biz.Adminbiz;
import com.oracledp.book.biz.impl.Adminbizimpl;
import com.oracledp.book.model.Admin;
import com.oracledp.book.util.MyBeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

@WebServlet(name = "AdminServlet",value = "/admin")
public class AdminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Admin admin = new Admin();
        MyBeanUtils.populate(admin,request.getParameterMap());




        //获得验证吗的值
        String Vali= request .getParameter("Vali");
        //获得图片的里传来的值
        String validateCode = (String) request.getSession().getAttribute("validateCode");

       /* if(!validateCode.equalsIgnoreCase(Vali)){
            request.setAttribute("msg","验证不对");
            request.setAttribute("admin",admin);
            request.getRequestDispatcher("login.jsp").forward(request,response);
            return;
        }

        //验证namepwd
        ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
        Validator validator = factory.getValidator();
        Set<ConstraintViolation<Admin>> Violations =validator.validate(admin);
        if(Violations.size()>0){
            Map<String,String> map =  new HashMap<>();
            for(ConstraintViolation<Admin>  ck: Violations){
                map.put(ck.getPropertyPath().toString(),ck.getMessage());

            }
            request.setAttribute("map",map);
            request.setAttribute("admin",admin);
            request.getRequestDispatcher("login.jsp").forward(request,response);
            return ;

        }*/
       //用map集合来映射图片验证的信息
          Map<String,String> map =  new HashMap<>();
          //判断用会输入的验证吗 是否于验证图片上的一样、
        if(!validateCode.equalsIgnoreCase(Vali)){
            map.put("vcode","验证马错误");

        }
        //进行校验  因为用户可能会把 javastaput 验证给关闭 所以要在服务器上进行 验证
        //  要去差官方文档 要想使用 先去添加依赖
        ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
        Validator validator = factory.getValidator();
        //违反约束
        Set<ConstraintViolation<Admin>> Violations =validator.validate(admin);
        //
        //判断用户有没有输入 如国大于零就证明用可能没有输入 把错误信息给便利出去
        if(Violations.size()>0){
            for(ConstraintViolation<Admin>  ck: Violations){
                map.put(ck.getPropertyPath().toString(),ck.getMessage());

            }
            if(map.size()>0){
                request.setAttribute("map",map);
                request.setAttribute("admin",admin);
                request.getRequestDispatcher("login.jsp").forward(request,response);
                return ;

            }


        }


        Adminbiz adminbiz = new Adminbizimpl();

        boolean a = adminbiz.adminbizPadandName(admin);

        if(a){
            //记录又没没有登陆
            request.getSession().setAttribute("admin",true);
            request.getRequestDispatcher("main.jsp").forward(request,response);


        }else{
            request.setAttribute("admin",admin);
            request.getRequestDispatcher("login.jsp").forward(request,response);
        }




    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
