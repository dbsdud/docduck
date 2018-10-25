package poly.service;

import poly.dto.UserDTO;

public interface IUserService {
	// 회원가입
	public int insertUser(UserDTO uDTO) throws Exception;
	// REGNO 일치 시키기
	public int updateUserRegNo(UserDTO uDTO2) throws Exception;
	// 회원가입 중복체크
	public int getUserIdCheck(String id) throws Exception;
	// 로그인
	public UserDTO getUserLogin(UserDTO uDTO) throws Exception;
	// 아이디 찾기
	public UserDTO findAccountId(UserDTO uDTO) throws Exception;
}
