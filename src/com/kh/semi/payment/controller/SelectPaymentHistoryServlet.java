package com.kh.semi.payment.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.semi.payment.model.service.ReservationService;
import com.kh.semi.payment.model.vo.PaymentHistoryVO;

@WebServlet("/selectPay.na")
public class SelectPaymentHistoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public SelectPaymentHistoryServlet() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String rNo = request.getParameter("rNo");
		
		PaymentHistoryVO paymentHistoryVO = new ReservationService().selectPayment(rNo);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(paymentHistoryVO, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
