package com.secretgallery.web;

import java.time.LocalDateTime;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

import javax.annotation.PostConstruct;

import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.secretgallery.datasource.MyDataSource;
import com.secretgallery.service.impl.ItemServiceImpl;
import com.secretgallery.vo.Item;

import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

//gallery_item.jsp, gallery.jsp 를 담당
@Controller
@RequiredArgsConstructor
@RequestMapping("gallery")
@Slf4j
public class GalleryController {
	private final ItemServiceImpl itemService;
	private final MyDataSource myDataSource;

	/**
	 * 페이지 별로 조회 메서드 -> 페이징
	 * 
	 * @param item  -> 어차피 숨기고 싶은 password가 안들어 올거라서 요청은 DTO로 안 받겠다.
	 * @param model -> 응답DTO 사용
	 * @return
	 * @throws Exception
	 */
	@GetMapping()
	public String search(@ModelAttribute Item item, Model model) throws Exception {
//		log.info("itemId: {}",item.getId());
		return this.gallery(item, model); // HTTP말고 그냥 메소드 호출한거.(포워드,리다이렉트 아님)
	}

	@PostMapping() // ...?pageIndex=1 이런식으로 페이지 파라미터 넘어 올거임(pageIndex란 Item이 상속받고 있는 DefaultItem의
					// 필드)
	public String gallery(@ModelAttribute Item item, Model model) throws Exception {
		item.setPageUnit(myDataSource.getPageUnit());
		item.setPageSize(myDataSource.getPageSize());

		// pagination setting
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(item.getPageIndex());
		paginationInfo.setRecordCountPerPage(item.getPageUnit());
		paginationInfo.setPageSize(item.getPageSize());

		item.setFirstIndex(paginationInfo.getFirstRecordIndex());
		item.setLastIndex(paginationInfo.getLastRecordIndex());
		item.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		// List
		List<Item> items = itemService.findAllWithPage(item);
		List<ItemResDto> itemsResDto = items.stream().map(o -> new ItemResDto(o)).collect(Collectors.toList());
		int totCnt = itemService.findTotalCount(item);

		model.addAttribute("itemsResDto", itemsResDto);
		paginationInfo.setTotalRecordCount(totCnt);
		// Pagination
		model.addAttribute("paginationInfo", paginationInfo);
		log.info("cnt: {}, resultList: {}", totCnt, items);

		return "jsp/gallery";
	}

	/**
	 * 작품상세 화면 조회 -> findPrevNextById() 로 id-1 ~ id+1 3개 데이터 가져와 활용
	 * 
	 * @param itemId
	 * @param model  -> 응답DTO 사용
	 * @return
	 * @throws Exception
	 */
	@GetMapping("itemDetail/{itemId}")
	public String galleryItemDetail(@PathVariable Long itemId, Model model) throws Exception {
		Item findItem = null;
		List<Item> items = itemService.findPrevNextById(itemId);
		Collections.sort(items, new ObjectSort()); // 오름차순 정렬 (sql은 순서보장 x)

		// java.util.ConcurrentModificationException: null 에러 해결위해 iterator 사용
		Iterator<Item> iterator = items.iterator();
		while (iterator.hasNext()) {
			Item item = iterator.next();
			log.debug("item : {}", item.getId());
			if (Objects.equals(item.getId(), itemId)) {
				findItem = item;
				iterator.remove();
				;
				log.debug("findPrevNextById() : {}", item.getTitle());
			}
		}

		log.debug("findItem : {}, items.size: {}", findItem.getId(), items.size());
		List<ItemDetailResDto> itemsResDto = items.stream().map(o -> new ItemDetailResDto(o))
				.collect(Collectors.toList());

		ItemDetailResDto findItemDto = new ItemDetailResDto(findItem);
		model.addAttribute("findItemDto", findItemDto);
		model.addAttribute("itemsResDto", itemsResDto);
		model.addAttribute("len", items.size()); // 길이도 함께

		return "jsp/gallery_item";
	}

	/**
	 * 작품 수정 -> StudioController 책임 전가
	 * @param itemId             -> @PathVariable
	 * @param password           -> @RequestParam
	 * @param redirectAttributes
	 * @return
	 * @throws Exception
	 */
	@PostMapping("/update/{itemId}")
	public String updateGalleryItem(@PathVariable Long itemId, @RequestParam String password,
			RedirectAttributes redirectAttributes) throws Exception {
		Item findItem = itemService.findById(itemId); // 이미 없으면 null
		if (findItem != null) {
			if (findItem.getPassword().equals(password)) {
				log.debug("비번통과");
				return "redirect:/studio/item/{itemId}"; // 스튜디오 컨트롤러에 있음
				// PRG 패턴 위해 Redirect
			} else {
				log.debug("비번실패");
				redirectAttributes.addFlashAttribute("status", "updateOFF");
				return "redirect:/gallery/itemDetail/{itemId}"; // 기존 화면 다시 로딩
				// 여기선 post 있으면 forward로 했어도 충분 (꼭 Get만 접속할 필요는 없는 상황이라서)
			}
		} else {
			redirectAttributes.addFlashAttribute("status", "notItem");
			return "redirect:/gallery"; // 갤러리로 돌아가기 -> Get으로 접속위해 리다이렉트 사용
		}

	}

	/**
	 * 작품 삭제
	 * @param itemId             -> @PathVariable
	 * @param password           -> @RequestParam
	 * @param redirectAttributes
	 * @return
	 * @throws Exception
	 */
	@PostMapping("/delete/{itemId}")
	public String deleteGalleryItem(@PathVariable Long itemId, @RequestParam String password,
			RedirectAttributes redirectAttributes) throws Exception {
		Item findItem = itemService.findById(itemId); // 이미 없으면 null
		if (findItem != null) {
			if (findItem.getPassword().equals(password)) {
				log.debug("비번통과");
//				itemService.initCachePosts(); // 캐시 초기화(페이지들 새로 No 업데이트 하기 때문)
				itemService.delete(findItem);
//				List<Item> items = itemService.updateAllNo();
//				itemService.updateTotalCount(); // 캐싱
				redirectAttributes.addFlashAttribute("status", "deleteON");
				return "redirect:/gallery"; // gallery() 함수로 이동
			}  else {
				log.debug("비번실패");
				redirectAttributes.addFlashAttribute("status", "deleteOFF");
				return "redirect:/gallery/itemDetail/{itemId}"; // 기존 화면 다시 로딩
				// PRG 패턴 위해 Redirect
			}
		} else {
			redirectAttributes.addFlashAttribute("status", "notItem");
			return "redirect:/gallery"; // 갤러리로 돌아가기 -> Get으로 접속위해 리다이렉트 사용
		}
	}

	/**
	 * galleryItemDetail() 에 사용 sql 은 순서 보장을 하지 않아서 따로 sort 했음
	 */
	static class ObjectSort implements Comparator<Item> {
		@Override
		public int compare(Item o1, Item o2) {
			return Long.compare(o1.getId(), o2.getId()); // == a.x < b.x ? -1 : (a.x==b.x?0:1)
		}
	}

	@Data // toString, getter, setter 등
	public static class ItemResDto {
		private Long id;
		private String nickname;
		private String title;
		private String imgSrc;
		@DateTimeFormat(pattern = "yy.MM.dd.HH:mm")
		private LocalDateTime date1;

		public ItemResDto(Item item) {
			this.id = item.getId();
			this.nickname = item.getNickname();
			this.title = item.getTitle();
			this.imgSrc = item.getImgSrc();
			this.date1 = item.getDate1();
		}
	}

	@Data // toString, getter, setter 등
	public static class ItemDetailResDto {
		private Long id;
		private String nickname;
		private String title;
		private String imgSrc;
		private String content; // 추가
		@DateTimeFormat(pattern = "yy.MM.dd.HH:mm")
		private LocalDateTime date1;

		public ItemDetailResDto(Item item) {
			this.id = item.getId();
			this.nickname = item.getNickname();
			this.title = item.getTitle();
			this.imgSrc = item.getImgSrc();
			this.content = item.getContent();
			this.date1 = item.getDate1();
		}
	}

	@PostConstruct
	public void initDataTest() throws Exception {
		for (int i = 0; i < 120; i++) { // 테스트 데이터 120개 생성
			Item it = Item.createItem("테스트 닉네임" + i, "123", "테스트 제목" + i, "테스트 내용", "이미지 경로");
			itemService.save(it);
		}
	}
}
