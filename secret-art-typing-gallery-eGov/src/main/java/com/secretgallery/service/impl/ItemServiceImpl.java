package com.secretgallery.service.impl;

import java.util.List;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.secretgallery.service.ItemService;
import com.secretgallery.vo.Item;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Transactional(readOnly = true) 
@RequiredArgsConstructor
@Slf4j
public class ItemServiceImpl extends EgovAbstractServiceImpl implements ItemService {
	private final ItemMapper itemMapper;

	@Override
	@Transactional // 쓰기모드
	public Long save(Item item) throws Exception {
		return itemMapper.save(item);
	}

	@Override
	public void update(Item item) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(Item item) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public Item findById(Long itemId) throws Exception {
		return itemMapper.findById(itemId);
	}

	@Override
	public List<Item> findAll() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
