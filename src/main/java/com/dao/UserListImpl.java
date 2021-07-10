package com.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import com.entity.User;

@Controller
@RequestMapping
public class UserListImpl {
	
	@Autowired
	SessionFactory sessionfactory;

	public SessionFactory getSessionfactory() {
		return sessionfactory;
	}

	public void setSessionfactory(SessionFactory sessionfactory) {
		this.sessionfactory = sessionfactory;
	}
	
	public User findById(int uid) throws Exception {
		Session session = sessionfactory.getCurrentSession();
		Query query = session.createQuery("from User usr where usr.getUid = "+uid, User.class);
		User usr = (User)query.list().get(0);
		return usr;
	}
}
