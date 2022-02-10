package org.zerock.controller;


import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.Ticket;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/sample")
@Log4j
public class TestController {

	/*
	 * @GetMapping("/getTest/{cat}/{pid}") public String[] getTest(
	 * 
	 * @PathVariable("cat") String cat,
	 * 
	 * @PathVariable("pid") Integer pid) {
	 * 
	 * return new String[] { "catagori" + cat, "productid" + pid };
	 * 
	 * }
	 */
	
	@PostMapping("/ticket")
	public Ticket convert(@RequestBody Ticket ticket) {
		
		log.info("convert........" + ticket);
		
		return ticket;
		
	} 
	
}
