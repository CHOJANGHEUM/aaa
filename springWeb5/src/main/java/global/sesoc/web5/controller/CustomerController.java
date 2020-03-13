package global.sesoc.web5.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.web5.dao.DAO;
import global.sesoc.web5.vo.Member;

@Controller
@RequestMapping("member")	//현재 컨트롤러의 모든 메서드 앞에 붙는 경로
public class CustomerController {
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);
	
	@Autowired	
	private DAO dao;
	
	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public String joinForm() {
		logger.info("가입 폼으로 이동");
		
		return "customer/joinForm";			//물리적인 폴더구조
	}

	
 

	
	@RequestMapping(value = "/idcheck", method = RequestMethod.GET)
	public String idcheck() {

		return "customer/idcheck";		//이건 저장안하고 보냄
	
	}
	
	
	@RequestMapping(value = "/idcheck", method = RequestMethod.POST)
	public String idcheck(String searchId,Model m) {

		
		Member vo = dao.getMember(searchId);
		
		
		m.addAttribute("searchId",searchId);
		
		if(vo==null) {
			m.addAttribute("result","yes");
		}else
			m.addAttribute("result","no");

		return "customer/idcheck";		//이건 저장하고 보냄
	
	
	}
	
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		
		

		return "customer/login";		
	
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(String id,String password,HttpSession session) {
		
		Member vo = dao.getMember(id);
		
		
		
		
		if(vo!=null && vo.getId().equals(id) && vo.getPassword().equals(password)) {
			logger.info("id: {}", id);
			session.setAttribute("logId", id);
			session.setAttribute("logPw", password);
		}else
			System.out.println("");

		return "redirect:/";		
	
	}
	
	@RequestMapping(value = "/myData", method = RequestMethod.GET)
	public String myData(HttpSession session,Model m) {
		
		String id = (String) session.getAttribute("logId");  //리턴할때 objcet로 리턴 하니깐 string 붙임. casting 해줌.
		
		Member vo = dao.getMember(id);
		m.addAttribute("vo",vo);
		return "customer/myData";		//로그인 회원가입과는 다르게 여기서는 할 일이 있음. 아이디 읽어줘야함.
	
	}
	
	
	@RequestMapping(value = "/myData", method = RequestMethod.POST)
	public String myData1(Member vo,HttpSession session) {
		
		vo.setId((String)session.getAttribute("logId"));
		dao.updateM(vo);
		

		return "redirect:/";		
	
	}
	
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		
		session.removeAttribute("logId");
		session.removeAttribute("logPw");

		return "redirect:/";		
	
	}
	
	
	
	@RequestMapping(value = "/drop", method = RequestMethod.GET)
	public String drop() {
		


		return "customer/drop";		
	
	}
	
	@RequestMapping(value = "/drop", method = RequestMethod.POST)
	public String drop1(String password,HttpSession session) {
		
		dao.deleteM(password);
		session.removeAttribute("logId");
		session.removeAttribute("logPw");



		return "redirect:/";		
	
	}
	
	
	}
	
	

