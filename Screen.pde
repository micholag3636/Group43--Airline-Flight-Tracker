 ArrayList Widgets;
 PFont stdFont;
 final int EVENT_BUTTON1=1;
final int EVENT_BUTTON2=2;
final int EVENT_BUTTON3=3;
final int EVENT_BUTTON4=4;
final int EVENT_BUTTON5= 5;
final int EVENT_NULL=0;

 Widget widget1 =new Widget(100, 100, 230, 60,
    "button 1", color(255,0,0),
    stdFont, EVENT_BUTTON1);
 Widget widget2=new Widget(100, 200, 230, 60,
    "button 2", color(69,75,27),
    stdFont, EVENT_BUTTON2);
 Widget widget3=new Widget(100, 300, 230, 60,
    "button 3", color(69,75,27),
    stdFont, EVENT_BUTTON3);
     Widget widget4=new Widget(100, 400, 230, 60,
    "button 4", color(69,75,27),
    stdFont, EVENT_BUTTON4);


   Widget widget5=new Widget(100, 800, 230, 60,
    "return", color(255,0,0),
    stdFont, EVENT_BUTTON5);
   
class Screen {
  
  int screencolor = 0;

  
  
  Screen(int screencolor){
    
    this.screencolor = screencolor;
    
  }
  
  void draw() {
       background(screencolor);
  

Widgets = new ArrayList();
  Widgets.add(widget1);
  Widgets.add(widget2);
  Widgets.add(widget3);
    Widgets.add(widget4);
    Widgets.add(widget5);


  for (int i = 0; i<Widgets.size(); i++) {
    Widget aWidget = (Widget)Widgets.get(0);
    aWidget.draw();

  
 
  }


  for (int i = 0; i<Widgets.size(); i++) {
    Widget aWidget = (Widget)Widgets.get(1);
    aWidget.draw();

  
 
  }
  
  
    for (int i = 2; i<Widgets.size(); i++) {
    Widget aWidget = (Widget)Widgets.get(2);
    aWidget.draw();

  
 
  }
  
     for (int i = 2; i<Widgets.size(); i++) {
    Widget aWidget = (Widget)Widgets.get(3);
    aWidget.draw();

  
 
  }
  }
  
  

  
  


}
 void mousePressed() {
  int event;

  for (int i = 0; i<Widgets.size(); i++) {
    Widget aWidget = (Widget) Widgets.get(i);
    event = aWidget.getEvent(mouseX, mouseY);
    switch(event) {
    case EVENT_BUTTON1:
   stroke1 = true;
      println("button 1!");
      screen = 0;
  
      break;
    case EVENT_BUTTON2:
      println("button 2!");
      screen = 1;
     
      break;
      case EVENT_BUTTON3:
      screen = 2;
      break;
    case EVENT_BUTTON4:
      println("button 2!");
      screen = 3;
  
      break;
  case EVENT_BUTTON5:
      println("button 2!");
      screen = 0;
  
      break;
   
    }
  }
}
