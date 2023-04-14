//Created by Abigail Bosch
class Widget {
  int x, y, width, height;
  String label;
  int event;
  color widgetColor, labelColor, borderLine;
  PFont widgetFont;
  // creation of widget object
  Widget(int x, int y, int width, int height, String label,
    color widgetColor, PFont widgetFont, int event) {
    this.x=x;
    this.y=y;
    this.width = width;
    this.height= height;
    this.label=label;
    this.event=event;
    this.widgetColor=widgetColor;
    this.widgetFont=widgetFont;
    labelColor= color(0); 
  }
  void draw() {
    // draw a rectangular button based on inputs
    stroke(borderLine);
    fill(widgetColor);
    rect(x, y, width, height);
    fill(labelColor);
    textFont(widgetFont);
    text(label, x+GAP, y+height-GAP);
  }
  int getEvent(int mX, int mY) {
    // if the mouse is over a button
    if (mX>x && mX < x+width && mY >y && mY <y+height) {
      // change the outline colour and return the buttons event number
      borderLine = 255;
      return event;
    }
    //else - keep the colour the same and return nothing
    borderLine = 0;
    return EVENT_NULL;
  }
}
