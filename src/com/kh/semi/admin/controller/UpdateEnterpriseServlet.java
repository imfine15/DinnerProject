package com.kh.semi.admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.semi.admin.model.service.AdminService;
import com.kh.semi.common.MyFileRenamePolicy;
import com.kh.semi.enterprise.model.service.EnpService;
import com.kh.semi.enterprise.model.vo.EnpAttachment;
import com.kh.semi.enterprise.model.vo.EnpUpVo;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class UpdateEnterpriseServlet
 */
@WebServlet("/updateEnt.up")
public class UpdateEnterpriseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateEnterpriseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(ServletFileUpload.isMultipartContent(request)) {
			HttpSession session = request.getSession();
			String changeName = (String)request.getAttribute("changeName");
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
			String enpNo = multiRequest.getParameter("enpNo");
			String enpName = multiRequest.getParameter("enpName");
			String enpAddress = multiRequest.getParameter("enpAddress");
			String enpPhone = multiRequest.getParameter("enpPhone");
			String enpPartnerType = multiRequest.getParameter("enpPartnerType");
			
			
			
			String menuName = multiRequest.getParameter("menuName");
			int menuPrice = Integer.parseInt(multiRequest.getParameter("menuPrice"));
			String priceRange = multiRequest.getParameter("priceRange");
			String enpHour = multiRequest.getParameter("enpHour");
			String closedDay = multiRequest.getParameter("closedDay");
			
			
			String website = multiRequest.getParameter("website");
			String hashTags = multiRequest.getParameter("hashTags");
			String introduce = multiRequest.getParameter("introduce");
			String parkingPossible = multiRequest.getParameter("parkingPossible");
			String enpType = multiRequest.getParameter("enpType");
			
		
			
			
			String enpStatus = multiRequest.getParameter("enpStatus");
			String uploadApproval = multiRequest.getParameter("uploadApproval");
			
		
		
			EnpUpVo enpUp = new EnpUpVo();
			enpUp.setEnpNo(enpNo);
			enpUp.setEnpName(enpName);
			enpUp.setEnpAddress(enpAddress);
			enpUp.setEnpPhone(enpPhone);
			enpUp.setEnpPartnerType(enpPartnerType);
			enpUp.setMenuName(menuName);
			enpUp.setMenuPrice(menuPrice);
			enpUp.setPriceRange(priceRange);
			enpUp.setEnpHour(enpHour);
			enpUp.setClosedDay(closedDay);
			enpUp.setWebsite(website);
			enpUp.setHashTags(hashTags);
			enpUp.setIntroduce(introduce);
			enpUp.setParkingPossible(parkingPossible);
			enpUp.setEnpType(enpType);
			enpUp.setEnpStatus(enpStatus);
			enpUp.setUploadApproval(uploadApproval);
			
			

			
			
			ArrayList<EnpAttachment> fileList = new ArrayList<>();
			EnpAttachment at = new EnpAttachment();
	         for(int i = originFiles.size() -1; i>= 0; i--) {
	            
	            at.setFilePath(savePath);
	            at.setOriginName(originFiles.get(i));
	            at.setChangeName(saveFiles.get(i));
	            
	            fileList.add(at);
	         }
	         
	         
	        
	         int result = new AdminService().updateEnterprise(enpUp, fileList);
	         
	         
	         fileList = new ArrayList<>();
	         EnpAttachment ea = new EnpAttachment();
	         for(int i = originFiles.size() -1; i>= 0; i--) {
	            
	            ea.setFilePath(savePath);
	            ea.setOriginName(originFiles.get(i));
	            ea.setChangeName(saveFiles.get(i));
	            
	            fileList.add(ea);
	         }
	         
	         
	         
	         String page = "";
	         if(result > 0) {
	        	 page="views/admin/restaurant/restaurantUploadDetail.jsp";
	        	 session.setAttribute("enpUp", enpUp);
	        	 request.setAttribute("fileList", fileList);
	        	 session.setAttribute("ea", ea);
	        	 
	        	 
	         } else {
	        	 for(int i = 0 ; i < saveFiles.size(); i++) {
	                 File failedFile = new File(savePath + saveFiles.get(i));
	                 
	                 failedFile.delete();
	              }
	              page = "views/common/errorPage.jsp";
	              request.setAttribute("msg", "사진 게시판 등록 실패");
	         }
	        response.sendRedirect(page);
	         
	         
	         
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
