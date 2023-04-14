import java.util.ArrayList;

piechartmain pi;
//float hue; 
String FILENAME = "flights_full.csv";

Slider slider1;
int mod;
float col;
public int jfk = 0;
public  ArrayList<flightDatabase> flights = new ArrayList<flightDatabase>();
public  ArrayList<flightDatabase> flightsselect = new ArrayList<flightDatabase>();

int strokecolor1 = 0;
int strokecolor2= 0;
int strokecolor3 = 0;

boolean stroke1 = false;
boolean stroke2 = false;
boolean stroke3 = false;
int boxcolor = 0;
ArrayList screenList;
ArrayList widgetList;


   Screen sc1 = new Screen(255);
    Screen sc2 = new Screen(100);
        Screen sc3 = new Screen(0);
            Screen sc4 = new Screen(170);
                Screen sc5 = new Screen(220);
                
void settings() {
  size(SCREEN_X, SCREEN_Y);
}
void setup() {
  PFont stdFont;

Screen screen1, screen2, screen3, screen4, screen5;
  stdFont=loadFont("Arial-BoldMT-48.vlw");
  textFont(stdFont);

  
  
    
 

 
  
   stdFont=loadFont("Arial-BoldMT-48.vlw");
  textFont(stdFont);
 

 
 slider1 = new Slider( 10,240, 200, 30, 0, 100, "Hue");  
 //slider1 = new Slider( 10,240, 200, 30, 0, 100, "Hue");
 pi = new piechartmain(mod);
// colorMode( HSB, 360,100,100);
 // hue = slider1.sliderVal;  
  // Create an ArrayList to hold the flight data
 
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
 
  

  for (int k = 0; k < flights.size(); k++) {
    flightDatabase f = flights.get(k);

 

   // System.out.println(f.FL_DATE + " " + f.MKT_CARRIER + " " + f.MKT_CARRIER_FL_NUM + " " + f.ORIGIN + " " + f.ORIGIN_CITY_NAME + " " + f.ORIGIN_STATE_ABR + " " + f.ORIGIN_WAC + " " + f.DEST + " " + f.DEST_CITY_NAME + " " + f.DEST_STATE_ABR + " " + f.DEST_WAC + " " + f.CRS_DEP_TIME + " " + f.DEP_TIME + " " + f.CRS_ARR_TIME + " " + f.ARR_TIME + " " + f.CANCELLED + " " + f.DIVERTED + " " + f.DISTANCE);
  }







  noStroke();
}


void draw() {
  screenList = new ArrayList();
  screenList.add(sc1);
  screenList.add(sc2);
   screenList.add(sc3);
    screenList.add(sc4);
      screenList.add(sc5);
   for (int i = 0; i<screenList.size(); i++) {
    Screen aScreen = (Screen)screenList.get(screen);
    aScreen.draw();

  
   
  }
  
     
if(boxcolor == 1){
  fill(255,0,0);
} else if(boxcolor == 2){
  
  fill(69,75,27);
} else if(boxcolor == 3){
  
  fill(137,207,240);
}
  
  
 
  rect(400,100,100,100);
  
  if(screen == 1){
 pi.draw();
  }
           
}
