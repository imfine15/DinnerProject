package com.kh.semi.question.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.notice.model.service.NoticeService;
import com.kh.semi.notice.model.vo.AdminNoticeAttachment;
import com.kh.semi.notice.model.vo.AdminNoticeVO;
import com.kh.semi.question.model.service.QuestionService;
import com.kh.semi.question.model.vo.QuestionFileVO;
import com.kh.semi.question.model.vo.QuestionVO;

/**
 * Servlet implementation class SelectOneQuestionServlet
 */
@WebServlet("/selectOne.qu")
public class SelectOneQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOneQuestionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		HashMap<String, Object> hmap = new QuestionService().selectOne(num);
		
		QuestionVO question = (QuestionVO) hmap.get("question");
		ArrayList<QuestionFileVO> filelist = (ArrayList<QuestionFileVO>) hmap.get("questionFile");
		
		System.out.println(hmap.get("question"));
		System.out.println(hmap.get("questionFile"));
		
		String page = "";
		if(hmap != null) {
			page = "/views/admin/questionConfirm/questionConfirmDetail.jsp";
			request.setAttribute("question", question);
			request.setAttribute("questionFile", filelist);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "공지사항 상세 보기 실패!");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
