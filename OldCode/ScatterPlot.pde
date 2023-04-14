class scatterPlot{
  ArrayList<String> data; 
  String title;
  String xLabel;
  String yLabel;
  boolean fill;
  
  scatterPlot(String heading,String xaxsis,String yaxsis, ArrayList<String> f,boolean val){
    xLabel=xaxsis;
    yLabel=yaxsis;
    title=heading;
    data=f;
    fill=val;
    scatterSetup();
  }
 


void scatterSetup(){
  plot.setDim(1000,500);
  plot.setPos(50, 50);

  plot.setTitleText(title);
  plot.getXAxis().setAxisLabelText(xLabel);
  plot.getYAxis().setAxisLabelText(yLabel);
  plot.startHistograms(GPlot.VERTICAL);
  GPointsArray points = new GPointsArray(data.size());
  
    for (int i = 0; i < data.size(); i++) {   
      points.add(Integer.parseInt(data.get(i)), Integer.parseInt(data.get(i)), data.get(i++));}   // x axis int(could change it to string) as string, y value of the data passed as a string, the data label for each data item 
                                                                    // I had the different dates in my code
    
    plot.setPoints(points);
    
        
   plot.activatePanning();
}
  
 
  void scatterDraw(){
    plot.beginDraw();
    plot.drawBox();
    plot.drawXAxis();
    plot.drawYAxis();
    plot.drawTitle();
    plot.drawGridLines(GPlot.VERTICAL);
    plot.drawGridLines(GPlot.HORIZONTAL);  
    plot.drawPoints();
    if(fill)  plot.drawFilledContours(GPlot.HORIZONTAL, 0);
    plot.endDraw();
    
   
  }
   
  
 
  }
