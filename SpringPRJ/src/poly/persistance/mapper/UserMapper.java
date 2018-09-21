package poly.persistance.mapper;

import config.Mapper;
import poly.dto.UserDTO;

@Mapper("UserMapper")
public interface UserMapper {
	public int insertUser(UserDTO uDTO) throws Exception;

	public int getUserIdCheck(String id);
}