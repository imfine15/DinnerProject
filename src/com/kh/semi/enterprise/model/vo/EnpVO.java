package com.kh.semi.enterprise.model.vo;

public class EnpVO implements java.io.Serializable{
	
	private String enpNo;
	private String enpRegisterNo;
	private String partnerCode;
	private int penaltyCount;
	private String partnerId;
	private String partnerPwd;
	private String partnerEmail;
	private String partnerName;
	private String accountHolder;
	private String bank;
	private String bankAccount;
	private int depositLowerLimit;
	private int depositHigherLimit;
	private String signupApproval;
	private String enpName;
	private String enpPhone;
	private String enpAddress;
	private String enpHour;
	private String enpType;
	private String enpStatus;
	private String enpPartnerType;
	private String hashTags;
	private String juminNo;
	private String enpLicense;
	
	public EnpVO() {
		// TODO Auto-generated constructor stub
	}

	public EnpVO(String enpNo, String enpRegisterNo, String partnerCode, int penaltyCount, String partnerId,
			String partnerPwd, String partnerEmail, String partnerName, String accountHolder, String bank,
			String bankAccount, int depositLowerLimit, int depositHigherLimit, String signupApproval, String enpName,
			String enpPhone, String enpAddress, String enpHour, String enpType, String enpStatus, String enpPartnerType,
			String hashTags, String juminNo, String enpLicense) {
		super();
		this.enpNo = enpNo;
		this.enpRegisterNo = enpRegisterNo;
		this.partnerCode = partnerCode;
		this.penaltyCount = penaltyCount;
		this.partnerId = partnerId;
		this.partnerPwd = partnerPwd;
		this.partnerEmail = partnerEmail;
		this.partnerName = partnerName;
		this.accountHolder = accountHolder;
		this.bank = bank;
		this.bankAccount = bankAccount;
		this.depositLowerLimit = depositLowerLimit;
		this.depositHigherLimit = depositHigherLimit;
		this.signupApproval = signupApproval;
		this.enpName = enpName;
		this.enpPhone = enpPhone;
		this.enpAddress = enpAddress;
		this.enpHour = enpHour;
		this.enpType = enpType;
		this.enpStatus = enpStatus;
		this.enpPartnerType = enpPartnerType;
		this.hashTags = hashTags;
		this.juminNo = juminNo;
		this.enpLicense = enpLicense;
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

	public String getPartnerPwd() {
		return partnerPwd;
	}

	public void setPartnerPwd(String partnerPwd) {
		this.partnerPwd = partnerPwd;
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

	public String getBankAccount() {
		return bankAccount;
	}

	public void setBankAccount(String bankAccount) {
		this.bankAccount = bankAccount;
	}

	public int getDepositLowerLimit() {
		return depositLowerLimit;
	}

	public void setDepositLowerLimit(int depositLowerLimit) {
		this.depositLowerLimit = depositLowerLimit;
	}

	public int getDepositHigherLimit() {
		return depositHigherLimit;
	}

	public void setDepositHigherLimit(int depositHigherLimit) {
		this.depositHigherLimit = depositHigherLimit;
	}

	public String getSignupApproval() {
		return signupApproval;
	}

	public void setSignupApproval(String signupApproval) {
		this.signupApproval = signupApproval;
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

	public String getHashTags() {
		return hashTags;
	}

	public void setHashTags(String hashTags) {
		this.hashTags = hashTags;
	}

	public String getJuminNo() {
		return juminNo;
	}

	public void setJuminNo(String juminNo) {
		this.juminNo = juminNo;
	}

	public String getEnpLicense() {
		return enpLicense;
	}

	public void setEnpLicense(String enpLicense) {
		this.enpLicense = enpLicense;
	}

	@Override
	public String toString() {
		return "EnpVO [enpNo=" + enpNo + ", enpRegisterNo=" + enpRegisterNo + ", partnerCode=" + partnerCode
				+ ", penaltyCount=" + penaltyCount + ", partnerId=" + partnerId + ", partnerPwd=" + partnerPwd
				+ ", partnerEmail=" + partnerEmail + ", partnerName=" + partnerName + ", accountHolder=" + accountHolder
				+ ", bank=" + bank + ", bankAccount=" + bankAccount + ", depositLowerLimit=" + depositLowerLimit
				+ ", depositHigherLimit=" + depositHigherLimit + ", signupApproval=" + signupApproval + ", enpName="
				+ enpName + ", enpPhone=" + enpPhone + ", enpAddress=" + enpAddress + ", enpHour=" + enpHour
				+ ", enpType=" + enpType + ", enpStatus=" + enpStatus + ", enpPartnerType=" + enpPartnerType
				+ ", hashTags=" + hashTags + ", juminNo=" + juminNo + ", enpLicense=" + enpLicense + "]";
	}
	
	
	
	
	
	
	
	
	

}
