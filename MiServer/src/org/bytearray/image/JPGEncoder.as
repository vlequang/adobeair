package org.bytearray.image
{
	import cmodule.as3_jpeg_wrapper.CLibInit;
	
	import flash.display.BitmapData;
	import flash.utils.ByteArray;
	
	import mx.graphics.codec.IImageEncoder;
	
	public class JPGEncoder implements IImageEncoder
	{
		private var as3_jpeg_wrapper: Object;
		public var quality:int;
		public function JPGEncoder(quality:int) {
			this.quality = quality;
			var loader:CLibInit = new CLibInit;
			as3_jpeg_wrapper = loader.init();
		}
		
		public function get contentType():String
		{
			return "image/jpeg";
		}
		
		public function encode(bitmapData:BitmapData):ByteArray
		{
			return encodeByteArray(bitmapData.getPixels(bitmapData.rect),bitmapData.width,bitmapData.height,bitmapData.transparent);
		}
		
		public function encodeByteArray(byteArray:ByteArray, width:int, height:int, transparent:Boolean=true):ByteArray
		{
			var baAlchmey: ByteArray = as3_jpeg_wrapper.write_jpeg_file(byteArray, width, height, 3, 2, quality);	
			return baAlchmey;
		}
	}
}