package com.orionark.struct {
  import com.orionark.util.ILinkedObjectNode;
  
  public class ListIterator {
    
    private var _list:LinkedList;
    private var _type:uint;
    private var _current:ILinkedObjectNode;
    
    public function ListIterator( list:LinkedList, type:uint = ListIterator.FORWARD ) {
      _type = type;
      _list = list;
    }
    
    private function init():void {
      if ( _type == ListIterator.FORWARD ) {
        _current = _list.first;
      } else {
        _current = _list.last;
      }
    }
    
    public function getNext():ILinkedObjectNode {
      if ( _type == ListIterator.FORWARD ) {
        return getNextForward();
      }
      return getNextReverse();
    }
    
    private function getNextForward():ILinkedObjectNode {
      var node:ILinkedObjectNode = _current;
      if( node ) {
        _current = ( node.next as ILinkedObjectNode );
      } else {
        init();
      }
      return node;
    }
    
    private function getNextReverse():ILinkedObjectNode {
      var node:ILinkedObjectNode = _current;
      if( node ) {
        _current = node.prev;
      }
      return node;
    }
    
    public static const FORWARD:uint = 0;
    public static const REVERSE:uint = 1;
    
  }

}