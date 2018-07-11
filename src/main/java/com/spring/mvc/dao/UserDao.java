package com.spring.mvc.dao;

import com.spring.mvc.models.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import java.util.List;

public class UserDao {

    NamedParameterJdbcTemplate namedParameterJdbcTemplate;
    BCryptPasswordEncoder bCryptPasswordEncoder;

    @Autowired
    public void setbCryptPasswordEncoder(BCryptPasswordEncoder bCryptPasswordEncoder) {
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
    }

    @Autowired
    public void setNamedParameterJdbcTemplate(NamedParameterJdbcTemplate namedParameterJdbcTemplate) {
        this.namedParameterJdbcTemplate = namedParameterJdbcTemplate;
    }

    private SqlParameterSource getSqlParameterByModel(User user){
        MapSqlParameterSource parameterSource = new MapSqlParameterSource();
        if(user != null){

            parameterSource.addValue("id", user.getId());
            parameterSource.addValue("firstname", user.getFirstname());
            parameterSource.addValue("lastname", user.getLastname());
            parameterSource.addValue("address", user.getAddress());
            parameterSource.addValue("email", user.getEmail());
            parameterSource.addValue("password",user.getPassword());
        }
        return parameterSource;
    }

    public List<User> listAllUsers(){
        String sql = "SELECT * FROM users";

        List list = namedParameterJdbcTemplate.query(sql,getSqlParameterByModel(null),new UserMapper());
        return list;
    }

    public int addUser(User u){
        String sql = "INSERT INTO users(firstname, lastname, address,email,password) VALUES(:firstname, :lastname, :address, :email,:password)";
        u.setPassword(bCryptPasswordEncoder.encode(u.getPassword()));
        //System.out.println(u.getPassword());
        return namedParameterJdbcTemplate.update(sql,getSqlParameterByModel(u));
    }

    public int updateUser(User u){
        String sql = "UPDATE users SET firstname = :firstname, lastname = :lastname, address = :address WHERE id = :id";
        return namedParameterJdbcTemplate.update(sql,getSqlParameterByModel(u));
    }

    public int deleteUser(int id){
        String sql = "DELETE FROM users WHERE id = :id";
        return namedParameterJdbcTemplate.update(sql,getSqlParameterByModel(new User(id)));
    }

    public User findUserById(int id){
        String sql = "SELECT * FROM users WHERE id = :id";
        return (User)namedParameterJdbcTemplate.queryForObject(sql,getSqlParameterByModel(new User(id)),new UserMapper());
    }

    public User validateUser(String email,String password){
        String sql = "SELECT * FROM users WHERE email = '"+email+"'";
        List<User> list=namedParameterJdbcTemplate.query(sql,new UserMapper());
        if(list.size()>0 && bCryptPasswordEncoder.matches(password,list.get(0).getPassword())){
            return list.get(0);
        }else {
            return null;
        }
    }

    public List<User> searchUser(String searchQuery){
        String sql = "SELECT * FROM users WHERE firstname LIKE '"+searchQuery+"%'";
        List<User> users=namedParameterJdbcTemplate.query(sql,new UserMapper());
        return users;
    }
}

