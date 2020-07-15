package com.kh.semi.enterprise.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.activation.DataHandler;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.soap.SOAPException;
import javax.xml.soap.SOAPMessage;
import javax.xml.transform.Source;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.semi.common.MyFileRenamePolicy;
import com.kh.semi.enterprise.model.service.EnpService;
import com.kh.semi.enterprise.model.vo.EnpAttachment;
import com.kh.semi.enterprise.model.vo.EnpUpVo;
import com.oreilly.servlet.MultipartRequest;


/**
 * Servlet implementation class InsertEnterpriseServlet
 */
@WebServlet("/insert.up")
public class InsertEnterpriseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertEnterpriseServlet() {
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
			
			
			EnpUpVo enpUp = new EnpUpVo();
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
			
			
			ArrayList<EnpAttachment> fileList = new ArrayList<>();
	         for(int i = originFiles.size() -1; i>= 0; i--) {
	            EnpAttachment at = new EnpAttachment();
	            
	            at.setFilePath(savePath);
	            at.setOriginName(originFiles.get(i));
	            at.setChangeName(saveFiles.get(i));
	            
	            
	            
	            fileList.add(at);
	         }
	        
	         int result = new EnpService().insertEnterprise(enpUp, fileList);
	         String page = "";
	         if(result > 0) {
	        	 page="views/upload/foodSuccess.jsp";
	        	 request.setAttribute("enpUp", enpUp);
	        	 request.setAttribute("fileList", fileList);
	         } else {
	        	 for(int i = 0 ; i < saveFiles.size(); i++) {
	                 File failedFile = new File(savePath + saveFiles.get(i));
	                 
	                 failedFile.delete();
	              }
	              page = "views/common/errorPage.jsp";
	              request.setAttribute("msg", "사진 게시판 등록 실패");
	         }
	         request.getRequestDispatcher(page).forward(request, response);
	         
	         
	         
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
