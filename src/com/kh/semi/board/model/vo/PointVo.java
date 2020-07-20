package com.kh.semi.board.model.vo;

import java.util.Date;

public class PointVo implements java.io.Serializable {

	private String pointNo;
	private String memberNo;
	private String saveCode;
	private String saveStatus;
	private Date pointDate;
	private Date restPointExpireDate;
	private String menagerNo;
	private String pointHistoryNo;
	private int pointAmmont;
	private String pointStatus;
	private Date dealDate;
	
	
	public PointVo() {}
	
	
	public PointVo(String pointNo, String memberNo, String saveCode, String saveStatus, Date pointDate,
			Date restPointExpireDate, String menagerNo, String pointHistoryNo, int pointAmmont, String pointStatus,
			Date dealDate) {
		super();
		this.pointNo = pointNo;
		this.memberNo = memberNo;
		this.saveCode = saveCode;
		this.saveStatus = saveStatus;
		this.pointDate = pointDate;
		this.restPointExpireDate = restPointExpireDate;
		this.menagerNo = menagerNo;
		this.pointHistoryNo = pointHistoryNo;
		this.pointAmmont = pointAmmont;
		this.pointStatus = pointStatus;
		this.dealDate = dealDate;
	}


	public String getPointNo() {
		return pointNo;
	}


	public void setPointNo(String pointNo) {
		this.pointNo = pointNo;
	}


	public String getMemberNo() {
		return memberNo;
	}


	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}


	public String getSaveCode() {
		return saveCode;
	}


	public void setSaveCode(String saveCode) {
		this.saveCode = saveCode;
	}


	public String getSaveStatus() {
		return saveStatus;
	}


	public void setSaveStatus(String saveStatus) {
		this.saveStatus = saveStatus;
	}


	public Date getPointDate() {
		return pointDate;
	}


	public void setPointDate(Date pointDate) {
		this.pointDate = pointDate;
	}


	public Date getRestPointExpireDate() {
		return restPointExpireDate;
	}


	public void setRestPointExpireDate(Date restPointExpireDate) {
		this.restPointExpireDate = restPointExpireDate;
	}


	public String getMenagerNo() {
		return menagerNo;
	}


	public void setMenagerNo(String menagerNo) {
		this.menagerNo = menagerNo;
	}


	public String getPointHistoryNo() {
		return pointHistoryNo;
	}


	public void setPointHistoryNo(String pointHistoryNo) {
		this.pointHistoryNo = pointHistoryNo;
	}


	public int getPointAmmont() {
		return pointAmmont;
	}


	public void setPointAmmont(int pointAmmont) {
		this.pointAmmont = pointAmmont;
	}


	public String getPointStatus() {
		return pointStatus;
	}


	public void setPointStatus(String pointStatus) {
		this.pointStatus = pointStatus;
	}


	public Date getDealDate() {
		return dealDate;
	}


	public void setDealDate(Date dealDate) {
		this.dealDate = dealDate;
	}


	@Override
	public String toString() {
		return "PointVo [pointNo=" + pointNo + ", memberNo=" + memberNo + ", saveCode=" + saveCode + ", saveStatus="
				+ saveStatus + ", pointDate=" + pointDate + ", restPointExpireDate=" + restPointExpireDate
				+ ", menagerNo=" + menagerNo + ", pointHistoryNo=" + pointHistoryNo + ", pointAmmont=" + pointAmmont
				+ ", pointStatus=" + pointStatus + ", dealDate=" + dealDate + "]";
	}
	
	
	
	
	
	
}
