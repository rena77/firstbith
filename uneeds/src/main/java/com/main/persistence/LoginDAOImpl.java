package com.main.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.main.domain.uMemberVO;

@Repository
public class LoginDAOImpl implements LoginDAO{

	@Inject SqlSession mysqlSession;
	
	private static final String namespace="com.main.mappers.MainMapper";
	
	
	//현재 시간
	@Override
	public String selectTime() {
		return mysqlSession.selectOne(namespace+".getTime");
	}


	@Override
	public boolean loginCheck(uMemberVO vo) {
		String name = mysqlSession.selectOne(namespace+".logincheck");
		return (name == null) ? false : true;
	}


	@Override
	public uMemberVO viewuMembers(uMemberVO vo) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public void logout(HttpSession session) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public HashMap<String, Object> selectOne(String usr) {
		HashMap<String, Object> list = mysqlSession.selectOne(namespace+".selectOne", usr);
		return list;
	}

	
}
