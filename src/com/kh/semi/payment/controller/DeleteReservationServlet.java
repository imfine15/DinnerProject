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
		String pNo = request.getParameter("pNo2");
		
		int result = new ReservationService().deleteReserInfo(rNo, mNo);
		int result2 = new ReservationService().deletePayInfo(rNo, mNo, pNo);
		
		String page = "";
		
		if(result > 0 && result2 > 0) {
			page = "/semiproject/views/payment/paymentCancel.jsp";
			System.out.println("통과입니다.");
		} else {
			System.out.println("불통과입니다.");
		}
		
		response.sendRedirect(page);
		System.out.println("완료입니다.");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
