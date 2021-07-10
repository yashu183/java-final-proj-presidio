package com.controller;

import com.action.AddItemForm;
import com.entity.ElectronicsShop;
import com.entity.FruitsShop;
import com.entity.GroceriesShop;
import com.entity.HouseHoldUtensils;
import com.entity.Items;
import com.entity.vegetablesShop;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/")
public class AddItemController {
    @Autowired
    SessionFactory sessionfactory;

    public SessionFactory getSessionfactory() {
        return sessionfactory;
    }

    public void setSessionfactory(SessionFactory sessionfactory) {
        this.sessionfactory = sessionfactory;
    }
    
    @Transactional
    @RequestMapping(value = "/additems", method = RequestMethod.POST)
    public ModelAndView addItem(ModelAndView mandv, AddItemForm additem){
    	System.out.println("inside addItem method...");
    	mandv.addObject("addItemBean", additem);
        String name = additem.getName();
        String id = additem.getId();
        String des = additem.getDes();
        int price = additem.getPrice();
        String img = additem.getImg();
        String cat = additem.getCategory();
        Items item = new Items();
        item.setDes(des);
        item.setId(id);
        item.setImg(img);
        item.setName(name);
        item.setPrice(price);
        item.setCategory(cat);
        Session session = sessionfactory.getCurrentSession();
        session.persist(item);
        if(cat.equals("elec")) {
        	System.out.println("inisde elec.....");
        	ElectronicsShop electronicshop = new ElectronicsShop();
        	electronicshop.setEid(id);
        	electronicshop.setEimg(img);
        	electronicshop.setEname(name);
        	electronicshop.setEprice(price);
        	electronicshop.setEdes(des);
        	electronicshop.setSNo(0);
        	session.persist(electronicshop);
        }
        if(cat.equals("vege")) {
        	vegetablesShop vegeshop = new vegetablesShop();
        	vegeshop.setVdes(des);
        	vegeshop.setVid(id);
        	vegeshop.setVimg(img);
        	vegeshop.setVname(name);
        	vegeshop.setVprice(price);    
        	session.persist(vegeshop);
        }
        if(cat.equals("fruit")) {
        	FruitsShop fruitshop = new FruitsShop();
        	fruitshop.setFdes(des);
        	fruitshop.setFid(id);
        	fruitshop.setFimg(img);
        	fruitshop.setFname(name);
        	fruitshop.setFprice(price);
        	session.persist(fruitshop);
        }
        if(cat.equals("household")) {
        	HouseHoldUtensils households = new HouseHoldUtensils();
        	households.setHdes(des);
        	households.setHid(id);
        	households.setHimg(img);
        	households.setHname(name);
        	households.setHprice(price);
        	session.persist(households);
        }
        if(cat.equals("groceries")) {
        	GroceriesShop grocerieshop = new GroceriesShop();
        	grocerieshop.setGdes(des);
        	grocerieshop.setGid(id);
        	grocerieshop.setGimg(img);
        	grocerieshop.setGname(name);
        	grocerieshop.setGprice(price);
        	session.persist(grocerieshop);
        }
        System.out.println(name + id + des + img + cat + price);
        mandv.setViewName("addItem");
        return mandv;
    }
    
}
