package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.BoardAttachVO;

public interface BoardAttachMapper {

	/* # 첨부파일 추가 */
	public void insert(BoardAttachVO vo);
	
	/* # 첨부파일 삭제 */
	public void delete(String uuid);
	
	/* # 첨부파일 보여주기 */
	public List<BoardAttachVO> findByBno(Long bno);
	
	/* # 첨부파일 전체 삭제 */
	public void deleteAll(Long bno);
	
	/* # 오래된 첨부파일 목록 */
	public List<BoardAttachVO> getOldFiles();
	
}
