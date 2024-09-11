package com.kh.boardwiths.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.boardwiths.admin.model.vo.Game;
import com.kh.boardwiths.admin.model.vo.Image;
import com.kh.boardwiths.board.model.vo.Board;
import com.kh.boardwiths.board.model.vo.BoardMarket;
import com.kh.boardwiths.board.model.vo.BoardMatching;
import com.kh.boardwiths.board.model.vo.BoardQuery;
import com.kh.boardwiths.board.model.vo.Comments;
import com.kh.boardwiths.board.model.vo.PageInfo;

@Repository("bDAO")
public class BoardDAO {

	public int getListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("boardMapper.getListCount", map);
	}
	
	public ArrayList<Board> selectBoardList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> map) {
		
		int offset = (pi.getCurrentPage() -1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
			return (ArrayList)sqlSession.selectList("boardMapper.selectBoardList", map, rowBounds);
	}

	public Board selectBoard(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.selectOne("boardMapper.selectBoard", bId);
	}

	public int deleteBoard(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.update("boardMapper.deleteBoard", bId);
	}

	public ArrayList<Board> selectSearchList(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectSearchList", map);
	}

	public int getSearchListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("boardMapper.getSearchListCount", map);
	}

	public int updateCount(SqlSessionTemplate sqlSession, int bNo) {
		return sqlSession.update("boardMapper.updateCount", bNo);
	}
	
	public ArrayList<Comments> selectComments(SqlSessionTemplate sqlSession, int refBoardNo) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectComments", refBoardNo);
	}

	public int insertComments(SqlSessionTemplate sqlSession, Comments c) {
		return sqlSession.insert("boardMapper.insertComments", c);
	}

	public int updateComments(SqlSessionTemplate sqlSession, Comments c) {
		return sqlSession.update("boardMapper.updateComments", c);
	}

	public int deleteComments(SqlSessionTemplate sqlSession, int comNo) {
		return sqlSession.delete("boardMapper.deleteComments", comNo);
	}

	public int countBlikes(SqlSessionTemplate sqlSession, int bNo) {
		return sqlSession.selectOne("boardMapper.countBlikes", bNo);
	}

	public int countClikes(SqlSessionTemplate sqlSession, int cNo) {
		return sqlSession.selectOne("boardMapper.countClikes", cNo);
	}

	public ArrayList<Game> selectGameList(SqlSessionTemplate sqlSession, String gameName) { 
		return (ArrayList)sqlSession.selectList("boardMapper.selectGameList", gameName); 
	}

	public int insertBasicInfo(SqlSessionTemplate sqlSession, Board board) {
		return sqlSession.insert("boardMapper.insertBasicInfo", board);
	}

	public int insertBSinfo(SqlSessionTemplate sqlSession, BoardMarket boardM) {
		return sqlSession.insert("boardMapper.insertBSInfo", boardM);
	}

	public int insertBoardImg(SqlSessionTemplate sqlSession, Image img) {
		return sqlSession.insert("boardMapper.insertBoardImg", img);
	}

	public int insertQuery(SqlSessionTemplate sqlSession, BoardQuery boardQuery) {
		return sqlSession.insert("boardMapper.insertQuery", boardQuery);
	}

	public int insertMatchingInfo(SqlSessionTemplate sqlSession, BoardMatching boardMatching) {
		return sqlSession.insert("boardMapper.insertMatchingInfo", boardMatching);
	}
}
