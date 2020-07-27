package com.kh.semi.payment.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.time.LocalDateTime;
import java.text.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.semi.member.model.vo.MemberVO;
import com.kh.semi.payment.model.service.ReservationService;
import com.kh.semi.payment.model.vo.PaymentHistoryVO;
import com.kh.semi.payment.model.vo.PointVO;
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
		
		String muid = request.getParameter("muid");
		String payprice = request.getParameter("payprice");
		
		int year = Integer.parseInt(request.getParameter("year"));
		int month = Integer.parseInt(request.getParameter("month"));
		int day = Integer.parseInt(request.getParameter("day"));
		int hour = Integer.parseInt(request.getParameter("hour"));
		int min = Integer.parseInt(request.getParameter("min"));
		
		int adult = Integer.parseInt(request.getParameter("adult"));
		int child = Integer.parseInt(request.getParameter("child"));
		
		String eNo = request.getParameter("enpNo");
		String rContent = request.getParameter("rcontent");
		int point = Integer.parseInt(request.getParameter("point"));
		int deposit = Integer.parseInt(request.getParameter("deposit"));
		
		LocalDateTime ofDateTime = LocalDateTime.of(year, month, day, hour, min);
		Calendar cal = Calendar.getInstance();
		cal.set(year, month - 1, day, hour, min);
		
		Date resTime = new Date(cal.getTime().getTime());
		ReservationVO insertReservationVO = new ReservationVO();
		int people = adult + child;
		
		insertReservationVO.setmNo(mNo);
		insertReservationVO.setcNo(cals);
		insertReservationVO.setrDate(new Timestamp(resTime.getTime()));
		insertReservationVO.setPeople(people);
		insertReservationVO.seteNo(eNo);
		insertReservationVO.setRqMemo(rContent);
		insertReservationVO.setpAmount(point);
		insertReservationVO.setDeposit(deposit);
		
		int result = new ReservationService().insertReservation(insertReservationVO);
		PaymentHistoryVO payHistoryVO = new PaymentHistoryVO();
		
		payHistoryVO.setPayPrice(deposit);
		payHistoryVO.setpDate(insertReservationVO.getrDate());
		payHistoryVO.setmNo(mNo);
		payHistoryVO.setpAmount(point);
		payHistoryVO.setpNo(muid);
		
		PointVO pointVO = new PointVO();
		pointVO.setmNo(mNo);
		pointVO.setpAmount(point);	
		
		String page = "";
		
		if(result > 0) {
			int result2 = new ReservationService().insertReservationHistory(insertReservationVO);
			int result3 = new ReservationService().insertPaymentHistory(payHistoryVO);
			int result4 = 0;
			if(point > 0) {
				pointVO.setSaveStatue("사용");
				result4 = new ReservationService().insertPointUseHistory(pointVO);
			} else {
				pointVO.setSaveCode("ST2");
				pointVO.setSaveStatue("적립");
				result4 = new ReservationService().insertPointGiveHistory(pointVO);
			}
			//int result4 = new ReservationService().insertReservationPoint()
			if(result2 > 0 && result3 > 0 && result4 > 0) {
				page = "views/payment/paymentSuccess.jsp";
			}
		} else {
			
		}
		response.sendRedirect(page);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
