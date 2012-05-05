package com.orionark.game.physics.collision
{
	public class CollisionCircle extends CollisionShape
	{
		private var _radius:Number;
		
		public function CollisionCircle(radius:Number)
		{
			super();
			_radius = radius;
		}
		
		public function get radius():Number
		{
			return _radius;
		}
	}
}