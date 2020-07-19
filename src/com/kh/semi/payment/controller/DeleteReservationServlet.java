package com.kh.semi.payment.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.payment.model.service.ReservationService;

@WebServlet("/deleteReser.me")
public class DeleteReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DeleteReservationServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String rNo = request.getParameter("rNo");
		String mNo = request.getParameter("mNo");
		System.out.println(rNo);
		System.out.println(mNo);
		
		int result = new ReservationService().deleteReserInfo(rNo, mNo);
				
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
