package com.orionark.util {	
  import com.orionark.struct.BinaryTree;
  public class TreeNode extends OrderedListNode implements ITreeNode {    
    private var _left:ITreeNode;
    private var _right:ITreeNode;
    protected var _level:uint;
    private var _next:IObjectNode;
    private var _tree:BinaryTree;
    public function get left():ITreeNode {
      return _left;
    }
    public function set left( val:ITreeNode ):void {
      _left = val;
    }
    public function get right():ITreeNode {
      return _right;
    }
    public function set right( val:ITreeNode ):void {
      _right = val;
    }
    public function get level():uint {
      return _level;
    }
    public function set level( val:uint ):void {
      _level = val;
    }    
    public function get tree():BinaryTree {
      return _tree;
    }
    public function set tree( val:BinaryTree ):void {
      _tree = val;
    }
    public function copy( obj:ITreeNode ):void {
      
    }
  }
}