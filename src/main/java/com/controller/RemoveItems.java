package com.controller;

import java.util.LinkedHashSet;

import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.entity.Items;

@Controller
@RequestMapping
public class RemoveItems {
	@Autowired
	SessionFactory sessionfactory;

	public SessionFactory getSessionfactory() {
		return sessionfactory;
	}

	public void setSessionfactory(SessionFactory sessionfactory) {
		this.sessionfactory = sessionfactory;
	}
	
	@Transactional
	@RequestMapping(value = "/rmvItems", method = RequestMethod.GET)
	public ModelAndView rmvItems(ModelAndView mandv, @RequestParam("itemid") String itemid, HttpSession httpsession) {
		System.out.println("inisde rmvItems");
		System.out.println(itemid);
		LinkedHashSet<Items> itmlis = (LinkedHashSet<Items>)httpsession.getAttribute("selecteditemslist");
		for(Items item : itmlis) {
			if(item.getId().equals(itemid)) {
				itmlis.remove(item);
				break;
			}
		}
		httpsession.setAttribute("selecteditemslist", itmlis);
		mandv.setViewName("shoppingCart");
		return mandv;
	}
}