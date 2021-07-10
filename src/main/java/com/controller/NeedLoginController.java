package com.controller;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping
public class NeedLoginController {
		@Autowired
		SessionFactory sessionfactory;

		public SessionFactory getSessionfactory() {
			return sessionfactory;
		}

		public void setSessionfactory(SessionFactory sessionfactory) {
			this.sessionfactory = sessionfactory;
		}
		
		@Transactional
		@RequestMapping(value = "/needLogin", method = RequestMethod.GET)
		public ModelAndView needLogin(ModelAndView mandv) {
			mandv.setViewName("needLogin");
			return mandv;
		}
}
