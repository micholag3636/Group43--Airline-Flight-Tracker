//Created by Michael
class Pie {
  float col;
  int mod;
  Slider slider1;
  piechartmain pi;
  Pie() {
  //Creates an instance of slider 
    slider1 = new Slider( 10,240, 200, 30, 0, 100, "Position");
    pi = new piechartmain(mod);
  }
  void draw() {
    pi.draw(slider1);
  }
}
