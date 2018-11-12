package poly.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.ApiDTO;
import poly.persistance.mapper.ReviewMapper;
import poly.service.IReviewService;

@Service("ReviewService")
public class ReviewService implements IReviewService{
	@Resource(name="ReviewMapper")
	private ReviewMapper reviewMapper;
	
	/*@Override
	public ApiDTO getReviewDetail(ApiDTO aDTO) throws Exception {
		return reviewMapper.getReviewDetail(aDTO);
	}*/

}
