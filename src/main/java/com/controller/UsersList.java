package com.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import com.entity.User;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/")
public class UsersList {
    @Autowired
    SessionFactory sessionfactory;

    public SessionFactory getSessionfactory() {
        return sessionfactory;
    }

    public void setSessionfactory(SessionFactory sessionfactory) {
        this.sessionfactory = sessionfactory;
    }

    @Transactional
    @RequestMapping(value = "/userslist", method = RequestMethod.GET)
    public ModelAndView requestMethodName(ModelAndView mandv, HttpSession httpsession) {
        System.out.println("inside userslist direct....");
        Session session = sessionfactory.getCurrentSession();
        Query query = session.createQuery("from User");
        List<User> userslist = query.list();
        httpsession.setAttribute("userslist", userslist);
        mandv.setViewName("userlist");
        return mandv;
    }
}
