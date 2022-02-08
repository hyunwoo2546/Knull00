package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

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
	
	/* # 페이징 */
	public List<BoardVO> getListWithPaging(Criteria cri);
	
	/* # 총 게시물 */
	public int getTotalCount(Criteria cri);
	
	/* # 댓글 카운트 */
	public void updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount);
	
}
