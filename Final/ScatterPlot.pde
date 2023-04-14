//ScatterPlot graph created by Avani Sharma
class scatterPlot{
  GPointsArray points1; 
  GPointsArray points2;
  String title;
  String xLabel;
  String yLabel;

  
    scatterPlot(String heading,String xaxsis,String yaxsis,GPointsArray A,GPointsArray B){  //setting the labels and data
    xLabel=xaxsis;
    yLabel=yaxsis;
    title=heading;
    this.points1 = A;
    this.points2 = B;
    Setup();
  }
 

void Setup(){
  plot1.setDim(1400,600);  //setting plot dimensions
  plot1.setPos(50, 50);    //setting plot position

  plot1.setTitleText(title);   //set plot title
  plot1.getXAxis().setAxisLabelText(xLabel);   //setting x axis label
  plot1.getYAxis().setAxisLabelText(yLabel);   //setting y axis label
  
   plot1.setPoints(points1);   //setting the first set of points
   plot1.setPointColor(color(0,0,0,100));    // setting the color of the points to black while reducing the opacity
   plot1.addLayer("otherval", points2);      //adding another layer to the plot to plot the second set of values
   plot1.getLayer("otherval").setPointColor(color(255, 0, 0, 100));   //setting the point color of the second set of values to red
   plot1.getLayer("otherval").setLineColor(color(255, 0, 0,100));     //setting the line color to red
   plot1.setXLim(0, 200);    //setting x axis limit
   plot1.setYLim(0, 3000);   //setting y axis limit

}
  
 
  void draw(){
    background(bg2);
    plot1.beginDraw();
    plot1.drawBox();
    plot1.drawXAxis();
    plot1.drawYAxis();
    plot1.drawTitle();
    plot1.drawLegend(new String[] {"Actual Arrival Time", "Schedule Arrivial Time"}, new float[] {0.07, 0.22},  new float[] {0.92, 0.92});  //creating a legend with the give string and at the x and y coordinates
    plot1.drawPoints();
    plot1.drawLines();
    plot1.activatePanning();   //allowing user to pane in the right or left direction
    plot1.endDraw();
    plot1.activateZooming(1.3, CENTER, CENTER);  //allows the user to zoom in or out by a factor of 1.3
  } 
   
  
 
  }
