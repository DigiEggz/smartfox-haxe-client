SmartFoxServer 2X Haxe Client API   
======================= 

This fork adds support for encrypted connections + other improvements. Pull requests are welcome!

|Platform|Support|
|--|--|
|HTML5|WS/WSS|
|Flash|WS/WSS/Socket/BlueBox|
|Adobe AIR|WS/Socket/BlueBox|
|Windows|WS/WSS/Socket/BlueBox|
|Linux|Untested|
|macOS|Socket/BlueBox|
|Android|Untested|
|iOS|Socket/BlueBox|
|Neko|Socket/BlueBox|
|Emscripten|Untested|

CURRENTLY WORKING WITH :  
----------------------------------  

haxe: 4.2.2
    
lime: 7.9.0  
    
openfl: 9.1.0  
    
crypto: 1.0.2  
  
colyseus-websocket: 1.0.10
    
----------------------------------    
    
Instructions
=====  
Installation: 
```
haxelib git smartfox-haxe-client https://github.com/barisyild/smartfox-haxe-client.git
```    

Add the following line to your project.xml:    
```
<haxelib name="smartfox-haxe-client"/>
```
Usage is very similar to the AS3 API. Check out AS3 examples here:    
http://docs2x.smartfoxserver.com/ExamplesFlash/introduction    
  
TODO:  
====
* test app   
* improve typing

Contributors
====
A special thanks to **Vincent Blanchet** for the [original port](https://github.com/boorik/smartfox-haxe-client) and to everyone else who has helped make this project what it is.