package com.kh.semi.payment.model.vo;

import java.sql.Timestamp;

public class ReservationHistoryVO implements java.io.Serializable{
	private String rhNo;
	private String rNo;
	private int people;
	private String sCode;
	private Timestamp rDate;
	private int deposit;
	private String mNo;
	
	public ReservationHistoryVO() {}

	public ReservationHistoryVO(String rhNo, String rNo, int people, String sCode, Timestamp rDate, int deposit,
			String mNo) {
		super();
		this.rhNo = rhNo;
		this.rNo = rNo;
		this.people = people;
		this.sCode = sCode;
		this.rDate = rDate;
		this.deposit = deposit;
		this.mNo = mNo;
	}

	public String getRhNo() {
		return rhNo;
	}

	public void setRhNo(String rhNo) {
		this.rhNo = rhNo;
	}

	public String getrNo() {
		return rNo;
	}

	public void setrNo(String rNo) {
		this.rNo = rNo;
	}

	public int getPeople() {
		return people;
	}

	public void setPeople(int people) {
		this.people = people;
	}

	public String getsCode() {
		return sCode;
	}

	public void setsCode(String sCode) {
		this.sCode = sCode;
	}

	public Timestamp getrDate() {
		return rDate;
	}

	public void setrDate(Timestamp rDate) {
		this.rDate = rDate;
	}

	public int getDeposit() {
		return deposit;
	}

	public void setDeposit(int deposit) {
		this.deposit = deposit;
	}

	public String getmNo() {
		return mNo;
	}

	public void setmNo(String mNo) {
		this.mNo = mNo;
	}

	@Override
	public String toString() {
		return "ReservationHistoryVO [rhNo=" + rhNo + ", rNo=" + rNo + ", people=" + people + ", sCode=" + sCode
				+ ", rDate=" + rDate + ", deposit=" + deposit + ", mNo=" + mNo + "]";
	}
	
}



