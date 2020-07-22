package com.kh.semi.payment.model.vo;

import java.sql.Timestamp;

public class PointVO implements java.io.Serializable{
	private String mNo;
	private String saveCode;
	private String saveStatue; //적립인지 사용인지
	private Timestamp pointDate;
	private Timestamp deleteDate;
	private int pAmount;
	
	public PointVO() {}

	public PointVO(String mNo, String saveCode, String saveStatue, Timestamp pointDate, Timestamp deleteDate,
			int pAmount) {
		super();
		this.mNo = mNo;
		this.saveCode = saveCode;
		this.saveStatue = saveStatue;
		this.pointDate = pointDate;
		this.deleteDate = deleteDate;
		this.pAmount = pAmount;
	}

	public String getmNo() {
		return mNo;
	}

	public void setmNo(String mNo) {
		this.mNo = mNo;
	}

	public String getSaveCode() {
		return saveCode;
	}

	public void setSaveCode(String saveCode) {
		this.saveCode = saveCode;
	}

	public String getSaveStatue() {
		return saveStatue;
	}

	public void setSaveStatue(String saveStatue) {
		this.saveStatue = saveStatue;
	}

	public Timestamp getPointDate() {
		return pointDate;
	}

	public void setPointDate(Timestamp pointDate) {
		this.pointDate = pointDate;
	}

	public Timestamp getDeleteDate() {
		return deleteDate;
	}

	public void setDeleteDate(Timestamp deleteDate) {
		this.deleteDate = deleteDate;
	}

	public int getpAmount() {
		return pAmount;
	}

	public void setpAmount(int pAmount) {
		this.pAmount = pAmount;
	}

	@Override
	public String toString() {
		return "PointVO [mNo=" + mNo + ", saveCode=" + saveCode + ", saveStatue=" + saveStatue + ", pointDate="
				+ pointDate + ", deleteDate=" + deleteDate + ", pAmount=" + pAmount + "]";
	}
	
	
}