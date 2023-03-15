import java.util.ArrayList;

String FILENAME = "Book1.csv";
void setup() {
  // Create an ArrayList to hold the flight data
  ArrayList<flightDatabase> flights = new ArrayList<flightDatabase>();
  try (BufferedReader br = new BufferedReader(createReader(FILENAME))) {
    String line;
    line = br.readLine(); //heading line skipped we can format it later
    while ((line = br.readLine()) != null) {
      String[] fields = line.replaceAll("\"", "").split(",");
      // Create a new flight object and add it to the ArrayList
      flights.add(new flightDatabase(fields[0],fields[1],Integer.parseInt(fields[2]),fields[3],fields[4],fields[5],fields[6],fields[7],fields[8],fields[9],fields[10],fields[11],fields[12],fields[13],fields[14],fields[15],fields[16],fields[17]));
    for(int i=0;i<17;i++) print(fields[i]+" " );
    println(fields[17]);
    }
  } catch (Exception e) {
    e.printStackTrace();
  }
  
   
}
