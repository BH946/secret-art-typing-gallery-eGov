package com.secretgallery.service.impl;
import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import com.secretgallery.vo.Item;

import lombok.extern.slf4j.Slf4j;

@SpringBootTest // @SpringBootApplication을 찾아서 테스트를 위한 Bean을 생성
@Transactional // 쓰기모드 -> 서비스코드에 트랜잭션 유무 반드시 확인
@Slf4j
class ItemServiceImplTest {
	@Autowired 
	private ItemServiceImpl itemService;

	@Test
	void 저장과조회() throws Exception {
		// 테스트 데이터 준비
        Item item = Item.createItem(
        		"테스트 닉네임", "비밀번호", "테스트 제목", "테스트 내용", "이미지 경로");

        // 저장 후 ID 확인 -> 1,2,3 id
        Long cnt = itemService.save(item);
        log.info("itemId: {}", item.getItemId());
        itemService.save(item);
        log.info("itemId: {}", item.getItemId());
        assertThat(cnt).isNotNull();
 
        // 저장된 데이터 조회
        Item savedItem = itemService.findById(item.getItemId());
        log.info("nickname: {}", savedItem.getNickname());
        assertThat(savedItem.getNickname()).isEqualTo(item.getNickname());
        assertThat(savedItem.getTitle()).isEqualTo(item.getTitle());
	}

}
