package poly.service;

import java.util.HashMap;
import java.util.List;

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
	public List<UserDTO> findAccountId(UserDTO uDTO) throws Exception;
	// 비밀번호 찾기
	public List<UserDTO> findAccountPw(UserDTO uDTO) throws Exception;
	/*public UserDTO findAccountPw(UserDTO uDTO) throws Exception;*/
	// 회원 목록
	public List<UserDTO> getUserList() throws Exception;
	// 상세회원정보(관리자)
	public UserDTO getAdminUserDetail(UserDTO uDTO) throws Exception;
	// 회원탈퇴(관리자)
	public int userKick(String userNo) throws Exception;
	// 상세회원정보
	public UserDTO getUserDetail(UserDTO uDTO) throws Exception;
	// 회원정보수정(회원)
	public int updInfo(UserDTO uDTO) throws Exception;
}
