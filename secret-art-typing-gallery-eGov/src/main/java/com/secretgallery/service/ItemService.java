package com.secretgallery.service;

import java.util.List;

import com.secretgallery.vo.Item;

public interface ItemService {
	public Long save(Item item) throws Exception;

	public void update(Item item) throws Exception;

	public void delete(Item item) throws Exception;

	public Item findById(Long itemId) throws Exception;

	public List<Item> findAll() throws Exception;
}
