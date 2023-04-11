package com.myspring.proTest.member.service;

import java.util.List;

import org.springframework.dao.DataAccessException;


import com.myspring.proTest.member.vo.TestVO;

public interface TestService {
	public List listMembers() throws DataAccessException;
}