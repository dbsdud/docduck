package poly.service;

import poly.dto.UserDTO;

public interface IUserService {
	// 회원가입
	public int insertUser(UserDTO uDTO) throws Exception;
	// 회원가입 중복체크
	public int getUserIdCheck(String id) throws Exception;
}
