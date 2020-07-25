package com.kh.semi.manager.model.vo;

public class ManagerVo {
	
	private String managerNo;
	private String jobCode;
	private String deptCode;
	private String managerName;
	private String managerPhone;
	private String managerEmail;
	private String managerStatus;
	private String managerId;
	private String managerPwd;
	private String jobName;
	private String deptTitle;
	
	public ManagerVo() {}

	public ManagerVo(String managerNo, String jobCode, String deptCode, String managerName, String managerPhone,
			String managerEmail, String managerStatus, String managerId, String managerPwd, String jobName,
			String deptTitle) {
		super();
		this.managerNo = managerNo;
		this.jobCode = jobCode;
		this.deptCode = deptCode;
		this.managerName = managerName;
		this.managerPhone = managerPhone;
		this.managerEmail = managerEmail;
		this.managerStatus = managerStatus;
		this.managerId = managerId;
		this.managerPwd = managerPwd;
		this.jobName = jobName;
		this.deptTitle = deptTitle;
	}

	public String getManagerNo() {
		return managerNo;
	}

	public void setManagerNo(String managerNo) {
		this.managerNo = managerNo;
	}

	public String getJobCode() {
		return jobCode;
	}

	public void setJobCode(String jobCode) {
		this.jobCode = jobCode;
	}

	public String getDeptCode() {
		return deptCode;
	}

	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}

	public String getManagerName() {
		return managerName;
	}

	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}

	public String getManagerPhone() {
		return managerPhone;
	}

	public void setManagerPhone(String managerPhone) {
		this.managerPhone = managerPhone;
	}

	public String getManagerEmail() {
		return managerEmail;
	}

	public void setManagerEmail(String managerEmail) {
		this.managerEmail = managerEmail;
	}

	public String getManagerStatus() {
		return managerStatus;
	}

	public void setManagerStatus(String managerStatus) {
		this.managerStatus = managerStatus;
	}

	public String getManagerId() {
		return managerId;
	}

	public void setManagerId(String managerId) {
		this.managerId = managerId;
	}

	public String getManagerPwd() {
		return managerPwd;
	}

	public void setManagerPwd(String managerPwd) {
		this.managerPwd = managerPwd;
	}

	public String getJobName() {
		return jobName;
	}

	public void setJobName(String jobName) {
		this.jobName = jobName;
	}

	public String getDeptTitle() {
		return deptTitle;
	}

	public void setDeptTitle(String deptTitle) {
		this.deptTitle = deptTitle;
	}

	@Override
	public String toString() {
		return "ManagerVo [managerNo=" + managerNo + ", jobCode=" + jobCode + ", deptCode=" + deptCode
				+ ", managerName=" + managerName + ", managerPhone=" + managerPhone + ", managerEmail=" + managerEmail
				+ ", managerStatus=" + managerStatus + ", managerId=" + managerId + ", managerPwd=" + managerPwd
				+ ", jobName=" + jobName + ", deptTitle=" + deptTitle + "]";
	}
	
	
	
}
