package model;
public enum Builder { 

  aaa, bbb, ccc, ddd, eee, fff, ggg, hhh;

  public String toString() {
    switch(this) {
      case aaa:   return "aaa";
      case bbb:   return "bbb";
      case ccc:   return "ccc";
      case ddd: return "ddd";
      case eee:    return "eee";
      case fff:     return "fff";
      case ggg :     return "ggg";
      default:       return "Unspecified";
    }
  }
}
