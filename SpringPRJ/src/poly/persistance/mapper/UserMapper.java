package poly.persistance.mapper;

import config.Mapper;
import poly.dto.UserDTO;

@Mapper("UserMapper")
public interface UserMapper {
	public int insertUser(UserDTO uDTO) throws Exception;

	public int getUserIdCheck(String id);
	
	public UserDTO getUserLogin(UserDTO uDTO) throws Exception;
	
	public int updateUserRegNo(UserDTO uDTO2) throws Exception;
	
	public UserDTO findAccountId(UserDTO uDTO) throws Exception;
}