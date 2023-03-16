import java.util.ArrayList;

String FILENAME = "flights_full.csv";
void setup() {
  // Create an ArrayList to hold the flight data
  ArrayList<flightDatabase> flights = new ArrayList<flightDatabase>();
  try (BufferedReader br = new BufferedReader(createReader(FILENAME))) {
    String line;
    line = br.readLine(); //heading line skipped we can format it later
    while ((line = br.readLine()) != null) {
      String[] fields = line.replaceAll("\"", "").split(",");
      // Create a new flight object and add it to the ArrayList
      flights.add(new flightDatabase(fields[0],fields[1],Integer.parseInt(fields[2]),fields[3],fields[4]+fields[5],fields[6],fields[7],fields[8],fields[9],fields[10]+fields[11],fields[12],fields[13],fields[14],fields[15],fields[16],fields[17],fields[18],fields[19]));
    }
  } catch (Exception e) {
    e.printStackTrace();
  }
  
for (int i = 0; i < flights.size(); i++) {
  flightDatabase f = flights.get(i);
  System.out.println(f.FL_DATE + " " + f.MKT_CARRIER + " " + f.MKT_CARRIER_FL_NUM + " " + f.ORIGIN + " " + f.ORIGIN_CITY_NAME + " " + f.ORIGIN_STATE_ABR + " " + f.ORIGIN_WAC + " " + f.DEST + " " + f.DEST_CITY_NAME + " " + f.DEST_STATE_ABR + " " + f.DEST_WAC + " " + f.CRS_DEP_TIME + " " + f.DEP_TIME + " " + f.CRS_ARR_TIME + " " + f.ARR_TIME + " " + f.CANCELLED + " " + f.DIVERTED + " " + f.DISTANCE);
}

   
}
