package com.kh.boardwiths.users.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.boardwiths.admin.model.vo.Report;
import com.kh.boardwiths.board.model.vo.Board;
import com.kh.boardwiths.board.model.vo.PageInfo;
import com.kh.boardwiths.users.model.vo.Users;

@Repository("uDAO")
public class UsersDAO {

	public Users login(SqlSessionTemplate sqlSession, Users users) {
		return sqlSession.selectOne("usersMapper.login", users);
	}

	public int insertUsers(SqlSessionTemplate sqlSession, Users users) {
		return sqlSession.insert("usersMapper.insertUsers", users);
	}

	public int checkId(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("usersMapper.checkId", id);
	}

	public int checkNickName(SqlSessionTemplate sqlSession, String nickName) {
		return sqlSession.selectOne("usersMapper.checkNickName", nickName);
	}
	
	public int reportUsers(SqlSessionTemplate sqlSession, Report rep) {
		return sqlSession.insert("usersMapper.reportUsers", rep);
	}
	
	// 내가 쓴 글
	public int myBoardListCount(SqlSessionTemplate sqlSession, int usersNo) {
		return sqlSession.selectOne("usersMapper.myBoardListCount", usersNo);
	}
	public ArrayList<Board> selectMyList(SqlSessionTemplate sqlSession, int usersNo, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset , pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("usersMapper.selectMyList", usersNo, rowBounds);
	}
	

	// 내가 쓴 댓글
	public int myReplyListCount(SqlSessionTemplate sqlSession, int usersNo) {
		return sqlSession.selectOne("usersMapper.myReplyListCount", usersNo);
	}
	public ArrayList<Board> selectMyReplyList(SqlSessionTemplate sqlSession, int usersNo, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("usersMapper.selectMyReplyList", usersNo, rowBounds);
	}
	

	// 댓글단 글
	public int myReBoardListCount(SqlSessionTemplate sqlSession, int usersNo) {
		return sqlSession.selectOne("usersMapper.myReBoardListCount", usersNo);
	}
	public ArrayList<Board> selectMyReBoardList(SqlSessionTemplate sqlSession, int usersNo, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("usersMapper.selectMyReBoardList", usersNo, rowBounds);
	}

	
	// 좋아요 누른 글
	public int myBoardLikeListCount(SqlSessionTemplate sqlSession, int usersNo) {
		return sqlSession.selectOne("usersMapper.myBoardLikeListCount", usersNo);

	}
	public ArrayList<Board> selectMyBoardLikeList(SqlSessionTemplate sqlSession, int usersNo, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("usersMapper.selectMyBoardLikeList", usersNo, rowBounds);
	}
	
	
	// 메세지 
	public int messageListCount(SqlSessionTemplate sqlSession, int usersNo) {
		return sqlSession.selectOne("usersMapper.messageListCount", usersNo);
	}
	public ArrayList<Board> selectMessageList(SqlSessionTemplate sqlSession, int usersNo, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("usersMapper.selectMessageList", usersNo, rowBounds);
	}

	public ArrayList<Object> usermypage(SqlSessionTemplate sqlSession, String id) {
		return (ArrayList)sqlSession.selectList("usersMapper.usermypage", id);
	}

	public Users getUserById(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("usersMapper.getUserById", id);
	}

	public int userchange(SqlSessionTemplate sqlSession, Users u) {
		return sqlSession.update("usersMapper.userchange", u);
	}
	
	public int updatePassword(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.update("usersMapper.updatePassword", map);
	}

	public int deleteUser(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.update("usersMapper.deleteUser", id);
	}

	public int updateUser(SqlSessionTemplate sqlSession, Users user) {
		return sqlSession.update("usersMapper.updateMember", user);
	}

	public int updateUser(SqlSessionTemplate sqlSession, String id, String encodedNewPwd) {
		return sqlSession.update("usersMapper.updateUser", encodedNewPwd);
	}

	public int updatePassword(SqlSessionTemplate sqlSession, String id, String encodedNewPwd) {
		return sqlSession.update("usersMapper.updateMember", encodedNewPwd);
	}
	
}
