package com.dao;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.entity.FruitsShop;
import com.entity.GroceriesShop;

@Controller
@RequestMapping("/")
public class GroceriesDTOimpl {
	@Autowired
	SessionFactory sessionfactory;
	
	
	public SessionFactory getSessionfactory() {
		return sessionfactory;
	}


	public void setSessionfactory(SessionFactory sessionfactory) {
		this.sessionfactory = sessionfactory;
	}
	
	@Transactional
	@RequestMapping(value = "groceries", method = RequestMethod.GET)
	public void addVege(FruitsShop fruit) {
		GroceriesShop groceshop1 = new GroceriesShop();
		groceshop1.setGid("g1");
		groceshop1.setGname("Oil");
		groceshop1.setGprice(120);
		groceshop1.setGimg("https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.HFjE6ZkJlx-7LM8EnnPsWQHaGI%26pid%3DApi&f=1");
		
		GroceriesShop groceshop2 = new GroceriesShop();
		groceshop2.setGid("g2");
		groceshop2.setGname("Rice");
		groceshop2.setGprice(150);
		groceshop2.setGimg("https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.D17lh6DXQA3oxi9ZvZrKXQHaLK%26pid%3DApi&f=1");
		
		GroceriesShop groceshop3 = new GroceriesShop();
		groceshop3.setGid("g3");
		groceshop3.setGname("Milk");
		groceshop3.setGprice(50);
		groceshop3.setGimg("https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fwww.allwhitebackground.com%2Fimages%2F2%2F2309.jpg&f=1&nofb=1");
		
		GroceriesShop groceshop4 = new GroceriesShop();
		groceshop4.setGid("g4");
		groceshop4.setGname("Aata");
		groceshop4.setGprice(100);
		groceshop4.setGimg("https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.xZvXyXIq3iAt3PFmX7zQUgAAAA%26pid%3DApi&f=1");
		Session session2 = sessionfactory.getCurrentSession();
		session2.persist(groceshop1);
		session2.persist(groceshop2);
		session2.persist(groceshop3);
		session2.persist(groceshop4);
	}
}
