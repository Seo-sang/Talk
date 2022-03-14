package com.backend.DAO;

import com.backend.DTO.LoginDTO;
import com.backend.DTO.UserDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;

@Repository
public class UserDAOImpl implements UserDAO{
    private static final String NAMESPACE = "com.backend.mappers.user.UserMapper";
    private final SqlSession sqlSession;

    @Inject
    public UserDAOImpl(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    @Override
    public void register(UserDTO userDTO) throws Exception {
        System.out.println("userDAO register worked");
        sqlSession.insert(NAMESPACE + ".register", userDTO);
    }

    @Override
    public UserDTO login(LoginDTO loginDTO) throws Exception {
        return sqlSession.selectOne(NAMESPACE + ".login", loginDTO);
    }
}
