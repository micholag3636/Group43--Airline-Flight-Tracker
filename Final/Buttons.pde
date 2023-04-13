//class created by Avani to make date query buttons
String StartDate,EndDate;
String dsAvani="01";  
String msAvani="01";
String yAvani="2023";
String deAvani="02";
String meAvani="01";
class Button{
  int xpos; 
  int ypos; 
  int width=70; 
  int height=20;
  String type; 
  int limit;   //value beyond which the buttons have to reset
  String txt;
  PImage imgR, imgL;

  
    Button(int xp,int yp,String label,PImage img1, PImage img2){
      xpos=xp;
    ypos=yp;
    type=label;
    imgR=img1;
    imgL=img2;
    if (type=="ds" || type=="de") {  // if it is a day button limit is 31 days
      limit=31; 
      txt="Day";
    }
    else if (type=="ms" || type=="me") {  // if it is a month button limit is 12 months
      limit=12;
      txt="Month";
    }
    else if (type=="y") {   //since the data only contains information of one year limit is that year
      limit=2023;
      txt="Year";
    }   
    StartDate=msAvani+"/"+dsAvani+"/"+yAvani;
    EndDate=meAvani+"/"+deAvani+"/"+yAvani;
    }
    Button(int xp,int yp,int w, int h,String label){  //to create an ok button since it doesn't need limit or an image
    xpos=xp;
    ypos=yp;
    width=w;
    height=h;
    if (label=="ok") type="ok";

  }
  
  
  void update(String d,int n){      //checks if the value can be updates based on the type of date itmem it is and what value it has and what the limit is
  int date=Integer.parseInt(d); 
  if(date<this.limit && date>1) {
   if (this.type=="ds") dsAvani=Integer.toString(date+n);    //updates by 1 day if day<31 and day>1
    else if (this.type=="ms")  msAvani=Integer.toString(date+n);  //updates by 1 month if month<31 and month>1
    if (this.type=="de") deAvani=Integer.toString(date+n);
    else if (this.type=="me")  meAvani=Integer.toString(date+n);
  }
  else if (date==this.limit && (type=="ms" || type=="ds" || type=="me" || type=="de") && n==1){
    if (this.type=="ds") dsAvani=Integer.toString(1);            //resets day to 1 if day==31 and user wants to increment it
    else if (this.type=="ms")  msAvani=Integer.toString(1);      //resets month to 1 if month==12 and user wants to increment it
    if (this.type=="de") deAvani=Integer.toString(1);
    else if (this.type=="me")  meAvani=Integer.toString(1);
  }
  
    else if (date==this.limit && (type=="ms" || type=="ds" || type=="me" || type=="de") && n==-1){
    if (this.type=="ds") dsAvani=Integer.toString(date+n);    //updates by -1 if day==31 and user wants to decremnt it
    else if (this.type=="ms")  msAvani=Integer.toString(date+n);   //updates by -1 if month==12 and user wants to decremnt it
    if (this.type=="de") deAvani=Integer.toString(date+n);
    else if (this.type=="me")  meAvani=Integer.toString(date+n);
  }
  
   else if (date==1 && (type=="ms" || type=="ds" || type=="me" || type=="de") && n==-1){
   if (this.type=="ds") dsAvani=Integer.toString(this.limit);   //resets day to limit if day==1 and user wants to decrement it
   else if (this.type=="ms")  msAvani=Integer.toString(this.limit);    //resets moth to limit if moth==1 and user wants to decrement it
   else if (this.type=="de") deAvani=Integer.toString(this.limit);
   else if (this.type=="me")  meAvani=Integer.toString(this.limit);
  }
  
    else if (date==1 && (type=="ms" || type=="ds" || type=="me" || type=="de") && n==1){
   if (this.type=="ds") dsAvani=Integer.toString(date+n);    //updates limit by 1 if day==1 and user wants to increment it
    else if (this.type=="ms")  msAvani=Integer.toString(date+n);    //updates limit by 1 if month==1 and user wants to increment it
    else if (this.type=="de") deAvani=Integer.toString(date+n);
    else if (this.type=="me")  meAvani=Integer.toString(date+n);
  }
}
  
  void ButtonClicked(int x,int y){  //if the date buttons are clicked
  if(x>=this.xpos+this.width-20 && y<=this.ypos+this.height && x<=xpos+this.width && y>=this.ypos) {  //if the right arrow is clicked
    if((type=="ds" || type=="ms" || type=="de" || type=="me")) update(check(this.type),1);            //update that value by 1
    }
  else if (x>=this.xpos && y>=this.ypos && x<=this.xpos+this.width &&  y<=this.ypos+this.height) {    //if the left arrow is clicked
    if((type=="ds" || type=="ms" || type=="de" || type=="me") && Integer.parseInt(check(this.type))>=1) update(check(this.type),-1);  //update the value by -1
    }
  }
 
 
  void Clicked(int x,int y){  
  if (x>=this.xpos && y>=this.ypos && x<=this.xpos+this.width &&  y<=this.ypos+this.height ) {   //if ok button is clicked
    StartDate=msAvani+"/"+dsAvani+"/"+yAvani;  //sets the start date to the preset values in the variables
    EndDate=meAvani+"/"+deAvani+"/"+yAvani;    //sets the end date to the preset values in the variables
    ArrayList<flightAndDate> flightsInRange = getFlightsByDateRange(StartDate,EndDate);   //gets a new arraylist of flights in between those dates
    plot.startHistograms(GPlot.VERTICAL);   //plot a vertical histogram
    GPointsArray points = new GPointsArray(flightsInRange.size());   //sets the size of the points array

  
  for (int i = 0; i < flightsInRange.size(); i++) {
    flightAndDate f = flightsInRange.get(i);
    points.add(i, f.number,f.getDate());   //add i, number of flights on that date, date
  }


  plot.setPoints(points);  //sets it as points

  plot.setXLim(0, 15);  //sets limits
  plot.setYLim(0, getMaxNumber(flightsInRange));
 
  plot.activatePanning(); //allows panning
  plot.activateZooming(1.3, CENTER, CENTER);  //zoom in or out by a factor of 1.3
    }
  }
  
  
  String check(String label){  //returns the string variable depending on the type of button
    if (label=="ds") return dsAvani;
    else if (label=="ms") return msAvani;
    else if (label=="y") return yAvani;
    else if (label=="de") return deAvani;
    else if (label=="me") return meAvani;
    else if (label=="ok") return "Ok";
    else return null;
  }
  
  void draw(){
    fill(0);  
    textSize(20);   
    if(type=="ms" || type=="ds" || type=="me" || type=="de" || type=="y"){ text(txt,xpos+12,ypos-8);  //write the heading of the button above
    fill(255); 
    }
    else if (type=="ok") fill(225,245,170);  //if it is an ok button the position of ok in the rectangle
    stroke(23);
    rect(xpos,ypos,width,height);  //draws the rectangle
    fill(0);
    if(type=="ms" || type=="ds"  || type=="me" || type=="de"  || type=="ok") text(check(type),width/2-8+xpos,ypos+height-3);  //position of the text if it is a month or day  or yearbutton
    else if(type=="y") text(check(type),width/2-17+xpos,ypos+height-3);
    if(type=="ms" || type=="ds"  || type=="me" || type=="de") image(imgR,xpos+width-20,ypos,20,20);  //sets up arrows for day and month
    if(type=="ms" || type=="ds"  || type=="me" || type=="de") image(imgL,xpos,ypos,20,20);    
  } 

}
