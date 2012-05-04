package com.orionark.struct {
  import com.orionark.util.ITreeNode;
	
  public class AnderssonTree extends BinaryTree {
    
    private var _removals:Array = [];
    
    public function AnderssonTree() {}
    
    public override function add( node:ITreeNode ):void {
      node.left = null;
      node.right = null;
      node.level = 0;
      node.tree = this;
      _root = insert( _root, node );
      _size++;
    }
    
    public override function rem( node:ITreeNode ):void {
      _root = remove( _root, node );
      _size--;
    }
    
    private function insert( root:ITreeNode, node:ITreeNode ):ITreeNode {
      if ( !nodeValid(root) ) {
        root = node;
        root.level = 1;
      } else if ( root.compare( node ) == 0 ) {
        //throw new Error( "Duplicate found!" );
        return root;
      } else {
        if ( root.compare( node ) < 0 ) {
          root.right = insert( root.right, node );
        } else {
          root.left = insert( root.left, node );
        }
        root = skew( root );
        root = split( root );
      }
      return root;
    }
    
    private function remove( root:ITreeNode, node:ITreeNode ):ITreeNode {
      if ( !nodeValid(root) || !nodeValid(node) ) {
        return root;
      }
      if ( root.compare( node ) == 0 ) {
        if ( nodeValid(root.left) && nodeValid(root.right) ) {
          var heir:ITreeNode = root.left;
          while ( nodeValid(heir.right) ) {
            heir = heir.right;
          }
          root.copy( heir );
          root.left = remove( root.left, heir );
        } else {
          var removal:ITreeNode = root;
          if ( nodeValid( root.left ) ) {
            root = root.left;
          } else {
            root = root.right;
          }
          removal.left = null;
          removal.right = null;
          removal.tree = null;
          _removals.push( removal );
        }
      } else {
        if ( root.compare( node ) < 0 ) {
          root.right = remove( root.right, node );
        } else {
          root.left = remove( root.left, node );
        }
      }
      if  ( root && ( ( getLevel( root.left ) < root.level - 1 ) || ( getLevel( root.right ) < root.level - 1 ) ) ) {
        root.level--;
        if ( nodeValid( root.right ) && root.right.level > root.level ) {
          root.right.level = root.level;
        }
        root = skew( root );
        root = split( root );
      }      
      return root;
    }
    
    private function skew( root:ITreeNode ):ITreeNode {
      if ( nodeValid(root) ) {
        if ( nodeValid(root.left) && root.left.level == root.level ) {
          var save:ITreeNode = root;
          root = root.left;
          save.left = root.right;
          root.right = save;
        }
        root.right = skew( root.right );
      }
      return root;
    }
    
    private function split( root:ITreeNode ):ITreeNode {
      if ( nodeValid(root) && nodeValid(root.right) && nodeValid(root.right.right) && root.right.right.level == root.level ) {
        var save:ITreeNode = root;
        root = root.right;
        save.right = root.left;
        root.left = save;
        root.level += 1;
        root.right = split( root.right );
      }
      return root;
    }
    
    private function nodeValid( node:ITreeNode ):Boolean {
      if ( node && node.level != 0 ) {
        return true;
      }
      return false;
    }
    
    private function getLevel( node:ITreeNode ):uint {
      if ( !node ) {
        return 0;
      }
      return node.level;
    }
    
    public function nextRemoval():ITreeNode {
      if ( _removals.length > 0 ) {
        return _removals.shift();
      }
      return null;
    }
    
  }

}