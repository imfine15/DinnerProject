package com.kh.semi.enterprise.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.enterprise.model.service.EnpService;

@WebServlet("/getEnpFile.en")
public class GetEnpFileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GetEnpFileServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String enpNo = request.getParameter("enpNo");
		
		String filePath = new EnpService().getEnpFile(enpNo);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
