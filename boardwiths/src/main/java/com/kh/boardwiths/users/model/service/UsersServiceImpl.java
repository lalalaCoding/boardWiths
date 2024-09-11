package com.kh.boardwiths.users.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.boardwiths.admin.model.vo.Report;
import com.kh.boardwiths.board.model.vo.Board;
import com.kh.boardwiths.board.model.vo.PageInfo;
import com.kh.boardwiths.users.model.dao.UsersDAO;
import com.kh.boardwiths.users.model.vo.Users;

@Service("uService")
public class UsersServiceImpl implements UsersService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private UsersDAO uDAO;
	
	@Override
	public Users login(Users users) {
		Users loginUser = uDAO.login(sqlSession, users);
		return loginUser;
	}

	@Override
	public int insertUsers(Users users) {
		return uDAO.insertUsers(sqlSession, users);
	}

	@Override
	public int checkId(String id) {
		return uDAO.checkId(sqlSession, id);
	}

	@Override
	public int checkNickName(String nickName) {
		return uDAO.checkNickName(sqlSession, nickName);
	}
	@Override
	public int reportUsers(Report rep) {
		return uDAO.reportUsers(sqlSession, rep);
	}

	@Override // 내가 쓴 글의 수
	public int myBoardListCount(int usersNo) {
		return uDAO.myBoardListCount(sqlSession, usersNo);
	}
	@Override // 내가 쓴 글 리스트 가져오기
	public ArrayList<Board> selectMyList(int usersNo, PageInfo pi) {
		return uDAO.selectMyList(sqlSession, usersNo, pi);
	}
	
	@Override // 내가 쓴 댓글의 수
	public int myReplyListCount(int usersNo) {
		return uDAO.myReplyListCount(sqlSession, usersNo);
	}
	@Override // 내가 쓴 댓글 리스트 가져오기
	public ArrayList<Board> selectMyReplyList(int usersNo, PageInfo pi) {
		return uDAO.selectMyReplyList(sqlSession, usersNo, pi);
	}
	
	@Override // 내가 쓴 댓글의 글의 수
	public int myReBoardListCount(int usersNo) {
		return uDAO.myReBoardListCount(sqlSession, usersNo);
	}
	@Override // 내가 쓴 댓글의 글 리스트 가져오기
	public ArrayList<Board> selectMyReBoardList(int usersNo, PageInfo pi) {
		return uDAO.selectMyReBoardList(sqlSession, usersNo, pi);
	}
	
	@Override // 내가 좋아요한 글의 수
	public int myBoardLikeListCount(int usersNo) {
		return uDAO.myBoardLikeListCount(sqlSession, usersNo);
	}
	@Override // 내가 좋아요한 글 리스트 가져오기
	public ArrayList<Board> selectMyBoardLikeList(int usersNo, PageInfo pi) {
		return uDAO.selectMyBoardLikeList(sqlSession, usersNo, pi);
	}

	@Override
	public int messageListCount(int usersNo) {
		return uDAO.messageListCount(sqlSession, usersNo);
	}
	@Override
	public ArrayList<Board> selectMessageList(int usersNo, PageInfo pi) {
		return uDAO.selectMessageList(sqlSession, usersNo, pi);
	}
	
	@Override
	public ArrayList<Object> usermypage(String id) {
		return uDAO.usermypage(sqlSession, id);
	}

	@Override
	public Users getUserById(String id) {
		return uDAO.getUserById(sqlSession, id);
	}
	
	@Override
	public int userchange(Users u) {
		return uDAO.userchange(sqlSession, u);
	}
	
	@Override
	public int updatePassword(HashMap<String, String> map) {
		return uDAO.updatePassword(sqlSession, map);
	}

	@Override
	public int deleteUser(String id) {
		return uDAO.deleteUser(sqlSession, id);
	}

	@Override
	public int updateUser(Users user) {
		return uDAO.updateUser(sqlSession, user);
	}

	@Override
	public int updatePassword(String id, String encodedNewPwd) {
		return uDAO.updatePassword(sqlSession, id, encodedNewPwd);
	}
	
}
