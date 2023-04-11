package com.myspring.proTest.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.proTest.member.dao.TestDAO;
import com.myspring.proTest.member.vo.TestVO;

@Service("testService")
@Transactional(propagation = Propagation.REQUIRED)
public class TestServiceImpl implements TestService{
	@Autowired
	private TestDAO testDAO;
	
	@Override
	public List listMembers() throws DataAccessException{
		List membersList = null;
		membersList = testDAO.listTests();
		return membersList;
	}
}