package com.secretgallery.vo;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import lombok.Data;

@Data
public class UpdateItemDto {
	  @NotNull
	  private Long id;
	  @NotNull
	  private String nickname;
	  @NotNull
	  @Pattern(regexp = "^[0-9]+", message = "비밀번호는 숫자로 입력 해주세요.")
	  private String password;
	  @NotNull
	  private String title;
	  @NotNull
	  private String content;
}