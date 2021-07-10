package com.controller;

import java.net.http.HttpRequest;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.entity.*;

import antlr.collections.List;

//import com.dao.UserDAO;
import com.action.LoginForm;

@Controller
@RequestMapping("/")
public class LoginController {
	@RequestMapping(value = "showloginpage", method = RequestMethod.GET)
	public ModelAndView showLoginPage(ModelAndView mandv) {
		LoginForm   loginform = new LoginForm();
		mandv.addObject("loginBean", loginform);
		mandv.setViewName("index");
		return mandv;
	}
	
	@Autowired
	SessionFactory sessionfactory;
	
	
	public SessionFactory getSessionfactory() {
		return sessionfactory;
	}


	public void setSessionfactory(SessionFactory sessionfactory) {
		this.sessionfactory = sessionfactory;
	}


	@RequestMapping(value = "loginCheck", method = RequestMethod.POST)
	@Transactional
	public ModelAndView checkLoginPage(ModelAndView mandv, LoginForm loginform, HttpSession httpsession) {
		mandv.addObject("loginBean", loginform);
		String email = loginform.getEmail();
		String upass = loginform.getUpass();
		System.out.println(email+" : "+upass);
		Session session =  sessionfactory.getCurrentSession();
		System.out.println("got the session : "+session);
//		UserDAO userdao = new UserDAO();
		String result = validateUser(loginform);
		if(result.equals("success")) {
			java.util.LinkedHashSet<Items> itemslist = new LinkedHashSet<Items>();
			httpsession.setAttribute("selecteditemslist", itemslist);
			if(httpsession.getAttribute("notfound") != null) {
				httpsession.setAttribute("notfound", false);
			}
			if(httpsession.getAttribute("loginfailed") != null) {
				httpsession.setAttribute("loginfailed", false);
			}
			Query query = session.createQuery("from User where email = "+"'"+email+"'", User.class);
			java.util.List<User> usrlist = query.list();
			if(usrlist.get(0).getIsAdmin() == 1) {
				httpsession.setAttribute("admin", true);
				int uid = usrlist.get(0).getUid();
				User usr = session.load(User.class, uid);
				usr.setFlag(1);
				httpsession.setAttribute("uid", uid);
				session.update(usr);
//				mandv.addObject("admin", true);
			}
			else {
				httpsession.setAttribute("admin", false);
			}
			mandv.setViewName("welcome");
		}
		else if(result.equals("failure")) {
			if(httpsession.getAttribute("loginfailed") != null) {
				httpsession.setAttribute("loginfailed", false);
			}
			httpsession.setAttribute("notfound", true);
			mandv.setViewName("index");
		}
		else {
			if(httpsession.getAttribute("notfound") != null) {
				httpsession.setAttribute("notfound", false);
			}
			httpsession.setAttribute("loginfailed", true);
			mandv.setViewName("index");
		}
		return mandv;
	}
	
    @Transactional
    public String validateUser(LoginForm loginform) {
    	String email = loginform.getEmail();
    	String upass = loginform.getUpass();
    	Session session = sessionfactory.getCurrentSession();
    	Query query = session.createQuery("from User where email = "+"'"+email+"'", User.class);
    	java.util.List<User> userlist = query.list();
    	if(userlist.size() == 0) {
    		return "failure";
    	}
    	if(userlist.get(0).getUpass().equals(upass))
    		return "success";
    	else
    		return "wrong";
    	}
}
