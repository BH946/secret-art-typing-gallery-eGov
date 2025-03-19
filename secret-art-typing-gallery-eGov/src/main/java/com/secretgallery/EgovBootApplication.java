package com.secretgallery;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Import;
import org.springframework.context.annotation.ImportResource;

@SpringBootApplication
@ImportResource("classpath:/spring/*.xml")
public class EgovBootApplication {
	public static void main(String[] args) {
		SpringApplication.run(EgovBootApplication.class, args);
	}
}
