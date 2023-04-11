package com.myspring.proTest.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myspring.proTest.member.service.TestService;
import com.myspring.proTest.member.vo.TestVO;

@Controller("testController")
public class TestControllerImpl implements TestController {
	private static final Logger logger = LoggerFactory.getLogger(TestControllerImpl.class);
	@Autowired
	private TestService testService;
	@Autowired
	private TestVO testVO;
	
	@Override
	@RequestMapping(value="/member/listMembers.do", method = RequestMethod.POST)
	public ModelAndView listMembers(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		logger.info("viewName:"+viewName);
		logger.debug("viewName:"+viewName);
		List membersList = testService.listMembers();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("membersList",membersList);
		return mav;
	}
	@RequestMapping(value= {"/member/test9.do","/member/test9.do"},method = RequestMethod.POST)
    public ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = getViewName(request);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
		@RequestMapping (value= "/member/*Form.do", method = RequestMethod.POST)
		private ModelAndView form(@RequestParam(value="result", required=false)String result, HttpServletRequest request, HttpServletResponse response) throws Exception{
			String viewName = (String) request.getAttribute("viewName");
			ModelAndView mav = new ModelAndView();
			mav.addObject("result",result);
			mav.setViewName(viewName);
			return mav;
		}
		private String getViewName(HttpServletRequest request) throws Exception{
			String contextPath = request.getContextPath();
			String uri = (String) request.getAttribute("javax.servlet.include.request_uri");
			if(uri == null || uri.trim().equals("")) {
				uri = request.getRequestURI();
			}
			int begin = 0;
			if(!((contextPath == null) || ("".equals(contextPath)))) {
				begin = contextPath.length();
			}
			int end;
			if(uri.indexOf(":") != -1) {
				end = uri.indexOf(":");
			} else if (uri.indexOf("?") != -1) {
				end = uri.indexOf("?");
			} else {
				end = uri.length();
			}
			String viewName = uri.substring(begin,end);
			if(viewName.indexOf(".") != -1) {
				viewName = viewName.substring(0, viewName.lastIndexOf("."));
			}
			if (viewName.lastIndexOf("/") != -1) {
				viewName = viewName.substring(viewName.lastIndexOf("/",1), viewName.length());
			}
			return viewName;
		}
	}