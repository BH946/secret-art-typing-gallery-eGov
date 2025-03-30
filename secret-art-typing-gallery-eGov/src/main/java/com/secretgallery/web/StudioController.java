package com.secretgallery.web;

import java.io.FileOutputStream;
import java.util.UUID;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
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
import com.secretgallery.vo.UpdateItemDto;

import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

//studio.jsp, studio_item.jsp 을 담당
@Controller
@RequiredArgsConstructor
@RequestMapping("studio")
@Slf4j
public class StudioController {
	private final ItemServiceImpl itemService;
	private final MyDataSource myDataSource;
	//게시물 추가는 2단계 구성: 이미지 제작("studio") -> 정보 기입("studio/item")
	//게시물 수정은?? 갤러리에서 접근 -> 정보 기입("studio/item/{id}")

	/**
	 * 작품 제작실 화면 -> "이미지 제작"
	 * @return
	 */
    @GetMapping() // URL 매핑(GET)
    public String studio() {
        return "/jsp/studio";
    }
    /**
     * 클라에서 이미지 소스 가져와 저장 로직 -> "이미지 제작"
     * @param imgSrc -> 클라에서 생성한 이미지 파일명
     * @param model
     * @param redirectAttributes
     * @return
     */
    @PostMapping() 
    public String studioImg(@RequestParam String imgSrc, Model model, RedirectAttributes redirectAttributes) {
        log.debug("imgPath = {}", myDataSource.getImgPath());
        FileOutputStream fo = null;
        try{
            imgSrc = imgSrc.replaceAll("data:image/jpeg;base64,", "");
            byte[] file = Base64.decodeBase64(imgSrc); // 인코드된 Base64를 디코드
            String fileName = UUID.randomUUID().toString();
//            String filePath = "C:/images-spring/"+fileName+".jpeg";
//            String filePath = "/var/www/images-spring/"+fileName+".jpeg";
            String filePath = myDataSource.getImgPath()+fileName+".jpeg";
            log.debug("filePath : {}", filePath);
            fo = new FileOutputStream(filePath);
            imgSrc = fileName+".jpeg"; // 이름을 기록
            fo.write(file);
            log.debug("image 생성 성공");
            fo.close();
        }catch(Exception e){
            log.debug("catch로 들어옴 - 이미지 생성 실패");
            e.printStackTrace();
        }
        redirectAttributes.addAttribute("imgSrc", imgSrc);
        return "redirect:studio/item"; // PRG 패턴 적용
    }
    
    /**
     * 작품 정보기입 화면 -> "정보 기입"
     * @param imgSrc
     * @param model
     * @return
     */
    @GetMapping("/item") // URL 매핑(GET)
    public String studioItem(@RequestParam String imgSrc, Model model) {
        log.debug("imgSrc : {}", imgSrc);

        // @ModelAttribute 사용안할거면 직접 "빈값" 세팅을 해둬야 안전
        Item item = Item.createItem("","","","", imgSrc);
//        Long totalCount = itemService.findTotalCount();

        model.addAttribute("item", item);
//        model.addAttribute("totalCount", totalCount);
        return "/jsp/studio_item";
    }
    /**
     * 작품 정보를 저장하여 게시물 등록 -> "정보 기입"
     * @param form -> 요청 DTO (Valid도)
     * @param bindingResult
     * @param redirectAttributes
     * @return
     * @throws Exception
     */
    @PostMapping("/item")
    public String studioAdd(@Validated @ModelAttribute AddItemDto form, BindingResult bindingResult,
                            RedirectAttributes redirectAttributes) throws Exception {
        // FieldError 는 알아서 검증
        // ObjectError 인 특정 필드가 아닌 복합 룰 검증 -> 딱히 할거없어서 PASS

        if(bindingResult.hasErrors()) {
            log.info("error={}", bindingResult);
            return "/jsp/studio_item";
        }

        // 성공 로직
//        itemService.initCachePosts(); // 캐시 초기화(페이지들 새로 No 업데이트 하기 때문)
        Item item = Item.createItem(form.getNickName(), form.getPassword(), form.getTitle(),
        		form.getContent(), form.getImgSrc());
        log.debug("form:{}", form.getImgSrc());
        log.debug("item:{}", item.getImgSrc());
        itemService.save(item); // 이때 id 할당받음
//        int pageId = itemService.findPageId(item.getId()); // 바로 가져올 수 있음
//        List<Item> items = itemService.findAllWithNoPage(pageId); // 캐싱
//        List<Item> items = itemService.updateAllNo();
//        for(Item it : items)
//            log.debug("itemId : {}, itemNo : {}", it.getId());
//        itemService.updateTotalCount(); // 캐싱
        redirectAttributes.addFlashAttribute("status", "addON");
        redirectAttributes.addAttribute("itemId", item.getId());
        return "redirect:/gallery/itemDetail/{itemId}";
        // PRG 패턴 적용
    }
    
    /**
     * 수정 데이터 작성 -> 정보 기입
     * 특징: 갤러리-아이템에서 이곳으로 접근
     * @param itemId
     * @param model
     * @return
     * @throws Exception 
     */
    @GetMapping("item/{itemId}")
    public String studioCompleteId(@PathVariable Long itemId, Model model) throws Exception {
        Item item = itemService.findById(itemId);
        model.addAttribute("item", item);
        return "/jsp/studio_item"; 
    }

    /***
     * 수정 수행 -> 정보 기입
     * @param form -> 요청 DTO (Valid로 JSP에 출력)
     * @param bindingResult
     * @param itemId
     * @param redirectAttributes
     * @return
     * @throws Exception
     */
    @PostMapping("item/{itemId}")
    public String studioIdUpdate(@Validated @ModelAttribute UpdateItemDto form, BindingResult bindingResult,
                                 @PathVariable Long itemId, RedirectAttributes redirectAttributes, Model model) throws Exception {
        if(bindingResult.hasErrors()) {
            log.info("error={}", bindingResult);
            model.addAttribute("bindingResult", bindingResult);
            return "jsp/studio_item"; //다시 폼으로 이동
            // 어차피 "검증" 에 걸려서 DB 사용안하기에 PRG 패턴 상관없움
        }
        log.info("title테스트={}", form.getTitle());
        itemService.update(form);
//      int pageId = itemService.findPageId(itemId);
//      itemService.updateAllWithPage(pageId); // 캐싱
      redirectAttributes.addFlashAttribute("status", "updateON");
      redirectAttributes.addAttribute("itemId", itemId);
      return "redirect:/gallery/itemDetail/{itemId}";        
       
    }
 
    
    
    @Data
    public static class AddItemDto {
    	@NotNull
    	  private String nickName;
    	  @NotNull
    	  @Pattern(regexp = "^[0-9]+", message = "비밀번호는 숫자로 입력 해주세요.")
    	  private String password;
    	  @NotNull
    	  private String title;
    	  @NotNull
    	  private String content;
    	  @NotBlank(message = "이미지가 없습니다. 다시 시도하세요.")
    	  private String imgSrc;
    }
    
}
