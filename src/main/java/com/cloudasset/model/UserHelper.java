package com.cloudasset.model;

import java.util.LinkedHashMap;
import java.util.Map;

public class UserHelper {
	
	public static Map<String, User> userMap = new LinkedHashMap<String, User>();
	
	
	public static void save(User user) {
		userMap.put(user.email, user);
	}
	
	public static boolean contains(String user) {
		return userMap.containsKey(user);
	}

}
