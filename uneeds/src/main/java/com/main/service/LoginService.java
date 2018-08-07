package com.main.service;

import javax.servlet.http.HttpSession;

import com.main.domain.uMemberVO;

public interface LoginService {
	public String getTime();

	
	// 회원 로그인 체크
	public boolean loginCheck(HttpSession session, String usr, String pwd);
	// 회원 로그인 정보
	public uMemberVO viewuMembers(uMemberVO vo);
	// 회원 로그아웃
	public void logout(HttpSession session);
}
