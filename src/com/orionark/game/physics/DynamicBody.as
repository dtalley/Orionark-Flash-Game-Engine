package com.orionark.game.physics
{
	import com.orionark.game.physics.collision.CollisionShape;
	import com.orionark.game.physics.collision.ContactPoint;
	
	import flash.geom.Point;

	public class DynamicBody
	{
		private var _position:Point, _momentum:Point, _velocity:Point;
		
		private var _mass:Number = 0;
		
		private var _collisionLayer:uint = 0;
		private var _collisionMask:uint = 0;
		
		private var _forces:Point = new Point();
		
		private var _contacts:Vector.<ContactPoint> = new Vector.<ContactPoint>();
		
		private var _shape:CollisionShape;
		
		public function DynamicBody(mass:Number, layer:uint = 0, mask:uint = 0xFFFFFFFF)
		{
			_mass = mass;
			_collisionLayer = layer;
			_collisionMask = mask;
		}
		
		public function Clear():void
		{
			_forces.x = _forces.y = 0;
			_contacts.splice(0, _contacts.length);
		}
		
		public function AddForce(force:Point):void
		{
			_forces += force;
		}
		
		public function AddShape(shape:CollisionShape):void
		{
			_shape = shape;
		}
		
		public function Sweep(shape:CollisionShape, delta:Number):ContactPoint
		{
			
			return null;
		}
		
		public function get position():Point
		{
			return _position;
		}
		
		public function get velocity():Point
		{
			return _velocity;
		}
	}
}