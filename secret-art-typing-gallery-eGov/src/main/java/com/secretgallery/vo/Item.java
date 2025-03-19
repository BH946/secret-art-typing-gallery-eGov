package com.secretgallery.vo;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class Item {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long itemId;

	private String nickname;
	private String password;
	private String title;
	private String content;
	@Column(name = "IMGSRC")
	private String imgSrc;

	@DateTimeFormat(pattern = "yy.MM.dd.HH:mm")
	private LocalDateTime date1;
	@DateTimeFormat(pattern = "yy년 MM월 dd일 HH시 mm분")
	private LocalDateTime date2;

	// ==생성 편의 메서드==//
	public static Item createItem(String nickname, String password, String title, String content, String imgSrc) {
		Item item = new Item();
		item.nickname = (nickname.equals("")) ? "익명" : nickname;
		item.password = (password.equals("")) ? "" : password;
		item.title = (title.equals("")) ? "무제" : title;
		item.content = (content.equals("")) ? "" : content;
		item.imgSrc = imgSrc;
		item.date1 = LocalDateTime.now();
		item.date2 = LocalDateTime.now();
		return item;
	}
}
