package com.secretgallery.service;

import java.util.List;

import com.secretgallery.vo.Item;
import com.secretgallery.vo.ItemDefault;
import com.secretgallery.vo.UpdateItemDto;

/**
 * CRUD + 
 * findAllWithPage + findTotalCount + findTitleListForSuggest + findPrevNextById
 	* 총 게시물 수 구하는 함수: findTotalCount()
 	* 이전, 이후 전시실 버튼 생성용: findPrevNextById()
 	* 검색 자동완성 함수: findTitleListForSuggest()
 */
public interface ItemService {
	/**
	 * CRUD - C
	 * @param item
	 * @return count(개수)
	 * @throws Exception
	 */
	public Long save(Item item) throws Exception;
	/**
	 * CRUD - U
	 * @param item
	 * @return count(개수)
	 * @throws Exception
	 */
	public Long update(UpdateItemDto item) throws Exception;
	/**
	 * CRUD - D
	 * @param item
	 * @return count(개수)
	 * @throws Exception
	 */
	public Long delete(Item item) throws Exception;
	/**
	 * CRUD - R
	 * @param id
	 * @return 
	 * @throws Exception
	 */
	public Item findById(Long id) throws Exception;
	/**
	 * CRUD - R
	 * @return 
	 * @throws Exception
	 */
	public List<Item> findAll() throws Exception;
	//
	//추가 함수
	/**
	 * 해당 페이지 Item 전부 조회 by desc
	 * @param pageId
	 * @return
	 * @throws Exception
	 */
	public List<Item> findAllWithPage(ItemDefault searchItem) throws Exception;
	/**
	 * 전체 Item의 총 개수
	 * @return
	 * @throws Exception
	 */
	public int findTotalCount(ItemDefault searchItem) throws Exception;
	/**
	 * 검색에 자동완성 기능
	 * @param value
	 * @return
	 * @throws Exception
	 */
	public List<String> findTitleListForSuggest(String value) throws Exception;
	/**
	 * Item의 이전, 이후 Item 구하기
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public List<Item> findPrevNextById(Long id) throws Exception;
}
