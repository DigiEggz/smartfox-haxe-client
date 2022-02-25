package com.smartfoxserver.v2.util;

import haxe.crypto.Aes;
import haxe.crypto.Base64;
import com.smartfoxserver.v2.core.SFSEvent;
import openfl.errors.IllegalOperationError;
import openfl.events.Event;
import openfl.events.IOErrorEvent;
import openfl.events.SecurityErrorEvent;
import openfl.net.URLLoader;
import openfl.net.URLRequest;
import openfl.net.URLRequestMethod;
import openfl.net.URLVariables;
import openfl.utils.ByteArray;
import openfl.utils.Endian;

/**
 * ...
 * @author vincent blanchet, Metlmeta
 */
class CryptoInitializer
{
	private static var KEY_SESSION_TOKEN:String = "SessToken";
	private static var TARGET_SERVLET:String = "/BlueBox/CryptoManager";

	private var sfs:SmartFox;
	private var httpReq:URLRequest;
	private var useHttps:Bool = true;

	public function new(sfs:SmartFox)
	{
		// These are not events because they should fail at test time.
		if (!sfs.isConnected)
			throw new IllegalOperationError("Cryptography cannot be initialized before connecting to SmartFoxServer!");

		if (sfs.socketEngine.cryptoKey != null)
			throw new IllegalOperationError("Cryptography is already initialized!");

		this.sfs = sfs;

		run();
	}

	private function run():Void
	{
		var targetUrl:String = 	"https://" + sfs.config.host + ":" +
								sfs.config.httpsPort +
								TARGET_SERVLET;

		// Prepare HTTPS Request
		httpReq = new URLRequest(targetUrl);
		httpReq.method = URLRequestMethod.POST;

		// Configure loader
		var loader:URLLoader = new URLLoader();
		loader.addEventListener(Event.COMPLETE, onHttpResponse);
		loader.addEventListener(IOErrorEvent.IO_ERROR, onHttpIOError);
		//loader.addEventListener(IOErrorEvent.NETWORK_ERROR, onHttpIOError);
		loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onSecurityError);

		// Request params
		var vars:URLVariables = new URLVariables();
		Reflect.setField(vars,KEY_SESSION_TOKEN,sfs.sessionToken);
		httpReq.data = vars;

		//urlLoader.data = vars;
		loader.load(httpReq);
	}
			// ---- Internal event handlers --------------------------------------------------------------------

	private function onHttpResponse(evt:Event):Void
	{
		var loader:URLLoader = cast evt.target;
		var rawData:String = cast loader.data;

		var byteData:ByteArray = Base64.decode(rawData);

		var iv:ByteArray = new ByteArray();
		iv.endian = Endian.BIG_ENDIAN;
		var key:ByteArray = new ByteArray();
		key.endian = Endian.BIG_ENDIAN;

		// Extract the key and init vector and pass them to the BitSwarmClient
		key.writeBytes(byteData, 0, 16);
		iv.writeBytes(byteData, 16, 16);

		// Make sure key and IV are valid
		if(key.length > 0 && iv.length > 0)
		{
			sfs.socketEngine.cryptoKey = new CryptoKey(iv, key);
			sfs.socketEngine.cipher = new Aes(key, iv);
			sfs.dispatchEvent( new SFSEvent(SFSEvent.CRYPTO_INIT, { success:true }) );
		}
		else
			sfs.dispatchEvent( new SFSEvent(SFSEvent.CRYPTO_INIT, { success:false }) );

		
	}

	private function onHttpIOError(evt:IOErrorEvent):Void
	{
		sfs.logger.warn("HTTP I/O ERROR: " + evt.text);
		sfs.dispatchEvent( new SFSEvent(SFSEvent.CRYPTO_INIT, { success:false, errorMsg:evt.text }) );
	}

	private function onSecurityError(evt:SecurityErrorEvent):Void
	{
		sfs.logger.warn("SECURITY ERROR: " + evt.text);
		sfs.dispatchEvent( new SFSEvent(SFSEvent.CRYPTO_INIT, { success:false, errorMsg:evt.text }) );
	}
}
