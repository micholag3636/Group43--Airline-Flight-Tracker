class histogram{
  ArrayList<flightAndDate> flightsInRange; 
  ArrayList<String> data; 
  String title;
  String xLabel;
  String yLabel;
  int size;  
  PImage Rarrow,Larrow;
  Button b1, b2, b3, ok, b4, b5, b6;
  boolean vertical;
  
  histogram(String heading,String xaxsis,String yaxsis, ArrayList<String> f,boolean val){
    xLabel=xaxsis;
    yLabel=yaxsis;
    title=heading;
    data=f;
    size=data.size();
    vertical=val;
    histSetup();
  }
  
  histogram(ArrayList<flightAndDate> f){
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
  plot.setDim(1000,500);
  plot.setPos(50, 50);

  plot.setTitleText(title);
  plot.getXAxis().setAxisLabelText(xLabel);
  plot.getYAxis().setAxisLabelText(yLabel);
  if(vertical==false) plot.startHistograms(GPlot.VERTICAL);
  else  plot.startHistograms(GPlot.HORIZONTAL);
  GPointsArray points = new GPointsArray(size);
  
    if(this.flightsInRange!=null){ 
        for (int i = 0; i < size; i++) {
          flightAndDate f = flightsInRange.get(i);
          points.add(i, f.number,f.getDate()); }
    }
    
    
    else if(!vertical){
    for (int i = 0; i < size; i++) {   
      points.add(i, Integer.parseInt(data.get(i)), data.get(i++));}   // x axis=0, y value of the data passed as a string, the data label for each data item 
    }      // I had the different dates in my code
    
    else if(vertical){
    for (int i = 0; i < size; i++) {   
      points.add(Integer.parseInt(data.get(i)),i, data.get(i++));}   // y axis=0, x value of the data passed as a string, the data label for each data item 
    }      // I had the different dates in my code
    
    plot.setPoints(points);
    
         if(this.flightsInRange!=null){
           if(!vertical){
             plot.setXLim(0, 15);
             plot.setYLim(0, getMaxNumber(flightsInRange));
           }
           else{
             plot.setYLim(0, 15);
             plot.setXLim(0, getMaxNumber(flightsInRange));
           }
         b1= new Button(45,25,"ds",Rarrow,Larrow);
         b2 = new Button(125,25,"ms",Rarrow,Larrow);
         b3 = new Button(200,25,"y",Rarrow,Larrow);
         ok = new Button(275,55,50,20,"ok");
         b4= new Button(325,25,"de",Rarrow,Larrow);
         b5 = new Button(410,25,"me",Rarrow,Larrow);
         b6 = new Button(490,25,"y",Rarrow,Larrow);
     }
   
   plot.activatePanning();
}
  
 
  void HistogramDraw(){
     plot.beginDraw();
    plot.drawBox();
    plot.drawXAxis();
    plot.drawYAxis();
    plot.drawTitle();
    plot.drawGridLines(GPlot.VERTICAL);
    plot.drawGridLines(GPlot.HORIZONTAL);
    plot.getHistogram().setDrawLabels(true);
    plot.getHistogram().setLabelsOffset(23);
    plot.drawHistograms();
    plot.endDraw();
    
    if(this.flightsInRange!=null){
        b1.draw();   
        b2.draw();
        b3.draw();
        ok.draw();
        b4.draw();   
        b5.draw();
        b6.draw();
   }
   
  }

  void dateButtons(){
     b1.ButtonClicked(mouseX, mouseY);   
      b2.ButtonClicked(mouseX, mouseY);   
      b3.ButtonClicked(mouseX, mouseY);   
      ok.Clicked(mouseX, mouseY);  
      b4.ButtonClicked(mouseX, mouseY);   
      b5.ButtonClicked(mouseX, mouseY);   
      b6.ButtonClicked(mouseX, mouseY); 
  }
   
  boolean vertical(){
    return vertical;
  }
 
  }
  
