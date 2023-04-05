class InfoZone {
  InfoZone() {}
  void draw(ArrayList<flightDatabase> flights) {
    int average = 0;
    for (int i=0; i < flights.size(); i++) {
      flightDatabase f = flights.get(i);
      average += f.DISTANCE;
    }
    if (flights.size() < 1) average = 0;
    else average = average/ flights.size();
    PFont inFont = loadFont("Calibri-Bold-20.vlw");
    textFont(inFont);
    fill(0);
    text("Number of flights: " + flights.size(), (SCREEN_X-BORDER-250), (BORDER+100));   
    text("Average flight distance: " + average, (SCREEN_X-BORDER-250), (BORDER+150));   
  }
}
