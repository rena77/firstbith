package com.travel.persistence;

import java.util.List;

import com.travel.model.MemberVO;

public interface MemberDAO {

	public void insertMembers(MemberVO vo);
	public List<MemberVO> selectMembers();
}
