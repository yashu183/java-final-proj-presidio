package com.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Electronics")
public class ElectronicsShop {
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int SNo;
	@Id
	@Column(name = "eid", length = 4)
	private String eid;
	private String ename;
	@Column(length = 10)
	private String eimg;
	private int eprice;
	private String edes;
	public String getEdes() {
		return edes;
	}
	public void setEdes(String edes) {
		this.edes = edes;
	}
	public int getSNo() {
		return SNo;
	}
	public void setSNo(int sNo) {
		SNo = sNo;
	}
	public String getEid() {
		return eid;
	}
	public void setEid(String eid) {
		this.eid = eid;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getEimg() {
		return eimg;
	}
	public void setEimg(String eimg) {
		this.eimg = eimg;
	}
	public int getEprice() {
		return eprice;
	}
	public void setEprice(int eprice) {
		this.eprice = eprice;
	}
	
}
