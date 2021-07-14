package com.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.entity.Items;

@Controller
@RequestMapping("/")
public class SelectedItems {
	@Autowired
	SessionFactory sessionfactory;
	
	@Transactional
	@RequestMapping(value = "/selectedItems", method = RequestMethod.GET)
	public void selectedItems(ModelAndView mandv, @RequestParam(required = true, name = "itemid") String itemid, HttpSession httpsession, HttpServletResponse response) throws IOException {
		System.out.println("inside selected items method....");
		LinkedHashSet<Items> itemslist = (LinkedHashSet<Items>)httpsession.getAttribute("selecteditemslist");
		//itemslist.add(null);
		System.out.println(itemid);
		//if(itemid.charAt(0) == 'v') {
			Session session = sessionfactory.getCurrentSession();
			Query query = session.createQuery("from Items where id = '"+itemid+"'", Items.class);
			Items item = (Items)query.list().get(0);
			int k = 0;
			for(Items itm : itemslist) {
				if(itm.getId().equals(item.getId())) {
					k = 1;
					break;
				}
			}
			if(k == 0) {
				itemslist.add(item);
			}
			
			//itemslist.add(item);
		//}
		httpsession.setAttribute("selecteditemslist", itemslist);

	}
}
