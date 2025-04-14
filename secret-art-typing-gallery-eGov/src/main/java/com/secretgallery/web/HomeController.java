package com.secretgallery.web;

import java.lang.reflect.Field;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.HandlerMapping;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.handler.AbstractHandlerMapping;
import org.springframework.web.servlet.support.RequestContextUtils;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class HomeController {

	@GetMapping("/")
	public String home() {
		return "index";
	}

	@GetMapping("/lobby")
	public String lobby() {
		return "jsp/lobby"; // lobby.jsp 반환
	}
	
	@GetMapping("/validator.do")
	public String validator() {
		return "jsp/validator"; // Jakarta common validation 활용 위해
	}
	
	@GetMapping("/lobbyLang") //lang test ver: localeResolver빈만 있으면 가능
	public String lobbyLang(@RequestParam("lang") String lang, HttpServletRequest request,
			HttpServletResponse response) {
		LocaleResolver localeResolver = RequestContextUtils.getLocaleResolver(request);
		localeResolver.setLocale(request, response, new Locale(lang));
		return "jsp/lobby"; // lobby.jsp 반환
	}
	
	//HandlerMapping에 등록된 인터셉터 확인용 로그
	@Autowired
	private ApplicationContext context;

	@PostConstruct
	public void checkInterceptors() {
	    Map<String, HandlerMapping> mappings = context.getBeansOfType(HandlerMapping.class);
	    mappings.forEach((name, mapping) -> {
	        if (mapping instanceof AbstractHandlerMapping) {
	            AbstractHandlerMapping ahm = (AbstractHandlerMapping) mapping;
	            System.out.println("HandlerMapping: " + name);
	            try {
	                Field interceptorsField = AbstractHandlerMapping.class.getDeclaredField("adaptedInterceptors");
	                interceptorsField.setAccessible(true);
	                List<?> interceptors = (List<?>) interceptorsField.get(ahm);
	                System.out.println("Interceptors: " + interceptors);
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	            System.out.println("----------------------------");
	        }
	    });
	}

}
