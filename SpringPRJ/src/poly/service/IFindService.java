package poly.service;

import java.util.List;

import poly.dto.DongDTO;
import poly.dto.GugunDTO;

public interface IFindService {
	public List<GugunDTO> getGugunList(String sido) throws Exception;
	public List<DongDTO> getDongList(String gugun) throws Exception;
}
