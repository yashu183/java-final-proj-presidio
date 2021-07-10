package com.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "fruits")
public class FruitsShop {
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int SNo;
	@Id
	@Column(name = "fid", length = 4)
	private String fid;
	private String fname;
	private String fimg;
	private int fprice;
	private String fdes;
	public String getFdes() {
		return fdes;
	}
	public void setFdes(String fdes) {
		this.fdes = fdes;
	}
	public int getSNo() {
		return SNo;
	}
	public void setSNo(int sNo) {
		SNo = sNo;
	}
	public String getFid() {
		return fid;
	}
	public void setFid(String fid) {
		this.fid = fid;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getFimg() {
		return fimg;
	}
	public void setFimg(String fimg) {
		this.fimg = fimg;
	}
	public int getFprice() {
		return fprice;
	}
	public void setFprice(int fprice) {
		this.fprice = fprice;
	}
	
}
