package org.zerock.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {

	@Setter(onMethod_ = {@Autowired})
	private BoardMapper mapper;
	
	@Test
	public void testGetList() {
		
		mapper.getList().forEach(board -> log.info(board));
		
	}
	
	@Test
	public void testInsert() {
		
		BoardVO board = new BoardVO();
		board.setTitle("나는야 루피");
		board.setContent("해적왕이 될 남자지");
		board.setWriter("K");
		
		mapper.insert(board);
		
		log.info(board);
		
	}
	
	@Test
	public void testInsertSelectKey() {
		
		BoardVO board = new BoardVO();
		board.setTitle("나는야 루피 Select");
		board.setContent("해적왕이 될 남자지 Key");
		board.setWriter("newbie");
		
		mapper.insertSelectKey(board);
		
		log.info(board);
		
	}
	
	@Test
	public void testRead() {
		
		BoardVO board = mapper.read(23L);
		
		log.info(board);
		
	}
	
	@Test
	public void testDelete() {
		
		log.info("Delete cnt : " + mapper.delete(28L));
		
	}
	
	@Test
	public void testUpdate() {
		
		BoardVO board = new BoardVO();
		
		board.setBno(26L);
		board.setTitle("나는 조로");
		board.setContent("부 선장이지");
		board.setWriter("Jkey");
		
		int cnt = mapper.update(board);
		log.info("Update cnt : " + cnt);
	}
	
	@Test
	public void testPaging() {
		
		Criteria cri = new Criteria();
		
		cri.setPageNum(3);
		cri.setAmount(20);
		
		List<BoardVO> list = mapper.getListWithPaging(cri);
		
		list.forEach(board -> log.info(board.getBno()));
		
	}
	
	@Test
	public void testSearch() {
		Criteria cri = new Criteria();
		cri.setKeyword("세로");
		cri.setType("");
		
		List<BoardVO> list = mapper.getListWithPaging(cri);
		
		list.forEach(board -> log.info(board));
	}
	
}
