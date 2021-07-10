package com.controller;

import com.action.AddItemForm;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/")
public class SetDataController {
    SessionFactory sessionfactory;
    public SessionFactory getSessionfactory() {
        return sessionfactory;
    }

    public void setSessionfactory(SessionFactory sessionfactory) {
        this.sessionfactory = sessionfactory;
    }
    
    @Transactional
    @RequestMapping(value = "/loadsetdata", method = RequestMethod.GET)
    public ModelAndView setData(ModelAndView mandv){
        mandv.setViewName("addItem");
        return mandv;
    }
}
