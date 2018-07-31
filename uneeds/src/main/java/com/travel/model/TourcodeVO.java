package com.travel.model;

public class TourcodeVO {
	
	String addr1;		//<addr1>서울특별시 강남구 테헤란로</addr1>
	String addr2;		//<addr2>(역삼동)</addr2>
	int areacode;		//<areacode>1</areacode>
	String cat1;			//<cat1>A02</cat1>
	String cat2;			//<cat2>A0203</cat2>
	String cat3;			//<cat3>A02030600</cat3>
	int contentid;		//<contentid>264570</contentid>
	int contenttypeid;	//<contenttypeid>12</contenttypeid>
	double mapx;		//<mapx>127.0276129349</mapx>
	double mapy;		//<mapy>37.4978992118</mapy>
	int readcount;		//<readcount>30895</readcount>
	String title;			//<title>강남</title>
	
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public int getAreacode() {
		return areacode;
	}
	public void setAreacode(int areacode) {
		this.areacode = areacode;
	}
	public String getCat1() {
		return cat1;
	}
	public void setCat1(String cat1) {
		this.cat1 = cat1;
	}
	public String getCat2() {
		return cat2;
	}
	public void setCat2(String cat2) {
		this.cat2 = cat2;
	}
	public String getCat3() {
		return cat3;
	}
	public void setCat3(String cat3) {
		this.cat3 = cat3;
	}
	public int getContentid() {
		return contentid;
	}
	public void setContentid(int contentid) {
		this.contentid = contentid;
	}
	public int getContenttypeid() {
		return contenttypeid;
	}
	public void setContenttypeid(int contenttypeid) {
		this.contenttypeid = contenttypeid;
	}
	public double getMapx() {
		return mapx;
	}
	public void setMapx(double mapx) {
		this.mapx = mapx;
	}
	public double getMapy() {
		return mapy;
	}
	public void setMapy(double mapy) {
		this.mapy = mapy;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	@Override
	public String toString() {
		return "TourcodeVO [addr1=" + addr1 + ", addr2=" + addr2 + ", areacode=" + areacode + ", cat1=" + cat1
				+ ", cat2=" + cat2 + ", cat3=" + cat3 + ", contentid=" + contentid + ", contenttypeid=" + contenttypeid
				+ ", mapx=" + mapx + ", mapy=" + mapy + ", readcount=" + readcount + ", title=" + title + "]";
	}

}
