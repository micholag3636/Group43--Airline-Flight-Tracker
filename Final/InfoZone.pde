class InfoZone {

  InfoZone() {}
  void draw(ArrayList<flightDatabase> flights) {
    background(bg2);
    noStroke();
    fill(BG_COLOR);
    rect(SCREEN_X-BORDER-400, BORDER, 400, 500);
    int average = 0;
    int noCancel = 0;
    for (int i=0; i < flights.size(); i++) {
      flightDatabase f = flights.get(i);
      average += f.DISTANCE;
      if (f.CANCELLED) noCancel ++;
    }
    if (flights.size() < 1) average = 0;
    else average = average/ flights.size();

    
    
    PFont inFont = loadFont("Calibri-Bold-20.vlw");
    textFont(inFont);
    fill(0);
    text("Number of flights: " + flights.size(), (SCREEN_X-BORDER-380), (BORDER+100));   
    text("Average flight distance: " + average + " miles", (SCREEN_X-BORDER-380), (BORDER+150));
    text("Number of cancellations: " + noCancel, (SCREEN_X-BORDER-380), (BORDER+200));
  }
}
