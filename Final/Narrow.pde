ArrayList<flightDatabase> narrow(ArrayList<flightDatabase> flights, String prompt, int type) {
  ArrayList<flightDatabase> narrowFlights = new ArrayList<flightDatabase>();
  for (int i = 0; i < flights.size(); i++)
  {
    String state = "";
    flightDatabase f = flights.get(i);
    if (type == GET_ORIGIN_STATE_ABR) state = f.ORIGIN_STATE_ABR;
    else if (type == GET_DEST_STATE_ABR) state = f.DEST_STATE_ABR;
    if (state.equals(prompt)) {
      narrowFlights.add(new flightDatabase(f.FL_DATE, f.MKT_CARRIER, 
      f.MKT_CARRIER_FL_NUM, f.ORIGIN, f.ORIGIN_CITY_NAME, f.ORIGIN_STATE_ABR, 
      str(f.ORIGIN_WAC), f.DEST, f.DEST_CITY_NAME, f.DEST_STATE_ABR, str(f.DEST_WAC), 
      f.CRS_DEP_TIME, f.DEP_TIME, f.CRS_ARR_TIME, f.ARR_TIME, str(f.CANCELLED), str(f.DIVERTED),
      Double.toString(f.DISTANCE)));
    }
  }
  return narrowFlights;
}
