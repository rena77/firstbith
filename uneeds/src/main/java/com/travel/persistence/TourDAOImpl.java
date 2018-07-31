package com.travel.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.travel.model.TourcodeVO;

@Repository
public class TourDAOImpl implements TourDAO {

	@Inject
	private SqlSession sqlSessionMySql;

	private static final String namespace = "com.travel.MemberMapper";

	
	@Override
	public void insertMember(TourcodeVO vo) {
		sqlSessionMySql.insert(namespace + ".insertMapinfo", vo);
	}



}
