package com.secretgallery.service.impl;

import java.util.List;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.secretgallery.service.ItemService;
import com.secretgallery.vo.Item;
import com.secretgallery.vo.ItemDefault;
import com.secretgallery.vo.UpdateItemDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Transactional(readOnly = true) 
@RequiredArgsConstructor
@Slf4j
public class ItemServiceImpl extends EgovAbstractServiceImpl implements ItemService {
	private final ItemMapper itemMapper;
	//CRUD
	@Override
	@Transactional // 쓰기모드
	@CacheEvict(value = {"items", "totalCount"}, allEntries = true)
	public Long save(Item item) throws Exception {
		return itemMapper.save(item);
	}

	@Override
	@Transactional // 쓰기모드
	@CacheEvict(value = "items", key = "#item.pageIndex") //totalCount는 그대로
	public Long update(UpdateItemDto item) throws Exception {
		// TODO Auto-generated method stub
		return itemMapper.update(item);
	}

	@Override
	@Transactional // 쓰기모드
	@CacheEvict(value = {"items", "totalCount"}, allEntries = true)
	public Long delete(Item item) throws Exception {
		// TODO Auto-generated method stub
		return itemMapper.delete(item);
	}

	@Override
	public Item findById(Long id) throws Exception {
		return itemMapper.findById(id);
	}

	@Override
	public List<Item> findAll() throws Exception {
		// TODO Auto-generated method stub
		return itemMapper.findAll();
	}
//
	//추가 함수
	//Cacheable: [캐시 없으면 저장] 조회, CachePut: [캐시에 데이터 있어도] 저장
	@Override
//	@Cacheable(value = "items", key = "#searchItem.pageIndex") //value 로 꼭 캐시 영역을 지정하여 구분
	public List<Item> findAllWithPage(ItemDefault searchItem) throws Exception {
		// leaveaTrace와 processException은 테스트용 코드일 뿐.
//		leaveaTrace("fail.common.msg"); //에러가 발생했습니다! 라고 message.properties에 있음
		throw processException("fail.common.msg", new RuntimeException("실제 원인"));
//		throw new Exception();
//		return itemMapper.findAllWithPage(searchItem);
	}
	@Override
	@Cacheable(value = "totalCount") //totalCount는 공통으로 사용하니 key로 구분 필요 없지 
	public int findTotalCount(ItemDefault searchItem) throws Exception {
		// TODO Auto-generated method stub
		return itemMapper.findTotalCount(searchItem);
	}
	
	@Override
	public List<String> findTitleListForSuggest(String value) throws Exception {
		// TODO Auto-generated method stub
		return itemMapper.findTitleListForSuggest(value);
	}

	@Override
	public List<Item> findPrevNextById(Long id) throws Exception {
		// TODO Auto-generated method stub
		return itemMapper.findPrevNextById(id-1, id+1);
	}
}
