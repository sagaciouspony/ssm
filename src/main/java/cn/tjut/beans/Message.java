package cn.tjut.beans;

import java.util.HashMap;
import java.util.Map;

public class Message {

	private int code;
	
	private String message;
	
	private Map<String, Object> extendData = new HashMap<String, Object>();
	
	public static Message success() {
		
		Message msg = new Message();
		
		msg.setCode(100);
		
		msg.setMessage("execute success");
		
		return msg;
	}
	
	public static Message fail() {
		
		Message msg = new Message();
		
		msg.setCode(200);
		
		msg.setMessage("execute fail");
		
		return msg;
	}
	
	public Message add(String key, Object value) {
		
		this.getExtendData().put(key, value);
		
		return this;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Map<String, Object> getExtendData() {
		return extendData;
	}

	public void setExtendData(Map<String, Object> extendData) {
		this.extendData = extendData;
	}

}
