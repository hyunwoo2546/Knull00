package org.zerock.domain;

import lombok.Data;

/*# 첨부파일 정보*/
@Data
public class AttachFileDTO {

	private String fileName;
	private String uploadPath;
	private String uuid;
	private boolean image;
	
}
