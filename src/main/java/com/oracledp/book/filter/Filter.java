package com.oracledp.book.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(filterName = "Filter",urlPatterns = "/*")
public class Filter implements javax.servlet.Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse responses = (HttpServletResponse) resp;

        //找到对应的url给与放行 不进行拦截，
        if(request.getRequestURI().endsWith("/admin")||request.getRequestURI().contains("/bower_components/")||request.getRequestURI().endsWith("login.jsp")||request.getRequestURI().endsWith("/vcode.png")){
            chain.doFilter(req, resp);
            return;
        }
        //如果
        if(request.getSession().getAttribute("admin")==null||!(Boolean) request.getSession().getAttribute("admin")){
        responses.sendRedirect("login.jsp");

        return;
            //vcode.png
        }

        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
