package com.secretgallery.service.impl;

import java.util.List;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
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
	public Long save(Item item) throws Exception {
		return itemMapper.save(item);
	}

	@Override
	@Transactional // 쓰기모드
	public Long update(UpdateItemDto item) throws Exception {
		// TODO Auto-generated method stub
		return itemMapper.update(item);
	}

	@Override
	@Transactional // 쓰기모드
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
	@Override
	public List<Item> findAllWithPage(ItemDefault searchItem) throws Exception {
		// TODO Auto-generated method stub
		return itemMapper.findAllWithPage(searchItem);
	}

	@Override
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
