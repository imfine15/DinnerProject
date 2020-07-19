package com.kh.semi.payment.model.vo;

import java.sql.Timestamp;

public class PaymentHistoryVO {
	private String hNo;
	private int payPrice;
	private Timestamp pDate;
	private String mNo;
	private int pAmount;
	private String rNo;
	private String status;
	private String pNo; 
	
	public PaymentHistoryVO() {}

	public PaymentHistoryVO(String hNo, int payPrice, Timestamp pDate, String mNo, int pAmount, String rNo,
			String status, String pNo) {
		super();
		this.hNo = hNo;
		this.payPrice = payPrice;
		this.pDate = pDate;
		this.mNo = mNo;
		this.pAmount = pAmount;
		this.rNo = rNo;
		this.status = status;
		this.pNo = pNo;
	}

	public String gethNo() {
		return hNo;
	}

	public void sethNo(String hNo) {
		this.hNo = hNo;
	}

	public int getPayPrice() {
		return payPrice;
	}

	public void setPayPrice(int payPrice) {
		this.payPrice = payPrice;
	}

	public Timestamp getpDate() {
		return pDate;
	}

	public void setpDate(Timestamp pDate) {
		this.pDate = pDate;
	}

	public String getmNo() {
		return mNo;
	}

	public void setmNo(String mNo) {
		this.mNo = mNo;
	}

	public int getpAmount() {
		return pAmount;
	}

	public void setpAmount(int pAmount) {
		this.pAmount = pAmount;
	}

	public String getrNo() {
		return rNo;
	}

	public void setrNo(String rNo) {
		this.rNo = rNo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getpNo() {
		return pNo;
	}

	public void setpNo(String pNo) {
		this.pNo = pNo;
	}

	@Override
	public String toString() {
		return "PaymentHistoryVO [hNo=" + hNo + ", payPrice=" + payPrice + ", pDate=" + pDate + ", mNo=" + mNo
				+ ", pAmount=" + pAmount + ", rNo=" + rNo + ", status=" + status + ", pNo=" + pNo + "]";
	}

	
}
