import java.util.ArrayList;
import geomerative.*;
import grafica.*;

GPlot plot;

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
  plot = new GPlot(this);
  theScreen = new Screen(flights);
}


int getMaxNumber(ArrayList<flightAndDate> f){
  int max=1;
  for(flightAndDate flight:f){
    if(flight.number>max) max=flight.number;
  }
  return max;
}

 String convert(String date){
  String parts[]=date.split("/");
  if(parts[0].length()==1) parts[0]="0"+parts[0];
  if(parts[1].length()==1) parts[1]="0"+parts[1];
  return parts[0]+"/"+parts[1]+"/"+parts[2];
 }

   ArrayList<flightAndDate> getFlightsByDateRange(String startDate, String endDate) {
   ArrayList<flightAndDate> result = new ArrayList<>();
   startDate=convert(startDate);
   endDate=convert(endDate);
  for (int i=0;i<flights.size();i++) {
    flightDatabase flight=flights.get(i);
    String flightDate = flight.FL_DATE.split(" ")[0];
    flightDate=convert(flightDate);
    if (flightDate.compareTo(startDate) >= 0 && flightDate.compareTo(endDate) <= 0) {
      int ct=0;
      for(flightAndDate fDate : result){
        if (flightDate.compareTo(fDate.getDate())==0) ct++;
        if (ct > 0) fDate.number++;
      }
      if (ct==0) result.add(new flightAndDate(flightDate));  
  }
  }
  return result;
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
