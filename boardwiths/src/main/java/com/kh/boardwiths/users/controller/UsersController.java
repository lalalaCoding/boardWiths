package com.kh.boardwiths.users.controller;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.boardwiths.admin.model.vo.Report;
import com.kh.boardwiths.board.model.exception.BoardException;
import com.kh.boardwiths.board.model.vo.Board;
import com.kh.boardwiths.board.model.vo.PageInfo;
import com.kh.boardwiths.common.BoardPagination;
import com.kh.boardwiths.users.model.exception.UsersException;
import com.kh.boardwiths.users.model.service.UsersService;
import com.kh.boardwiths.users.model.vo.Users;

@Controller
public class UsersController {
	
	@Autowired
	private UsersService uService;
	
	
	@RequestMapping("loginView.us")
	public String moveToLoginView() {
		return "loginView";
	}
	
	@RequestMapping("login.us")
	public String login(Users users, Model model, HttpSession session) {
		Users loginUser = uService.login(users);
		
		if(loginUser != null) {
			session.setAttribute("loginUser", loginUser);
			return "redirect:home.do";
		} else {
			model.addAttribute("msg", "로그인에 실패했습니다");
			return "../common/errorPage";
		}
	}
	
	@RequestMapping("enroll.us")
	public String enroll(Users users, ModelAndView mv) {
		return "enroll";
	}
	
	@RequestMapping("checkId.us")
	public void checkId(@RequestParam("id") String id, PrintWriter out) {
		int count = uService.checkId(id);
		String result = count == 0 ? "yes" : "no";
		out.print(result);
	}
	
	@RequestMapping("checkNickName.us")
	@ResponseBody
	public String checkNickName(@RequestParam("nickName") String nickName) {
		// @ResponseBody : ViewResolver로 보내는 경로로 보내는것(return)이 아니라 data 로 보내기 위한, 위와 같은 결과
		int count = uService.checkNickName(nickName);
		return count == 0 ? "yes" : "no";
	}
	
	@RequestMapping("logout.us")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:home.do";
	}
	
	@RequestMapping("insertUsers.us")
	public String insertUsers(@ModelAttribute Users users) {
		System.out.println(users);
		int result = uService.insertUsers(users);
		
		if(result > 0) {
			return "redirect:home.do";
		} else {
			throw new UsersException("회원가입을 실패했습니다");
		}
	}
	
	@RequestMapping("reportUsers.us")
	public String reportUsers(HttpSession session, Model model, @ModelAttribute Report rep, @RequestParam("originalUrl") String originalUrl) {
		Users loginUser = (Users)session.getAttribute("loginUser");
		int sender = 0;
		if(loginUser != null) {
			sender = loginUser.getUsersNo();
		}
		
		rep.getReportBoard();
		rep.getReportReceiver();
		rep.getReportMsg();
		rep.setReportSender(sender);
		
		int result = uService.reportUsers(rep);
		if(result > 0) {
			return "redirect:" + originalUrl;
		} else {
			throw new BoardException("유저 신고에 실패했습니다.");
		} 
	}

    // 작성글 페이지 
	@RequestMapping("myBoardList.us") 
	public String myBoardList(HttpSession session, Model model, @RequestParam(value="page", defaultValue="1") int currentPage) { // 로그인한 사람의 글, 댓글 뽑기
		int usersNo = ((Users)session.getAttribute("loginUser")).getUsersNo();
		
		// 페이징 처리
		int listCount = uService.myBoardListCount(usersNo);
		
		PageInfo pi = BoardPagination.getPageInfo(currentPage, listCount, 10);
			
		ArrayList<Board> list = uService.selectMyList(usersNo, pi);

//		System.out.println(list);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		return "myBoardList";
	}
	
	// 작성댓글 페이지 
	@RequestMapping("myReplyList.us")
	public String myReplyList(HttpSession session, Model model, @RequestParam(value="page", defaultValue="1") int currentPage) { // 로그인한 사람의 글, 댓글 뽑기
		int usersNo = ((Users)session.getAttribute("loginUser")).getUsersNo();
		
		// 페이징 처리
		int listCount = uService.myReplyListCount(usersNo);
		
		PageInfo pi = BoardPagination.getPageInfo(currentPage, listCount, 10);
		
		ArrayList<Board> list = uService.selectMyReplyList(usersNo, pi);
		//System.out.println(list);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		return "myReplyList";
	}
	
		// 댓글단 글 페이지 
		@RequestMapping("myReBoardList.us")
		public String myReBoardList(HttpSession session, Model model, @RequestParam(value="page", defaultValue="1") int currentPage) { 
		int usersNo = ((Users)session.getAttribute("loginUser")).getUsersNo();
		
		// 페이징 처리
		int listCount = uService.myReBoardListCount(usersNo);
		
		PageInfo pi = BoardPagination.getPageInfo(currentPage, listCount, 10);
		
		ArrayList<Board> list = uService.selectMyReBoardList(usersNo, pi);
		//System.out.println(list);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		return "myReBoardList";
	}
	
		// 좋아요한 글
		@RequestMapping("myBoardLikeList.us")
		public String myBoardLikeList(HttpSession session, Model model, @RequestParam(value="page", defaultValue="1") int currentPage) {
		int usersNo = ((Users)session.getAttribute("loginUser")).getUsersNo();
		System.out.println(usersNo);
		// 페이징 처리
		int listCount = uService.myBoardLikeListCount(usersNo);
		System.out.println(listCount);
		
		PageInfo pi = BoardPagination.getPageInfo(currentPage, listCount, 10);
		
		ArrayList<Board> list = uService.selectMyBoardLikeList(usersNo, pi);
		System.out.println(list);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		System.out.println(pi);
		return "myBoardLikeList";
		
	}
	
	
	@RequestMapping("messageList.us")
	public String messageList(HttpSession session, Model model, @RequestParam(value="page", defaultValue="1") int currentPage) {
		int usersNo = ((Users)session.getAttribute("loginUser")).getUsersNo();
		
		// 페이징 처리
		int listCount = uService.messageListCount(usersNo);
		System.out.println(listCount);
		
		PageInfo pi = BoardPagination.getPageInfo(currentPage, listCount, 10);
		
		ArrayList<Board> list = uService.selectMessageList(usersNo, pi);
		System.out.println(list);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		System.out.println(pi);
		return "messageList";
		
	}
	
	@RequestMapping("messageInfo.us")
	public String messageInfo() {
		return "messageInfo";
		
	}
	
	@RequestMapping("usersMyPage.us")
	public String usermypage(Model model, HttpSession session) {
	    Users loginUser = (Users) session.getAttribute("loginUser");
	    if (loginUser == null) {
	        throw new UsersException("로그인이 필요합니다.");
	    }
	    String id = loginUser.getId();
	    ArrayList<Object> Info = uService.usermypage(id);
	    model.addAttribute("Info", Info);
	    return "usersMyPage";
	    }
	   
	@RequestMapping("usersChange.us")
	public String userchange(@ModelAttribute Users u, @RequestParam(value="emailId", required=false) String emailId, 
	                        @RequestParam(value="emailDomain", required=false) String emailDomain, Model model, HttpSession session) {
	      
		if(u.getId() == null ) {
			u = (Users)session.getAttribute("loginUser"); 
		}
  
	String email = null;
	if(emailId != null && !emailId.trim().equals("")) {
       email = emailId + "@" + emailDomain;
	}
	u.setEmail(email);

	Users currentUser = uService.getUserById(u.getId());
   
	u.setReportCount(currentUser.getReportCount());
	u.setEnrollDate(currentUser.getEnrollDate());
	u.setUsersNo(currentUser.getUsersNo());
	u.setGrade(currentUser.getGrade());

   int result = uService.userchange(u);
   if (result > 0) {
       Users loginUser = uService.login(u);
       model.addAttribute("loginUser", loginUser);
       return "changeMyPage";
   } else {
       throw new UsersException("회원수정을 실패하였습니다");
   }
}

//	@RequestMapping("updatePassword.us")
//	public String updatePassword(@RequestParam(value = "currentPwd", required = false) String currentPwd,
//	                             @RequestParam(value = "newPwd", required = false) String newPwd,
//	                             Model model) {
//		Users m = (Users) model.getAttribute("loginUser");
//	    if (m == null) {
//	    	throw new UsersException("로그인된 사용자가 없습니다");
//	    }
//
//	    if(bcrypt.matches(currentPwd, m.getPwd())) {
//	    	String encodedNewPwd = bcrypt.encode(newPwd);
//	        int result = uService.updatePassword(m.getId(), encodedNewPwd);
//
//	        if (result > 0) {
//	        	model.addAttribute("loginUser", uService.login(m));
//	            return "userchange.us";
//	        } else {
//	        	throw new UsersException("비밀번호 수정을 실패하였습니다");
//	        }
//	        } else {
//	            throw new UsersException("비밀번호 수정을 실패하였습니다");
//	        }
//	    }
//	   
//	@RequestMapping("siteOut.us")
//	public String siteout(Model model, HttpSession session, HttpServletRequest request) {
//		Users loginUser = (Users) session.getAttribute("loginUser");
//
//	    try {
//	    	if (loginUser == null) {
//	    		throw new UsersException("로그인 되어 있지 않습니다. 로그인 후 다시 시도해주세요.");
//	        }
//	    	String inputPassword = request.getParameter("inputPassword");
//
//	            if (inputPassword == null || inputPassword.isEmpty()) {
//	                throw new UsersException("비밀번호를 입력해주세요.");
//	            }
//
//	            if (!inputPassword.equals(loginUser.getPwd())) {
//	                throw new UsersException("입력한 비밀번호가 일치하지 않습니다.");
//	            }
//
//	            int result = uService.deleteUser(loginUser.getId());
//
//	            if (result > 0) {
//	                session.removeAttribute("loginUser");
//	                session.invalidate();
//	                return "redirect:/bhome.do";
//	            } else {
//	                throw new UsersException("회원 탈퇴 중 오류가 발생하였습니다.");
//	            }
//	        } catch (UsersException e) {
//	            model.addAttribute("errorMsg", e.getMessage());
//	            return "siteOut";
//	        } catch (Exception e) {
//	            e.printStackTrace();
//	            model.addAttribute("errorMsg", "서버 오류가 발생하였습니다.");
//	            return "userMyPage";
//	        }
//	    }

}
