package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/sample/*")
@AllArgsConstructor
public class TestController {

	/* # 게시판 리스트 */
	@GetMapping("/list")
	public void list2() {
	}
	
}
