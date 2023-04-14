//Created by Abigail, contributed and edited by D. Tempalr
import controlP5.*;
import java.util.*;
  
class Navigation {
  ArrayList widgetList;
  PFont stdFont;
  color bgcolor;
  
  int x, y, widthSize, heightSize;
  int barY;
  String[] items = {"a", "b", "c", "d"};
  String listName;
  ControlP5 cp5;

  Navigation(ControlP5 cp5, int x, int y, int widthSize, int heightSize, int barY, String[] items, String listName) {
    bgcolor = 255;
    Widget widget1, widget2, widget3;
    stdFont=loadFont("Calibri-Bold-20.vlw");
    textFont(stdFont);
    widget1=new Widget(100, 100, 100, 40,
      "Red", color(255, 0, 0), stdFont,
      EVENT_BUTTON1);
    widget2=new Widget(100, 200, 100, 40,
      "Green", color(0, 255, 0), stdFont, EVENT_BUTTON2);
    widget3=new Widget(100, 300, 100, 40,
      "Map!", color(0, 0, 255), stdFont, EVENT_BUTTON3);
    widgetList = new ArrayList();
    widgetList.add(widget1);
    widgetList.add(widget2);
    widgetList.add(widget3);
    
    this.cp5 = cp5;
    this.x = x;
    this.y = y;
    this.widthSize = widthSize;
    this.heightSize = heightSize;
    this.barY = barY;
    this.items = items;
    this.listName = listName;
  }

  void draw() {
    background(bgcolor);
    for (int i = 0; i<widgetList.size(); i++) {
      Widget aWidget = (Widget) widgetList.get(i);
      aWidget.draw();
    }
    
    
  }

  int mousePressed() {
    int event;
    for (int i = 0; i<widgetList.size(); i++) {
      Widget aWidget = (Widget) widgetList.get(i);
      event = aWidget.getEvent(mouseX, mouseY);
      switch(event) {
      case EVENT_BUTTON1:
        return 1;
      case EVENT_BUTTON2:
        return 2;
      case EVENT_BUTTON3:
        return 3;
      }
    }
    return 0;
  }
  void mouseMoved() {
    int possy = 0;
    for (int i = 0; i<widgetList.size(); i++) {
      Widget aWidget = (Widget) widgetList.get(i);
      possy = aWidget.getEvent(mouseX, mouseY);
    }
  }
}
