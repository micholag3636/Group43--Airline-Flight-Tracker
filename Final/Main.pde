// Created by Abigail Bosch, Contributed by D. Templar, Avani Sharma
import java.util.ArrayList;
import geomerative.*;
import grafica.*;
PImage bg,bg2,loadingImage;
GPlot plot,plot1;
GPointsArray points1,points2;
String FILENAME = "flights_full.csv";
ArrayList<flightDatabase> flights;
ArrayList<flightDatabase> narrowFlights;
boolean done=false;
int on = 1;

ControlP5 cp5;
Screen theScreen;

void settings() {
  size(SCREEN_X, SCREEN_Y);
  RG.init(this); // initialize geomerative library
}

void setup() {
  loadingImage=loadImage("loading.gif");   //load image for loading screen
  bg = loadImage("bg.jpg"); //load a home screen background
  bg2 = loadImage("plainBG.png");  //load a plain background
  bg.resize(SCREEN_X, SCREEN_Y);  //resize both images to fit out screen size
  bg2.resize(SCREEN_X, SCREEN_Y);
  plot = new GPlot(this);  //to create the plot for histogram
  plot1 = new GPlot(this);  //to create the plot for scatterplot
  cp5 = new ControlP5(this);
  
  flights = new ArrayList<flightDatabase>();  //create an arraylist to store our file data
  new Thread(new Runnable() {        //creates a new thread where runnable defines the task: Multi-threadig done by Avani Sharma, Helped by D. Templar
    public void run() {              //run method is implemeted
  flights = new ArrayList<flightDatabase>();
  narrowFlights = flights;
  try (BufferedReader br = new BufferedReader(createReader(FILENAME))) {   //creates a buffered reader and file reader which read data from the csv file 
    String line;                                                           //Created by Avani Sharma
    line = br.readLine(); //heading line skipped  
    while ((line = br.readLine()) != null) {
      String[] fields = line.replaceAll("\"", "").split(",");
      // Create a new flight object and add it to the ArrayList
      flights.add(new flightDatabase(fields[0], fields[1], Integer.parseInt(fields[2]), fields[3], fields[4]+fields[5], fields[6], fields[7], fields[8], fields[9], fields[10]+fields[11], fields[12], fields[13], fields[14], fields[15], fields[16], fields[17], fields[18], fields[19]));
    }
  }
  catch (Exception e) {
    e.printStackTrace();   
  }
  
  points1 = new GPointsArray(flights.size());   //creates data array for scatterplot
  points2 = new GPointsArray(flights.size());
    for (int i = 0; i < flights.size(); i++) {
        flightDatabase f= flights.get(i);
        int v,v1;
        if(f.CRS_ARR_TIME=="") v=0;
        else v=Integer.parseInt(f.CRS_ARR_TIME);
        if(f.ARR_TIME=="") v1=0;
        else v1=Integer.parseInt(f.ARR_TIME);
        points1.add(i,v);
        points2.add(i,v1);
    }
  
    
  //Dropdown Menu by D. Templar
   
  theScreen = new Screen(flights);
  narrowFlights = flights;
  done=true;                  //indicates the data has been loaded
   List Graph = Arrays.asList("Histogram", "Pie Chart", "Map Menu","ScatterPlot");
    cp5.addScrollableList("Graph")
       .setPosition(1300, 660)
       .setSize(200,200)
       .setBarHeight(40)
       .setItemHeight(40)
       .addItems(Graph)
       .setOpen(true);
       
  }   
  }).start();
 
}

int getMaxNumber(ArrayList<flightAndDate> f){  //function by Avani Sharma to find the max number of flights that flew on a particular date
  int max=1;                                   //sets it to 1 default (used to plot y axis limit)
  for(flightAndDate flight:f){
    if(flight.number>max) max=flight.number;
  }
  return max;
}

 String convert(String date){   //Made by Avani Sharma
  String parts[]=date.split("/");     //splits a date as the date also contains time we seprate and write them
  if(parts[0].length()==1) parts[0]="0"+parts[0];
  if(parts[1].length()==1) parts[1]="0"+parts[1];
  return parts[0]+"/"+parts[1]+"/"+parts[2];
 }

   ArrayList<flightAndDate> getFlightsByDateRange(String startDate, String endDate) {  //Made by Avani Sharma
   ArrayList<flightAndDate> result = new ArrayList<>();   //function to sort data from the arraylist and store it into another arraylist based on the start date and end date
   startDate=convert(startDate);  //normalise the string
   endDate=convert(endDate);
  for (int i=0;i<flights.size();i++) {
    flightDatabase flight=flights.get(i);
    String flightDate = flight.FL_DATE.split(" ")[0];  //seprate the date and time and normalise the date
    flightDate=convert(flightDate);
    if (flightDate.compareTo(startDate) >= 0 && flightDate.compareTo(endDate) <= 0) {  //if date is equal
      int ct=0;
      for(flightAndDate fDate : result){   //if date already in our new arrayList ct++ else add date and set number to 1
        if (flightDate.compareTo(fDate.getDate())==0) ct++;
        if (ct > 0) fDate.number++;
      }
      if (ct==0) result.add(new flightAndDate(flightDate));  
  }
  }
  return result;
}

void draw() {
  if (!done) {
    image(loadingImage, 0, 0, width, height);   //loads an image(loading screen) until the thread is done
  } else {
  theScreen.draw();
  }
}
void mousePressed() {
  if(done){
  theScreen.mousePressed();
  }
}
void mouseMoved() {
  if(done) theScreen.mouseMoved();
}

// Input return by D. Templar
void Graph(int index){
  String holder = cp5.get(ScrollableList.class, "Graph").getItem(index).get("value").toString();
  theScreen.screenNo = Integer.parseInt(holder) + 1;
  on = 0;
}
