public String one;
public String two;
public String three;
public String four;
public String five;
public float hue; 
public int top = 0;

 
 class piechartmain{
  

 int mod; 
 piechartmain(int mod){
    
    
  this.mod = mod;
   
  }

 
     
void pieChart(float diameter, int[] data) {
  float lastAngle = 100;
  for (int i = 0; i < data.length; i++) {
    float gray = map(i, 0, data.length, 0, 255);
    col = gray;
    fill(gray);
    arc(width/2, height/2, diameter, diameter, lastAngle, lastAngle+radians(data[i]));
    lastAngle += radians(data[i]);
  }
}

  
   
  void draw() {
    
    colorMode( HSB, 360,100,100);
  hue = slider1.sliderVal; 
   
   
   one = flights.get(mod).ORIGIN;
two = flights.get(mod+ 1).ORIGIN;
three = flights.get(mod+ 2).ORIGIN;
four = flights.get( mod+ 3).ORIGIN;
five = flights.get( mod+ 4).ORIGIN;


  int[] angles = { first, second, third, fourth, fifth };
    background( 0);
    System.out.println(hue);
  fill( hue, 100, 100); //hue modified by slider1
  rect( 20,20, 50,50);
  
  if( mousePressed){
    boolean isChanged = slider1.checkPressed( mouseX, mouseY);
    if(isChanged){
        hue = slider1.sliderVal; //update hue using updated sliderVal
          int m = round(hue);
  one = flights.get(m).ORIGIN;
  System.out.println(one);
two = flights.get(m+ 1).ORIGIN;
three = flights.get(m+ 2).ORIGIN;
four = flights.get( m+ 3).ORIGIN;
five = flights.get( m+ 4).ORIGIN;
      top = 0;
       int d = 0;
       first = 1;
       second = 0;
       third = 0;
       fourth = 0;
       fifth = 0;
        for(flightDatabase s : flights){
    if(d < 100){
  if(s.ORIGIN == one){
    first= first + s.DEST_WAC;
      System.out.println(first);
      //  top = top + 1;
  }
  
 if(s.ORIGIN == two){
    second = second+ s.DEST_WAC;
      System.out.println(second);
       // top = top + 1;
  }
  
   if(s.ORIGIN == three){
    third = third + s.DEST_WAC;
      System.out.println(third);
      //  top = top + 1;
  }
  
   if(s.ORIGIN == four){
    fourth = fourth + s.DEST_WAC;
      System.out.println(fourth);
      //  top = top + 1;
  }
  
  
   if(s.ORIGIN == five){
    fifth = fifth + s.DEST_WAC;
      System.out.println(fifth);
       
  }
   }
   d = d + 1;
}
       System.out.println(second);

    }
  }
  for(flightDatabase s : flights){
    if(top < 11){
  if(s.ORIGIN == one){
    first= first + s.DEST_WAC;
      System.out.println(first);
      //  top = top + 1;
  }
  
 if(s.ORIGIN == two){
    second = second+ s.DEST_WAC;
      System.out.println(second);
       // top = top + 1;
  }
  
   if(s.ORIGIN == three){
    third = third + s.DEST_WAC;
      System.out.println(third);
      //  top = top + 1;
  }
  
   if(s.ORIGIN == four){
    fourth = fourth + s.DEST_WAC;
      System.out.println(fourth);
      //  top = top + 1;
  }
  
  
   if(s.ORIGIN == five){
    fifth = fifth + s.DEST_WAC;
      System.out.println(fifth);
       
  }
   }
   top = top + 1;
}
int sum = first + second + third + fourth + fifth;
first = sum / first;
first = first*360;
//second = second / sum;
//second = second*360;
//third = third / sum;
//third = third*360;
//fourth = fourth / sum;
//fourth = fourth*360;
//fifth = fifth / sum;
//fifth = fifth*360;

    
  background(255);
  pieChart(900, angles);
  fill(0);
  square(50,50,20);
  textSize(20);
  fill(50);
  text(one, 75, 65);
    square(50,80,20);
    fill(100);
    text(two, 75, 95);
      square(50,110,20);
      fill(150);
      text(three, 75, 125);
        square(50,140,20);
        fill(200);
        text(four, 75, 155);
          square(50,170,20);
          text(five, 75, 185);
          
        slider1.display();   
        
        
         for (int i = 2; i<Widgets.size(); i++) {
    Widget aWidget = (Widget)Widgets.get(4);
    aWidget.draw();

  
 
  }
}
  
  
  
  
  
  
  
  
  
  
}
