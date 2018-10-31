package poly.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.NoticeDTO;
import poly.persistance.mapper.NoticeMapper;
import poly.service.INoticeService;

@Service("NoticeService")
public class NoticeService implements INoticeService{
	
	@Resource(name="NoticeMapper")
	private NoticeMapper noticeMapper;
	
	@Override
	public List<NoticeDTO> getNoticeList() throws Exception{
		return noticeMapper.getNoticeList();
	}

	@Override
	public int insertNotice(NoticeDTO nDTO) throws Exception {
		return noticeMapper.insertNotice(nDTO);
	}

	@Override
	public NoticeDTO getNoticeDetail(NoticeDTO nDTO) throws Exception {
		return noticeMapper.getNoticeDetail(nDTO);
	}

	@Override
	public int updateNoticeCount(String noticeNo) throws Exception {
		return noticeMapper.updateNoticeCount(noticeNo);
	}

}
