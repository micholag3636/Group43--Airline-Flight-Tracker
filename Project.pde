import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

public class flightDatabase {
    
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
     String CRS_DEP_TIME;
     String DEP_TIME;
     String CRS_ARR_TIME;
     String ARR_TIME;
     boolean CANCELLED;
     boolean DIVERTED;
     double DISTANCE;

     flightDatabase(String FL_DATE, String MKT_CARRIER, int MKT_CARRIER_FL_NUM, String ORIGIN, String ORIGIN_CITY_NAME, String ORIGIN_STATE_ABR,
             String ORIGIN_WAC, String DEST, String DEST_CITY_NAME, String DEST_STATE_ABR, String DEST_WAC, String CRS_DEP_TIME, String DEP_TIME, 
             String CRS_ARR_TIME, String ARR_TIME, String CANCELLED, String DIVERTED, String DISTANCE) {
               
        this.FL_DATE = FL_DATE;
        this.MKT_CARRIER = MKT_CARRIER;
        this.MKT_CARRIER_FL_NUM = MKT_CARRIER_FL_NUM;
        this.ORIGIN = ORIGIN;
        this.ORIGIN_CITY_NAME = ORIGIN_CITY_NAME;
        this.ORIGIN_STATE_ABR = ORIGIN_STATE_ABR;
        this.ORIGIN_WAC = Integer.parseInt(ORIGIN_WAC);
        this.DEST = DEST;
        this.DEST_CITY_NAME = DEST_CITY_NAME;
        this.DEST_STATE_ABR = DEST_STATE_ABR;
        this.DEST_WAC = Integer.parseInt(DEST_WAC);
        this.CRS_DEP_TIME = CRS_DEP_TIME;
        this.DEP_TIME = DEP_TIME;
        this.CRS_ARR_TIME = CRS_ARR_TIME;
        this.ARR_TIME = ARR_TIME;
      if(Double.parseDouble(CANCELLED)==0.0) this.CANCELLED=false;
      else this.DIVERTED=true;
      if(Double.parseDouble(DIVERTED)==0.0) this.DIVERTED=false;
      else this.DIVERTED=true;
      this.DISTANCE = Double.parseDouble(DISTANCE);
      this.DISTANCE = 0;
    }
    
}
