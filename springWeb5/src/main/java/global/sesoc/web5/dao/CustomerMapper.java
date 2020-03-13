package global.sesoc.web5.dao;

import global.sesoc.web5.vo.Member;

public interface CustomerMapper {

	void insert(Member vo);

	Member getMember(String id);

	void update(Member vo);

	void deleteM(String password);



}
