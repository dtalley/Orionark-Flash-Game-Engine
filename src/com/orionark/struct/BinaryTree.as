package com.orionark.struct {
  import com.orionark.util.ITreeNode;
	
  public class BinaryTree {
    
    protected var _root:ITreeNode;
    protected var _size:uint = 0;
    private var _iterator:TreeIterator;
    
    public function BinaryTree() { }
    
    public function add( node:ITreeNode ):void {
      
    }
    
    public function rem( node:ITreeNode ):void {
      
    }
    
    public function get root():ITreeNode {
      return _root;
    }
    
    public function get size():uint {
      return _size;
    }
    
    public function createIterator( type:uint = 0 ):TreeIterator {
      if ( !_iterator ) {
        _iterator = new TreeIterator( this, type );
      }
      return _iterator;
    }
    
  }

}