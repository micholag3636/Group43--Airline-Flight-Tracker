class Screen {
  Navigation theMenu;
  Map theMap; // initialize map screen
  InfoZone theInfo;
  Pie thePie;
  
  ArrayList widgetList;
  int screenNo;

  Screen(ArrayList<flightDatabase> flights) {
    theMenu = new Navigation();
    theMap = new Map(); // create new map screen
    theMap.getColors(tally(flights, GET_DEST_STATE_ABR)); // uses tally method to calculate colours for each state
    theInfo = new InfoZone();
    thePie = new Pie();
    screenNo = 0;
    
    Widget Home;
    PFont stdFont=loadFont("Calibri-Bold-20.vlw");
    textFont(stdFont);
    Home = new Widget(100, SCREEN_Y-100, 100, 40,
      "Home", color(255, 0, 0), stdFont,
      EVENT_BUTTON5);
    widgetList = new ArrayList();
    widgetList.add(Home);
    
  }
  void draw() {
    background(BG_COLOR);
    if (screenNo == 0 ) theMenu.draw();
    // Comment in when adding screen
//    else if (screenNo == 1) whatever.draw();
    else if (screenNo == 2)  thePie.draw();
    else if (screenNo == 3) {
      theMap.draw();
      theInfo.draw(narrowFlights);
    }
    for (int i = 0; i < widgetList.size(); i++) {
      Widget aWidget = (Widget) widgetList.get(i);
      aWidget.draw();
    }
  }
  void mousePressed() {
    if (screenNo == 0) screenNo = theMenu.mousePressed();
    else if (screenNo == 3) narrowFlights = narrow(flights, theMap.mousePressed(), GET_ORIGIN_STATE_ABR);
    for (int i = 0; i<widgetList.size(); i++) {
      Widget aWidget = (Widget) widgetList.get(i);
      if ((aWidget.getEvent(mouseX, mouseY)) == EVENT_BUTTON5) screenNo = 0;
    }
  }
  void mouseMoved() {
    if (screenNo == 0) theMenu.mouseMoved();
    else if (screenNo == 3) theMap.mouseMoved();
  }
}
