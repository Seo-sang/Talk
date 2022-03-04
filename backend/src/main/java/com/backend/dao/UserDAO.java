package com.backend.dao;

import com.backend.dto.UserDTO;

public interface UserDAO {
    public void register(UserDTO dto) throws Exception;
}
