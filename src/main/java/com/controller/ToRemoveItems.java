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
@RequestMapping("/")
public class ToRemoveItems {
	
	@Autowired
	SessionFactory sessionfactory;

	public SessionFactory getSessionfactory() {
		return sessionfactory;
	}

	public void setSessionfactory(SessionFactory sessionfactory) {
		this.sessionfactory = sessionfactory;
	}
	
	@Transactional
	@RequestMapping(value = "/toRemoveItems", method = RequestMethod.GET)
	public void removeItems(ModelAndView mandv, @RequestParam("itemid") String itemid, HttpSession httpsession) {
		System.out.println("inside remove elements....");
		LinkedHashSet<Items> itemslis = (LinkedHashSet<Items>)httpsession.getAttribute("selecteditemslist");
		for(Items item : itemslis) {
			if(item.getId().equals(itemid)) {
				itemslis.remove(item);
				break;
			}
		}
		httpsession.setAttribute("selecteditemslist", itemslis);
	}
}
