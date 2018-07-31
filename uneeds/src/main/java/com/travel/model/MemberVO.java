package com.travel.model;

import java.util.Date;

public class MemberVO {
	
	int mcode;
	int lcode;
	String mid;
	String pw;
	String mnink;
	Date udate;
	
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
	public String getMnink() {
		return mnink;
	}
	public void setMnink(String mnink) {
		this.mnink = mnink;
	}
	public Date getUdate() {
		return udate;
	}
	public void setUdate(Date udate) {
		this.udate = udate;
	}
	
	@Override
	public String toString() {
		return "LoginVO [mcode=" + mcode + ", lcode=" + lcode + ", mid=" + mid + ", pw=" + pw + ", mnink=" + mnink
				+ ", udate=" + udate + "]";
	}
	
}
