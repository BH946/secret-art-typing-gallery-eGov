package com.secretgallery.tag;

import javax.servlet.ServletContext;

import org.egovframe.rte.ptl.mvc.tags.ui.pagination.AbstractPaginationRenderer;
import org.springframework.web.context.ServletContextAware;

public class ImagePaginationRenderer extends AbstractPaginationRenderer implements ServletContextAware {
	private ServletContext servletContext;

	public ImagePaginationRenderer() {

	}

	public void initVariables(ServletContext servletContext) {

		// String strWebDir =
//		String strWebDir = servletContext.getContextPath() + "/images/pagination/";
		String strWebDir = "/images/pagination/"; //boot는 resources/static 하위 자동으로 탐색
		//class=page-link 는 css 적용위해 설정했음.
		firstPageLabel = "<a class='page-link' href=\"#\" onclick=\"{0}({1}); return false;\">" + "<image src='" + strWebDir
				+ "bt_first.gif' border=0/></a>&#160;";
		previousPageLabel = "<a class='page-link' href=\"#\" onclick=\"{0}({1}); return false;\">" + "<image src='" + strWebDir
				+ "arrow-left.svg' border=0/></a>&#160;";
//				+ "bt_prev.gif' border=0/></a>&#160;";				
//		currentPageLabel = "<a class='page-link-act'><strong>{0}</strong></a>&#160;";
		currentPageLabel = "<a class='page-link-act'>{0}</a>&#160;";
		otherPageLabel = "<a class='page-link' href=\"#\" onclick=\"{0}({1}); return false;\">{2}</a>&#160;";
		nextPageLabel = "<a class='page-link' href=\"#\" onclick=\"{0}({1}); return false;\">" + "<image src='" + strWebDir
				+ "arrow-right.svg' border=0/></a>&#160;";
//				+ "bt_next.gif' border=0/></a>&#160;";
		lastPageLabel = "<a class='page-link' href=\"#\" onclick=\"{0}({1}); return false;\">" + "<image src='" + strWebDir
				+ "bt_last.gif' border=0/></a>&#160;";
	}

	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
		initVariables(servletContext);
	}
}
