package com.kh.semi.enterprise.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.enterprise.model.service.EnpService;
import com.kh.semi.enterprise.model.vo.PartnerEnpVO;
import com.kh.semi.notice.model.service.NoticeService;
import com.kh.semi.notice.model.vo.NoticeVO;

/**
 * Servlet implementation class SelectOnePartnerCompanyServlet
 */
@WebServlet("/selectOne.pac")
public class SelectOnePartnerCompanyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOnePartnerCompanyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String num = request.getParameter("num");
		
		int pacNo = 0;
		
		if(num != "" && num != null) {
			pacNo = Integer.parseInt(num);
		} 
		
		PartnerEnpVO partnerEnp = new EnpService().selectPartnerOne(pacNo);
		
		String page = "";
		if(partnerEnp != null) {
			page = "/views/admin/companyManagement/detailCompany.jsp";
			request.setAttribute("partnerEnp", partnerEnp);
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
