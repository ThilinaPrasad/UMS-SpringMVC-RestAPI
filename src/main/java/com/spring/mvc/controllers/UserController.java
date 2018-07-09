package com.spring.mvc.controllers;

import com.mysql.cj.Session;
import com.spring.mvc.models.Login;
import com.spring.mvc.models.User;
import com.spring.mvc.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
@RequestMapping(value = "user")
public class UserController {

    @Autowired
    UserService userService;

    @Autowired
    HttpSession session;



    @PostMapping("")
    public String store(@ModelAttribute User user,Model model) {
        userService.addUser(user);
        model.addAttribute("user",user);
        session.setAttribute("logged",user);
        return "user/profile";
    }

    @GetMapping("edit/{id}")
    public String edit(Model model, @PathVariable int id) {
        model.addAttribute("user",userService.find(id));
        return "user/update";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute User user,Model model){
        userService.updateUser(user);
        model.addAttribute(user);
        return "user/update";
    }

    @GetMapping("/{id}")
    @ResponseBody
    public String delete(@PathVariable int id) {
        if(userService.deleteUser(id)==1){
        return "success";}
        else {
            return "error";
        }
    }

    @GetMapping("")
    public String viewAll(Model model){
        model.addAttribute("users", (List<User>) userService.listAllUsers());
        return "user/index";
    }

    @GetMapping("view/{id}")
    public String viewUser(@PathVariable int id,Model model){
        model.addAttribute("user", (User) userService.find(id));
        return "user/profile";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute Login login, Model model){
        System.out.println("login called");
        User user = userService.login(login.getEmail(),login.getPassword());
        if(user!=null){
            model.addAttribute("user",user);
            session.setAttribute("logged",user);
            System.out.println("Credentials okay");
            return "user/profile";
        }
        else{
            model.addAttribute("logged",null);
            return "welcome";
        }
    }

    @GetMapping("logout")
    public String logout(){
        session.removeAttribute("logged");
        return "welcome";
    }
}
