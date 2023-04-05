import java.util.ArrayList;
import geomerative.*;

String FILENAME = "flights_full.csv";
ArrayList<flightDatabase> flights;
ArrayList<flightDatabase> narrowFlights;

Screen theScreen;

void settings() {
  size(SCREEN_X, SCREEN_Y);
  RG.init(this); // initialize geomerative library
}

void setup() {
  flights = new ArrayList<flightDatabase>();
  narrowFlights = flights;
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
  theScreen = new Screen(flights);
}
void draw() {
  theScreen.draw();
}
void mousePressed() {
  theScreen.mousePressed();
}
void mouseMoved() {
  theScreen.mouseMoved();
}
