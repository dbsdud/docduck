package poly.persistance.mapper;

import java.util.List;

import config.Mapper;
import poly.dto.DongDTO;
import poly.dto.GugunDTO;

@Mapper("FindMapper")
public interface FindMapper {
	public List<GugunDTO> getGugunList(String sido) throws Exception;
	public List<DongDTO> getDongList(String gugun) throws Exception;
}
