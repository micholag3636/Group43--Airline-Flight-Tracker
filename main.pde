import java.util.ArrayList;
ArrayList<flightDatabase> flights = new ArrayList<flightDatabase>();
String FILENAME = "flights_full.csv";
import grafica.*;

GPlot plot;


void setup() {
  size(1650,940);
  try (BufferedReader br = new BufferedReader(createReader(FILENAME))) {
    String line;
    line = br.readLine(); //heading line skipped we can format it later
    while ((line = br.readLine()) != null) {
      String[] fields = line.replaceAll("\"", "").split(",");
      flights.add(new flightDatabase(fields[0],fields[1],Integer.parseInt(fields[2]),fields[3],fields[4]+fields[5],fields[6],fields[7],fields[8],fields[9],fields[10]+fields[11],fields[12],fields[13],fields[14],fields[15],fields[16],fields[17],fields[18],fields[19]));
    }
  } catch (Exception e) {
    e.printStackTrace();
  }

   plot = new GPlot(this);
   plot.setDim(1000,500);
  plot.setPos(50, 50);

  // Set the title and axis labels
  plot.setTitleText("Flight Schedule");
  plot.getXAxis().setAxisLabelText("Date");
  plot.getYAxis().setAxisLabelText("Number of Flights");
  
    String StartDate="1/1/2022";
    String EndDate="1/31/2022";
    ArrayList<flightAndDate> flightsInRange = getFlightsByDateRange(StartDate,EndDate);
    plot.startHistograms(GPlot.VERTICAL);
    GPointsArray points = new GPointsArray(flightsInRange.size());
      
  
  // Add each date and corresponding number of flights as a point in the data series
  for (int i = 0; i < flightsInRange.size(); i++) {
    flightAndDate f = flightsInRange.get(i);
    System.out.println(f.getDate()+" "+f.number);
    points.add(i, f.number,f.getDate());
  }
  

  plot.setPoints(points);

  
  
  plot.setXLim(0, 15);
  plot.setYLim(0, getMaxNumber(flightsInRange));
  plot.activatePanning();
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
    background(255);    
    plot.beginDraw();
    plot.drawBox();
    plot.drawXAxis();
    plot.drawYAxis();
    plot.drawTitle();
    plot.drawGridLines(GPlot.VERTICAL);
    plot.drawGridLines(GPlot.HORIZONTAL);
    plot.getHistogram().setDrawLabels(true);
    plot.getHistogram().setLabelsOffset(23);
    plot.drawHistograms();
    //plot.drawFilledContours(GPlot.HORIZONTAL, 0);
    //plot.drawPoints();
    plot.endDraw();
    
}

  
  
