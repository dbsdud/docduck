package poly.persistance.mapper;

import java.util.List;

import config.Mapper;
import poly.dto.ApiDTO;

@Mapper("ApiMapper")
public interface ApiMapper {
	public int insertApi(ApiDTO aDTO) throws Exception;
	public int insertApi2(ApiDTO aDTO) throws Exception;
	public List<ApiDTO> getHospList() throws Exception;
	public int insertSido(ApiDTO aDTO) throws Exception;
	public int insertGugun(ApiDTO aDTO) throws Exception;
	public int insertDong(ApiDTO aDTO) throws Exception;
}
