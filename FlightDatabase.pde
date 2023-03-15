class flightDatabase{
  String FL_DATE;
  String MKT_CARRIER;
  int MKT_CARRIER_FL_NUM;
  String ORIGIN;
  String ORIGIN_CITY_NAME;
  String ORIGIN_STATE_ABR;
  int ORIGIN_WAC;
  String DEST;
  String DEST_CITY_NAME;
  String DEST_STATE_ABR;
  int DEST_WAC;
  int CRS_DEP_TIME;
  int DEP_TIME;
  int CRS_ARR_TIME;
  int ARR_TIME;
  boolean CANCELLED;
  boolean DIVERTED;
  int DISTANCE;
  
  flightDatabase(String FL_DATE, String MKT_CARRIER, int MKT_CARRIER_FL_NUM, String ORIGIN, String ORIGIN_CITY_NAME, String ORIGIN_STATE_ABR,
         int ORIGIN_WAC, String DEST, String DEST_CITY_NAME, String DEST_STATE_ABR, int DEST_WAC, int CRS_DEP_TIME, int DEP_TIME, 
         int CRS_ARR_TIME, int ARR_TIME, boolean CANCELLED, boolean DIVERTED, int DISTANCE){
           this.FL_DATE = FL_DATE;
           this.MKT_CARRIER = MKT_CARRIER;
           this.MKT_CARRIER_FL_NUM = MKT_CARRIER_FL_NUM;
           this.ORIGIN = ORIGIN;
           this.ORIGIN_CITY_NAME = ORIGIN_CITY_NAME;
           this.ORIGIN_STATE_ABR = ORIGIN_STATE_ABR;
           this.ORIGIN_WAC = ORIGIN_WAC;
           this.DEST = DEST;
           this.DEST_CITY_NAME = DEST_CITY_NAME;
           this.DEST_WAC = DEST_WAC;
           this.CRS_DEP_TIME = CRS_DEP_TIME;
           this.DEP_TIME = DEP_TIME;
           this.CRS_ARR_TIME = CRS_ARR_TIME;
           this.ARR_TIME = ARR_TIME;
           this.CANCELLED = CANCELLED;
           this.DIVERTED = DIVERTED;
           this.DISTANCE = DISTANCE;
         }
}
