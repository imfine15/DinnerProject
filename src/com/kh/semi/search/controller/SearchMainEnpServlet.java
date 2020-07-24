package com.kh.semi.search.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.enterprise.model.service.EnpService;
import com.kh.semi.enterprise.model.vo.EnpVO;
import com.kh.semi.review.model.service.ReviewService;
import com.kh.semi.review.model.vo.ReviewVO;

@WebServlet("/selectMainEnp.en")
public class SearchMainEnpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public SearchMainEnpServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String enpNo = request.getParameter("enpNo");
		EnpVO selectedEnp = new EnpService().selectEnp(enpNo);
		double rating = 0;
		
		List<ReviewVO> visitReviews = new ReviewService().getSelectedEnpVisitReviews(enpNo);
		List<ReviewVO> normalReviews = new ReviewService().getSelectedEnpNormalReviews(enpNo);
		
		request.getSession().setAttribute("visitReviews", visitReviews);
		request.getSession().setAttribute("normalReviews", normalReviews);
		
		request.getSession().setAttribute("selectedEnp", selectedEnp);
		request.getSession().setAttribute("rating", rating);
		
		response.sendRedirect("views/restaurantInfo/restaurantInfo.jsp");
		//request.getRequestDispatcher("views/restaurantInfo/restaurantInfo.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
