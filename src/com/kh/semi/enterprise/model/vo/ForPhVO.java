package com.kh.semi.enterprise.model.vo;

public class ForPhVO implements java.io.Serializable{
	private String reservationNo;
	private int sum;
	private String calcNo;
	private String calcStatus;
	
	public ForPhVO() {
		// TODO Auto-generated constructor stub
	}

	public ForPhVO(String reservationNo, int sum, String calcNo, String calcStatus) {
		super();
		this.reservationNo = reservationNo;
		this.sum = sum;
		this.calcNo = calcNo;
		this.calcStatus = calcStatus;
	}

	public String getReservationNo() {
		return reservationNo;
	}

	public void setReservationNo(String reservationNo) {
		this.reservationNo = reservationNo;
	}

	public int getSum() {
		return sum;
	}

	public void setSum(int sum) {
		this.sum = sum;
	}

	public String getCalcNo() {
		return calcNo;
	}

	public void setCalcNo(String calcNo) {
		this.calcNo = calcNo;
	}

	public String getCalcStatus() {
		return calcStatus;
	}

	public void setCalcStatus(String calcStatus) {
		this.calcStatus = calcStatus;
	}

	@Override
	public String toString() {
		return "ForPhVO [reservationNo=" + reservationNo + ", sum=" + sum + ", calcNo=" + calcNo + ", calcStatus="
				+ calcStatus + "]";
	}

	
	
	

}
