package com.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "vegetables")
public class vegetablesShop {
	@Id
	@Column(name = "vid", length = 4)
	private String vid;
	private String vname;
	private String vimg;
	private int vprice;
	private String vdes;

	public String getVdes() {
		return vdes;
	}
	public void setVdes(String vdes) {
		this.vdes = vdes;
	}
	public String getVid() {
		return vid;
	}
	public void setVid(String vid) {
		this.vid = vid;
	}
	public String getVname() {
		return vname;
	}
	public void setVname(String vname) {
		this.vname = vname;
	}
	public String getVimg() {
		return vimg;
	}
	public void setVimg(String vimg) {
		this.vimg = vimg;
	}
	public int getVprice() {
		return vprice;
	}
	public void setVprice(int vprice) {
		this.vprice = vprice;
	}
	
}
