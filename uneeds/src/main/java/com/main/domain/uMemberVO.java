package com.main.domain;

import java.util.Date;;

public class uMemberVO {
	
	private int mcode;
	private int lcode;
	private String mid;
	private String pw;
	private String mnick;
	private Date udate;

	// 생성자
	public uMemberVO() {
	}

	public uMemberVO(int mcode, int lcode, String mid, String pw, String mnick, Date udate) {
		super();
		this.mcode = mcode;
		this.lcode = lcode;
		this.mid = mid;
		this.pw = pw;
		this.mnick = mnick;
		this.udate = udate;
	}

	// getter,setter
	public int getMcode() {
		return mcode;
	}

	public void setMcode(int mcode) {
		this.mcode = mcode;
	}

	public int getLcode() {
		return lcode;
	}

	public void setLcode(int lcode) {
		this.lcode = lcode;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getMnick() {
		return mnick;
	}

	public void setMnick(String mnick) {
		this.mnick = mnick;
	}

	public Date getUdate() {
		return udate;
	}

	public void setUdate(Date udate) {
		this.udate = udate;
	}

}