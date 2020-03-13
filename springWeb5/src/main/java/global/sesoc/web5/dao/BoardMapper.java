package global.sesoc.web5.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;

import global.sesoc.web5.vo.Board;
import global.sesoc.web5.vo.Reply;

public interface BoardMapper {

	void insertB(Board b);

	ArrayList<Board> boardList();

	Board readB(int n);

	void updateH(int boardnum);

	void delete(int boardnum);

	void updateB(Board b);

	void insertR(Reply r);

	ArrayList<Reply> readR(int boardnum);

	Reply read1R(int replynum);

	void updateR(Reply r);

	void deleteR(int replynum);

	int getTotal(String searchText);

	ArrayList<Board> boardList(String searchText, RowBounds rb);

}
