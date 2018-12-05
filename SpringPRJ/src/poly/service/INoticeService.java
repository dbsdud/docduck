package poly.service;

import java.util.List;

import poly.dto.NoticeDTO;

public interface INoticeService {
	public List<NoticeDTO> getNoticeList() throws Exception;
	public int insertNotice(NoticeDTO nDTO) throws Exception;
	public NoticeDTO getNoticeDetail(NoticeDTO nDTO) throws Exception;
	public int updateNoticeCount(String noticeNo) throws Exception;
	public int deleteNotice(String noticeNo) throws Exception;
	public int updateNotice(NoticeDTO nDTO) throws Exception;
}
