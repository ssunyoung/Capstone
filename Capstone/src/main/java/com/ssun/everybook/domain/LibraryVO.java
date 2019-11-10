package com.ssun.everybook.domain;

public class LibraryVO {

	private String libCode;
	private String libName;
	private String libAddr;

	public String getLibCode() {
		return libCode;
	}

	public void setLibCode(String libCode) {
		this.libCode = libCode;
	}

	public String getLibName() {
		return libName;
	}

	public void setLibName(String libName) {
		this.libName = libName;
	}

	public String getLibAddr() {
		return libAddr;
	}

	public void setLibAddr(String libAddr) {
		this.libAddr = libAddr;
	}

	@Override
	public String toString() {
		return "libraryVO [libCode=" + libCode + ", libName=" + libName + ", libAddr=" + libAddr + "]";
	}

}
