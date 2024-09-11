package com.kh.boardwiths.users.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.boardwiths.admin.model.vo.Report;
import com.kh.boardwiths.board.model.vo.Board;
import com.kh.boardwiths.board.model.vo.PageInfo;
import com.kh.boardwiths.users.model.vo.Users;

public interface UsersService {

	Users login(Users users);

	int insertUsers(Users users);

	int checkId(String id);

	int checkNickName(String nickName);
	
	int reportUsers(Report rep);
	
	int myBoardListCount(int usersNo);
	
	ArrayList<Board> selectMyList(int usersNo, PageInfo pi);

	int myReplyListCount(int usersNo);
	
	ArrayList<Board> selectMyReplyList(int usersNo, PageInfo pi);

	int myReBoardListCount(int usersNo);
	
	ArrayList<Board> selectMyReBoardList(int usersNo, PageInfo pi);

	int myBoardLikeListCount(int usersNo);
	
	ArrayList<Board> selectMyBoardLikeList(int usersNo, PageInfo pi);

	int messageListCount(int usersNo);
	
	ArrayList<Board> selectMessageList(int usersNo, PageInfo pi);
	
	ArrayList<Object> usermypage(String id);
	
	Users getUserById(String id);

	int userchange(Users u);

	int updatePassword(HashMap<String, String> map);
	
	int deleteUser(String id);

	int updateUser(Users user);

	int updatePassword(String id, String encodedNewPwd);
}
