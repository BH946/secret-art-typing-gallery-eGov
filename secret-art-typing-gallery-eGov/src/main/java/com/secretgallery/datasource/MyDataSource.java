package com.secretgallery.datasource;

import javax.annotation.PostConstruct;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Data
public class MyDataSource {
	private int pageUnit;
	private int pageSize;
	private String imgPath;
	// 생성자
	public MyDataSource(int pageUnit, int pageSize, String imgPath) {
		this.pageUnit = pageUnit;
		this.pageSize = pageSize;
		this.imgPath = imgPath;
	}
//
	@PostConstruct // 로딩완료 후 바로 실행
	public void init() {
		log.info("init: pageUnit={}, pageSize={}, imgPath={}", pageUnit, pageSize, imgPath);
	}
}
