import java.util.ArrayList;
// make sure to install geomerative library!!!
import geomerative.*;
Map theMap; // initialize map screen
String FILENAME = "flights_full.csv";

void settings() {
  size(SCREEN_X, SCREEN_Y);
  // initialize geomerative library
  RG.init(this);
}

void setup() {
  theMap = new Map(); // create new map screen
  ArrayList<flightDatabase> flights = new ArrayList<flightDatabase>();
  try (BufferedReader br = new BufferedReader(createReader(FILENAME))) {
    String line;
    line = br.readLine(); //heading line skipped we can format it later
    while ((line = br.readLine()) != null) {
      String[] fields = line.replaceAll("\"", "").split(",");
      // Create a new flight object and add it to the ArrayList
      flights.add(new flightDatabase(fields[0], fields[1], Integer.parseInt(fields[2]), fields[3], fields[4]+fields[5], fields[6], fields[7], fields[8], fields[9], fields[10]+fields[11], fields[12], fields[13], fields[14], fields[15], fields[16], fields[17], fields[18], fields[19]));
    }
  }
  catch (Exception e) {
    e.printStackTrace();
  }
  theMap.getColors(tally(flights)); // uses tally method to calculate colours for each state
}

void draw() {
  background(BG_COLOR);
  theMap.draw(); // draws map
}
void mouseMoved() {
  theMap.mouseMoved();  // checks if mouse is hovering over state
}
void mousePressed() {
  System.out.print(theMap.mousePressed());  // state buttons!!!
}
