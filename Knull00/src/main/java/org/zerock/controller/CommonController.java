package org.zerock.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CommonController {

	
	/* # ���� ���� */
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		log.info("���� �Ұ� : " + auth);
		
		model.addAttribute("msg","Access Denied");
	}
	
	/* # �α��� */
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
	
	/* # �α׾ƿ� */
	@GetMapping("/customLogout")
	public void logoutGET() {
		log.info("�α׾ƿ�");
	}
	
	@GetMapping("/sample/all")
	public void doAll() {
		
	}
	
}