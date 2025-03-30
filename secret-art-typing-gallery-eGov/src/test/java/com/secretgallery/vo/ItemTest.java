package com.secretgallery.vo;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

import lombok.extern.slf4j.Slf4j;

@Slf4j
class ItemTest {
	@Test
	public void 생성_편의메서드() throws Exception {
		// given
		Item item = null;
		
		// when
        item = Item.createItem(
        		"테스트 닉네임", "비밀번호", "테스트 제목", "테스트 내용", "이미지 경로");
		
		// then
        log.info("{}", item.getNickname());
		assertInstanceOf(Item.class, item);
	}

}
