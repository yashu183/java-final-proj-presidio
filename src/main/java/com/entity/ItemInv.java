package com.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "iteminv")
public  class ItemInv {
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Id
    @Column(name = "id", length = 4)
    private int id;
    @Column(name = "itemid")
    private String itemId;
    @Column(name = "invid")
    private int invId;
    @Column(name = "qty")
    private int qty;
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getItemId() {
        return itemId;
    }
    public void setItemId(String itemId) {
        this.itemId = itemId;
    }
    public int getInvId() {
        return invId;
    }
    public void setInvId(int invId) {
        this.invId = invId;
    }
    public int getQty() {
        return qty;
    }
    public void setQty(int qty) {
        this.qty = qty;
    }
    
}
