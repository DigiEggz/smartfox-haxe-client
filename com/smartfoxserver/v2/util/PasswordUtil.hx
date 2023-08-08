package com.smartfoxserver.v2.util;

import haxe.crypto.Md5;
import haxe.io.Bytes;

/**
 * Helper class for logging in with a pre-hashed password.
 * This is needed if your server-side database stores User passwords hashed with MD5.
 */
class PasswordUtil
{
	/**
	 * Generates the MD5 hash of the user password.
	 *
	 * @param	pass	The plain text password.
	 *
	 * @return	The hashed password.
	 *
	 * @example	This example shows how you can login with a hashed password:
	 *<listing version="3.0">
	 * var userName:String="testName";
	 * var userPass:String="testPass";
	 *
	 * var md5Pass:String=PasswordUtil.md5Password(userPass);
	 * sfs.send(new LoginRequest(userName, md5Pass, sfs.config.zone));
	 *</listing>
	 */
	public static function md5Password(pass:String):String {
		return Md5.encode(pass);
	}
}
