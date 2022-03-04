package com.backend.user.service;

import com.backend.dao.UserDAO;
import com.backend.dto.UserDTO;

import javax.inject.Inject;

public class UserServiceImpl implements UserService {
    private final UserDAO dao;

    @Inject
    public UserServiceImpl(UserDAO dao) {
        this.dao = dao;
    }

    @Override
    public void register(UserDTO dto) throws Exception {
        dao.register(dto);
    }
}
