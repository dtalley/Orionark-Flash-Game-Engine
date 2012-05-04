package com.orionark.util {
  import flash.events.IEventDispatcher;
  
  public interface IQueueLoadable extends IEventDispatcher {
    function load():void;
    function cancel():void;    
    function get loaded():Boolean;
  }

}