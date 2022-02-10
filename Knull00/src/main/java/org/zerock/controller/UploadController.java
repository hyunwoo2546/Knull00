package org.zerock.controller;


import java.io.File;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class UploadController {
	
	@GetMapping("/uploadForm")
	public void uploadForm() {
		
		log.info("upload form");
		
	}
	
	
	@PostMapping("/uploadFormAction")
	public void uploadFormPost(MultipartFile[] upload, Model model) {
	  
	String uploadFoler = "C:\\upload";
		  
	for (MultipartFile multipartFile : upload) {
	     log.info("-----------------------------------");
		 log.info("Upload File Name : " + multipartFile.getOriginalFilename());
		 log.info("Upload File Size : " + multipartFile.getSize());
		  
		 File saveFile = new File(uploadFoler,multipartFile.getOriginalFilename());
		  
		 try {
			multipartFile.transferTo(saveFile);
		 } catch (Exception e) {
			log.error(e.getMessage());
		 } 
	  }
	}
	
	@PostMapping("/uploadAjaxAction")
	public void uploadAjaxAction(MultipartFile[] uploadFile) {
		
		log.info("update ajax post....");
		
		String uploadFoler = "C:\\upload";
		
		for (MultipartFile multipartFile : uploadFile) {
			log.info("-----------------------------------");
			log.info("Upload File Name : " + multipartFile.getOriginalFilename());
			log.info("Upload File Size : " + multipartFile.getSize());
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") +1);
			
			log.info("���� �̸� :" + uploadFileName);
			
			File saveFile = new File(uploadFoler,uploadFileName);
			
			try {
				multipartFile.transferTo(saveFile);
			} catch (Exception e) {
				log.error(e.getMessage());
			} 
		}
	}
	@GetMapping("/uploadAjax")
	public void uploadAjax() {
		log.info("upload ajax");
	}
	  
	
}
