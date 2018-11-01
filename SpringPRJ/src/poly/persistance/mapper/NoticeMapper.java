package poly.persistance.mapper;

import java.util.List;

import config.Mapper;
import poly.dto.NoticeDTO;

@Mapper("NoticeMapper")
public interface NoticeMapper {
	public List<NoticeDTO> getNoticeList() throws Exception;
	public int insertNotice(NoticeDTO nDTO) throws Exception;
	public NoticeDTO getNoticeDetail(NoticeDTO nDTO1) throws Exception;
	public int updateNoticeCount(String noticeNo) throws Exception;
	public int deleteNotice(String noticeNo) throws Exception;
	public int updateNotice(NoticeDTO nDTO) throws Exception;
}
