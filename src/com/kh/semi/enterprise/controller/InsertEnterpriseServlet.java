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
		String enpName = request.getParameter("enpName");
		String enpAddress = request.getParameter("enpAddress");
		String enpPhone = request.getParameter("enpPhone");
		String enpPartnerType = request.getParameter("enpPartnerType");
		String menuName = request.getParameter("menuName");
		int menuPrice = Integer.parseInt(request.getParameter("menuPrice"));
		String priceRange = request.getParameter("priceRange");
		String enpHour = request.getParameter("enpHour");
		String closedDay = request.getParameter("closedDay");
		String website = request.getParameter("website");
		String hashTags = request.getParameter("hashTags");
		String introduce = request.getParameter("inrtoduce");
		String parkingPossible = request.getParameter("parkingPossible");
		String enpType = request.getParameter("enpType");
		String enpStatus = request.getParameter("enpStatus");
		
		System.out.println("enpType : " + enpType);
		
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
	         System.out.println("fileList : "+fileList);
	         
	         int result = new EnpService().insertEnterprise(enpUp, fileList);
	         
	         if(result > 0) {
	        	 response.sendRedirect(request.getContextPath() + "");
	         } else {
	        	 for(int i = 0 ; i < saveFiles.size(); i++) {
	                 File failedFile = new File(savePath + saveFiles.get(i));
	                 
	                 failedFile.delete();
	              }
	              
	              request.setAttribute("msg", "사진 게시판 등록 실패");
	              request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
	         }
	         
	         
	         
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
