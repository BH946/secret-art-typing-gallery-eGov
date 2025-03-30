package com.secretgallery.service.impl;
import static org.assertj.core.api.Assertions.assertThat;

import java.util.List;

import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import com.secretgallery.vo.Item;
import com.secretgallery.vo.ItemDefault;

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

        // 저장 후 ID 확인 -> 1,2 id
        Long cnt = itemService.save(item);
        log.info("itemId: {}", item.getId());
        itemService.save(item);
        log.info("itemId: {}", item.getId());
        assertThat(cnt).isNotNull();
 
        // 저장된 데이터 조회
        Item findItem = itemService.findById(item.getId());
        log.info("nickname: {}", findItem.getNickname());
        assertThat(findItem.getNickname()).isEqualTo(item.getNickname());
        assertThat(findItem.getTitle()).isEqualTo(item.getTitle());
	}
	
	@Test
	public void 수정() throws Exception {
		// given
		Item item = Item.createItem(
        		"테스트 닉네임", "비밀번호", "테스트 제목", "테스트 내용", "이미지 경로");
		itemService.save(item);
		log.info("itemId: {}, title: {}", item.getId(), item.getTitle());
		
		// when
		item.updateItem("비번", "제목", "내용");
		itemService.update(item);
		Item findItem = itemService.findById(item.getId());
		
		// then
		assertThat(findItem).isNotNull();
		assertThat(findItem.getId()).isEqualTo(item.getId());
		assertThat(findItem.getTitle()).isEqualTo(item.getTitle());
		log.info("itemId: {}, title: {}", findItem.getId(), findItem.getTitle());
	}
	
	@Test
	public void 삭제() throws Exception {
		// given
		Item item = Item.createItem(
        		"테스트 닉네임", "비밀번호", "테스트 제목", "테스트 내용", "이미지 경로");
        itemService.save(item);
        Long itemId = item.getId();
		
		// when
        log.info("delete 전: {}", item);
        itemService.delete(item);
        Item findItem = itemService.findById(itemId);
        log.info("delete 후: {}", findItem);
		
		// then
        assertThat(findItem).isNull();
	}
	
	@Test
	public void 전체조회_검색조건조회() throws Exception {
		// given
        Item item = Item.createItem(
        		"테스트 닉네임", "비밀번호", "테스트 제목", "테스트 내용", "이미지 경로");
        itemService.save(item);
        itemService.save(item);
        itemService.save(item);
		
		// when
        List<Item> findItems = itemService.findAll();
		
		// then
        assertThat(findItems).isNotNull();
        for(Item i : findItems) {
        	log.info("itemId: {}, title: {}", i.getId(), i.getTitle());	
        }
	}

	//CRUD 테스트 끝
	//추가 함수 테스트 시작
	@Test
	public void 페이지내아이템_페이징조회() throws Exception {
		// given
	    for (int i = 0; i < 15; i++) { // 테스트 데이터 15개 생성
	        Item item = Item.createItem(
	            "테스트 닉네임" + i, "비밀번호", "테스트 제목" + i, "테스트 내용", "이미지 경로");
	        itemService.save(item);
	    }
	    ItemDefault searchItem = new ItemDefault();
		
		// when
	    // pagination setting
	    // 첫 번째 페이지 조회 (최신 10개)
	    searchItem.setPageIndex(1);
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchItem.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchItem.getPageUnit());
		paginationInfo.setPageSize(searchItem.getPageSize());

		searchItem.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchItem.setLastIndex(paginationInfo.getLastRecordIndex());
		searchItem.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
	    
	    List<Item> firstPage = itemService.findAllWithPage(searchItem);
	    
	    // 두 번째 페이지 조회 (나머지 5개)
	    searchItem.setPageIndex(2);
	    paginationInfo.setCurrentPageNo(searchItem.getPageIndex()); //2페이지로 설정
	    
	    searchItem.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchItem.setLastIndex(paginationInfo.getLastRecordIndex());
		searchItem.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
	    
	    List<Item> secondPage = itemService.findAllWithPage(searchItem); 
	    
		// then
	    assertThat(firstPage).isNotNull();
	    assertThat(firstPage.size()).isEqualTo(10);
	    assertThat(secondPage).isNotNull();
	    assertThat(secondPage.size()).isEqualTo(5);
	    // 첫 번째 페이지의 id가 두 번째 페이지보다 큰지 확인 (내림차순 정렬)
	    assertThat(firstPage.get(0).getId()).isGreaterThan(secondPage.get(0).getId());
	    
	    // 로그 출력
	    log.info("=== 첫 번째 페이지 ===");
	    for (Item i : firstPage) {
	        log.info("itemId: {}, title: {}", i.getId(), i.getTitle());
	    }
	    
	    log.info("=== 두 번째 페이지 ===");
	    for (Item i : secondPage) {
	        log.info("itemId: {}, title: {}", i.getId(), i.getTitle());
	    }
	}
	@Test
	public void 아이템이전이후_조회() throws Exception {
		// given
		Item item = null;
	    for (int i = 0; i < 5; i++) { // 테스트 데이터 5개 생성
	        item = Item.createItem(
	            "테스트 닉네임" + i, "비밀번호", "테스트 제목" + i, "테스트 내용", "이미지 경로");
	        itemService.save(item);
	    }
		
		// when
	    List<Item> findItems = itemService.findPrevNextById(item.getId()-1); // 마지막id-2, 마지막id-1, 마지막id 가 나와야 정상
	    List<Item> findItemsFirst = itemService.findPrevNextById(item.getId()-4); // 첫번째id, 첫번째id+1 가 나와야 정상
	    List<Item> findItemsLast = itemService.findPrevNextById(item.getId()); // 마지막id-1, 마지막id 가 나와야 정상
	    
		// then
	    assertThat(findItems).isNotNull();
	    assertThat(findItems.size()).isEqualTo(3);
	    assertThat(findItemsFirst).isNotNull();
	    assertThat(findItemsFirst.size()).isEqualTo(2);
	    assertThat(findItemsLast).isNotNull();
	    assertThat(findItemsLast.size()).isEqualTo(2);
	    
	    // 로그 출력
	    log.info("=== 아이템 이전 이후: findItems ===");
	    for (Item i : findItems) {
	        log.info("itemId: {}, title: {}", i.getId(), i.getTitle());
	    }
	    log.info("=== 아이템 이전 이후: findItemsFirst ===");
	    for (Item i : findItemsFirst) {
	        log.info("itemId: {}, title: {}", i.getId(), i.getTitle());
	    }
	    log.info("=== 아이템 이전 이후: findItemsLast ===");
	    for (Item i : findItemsLast) {
	        log.info("itemId: {}, title: {}", i.getId(), i.getTitle());
	    }
	}
	@Test
	public void 아이템총개수_조회() throws Exception {
		// given
	    for (int i = 0; i < 10; i++) { // 테스트 데이터 10개 생성
	        Item item = Item.createItem(
	            "테스트 닉네임" + i, "비밀번호", "테스트 제목" + i, "테스트 내용", "이미지 경로");
	        itemService.save(item);
	    }
	    
	    // when
	    ItemDefault searchItem = Item.createItem(null, null, null, null, null);
	    int findCnt = itemService.findTotalCount(searchItem);
	    
		// then
	    assertThat(findCnt).isNotNull();
	    assertThat(findCnt).isEqualTo(10);
	    
	    // 로그 출력
	    log.info("=== 아이템 총 개수 findCnt:{} ===", findCnt);
	}
	@Test
	public void 검색자동완성() throws Exception {
		// given
	    for (int i = 0; i < 10; i++) { // 테스트 데이터 10개 생성
	        Item item = Item.createItem(
	            "테스트 닉네임" + i, "비밀번호", "테스트 제목" + i, "테스트 내용", "이미지 경로");
	        itemService.save(item);
	    }
		
		// when
	    List<String> result = itemService.findTitleListForSuggest("테스트 제");
		
		// then
	    assertThat(result).isNotNull();
		log.info("=== 자동완성 result: {} ===", result);
	}
}
