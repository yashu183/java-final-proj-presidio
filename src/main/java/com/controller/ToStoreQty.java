package com.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/")
public class ToStoreQty {
    @Autowired
	SessionFactory sessionfactory;

	public SessionFactory getSessionfactory() {
		return sessionfactory;
	}

	public void setSessionfactory(SessionFactory sessionfactory) {
		this.sessionfactory = sessionfactory;
	}
    
    @Transactional
	@RequestMapping(value = "/toStoreQty", method = RequestMethod.POST)
    public void ToStoreQty(ModelAndView mandv, @RequestParam("itemid") int ttl, HttpSession httpsession){
        httpsession.setAttribute("ttl", ttl);
        //Map map = data
    }
}
