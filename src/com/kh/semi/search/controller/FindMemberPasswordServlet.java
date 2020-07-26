package com.kh.semi.search.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.semi.search.model.service.SearchService;

@WebServlet("/findPwd.se")
public class FindMemberPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FindMemberPasswordServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestId = request.getParameter("requestId");
		String requestName = request.getParameter("requestName");
		String requestEmail = request.getParameter("requestEmail");
		String[] datas = {requestId, requestName, requestEmail};
		
		int check = new SearchService().checkMemberPwd(datas);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		
		new Gson().toJson(check, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
