package com.kh.boardwiths.admin.common;

import com.kh.boardwiths.board.model.vo.PageInfo;

public class AdminPagination {
	public static PageInfo getPageInfo(int currentPage, int listCount, int boardLimit) {
		int pageLimit = 5;
		
		int maxPage = (int)Math.ceil((double)listCount/boardLimit);
		int index = (int)Math.ceil((double)currentPage/pageLimit);
		int startPage = (index-1)*pageLimit + 1;
		int endPage = index*pageLimit;
		if(endPage > maxPage) endPage = maxPage;
		return new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
	}
}
