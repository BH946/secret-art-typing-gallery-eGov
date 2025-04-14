package com.secretgallery;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.web.servlet.error.ErrorMvcAutoConfiguration;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Import;
import org.springframework.context.annotation.ImportResource;

import com.secretgallery.config.MyDataSourceConfig;

@Import(MyDataSourceConfig.class) // 해당 파일 컴포넌트 스캔 필수
@SpringBootApplication
@ImportResource("classpath:/spring/*.xml")
@EnableCaching // Spring Boot Cache 사용을 선언
public class EgovBootApplication {
	public static void main(String[] args) {
		SpringApplication.run(EgovBootApplication.class, args);
	}
}
