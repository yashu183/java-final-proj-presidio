package com.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "households")
public class HouseHoldUtensils {
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int SNo;
	@Id
	@Column(name = "hid", length = 4)
	private String hid;
	private String hname;
	private String himg;
	private int hprice;
	private String hdes;
	public String getHdes() {
		return hdes;
	}
	public void setHdes(String hdes) {
		this.hdes = hdes;
	}
	public int getSNo() {
		return SNo;
	}
	public void setSNo(int sNo) {
		SNo = sNo;
	}
	public String getHid() {
		return hid;
	}
	public void setHid(String hid) {
		this.hid = hid;
	}
	public String getHname() {
		return hname;
	}
	public void setHname(String hname) {
		this.hname = hname;
	}
	public String getHimg() {
		return himg;
	}
	public void setHimg(String himg) {
		this.himg = himg;
	}
	public int getHprice() {
		return hprice;
	}
	public void setHprice(int hprice) {
		this.hprice = hprice;
	}
	
}
