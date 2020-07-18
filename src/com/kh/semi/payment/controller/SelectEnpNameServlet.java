package com.kh.semi.payment.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.semi.payment.model.service.ReservationService;

/**
 * Servlet implementation class SelectEnpNameServlet
 */
@WebServlet("/selectEnp.na")
public class SelectEnpNameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SelectEnpNameServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String eNo = request.getParameter("eNo");
		
		String rName = new ReservationService().selectEnpName(eNo);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(rName, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
