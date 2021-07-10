package com.dao;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.entity.FruitsShop;

@Controller
@RequestMapping("/")
public class FruitsDTOimpl {
	@Autowired
	SessionFactory sessionfactory;
	
	
	public SessionFactory getSessionfactory() {
		return sessionfactory;
	}


	public void setSessionfactory(SessionFactory sessionfactory) {
		this.sessionfactory = sessionfactory;
	}
	
	@Transactional
	@RequestMapping(value = "fruits", method = RequestMethod.GET)
	public void addVege(FruitsShop fruit) {
		FruitsShop fruitshop1 = new FruitsShop();
		fruitshop1.setFid("f1");
		fruitshop1.setFname("Mango");
		fruitshop1.setFprice(20);
		fruitshop1.setFimg("https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.HFjE6ZkJlx-7LM8EnnPsWQHaGI%26pid%3DApi&f=1");
		
		FruitsShop fruitshop2 = new FruitsShop();
		fruitshop2.setFid("f2");
		fruitshop2.setFname("PineApple");
		fruitshop2.setFprice(30);
		fruitshop2.setFimg("https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.D17lh6DXQA3oxi9ZvZrKXQHaLK%26pid%3DApi&f=1");
		
		FruitsShop fruitshop3 = new FruitsShop();
		fruitshop3.setFid("f3");
		fruitshop3.setFname("Banana");
		fruitshop3.setFprice(15);
		fruitshop3.setFimg("https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fwww.allwhitebackground.com%2Fimages%2F2%2F2309.jpg&f=1&nofb=1");
		
		FruitsShop fruitshop4 = new FruitsShop();
		fruitshop4.setFid("v4");
		fruitshop4.setFname("Grapes");
		fruitshop4.setFprice(25);
		fruitshop4.setFimg("https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.GkE0k-PHoZuC07DS4TlQpQHaGy%26pid%3DApi&f=1");
		Session session1 = sessionfactory.getCurrentSession();
		session1.persist(fruitshop1);
		session1.persist(fruitshop2);
		session1.persist(fruitshop3);
		session1.persist(fruitshop4);
	}
}
