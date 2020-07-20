package com.kh.semi.payment.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.constant.CardConstant;
import com.siot.IamportRestClient.response.*;
import org.junit.Before;
import org.junit.Test;

import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.request.escrow.EscrowLogisData;
import com.siot.IamportRestClient.request.escrow.EscrowLogisInvoiceData;
import com.siot.IamportRestClient.request.escrow.EscrowLogisPersonData;
import com.siot.IamportRestClient.response.escrow.EscrowLogisInvoice;
@WebServlet("/cancel.na")
public class CancelReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	IamportClient client = new IamportClient("6231776324951366", "TpIS8mJJE3SlLyHYZDz5WcM6pADhbqL4PtWYQGIuKBQv9xu8a3e6f1cFCQWNgIR6bO52vNwfpmLyUfH4");
    public CancelReservationServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uId = request.getParameter("merchant_uid");
		System.out.println(uId);
		testCancelPaymentAlreadyCancelledMerchantUid(uId);
		
		System.out.println("삭제 성공");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	public void testCancelPaymentAlreadyCancelledMerchantUid(String uId) {
		String test_already_cancelled_merchant_uid = uId;
		CancelData cancel_data = new CancelData(test_already_cancelled_merchant_uid, false); //merchant_uid를 통한 전액취소
		cancel_data.setEscrowConfirmed(true); //에스크로 구매확정 후 취소인 경우 true설정
		try {
			IamportResponse<Payment> payment_response = client.cancelPaymentByImpUid(cancel_data);
			
			assertNull(payment_response.getResponse()); // 이미 취소된 거래는 response가 null이다

			System.out.println(payment_response.getMessage());
		} catch (IamportResponseException e) {
			System.out.println(e.getMessage());
			
			switch(e.getHttpStatusCode()) {
			case 401 :
				//TODO
				break;
			case 500 :
				//TODO
				break;
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
}
