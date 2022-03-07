package com.backend.user.service;

import com.backend.dao.UserDAO;
import com.backend.dto.UserDTO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;

@Service
public class UserServiceImpl implements UserService {
    private final UserDAO dao;

    @Inject
    public UserServiceImpl(UserDAO dao) {
        this.dao = dao;
        System.out.println("hello");
    }

    @Override
    public void register(UserDTO dto) throws Exception {
        dao.register(dto);
    }
}
