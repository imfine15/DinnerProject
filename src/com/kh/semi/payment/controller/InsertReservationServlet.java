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
		
		String mNo = request.getParameter("mNo");
		String cals = request.getParameter("cals");
		
		int year = Integer.parseInt(request.getParameter("year"));
		System.out.println("!23123");
		int month = Integer.parseInt(request.getParameter("month"));
		int day = Integer.parseInt(request.getParameter("day"));
		int hour = Integer.parseInt(request.getParameter("hour"));
		int min = Integer.parseInt(request.getParameter("min"));
		
		String adult = request.getParameter("adult");
		String child = request.getParameter("child");
		
		String eNo = "ENP1";
		String rContent = request.getParameter("rcontent");
		int point = Integer.parseInt(request.getParameter("point"));
		
		System.out.println(123123);
		
		SimpleDateFormat fotmatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Calendar cal = Calendar.getInstance();
		cal.set(year, month - 1, day, hour, min);
		String today = fotmatter.format(cal.getTime());
		Timestamp ts = Timestamp.valueOf(today);
		
		Date resTime = new Date(cal.getTime().getTime());
		ReservationVO insertReservationVO = new ReservationVO();
		int people = Integer.parseInt(adult + child);
		
		insertReservationVO.setcNo(mNo);
		insertReservationVO.setcNo(cals);
		insertReservationVO.setrDate(resTime);
		insertReservationVO.setPeople(people);
		insertReservationVO.seteNo(eNo);
		insertReservationVO.setRqMemo(rContent);
		insertReservationVO.setpAmount(point);
		
		int result = new ReservationService().insertReservation(insertReservationVO);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
