package com.spring.mvc.controllers;

import com.mysql.cj.Session;
import com.spring.mvc.models.Login;
import com.spring.mvc.models.User;
import com.spring.mvc.services.UserService;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Arrays;
import java.util.List;


@Controller
@RequestMapping(value = "user")
public class UserController {

    @Autowired
    UserService userService;

    @Autowired
    HttpSession session;

    @Autowired
    BCryptPasswordEncoder bCryptPasswordEncoder;

    @PostMapping("")
    public String store(@ModelAttribute User user, Model model) {
        userService.addUser(user);
        model.addAttribute("user", user);
        session.setAttribute("logged", user);
        return "user/profile";
    }

    @GetMapping("edit/{id}")
    public String edit(Model model, @PathVariable int id) {
        if (session.getAttribute("logged") != null) {
            model.addAttribute("user", userService.find(id));
            return "user/update";
        } else {
            return "welcome";
        }
    }

    @PostMapping("/update")
    public String update(@ModelAttribute User user, Model model) {
        String password = userService.find(Integer.parseInt(session.getAttribute("logged").toString())).getPassword();
        if(!bCryptPasswordEncoder.matches(user.getPassword(),password)){
            model.addAttribute("user", user);
            model.addAttribute("password","invalid");
            return "user/update";
        }else {
            userService.updateUser(user);
            model.addAttribute(user);
            model.addAttribute("success","true");
            return "user/update";
        }
    }

    @GetMapping("/{id}")
    @ResponseBody
    public String delete(@PathVariable int id) {
        if (userService.deleteUser(id) == 1) {
            return "success";
        } else {
            return "error";
        }
    }

    @GetMapping("")
    public String viewAll(Model model) {
        if (session.getAttribute("logged") != null) {

            model.addAttribute("users", (List<User>) userService.listAllUsers());
            return "user/index";
        } else {
            return "welcome";
        }
    }

    @GetMapping("view/{id}")
    public String viewUser(@PathVariable int id, Model model) {
        if (session.getAttribute("logged") != null) {
            model.addAttribute("user", (User) userService.find(id));
            return "user/profile";
        } else {
            return "welcome";
        }
    }

    @PostMapping("/login")
    public String login(@ModelAttribute Login login, Model model) {
        User user = userService.login(login.getEmail(), login.getPassword());
        if (user != null) {
            model.addAttribute("user", user);
            session.setAttribute("logged", user.getId());
            return "user/profile";
        } else {
            session.setAttribute("logged", null);
            model.addAttribute("credentials", "invalid");
            return "welcome";
        }
    }

    @GetMapping("logout")
    public String logout() {
        session.removeAttribute("logged");
        return "welcome";
    }

    @GetMapping("search/{searchQuery}")
    @ResponseBody
    public String search(@PathVariable String searchQuery) {
        JSONArray jsonArray = new JSONArray();
        List<User> users = userService.searchUsers(searchQuery);
        for (User user : users) {
            JSONObject json = new JSONObject();
            json.put("id", user.getId());
            json.put("firstname", user.getFirstname());
            json.put("lastname", user.getLastname());
            json.put("email", user.getEmail());
            json.put("Address", user.getAddress());
            jsonArray.put(json);
        }
        return jsonArray.toString();
    }

}
