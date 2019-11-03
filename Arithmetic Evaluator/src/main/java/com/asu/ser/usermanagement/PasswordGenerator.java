package com.asu.ser.usermanagement;
/**
 * @author akhilesh
 */

public class PasswordGenerator {
	
	public static String generatePassword() {
		int n = 8;
		String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" + "0123456789" + "abcdefghijklmnopqrstuvxyz";
		StringBuilder sb = new StringBuilder(n);
		for (int i = 0; i < n; i++) {
			int index = (int) (AlphaNumericString.length() * Math.random()); 
			sb.append(AlphaNumericString.charAt(index));
		}
		return sb.toString();
	}

}
