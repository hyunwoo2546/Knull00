package org.zerock.controller;


import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.domain.AttachFileDTO;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
public class UploadController {
	
	/* # 이미지 파일 판단 */
	private boolean checkImageType(File file) {
		
		try {
			String contentType = Files.probeContentType(file.toPath());
			
			return contentType.startsWith("image");
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	/* # 년/월/일 폴더 생성 */
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		
		String str = sdf.format(date);
		
		return str.replace("-", File.separator); // File.separator : 구분자 역할을 함.
	}
	
		
	/* # Ajax 업로드 GetMapping */
	@GetMapping("/uploadAjax")
	public void uploadAjax() {
		log.info("upload ajax");
	}
		
	/* # Ajax 업로드 PostMapping */
	@PostMapping(value = "/uploadAjaxAction",
			produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<AttachFileDTO>> uploadAjaxAction(MultipartFile[] uploadFile) {
		
		log.info("update ajax post....");
		
		List<AttachFileDTO> list = new ArrayList<>();
		String uploadFoler = "C:\\upload";
		String uploadFolderPath = getFolder();
		
		File uploadPath = new File(uploadFoler,uploadFolderPath);
		
		log.info("upload path : " + uploadPath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		for (MultipartFile multipartFile : uploadFile) {
			log.info("-----------------------------------");
			log.info("Upload File Name : " + multipartFile.getOriginalFilename());
			log.info("Upload File Size : " + multipartFile.getSize());
			
			AttachFileDTO attachFileDTO = new AttachFileDTO();
			
			String uploadFileName = multipartFile.getOriginalFilename();
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") +1);
			
			log.info("파일 이름 :" + uploadFileName);
			attachFileDTO.setFileName(uploadFileName);
			
			/* # UUID(중복 방지) */
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			//                uuid 랜덤이름       _     원본 파일명
			/* / UUID */
			
			try {
				File saveFile = new File(uploadPath,uploadFileName);
				multipartFile.transferTo(saveFile);
				
				attachFileDTO.setUuid(uuid.toString());
				attachFileDTO.setUploadPath(uploadFolderPath);
				
				/* # 이미지 파일인지 체크 */
				if(checkImageType(saveFile)) {
					attachFileDTO.setImage(true);
					
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath,"S_" + uploadFileName));
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100,100);
					
					thumbnail.close();
				}
				
				list.add(attachFileDTO);
				
			} catch (Exception e) {
				log.error(e.getMessage());
			} 
		}
		return new ResponseEntity<>(list,HttpStatus.OK);
	}
	
}
