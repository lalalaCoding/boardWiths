package com.kh.boardwiths.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.boardwiths.admin.model.vo.Game;
import com.kh.boardwiths.admin.model.vo.Image;
import com.kh.boardwiths.board.model.vo.Board;
import com.kh.boardwiths.board.model.vo.BoardMarket;
import com.kh.boardwiths.board.model.vo.BoardMatching;
import com.kh.boardwiths.board.model.vo.BoardQuery;
import com.kh.boardwiths.board.model.vo.Comments;
import com.kh.boardwiths.board.model.vo.PageInfo;

public interface BoardService {

	int getListCount(HashMap<String, String> map);
	
	int getSearchListCount(HashMap<String, String> map);

	ArrayList<Board> selectBoardList(PageInfo pi, HashMap<String, String> map);

	Board selectBoard(int bNo, int loginUsersNo);

	ArrayList<Board> selectBoardList(HashMap<String, String> map);

	int deleteBoard(int bNo);

	ArrayList<Comments> selectComments(int refBoardNo);

	int insertComments(Comments c);

	int updateComments(Comments c);

	int deleteComments(int comNo);

	int countBLikes(int bNo);

	int countCLikes(int cNo);
	
	ArrayList<Game> selectGameList(String gameName);

	int insertBasicInfo(Board board);

	int insertBSInfo(BoardMarket boardM);

	int insertBoardImg(Image img);

	int insertQuery(BoardQuery boardQuery);

	int insertMatchingInfo(BoardMatching boardMatching);
	
}
