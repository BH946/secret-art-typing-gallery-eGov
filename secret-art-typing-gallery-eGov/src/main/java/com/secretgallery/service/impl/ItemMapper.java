package com.secretgallery.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.secretgallery.vo.Item;

/**
 * Mapper Interface - 메서드명과 쿼리ID를 매핑하여 쿼리호출
 */
@Mapper
public interface ItemMapper {
	public Long save(Item item);

	public void update(Item item);

	public void delete(Item item);

	public Item findById(Long itemId);

	public List<Item> findAll();
}
