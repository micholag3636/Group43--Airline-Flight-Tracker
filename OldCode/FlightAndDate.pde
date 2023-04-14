class flightAndDate{
  int day;
  int month;
  int year;
  int number;
  
    flightAndDate(String flightDate){
    String[] parts = flightDate.split("/");
    this.day = Integer.parseInt(parts[1]);
    this.month = Integer.parseInt(parts[0]);
    this.year = Integer.parseInt(parts[2].split(" ")[0]);
    this.number=1;
  }
  
  String getDate() {
   String date=convert(this.month + "/" + this.day + "/" + this.year);
  return date;
}

  
  
}
