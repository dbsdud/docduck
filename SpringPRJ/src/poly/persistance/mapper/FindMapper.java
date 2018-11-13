package poly.persistance.mapper;

import java.util.List;

import config.Mapper;
import poly.dto.ApiDTO;
import poly.dto.DongDTO;
import poly.dto.GugunDTO;

@Mapper("FindMapper")
public interface FindMapper {
	public List<GugunDTO> getGugunList(String sido) throws Exception;
	public List<DongDTO> getDongList(String gugun) throws Exception;
	public List<ApiDTO> getHospSearch(ApiDTO aDTO) throws Exception;
	public ApiDTO getFindHospitalDetail_1(ApiDTO aDTO) throws Exception;
	public ApiDTO getFindHospitalDetail_2(ApiDTO aDTO) throws Exception;
}
