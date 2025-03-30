package com.secretgallery.web;

import java.net.URLDecoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.secretgallery.service.impl.ItemServiceImpl;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

//Ajax 사용한 컨트롤러 -> 페이징도 사용했지만 그건 GalleryController 꺼로 함.
@Controller
@RequiredArgsConstructor
@Slf4j
public class AjaxController {
	private final ItemServiceImpl itemService;
	
	@ResponseBody
	@PostMapping("/suggestKeyword")
	public List<String> suggestKeyword(HttpServletRequest request) throws Exception {
	    String searchKeyword = URLDecoder.decode(request.getParameter("searchKeyword"), "utf-8");
	    List<String> results = itemService.findTitleListForSuggest(searchKeyword);
	    return results; // 자동으로 JSON으로 변환되어 응답됨
	}

}
