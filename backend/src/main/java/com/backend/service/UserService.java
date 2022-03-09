package com.backend.service;

import com.backend.DTO.UserDTO;

public interface UserService {
    void register(UserDTO userDTO) throws Exception;
}
