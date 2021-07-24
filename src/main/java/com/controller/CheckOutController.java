package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import com.action.CheckoutForm;
import com.entity.*;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.time.LocalDate;
import java.util.LinkedHashSet;


@Controller
@RequestMapping("/")
public class CheckOutController {
    @Autowired
    SessionFactory sessionfactory;

    public SessionFactory getSessionfactory() {
        return sessionfactory;
    }

    public void setSessionfactory(SessionFactory sessionfactory) {
        this.sessionfactory = sessionfactory;
    }
    
    @Transactional
    @RequestMapping(value = "/checkout", method = RequestMethod.POST)
    public ModelAndView checkOut(ModelAndView mandv, CheckoutForm checkoutform, HttpServletRequest request) {
        mandv.addObject("checkoutBean", checkoutform);
        String firstName = checkoutform.getFirstName();
        String lastName = checkoutform.getLastName();
        String username = checkoutform.getUsername();
        String email = checkoutform.getEmail();
        String billAddress = checkoutform.getBillAddress();
        String billCountry = checkoutform.getBillCountry();
        String billState = checkoutform.getBillState();
        String billZip = checkoutform.getBillZip();
        String shipAddress = checkoutform.getShipAddress();
        String shipCountry = checkoutform.getShipCountry();
        String shipState = checkoutform.getShipState();
        String shipZip = checkoutform.getShipZip();
        // InvEmp invemp = new InvEmp();
        // invemp.setBilladd(billAddress+", "+billCountry+", "+billState+", "+billZip);
        // invemp.setShipadd(shipAddress+", "+shipCountry+", "+shipState+", "+shipZip);
        // int invid = (int)(Math.random()*(99999-10001+1)+10001);
        // invemp.setInvid(invid);
        // LocalDate date = LocalDate.now();
        // //invemp.setDate(date);
        // HttpSession httpsession =  request.getSession();
        // int uid = (int)httpsession.getAttribute("uid");
        // invemp.setUid(uid);
        // int ttl = (int)httpsession.getAttribute("ttl")
        // invemp.setTtl(ttl);
        return mandv;
    }
}
