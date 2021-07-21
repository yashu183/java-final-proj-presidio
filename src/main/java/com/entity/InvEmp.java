package com.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "invemp")
public class InvEmp {
    @Column(name = "uid")
    private int uid;
    @Id
    @Column(name = "invid")
    private int invid;
    @Column(name = "date")
    private Date date;
    @Column(name = "shipadd")
    private String shipadd;
    @Column(name = "billadd")
    private String billadd;
    @Column(name = "ttl")
    private int ttl;
    public int getUid() {
        return uid;
    }
    public void setUid(int uid) {
        this.uid = uid;
    }
    public int getInvid() {
        return invid;
    }
    public void setInvid(int invid) {
        this.invid = invid;
    }
    public Date getDate() {
        return date;
    }
    public void setDate(Date date) {
        this.date = date;
    }
    public String getShipadd() {
        return shipadd;
    }
    public void setShipadd(String shipadd) {
        this.shipadd = shipadd;
    }
    public String getBilladd() {
        return billadd;
    }
    public void setBilladd(String billadd) {
        this.billadd = billadd;
    }
    public int getTtl() {
        return ttl;
    }
    public void setTtl(int ttl) {
        this.ttl = ttl;
    }

}
