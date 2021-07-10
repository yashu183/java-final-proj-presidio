 package com.controller;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.action.RegisterForm;
import com.entity.User;

@Controller
@RequestMapping("/")
public class RegisterController {
	
	@Autowired
	SessionFactory sessionfactory;
	
	
	public SessionFactory getSessionfactory() {
		return sessionfactory;
	}


	public void setSessionfactory(SessionFactory sessionfactory) {
		this.sessionfactory = sessionfactory;
	}
	
	@Transactional
	@RequestMapping(value = "/registerAction", method = RequestMethod.POST)
	public ModelAndView insertUser(ModelAndView mandv, RegisterForm registerform) {
		System.out.println("register action..."); 
		mandv.addObject("registerBean", registerform);
		String uname = registerform.getUname();
		String upass = registerform.getUpass();
		String phnum = registerform.getPhnum();
		String email = registerform.getEmail();
		User user = new User();
		user.setEmail(email);
		user.setPhone(phnum);
		user.setUname(uname);
		user.setUpass(upass);
		user.setFlag(0);
		user.setIsAdmin(0); 
    	Session session = sessionfactory.getCurrentSession();
    	session.persist(user);
    	mandv.setViewName("index");
    	return mandv;
	}
}
