package com.kh.semi.ad.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.ad.model.service.PartnerService;
import com.kh.semi.ad.model.vo.PartnerVO;
import com.kh.semi.notice.model.service.NoticeService;
import com.kh.semi.notice.model.vo.NoticeVO;

/**
 * Servlet implementation class SelectOnePartnerServlet
 */
@WebServlet("/selectOne.pa")
public class SelectOnePartnerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOnePartnerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String num = request.getParameter("num");
		
		int pNo = 0;
		
		if(num != "" && num != null) {
			pNo = Integer.parseInt(num);
		} 
		
		PartnerVO partner = new PartnerService().selectOne(pNo);
		
		String page = "";
		if(partner != null) {
			page = "/views/admin/partnerQuestion/partnerQuestionDetail.jsp";
			request.setAttribute("partner", partner);
		} else {
		
			request.setAttribute("msg", "게시글 상세 보기 실패!");
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
