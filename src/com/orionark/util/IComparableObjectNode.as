package com.orionark.util {
  public interface IComparableObjectNode extends ILinkedObjectNode {
    function compare( obj:IComparableObjectNode ):int;
  }
}