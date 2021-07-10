package com.controller;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.entity.FruitsShop;
import com.entity.vegetablesShop;

@Controller
@RequestMapping("/")
public class FruitsShopController {
	@Autowired
	SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Transactional
	@RequestMapping(value = "loadfruits", method = RequestMethod.GET)
	public ModelAndView returnVege(ModelAndView mandv, Model model){
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from FruitsShop",FruitsShop.class);
		List<FruitsShop> fruitslist = query.list();
		System.out.println(fruitslist);
		mandv.setViewName("fruitShop");
		mandv.addObject("fruitlis", fruitslist);
		return mandv;
	}
}
