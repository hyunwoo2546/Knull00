package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class SappleController {

	@GetMapping("/all")
	public void doAll() {
		log.info("doAll");
	}
	@GetMapping("/member")
	public void doMember() {
		log.info("doMember");
	}
	@GetMapping("/admin")
	public void doAdmin() {
		log.info("doAdmin");
	}
	
}
