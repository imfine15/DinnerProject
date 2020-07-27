package com.kh.semi.enterprise.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.enterprise.model.service.EnpService;
import com.kh.semi.enterprise.model.vo.ForEntCrVO;
import com.kh.semi.enterprise.model.vo.ForPhVO;
import com.kh.semi.enterprise.model.vo.PageInfo;
import com.kh.semi.payment.model.vo.ReservationVO;

/**
 * Servlet implementation class SelectPaymentHistoryListServlet
 */
@WebServlet("/selectCalculateList.en")
public class SelectPaymentHistoryListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectPaymentHistoryListServlet() {
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
		
		int listCount = new EnpService().getPHListCount(enp);
		
		maxPage = (int)((double) listCount / limit + 0.9);
		
		startPage = (((int)((double)currentPage/10 +0.9))-1)*10 +1;
		
		endPage = startPage + 10- 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		ArrayList<ForPhVO> resList = new EnpService().selectPHList(pi,enp);
		
		ArrayList<ForPhVO> forSum = new EnpService().selectSum(resList,enp);
		
		ArrayList<ForPhVO> calcList = new EnpService().getCalcList(enp);
		
		ArrayList<ForPhVO> infoList = new EnpService().selectPhInfoList(calcList);
		
		int sum = 0;
		int count = 0;
		
		for(ForPhVO p : resList) {
			count++;
		}
		
		for(ForPhVO p : forSum) {
			sum += p.getSum();
		}
		
		for(ForPhVO p : infoList) {
			int i = 0;
			infoList.get(i).setSum(sum);
			i++;
		}
		
		String page = "";
		
		if(infoList != null) {
			page = "views/enterprise/paymentHistory/paymentHistory.jsp";
			request.setAttribute("infoList", infoList);
			request.setAttribute("pi", pi);
			request.setAttribute("count", count);
			request.setAttribute("asd", 4);
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
