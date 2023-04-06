String StartDate,EndDate;
String dsAvani="01";
String msAvani="01";
String yAvani="2023";
String deAvani="01";
String meAvani="01";
class Button{
  int xpos; 
  int ypos; 
  int width=70; 
  int height=20;
  String type; 
  int limit;
  String txt;
  PImage imgR, imgL;

  
    Button(int xp,int yp,String label,PImage img1, PImage img2){
      xpos=xp;
    ypos=yp;
    type=label;
    imgR=img1;
    imgL=img2;
    if (type=="ds" || type=="de") {
      limit=31;
      txt="Day";
    }
    else if (type=="ms" || type=="me") {
      limit=12;
      txt="Month";
    }
    else if (type=="y") {
      limit=2023;
      txt="Year";
    }   
    StartDate=msAvani+"/"+dsAvani+"/"+yAvani;
    EndDate=meAvani+"/"+deAvani+"/"+yAvani;
    }
    Button(int xp,int yp,int w, int h,String label){
    xpos=xp;
    ypos=yp;
    width=w;
    height=h;
    if (label=="ok") type="ok";

  }
  
  
  void update(String d,int n){
  int date=Integer.parseInt(d);
  if(date<this.limit && date>1) {
   if (this.type=="ds") dsAvani=Integer.toString(date+n);
    else if (this.type=="ms")  msAvani=Integer.toString(date+n);
    if (this.type=="de") deAvani=Integer.toString(date+n);
    else if (this.type=="me")  meAvani=Integer.toString(date+n);
  }
  else if (date==this.limit && (type=="ms" || type=="ds" || type=="me" || type=="de") && n==1){
    if (this.type=="ds") dsAvani=Integer.toString(1);
    else if (this.type=="ms")  msAvani=Integer.toString(1);
    if (this.type=="de") deAvani=Integer.toString(1);
    else if (this.type=="me")  meAvani=Integer.toString(1);
  }
  
    else if (date==this.limit && (type=="ms" || type=="ds" || type=="me" || type=="de") && n==-1){
    if (this.type=="ds") dsAvani=Integer.toString(date+n);
    else if (this.type=="ms")  msAvani=Integer.toString(date+n);
    if (this.type=="de") deAvani=Integer.toString(date+n);
    else if (this.type=="me")  meAvani=Integer.toString(date+n);
  }
  
   else if (date==1 && (type=="ms" || type=="ds" || type=="me" || type=="de") && n==-1){
   if (this.type=="ds") dsAvani=Integer.toString(this.limit);
   else if (this.type=="ms")  msAvani=Integer.toString(this.limit);
   else if (this.type=="de") deAvani=Integer.toString(this.limit);
   else if (this.type=="me")  meAvani=Integer.toString(this.limit);
  }
  
    else if (date==1 && (type=="ms" || type=="ds" || type=="me" || type=="de") && n==1){
   if (this.type=="ds") dsAvani=Integer.toString(date+n);
    else if (this.type=="ms")  msAvani=Integer.toString(date+n);
    else if (this.type=="de") deAvani=Integer.toString(date+n);
    else if (this.type=="me")  meAvani=Integer.toString(date+n);
  }
}
  
  void ButtonClicked(int x,int y){
  if(x>=this.xpos+this.width-20 && y<=this.ypos+this.height && x<=xpos+this.width && y>=this.ypos) {
    if((type=="ds" || type=="ms" || type=="de" || type=="me")) update(check(this.type),1);
    }
  else if (x>=this.xpos && y>=this.ypos && x<=this.xpos+this.width &&  y<=this.ypos+this.height) {    
    if((type=="ds" || type=="ms" || type=="de" || type=="me") && Integer.parseInt(check(this.type))>=1) update(check(this.type),-1);
    }
  }
 
 
  void Clicked(int x,int y){
  if (x>=this.xpos && y>=this.ypos && x<=this.xpos+this.width &&  y<=this.ypos+this.height ) {    
    StartDate=msAvani+"/"+dsAvani+"/"+yAvani;
    EndDate=meAvani+"/"+deAvani+"/"+yAvani;
    ArrayList<flightAndDate> flightsInRange = getFlightsByDateRange(StartDate,EndDate);
    plot.startHistograms(GPlot.VERTICAL);
    GPointsArray points = new GPointsArray(flightsInRange.size());

  
  for (int i = 0; i < flightsInRange.size(); i++) {
    flightAndDate f = flightsInRange.get(i);
    points.add(i, f.number,f.getDate());
  }


  plot.setPoints(points);

  plot.setXLim(0, 15);
  plot.setYLim(0, getMaxNumber(flightsInRange));
 
  plot.activatePanning();
    }
  }
  
  
  String check(String label){
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
    if(type=="ms" || type=="ds" || type=="me" || type=="de" || type=="y"){ text(txt,xpos+12,ypos-8);
    fill(255);
    }
    else if (type=="ok") fill(225,245,170);
    stroke(23);
    rect(xpos,ypos,width,height);
    fill(0);
    if(type=="ms" || type=="ds"  || type=="me" || type=="de"  || type=="ok") text(check(type),width/2-8+xpos,ypos+height-3);
    else if(type=="y") text(check(type),width/2-17+xpos,ypos+height-3);
    if(type=="ms" || type=="ds"  || type=="me" || type=="de") image(imgR,xpos+width-20,ypos,20,20);
    if(type=="ms" || type=="ds"  || type=="me" || type=="de") image(imgL,xpos,ypos,20,20);
  }

}
