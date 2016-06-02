package model;
public enum Type { 

  民谣, 电音;

  public String toString() {
    switch(this) {
      case 民谣: return "民谣";
      case 电音: return "电音";
      default:       return "unspecified";
    }
  }
}
