package com.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
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
public class LoadProfile {
	@Autowired
	SessionFactory sessionfactory;

	public SessionFactory getSessionfactory() {
		return sessionfactory;
	}

	public void setSessionfactory(SessionFactory sessionfactory) {
		this.sessionfactory = sessionfactory;
	}

	@Transactional
	@RequestMapping(value = "/loadprofile", method = RequestMethod.GET)
	public ModelAndView loadProfile(ModelAndView mandv, HttpSession httpsession, HttpServletResponse response)
			throws IOException {
		Session session = sessionfactory.getCurrentSession();

		if (httpsession.getAttribute("uid") == null) {
			System.out.println("inisde if.... load profile");
			response.sendRedirect("/needLogin");
		} else {
			System.out.println("inisde else.... load profile");
			int uid = (int) httpsession.getAttribute("uid");
			Query query = session.createQuery("from User usr where usr.uid = " + uid, User.class);
			User usr = (User) query.list().get(0);
			httpsession.setAttribute("userDetails", usr);
		}

		mandv.setViewName("profile");
		return mandv;
	}
}
