package com.kh.semi.enterprise.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.kh.semi.enterprise.model.service.EnpService;
import com.kh.semi.enterprise.model.vo.EnpVO;
import com.kh.semi.enterprise.model.vo.ForCrInfoVO;
import com.kh.semi.enterprise.model.vo.ForEntCrVO;
import com.kh.semi.enterprise.model.vo.PageInfo;
import com.kh.semi.payment.model.vo.ReservationVO;

/**
 * Servlet implementation class SelectConfirmRequestListServlet
 */
@WebServlet("/selectConfirmRequestList.en")
public class SelectConfirmRequestListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectConfirmRequestListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage;	
		int limit;	
		int maxPage;	
		int startPage;	
		int endPage;	
		
		
		currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		String enp = request.getParameter("enpId");
		limit = 5;
		
		int listCount = new EnpService().getListCount(enp);
		
		maxPage = (int)((double) listCount / limit + 0.9);
		
		startPage = (((int)((double)currentPage/10 +0.9))-1)*10 +1;
		
		endPage = startPage + 10- 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		ArrayList<ReservationVO> list = new EnpService().selectCRList(pi,enp);
		
		String memId = new EnpService().selectCRMemId(enp);
		
		ArrayList<ForEntCrVO> modalList = new EnpService().selectCRModalList(enp);
		
		String cancelId = "RSC3";
		String visitId = "RSC5";
		
		ArrayList<ForCrInfoVO> infoModalList = new EnpService().selectCrInfoModalList(enp);
		int rownum = new EnpService().selectCRRownum(enp);
		
		ArrayList<ReservationVO> checkCountList = new ArrayList<ReservationVO>();
		
		for(ReservationVO v : list) {
			int i = 0;
			v.setmNo(list.get(i).getmNo());
			
			checkCountList.add(v);
			
			i++;
		}
		
		ArrayList<Integer> cancelCount = new EnpService().selectCRCount(cancelId,enp,checkCountList);
		
		ArrayList<Integer> visitCount = new EnpService().selectCRCount(visitId,enp,checkCountList);
		
		
		String page = "";
		
		
		if(list != null && modalList != null && infoModalList != null) {
			page = "views/enterprise/confirmRequest/confirmRequest.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
			request.setAttribute("modalList", modalList);
			request.setAttribute("cancelCount", cancelCount);
			request.setAttribute("visitCount", visitCount);
			request.setAttribute("infoModalList", infoModalList);
		}else {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "조회 실패");
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
