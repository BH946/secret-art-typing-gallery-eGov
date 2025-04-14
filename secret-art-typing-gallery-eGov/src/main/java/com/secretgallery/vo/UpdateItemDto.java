package com.secretgallery.vo;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import lombok.Data;

//컨트롤러 뿐만 아니라 서비스, DAO단에서도 사용
@Data
public class UpdateItemDto {
	  private Long id;
	  private String nickname;
	  private String password;
	  private String title;
	  private String content;
	  private int pageIndex;
//	  @NotNull
//	  private Long id;
//	  @NotNull
//	  private String nickname;
//	  @NotNull
//	  @Pattern(regexp = "^[0-9]+", message = "비밀번호는 숫자로 입력 해주세요.")
//	  private String password;
//	  @NotNull
//	  private String title;
//	  @NotNull
//	  private String content;
//	  private int pageIndex;
}