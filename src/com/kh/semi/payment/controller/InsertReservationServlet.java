package com.kh.semi.payment.controller;

import java.io.IOException;
import java.util.Calendar;
import java.sql.Date;
import java.text.DateFormat;
import java.text.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.glass.ui.Pixels.Format;

/**
 * Servlet implementation class InsertReservationServlet
 */
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
		System.out.println(123123);
		
		Calendar cal = Calendar.getInstance();
		cal.set(year, month, day, hour, min);
		cal.set(Calendar.MILLISECOND, 0);
		Date resTime = (Date) cal.getTime();
		
		System.out.println(mNo);
		System.out.println(cals);
		System.out.println(year);
		System.out.println(month);
		System.out.println(day);
		System.out.println(hour);
		System.out.println(min);
		System.out.println(adult);
		System.out.println(child);
		System.out.println(eNo);
		
		
		
		
		System.out.println(resTime);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
