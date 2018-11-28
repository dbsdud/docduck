package poly.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.UserDTO;
import poly.persistance.mapper.UserMapper;
import poly.service.IUserService;

@Service("UserService")
public class UserService implements IUserService {
	@Resource(name="UserMapper")
	private UserMapper userMapper;
	
	@Override
	public int insertUser(UserDTO uDTO) throws Exception {
		return userMapper.insertUser(uDTO);
	}

	@Override
	public int getUserIdCheck(String id) throws Exception {
		return userMapper.getUserIdCheck(id);
	}

	@Override
	public UserDTO getUserLogin(UserDTO uDTO) throws Exception {
		return userMapper.getUserLogin(uDTO);
	}

	@Override
	public int updateUserRegNo(UserDTO uDTO2) throws Exception {
		return userMapper.updateUserRegNo(uDTO2);
	}

	@Override
	public List<UserDTO> findAccountId(UserDTO uDTO) throws Exception{
		return userMapper.findAccountId(uDTO);
	}

	@Override
	public List<UserDTO> findAccountPw(UserDTO uDTO) throws Exception {
		return userMapper.findAccountPw(uDTO);
	}
	

	@Override
	public List<UserDTO> getUserList() throws Exception {
		return userMapper.getUserList();
	}

	@Override
	public UserDTO getAdminUserDetail(UserDTO uDTO) throws Exception {
		return userMapper.getAdminUserDetail(uDTO);
	}

	@Override
	public int userKick(String userNo) throws Exception {
		return userMapper.userKick(userNo);
	}

	@Override
	public UserDTO getUserDetail(UserDTO uDTO) throws Exception {
		return userMapper.getUserDetail(uDTO);
	}

	@Override
	public int updInfo(UserDTO uDTO) throws Exception {
		return userMapper.updInfo(uDTO);
	}

	/*@Override
	public UserDTO findAccountPw(UserDTO uDTO) throws Exception {
		return userMapper.findAccountPw(uDTO);
	}*/

}
