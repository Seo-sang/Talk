package com.backend.user.controller;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TestController implements Controller {
    @Override
    public ModelAndView handleRequest(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {
        System.out.println("hello");
        ModelAndView mv = new ModelAndView();
        mv.addObject("data", "HELLO");
        mv.setViewName("index.jsp");

        return mv;
    }
}
