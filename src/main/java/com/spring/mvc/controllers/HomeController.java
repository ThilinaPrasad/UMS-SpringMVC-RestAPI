package com.spring.mvc.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;

@Controller
public class HomeController {
    @Autowired
    HttpSession session;

    @GetMapping("/")
    public String index(){
        return "welcome";
    }

    @GetMapping("register")
    public String register(){
    return "user/register";
    }

    @GetMapping("search")
    public String logout(){
        if(session.getAttribute("logged") != null) {
        return "user/search";
    }
        else {
            return "welcome";
        }
    }
}
