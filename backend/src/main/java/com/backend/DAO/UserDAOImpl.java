package com.backend.DAO;

import com.backend.DTO.UserDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.ArrayList;

@Repository
public class UserDAOImpl implements UserDAO{
    ArrayList<UserDTO> users;

    @Override
    public void register(UserDTO userDTO) throws Exception {
        users.add(userDTO);
    }
}
