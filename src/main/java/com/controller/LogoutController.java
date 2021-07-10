package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.entity.User;

@Controller
@RequestMapping("/")
public class LogoutController {
	@Autowired
	SessionFactory sessionfactory;

	public SessionFactory getSessionfactory() {
		return sessionfactory;
	}

	public void setSessionfactory(SessionFactory sessionfactory) {
		this.sessionfactory = sessionfactory;
	}
	
	@Transactional
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public ModelAndView doLogout(ModelAndView mandv, HttpSession httpsession, HttpServletRequest request) {
		System.out.println("inisde logout method....");
		httpsession = request.getSession();
		int uid = (int)httpsession.getAttribute("uid");
		Session session = sessionfactory.getCurrentSession();
		Query query = session.createQuery("from User where uid = "+"'"+uid+"'", User.class);
		List<User> usrlis = query.list();
		usrlis.get(0).setFlag(0);
		session.persist(usrlis.get(0));
		mandv.setViewName("index");
		return mandv;
	}
}
