package com.orionark.game.render {
  import flash.display.Bitmap;
  import flash.display.BitmapData;
  import flash.display.IBitmapDrawable;
  import flash.display.Sprite;
  import flash.geom.ColorTransform;
  import flash.geom.Matrix;
  import flash.geom.Point;
  import flash.geom.Rectangle;
	
  public class BasicFrame extends Sprite {
    
    private var _layers:Array;
    private var _width:uint;
    private var _height:uint;
    
    private var _screen:Bitmap;
    
    public function BasicFrame( width:Number, height:Number ) {
      _width = Math.ceil( width );
      _height = Math.ceil( height );
      _layers = [];
      _layers.push( new BitmapData( _width, _height, false, 0xFFFFFFFF ) );
      
      _screen = new Bitmap( new BitmapData( _width, _height, false, 0xFFFFFFFF ) );
      addChild( _screen );
    }
    
    public function clearColor( color:uint ):void {
      var data:BitmapData = BitmapData( _layers[0] );
      data.fillRect( data.rect, color );
      var totalLayers:uint = _layers.length;
      for ( var i:uint = 1; i < totalLayers; i++ ) {
        data = BitmapData( _layers[i] );
        data.fillRect( data.rect, 0 );
      }
    }
    
    public function resize( width:Number, height:Number ):void {
      _width = Math.ceil( width );
      _height = Math.ceil( height );
      var totalLayers:uint = _layers.length;
      for ( var i:uint = 0; i < totalLayers; i++ ) {
        _layers[i] = new BitmapData( _width, _height, i == 0 ? false : true, 0 );
      }
    }
    
    public function draw( layer:uint, source:BitmapData, matrix:Matrix = null, transform:ColorTransform = null, blend:String = null, clip:Rectangle = null, smoothing:Boolean = false ):void {
      if ( _layers.length <= layer ) {
        var totalLayers:uint = _layers.length;
        for ( var i:uint = totalLayers; i < layer + 1 - totalLayers; i++ ) {
          _layers[i] = new BitmapData( _width, _height, true, 0 );
        }
      }
      _layers[i].copyPixels( source, source.rect, new Point( matrix.tx, matrix.ty ) );
    }
    
    public function swap():void {
      var total:uint = _layers.length;
      for ( var i:uint = 0; i < total; i++ ) {
        _screen.bitmapData.copyPixels( _layers[i], _layers[i].rect, new Point( 0, 0 ) );
      }
    }
    
  }

}