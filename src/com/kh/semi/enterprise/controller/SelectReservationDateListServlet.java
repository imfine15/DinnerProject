package com.kh.semi.enterprise.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.semi.enterprise.model.service.EnpService;
import com.kh.semi.enterprise.model.vo.ForEntCrVO;
import com.kh.semi.enterprise.model.vo.PageInfo;
import com.kh.semi.payment.model.vo.ReservationVO;

/**
 * Servlet implementation class SelectReservationDateListServlet
 */
@WebServlet("/selectReservationDateList.en")
public class SelectReservationDateListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectReservationDateListServlet() {
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
		
		
		Date date = new Date();
		SimpleDateFormat sdformat = new SimpleDateFormat("yyyy/MM/dd");
		SimpleDateFormat requestDate = new SimpleDateFormat("yyyyMMdd");
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		
		String today = request.getParameter("today");
		if(today != null && !"".equals(today) ) {
			try {
				date = sdformat.parse(today);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			cal.setTime(date);
		}
		
		
		if(request.getParameter("dayStatus") == null) {
			
		}else {
			
			int dayStatus = Integer.parseInt(request.getParameter("dayStatus"));
			System.out.println("dayStatus : " + dayStatus);
			switch(dayStatus) {
			case 1 : cal.add(Calendar.DATE, +1);break;
			case -1 : cal.add(Calendar.DATE, -1);break;
			default : System.out.println("에러에러");break;
			}
			
		}
		today = sdformat.format(cal.getTime());
		String requestDay = requestDate.format(cal.getTime());
		
		currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		String enp = request.getParameter("enpId");
		limit = 5;
		
		int listCount = new EnpService().getRDListCount(enp,requestDay);
		
		maxPage = (int)((double) listCount / limit + 0.9);
		
		startPage = (((int)((double)currentPage/10 +0.9))-1)*10 +1;
		
		endPage = startPage + 10- 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		ArrayList<ReservationVO> list = new EnpService().selectRDList(pi,enp,requestDay);
		
		
		
		String memId = new EnpService().selectCRMemId(enp);
		
		ArrayList<ForEntCrVO> modalList = new EnpService().selectRDModalList(enp,requestDay);
		
		String cancelId = "RSC3";
		String visitId = "RSC5";
		
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
		
		if(list != null && modalList != null) {
			page = "views/enterprise/reservationDate/reservationDate.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
			request.setAttribute("modalList", modalList);
			request.setAttribute("cancelCount", cancelCount);
			request.setAttribute("visitCount", visitCount);
			request.setAttribute("asd", 2);
			request.setAttribute("today", today);
		}else {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "조회 실패");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
		
		
		
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		new Gson().toJson(list, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
