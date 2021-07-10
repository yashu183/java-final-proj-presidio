package com.dao;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.entity.vegetablesShop;

@Controller
@RequestMapping("/")
public class VegeDTOimpl {
	@Autowired
	SessionFactory sessionfactory;
	
	
	public SessionFactory getSessionfactory() {
		return sessionfactory;
	}


	public void setSessionfactory(SessionFactory sessionfactory) {
		this.sessionfactory = sessionfactory;
	}
	
	@Transactional
	@RequestMapping(value = "vegetable", method = RequestMethod.GET)
	public void addVege(vegetablesShop vege) {
		vegetablesShop vegeshop1 = new vegetablesShop();
		vegeshop1.setVid("v1");
		vegeshop1.setVname("Potato");
		vegeshop1.setVprice(15);
		vegeshop1.setVimg("https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fimage.freepik.com%2Ffree-photo%2Fdelicious-potatoes-white-background_1203-1899.jpg&f=1&nofb=1");
		
		vegetablesShop vegeshop2 = new vegetablesShop();
		vegeshop2.setVid("v2");
		vegeshop2.setVname("Cauliflower");
		vegeshop2.setVprice(25);
		vegeshop2.setVimg("https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fimage.freepik.com%2Ffree-photo%2Ffresh-cauliflower-isolated-white-background_33736-2684.jpg&f=1&nofb=1");
		
		vegetablesShop vegeshop3 = new vegetablesShop();
		vegeshop3.setVid("v3");
		vegeshop3.setVname("Tomato");
		vegeshop3.setVprice(10);
		vegeshop3.setVimg("https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.efZjcgYd7o0sc7fXXEvKhQHaG8%26pid%3DApi&f=1");
		
		vegetablesShop vegeshop4 = new vegetablesShop();
		vegeshop4.setVid("v4");
		vegeshop4.setVname("Brinjal");
		vegeshop4.setVprice(20);
		vegeshop4.setVimg("https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.xXSKomt-2A_MTMx1MBGpnwHaHa%26pid%3DApi&f=1");
		Session session = sessionfactory.getCurrentSession();
		session.persist(vegeshop1);
		session.persist(vegeshop2);
		session.persist(vegeshop3);
		session.persist(vegeshop4);
	}
	
}
