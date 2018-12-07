import oscP5.*;                   // Please install OscP5 and ControlP5 libraries from
import netP5.*;                   // the menu Sketch / Import Library / Add Library... 
import controlP5.*;

OscP5 oscP5;                      // OscP5 handles OSC communication from Processing to Sonic Pi
NetAddress sonicPi;               // NetAddress is created for OscP5 to 
ControlP5 cp5;                    // ControlP5 is used to create the user interface for this sketch

boolean enableComms = true;       // This boolean enables the OSC communication from this patch    // Boolean toggle to enable / disable transparent moving lines animation
boolean debugMessages = false;    // If enabled, prints outgoing OSC messages to terminal
boolean repeatMelody = false;

float transparency = 0.25;            // These variables are used to modulate some of the 
float transparencyModifier = 0.25;    // graphics effects in this patch
float ry, sinX, sinY1, sinY2, sinY3;  
static final int NUM_OF_LINES = 15;
float[] sinY = new float[NUM_OF_LINES];
float[] sinYRates = new float[NUM_OF_LINES];
Slider[] slides = new Slider[64];
int[] slidesValues = new int[64];// Variable for the 3D shape of Mehackit logo
PFont pfont1, pfont2;               // Variables for the custom fonts used in the UI

RadioButton p;
CheckBox kickBox, clapBox, hihatBox, cymbBox;// Radio button bar for selecting patterns

void setup() {
  //fullScreen(); 
  size(1280, 720);
  smooth();    
  oscP5 = new OscP5(this, 4559);                  // Initializing this processing to listen to OSC messages
  sonicPi = new NetAddress("127.0.0.1", 4559);     // and send them locally to Sonic Pi using port 4559 
  oscP5.plug(this, "test", "/test");  
  pfont1 = createFont("nasalization", 12, true);    // Creates custom fonts for "Nasalization"
  pfont2 = createFont("nasalization", 16, true);
  textFont(pfont1);

  setupUIElements();                              // setupUIElements creates the UI
  enableComms = true;
} 

public void test(int theA, int theB) {
  println("### plug event method. received a message /test.");
  println(" 2 ints received: "+theA+", "+theB);
}

void oscEvent(OscMessage theOscMessage) {
  /* with theOscMessage.isPlugged() you check if the osc message has already been
   * forwarded to a plugged method. if theOscMessage.isPlugged()==true, it has already 
   * been forwared to another method in your sketch. theOscMessage.isPlugged() can 
   * be used for double posting but is not required.
   */
  if (theOscMessage.isPlugged()==false) {
    /* print the address pattern and the typetag of the received OscMessage */
    // println("### received an osc message.");
    //println("### addrpattern\t"+theOscMessage.addrPattern());
    //println("### typetag\t"+theOscMessage.typetag());
  }
}

void draw() {
  background(129, 140, 187);
}

void keyPressed() {
  if (key == 'A') saveMelody(0);
  if (key == 'Z') saveMelody(1);
  if (key == 'E') saveMelody(2);
  if (key == 'R') saveMelody(3);
  if (key == 'a') loadMelody(0);
  if (key == 'z') loadMelody(1);
  if (key == 'e') loadMelody(2);
  if (key == 'r') loadMelody(3);
  if (key == 'Q') saveKick(0);
  if (key == 'S') saveKick(1);
  if (key == 'q') loadKick(0);
  if (key == 's') loadKick(1);
  if (key == 'D') saveClap(0);
  if (key == 'F') saveClap(1);
  if (key == 'd') loadClap(0);
  if (key == 'f') loadClap(1);
  if (key == 'J') saveHiHat(0);
  if (key == 'K') saveHiHat(1);
  if (key == 'j') loadHiHat(0);
  if (key == 'k') loadHiHat(1);
  if (key == 'L') saveCymb(0);
  if (key == 'M') saveCymb(1);
  if (key == 'l') loadCymb(0);
  if (key == 'm') loadCymb(1);
  if (key == 'w') { 
    loadKick(0);
    loadClap(0);
  }
  if (key == 'x') { 
    loadKick(1);
    loadClap(1);
  }
}

void repeatMel(boolean state) {
  repeatMelody = state;
}
void loadMelody(int ordre) {
  String[] notes = loadStrings("data/melody"+ordre+".txt");
  for (int i=0; i<64; i++) {
    slides[i].setValue(int(notes[i]));
  }
}

void saveKick(int ordre) {
  String[] value = str(kickBox.getArrayValue());
  value = append(value, str(cp5.getController("kickRate").getValue()));
  value = append(value, str(cp5.getController("kickVol").getValue()));
  value = append(value, str(cp5.getController("kickAttack").getValue()));
  saveStrings("data/kick"+ordre+".txt", value);
}

void loadKick(int ordre) {
  String[] notes = loadStrings("data/kick"+ordre+".txt");
  cp5.getController("kickRate").setValue(float(notes[32]));
  cp5.getController("kickVol").setValue(float(notes[33]));
  cp5.getController("kickAttack").setValue(float(notes[34]));
  String[] onOff = new String[32];
  arrayCopy(notes, onOff, 32);
  kickBox.setArrayValue(float(onOff));
  kickBox(float(onOff));
}

void saveClap(int ordre) {
  String[] value = str(clapBox.getArrayValue());
  value = append(value, str(cp5.getController("clapRate").getValue()));
  value = append(value, str(cp5.getController("clapVol").getValue()));
  value = append(value, str(cp5.getController("clapAttack").getValue()));
  saveStrings("data/clap"+ordre+".txt", value);
}

void loadClap(int ordre) {
  String[] notes = loadStrings("data/clap"+ordre+".txt");
  cp5.getController("clapRate").setValue(float(notes[32]));
  cp5.getController("clapVol").setValue(float(notes[33]));
  cp5.getController("clapAttack").setValue(float(notes[34]));
  String[] onOff = new String[32];
  arrayCopy(notes, onOff, 32);
  clapBox.setArrayValue(float(onOff));
  clapBox(float(onOff));
}

void saveHiHat(int ordre) {
  String[] value = str(clapBox.getArrayValue());
  value = append(value, str(cp5.getController("hihatRate").getValue()));
  value = append(value, str(cp5.getController("hihatVol").getValue()));
  value = append(value, str(cp5.getController("hihatAttack").getValue()));
  saveStrings("data/hihat"+ordre+".txt", value);
}

void loadHiHat(int ordre) {
  String[] notes = loadStrings("data/hihat"+ordre+".txt");
  cp5.getController("hihatRate").setValue(float(notes[32]));
  cp5.getController("hihatVol").setValue(float(notes[33]));
  cp5.getController("hihatAttack").setValue(float(notes[34]));
  String[] onOff = new String[32];
  arrayCopy(notes, onOff, 32);
  hihatBox.setArrayValue(float(onOff));
  hihatBox(float(onOff));
}
void saveCymb(int ordre) {
  String[] value = str(clapBox.getArrayValue());
  value = append(value, str(cp5.getController("cymbRate").getValue()));
  value = append(value, str(cp5.getController("cymbVol").getValue()));
  value = append(value, str(cp5.getController("cymbAttack").getValue()));
  saveStrings("data/cymb"+ordre+".txt", value);
}

void loadCymb(int ordre) {
  String[] notes = loadStrings("data/clap"+ordre+".txt");
  cp5.getController("cymbRate").setValue(float(notes[32]));
  cp5.getController("cymbVol").setValue(float(notes[33]));
  cp5.getController("cymbAttack").setValue(float(notes[34]));
  String[] onOff = new String[32];
  arrayCopy(notes, onOff, 32);
  cymbBox.setArrayValue(float(onOff));
}

void saveMelody(int ordre) {
  String[] theMelody = new String[64];
  for (int i=0; i<64; i++) {
    theMelody[i] = str(int(slides[i].getValue()));
  }
  saveStrings("data/melody"+ordre+".txt", theMelody);
}