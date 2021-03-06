package com.backend.service;

import com.backend.DAO.UserDAO;
import com.backend.DTO.LoginDTO;
import com.backend.DTO.UserDTO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;

@Service
public class UserServiceImpl implements UserService{
    private final UserDAO userDAO;

    @Inject
    public UserServiceImpl(UserDAO userDAO) {
        System.out.println("userservice worked");
        this.userDAO = userDAO;
    }

    @Override
    public void register(UserDTO userDTO) throws Exception {
        System.out.println("userService register worked");
        userDAO.register(userDTO);
    }

    @Override
    public UserDTO login(LoginDTO loginDTO) throws Exception {
        return userDAO.login(loginDTO);
    }
}
