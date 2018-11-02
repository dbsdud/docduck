package poly.persistance.mapper;

import java.util.List;

import config.Mapper;
import poly.dto.UserDTO;

@Mapper("UserMapper")
public interface UserMapper {
	public int insertUser(UserDTO uDTO) throws Exception;

	public int getUserIdCheck(String id);
	
	public UserDTO getUserLogin(UserDTO uDTO) throws Exception;
	
	public int updateUserRegNo(UserDTO uDTO2) throws Exception;
	
	public List<UserDTO> findAccountId(UserDTO uDTO) throws Exception;
	
	public List<UserDTO> findAccountPw(UserDTO uDTO) throws Exception;
	
	public List<UserDTO> getUserList() throws Exception;

	public UserDTO getAdminUserDetail(UserDTO uDTO) throws Exception;
	
	public int userKick(String userNo) throws Exception;
}