package com.ssun.everybook.domain;

public class LibraryInput {
	private String region;
	private String region2;

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getRegion2() {
		return region2;
	}

	public void setRegion2(String region2) {
		this.region2 = region2;
	}

	@Override
	public String toString() {
		return "LibraryInput [region=" + region + ", region2=" + region2 + "]";
	}

}
