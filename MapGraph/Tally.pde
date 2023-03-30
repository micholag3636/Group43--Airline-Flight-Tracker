int[] tally(ArrayList<flightDatabase> flights) {
  // pretty self explanatory, tallys number of flights originating from each state
  int[] tallyhall = new int[50];
  for (int i = 0; i < flights.size(); i++)
  {
    flightDatabase f = flights.get(i);
    String state = f.ORIGIN_STATE_ABR;
    if (state.equals("AL")) tallyhall[0] += 1;
    else if (state.equals("AK")) tallyhall[1] += 1;
    else if (state.equals("AZ")) tallyhall[2] += 1;
    else if (state.equals("AR")) tallyhall[3] += 1;
    else if (state.equals("CA")) tallyhall[4] += 1;
    else if (state.equals("CO")) tallyhall[5] += 1;
    else if (state.equals("CT")) tallyhall[6] += 1;
    else if (state.equals("DE")) tallyhall[7] += 1;
    else if (state.equals("FL")) tallyhall[8] += 1;
    else if (state.equals("GA")) tallyhall[9] += 1;
    else if (state.equals("HI")) tallyhall[10] += 1;
    else if (state.equals("ID")) tallyhall[11] += 1;
    else if (state.equals("IL")) tallyhall[12] += 1;
    else if (state.equals("IN")) tallyhall[13] += 1;
    else if (state.equals("IA")) tallyhall[14] += 1;
    else if (state.equals("KS")) tallyhall[15] += 1;
    else if (state.equals("KY")) tallyhall[16] += 1;
    else if (state.equals("LA")) tallyhall[17] += 1;
    else if (state.equals("ME")) tallyhall[18] += 1;
    else if (state.equals("MD")) tallyhall[19] += 1;
    else if (state.equals("MA")) tallyhall[20] += 1;
    else if (state.equals("MI")) tallyhall[21] += 1;
    else if (state.equals("MN")) tallyhall[22] += 1;
    else if (state.equals("MS")) tallyhall[23] += 1;
    else if (state.equals("MO")) tallyhall[24] += 1;
    else if (state.equals("MT")) tallyhall[25] += 1;
    else if (state.equals("NE")) tallyhall[26] += 1;
    else if (state.equals("NV")) tallyhall[27] += 1;
    else if (state.equals("NH")) tallyhall[28] += 1;
    else if (state.equals("NJ")) tallyhall[29] += 1;
    else if (state.equals("NM")) tallyhall[30] += 1;
    else if (state.equals("NY")) tallyhall[31] += 1;
    else if (state.equals("NC")) tallyhall[32] += 1;
    else if (state.equals("ND")) tallyhall[33] += 1;
    else if (state.equals("OH")) tallyhall[34] += 1;
    else if (state.equals("OK")) tallyhall[35] += 1;
    else if (state.equals("OR")) tallyhall[36] += 1;
    else if (state.equals("PA")) tallyhall[37] += 1;
    else if (state.equals("RI")) tallyhall[38] += 1;
    else if (state.equals("SC")) tallyhall[39] += 1;
    else if (state.equals("SD")) tallyhall[40] += 1;
    else if (state.equals("TN")) tallyhall[41] += 1;
    else if (state.equals("TX")) tallyhall[42] += 1;
    else if (state.equals("UT")) tallyhall[43] += 1;
    else if (state.equals("VT")) tallyhall[44] += 1;
    else if (state.equals("VA")) tallyhall[45] += 1;
    else if (state.equals("WA")) tallyhall[46] += 1;
    else if (state.equals("WV")) tallyhall[47] += 1;
    else if (state.equals("WI")) tallyhall[48] += 1;
    else if (state.equals("WY")) tallyhall[49] += 1;
  }
  return tallyhall;
}
