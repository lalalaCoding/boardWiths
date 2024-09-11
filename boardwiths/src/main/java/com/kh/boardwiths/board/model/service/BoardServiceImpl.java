package com.kh.boardwiths.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.boardwiths.admin.model.vo.Game;
import com.kh.boardwiths.admin.model.vo.Image;
import com.kh.boardwiths.board.model.dao.BoardDAO;
import com.kh.boardwiths.board.model.vo.Board;
import com.kh.boardwiths.board.model.vo.BoardMarket;
import com.kh.boardwiths.board.model.vo.BoardMatching;
import com.kh.boardwiths.board.model.vo.BoardQuery;
import com.kh.boardwiths.board.model.vo.Comments;
import com.kh.boardwiths.board.model.vo.PageInfo;

@Service("bService")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private BoardDAO bDAO;
	
	@Override
	public int getListCount(HashMap<String, String> map) {
		return bDAO.getListCount(sqlSession, map);
	}
	
	@Override
	public ArrayList<Board> selectBoardList(PageInfo pi, HashMap<String, String> map) {
		return bDAO.selectBoardList(sqlSession, pi, map);
	}

	@Override
	public Board selectBoard(int bNo, int loginUsersNo) {
		Board b = bDAO.selectBoard(sqlSession, bNo);
		if(b != null) {
			if(loginUsersNo != 0 && b.getUsersNo() != loginUsersNo) {
				int result = bDAO.updateCount(sqlSession, bNo);
				if(result > 0) {
					b.setBoardCount(b.getBoardCount() + 1);
				}
			}
		}
		return b;
	}
	
	@Override
	public int deleteBoard(int bNo) {
		return bDAO.deleteBoard(sqlSession, bNo);
	}

	@Override
	public ArrayList<Board> selectBoardList(HashMap<String, String> map) {
		return bDAO.selectSearchList(sqlSession, map);
	}

	@Override
	public int getSearchListCount(HashMap<String, String> map) {
		return bDAO.getSearchListCount(sqlSession, map);
	}

	@Override
	public ArrayList<Comments> selectComments(int refBoardNo) {
		return bDAO.selectComments(sqlSession, refBoardNo);
	}

	@Override
	public int insertComments(Comments c) {
		return bDAO.insertComments(sqlSession, c);
	}

	@Override
	public int updateComments(Comments c) {
		return bDAO.updateComments(sqlSession, c);
	}

	@Override
	public int deleteComments(int comNo) {
		return bDAO.deleteComments(sqlSession, comNo);
	}

	@Override
	public int countBLikes(int bNo) {
		return bDAO.countBlikes(sqlSession, bNo);
	}

	@Override
	public int countCLikes(int cNo) {
		return bDAO.countClikes(sqlSession, cNo);
	}

	@Override
	public ArrayList<Game> selectGameList(String gameName) { 
		return bDAO.selectGameList(sqlSession, gameName);
	}

	@Override
	public int insertBasicInfo(Board board) {
		return bDAO.insertBasicInfo(sqlSession,board);
	}

	@Override
	public int insertBSInfo(BoardMarket boardM) {
		return bDAO.insertBSinfo(sqlSession, boardM);
	}

	@Override 
	public int insertBoardImg(Image img) {
		return bDAO.insertBoardImg(sqlSession, img);
	}

	@Override
	public int insertQuery(BoardQuery boardQuery) {
		return bDAO.insertQuery(sqlSession, boardQuery);
	}

	@Override
	public int insertMatchingInfo(BoardMatching boardMatching) {
		return bDAO.insertMatchingInfo(sqlSession, boardMatching);
	}

	

	
}