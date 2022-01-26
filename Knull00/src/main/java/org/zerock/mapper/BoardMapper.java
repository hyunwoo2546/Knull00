package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.BoardVO;

public interface BoardMapper {

	/* # 전체 게시물 조회 */
	public List<BoardVO> getList();
	
	/* # 추가 */
	public void insert(BoardVO board);
	
	/* # 추가 (PK : bno) */
	public void insertSelectKey(BoardVO board);
	
	/* # 게시글 보기 */
	public BoardVO read(Long bno);
	
	/* # 삭제 */
	public int delete(Long bno);
	
	/* # 수정 */
	public int update(BoardVO board);
	
}
