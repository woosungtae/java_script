package com.myspring.proTest.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface TestController {
	public ModelAndView listMembers(HttpServletRequest request, HttpServletResponse response) throws Exception;

}
