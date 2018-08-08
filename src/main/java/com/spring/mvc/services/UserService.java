package com.spring.mvc.services;

import com.spring.mvc.dao.UserDao;
import com.spring.mvc.models.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {
    UserDao userDao;

    @Autowired
    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    public List listAllUsers() {
        return userDao.listAllUsers();
    }

    public User addUser(User user) {
        return userDao.addUser(user);
    }

    public void updateUser(User user) {
        userDao.updateUser(user);
    }

    public int deleteUser(int id) {
        return userDao.deleteUser(id);
    }

    public User findEmail(String email) {
        return userDao.findUserByEmail(email);
    }

    public User find(int id) {
        return userDao.findUserById(id);
    }

    public User login(String email,String password){
        return userDao.validateUser(email,password);
    }

    public List<User> searchUsers(String searchQuery){
        return userDao.searchUser(searchQuery);
    }
}
