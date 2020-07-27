package com.kh.semi.enterprise.model.vo;

import java.util.Date;

public class PartnerEnpVO implements java.io.Serializable {
	
	private String enpNo;
	private String enpRegisterNo;
	private String partnerCode;
	private int penaltyCount;
	private String partnerId;
	private String partnerEmail;
	private String partnerName;
	private String accountHolder;
	private String bank;
	private int bankAccount;
	private String enpLicence;
	private String partnerType;
	private String visitService;
	private String productName;
	private String partnerPrice;
	private int reservationCount;
	private String enpName;
	private String enpPhone;
	private String enpAddress;
	private String enpHour;
	private String enpType;
	private String enpStatus;
	private String enpPartnerType;
	private String closedDay;
	private String website;
	private String introduce;
	private String parking;
	private Date contractStartDate;
	private Date ContractEndDate;
	private String contractNo;

	public PartnerEnpVO() {}

	public PartnerEnpVO(String enpNo, String enpRegisterNo, String partnerCode, int penaltyCount, String partnerId,
			String partnerEmail, String partnerName, String accountHolder, String bank, int bankAccount,
			String enpLicence, String partnerType, String visitService, String productName, String partnerPrice,
			int reservationCount, String enpName, String enpPhone, String enpAddress, String enpHour, String enpType,
			String enpStatus, String enpPartnerType, String closedDay, String website, String introduce, String parking,
			Date contractStartDate, Date contractEndDate, String contractNo) {
		super();
		this.enpNo = enpNo;
		this.enpRegisterNo = enpRegisterNo;
		this.partnerCode = partnerCode;
		this.penaltyCount = penaltyCount;
		this.partnerId = partnerId;
		this.partnerEmail = partnerEmail;
		this.partnerName = partnerName;
		this.accountHolder = accountHolder;
		this.bank = bank;
		this.bankAccount = bankAccount;
		this.enpLicence = enpLicence;
		this.partnerType = partnerType;
		this.visitService = visitService;
		this.productName = productName;
		this.partnerPrice = partnerPrice;
		this.reservationCount = reservationCount;
		this.enpName = enpName;
		this.enpPhone = enpPhone;
		this.enpAddress = enpAddress;
		this.enpHour = enpHour;
		this.enpType = enpType;
		this.enpStatus = enpStatus;
		this.enpPartnerType = enpPartnerType;
		this.closedDay = closedDay;
		this.website = website;
		this.introduce = introduce;
		this.parking = parking;
		this.contractStartDate = contractStartDate;
		ContractEndDate = contractEndDate;
		this.contractNo = contractNo;
	}

	public String getEnpNo() {
		return enpNo;
	}

	public void setEnpNo(String enpNo) {
		this.enpNo = enpNo;
	}

	public String getEnpRegisterNo() {
		return enpRegisterNo;
	}

	public void setEnpRegisterNo(String enpRegisterNo) {
		this.enpRegisterNo = enpRegisterNo;
	}

	public String getPartnerCode() {
		return partnerCode;
	}

	public void setPartnerCode(String partnerCode) {
		this.partnerCode = partnerCode;
	}

	public int getPenaltyCount() {
		return penaltyCount;
	}

	public void setPenaltyCount(int penaltyCount) {
		this.penaltyCount = penaltyCount;
	}

	public String getPartnerId() {
		return partnerId;
	}

	public void setPartnerId(String partnerId) {
		this.partnerId = partnerId;
	}

	public String getPartnerEmail() {
		return partnerEmail;
	}

	public void setPartnerEmail(String partnerEmail) {
		this.partnerEmail = partnerEmail;
	}

	public String getPartnerName() {
		return partnerName;
	}

	public void setPartnerName(String partnerName) {
		this.partnerName = partnerName;
	}

	public String getAccountHolder() {
		return accountHolder;
	}

	public void setAccountHolder(String accountHolder) {
		this.accountHolder = accountHolder;
	}

	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	public int getBankAccount() {
		return bankAccount;
	}

	public void setBankAccount(int bankAccount) {
		this.bankAccount = bankAccount;
	}

	public String getEnpLicence() {
		return enpLicence;
	}

	public void setEnpLicence(String enpLicence) {
		this.enpLicence = enpLicence;
	}

	public String getPartnerType() {
		return partnerType;
	}

	public void setPartnerType(String partnerType) {
		this.partnerType = partnerType;
	}

	public String getVisitService() {
		return visitService;
	}

	public void setVisitService(String visitService) {
		this.visitService = visitService;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getPartnerPrice() {
		return partnerPrice;
	}

	public void setPartnerPrice(String partnerPrice) {
		this.partnerPrice = partnerPrice;
	}

	public int getReservationCount() {
		return reservationCount;
	}

	public void setReservationCount(int reservationCount) {
		this.reservationCount = reservationCount;
	}

	public String getEnpName() {
		return enpName;
	}

	public void setEnpName(String enpName) {
		this.enpName = enpName;
	}

	public String getEnpPhone() {
		return enpPhone;
	}

	public void setEnpPhone(String enpPhone) {
		this.enpPhone = enpPhone;
	}

	public String getEnpAddress() {
		return enpAddress;
	}

	public void setEnpAddress(String enpAddress) {
		this.enpAddress = enpAddress;
	}

	public String getEnpHour() {
		return enpHour;
	}

	public void setEnpHour(String enpHour) {
		this.enpHour = enpHour;
	}

	public String getEnpType() {
		return enpType;
	}

	public void setEnpType(String enpType) {
		this.enpType = enpType;
	}

	public String getEnpStatus() {
		return enpStatus;
	}

	public void setEnpStatus(String enpStatus) {
		this.enpStatus = enpStatus;
	}

	public String getEnpPartnerType() {
		return enpPartnerType;
	}

	public void setEnpPartnerType(String enpPartnerType) {
		this.enpPartnerType = enpPartnerType;
	}

	public String getClosedDay() {
		return closedDay;
	}

	public void setClosedDay(String closedDay) {
		this.closedDay = closedDay;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public String getParking() {
		return parking;
	}

	public void setParking(String parking) {
		this.parking = parking;
	}

	public Date getContractStartDate() {
		return contractStartDate;
	}

	public void setContractStartDate(Date contractStartDate) {
		this.contractStartDate = contractStartDate;
	}

	public Date getContractEndDate() {
		return ContractEndDate;
	}

	public void setContractEndDate(Date contractEndDate) {
		ContractEndDate = contractEndDate;
	}

	public String getContractNo() {
		return contractNo;
	}

	public void setContractNo(String contractNo) {
		this.contractNo = contractNo;
	}

	@Override
	public String toString() {
		return "PartnerEnpVO [enpNo=" + enpNo + ", enpRegisterNo=" + enpRegisterNo + ", partnerCode=" + partnerCode
				+ ", penaltyCount=" + penaltyCount + ", partnerId=" + partnerId + ", partnerEmail=" + partnerEmail
				+ ", partnerName=" + partnerName + ", accountHolder=" + accountHolder + ", bank=" + bank
				+ ", bankAccount=" + bankAccount + ", enpLicence=" + enpLicence + ", partnerType=" + partnerType
				+ ", visitService=" + visitService + ", productName=" + productName + ", partnerPrice=" + partnerPrice
				+ ", reservationCount=" + reservationCount + ", enpName=" + enpName + ", enpPhone=" + enpPhone
				+ ", enpAddress=" + enpAddress + ", enpHour=" + enpHour + ", enpType=" + enpType + ", enpStatus="
				+ enpStatus + ", enpPartnerType=" + enpPartnerType + ", closedDay=" + closedDay + ", website=" + website
				+ ", introduce=" + introduce + ", parking=" + parking + ", contractStartDate=" + contractStartDate
				+ ", ContractEndDate=" + ContractEndDate + ", contractNo=" + contractNo + "]";
	}

}
