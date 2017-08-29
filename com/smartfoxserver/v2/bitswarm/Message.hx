package com.smartfoxserver.v2.bitswarm;

import com.smartfoxserver.v2.entities.data.SFSObject;

/** @private */
class Message implements IMessage
{
	private var _id:Int;
	private var _content:SFSObject;
	private var _targetController:Int;
	private var _isEncrypted:Bool;
	private var _isUDP:Bool;
	private var _packetId:Float;
		
	public function new()
	{
		_isEncrypted = false;
		_isUDP = false;
	}
	
	public var id(get_id, set_id):Int;
 	private function get_id():Int
	{
		return _id;
	}
	private function set_id(value:Int):Int
	{
		return this._id = value;
	}
	
	public var content(get_content, set_content):SFSObject;
 	private function get_content():SFSObject
	{
		return _content;
	}
	
	private function set_content(obj:SFSObject):SFSObject
	{
		return this._content = obj	;
	}
	
	public var targetController(get_targetController, set_targetController):Int;
 	private function get_targetController():Int
	{
		return _targetController;
	}
	private function set_targetController(value:Int):Int
	{
		return this._targetController = value;	
	}
	
	public var isEncrypted(get_isEncrypted, set_isEncrypted):Bool;
 	private function get_isEncrypted():Bool
	{
		return _isEncrypted;
	}
	private function set_isEncrypted(value:Bool):Bool
	{
		return _isEncrypted = value;
	}
	
	public var isUDP(get_isUDP, set_isUDP):Bool;
 	private function get_isUDP():Bool
	{
		return _isUDP;
	}
	
	private function set_isUDP(value:Bool):Bool
	{
		return _isUDP=value;
	}
	
	public var packetId(get_packetId, set_packetId):Float;
 	private function get_packetId():Float
	{
		return _packetId;
	}
	
	private function set_packetId(value:Float):Float
	{
		return _packetId = value;
	}

	public function toString():String
	{
		var str:String="{ Message id:" + _id + " }\n";
		str += "{ Dump:}\n";
		str += _content.getDump();
		
		return str;
	}
}