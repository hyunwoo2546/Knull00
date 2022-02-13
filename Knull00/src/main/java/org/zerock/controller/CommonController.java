package org.zerock.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;
import org.zerock.service.BoardService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CommonController {

	private BoardService service;
	
	/* # 접근 에러 */
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		log.info("접근 불가 : " + auth);
		
		model.addAttribute("msg","Access Denied");
	}
	
	/* # 로그인 */
	@GetMapping("/customLogin")
	public void loginInput(String error,String logout, Model model) {
		log.info("error : "+ error);
		log.info("logout : " + logout);
		
		if (error != null) {
			model.addAttribute("error","Login Error Check Your Account");
		}
		
		if (logout != null) {
			model.addAttribute("logout","Logout!!");
		}
	}
	
	/* # 로그아웃 */
	@GetMapping("/customLogout")
	public void logoutGET() {
		log.info("로그아웃");
	}
	
	@GetMapping("/sample/all")
	public void doAll() {
		
	}
	
}
