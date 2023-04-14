// Class created by Abigail, contributed by D. Templar
class Screen {
  Navigation theMenu;
  Map theMap; // initialize map screen
  InfoZone theInfo;
  Pie thePie;
  histogram theHist;  //initalize the histogram
  scatterPlot theScatter;  //initialize the scatterplot
  ArrayList widgetList;
  int screenNo;
  ControlP5 cp5;
  String[] items; String graphName;

  Screen(ArrayList<flightDatabase> flights) {
    
    theMap = new Map(); // create new map screen
    theMap.getColors(tally(flights, GET_DEST_STATE_ABR)); // uses tally method to calculate colours for each state
    theInfo = new InfoZone();
    thePie = new Pie();
    theHist = new histogram(getFlightsByDateRange("01/01/2023", "01/02/2023")); //create the histogram and set data and labels
    theScatter = new scatterPlot("Actual Arrivial Time vs Schduled Time","Flight"," Time",points1, points2); //create the histogram and set data and labels
    screenNo = 0;
    
    
    Widget Home;
    PFont stdFont=loadFont("Calibri-Bold-20.vlw");
    textFont(stdFont);
    Home = new Widget(100, SCREEN_Y-100, 100, 40,
      "Home", color(255), stdFont,
      EVENT_BUTTON5);
    widgetList = new ArrayList();
    widgetList.add(Home);
    
  }
  void draw() {
    background(bg);
    if(screenNo == 2) colorMode( HSB, 360, 0, 100);
    else colorMode(RGB, 255, 255, 255);
    
    if (screenNo == 1) theHist.HistogramDraw();  //if screen is 1 draw the graph
    else if (screenNo == 2){  
      thePie.draw();
    }
    else if (screenNo == 3) {
      theInfo.draw(narrowFlights);
      theMap.draw();
    }
    else if (screenNo == 4) {   //if screen is 4 draw the graph
      theScatter.draw();
    }
    
    for (int i = 0; i < widgetList.size(); i++) {
      Widget aWidget = (Widget) widgetList.get(i);
      aWidget.draw();
    }
  }
  void mousePressed() {
    if (screenNo == 1) theHist.dateButtons();  //if screen 1 check the date query buttons
    else if (screenNo == 3) narrowFlights = narrow(flights, theMap.mousePressed(), GET_ORIGIN_STATE_ABR);
    for (int i = 0; i<widgetList.size(); i++) {
      Widget aWidget = (Widget) widgetList.get(i);
      if ((aWidget.getEvent(mouseX, mouseY)) == EVENT_BUTTON5) screenNo = 0;
    }
  }
  void mouseMoved() {
    if (screenNo == 3) theMap.mouseMoved();
  }
}
