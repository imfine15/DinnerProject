package com.kh.semi.question.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.notice.model.service.NoticeService;
import com.kh.semi.notice.model.vo.NoticeVO;
import com.kh.semi.question.model.service.QuestionService;
import com.kh.semi.question.model.vo.QuestionVO;

/**
 * Servlet implementation class InsertAnswerQuestionServlet
 */
@WebServlet("/answer.qu")
public class InsertAnswerQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertAnswerQuestionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String title = request.getParameter("answerT");
		String content = request.getParameter("answerC");
		String qNo = request.getParameter("qNo");
		String mNo = request.getParameter("mNo");
		String mId = request.getParameter("mId");
		
		QuestionVO question = new QuestionVO();
		
		question.setQuestionTitle(title);
		question.setQuestionContent(content);
				
		int result = new QuestionService().inserAnswerQuestion(question);
		
		if(result > 0) {
			response.sendRedirect("/semiproject/selectclist.no");
		} else {
			request.setAttribute("msg", "문의 답변 등록 실패!");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}

	/**
	 * 

		if(result > 0) {

			request.setAttribute("successCode", "updateMember");
			request.getRequestDispatcher(page).forward(request, response);

			request.getSession().setAttribute("loginUser", requestMember);
			response.sendRedirect("views/member/memberUpdateForm.jsp");
		} else {
			request.setAttribute("msg", "회원정보업데이트실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}

	 * 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
