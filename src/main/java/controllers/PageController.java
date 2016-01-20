/*
 * Author: Kiran
 * This class handles initial page displaing request.
 * And Also redirects to index page from any other page
 */


package controllers;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller

public class PageController {

	/*
	 * This function sends index page to the client on URL access 
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView getDefaulltPage() {
  System.out.println("reached");
		ModelAndView model = new ModelAndView("index");
	
		return model;

	}
	
	/*
	 *  Method to send index.jsp to the client if he/she choose to redirect Home page from any other page
	 */
	@RequestMapping(value = "/getIndex", method = RequestMethod.GET)
	public ModelAndView getIndexPage(HttpSession session, Model model) {

		if(session.getAttribute("logintype").equals("facultysignin"))
			model.addAttribute("facultysignin", "Faculty Signed In");
		else
			model.addAttribute("parentsignin", "Parent/Student Signed In");
		ModelAndView modelnView = new ModelAndView("index");
	
		return modelnView;

	}

}