package com.secretgallery.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;
import org.springframework.data.repository.query.Param;

import com.secretgallery.vo.Item;
import com.secretgallery.vo.ItemDefault;
import com.secretgallery.vo.UpdateItemDto;

/**
 * Mapper Interface - 메서드명과 쿼리ID를 매핑하여 쿼리호출
 */
@Mapper
public interface ItemMapper {
	public Long save(Item item);

	public Long update(UpdateItemDto item);

	public Long delete(Item item);

	public Item findById(Long id);

	public List<Item> findAll();
	
	public List<Item> findAllWithPage(ItemDefault searchItem);
	public int findTotalCount(ItemDefault searchItem);
	public List<String> findTitleListForSuggest(String value);
	public List<Item> findPrevNextById(@Param("prevId") Long prevId, @Param("nextId") Long nextId);
}
