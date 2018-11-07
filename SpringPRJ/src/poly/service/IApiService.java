package poly.service;

import java.util.List;

import poly.dto.ApiDTO;

public interface IApiService {
	public int insertApi(ApiDTO aDTO) throws Exception;
	public int insertApi2(ApiDTO aDTO) throws Exception;
	
	public List<ApiDTO> getHospList() throws Exception;
}
