package com.secretgallery.config;

import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;

import com.secretgallery.datasource.MyDataSource;
import com.secretgallery.datasource.MyDataSourceProperties;

import lombok.extern.slf4j.Slf4j;

/**
 * <외부설정>
 * @EnableConfigurationProperties 로 MyDataSourceProperties 를 사용 및 스프링 빈
 * @Import 를 통해서 "컴포넌트 스캔 대상 꼭 지정하기!"
 */
@Slf4j
@EnableConfigurationProperties(MyDataSourceProperties.class)
public class MyDataSourceConfig {
    private final MyDataSourceProperties properties;
    public MyDataSourceConfig(MyDataSourceProperties properties) {
        this.properties = properties;
    }
//
    @Bean
    public MyDataSource getMyDataSource() {
        return new MyDataSource(
                properties.getPageUnit(), properties.getPageSize(), properties.getImgPath()
        );
    }
}