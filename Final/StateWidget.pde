// Created By Abigail Bosch
// Widget Object for each state
class StateWidget {
  PShape shape;
  String label, abr;
  color widgetColor, borderLine;
  RShape buttonShape;
  int event;
  boolean selected;
  PFont inFont;
  
  StateWidget(PShape shape, String label, color widgetColor, RShape buttonShape, String abr) {
    this.shape = shape;
    this.label = label;
    this.widgetColor = widgetColor;
    this.borderLine = widgetColor;
    this.buttonShape = buttonShape;
    this.abr = abr;
    selected = false;
    inFont = loadFont("Calibri-Bold-48.vlw");
  }
  void draw(color boots) {
    // remove styling(colour) from svg shape and  draw state shape in inputted colour
    shape.disableStyle();
    widgetColor = boots;
    fill(widgetColor);
    stroke(borderLine);
    shape(shape);
    
  }
  String getName(int mX, int mY) {
    RPoint location = new RPoint(mX, mY);
    if (buttonShape.contains(location)) {
      borderLine = 0;
      return abr;
    }
    borderLine = 0;
    return null;
  }
  String getTitle(int mX, int mY) {
    // if the mouse is over the state return the Name of the state given
    RPoint location = new RPoint(mX, mY);
    if (buttonShape.contains(location)) {
      return label;
    }
    return null;
  }
}
