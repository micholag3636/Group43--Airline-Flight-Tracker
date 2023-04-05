class Navigation {
  ArrayList widgetList;
  PFont stdFont;
  color bgcolor;

  Navigation() {
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
        return 0;
      case EVENT_BUTTON2:
        return 2;
      case EVENT_BUTTON3:
        return 3;
      }
    }
    return 6;
  }
  void mouseMoved() {
    int possy = 0;
    for (int i = 0; i<widgetList.size(); i++) {
      Widget aWidget = (Widget) widgetList.get(i);
      possy = aWidget.getEvent(mouseX, mouseY);
    }
  }
}
