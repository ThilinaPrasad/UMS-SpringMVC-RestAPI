package com.spring.mvc.controllers;

import com.spring.mvc.models.User;
import com.spring.mvc.services.UserService;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
@CrossOrigin
@RequestMapping(value = "user")
public class UserController {

    @Autowired
    UserService userService;

    @Autowired
    HttpSession session;

    @Autowired
    BCryptPasswordEncoder bCryptPasswordEncoder;

    @GetMapping("test")
    public void test(){
        System.out.println("Test called");
    }

    @ResponseBody
    @PutMapping("/update/{id}")
    public String update(@RequestBody String user, @PathVariable int id) {
        JSONObject userData = new JSONObject(user);
        User u = jsonToUser(userData);
        u.setId(userData.getInt("id"));
        String password = ((User) userService.find(u.getId())).getPassword();
        System.out.println(u.getId());
        if (!bCryptPasswordEncoder.matches(u.getPassword(), password)) {
            userData.put("status",false);
        } else {
            userService.updateUser(u);
            userData.put("status",true);
        }
        return userData.toString();
    }

    @PostMapping("/create")
    @ResponseBody
    public String create(@RequestBody String data) {
        JSONObject json = new JSONObject();
        User user = jsonToUser(new JSONObject(data));
        User response = userService.addUser(user);
        if (response.getEmail().equals("available")) {
            json.put("id", "available");
        } else {
            if (response != null) {
                session.setAttribute("logged", response.getId());
                json = objectToJson(response);
            } else {
                json.put("id", "none");
            }
        }
        return json.toString();
    }

    @DeleteMapping("/{id}")
    @ResponseBody
    public String delete(@PathVariable int id) {
        JSONObject json = new JSONObject();
        if (userService.deleteUser(id) == 1) {
            json.put("status", true);
        } else {
            json.put("status", false);
        }
        return json.toString();
    }

    @GetMapping("/email/{email}")
    @ResponseBody
    public String email(@PathVariable String email) {
        System.out.println(email);
        JSONObject json = new JSONObject();
        if (userService.findEmail(email) != null) {
            json.put("status", true);
        } else {
            json.put("status", false);
        }
        return json.toString();
    }

    @GetMapping("/view")
    @ResponseBody
    public String viewAll() {
        List<User> users = (List<User>) userService.listAllUsers();
        System.out.println(session.getAttribute("logged"));
        return arrayToJson(users);
    }

    @GetMapping("view/{id}")
    @ResponseBody
    public String viewUser(@PathVariable int id) {
        return objectToJson(userService.find(id)).toString();
    }

    @PostMapping("login")
    @ResponseBody
    public String login(@RequestBody String login) {
        JSONObject jsonLogin = new JSONObject(login);
        String email = jsonLogin.get("email").toString();
        String password = jsonLogin.get("password").toString();
        User user = userService.login(email, password);
        if (user != null) {
            session.setAttribute("logged", user.getId());
            return objectToJson(user).put("status", "Valid").toString();
        } else {
            session.setAttribute("logged", null);
            return jsonLogin.put("status", "Invalid").toString();
        }

    }

    @GetMapping("logout")
    public void logout() {
        System.out.println("logged Out");
        session.removeAttribute("logged");
    }

    @GetMapping("search")
    @ResponseBody
    public String search(@RequestParam String search_query) {
        List<User> users = userService.searchUsers(search_query);
        return arrayToJson(users);
    }

    public String arrayToJson(List<User> users) {
        JSONArray jsonArray = new JSONArray();
        for (User user : users) {
            jsonArray.put(objectToJson(user));
        }
        return jsonArray.toString();
    }

    public JSONObject objectToJson(User user) {
        JSONObject json = new JSONObject();
        json.put("id", user.getId());
        json.put("firstname", user.getFirstname());
        json.put("lastname", user.getLastname());
        json.put("email", user.getEmail());
        json.put("address", user.getAddress());
        return json;
    }

    public User jsonToUser(JSONObject jsonUser) {
        User user = new User();
        user.setFirstname(jsonUser.getString("firstname"));
        user.setLastname(jsonUser.getString("lastname"));
        user.setEmail(jsonUser.getString("email"));
        user.setAddress(jsonUser.getString("address"));
        user.setPassword(jsonUser.getString("password"));
        return user;

    }
}
