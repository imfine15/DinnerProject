package com.kh.semi.payment.model.vo;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDateTime;

public class ReservationVO implements java.io.Serializable{
	private String rNo;
	private Timestamp rDate;
	private String mNo;
	private String eNo;
	private String cNo;
	private String rqMemo;
	private int pAmount;
	private int people;
	private Timestamp sysDate;
	private int deposit;
	private Date rDate2;
	private String rDate3;
		
	public ReservationVO() {}

	public ReservationVO(String rNo, Timestamp rDate, String mNo, String eNo, String cNo, String rqMemo, int pAmount,
			int people, Timestamp sysDate, int deposit, Date rDate2, String rDate3) {
		super();
		this.rNo = rNo;
		this.rDate = rDate;
		this.mNo = mNo;
		this.eNo = eNo;
		this.cNo = cNo;
		this.rqMemo = rqMemo;
		this.pAmount = pAmount;
		this.people = people;
		this.sysDate = sysDate;
		this.deposit = deposit;
		this.rDate2 = rDate2;
		this.rDate3 = rDate3;
	}

	public String getrDate3() {
		return rDate3;
	}

	public void setrDate3(String rDate3) {
		this.rDate3 = rDate3;
	}

	public Date getrDate2() {
		return rDate2;
	}

	public void setrDate2(Date rDate2) {
		this.rDate2 = rDate2;
	}

	public String getrNo() {
		return rNo;
	}

	public void setrNo(String rNo) {
		this.rNo = rNo;
	}

	public Timestamp getrDate() {
		return rDate;
	}

	public void setrDate(Timestamp rDate) {
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

	public int getpAmount() {
		return pAmount;
	}

	public void setpAmount(int pAmount) {
		this.pAmount = pAmount;
	}

	public int getPeople() {
		return people;
	}

	public void setPeople(int people) {
		this.people = people;
	}

	public Timestamp getSysDate() {
		return sysDate;
	}

	public void setSysDate(Timestamp sysDate) {
		this.sysDate = sysDate;
	}

	public int getDeposit() {
		return deposit;
	}

	public void setDeposit(int deposit) {
		this.deposit = deposit;
	}

	@Override
	public String toString() {
		return "ReservationVO [rNo=" + rNo + ", rDate=" + rDate + ", mNo=" + mNo + ", eNo=" + eNo + ", cNo=" + cNo
				+ ", rqMemo=" + rqMemo + ", pAmount=" + pAmount + ", people=" + people + ", sysDate=" + sysDate
				+ ", deposit=" + deposit + "]";
	}
	
	
}
