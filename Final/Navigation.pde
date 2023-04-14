//Created by D. Tempalr
import controlP5.*;
import java.util.*;
  
class Navigation {
  
  int x, y, widthSize, heightSize;
  int barY;
  String[] items = {"a", "b", "c", "d"};
  String listName;
  ControlP5 cp5;

  Navigation(ControlP5 cp5, int x, int y, int widthSize, int heightSize, int barY, String[] items, String listName) {
    this.cp5 = cp5;
    this.x = x;
    this.y = y;
    this.widthSize = widthSize;
    this.heightSize = heightSize;
    this.barY = barY;
    this.items = items;
    this.listName = listName;
  }
}
