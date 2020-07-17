package com.kh.semi.enterprise.model.vo;

import java.sql.Date;

//enterprise ConfirmReqeust.jsp용 VO
public class ForEntCrVO {
	private String nickName; 
	private Date reservationDate;
	private int visitCount;
	private int cancelCount;
	private int noShowCount;
	private int rownum;
	
	public ForEntCrVO() {
		// TODO Auto-generated constructor stub
	}
	
	public ForEntCrVO(String nickName, Date reservationDate, int visitCount, int cancelCount, int noShowCount, int rownum) {
		super();
		this.nickName = nickName;
		this.reservationDate = reservationDate;
		this.visitCount = visitCount;
		this.cancelCount = cancelCount;
		this.noShowCount = noShowCount;
		this.rownum = rownum;
	}

	public int getRownum() {
		return rownum;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public Date getReservationDate() {
		return reservationDate;
	}

	public void setReservationDate(Date reservationDate) {
		this.reservationDate = reservationDate;
	}

	public int getVisitCount() {
		return visitCount;
	}

	public void setVisitCount(int visitCount) {
		this.visitCount = visitCount;
	}

	public int getCancelCount() {
		return cancelCount;
	}

	public void setCancelCount(int cancelCount) {
		this.cancelCount = cancelCount;
	}

	public int getNoShowCount() {
		return noShowCount;
	}

	public void setNoShowCount(int noShowCount) {
		this.noShowCount = noShowCount;
	}

	@Override
	public String toString() {
		return "ForEntCrVO [nickName=" + nickName + ", reservationDate=" + reservationDate + ", visitCount="
				+ visitCount + ", cancelCount=" + cancelCount + ", noShowCount=" + noShowCount + "rownum : " + rownum+"]";
	}
	
	
}
