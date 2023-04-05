class Map {
  ArrayList widgetList;
  PShape usa;
  color[] stateColor;

  Map() {
    // creates StateWidget object for each state
    StateWidget alabama, alaska, arizona, arkansas, california, colorado, conneticut,
      delaware, florida, georgia, hawaii, idaho, illinois, indiana, iowa, kansas,
      kentucky, louisiana, maine, maryland, massachusetts, michigan, minnesota,
      mississippi, missouri, montana, nebraska, nevada, newhampshire, newjersey,
      newmexico, newyork, northcarolina, northdakota, ohio, oklahoma, oregon,
      pennsylvania, rhodeisland, southcarolina, southdakota, tennessee, texas, utah,
      vermont, virginia, washington, westvirginia, wisconsin, wyoming; 

    stateColor = new color[50];
    usa = loadShape("usa-wikipedia.svg");
    RShape shp = RG.loadShape("usa-wikipedia.svg");
    widgetList = new ArrayList();
    // initializes each StateWidget + adds them to the widgetList (i started smelling colours at this point :D)
    alabama = new StateWidget(usa.getChild("AL"), "Alabama", stateColor[0], shp.getChild("AL"), "AL");
    widgetList.add(alabama);
    alaska = new StateWidget(usa.getChild("AK"), "Alaska", stateColor[1], shp.getChild("AK"), "AK");
    widgetList.add(alaska);
    arizona = new StateWidget(usa.getChild("AZ"), "Arizona", stateColor[2], shp.getChild("AZ"), "AZ");
    widgetList.add(arizona);
    arkansas = new StateWidget(usa.getChild("AR"), "Arkansas", stateColor[3], shp.getChild("AR"), "AR");
    widgetList.add(arkansas);
    california = new StateWidget(usa.getChild("CA"), "California", stateColor[4], shp.getChild("CA"), "CA");
    widgetList.add(california);
    colorado = new StateWidget(usa.getChild("CO"), "Colorado", stateColor[5], shp.getChild("CO"), "CO");
    widgetList.add(colorado);
    conneticut = new StateWidget(usa.getChild("CT"), "Conneticut", stateColor[6], shp.getChild("CT"), "CT");
    widgetList.add(conneticut);
    delaware = new StateWidget(usa.getChild("DE"), "Delaware", stateColor[7], shp.getChild("DE"), "DE");
    widgetList.add(delaware);
    florida = new StateWidget(usa.getChild("FL"), "Florida", stateColor[8], shp.getChild("FL"), "FL");
    widgetList.add(florida);
    georgia = new StateWidget(usa.getChild("GA"), "Georgia", stateColor[9], shp.getChild("GA"), "GA");
    widgetList.add(georgia);
    hawaii = new StateWidget(usa.getChild("HI"), "Hawaii", stateColor[10], shp.getChild("HI"), "HI");
    widgetList.add(hawaii);
    idaho = new StateWidget(usa.getChild("ID"), "Idaho", stateColor[11], shp.getChild("ID"), "ID");
    widgetList.add(idaho);
    illinois = new StateWidget(usa.getChild("IL"), "Illinois", stateColor[12], shp.getChild("IL"), "IL");
    widgetList.add(illinois);
    indiana = new StateWidget(usa.getChild("IN"), "Indiana", stateColor[13], shp.getChild("IN"), "IN");
    widgetList.add(indiana);
    iowa = new StateWidget(usa.getChild("IA"), "Iowa", stateColor[14], shp.getChild("IA"), "IA");
    widgetList.add(iowa);
    kansas = new StateWidget(usa.getChild("KS"), "Kansas", stateColor[15], shp.getChild("KS"), "KS");
    widgetList.add(kansas);
    kentucky = new StateWidget(usa.getChild("KY"), "Kentucky", stateColor[16], shp.getChild("KY"), "KY");
    widgetList.add(kentucky);
    louisiana = new StateWidget(usa.getChild("LA"), "Louisiana", stateColor[17], shp.getChild("LA"), "LA");
    widgetList.add(louisiana);
    maine = new StateWidget(usa.getChild("ME"), "Maine", stateColor[18], shp.getChild("ME"), "ME");
    widgetList.add(maine);
    maryland = new StateWidget(usa.getChild("MD"), "Maryland", stateColor[19], shp.getChild("MD"), "MD");
    widgetList.add(maryland);
    massachusetts = new StateWidget(usa.getChild("MA"), "Massachusetts", stateColor[20], shp.getChild("MA"), "MA");
    widgetList.add(massachusetts);
    michigan = new StateWidget(usa.getChild("MI"), "Michigan", stateColor[21], shp.getChild("MI"), "MI");
    widgetList.add(michigan);
    minnesota = new StateWidget(usa.getChild("MN"), "Minnesota", stateColor[22], shp.getChild("MN"), "MN");
    widgetList.add(minnesota);
    mississippi = new StateWidget(usa.getChild("MS"), "Mississippi", stateColor[23], shp.getChild("MS"), "MS");
    widgetList.add(mississippi);
    missouri = new StateWidget(usa.getChild("MO"), "Missouri", stateColor[24], shp.getChild("MO"), "MO");
    widgetList.add(missouri);
    montana = new StateWidget(usa.getChild("MT"), "Montana", stateColor[25], shp.getChild("MT"), "MT");
    widgetList.add(montana);
    nebraska = new StateWidget(usa.getChild("NE"), "Nebraska", stateColor[26], shp.getChild("NE"), "NE");
    widgetList.add(nebraska);
    nevada = new StateWidget(usa.getChild("NV"), "Nevada", stateColor[27], shp.getChild("NV"), "NV");
    widgetList.add(nevada);
    newhampshire = new StateWidget(usa.getChild("NH"), "New Hampshire", stateColor[28], shp.getChild("NH"), "NH");
    widgetList.add(newhampshire);
    newjersey = new StateWidget(usa.getChild("NJ"), "New Jersey", stateColor[29], shp.getChild("NJ"), "NJ");
    widgetList.add(newjersey);
    newmexico = new StateWidget(usa.getChild("NM"), "New Jersey", stateColor[30], shp.getChild("NM"), "NM");
    widgetList.add(newmexico);
    newyork = new StateWidget(usa.getChild("NY"), "New York", stateColor[31], shp.getChild("NY"), "NY");
    widgetList.add(newyork);
    northcarolina = new StateWidget(usa.getChild("NC"), "North Carolina", stateColor[32], shp.getChild("NC"), "NC");
    widgetList.add(northcarolina);
    northdakota = new StateWidget(usa.getChild("ND"), "North Dakota", stateColor[33], shp.getChild("ND"), "ND");
    widgetList.add(northdakota);
    ohio = new StateWidget(usa.getChild("OH"), "Ohio", stateColor[34], shp.getChild("OH"), "OH");
    widgetList.add(ohio);
    oklahoma = new StateWidget(usa.getChild("OK"), "Oklahoma", stateColor[35], shp.getChild("OK"), "OK");
    widgetList.add(oklahoma);
    oregon = new StateWidget(usa.getChild("OR"), "Oregon", stateColor[36], shp.getChild("OR"), "OR");
    widgetList.add(oregon);
    pennsylvania = new StateWidget(usa.getChild("PA"), "Pennsylvania", stateColor[37], shp.getChild("PA"), "PA");
    widgetList.add(pennsylvania);
    rhodeisland = new StateWidget(usa.getChild("RI"), "Rhodeisland", stateColor[38], shp.getChild("RI"), "RI");
    widgetList.add(rhodeisland);
    southcarolina = new StateWidget(usa.getChild("SC"), "South Carolina", stateColor[39], shp.getChild("SC"), "SC");
    widgetList.add(southcarolina);
    southdakota = new StateWidget(usa.getChild("SD"), "South Dakota", stateColor[40], shp.getChild("SD"), "SD");
    widgetList.add(southdakota);
    tennessee = new StateWidget(usa.getChild("TN"), "Tennessee", stateColor[41], shp.getChild("TN"), "TN");
    widgetList.add(tennessee);
    texas = new StateWidget(usa.getChild("TX"), "Texas", stateColor[42], shp.getChild("TX"), "TX");
    widgetList.add(texas);
    utah = new StateWidget(usa.getChild("UT"), "Utah", stateColor[43], shp.getChild("UT"), "UT");
    widgetList.add(utah);
    vermont = new StateWidget(usa.getChild("VT"), "Vermont", stateColor[44], shp.getChild("VT"), "VT");
    widgetList.add(vermont);
    virginia = new StateWidget(usa.getChild("VA"), "Virginia", stateColor[45], shp.getChild("VA"), "VA");
    widgetList.add(virginia);
    washington = new StateWidget(usa.getChild("WA"), "Washington", stateColor[46], shp.getChild("WA"), "WA");
    widgetList.add(washington);
    westvirginia = new StateWidget(usa.getChild("WV"), "West Virginia", stateColor[47], shp.getChild("WV"), "WV");
    widgetList.add(westvirginia);
    wisconsin = new StateWidget(usa.getChild("WI"), "Wisconsin", stateColor[48], shp.getChild("WI"), "WI");
    widgetList.add(wisconsin);
    wyoming = new StateWidget(usa.getChild("WY"), "Wyoming", stateColor[49], shp.getChild("WY"), "WY");
    widgetList.add(wyoming);
  }

  void draw() { // draw method for each state
    shape(usa);
    for (int i = 0; i<widgetList.size(); i++) {
      StateWidget aWidget = (StateWidget) widgetList.get(i);
      aWidget.draw(stateColor[i]);
    }
  }
  void mouseMoved() { // mouse hovering over state widget???
    String stateName;
    for (int i = 0; i<widgetList.size(); i++) {
      StateWidget aWidget = (StateWidget) widgetList.get(i);
      stateName = aWidget.getName(mouseX, mouseY);
    }
  }
  String mousePressed() { // clicky on state??
    String stateName = "";
    for (int i = 0; i<widgetList.size(); i++) {
        StateWidget aWidget = (StateWidget) widgetList.get(i);
        if (aWidget.getName(mouseX, mouseY) != null) stateName = aWidget.getName(mouseX, mouseY);
      }
   return(stateName);
  }
  void getColors(int[] tally) {
    int max = 1;
    for (int i = 0; i < tally.length; i++) {
      if (tally[i] > max)
        max = tally[i];
    }
    System.out.print(max);
    for (int i = 0; i < stateColor.length; i++) {
      float h = 255 - (tally[i]*230/max);
      stateColor[i] = color(h);
    }
  }
}
