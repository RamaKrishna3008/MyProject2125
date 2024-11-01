package com.klef.jfsd.sdp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.sdp.model.Faculty;
import com.klef.jfsd.sdp.service.FacultyService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class FacultyController 
{
	@Autowired
	FacultyService facultyService;
	
	@GetMapping("/")
	public ModelAndView home()
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("home");
		return mv;
	}
	
	@GetMapping("/facultyregistration")
	public ModelAndView registration()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("FacultyRegistration");
		return mv;
	}
	
	@PostMapping("RegisterFaculty")
	public ModelAndView RegisterFaculty(HttpServletRequest request)
	{
		ModelAndView mv=new ModelAndView();
		String name = request.getParameter("name");
		String username = request.getParameter("username");
		String pwd = request.getParameter("password");
		String email = request.getParameter("email");
		String contact = request.getParameter("contactno");
		
		Faculty f=new Faculty();
		f.setName(name);
		f.setUsername(username);
		f.setPassword(pwd);
		f.setEmail(email);
		f.setContactno(contact);
		
		String msg = facultyService.addFaculty(f);
		
		mv.setViewName("FacultyLogin");
		mv.addObject("message",msg);
		return mv;
		
		
	}
	
	@PostMapping("checkfacultylogin")
	public ModelAndView CheckLogin(HttpServletRequest request)
	{
		ModelAndView mv=new ModelAndView();
		String username = request.getParameter("username");
		String pwd = request.getParameter("password");
		Faculty f = facultyService.CheckFacultyLogin(username, pwd);
		if(f!=null)
		{
			mv.setViewName("FacultyHome");
			mv.addObject("message","Login Successful");
			
			HttpSession session=request.getSession();
			session.setAttribute("faculty", f);
				
		}
		else
		{
			mv.addObject("message", "Login Failed");
			mv.setViewName("FacultyLogin");
		}
		
		return mv;
		
	}
	
	@GetMapping("/FacultyLogin")
	public ModelAndView login()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("FacultyLogin");
		return mv;
	}
	
	
}
