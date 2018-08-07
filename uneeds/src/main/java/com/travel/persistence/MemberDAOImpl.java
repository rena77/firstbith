package com.travel.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.travel.model.MemberVO;
import com.travel.model.TourcodeVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	private SqlSession mysqlSession;

	private static final String namespace = "com.travel.MemberMapper";

	@Override
	public void insertMembers(MemberVO vo) {
		mysqlSession.insert(namespace + ".isnertMember", vo);
	}

	@Override
	public List<MemberVO> selectMembers() {
		List<MemberVO> list = mysqlSession.selectList(namespace + ".listMember");
		return list;
	}

}
