package com.secretgallery.datasource;

import javax.validation.constraints.NotEmpty;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.validation.annotation.Validated;

import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

/**
 * <외부설정>
 * @ConfigurationProperties 로 application.properties 에 저장한 my.datasource 하위 내용
 * 가져와서 "자바 객체" 로 변환 + 검증까지
 */
@Slf4j
@Getter @Setter
@ConfigurationProperties("my.datasource")
//@Validated
public class MyDataSourceProperties {
//    @NotEmpty
    private int pageUnit;
    private int pageSize;
    private String imgPath;
    public MyDataSourceProperties() { // 기본 생성자
    	log.info("properties 기본생성자 TEST");
    }
    public MyDataSourceProperties(int pageUnit, int pageSize, String imgPath) {
    	log.info("properties 일반생성자 TEST");
        this.pageUnit = pageUnit;
        this.pageSize = pageSize;
        this.imgPath = imgPath;
    }
}