package com.kh.semi.search.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.semi.search.model.service.SearchService;

@WebServlet("/findId.se")
public class FindMemberIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FindMemberIdServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestName = request.getParameter("requestName");
		String requestEmail = request.getParameter("requestEmail");
		
		String responseId = new SearchService().findId(requestName, requestEmail);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		new Gson().toJson(responseId, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
