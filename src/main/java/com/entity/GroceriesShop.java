package com.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "groceries")
public class GroceriesShop {
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int SNo;
	@Id
	@Column(name = "gid", length = 4)
	private String gid;
	private String gname;
	private String gimg;
	private int gprice;
	private String gdes;
	public String getGdes() {
		return gdes;
	}
	public void setGdes(String gdes) {
		this.gdes = gdes;
	}
	public int getSNo() {
		return SNo;
	}
	public void setSNo(int sNo) {
		SNo = sNo;
	}
	public String getGid() {
		return gid;
	}
	public void setGid(String gid) {
		this.gid = gid;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	public String getGimg() {
		return gimg;
	}
	public void setGimg(String gimg) {
		this.gimg = gimg;
	}
	public int getGprice() {
		return gprice;
	}
	public void setGprice(int gprice) {
		this.gprice = gprice;
	}
	
}
