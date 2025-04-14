package com.secretgallery.vo;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter
@NoArgsConstructor
@EqualsAndHashCode //메모리캐시 때문에 넣음(원래도 있는게 좋긴하지)
public class ItemDefault {

	/** 검색조건->카테고리 ID, NAME 등 선택 */
	private String searchCondition = "";

	/** 검색Keyword */
	private String searchKeyword = "";

	/** 검색사용여부 */
	private String searchUseYn = "";

	/** 현재페이지 */
	private int pageIndex = 1;

	/** 페이지갯수->페이지당 뷰에 나타낼 게시물 수 */
	private int pageUnit = 10;

	/** 페이지사이즈->5면 하단 네비게이션에 1 2 3 4 5 까지 표시 */
	private int pageSize = 10;

	/** firstIndex->페이지 출력 시작할 게시물 위치: (pageIndex-1)*recordCountPerPage */
	private int firstIndex = 1;

	/** lastIndex->페이지 출력 마지막 게시물 위치: (pageIndex)*recordCountPerPage */
	private int lastIndex = 1;

	/** recordCountPerPage->limit 쿼리용 */
	private int recordCountPerPage = 10;

}
