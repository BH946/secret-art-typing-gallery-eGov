package com.secretgallery.vo;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.Pattern;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class Item extends ItemDefault {
	@Id //db에 pk
	@GeneratedValue(strategy = GenerationType.IDENTITY) //db에 not null auto_increment
	@Column(name="item_id") //db 필드명
	private Long id; //엔티티 필드명

	private String nickname;
	private String password;
	private String title;
	private String content;
	private String imgSrc; //db엔 img_src

	@DateTimeFormat(pattern = "yy.MM.dd.HH:mm")
	private LocalDateTime date1;
	@DateTimeFormat(pattern = "yy년 MM월 dd일 HH시 mm분")
	private LocalDateTime date2; //필요없긴함. 어차피 jsp에서 date1을 format해서 나타내는 중이라.

	// ==생성 편의 메서드==//
	public static Item createItem(String nickname, String password, String title, String content, String imgSrc) {
		Item item = new Item();
		item.nickname = (nickname==null||nickname.equals("")) ? "익명" : nickname;
		item.password = (password==null||password.equals("")) ? "" : password;
		item.title = (title==null||title.equals("")) ? "무제" : title;
		item.content = (content==null||content.equals("")) ? "" : content;
		item.imgSrc = imgSrc;
		item.date1 = LocalDateTime.now();
		item.date2 = LocalDateTime.now();
		return item;
	}
}
