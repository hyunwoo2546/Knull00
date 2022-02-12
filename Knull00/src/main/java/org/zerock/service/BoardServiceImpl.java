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
	
	/* # �Խñ� ��� */
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

	/* # �Խñ� ���� */
	@Override
	public BoardVO get(Long bno) {
		
		log.info("��ȸ�� �Խù� ��ȣ......" + bno);
		
		return mapper.read(bno);
	}

	/* # �Խñ� ���� */
	@Override
	public boolean modify(BoardVO board) {
		
		log.info("����......" + board);
		
		return mapper.update(board) == 1;
	}

	/* # �Խñ� ���� */
	@Override
	public boolean remove(Long bno) {
		
		log.info("����......" + bno);
		
		return mapper.delete(bno) == 1;
	}

	/* # �Խñ� ��ü ��� */
	@Override
	public List<BoardVO> getList(Criteria cri) {
		
		log.info("getList......" + cri);
		
		return mapper.getListWithPaging(cri);
	}
	
	/* # �Խñ� ��ü ��Ż �� */
	@Override
	public int getTotal(Criteria cri) {
		
		log.info("��ü �Խñ� ��....");
		
		return mapper.getTotalCount(cri);
	}

	/* # ÷������ ��� */
	@Override
	public List<BoardAttachVO> getAttachList(Long bno) {
		
		log.info("÷�������� ��ϵ� �ش� �Խù� ��ȣ : " + bno);
		
		return attachMapper.findByBno(bno);
	}
	
}
