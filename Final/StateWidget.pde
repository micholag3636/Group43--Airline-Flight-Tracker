class StateWidget {
  PShape shape;
  String label;
  color widgetColor;
  color borderLine;
  RShape buttonShape;
  int event;
  String abr;
  StateWidget(PShape shape, String label, color widgetColor, RShape buttonShape, String abr) {
    this.shape = shape;
    this.label = label;
    this.widgetColor = widgetColor;
    this.borderLine = widgetColor;
    this.buttonShape = buttonShape;
    this.abr = abr;
  }
  void draw(color boots) {
    shape.disableStyle();
    widgetColor = boots;
    fill(widgetColor);
    stroke(borderLine);
    shape(shape);
  }
  String getName(int mX, int mY) {
    RPoint location = new RPoint(mX, mY);
    if (buttonShape.contains(location)) {
      borderLine = BG_COLOR;
      return abr;
    }
    borderLine = widgetColor;
    return null;
  }
}
