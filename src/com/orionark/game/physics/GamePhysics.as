package com.orionark.game.physics
{
	public class GamePhysics
	{
		private var _timer:Number = 0;
		private var _bodies:Vector.<DynamicBody> = new Vector.<DynamicBody>();
		
		public function GamePhysics()
		{
			
		}
		
		public function AddDynamicBody(body:DynamicBody):void
		{
			if( _bodies.indexOf(body) < 0 )
			{
				_bodies.push(body);
			}
		}
		
		public function RemoveDynamicBody(body:DynamicBody):void
		{
			if( _bodies.indexOf(body) >= 0 )
			{
				_bodies.splice(_bodies.indexOf(body), 1);
			}
		}
		
		public function Step(delta:Number):void
		{
			for each( var body:DynamicBody in _bodies )
			{
				
			}
		}
	}
}