package com.kh.boardwiths.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.boardwiths.admin.model.vo.Game;
import com.kh.boardwiths.admin.model.vo.Image;
import com.kh.boardwiths.board.model.exception.BoardException;
import com.kh.boardwiths.board.model.service.BoardService;
import com.kh.boardwiths.board.model.vo.Board;
import com.kh.boardwiths.board.model.vo.BoardMarket;
import com.kh.boardwiths.board.model.vo.BoardMatching;
import com.kh.boardwiths.board.model.vo.BoardQuery;
import com.kh.boardwiths.board.model.vo.Comments;
import com.kh.boardwiths.board.model.vo.PageInfo;
import com.kh.boardwiths.common.BoardPagination;
import com.kh.boardwiths.users.model.vo.Users;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService bService;
	
	@RequestMapping("list.bo")
	public String selectBoardList(@RequestParam(value="page", defaultValue="1") int currentPage,
			@RequestParam(value="category", defaultValue="0") String category, HttpSession session, Model model) {
		
		HashMap<String, String> map = new HashMap();
			map.put("category", category);
		
		int listCount = bService.getListCount(map);
		PageInfo pi = BoardPagination.getPageInfo(currentPage, listCount, 10);
		ArrayList<Board> list = bService.selectBoardList(pi, map);
		
		if(list != null) {
			Map<Integer, Integer> boardLikesMap = new HashMap();
			for (Board board : list) {
	            int bNo = board.getBoardNo();
	            int boardLikes = bService.countBLikes(bNo);
	            boardLikesMap.put(bNo, boardLikes);
	        }
			
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			model.addAttribute("boardLikesMap", boardLikesMap);
			if(category != "0") {
				model.addAttribute("category", category);
			}
			return "boardList";
		}
		throw new BoardException("페이지 불러오기에 실패했습니다.");
	}
	
	@RequestMapping("selectBoard.bo")
	public String selectBoard(@RequestParam("bNo") int bNo, @RequestParam("page") int page, HttpSession session, Model model) {
		Users loginUser = (Users)session.getAttribute("loginUser");
		int loginUsersNo = 0;
		if(loginUser != null) {
			loginUsersNo = loginUser.getUsersNo();
		}
		Board board = bService.selectBoard(bNo, loginUsersNo);
		ArrayList<Comments> cList = bService.selectComments(bNo);
		
		Map<Integer, Integer> commentsLikesMap = new HashMap<>();
		for (Comments comment : cList) {
			int cNo = comment.getComNo();
			int commentsLikes = bService.countCLikes(cNo);
			commentsLikesMap.put(cNo, commentsLikes);
		}
		
		if(board != null) {
			model.addAttribute("b", board);
			model.addAttribute("page", page);
			model.addAttribute("cList", cList);
			model.addAttribute("commentsLikesMap", commentsLikesMap);
			return "boardDetail";
		} else {
			throw new BoardException("게시글 상세조회에 실패했습니다.");	
		}
	}

	@RequestMapping("searchBoardList.bo")
	public String searchBoardList(@RequestParam(value="page", defaultValue="1") int currentPage,
			@RequestParam(value="category", defaultValue="0") String category,  @RequestParam("condition") String condition, @RequestParam("value") String value, Model model) {
			
		HashMap<String, String> map = new HashMap();
			map.put("condition", condition);
			map.put("value", value);
			map.put("category", category);
			
			ArrayList<Board> list = bService.selectBoardList(map);
			int listCount = bService.getSearchListCount(map);
			PageInfo pi = BoardPagination.getPageInfo(currentPage, listCount, 10);
			
			if(list != null) {
				model.addAttribute("list", list);
				model.addAttribute("pi", pi);
				model.addAttribute("category", category);
				model.addAttribute("condition", condition);
				model.addAttribute("value", value);
				return "boardList";
			}
			throw new BoardException("페이지 불러오기에 실패했습니다.");
	}
	
	@RequestMapping("delete.bo")
	public String deleteBoard(@RequestParam("boardNo") int bNo) {
		int result = bService.deleteBoard(bNo);
		
		if(result > 0) {
			return "redirect:list.bo";
		} else {
			throw new BoardException("게시글 삭제에 실패했습니다.");
		}
	}
	
	@RequestMapping(value="insertComments.bo", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String insertReply(@ModelAttribute Comments c) {
		int result = bService.insertComments(c);
		ArrayList<Comments> list = bService.selectComments(c.getRefBoardNo());
		
		JSONArray array = new JSONArray();
		for(Comments com : list) {
			JSONObject json = new JSONObject(); // {key:value}
			json.put("comNo", com.getComNo());
			json.put("usersNo", com.getUsersNo());
			json.put("nickname", com.getNickname());
			json.put("refBoardNo", com.getRefBoardNo());
			json.put("comContent", com.getComContent());
			json.put("comDate", com.getComDate());
			
			array.put(json);
		}
		return array.toString();
	}
	
	@RequestMapping("deleteComments.bo")
	@ResponseBody
	public String deleteReply(@RequestParam("comNo") int comNo) {
		int result = bService.deleteComments(comNo);
		return result == 1 ? "success" : "fail";
	}
	
	@RequestMapping("updateComments.bo")
	@ResponseBody
	public String updateReply(@ModelAttribute Comments c) {
		int result = bService.updateComments(c);
		return result == 1 ? "success" : "fail";
	}
	
	@RequestMapping("countBLikes.bo")
	public int countBLikes(@RequestParam("boardNo") int bNo) {
		int result = bService.countBLikes(bNo);
		return result;
	}
	
	@RequestMapping("countCLikes.bo")
	public int countCLikes(@RequestParam("comNo") int cNo) {
		int result = bService.countCLikes(cNo);
		return result;
	}
	
	//동욱
	// 구매/판매/매칭 게임 검색버튼을 눌렀을때 데이터출력
	@RequestMapping(value = "selectGameList.bo", method = RequestMethod.POST)
	@ResponseBody public List<Game> selectGameList(@RequestParam("gameName")String gameName) {
		ArrayList<Game> glist = bService.selectGameList(gameName);
	    
	    return glist;
	}
	// view로 리턴
	@RequestMapping(value = "buy.bo", method = RequestMethod.GET)
	public String showBuyPage() {
	    return "buy"; 
	}

	//문의사항 작성(,제거 필요)
	@RequestMapping("insertQuery.bo")
	public String insertQuery(@ModelAttribute BoardQuery boardQuery, @ModelAttribute Board b, Model model) {
		
		b.setCategory("6");
		b.setBoardNo(b.getBoardNo());
		int result1 = bService.insertBasicInfo(b);
		
		boardQuery.setRefBoardNo(b.getBoardNo());
		boardQuery.setQueryReason(boardQuery.getQueryReason() + boardQuery.getOtherReason());
		int result2 = bService.insertQuery(boardQuery);
		if(result1 + result2 > 1) {
			return "redirect:list.bo?category=6";
		} else {
			return "게시글 작성 실패";
		}
			
	}
	
	//공지사항 작성(완료)
	@RequestMapping("insertNotice.bo")
	public String insertNotice(@ModelAttribute Board b, @RequestParam("file") MultipartFile file, HttpServletRequest request) {
		Image img = new Image();
		
		int result3 = 0;
		if(file != null && !file.isEmpty()) {
			String fileR = file.getOriginalFilename();
			img.setImgName(fileR);
			img.setImgGroup('B');
			img.setImgRefNo(b.getBoardNo());
			img.setImgRename(saveFile(file,request));	
			result3 = bService.insertBoardImg(img);
		}
		
		b.setCategory("1");
		b.setGameNo(0);
		int result1 = bService.insertBasicInfo(b);
		img.setImgRefNo(b.getBoardNo());
		
		int totalResult = result1 +  result3;
		
		if(totalResult > 0) {
			return "redirect:list.bo?category=1";
		}else {
			return "게시글 작성 실패";
		}
		
	}
	
	//후기작성(내글 목록 추가)
	@RequestMapping("insertReview.bo")
	public String insertReview(@ModelAttribute Board b, @RequestParam("file") MultipartFile file, HttpServletRequest request) {
		Image img = new Image();
		int result3 = 0;
		if(file != null && !file.isEmpty()) {
			String fileR = file.getOriginalFilename();
			img.setImgName(fileR);
			img.setImgGroup('B');
			img.setImgRefNo(b.getBoardNo());
			img.setImgRename(saveFile(file,request));
			result3 = bService.insertBoardImg(img);
		}
		b.setCategory("5");
		b.setGameNo(0);
		int result1 = bService.insertBasicInfo(b);
		img.setImgRefNo(b.getBoardNo());
		int totalResult = result1 +  result3;
		
		if(totalResult > 0) {
			return "redirect:list.bo?category=5";
		} else {
			return "게시글 작성 실패";
		}
	}
	
	// 매칭
	@RequestMapping("insertMatching.bo")
	public String insertMatching(@ModelAttribute BoardMatching boardMatching, @ModelAttribute Board b,@RequestParam("file") MultipartFile file, HttpServletRequest request, Model model) {
		Image img = new Image();
		
		int result2 = 0;
		if(file != null && !file.isEmpty()) {
			String fileR = file.getOriginalFilename();
			img.setImgName(fileR);
			img.setImgGroup('B');
			img.setImgRefNo(b.getBoardNo());
			img.setImgRename(saveFile(file,request));	
			result2 = bService.insertBoardImg(img);
		}
		
		b.setCategory("4");
		b.setGameNo(b.getGameNo());
		int result1 = bService.insertBasicInfo(b);
		img.setImgRefNo(b.getBoardNo());
		boardMatching.setRefBoardNo(b.getBoardNo());
		boardMatching.setPlace(boardMatching.getPlace()+boardMatching.getPAddress());
		int result3 = bService.insertMatchingInfo(boardMatching);
		int totalResult = result1 + result2 + result3;
		
		if(totalResult > 1) {
			return "redirect:list.bo?category= 4";
		} else {
			return "게시글 작성 실패";
		}
	}
	
	// 구매/판매 게시글 작성(완료)
	@RequestMapping("insertBSBoard.bo")
	public String insertAttm(@ModelAttribute Board b, @ModelAttribute BoardMarket bm
								, @RequestParam("file") MultipartFile file, HttpServletRequest request){
		Image img = new Image(); 
		int result3 = 0;
		//파일이 있을때 파일 첨부
		if(file != null && !file.isEmpty()) {
			String fileR = file.getOriginalFilename();
			img.setImgName(fileR);
			img.setImgGroup('B');
			img.setImgRefNo(b.getBoardNo());
			img.setImgRename(saveFile(file,request));		
			result3 = bService.insertBoardImg(img);
		}
		
		int result1 = bService.insertBasicInfo(b);
		bm.setRefBoardNo(b.getBoardNo());
		int result2 = bService.insertBSInfo(bm);
		img.setImgRefNo(b.getBoardNo());
		int totalResult = result1 + result2 + result3;
	    
		if (totalResult > 1) {
	    	return "redirect:list.bo?category=2"; //  게시글 등록시 게시판으로 이동
	    } else {
	    	return "게시글 작성 실패"; // 게시글 작성 실패
    	}
		
	}
	
	// 파일관련 
	public String saveFile(MultipartFile upload, HttpServletRequest request) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		int ranNum = (int)(Math.random()*100000);
		String originFileName = upload.getOriginalFilename();
		String renameFileName = sdf.format(new java.util.Date()) + ranNum + originFileName.substring(originFileName.lastIndexOf("."));
		String renamePath = request.getSession().getServletContext().getRealPath("resources") + "\\uploadFiles" ;
		File file = new File(renamePath + "\\" + renameFileName);
		
		if(!file.exists()) {
			file.mkdirs();
		} 
		try {
			upload.transferTo(file);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return renameFileName;
	}
	
	public void deleteFile(String rename, HttpServletRequest request) {
		String uploadFiles = request.getSession().getServletContext().getRealPath("resources") + "\\uploadFiles";
		File file = new File(uploadFiles + "\\" + rename);
		file.delete();
			
	}
	
	   @RequestMapping("communityrule.co")
	   public String communityrule() {
	      return "communityrule";
	   }
	   
	   @RequestMapping("regulation.co")
	   public String regulation() {
	      return "regulation";
	   }
	   
	   @RequestMapping("personal_info.co")
	   public String personalInfo() {
	      return "personal_info";
	   }
}	
