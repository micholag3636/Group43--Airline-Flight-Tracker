class Pie {
  float col;
  int mod;
  Slider slider1;
  piechartmain pi;
  Pie() {
    slider1 = new Slider( 10,240, 200, 30, 0, 100, "Hue");
    pi = new piechartmain(mod);
  }
  void draw() {
    background(255);
    pi.draw(slider1);
  }
}
