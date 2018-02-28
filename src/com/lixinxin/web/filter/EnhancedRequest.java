package com.lixinxin.web.filter;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class EnhancedRequest extends HttpServletRequestWrapper {
	private HttpServletRequest request;
	public EnhancedRequest(HttpServletRequest request) {
		super(request);
		this.request=request;
	}
	@Override
	public String getParameter(String name) {
		String value = this.request.getParameter(name);	
		if(value!=null){
			try {
				value = new String(value.getBytes("iso8859-1"),"utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
			return value;
	}

}
