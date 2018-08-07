package com.main.persistence;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import com.main.domain.uMemberVO;

public interface LoginDAO {
	
	public String selectTime();
	
	// 회원 로그인 체크
	public boolean loginCheck(uMemberVO vo);
	// 회원 로그인 정보
	public uMemberVO viewuMembers(uMemberVO vo);
	// 회원 로그아웃
	public void logout(HttpSession session);
	
	public HashMap<String, Object> selectOne(String usr);
}
