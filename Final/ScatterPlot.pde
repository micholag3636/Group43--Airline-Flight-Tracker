class scatterPlot{
  GPointsArray points1;
  GPointsArray points2;
  String title;
  String xLabel;
  String yLabel;

  
    scatterPlot(String heading,String xaxsis,String yaxsis,GPointsArray A,GPointsArray B){
    xLabel=xaxsis;
    yLabel=yaxsis;
    title=heading;
    this.points1 = A;
    this.points2 = B;
    Setup();
  }
 

void Setup(){
  plot1.setDim(1400,600);
  plot1.setPos(50, 50);

  plot1.setTitleText(title);
  plot1.getXAxis().setAxisLabelText(xLabel);
  plot1.getYAxis().setAxisLabelText(yLabel);
  plot1.startHistograms(GPlot.VERTICAL);
  
   plot1.setPoints(points1);
   plot1.setPointColor(color(0,0,0,100));;
   plot1.addLayer("otherval", points2);
   plot1.getLayer("otherval").setPointColor(color(255, 0, 0, 100));
   plot1.getLayer("otherval").setLineColor(color(255, 0, 0,100));
   plot1.setXLim(0, 200);
   plot1.setYLim(0, 3000);

}
  
 
  void draw(){
    background(bg2);
    plot1.beginDraw();
    plot1.drawBox();
    plot1.drawXAxis();
    plot1.drawYAxis();
    plot1.drawTitle();
    plot1.drawLegend(new String[] {"Actual Arrival Time", "Schedule Arrivial Time"}, new float[] {0.07, 0.22},  new float[] {0.92, 0.92});
    plot1.drawPoints();
    plot1.drawLines();
    plot1.activatePanning();
    plot1.endDraw();
    plot1.activateZooming(1.3, CENTER, CENTER);
  }
   
  
 
  }
