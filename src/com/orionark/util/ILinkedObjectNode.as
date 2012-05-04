package com.orionark.util {
  import com.orionark.struct.LinkedList;
  public interface ILinkedObjectNode extends IObjectNode {
    function set prev( val:ILinkedObjectNode ):void;
    function get prev():ILinkedObjectNode;
    function set list( val:LinkedList ):void;
    function get list():LinkedList;
  }
}