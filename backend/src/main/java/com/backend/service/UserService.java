package com.backend.service;

import com.backend.DTO.LoginDTO;
import com.backend.DTO.UserDTO;

public interface UserService {
    void register(UserDTO userDTO) throws Exception;

    UserDTO login(LoginDTO loginDTO) throws Exception;
}
