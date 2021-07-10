package com.controller;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.entity.FruitsShop;
import com.entity.Items;

public class ItemsController {
	@Autowired
	SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Transactional
	@RequestMapping(value = "loaditems", method = RequestMethod.GET)
	public ModelAndView returnVege(ModelAndView mandv, Model model){
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Items",Items.class);
		List<Items> fruitslist = query.list();
		System.out.println(fruitslist);
		mandv.setViewName("welcome");
		mandv.addObject("itemlis", fruitslist);
		return mandv;
	}
}
