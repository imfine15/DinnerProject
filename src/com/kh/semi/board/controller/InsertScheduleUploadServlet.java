package com.kh.semi.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.semi.board.model.service.BoardService;
import com.kh.semi.board.model.vo.BoardUpVo;
import com.kh.semi.common.MyFileRenamePolicy;
import com.kh.semi.enterprise.model.service.EnpService;
import com.kh.semi.enterprise.model.vo.EnpAttachment;
import com.kh.semi.enterprise.model.vo.EnpUpVo;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class InsertScheduleUploadServlet
 */
@WebServlet("/insertSchedule.up")
public class InsertScheduleUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertScheduleUploadServlet() {
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
			
			
			String boardTitle = multiRequest.getParameter("boardTitle");
			String memberNo = multiRequest.getParameter("memberNo");
						
			String[] boardContents = multiRequest.getParameterValues("boardContent");
			
			
			String boardCategory = multiRequest.getParameter("boardCategory");
			String hashTags = multiRequest.getParameter("hashTags");
			
//			System.out.println("boardTitle : " + boardTitle);
//			System.out.println("memberNo : " + memberNo);
//			System.out.println("boardCategory : " + boardCategory);
//			System.out.println("hashTags : " + hashTags);
			
			
			BoardUpVo board = new BoardUpVo();
			
			String boardContent = "";
			for(int i = 0; i < boardContents.length; i++) {
				if(i == boardContents.length-1) {
					boardContent+=boardContents[i];
				} else {
					boardContent+=boardContents[i]+"$$$";
				}
			}
				board.setBoardContent(boardContent);
				board.setBoardTitle(boardTitle);
				board.setMemberNo(memberNo);
				board.setBoardCategory(boardCategory);
				board.setHashTags(hashTags);
				
				
			//System.out.println("board : " + board);
			
			ArrayList<BoardUpVo> fileList = new ArrayList<>();
	         for(int i = originFiles.size() -1; i>= 0; i--) {
	            
	            
	            board.setFilePath(savePath);
	            board.setOriginName(originFiles.get(i));
	            board.setChangeName(saveFiles.get(i));
	            
	            
	            
	            fileList.add(board);
	         }
	        // System.out.println("fileList : " + fileList);
	        
	         int result = new BoardService().insertBoard(board, fileList);
	         
	         String page = "";
	         
	         if(result > 0) {
	        	 page = "views/upload/scheduleSuccess.jsp";
	         } else {
	        	 for(int i = 0; i < saveFiles.size();i++) {
	        		 File failedFile = new File(savePath + saveFiles.get(i));
	        		 
	        		 failedFile.delete();
	        	 }
	        	 page="views/common/errorPage.jsp";
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
