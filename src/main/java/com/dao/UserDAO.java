package com.dao;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.entity.*;
import com.action.*;

@Repository
public class UserDAO {
	@Autowired
	SessionFactory sessionfactory;

	public SessionFactory getSessionfactory() {
		return sessionfactory;
	}

	public void setSessionfactory(SessionFactory sessionfactory) {
		this.sessionfactory = sessionfactory;
	}
    
    @Transactional
    public void validateUser(LoginForm loginform) {
    	String email = loginform.getEmail();
    	String upass = loginform.getUpass();
    	Session session = sessionfactory.getCurrentSession();
    	User user = (User)session.createQuery("select * from User where email = "+"'"+email+"'");
    	if(user.getUpass().equals(upass))
    		//return "success";
    		System.out.println("success");
    	else
    		//return "failure";
    		System.out.println("failure");
    }
}
