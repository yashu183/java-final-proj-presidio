package com.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "invoice")
public class Invoice {
    @Column(name = "invid")
    private int invId;
    @Column(name = "itemid")
    private String itemId;
    @Column(name = "qty")
    private int qty;
    @Id
    @Column(name = "id")
    private int id;
    public int getInvId() {
        return invId;
    }
    public void setInvId(int invId) {
        this.invId = invId;
    }
    public String getItemId() {
        return itemId;
    }
    public void setItemId(String itemId) {
        this.itemId = itemId;
    }
    public int getQty() {
        return qty;
    }
    public void setQty(int qty) {
        this.qty = qty;
    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    
}
