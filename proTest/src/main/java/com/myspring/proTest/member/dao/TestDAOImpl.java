package com.myspring.proTest.member.dao;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.proTest.member.vo.TestVO;

@Repository("testDAO")
public class TestDAOImpl implements TestDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List listTests() throws DataAccessException {
		List<TestVO> membersList = null;
		membersList = sqlSession.selectList("mapper.member.selectAllMemberList");
		return membersList;
	}
}