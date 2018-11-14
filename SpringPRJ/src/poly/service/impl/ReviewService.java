package poly.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.ApiDTO;
import poly.dto.ReviewDTO;
import poly.dto.UserDTO;
import poly.persistance.mapper.ReviewMapper;
import poly.service.IReviewService;

@Service("ReviewService")
public class ReviewService implements IReviewService{
	@Resource(name="ReviewMapper")
	private ReviewMapper reviewMapper;

	@Override
	public List<ReviewDTO> getReviewList() throws Exception {
		return reviewMapper.getReviewList();
	}

	@Override
	public List<ReviewDTO> getReviewListHosp(ReviewDTO rDTO) throws Exception {
		return reviewMapper.getReviewListHosp(rDTO);
	}

	/*@Override
	public ApiDTO getReviewDetail(ApiDTO aDTO) throws Exception {
		return reviewMapper.getReviewDetail(aDTO);
	}*/

}
