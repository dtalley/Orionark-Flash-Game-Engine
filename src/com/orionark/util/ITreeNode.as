package com.orionark.util {
  import com.orionark.struct.BinaryTree;
  public interface ITreeNode extends IComparableObjectNode {
    function get left():ITreeNode;
    function set left( val:ITreeNode ):void;
    function get right():ITreeNode;
    function set right( val:ITreeNode ):void;
    function get level():uint;
    function set level( val:uint ):void;
    function get tree():BinaryTree;
    function set tree( val:BinaryTree ):void;
    function copy( obj:ITreeNode ):void;
  }
}