package org.zerock.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.domain.MemberVO;
import org.zerock.service.MemberJoinService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/join/*")
@AllArgsConstructor
public class JoinController {

	private MemberJoinService service;
	
	/* # ȸ������ ������ �̵� */
	@GetMapping("/customJoin")
	public void customJoin() {
		
	}
	
	/* # ȸ������ ��� ó�� */
	@PostMapping("/customJoin")
	public String customJoin(MemberVO vo) {
		
		log.info("ȸ������....." + vo);
		
		service.Join(vo);
		
		return "redirect:/board/list";
	}
	
}