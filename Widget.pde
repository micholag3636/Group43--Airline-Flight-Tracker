class Widget{
  int x, y, width, height, strokeColor;
  String label;
  color widgetColor, labelColor;
  PFont widgetFont;
  
  Widget(int x, int y, int width, int height, String label, color widgetColor, PFont widgetFont){
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    this.label = label;
    this.widgetColor = widgetColor;
    this.widgetFont = widgetFont;
    labelColor = color(0);
  }
  
  void draw(){
    fill(widgetColor);
    stroke(strokeColor);
    rect(x, y, width, height);
    fill(labelColor);
    text(label, x+10, y+height-10);
  }
  
  int ifPressed(int mX, int mY){
    if(mX > x && mX < x+width &&
       mY > y && mY < y+height){
         return 1;
       }
      return 0;
  }
  
}
