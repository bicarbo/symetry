void kickBox(float[] a) { 
  sendOscTable("bassTable", int(a));
}
void clapBox(float[] a) { 
  sendOscTable("clapTable", int(a));
}

void cymbBox(float[] a) { 
  sendOscTable("cymbTable", int(a));
}
void hihatBox(float[] a) { 
  sendOscTable("hihatTable", int(a));
}

void kut(int theValue) {
  sendOscDualMessage("mute", 0, theValue);
}
void rut(int theValue) {
  sendOscDualMessage("mute", 1, theValue);
}
void hut(int theValue) {
  sendOscDualMessage("mute", 2, theValue);
}
void cut(int theValue) {
  sendOscDualMessage("mute", 3, theValue);
}

void sut(int theValue) {
  sendOscDualMessage("mute", 4, theValue);
}
void nut(int theValue) {
  sendOscDualMessage("mute", 5, theValue);
}
void sendOscTable(String msg, int[] tab) {
  OscMessage toSend = new OscMessage("/" +  msg);
  toSend.add(tab);
  oscP5.send(toSend, sonicPi);
}
void kickRate(float value) {
  sendOscDualMessage("kick", 0, value);
}

void kickVol(float value) {
  sendOscDualMessage("kick", 1, value);
}

void kickAttack(float value) {
  sendOscDualMessage("kick", 2, value);
}

void clapRate(float value) {
  sendOscDualMessage("clap", 0, value);
}
void bpm(float value) {
  sendOscMessage("bpm", value);
}

void clapVol(float value) {
  sendOscDualMessage("clap", 1, value);
}
void clapAttack(float value) {
  sendOscDualMessage("clap", 2, value);
}
void hihatRate(float value) {
  sendOscDualMessage("hihat", 0, value);
}

void hihatVol(float value) {
  sendOscDualMessage("hihat", 1, value);
}
void hihatAtttack(float value) {
  sendOscDualMessage("hihat", 2, value);
}
void cymbRate(float value) {
  sendOscDualMessage("cymb", 0, value);
}

void cymbVol(float value) {
  sendOscDualMessage("cymb", 1, value);
}
void cymbAtttack(float value) {
  sendOscDualMessage("cymb", 2, value);
}

// The following methods are called you use the buttons, sliders, etc. in the UI.
void setSynth1OSC(int value) {
  switch(value) {
  case 0:
    sendOscMessage("waveform1", 0);
    break;
  case 1:
    sendOscMessage("waveform1", 1);
    break;
  case 2:
    sendOscMessage("waveform1", 2);
    break;
  case 3:
    sendOscMessage("waveform1", 3);
    break;
  case 4:
    sendOscMessage("waveform1", 4);
    break;
  case 5:
    sendOscMessage("waveform1", 5);
    break;
  }
}


void synth1Cutoff(int theValue) {
  sendOscDualMessage("synth", 0, constrain(theValue, 0, 130)); // Cutoff
}
void synth1Resonance(float theValue) {
  sendOscDualMessage("synth", 1, constrain(theValue, 0, 0.99)); // Resonance
}
void synth1Attack(float theValue) {
  sendOscDualMessage("synth", 2, theValue); // Attack
}
void synth1Release(float theValue) {
  sendOscDualMessage("synth", 3, theValue); // Release
}
void synthReverb(float theValue) {
  sendOscDualMessage("synth", 4, theValue); // Reverb
}
void synthDistortion(float theValue) {
  sendOscDualMessage("synth", 5, theValue); // Distortion
}
void synth2Volume(float theValue) {
  sendOscDualMessage("synth", 6, theValue); // OSC2 Volume
}
void synth2Transpose(int theValue) {
  sendOscDualMessage("synth", 7, theValue); // OSC2, transpose
}

void restart() {
  if (debugMessages) println("restart");
  cp5.getController("note1Slider").setValue(0);
  cp5.getController("note2Slider").setValue(0);
  cp5.getController("note3Slider").setValue(0);
  cp5.getController("note4Slider").setValue(0);
  cp5.getController("note5Slider").setValue(0);
  cp5.getController("note6Slider").setValue(0);
  cp5.getController("note7Slider").setValue(0);
  cp5.getController("note8Slider").setValue(0);
  cp5.getController("note9Slider").setValue(0);
  cp5.getController("note10Slider").setValue(0);
  cp5.getController("note11Slider").setValue(0);
  cp5.getController("note12Slider").setValue(0);
  cp5.getController("note13Slider").setValue(0);
  cp5.getController("note14Slider").setValue(0);
  cp5.getController("note15Slider").setValue(0);
  cp5.getController("note16Slider").setValue(0);
  cp5.getController("note17Slider").setValue(0);
  cp5.getController("note18Slider").setValue(0);
  cp5.getController("note19Slider").setValue(0);
  cp5.getController("note20Slider").setValue(0);
  cp5.getController("note21Slider").setValue(0);
  cp5.getController("note22Slider").setValue(0);
  cp5.getController("note23Slider").setValue(0);
  cp5.getController("note24Slider").setValue(0);
  cp5.getController("note25Slider").setValue(0);
  cp5.getController("note26Slider").setValue(0);
  cp5.getController("note27Slider").setValue(0);
  cp5.getController("note28Slider").setValue(0);
  cp5.getController("note29Slider").setValue(0);
  cp5.getController("note30Slider").setValue(0);
  cp5.getController("note31Slider").setValue(0);
  cp5.getController("note32Slider").setValue(0);
  cp5.getController("note33Slider").setValue(0);
  cp5.getController("note34Slider").setValue(0);
  cp5.getController("note35Slider").setValue(0);
  cp5.getController("note36Slider").setValue(0);
  cp5.getController("note37Slider").setValue(0);
  cp5.getController("note38Slider").setValue(0);
  cp5.getController("note39Slider").setValue(0);
  cp5.getController("note40Slider").setValue(0);
  cp5.getController("note41Slider").setValue(0);
  cp5.getController("note42Slider").setValue(0);
  cp5.getController("note43Slider").setValue(0);
  cp5.getController("note44Slider").setValue(0);
  cp5.getController("note45Slider").setValue(0);
  cp5.getController("note46Slider").setValue(0);
  cp5.getController("note47Slider").setValue(0);
  cp5.getController("note48Slider").setValue(0);
  cp5.getController("note49Slider").setValue(0);
  cp5.getController("note50Slider").setValue(0);
  cp5.getController("note51Slider").setValue(0);
  cp5.getController("note52Slider").setValue(0);
  cp5.getController("note53Slider").setValue(0);
  cp5.getController("note54Slider").setValue(0);
  cp5.getController("note55Slider").setValue(0);
  cp5.getController("note56Slider").setValue(0);
  cp5.getController("note57Slider").setValue(0);
  cp5.getController("note58Slider").setValue(0);
  cp5.getController("note59Slider").setValue(0);
  cp5.getController("note60Slider").setValue(0);
  cp5.getController("note61Slider").setValue(0);
  cp5.getController("note62Slider").setValue(0);
  cp5.getController("note63Slider").setValue(0);
  cp5.getController("note64Slider").setValue(0);
}

void randomizer() {
  if (debugMessages) println("RANDOMIZER!");
  int[] randVal = new int[8];
  for (int i=0; i<8; i++) randVal[i] = int(random(0, 90));
  cp5.getController("note1Slider").setValue(randVal[0]);
  cp5.getController("note2Slider").setValue(randVal[1]);
  cp5.getController("note3Slider").setValue(randVal[2]);
  cp5.getController("note4Slider").setValue(randVal[3]);
  cp5.getController("note5Slider").setValue(randVal[4]);
  cp5.getController("note6Slider").setValue(randVal[5]);
  cp5.getController("note7Slider").setValue(randVal[6]);
  cp5.getController("note8Slider").setValue(randVal[7]);
  cp5.getController("note9Slider").setValue(randVal[0]);
  cp5.getController("note10Slider").setValue(randVal[1]);
  cp5.getController("note11Slider").setValue(randVal[2]);
  cp5.getController("note12Slider").setValue(randVal[3]);
  cp5.getController("note13Slider").setValue(randVal[4]);
  cp5.getController("note14Slider").setValue(randVal[5]);
  cp5.getController("note15Slider").setValue(randVal[6]);
  cp5.getController("note16Slider").setValue(randVal[7]);
  cp5.getController("note17Slider").setValue(randVal[0]);
  cp5.getController("note18Slider").setValue(randVal[1]);
  cp5.getController("note19Slider").setValue(randVal[2]);
  cp5.getController("note20Slider").setValue(randVal[3]);
  cp5.getController("note21Slider").setValue(randVal[4]);
  cp5.getController("note22Slider").setValue(randVal[5]);
  cp5.getController("note23Slider").setValue(randVal[6]);
  cp5.getController("note24Slider").setValue(randVal[7]);
  cp5.getController("note25Slider").setValue(randVal[0]);
  cp5.getController("note26Slider").setValue(randVal[1]);
  cp5.getController("note27Slider").setValue(randVal[2]);
  cp5.getController("note28Slider").setValue(randVal[3]);
  cp5.getController("note29Slider").setValue(randVal[4]);
  cp5.getController("note30Slider").setValue(randVal[5]);
  cp5.getController("note31Slider").setValue(randVal[6]);
  cp5.getController("note32Slider").setValue(randVal[7]);
}
void note1Slider(int theValue) {
  sendOscNotes("0", theValue);
  if (repeatMelody) slides[32].setValue(theValue);
}
void note2Slider(int theValue) {
  sendOscNotes("1", theValue);
  if (repeatMelody) slides[33].setValue(theValue);
}
void note3Slider(int theValue) {
  sendOscNotes("2", theValue);
  if (repeatMelody) slides[34].setValue(theValue);
}
void note4Slider(int theValue) {
  sendOscNotes("3", theValue);
  if (repeatMelody) slides[35].setValue(theValue);
}
void note5Slider(int theValue) {
  sendOscNotes("4", theValue);
  if (repeatMelody) slides[36].setValue(theValue);
}
void note6Slider(int theValue) {
  sendOscNotes("5", theValue);
  if (repeatMelody) slides[37].setValue(theValue);
}
void note7Slider(int theValue) {
  sendOscNotes("6", theValue);
  if (repeatMelody) slides[38].setValue(theValue);
}
void note8Slider(int theValue) {
  sendOscNotes("7", theValue);
  if (repeatMelody) slides[39].setValue(theValue);
}
void note9Slider(int theValue) {
  sendOscNotes("8", theValue);
  if (repeatMelody) slides[40].setValue(theValue);
}
void note10Slider(int theValue) {
  sendOscNotes("9", theValue);
  if (repeatMelody) slides[41].setValue(theValue);
}
void note11Slider(int theValue) {
  sendOscNotes("10", theValue);
  if (repeatMelody) slides[42].setValue(theValue);
}
void note12Slider(int theValue) {
  sendOscNotes("11", theValue);
  if (repeatMelody) slides[43].setValue(theValue);
}
void note13Slider(int theValue) {
  sendOscNotes("12", theValue);
  if (repeatMelody) slides[44].setValue(theValue);
}
void note14Slider(int theValue) {
  sendOscNotes("13", theValue);
  if (repeatMelody) slides[45].setValue(theValue);
}
void note15Slider(int theValue) {
  sendOscNotes("14", theValue);
  if (repeatMelody) slides[46].setValue(theValue);
}
void note16Slider(int theValue) {
  sendOscNotes("15", theValue);
  if (repeatMelody) slides[47].setValue(theValue);
}
void note17Slider(int theValue) {
  sendOscNotes("16", theValue);
  if (repeatMelody) slides[48].setValue(theValue);
}
void note18Slider(int theValue) {
  sendOscNotes("17", theValue);
  if (repeatMelody) slides[49].setValue(theValue);
}
void note19Slider(int theValue) {
  sendOscNotes("18", theValue);
  if (repeatMelody) slides[50].setValue(theValue);
}
void note20Slider(int theValue) {
  sendOscNotes("19", theValue);
  if (repeatMelody) slides[51].setValue(theValue);
}
void note21Slider(int theValue) {
  sendOscNotes("20", theValue);
  if (repeatMelody) slides[52].setValue(theValue);
}
void note22Slider(int theValue) {
  sendOscNotes("21", theValue);
  if (repeatMelody) slides[53].setValue(theValue);
}
void note23Slider(int theValue) {
  sendOscNotes("22", theValue);
  if (repeatMelody) slides[54].setValue(theValue);
}
void note24Slider(int theValue) {
  sendOscNotes("23", theValue);
  if (repeatMelody) slides[55].setValue(theValue);
}
void note25Slider(int theValue) {
  sendOscNotes("24", theValue);
  if (repeatMelody) slides[56].setValue(theValue);
}
void note26Slider(int theValue) {
  sendOscNotes("25", theValue);
  if (repeatMelody) slides[57].setValue(theValue);
}
void note27Slider(int theValue) {
  sendOscNotes("26", theValue);
  if (repeatMelody) slides[58].setValue(theValue);
}
void note28Slider(int theValue) {
  sendOscNotes("27", theValue);
  if (repeatMelody) slides[59].setValue(theValue);
}
void note29Slider(int theValue) {
  sendOscNotes("28", theValue);
  if (repeatMelody) slides[60].setValue(theValue);
}
void note30Slider(int theValue) {
  sendOscNotes("29", theValue);
  if (repeatMelody) slides[61].setValue(theValue);
}
void note31Slider(int theValue) {
  sendOscNotes("30", theValue);
  if (repeatMelody) slides[62].setValue(theValue);
}
void note32Slider(int theValue) {
  sendOscNotes("31", theValue);
  if (repeatMelody) slides[63].setValue(theValue);
}
void note33Slider(int theValue) {
  sendOscNotes("32", theValue);
}
void note34Slider(int theValue) {
  sendOscNotes("33", theValue);
}
void note35Slider(int theValue) {
  sendOscNotes("34", theValue);
}
void note36Slider(int theValue) {
  sendOscNotes("35", theValue);
}
void note37Slider(int theValue) {
  sendOscNotes("36", theValue);
}
void note38Slider(int theValue) {
  sendOscNotes("37", theValue);
}
void note39Slider(int theValue) {
  sendOscNotes("38", theValue);
}
void note40Slider(int theValue) {
  sendOscNotes("39", theValue);
}
void note41Slider(int theValue) {
  sendOscNotes("40", theValue);
}
void note42Slider(int theValue) {
  sendOscNotes("41", theValue);
}
void note43Slider(int theValue) {
  sendOscNotes("42", theValue);
}
void note44Slider(int theValue) {
  sendOscNotes("43", theValue);
}
void note45Slider(int theValue) {
  sendOscNotes("44", theValue);
}
void note46Slider(int theValue) {
  sendOscNotes("45", theValue);
}
void note47Slider(int theValue) {
  sendOscNotes("46", theValue);
}
void note48Slider(int theValue) {
  sendOscNotes("47", theValue);
}
void note49Slider(int theValue) {
  sendOscNotes("48", theValue);
}
void note50Slider(int theValue) {
  sendOscNotes("49", theValue);
}
void note51Slider(int theValue) {
  sendOscNotes("50", theValue);
}
void note52Slider(int theValue) {
  sendOscNotes("51", theValue);
}
void note53Slider(int theValue) {
  sendOscNotes("52", theValue);
}
void note54Slider(int theValue) {
  sendOscNotes("53", theValue);
}
void note55Slider(int theValue) {
  sendOscNotes("54", theValue);
}
void note56Slider(int theValue) {
  sendOscNotes("55", theValue);
}
void note57Slider(int theValue) {
  sendOscNotes("56", theValue);
}
void note58Slider(int theValue) {
  sendOscNotes("57", theValue);
}
void note59Slider(int theValue) {
  sendOscNotes("58", theValue);
}
void note60Slider(int theValue) {
  sendOscNotes("59", theValue);
}
void note61Slider(int theValue) {
  sendOscNotes("60", theValue);
}
void note62Slider(int theValue) {
  sendOscNotes("61", theValue);
}
void note63Slider(int theValue) {
  sendOscNotes("62", theValue);
}
void note64Slider(int theValue) {
  sendOscNotes("63", theValue);
}
// Functions for sending the OSC messages
void sendOscMessage(String msg, float val) {
  OscMessage toSend = new OscMessage("/" + msg);
  toSend.add(val);
  oscP5.send(toSend, sonicPi);
  println(val);
  if (debugMessages) println(toSend);
}

void sendOscMessage(String msg, int val) {
  OscMessage toSend = new OscMessage("/" + msg);
  toSend.add(val);
  oscP5.send(toSend, sonicPi);
  if (debugMessages) println(toSend);
}

void sendOscNotes(String msg, int val) {
  OscMessage toSend = new OscMessage("/notes");
  slidesValues[int(msg)] = val;
  toSend.add(slidesValues);
  oscP5.send(toSend, sonicPi);
  if (debugMessages) println(toSend);
}

void sendOscDualMessage(String msg, float val1, float val2) {
  OscMessage toSend = new OscMessage("/" + msg);
  toSend.add(val1);
  toSend.add(val2);
  oscP5.send(toSend, sonicPi);
  if (debugMessages) println(toSend);
}