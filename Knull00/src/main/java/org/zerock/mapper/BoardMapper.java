package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

public interface BoardMapper {

	/* # ��ü �Խù� ��ȸ */
	public List<BoardVO> getList();
	
	/* # �߰� */
	public void insert(BoardVO board);
	
	/* # �߰� (PK : bno) */
	public void insertSelectKey(BoardVO board);
	
	/* # �Խñ� ���� */
	public BoardVO read(Long bno);
	
	/* # ���� */
	public int delete(Long bno);
	
	/* # ���� */
	public int update(BoardVO board);
	
	/* # ����¡ */
	public List<BoardVO> getListWithPaging(Criteria cri);
	
}
