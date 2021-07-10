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
import com.entity.HouseHoldUtensils;

@Controller
@RequestMapping("/")
public class HouseHoldUtensilsDTOimpl {
	@Autowired
	SessionFactory sessionfactory;
	
	
	public SessionFactory getSessionfactory() {
		return sessionfactory;
	}


	public void setSessionfactory(SessionFactory sessionfactory) {
		this.sessionfactory = sessionfactory;
	}
	
	@Transactional
	@RequestMapping(value = "household", method = RequestMethod.GET)
	public void addVege(FruitsShop fruit) {
		HouseHoldUtensils hhu1 = new HouseHoldUtensils();
		hhu1.setHid("h1");
		hhu1.setHname("Sppons & Froks");
		hhu1.setHprice(70);
		hhu1.setHimg("https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.wOO24khhSV8wwPRCFMlDbgHaE7%26pid%3DApi&f=1");
		
		HouseHoldUtensils hhu2 = new HouseHoldUtensils();
		hhu2.setHid("h2");
		hhu2.setHname("Scissors");
		hhu2.setHprice(80);
		hhu2.setHimg("https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.maEDC_HSRC7t30XsnrC7JgHaHF%26pid%3DApi&f=1");
		
		HouseHoldUtensils hhu3 = new HouseHoldUtensils();
		hhu3.setHid("h3");
		hhu3.setHname("Knives");
		hhu3.setHprice(40);
		hhu3.setHimg("https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.B9dOwKqudA3A6NsJ-Dq4BQHaE9%26pid%3DApi&f=1");
		
		HouseHoldUtensils hhu4 = new HouseHoldUtensils();
		hhu4.setHid("h4");
		hhu4.setHname("Scrubber");
		hhu4.setHprice(30);
		hhu4.setHimg("https://images.unsplash.com/photo-1591037656206-3eb291cfae05?ixid=MnwxMjA3fDB8MHxzZWFyY2h8ODN8fGtpdGNoZW4lMjB1dGVuc2lsfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60");
		Session session3 = sessionfactory.getCurrentSession();
		session3.persist(hhu1);
		session3.persist(hhu2);
		session3.persist(hhu3);
		session3.persist(hhu4);
	}
}
