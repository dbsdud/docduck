package poly.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.ApiDTO;
import poly.dto.DongDTO;
import poly.dto.GugunDTO;
import poly.persistance.mapper.FindMapper;
import poly.service.IFindService;

@Service("FindService")
public class FindService implements IFindService {
	@Resource(name="FindMapper")
	private FindMapper findMapper;
	@Override
	public List<GugunDTO> getGugunList(String sido) throws Exception {
		return findMapper.getGugunList(sido);
	}
	@Override
	public List<DongDTO> getDongList(String gugun) throws Exception {
		return findMapper.getDongList(gugun);
	}
	@Override
	public List<ApiDTO> getHospSearch(ApiDTO aDTO) throws Exception {
		return findMapper.getHospSearch(aDTO);
	}

}
