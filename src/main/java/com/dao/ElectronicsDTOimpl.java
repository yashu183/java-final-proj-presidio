package com.dao;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.entity.ElectronicsShop;
import com.entity.FruitsShop;
import com.entity.HouseHoldUtensils;

@Controller
@RequestMapping("/")
public class ElectronicsDTOimpl {
	@Autowired
	SessionFactory sessionfactory;
	
	
	public SessionFactory getSessionfactory() {
		return sessionfactory;
	}


	public void setSessionfactory(SessionFactory sessionfactory) {
		this.sessionfactory = sessionfactory;
	}
	
	@Transactional
	@RequestMapping(value = "electronics", method = RequestMethod.GET)
	public void addVege(FruitsShop fruit) {
		ElectronicsShop es1 = new ElectronicsShop();
		es1.setEid("e1");
		es1.setEname("Electric Iron Box");
		es1.setEprice(800);
		es1.setEimg("https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.WT3QS3lwE0JjxI9cnaOANAHaGE%26pid%3DApi&f=1");
		
		ElectronicsShop es2 = new ElectronicsShop();
		es2.setEid("e2");
		es2.setEname("MObile Phone");
		es2.setEprice(16000);
		es2.setEimg("https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.tQ4HpYybd01zByCLM0HxTwHaHa%26pid%3DApi&f=1");
		
		ElectronicsShop es3 = new ElectronicsShop();
		es3.setEid("e3");
		es3.setEname("Torch");
		es3.setEprice(300);
		es3.setEimg("https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.yTI9_1DKdscUEN0f0U11zQHaE7%26pid%3DApi&f=1");
		
		ElectronicsShop es4 = new ElectronicsShop();
		es4.setEid("e4");
		es4.setEname("Electric Cooker");
		es4.setEprice(3000);
		es4.setEimg("https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.6oMGnED4a_Xrm0khI7JzHgHaHa%26pid%3DApi&f=1");
		Session session4 = sessionfactory.getCurrentSession();
		session4.persist(es1);
		session4.persist(es2);
		session4.persist(es3);
		session4.persist(es4);
	}
}
