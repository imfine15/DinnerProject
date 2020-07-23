package com.kh.semi.review.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.semi.common.MyFileRenamePolicy;
import com.kh.semi.enterprise.model.service.EnpService;
import com.kh.semi.enterprise.model.vo.EnpAttachment;
import com.kh.semi.review.model.service.ReviewService;
import com.kh.semi.review.model.vo.ReviewAttachment;
import com.kh.semi.review.model.vo.ReviewVO;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class InsertReviewServlet
 */
@WebServlet("/insertReview.re")
public class InsertReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 1024 * 1024 * 10;
			
			String root = request.getSession().getServletContext().getRealPath("/");
			
			String savePath = root + "thumbnail_uploadFile/";
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			ArrayList<String> saveFiles = new ArrayList<>();
			
			ArrayList<String> originFiles = new ArrayList<>();
			
			Enumeration<String> file = multiRequest.getFileNames();
			
			while(file.hasMoreElements()) {
				String name  = file.nextElement();
				
				saveFiles.add(multiRequest.getFilesystemName(name));
	            originFiles.add(multiRequest.getOriginalFileName(name));
	            
			}
			
			
			String reviewContent = multiRequest.getParameter("reviewContent");
			String memberNo = multiRequest.getParameter("memberNo");
			String enpNo = multiRequest.getParameter("enpNo");
			double averageRating = Double.parseDouble(multiRequest.getParameter("averageRating"));
			String reservationHistoryNo = multiRequest.getParameter("reservationHistoryNo");
			String reviewType = multiRequest.getParameter("reviewType");
			
			ReviewVO review = new ReviewVO();
			review.setReviewContent(reviewContent);
			review.setMemberNo(memberNo);
			review.setEnpNo(enpNo);
			review.setAverageRating(averageRating);
			review.setReservationHistoryNo(reservationHistoryNo);
			review.setReviewType(reviewType);
			
			
			
//			System.out.println("reviewContent : " + reviewContent);
//			System.out.println("memberNo : " + memberNo);
//			System.out.println("enpNo : " + enpNo);
//			System.out.println("averageRating : " + averageRating);
//			System.out.println("reservationHistoryNo : " + reservationHistoryNo);
			
			
			ArrayList<ReviewAttachment> fileList = new ArrayList<>();
	         for(int i = originFiles.size() -1; i>= 0; i--) {
	        	 ReviewAttachment ra = new ReviewAttachment();
	            
	        	 ra.setFilePath(savePath);
	        	 ra.setOriginName(originFiles.get(i));
	        	 ra.setChangeName(saveFiles.get(i));
	            
	            
	            
	            fileList.add(ra);
	         }
	        
	         int result = new ReviewService().insertReview(review, fileList);
	         
	         for(int i = originFiles.size() -1; i>= 0; i--) {
	        	 ReviewAttachment ra = new ReviewAttachment();
	            
	        	 ra.setFilePath(savePath);
	        	 ra.setOriginName(originFiles.get(i));
	        	 ra.setChangeName(saveFiles.get(i));
	            
	            
	            
	            fileList.add(ra);
	         }
	         
//	         
//	         String page = "";
//	         if(result > 0) {
//	        	 page="";
//	        	 
//	        	 
//	         } else {
//	        	 for(int i = 0 ; i < saveFiles.size(); i++) {
//	                 File failedFile = new File(savePath + saveFiles.get(i));
//	                 
//	                 failedFile.delete();
//	              }
//	              page = "views/common/errorPage.jsp";
//	              request.setAttribute("msg", "사진 게시판 등록 실패");
//	         }
//	        response.sendRedirect(page);
//	         
	         
	         
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
