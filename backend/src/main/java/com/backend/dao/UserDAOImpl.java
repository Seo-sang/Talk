package com.backend.dao;

import javax.inject.Inject;
import com.backend.dto.UserDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository //현재 클래스를 dao bean으로 등록
public class UserDAOImpl implements UserDAO {
    private static final String NAMESPACE = "com.doubles.mvcboard.mappers.user.UserMapper";
    private final SqlSession sqlSession;

    @Inject
    public UserDAOImpl(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    @Override
    public void register(UserDTO dto) throws Exception {
        sqlSession.insert(NAMESPACE + ".register", dto);
    }
}
