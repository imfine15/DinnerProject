package com.kh.semi.payment.controller;

import java.io.IOException;
import java.util.Calendar;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.semi.member.model.vo.MemberVO;
import com.kh.semi.payment.model.service.ReservationService;
import com.kh.semi.payment.model.vo.ReservationVO;
import com.sun.glass.ui.Pixels.Format;

@WebServlet("/reservation.me")
public class InsertReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public InsertReservationServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("loginUser");
		String mNo = member.getmNo();
		String cals = request.getParameter("cals");
		
		int year = Integer.parseInt(request.getParameter("year"));
		int month = Integer.parseInt(request.getParameter("month"));
		int day = Integer.parseInt(request.getParameter("day"));
		int hour = Integer.parseInt(request.getParameter("hour"));
		int min = Integer.parseInt(request.getParameter("min"));
		
		int adult = Integer.parseInt(request.getParameter("adult"));
		int child = Integer.parseInt(request.getParameter("child"));
		
		String eNo = "ENP1";
		String rContent = request.getParameter("rcontent");
		int point = Integer.parseInt(request.getParameter("point"));
		
		
		Calendar cal = Calendar.getInstance();
		cal.set(year, month - 1, day, hour, min);
		
		Date resTime = new Date(cal.getTime().getTime());
		ReservationVO insertReservationVO = new ReservationVO();
		int people = adult + child;
		
		insertReservationVO.setmNo(mNo);
		insertReservationVO.setcNo(cals);
		insertReservationVO.setrDate(resTime);
		insertReservationVO.setPeople(people);
		insertReservationVO.seteNo(eNo);
		insertReservationVO.setRqMemo(rContent);
		insertReservationVO.setpAmount(point);
		
		int result = new ReservationService().insertReservation(insertReservationVO);
		
		String page = "";
		if(result > 0) {
			page = "views/payment/paymentSuccess.jsp";
		} else {
			
		}
		response.sendRedirect(page);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
