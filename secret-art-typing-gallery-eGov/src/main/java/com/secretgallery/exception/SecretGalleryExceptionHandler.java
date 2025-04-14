package com.secretgallery.exception;

import org.egovframe.rte.fdl.cmmn.exception.EgovBizException;
import org.egovframe.rte.fdl.cmmn.exception.handler.ExceptionHandler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class SecretGalleryExceptionHandler implements ExceptionHandler {

    public void occur(Exception exception, String packageName) {
    	log.debug(" EasyCompanyExceptionHandler run...............{}", ((EgovBizException) exception).getWrappedException());
        try {
            if (exception instanceof EgovBizException) {
                Exception exx = (Exception) ((EgovBizException) exception).getWrappedException();
                if (exx != null) {
                	log.debug(" sending a alert mail  is completed ");
                    exx.printStackTrace();
                }
            }
        } catch (Exception e) { //일반 예외
            e.printStackTrace();
        }
    }
}
