package com.main.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.main.service.LoginService;

//메인 controller
@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Inject
	LoginService service;
	
	// http://localhost:8080/uneeds/
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "uneeds_main";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(HttpServletRequest req) {
		 	String referrer = req.getHeader("Referer");
		    req.getSession().setAttribute("prevPage", referrer);
		return "uneeds_login";
	}
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		return "uneeds_join";
	}
	
	@RequestMapping(value = "/logincheck", method = RequestMethod.GET)
	public String logincheck() {
		return "logincheck";
	}
	
	 @RequestMapping(value ="loginuneeds", method = RequestMethod.POST)
	 public ModelAndView logincheck(HttpServletRequest req, String usr, String pwd){
		 	HttpSession session= req.getSession();	 
	        ModelAndView mav = new ModelAndView();
	        String referer = req.getHeader("Referer");
	        String redirectUrl = (String) session.getAttribute("prevPage");
	        
	        if(service.loginCheck(session, usr, pwd)){ // 로그인 성공
	            mav.setViewName("redirect:" + redirectUrl);
	            System.out.println("redirect:" + redirectUrl);
	            session.removeAttribute(redirectUrl);
	            }
	        else{ // 로그인 실패
	        	mav.setViewName("redirect:" + redirectUrl);
	        }
	        return mav;
	 }
	 
	 @RequestMapping(value = "login", method = RequestMethod.POST)
		public String totalLogin(HttpServletRequest req, @RequestParam String id, @RequestParam String site) {
			HttpSession session= req.getSession();
			session.setAttribute("login", "logined");
			session.setAttribute("id", id);
			session.setAttribute("site", site);
			System.out.printf("사이트: %s, 아이디: %s",site, id);
			
			
			// 이전페이지 url가져오기
			String referer = req.getHeader("Referer");
			return "redirect:"+referer;
		}
	
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String totalLogout(HttpServletRequest req) {
		HttpSession session= req.getSession();
		session.invalidate();
		
		//이전 url로 되돌아가기
		String referer = req.getHeader("Referer");
		return "redirect:"+referer;
	}
	
	
}
