package poly.service;

import java.util.List;

import poly.dto.ApiDTO;
import poly.dto.ReviewDTO;
import poly.dto.UserDTO;

public interface IReviewService {
	/*public ApiDTO getReviewDetail(ApiDTO aDTO) throws Exception;*/
	public List<ReviewDTO> getReviewList() throws Exception;
	public List<ReviewDTO> getReviewListHosp(ReviewDTO rDTO) throws Exception;
	public int insertReview(ReviewDTO rDTO) throws Exception;
	public ReviewDTO getReviewDetail(ReviewDTO rDTO) throws Exception;
}
