package poly.persistance.mapper;

import java.util.List;

import config.Mapper;
import poly.dto.ApiDTO;
import poly.dto.ReviewDTO;
import poly.dto.UserDTO;

@Mapper("ReviewMapper")
public interface ReviewMapper {
	/*public ApiDTO getReviewDetail(ApiDTO aDTO) throws Exception;*/
	public List<ReviewDTO> getReviewList() throws Exception;
	public List<ReviewDTO> getReviewListHosp(ReviewDTO rDTO) throws Exception;
	public int insertReview(ReviewDTO rDTO) throws Exception;
	public ReviewDTO getReviewDetail(ReviewDTO rDTO) throws Exception;
}
