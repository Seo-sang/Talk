package com.backend.user.service;

import com.backend.dto.UserDTO;

public interface UserService {
    //회원가입 처리
    void register(UserDTO dto) throws Exception;
}
