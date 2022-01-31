package org.zerock.controller;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/sample")
@Log4j
public class TestController {

	@GetMapping(value = "/getText", produces = "text/plain; charset=UTF-8")
	public String getTest() {
		
		log.info("MIME : " + MediaType.TEXT_PLAIN_VALUE);
		
		return "æ»≥Á«œººø‰";
	}
	
}
