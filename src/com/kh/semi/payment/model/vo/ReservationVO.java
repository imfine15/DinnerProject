package com.kh.semi.payment.model.vo;

import java.sql.Date;

public class ReservationVO implements java.io.Serializable{
	private String rNo;
	private Date rDate;
	private String mNo;
	private String eNo;
	private String cNo;
	private String rqMemo;
	private String pAmount;
	
	public ReservationVO() {}

	public ReservationVO(String rNo, Date rDate, String mNo, String eNo, String cNo, String rqMemo, String pAmount) {
		super();
		this.rNo = rNo;
		this.rDate = rDate;
		this.mNo = mNo;
		this.eNo = eNo;
		this.cNo = cNo;
		this.rqMemo = rqMemo;
		this.pAmount = pAmount;
	}

	public String getrNo() {
		return rNo;
	}

	public void setrNo(String rNo) {
		this.rNo = rNo;
	}

	public Date getrDate() {
		return rDate;
	}

	public void setrDate(Date rDate) {
		this.rDate = rDate;
	}

	public String getmNo() {
		return mNo;
	}

	public void setmNo(String mNo) {
		this.mNo = mNo;
	}

	public String geteNo() {
		return eNo;
	}

	public void seteNo(String eNo) {
		this.eNo = eNo;
	}

	public String getcNo() {
		return cNo;
	}

	public void setcNo(String cNo) {
		this.cNo = cNo;
	}

	public String getRqMemo() {
		return rqMemo;
	}

	public void setRqMemo(String rqMemo) {
		this.rqMemo = rqMemo;
	}

	public String getpAmount() {
		return pAmount;
	}

	public void setpAmount(String pAmount) {
		this.pAmount = pAmount;
	}

	@Override
	public String toString() {
		return "ReservationVO [rNo=" + rNo + ", rDate=" + rDate + ", mNo=" + mNo + ", eNo=" + eNo + ", cNo=" + cNo
				+ ", rqMemo=" + rqMemo + ", pAmount=" + pAmount + "]";
	}
	
}
