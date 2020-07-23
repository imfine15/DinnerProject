package com.kh.semi.board.model.vo;

import java.util.Arrays;
import java.util.Date;

public class BoardUpVo implements java.io.Serializable {

	private String boardNo;
	private String boardTitle;
	private String memberNo;
	private String memberId;
	private String managerNo;
	private String boardKeyword;
	private String boardContent;
	private String boardCategory;
	private String enpNo;
	private int viewCount;
	private String hashTags;
	private String fileNo;
	private String originName;
	private String changeName;
	private String filePath;
	private Date uploadDate;
	private String replyNo;
	private Date replyDate;
	private String replyContent;
	private String address;
	
	public BoardUpVo() {}

	public BoardUpVo(String boardNo, String boardTitle, String memberNo, String memberId, String managerNo,
			String boardKeyword, String boardContent, String boardCategory, String enpNo, int viewCount,
			String hashTags, String fileNo, String originName, String changeName, String filePath, Date uploadDate,
			String replyNo, Date replyDate, String replyContent, String address) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.managerNo = managerNo;
		this.boardKeyword = boardKeyword;
		this.boardContent = boardContent;
		this.boardCategory = boardCategory;
		this.enpNo = enpNo;
		this.viewCount = viewCount;
		this.hashTags = hashTags;
		this.fileNo = fileNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.replyNo = replyNo;
		this.replyDate = replyDate;
		this.replyContent = replyContent;
		this.address = address;
	}

	public String getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(String boardNo) {
		this.boardNo = boardNo;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getManagerNo() {
		return managerNo;
	}

	public void setManagerNo(String managerNo) {
		this.managerNo = managerNo;
	}

	public String getBoardKeyword() {
		return boardKeyword;
	}

	public void setBoardKeyword(String boardKeyword) {
		this.boardKeyword = boardKeyword;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public String getBoardCategory() {
		return boardCategory;
	}

	public void setBoardCategory(String boardCategory) {
		this.boardCategory = boardCategory;
	}

	public String getEnpNo() {
		return enpNo;
	}

	public void setEnpNo(String enpNo) {
		this.enpNo = enpNo;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public String getHashTags() {
		return hashTags;
	}

	public void setHashTags(String hashTags) {
		this.hashTags = hashTags;
	}

	public String getFileNo() {
		return fileNo;
	}

	public void setFileNo(String fileNo) {
		this.fileNo = fileNo;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public String getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(String replyNo) {
		this.replyNo = replyNo;
	}

	public Date getReplyDate() {
		return replyDate;
	}

	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "BoardUpVo [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", memberNo=" + memberNo + ", memberId="
				+ memberId + ", managerNo=" + managerNo + ", boardKeyword=" + boardKeyword + ", boardContent="
				+ boardContent + ", boardCategory=" + boardCategory + ", enpNo=" + enpNo + ", viewCount=" + viewCount
				+ ", hashTags=" + hashTags + ", fileNo=" + fileNo + ", originName=" + originName + ", changeName="
				+ changeName + ", filePath=" + filePath + ", uploadDate=" + uploadDate + ", replyNo=" + replyNo
				+ ", replyDate=" + replyDate + ", replyContent=" + replyContent + ", address=" + address + "]";
	}
	
	
	
}
