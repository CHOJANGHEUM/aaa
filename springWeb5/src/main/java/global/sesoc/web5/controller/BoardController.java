package global.sesoc.web5.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import global.sesoc.web5.dao.DAO;
import global.sesoc.web5.util.FileService;
import global.sesoc.web5.util.PageNavigator;
import global.sesoc.web5.vo.Board;
import global.sesoc.web5.vo.Reply;

@Controller
@RequestMapping("board")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	private DAO dao;
	
	
	final String uploadPath = "/boardfile";			//파일이 저장될 위치.
	final int countPerPage = 10;			//페이지당 글 수
	final int pagePerGroup = 5;				//페이지 이동 링크를 표시할 페이지 수
	
	
	
	
	
	

	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public String board(Model m,
			@RequestParam(value="page", defaultValue="1") int page,
			 @RequestParam(value="searchText", defaultValue="") String searchText) {

		
		int total  = dao.getTotal(searchText);
		
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total ); 
		
		ArrayList<Board> bb = dao.boardList(searchText, navi.getStartRecord(), navi.getCountPerPage()); // 초기는 1행부터 10개

		m.addAttribute("bb", bb);
		m.addAttribute("navi", navi);
		m.addAttribute("searchText", searchText);

		return "board/list"; // 물리적인 폴더구조
	}

	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String wirte() {

		return "board/write"; // 물리적인 폴더구조
	}

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String wirte1(Board b, HttpSession session, MultipartFile upload) {		//파일 받으니 해줌. 받아오기만 함. 변수에 담아야함.
	
		b.setId((String) session.getAttribute("logId"));
		
		//첨부파일이 있는 경우 지정된 경로에 저장하고,원본 파일명과 저장된 파일명을 b에 셋팅.
		
		logger.info("제목: {}", b.getTitle());
		
		if(!upload.isEmpty()) {
				String savedFile = FileService.saveFile(upload, uploadPath);
				b.setOriginalfile(upload.getOriginalFilename());
				b.setSavedfile(savedFile);
		}
		dao.insertB(b);
		
		return "redirect:/board/board"; // jsp조지면 그냥 페이지만 보여주는 거고 저지랄로 해야 get요청 수행
	}

	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public String read(int boardnum, Model m) {

		dao.updateH(boardnum);
		Board b = dao.readB(boardnum); // boardnum으로 받음 화면에서 controller로 넘어오는 경우에만.
		ArrayList<Reply> r = dao.readR(boardnum);

		
		
		m.addAttribute("r", r);
		m.addAttribute("b", b);
		return "board/read"; // 물리적인 폴더구조
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(int boardnum) {

		dao.delete(boardnum);

		return "redirect:/board/board"; // 물리적인 폴더구조
	}

	@RequestMapping(value = "/updateB", method = RequestMethod.GET)
	public String updateB(int boardnum,Model m) {

		Board b = dao.readB(boardnum); // boardnum으로 받음 화면에서 controller로 넘어오는 경우에만.

		m.addAttribute("b", b);

		return "board/updateB"; // 물리적인 폴더구조
	}
	
	@RequestMapping(value = "/updateB", method = RequestMethod.POST)
	public String update1B(Board b,HttpSession session) {

		
		b.setId((String) session.getAttribute("logId"));
		dao.updateB(b); 



		return "redirect:/board/board"; // 물리적인 폴더구조
	}

	
	@RequestMapping(value = "download", method = RequestMethod.GET)
	public String fileDownload(int boardnum, Model model, HttpServletResponse response) {
		Board board = dao.readB(boardnum);
		
		//원래의 파일명
		String originalfile = new String(board.getOriginalfile());		//바꾼이름이 저장되어있으니깐.
		try {		//지금부터 가는 ㄱ ㅓ 이름 그냥 알려주는거  ,원래 껄로 저장.
			response.setHeader("Content-Disposition", " attachment;filename="+ URLEncoder.encode(originalfile, "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		//저장된 파일 경로
		// ex>  c:/boardfile/23131321.xlsx 
		String fullPath = uploadPath + "/" + board.getSavedfile();
		
		//서버의 파일을 읽을 입력 스트림과 클라이언트에게 전달할 출력스트림
		FileInputStream filein = null;
		ServletOutputStream fileout = null;
		
		try {
			filein = new FileInputStream(fullPath);			//풀팼쓰 접근
			fileout = response.getOutputStream();
			
			//Spring의 파일 관련 유틸
			FileCopyUtils.copy(filein, fileout);
			
			filein.close();
			fileout.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return null;
	}
	
	
	
	
	@RequestMapping(value = "/insertR", method = RequestMethod.POST)
	public String insertR(Reply r,HttpSession session) {

		
		r.setId((String) session.getAttribute("logId"));
		dao.insertR(r); 



		return "redirect:/board/read?boardnum="+r.getBoardnum(); 				
	}


	
	
	@RequestMapping(value = "/updateR", method = RequestMethod.GET)
	public String updateR(int boardnum,int replynum,Model m) {
		

		Reply r = dao.read1R(replynum); //

		m.addAttribute("r", r);

		return "board/updateR"; 
	}
	
	@RequestMapping(value = "/updateR", method = RequestMethod.POST)
	public String updateR1(Reply r,HttpSession session) {
	
		r.setId((String) session.getAttribute("logId"));
		 dao.updateR(r); //



		return "redirect:/board/read?boardnum="+r.getBoardnum(); 
	}

	@RequestMapping(value = "/deleteR", method = RequestMethod.GET)
	public String deleteR(int replynum,int boardnum,HttpSession session) {
	
		dao.deleteR(replynum);



		return "redirect:/board/read?boardnum="+boardnum; //컨트롤
	}

	
	
	
	
	
}
