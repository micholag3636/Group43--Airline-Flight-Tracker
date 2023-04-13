//Histogram class create by Avani
class histogram{
  ArrayList<flightAndDate> flightsInRange;  //ArrayList for flights in date range query
  ArrayList<String> data; //ArrayList to plot general data
  String title;  //Title of the plot
  String xLabel;  //X axis title
  String yLabel;  //Y axis title
  int size;  //size of data
  PImage Rarrow,Larrow;  //Loading arrow image for date query selection
  Button b1, b2, b3, ok, b4, b5, b6;  //Declaring the buttons
  boolean vertical;   //To plot a vertical or Horizontal graph
  
  histogram(String heading,String xaxsis,String yaxsis, ArrayList<String> f,boolean val){ //To set labels and data for a non specific data
    xLabel=xaxsis;
    yLabel=yaxsis;
    title=heading;
    data=f;
    size=data.size();
    vertical=val;
    histSetup();
  }
  
  histogram(ArrayList<flightAndDate> f){ //To set labels and data for date query
    xLabel="Date mm/dd/yy";
    yLabel="Number of Flights";
    title="Flights In Between Dates";
    flightsInRange = f;
    size=flightsInRange.size();
    Rarrow=loadImage("arrow-right.png");
    Larrow=loadImage("arrow-left.png");
    vertical=false;
    histSetup();
  }


void histSetup(){
  plot.setDim(1400,600);   //set plot size
  plot.setPos(50, 50);     //set x and y coordinates to start plot

  plot.setTitleText(title);      //set plot title
  plot.getXAxis().setAxisLabelText(xLabel);  //set X axis title
  plot.getYAxis().setAxisLabelText(yLabel);  //set y axis title
  if(vertical==false) plot.startHistograms(GPlot.VERTICAL);  //plot a horizontal or vertical histogram
  else  plot.startHistograms(GPlot.HORIZONTAL);
  GPointsArray points = new GPointsArray(size);  //initialises the size of the point array
  
    if(this.flightsInRange!=null){ 
        for (int i = 0; i < size; i++) {
          flightAndDate f = flightsInRange.get(i);
          points.add(i, f.number,f.getDate()); }     //adds i, the number of flights on a date, date
    }
    
    
    else if(!vertical){
    for (int i = 0; i < size; i++) {   
      points.add(i, Integer.parseInt(data.get(i)), data.get(i++));}   // x axis=0, y value of the data passed as a string, the data label for each data item 
    }      // I had the different dates in my code
    
    else if(vertical){
    for (int i = 0; i < size; i++) {   
      points.add(Integer.parseInt(data.get(i)),i, data.get(i++));}   // y axis=0, x value of the data passed as a string, the data label for each data item 
    }      // I had the different dates in my code
    
    plot.setPoints(points);   //set the points
    
         if(this.flightsInRange!=null){
           if(!vertical){
             plot.setXLim(0, 15);    //set x axis limits
             plot.setYLim(0, getMaxNumber(flightsInRange));   //set y axis limits
           }
           else{
             plot.setYLim(0, 15);  //set x axis limits
             plot.setXLim(0, getMaxNumber(flightsInRange));  //set y axis limits
           }
         b1= new Button(45,25,"ds",Rarrow,Larrow);  //creating the different buttons
         b2 = new Button(125,25,"ms",Rarrow,Larrow);
         b3 = new Button(200,25,"y",Rarrow,Larrow);
         ok = new Button(275,55,50,20,"ok");
         b4= new Button(325,25,"de",Rarrow,Larrow);
         b5 = new Button(410,25,"me",Rarrow,Larrow);
         b6 = new Button(490,25,"y",Rarrow,Larrow);
     }
   
   plot.activatePanning();    //allowing user to pane rught or left
   plot.activateZooming(1.3, CENTER, CENTER);  //zoom in or out by a factor of 1.3
}
  
 
  void HistogramDraw(){
    background(bg2);   //setting the plain background
     plot.beginDraw(); 
    plot.drawBox();
    plot.drawXAxis();
    plot.drawYAxis();
    plot.drawTitle(); 
    plot.drawGridLines(GPlot.VERTICAL);  //draw vertical gridlines
    plot.drawGridLines(GPlot.HORIZONTAL);   //draw horizontal gridlines
    plot.getHistogram().setDrawLabels(true);   //Labels will be drawn
    plot.getHistogram().setLabelsOffset(23);   //Labels will be offseted 23 px from the axis
    plot.drawHistograms();
    plot.endDraw();
    
    if(this.flightsInRange!=null){
        b1.draw();   
        b2.draw();
        b3.draw();
        ok.draw();
        b4.draw();   //for the date query draw date buttons
        b5.draw();
        b6.draw();
   }
   
  }

  void dateButtons(){
     b1.ButtonClicked(mouseX, mouseY);   
      b2.ButtonClicked(mouseX, mouseY);   
      b3.ButtonClicked(mouseX, mouseY);      //buttons clicked
      ok.Clicked(mouseX, mouseY);  
      b4.ButtonClicked(mouseX, mouseY);   
      b5.ButtonClicked(mouseX, mouseY);   
      b6.ButtonClicked(mouseX, mouseY); 
  }
   
  boolean vertical(){
    return vertical;
  }
 
  }
  
