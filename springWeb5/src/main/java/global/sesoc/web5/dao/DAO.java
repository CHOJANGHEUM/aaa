package global.sesoc.web5.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.web5.vo.Board;
import global.sesoc.web5.vo.Member;
import global.sesoc.web5.vo.Reply;

@Repository 
public class DAO {
	
	@Autowired
	private SqlSession session; // root-context에 만듦(객체가 이미 만들어져 있음).

	public void insert(Member vo) {
		
		CustomerMapper gm = session.getMapper(CustomerMapper.class);
		gm.insert(vo);
	}

	public Member getMember(String id) {
		
		CustomerMapper gm = session.getMapper(CustomerMapper.class);
		Member a = gm.getMember(id);
		
		return a;
	}

	public void updateM(Member vo) {

		
		CustomerMapper gm = session.getMapper(CustomerMapper.class);
		gm.update(vo);
		
	}

	public void insertB(Board b) {

		BoardMapper gm = session.getMapper(BoardMapper.class);
		gm.insertB(b);
		
	}

	public ArrayList<Board> boardList() {
		

		BoardMapper gm = session.getMapper(BoardMapper.class);
		 ArrayList<Board> bb =	gm.boardList();
		return bb;
	}

	public Board readB(int n) {
		
		BoardMapper gm = session.getMapper(BoardMapper.class);
		Board bb =	gm.readB(n);
		
		return bb;
	}

	public void updateH(int boardnum) {
		
		BoardMapper gm = session.getMapper(BoardMapper.class);
		gm.updateH(boardnum);
		
		
	}

	public void delete(int boardnum) {
		
		BoardMapper gm = session.getMapper(BoardMapper.class);
		gm.delete(boardnum);
		
	}

	public void updateB(Board b) {
		BoardMapper gm = session.getMapper(BoardMapper.class);
		gm.updateB(b);
		
	}

	public void deleteM(String password) {

		
		CustomerMapper gm = session.getMapper(CustomerMapper.class);
		gm.deleteM(password);
		
	}

	public void insertR(Reply r) {

		BoardMapper gm = session.getMapper(BoardMapper.class);
		gm.insertR(r);
		
	}

	public ArrayList<Reply> readR(int boardnum) {
		
		BoardMapper gm = session.getMapper(BoardMapper.class);
		
		 ArrayList<Reply> r = gm.readR(boardnum);
		
		
		return r;
	}

	public Reply read1R(int replynum) {
		BoardMapper gm = session.getMapper(BoardMapper.class);
		
		Reply r = gm.read1R(replynum);
		
		
		return r;
	}

	public void updateR(Reply r) {

	BoardMapper gm = session.getMapper(BoardMapper.class);
		
		gm.updateR(r);
		
		
	}

	public void deleteR(int replynum) {
	BoardMapper gm = session.getMapper(BoardMapper.class);
		
		gm.deleteR(replynum);
		
	}

	public int getTotal(String searchText) {
	BoardMapper gm = session.getMapper(BoardMapper.class);
		
		int g = gm.getTotal(searchText);
		return g;
	}

	public ArrayList<Board> boardList(String searchText, int startRecord, int countPerPage) {
		
		BoardMapper gm = session.getMapper(BoardMapper.class);
		//전체 검색 결과 중 읽을 시작위치와 개수
		RowBounds rb = new RowBounds(startRecord,countPerPage);
		
		ArrayList<Board> boardlist = gm.boardList(searchText, rb);
	
		return boardlist;
		
		
		
		
	}

}
