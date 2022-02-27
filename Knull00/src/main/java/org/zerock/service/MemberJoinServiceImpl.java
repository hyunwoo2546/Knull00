package org.zerock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.MemberJoinMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MemberJoinServiceImpl implements MemberJoinService{

	@Autowired
	private MemberJoinMapper mapper;
	
	@Override
	public void Join(MemberVO vo) {
		
		log.info("회원가입...." + vo);

		mapper.joinInsert(vo);
		
	};
		
}
	

