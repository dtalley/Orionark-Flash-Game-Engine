package com.orionark.game.physics
{
	public interface IMotionListener
	{
		function updatePosition(x:Number, y:Number):void;
		function updateVelocity(x:Number, y:Number):void;
	}
}