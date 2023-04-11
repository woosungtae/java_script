package com.myspring.proTest.member.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.proTest.member.vo.TestVO;

public interface TestDAO {
	public List listTests() throws DataAccessException;
}