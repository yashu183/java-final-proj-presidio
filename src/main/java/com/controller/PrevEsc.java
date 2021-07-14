package com.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
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
public class PrevEsc {
    @Autowired
    SessionFactory sessionfactory;

    public SessionFactory getSessionfactory() {
        return sessionfactory;
    }

    public void setSessionfactory(SessionFactory sessionfactory) {
        this.sessionfactory = sessionfactory;
    }

    @Transactional
    @RequestMapping(value = "/previliges", method = RequestMethod.GET)
    public void previligeEscalation(ModelAndView mandv, @RequestParam(required = true, name = "uid") int uid,
            HttpServletResponse response) throws IOException {
        System.out.println(uid);
        Session session = sessionfactory.getCurrentSession();
        Query query = session.createQuery("from User where uid = " + uid, User.class);
        User usr = (User) query.list().get(0);
        int isAdmin = usr.getIsAdmin();
        if (isAdmin == 1) {
            // Query query = session.createQuery("update User set isAdmin = 0 where uid =
            // "+uid, User.class);
            usr.setIsAdmin(0);
            session.update(usr);
        } else {
            // Query query = session.createQuery("update User set isAdmin = 0 where uid =
            // "+uid, User.class);
            usr.setIsAdmin(1);
            session.update(usr);
        }
        // mandv.setViewName("userlist");
        // return mandv;
        System.out.println("prev esc above response...");
        response.sendRedirect("/userslist");
    }

}
