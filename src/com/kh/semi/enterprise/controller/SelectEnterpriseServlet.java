package com.kh.semi.enterprise.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.enterprise.model.service.EnpService;
import com.kh.semi.enterprise.model.vo.EnpVO;
import com.kh.semi.search.model.service.SearchService;

@WebServlet("/selectEnp.en")
public class SelectEnterpriseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectEnterpriseServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String enpNo = request.getParameter("enpNo");
		EnpVO selectedEnp = new EnpService().selectEnp(enpNo);
		EnpVO selectedEnpWithRating = new SearchService().getRating(selectedEnp);
		
		request.getSession().setAttribute("selectedEnp", selectedEnpWithRating);
		
		request.getRequestDispatcher("/getEnpReviews.re").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
