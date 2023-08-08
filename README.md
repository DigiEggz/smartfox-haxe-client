SmartFoxServer 2X Haxe Client API   
======================= 

This fork adds support for encrypted connections + other improvements. Pull requests are welcome!

Platforms
====
|Platform|Support|
|--|--|
|HTML5|WS/WSS|
|Flash|WS/WSS/Socket/BlueBox|
|Adobe AIR|WS/Socket/BlueBox|
|Windows|WS/WSS/Socket/BlueBox|
|Linux|Untested|
|macOS|Socket/BlueBox|
|Android|Socket/BlueBox|
|iOS|Socket/BlueBox|
|Neko|Socket/BlueBox|
|Emscripten|Untested|
    
----------------------------------    
    
Instructions
=====  
Installation: 
```
haxelib git smartfox-haxe-client https://github.com/Metlmeta/smartfox-haxe-client.git
```    

Add the following line to your project.xml:    
```
<haxelib name="smartfox-haxe-client"/>
```
Usage is very similar to the AS3 API. Check out AS3 examples here:    
http://docs2x.smartfoxserver.com/ExamplesFlash/introduction    
  
To-do
====
* test app   
* improve typing

Contributors
====
A special thanks to **Vincent Blanchet** for the [original port](https://github.com/boorik/smartfox-haxe-client) and to everyone else who has helped make this project what it is.
