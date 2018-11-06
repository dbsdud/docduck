package poly.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.ApiDTO;
import poly.persistance.mapper.ApiMapper;
import poly.service.IApiService;

@Service("ApiService")
public class ApiService implements IApiService {
	@Resource(name="ApiMapper")
	private ApiMapper apiMapper;
	
	@Override
	public int insertApi(ApiDTO aDTO) throws Exception {
		return apiMapper.insertApi(aDTO);
	}

	@Override
	public int insertApi2(ApiDTO aDTO) throws Exception {
		return apiMapper.insertApi2(aDTO);
	}
	
}
