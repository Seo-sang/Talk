package com.backend.DAO;

import com.backend.DTO.LoginDTO;
import com.backend.DTO.UserDTO;

public interface UserDAO {
    void register(UserDTO userDTO) throws Exception;
    UserDTO login(LoginDTO loginDTO) throws Exception;
}
