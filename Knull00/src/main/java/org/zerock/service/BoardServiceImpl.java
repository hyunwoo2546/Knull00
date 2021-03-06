package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.BoardAttachVO;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.mapper.BoardAttachMapper;
import org.zerock.mapper.BoardMapper;
import org.zerock.mapper.ReplyMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private BoardAttachMapper attachMapper;
	
	@Autowired
	private ReplyMapper replyMapper;
	
	
	/* # 게시글 등록 */
	@Transactional
	@Override
	public void register(BoardVO board) {

		log.info("register...." + board);
		
		mapper.insertSelectKey(board);
		
		if(board.getAttachList() == null || board.getAttachList().size() <=0) {
			return;
		}
		board.getAttachList().forEach(attach -> {
			attach.setBno(board.getBno());
			attachMapper.insert(attach);
		});
		
	}

	/* # 게시글 보기 */
	@Override
	public BoardVO get(Long bno) {
		
		log.info("조회한 게시물 번호......" + bno);
		
		return mapper.read(bno);
	}

	/* # 게시글 수정 */
	@Transactional
	@Override
	public boolean modify(BoardVO board) {
		
		log.info("수정......" + board);
		
		attachMapper.deleteAll(board.getBno());
		
		boolean modifyResult = mapper.update(board) == 1;
		
		if(modifyResult && board.getAttachList() != null && board.getAttachList().size() > 0) {
			board.getAttachList().forEach(attach -> {
				attach.setBno(board.getBno());
				attachMapper.insert(attach);
			});
		}
		
		return modifyResult;
	}

	/* # 게시글 삭제 */
	@Transactional
	@Override
	public boolean remove(Long bno) {
		
		log.info("삭제......" + bno);
		
		attachMapper.deleteAll(bno);
		
		replyMapper.delete(bno);
		
		return mapper.delete(bno) == 1;
	}

	/* # 게시글 전체 목록 */
	@Override
	public List<BoardVO> getList(Criteria cri) {
		
		log.info("getList......" + cri);
		
		return mapper.getListWithPaging(cri);
	}
	
	/* # 게시글 전체 토탈 수 */
	@Override
	public int getTotal(Criteria cri) {
		
		log.info("전체 게시글 수....");
		
		return mapper.getTotalCount(cri);
	}

	/* # 첨부파일 목록 */
	@Override
	public List<BoardAttachVO> getAttachList(Long bno) {
		
		log.info("첨부파일이 등록된 해당 게시물 번호 : " + bno);
		
		return attachMapper.findByBno(bno);
	}
	
}
