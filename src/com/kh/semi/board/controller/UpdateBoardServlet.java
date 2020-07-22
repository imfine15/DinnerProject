package com.kh.semi.board.controller;

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
import com.kh.semi.board.model.service.BoardService;
import com.kh.semi.board.model.vo.BoardUpVo;
import com.kh.semi.common.MyFileRenamePolicy;
import com.kh.semi.enterprise.model.vo.EnpAttachment;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class UpdateBoardServlet
 */
@WebServlet("/updateBoard.bo")
public class UpdateBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateBoardServlet() {
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
			
			System.out.println("file : " + file.hasMoreElements());
			
			while(file.hasMoreElements()) {
				String name  = file.nextElement();
				System.out.println("name : " + name);
				saveFiles.add(multiRequest.getFilesystemName(name));
	            originFiles.add(multiRequest.getOriginalFileName(name));
	            
			}
		
		String boardNo = multiRequest.getParameter("boardNo");
		String boardTitle = multiRequest.getParameter("boardTitle");
		String hashtags = multiRequest.getParameter("hashtags");
		String[] content = multiRequest.getParameterValues("content"); 
		int count = Integer.parseInt(multiRequest.getParameter("count"));
		String[] originNameArr = multiRequest.getParameterValues("originName");
		String[] changeNameArr = multiRequest.getParameterValues("changeName");
		String filePath = multiRequest.getParameter("filePath");
		
		
		
		
		String boardContent = "";
		
		for(int i = 0; i <count;i++) {
			System.out.println("originName : " + originNameArr[i]);
			if(count-1 == i) {
				boardContent += content[i];
			} else {
				boardContent += content[i] + "$$$";
			}
		}
		
		
		
		BoardUpVo board = new BoardUpVo();
		board.setBoardTitle(boardTitle);
		board.setBoardNo(boardNo);
		board.setHashTags(hashtags);
		board.setBoardContent(boardContent);
		
		
		
		
		ArrayList<BoardUpVo> fileList = new ArrayList<>();
		BoardUpVo bf = new BoardUpVo();
		 for(int i = 0; i <count;i++) {
	            
        	 bf.setFilePath(filePath);
        	 bf.setOriginName(originNameArr[i]);
        	 bf.setChangeName(changeNameArr[i]);
            
            fileList.add(bf);
         }
         System.out.println("fileList : " + fileList);

         int result = new BoardService().updateBoard(board, fileList);
         
         
         fileList = new ArrayList<>();
        
         for(int i = 0; i <count;i++) {
	            
        	 bf.setFilePath(filePath);
        	 bf.setOriginName(originNameArr[i]);
        	 bf.setChangeName(changeNameArr[i]);
            
            fileList.add(bf);
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
