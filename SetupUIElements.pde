
void setupUIElements() {
  // Define fonts for the ControlP5 UI interface
  ControlFont font1 = new ControlFont(pfont1);
  ControlFont font2 = new ControlFont(pfont2);

  // Initialize a new ControlP5 interface and set colors and fonts for it
  cp5 = new ControlP5(this);
  cp5.setColorBackground(color(22, 72, 106, 240));
  cp5.setColorActive(color(255, 171, 3, 255));
  cp5.setColorForeground(color(220));
  cp5.setFont(font1);

  // Create Knobs
  cp5.addToggle("repeatMel").setValue(0).setPosition(30, 640).setSize(21, 21).setLabel("X2").align(CENTER, CENTER, CENTER, CENTER);
  cp5.addKnob("kickRate").setRange(-5, 5).setValue(1).setPosition(210, 10).setRadius(40).setDragDirection(Knob.HORIZONTAL).setLabel("Rate").setDecimalPrecision(2);
  cp5.addKnob("kickVol").setRange(0, 3).setValue(1).setPosition(290, 10).setRadius(20).setDragDirection(Knob.HORIZONTAL).setLabel("Vol").setDecimalPrecision(1);  
  cp5.addKnob("kickAttack").setRange(0, 1).setValue(1).setPosition(290, 60).setRadius(20).setDragDirection(Knob.HORIZONTAL).setLabel("Attack").setDecimalPrecision(1);  
  cp5.addKnob("clapRate").setRange(-5, 5).setValue(1).setPosition(210, 110).setRadius(40).setDragDirection(Knob.HORIZONTAL).setLabel("Rate").setDecimalPrecision(2);
  cp5.addKnob("clapVol").setRange(0, 3).setValue(1).setPosition(290, 110).setRadius(20).setDragDirection(Knob.HORIZONTAL).setLabel("Vol").setDecimalPrecision(1);  
  cp5.addKnob("clapAttack").setRange(0, 1).setValue(1).setPosition(290, 160).setRadius(20).setDragDirection(Knob.HORIZONTAL).setLabel("Attack").setDecimalPrecision(1);  
  cp5.addKnob("hihatRate").setRange(-5, 5).setValue(1).setPosition(990, 10).setRadius(40).setDragDirection(Knob.HORIZONTAL).setLabel("Rate").setDecimalPrecision(2);
  cp5.addKnob("hihatVol").setRange(0, 3).setValue(1).setPosition(950, 10).setRadius(20).setDragDirection(Knob.HORIZONTAL).setLabel("Vol").setDecimalPrecision(1);  
  cp5.addKnob("hihatAttack").setRange(0, 1).setValue(1).setPosition(950, 60).setRadius(20).setDragDirection(Knob.HORIZONTAL).setLabel("Attack").setDecimalPrecision(1);  
  cp5.addKnob("cymbRate").setRange(-5, 5).setValue(1).setPosition(990, 110).setRadius(40).setDragDirection(Knob.HORIZONTAL).setLabel("Rate").setDecimalPrecision(2);
  cp5.addKnob("cymbVol").setRange(0, 3).setValue(1).setPosition(950, 160).setRadius(20).setDragDirection(Knob.HORIZONTAL).setLabel("Vol").setDecimalPrecision(1);  
  cp5.addKnob("cymbAttack").setRange(0, 1).setValue(1).setPosition(950, 110).setRadius(20).setDragDirection(Knob.HORIZONTAL).setLabel("Attack").setDecimalPrecision(1);  
  cp5.addKnob("synth1Cutoff").setRange(0, 129).setValue(50).setPosition(330, 10).setRadius(40).setDragDirection(Knob.HORIZONTAL).setLabel("Cutoff");
  cp5.addKnob("synth1Resonance").setRange(0, 0.95).setValue(0.5).setPosition(420, 10).setRadius(40).setDragDirection(Knob.HORIZONTAL).setLabel("Resonance").setDecimalPrecision(2);
  cp5.addKnob("synth1Attack").setRange(0, 0.25).setValue(0).setPosition(510, 10).setRadius(40).setDragDirection(Knob.HORIZONTAL).setLabel("Attack").setDecimalPrecision(2);
  cp5.addKnob("synth1Release").setRange(0, 1.0).setValue(0.25).setPosition(600, 10).setRadius(40).setDragDirection(Knob.HORIZONTAL).setLabel("Release").setDecimalPrecision(2);
  cp5.addKnob("synthReverb").setRange(0, 0.95).setValue(0.5).setPosition(330, 110).setRadius(40).setDragDirection(Knob.HORIZONTAL).setLabel("Reverb").setDecimalPrecision(2);
  cp5.addKnob("synthDistortion").setRange(0, 0.95).setValue(0.2).setPosition(510, 110).setRadius(40).setDragDirection(Knob.HORIZONTAL).setLabel("Distortion").setDecimalPrecision(2);
  cp5.addToggle("sut")
    .setPosition(440, 186)
    .setSize(50, 20);
  cp5.addToggle("nut")
    .setPosition(540, 186)
    .setSize(50, 20);

  kickBox = cp5.addCheckBox("kickBox")
    .setPosition(10, 10)
    .setSize(10, 10)
    .setItemsPerRow(8)
    .setSpacingColumn(14)
    .setSpacingRow(10)
    .addItem("0", 0)
    .addItem("1", 1)
    .addItem("2", 2)
    .addItem("3", 3)
    .addItem("4", 4)
    .addItem("5", 5)
    .addItem("6", 6)
    .addItem("7", 7)
    .addItem("8", 8)
    .addItem("9", 9)
    .addItem("A", 10)
    .addItem("B", 11)
    .addItem("C", 12)
    .addItem("D", 13)
    .addItem("E", 14)
    .addItem("F", 15)
    .addItem("G", 16)
    .addItem("H", 17)
    .addItem("I", 18)
    .addItem("J", 19)
    .addItem("K", 20)
    .addItem("L", 21)
    .addItem("M", 22)
    .addItem("N", 23)
    .addItem("O", 24)
    .addItem("P", 25)
    .addItem("Q", 26)
    .addItem("R", 27)
    .addItem("S", 28)
    .addItem("T", 29)
    .addItem("U", 30)
    .addItem("V", 31)
    ;
  cp5.addToggle("kut")
    .setPosition(140, 86)
    .setSize(50, 20)
    .setValue(false)
    .setMode(ControlP5.SWITCH)
    ;
  clapBox = cp5.addCheckBox("clapBox")
    .setPosition(10, 110)
    .setSize(10, 10)
    .setItemsPerRow(8)
    .setSpacingColumn(14)
    .setSpacingRow(10)
    .addItem("0'", 0)
    .addItem("1'", 1)
    .addItem("2'", 2)
    .addItem("3'", 3)
    .addItem("4'", 4)
    .addItem("5'", 5)
    .addItem("6'", 6)
    .addItem("7'", 7)
    .addItem("8'", 8)
    .addItem("9'", 9)
    .addItem("A'", 10)
    .addItem("B'", 11)
    .addItem("C'", 12)
    .addItem("D'", 13)
    .addItem("E'", 14)
    .addItem("F'", 15)
    .addItem("G'", 16)
    .addItem("H'", 17)
    .addItem("I'", 18)
    .addItem("J'", 19)
    .addItem("K'", 20)
    .addItem("L'", 21)
    .addItem("M'", 22)
    .addItem("N'", 23)
    .addItem("O'", 24)
    .addItem("P'", 25)
    .addItem("Q'", 26)
    .addItem("R'", 27)
    .addItem("S'", 28)
    .addItem("T'", 29)
    .addItem("U'", 30)
    .addItem("V'", 31)
    ;
  cp5.addToggle("rut")
    .setPosition(140, 186)
    .setSize(50, 20)
    .setValue(false)
    .setMode(ControlP5.SWITCH)
    ;
  hihatBox = cp5.addCheckBox("hihatBox")
    .setPosition(1080, 10)
    .setSize(10, 10)
    .setItemsPerRow(8)
    .setSpacingColumn(14)
    .setSpacingRow(10)
    .addItem("0!", 0)
    .addItem("1!", 1)
    .addItem("2!", 2)
    .addItem("3!", 3)
    .addItem("4!", 4)
    .addItem("5!", 5)
    .addItem("6!", 6)
    .addItem("7!", 7)
    .addItem("8!", 8)
    .addItem("9!'", 9)
    .addItem("A!", 10)
    .addItem("B!", 11)
    .addItem("C!", 12)
    .addItem("D!", 13)
    .addItem("E!", 14)
    .addItem("F!", 15)
    .addItem("G!", 16)
    .addItem("H!", 17)
    .addItem("I!", 18)
    .addItem("J!", 19)
    .addItem("K!", 20)
    .addItem("L!", 21)
    .addItem("M!", 22)
    .addItem("N!", 23)
    .addItem("O!", 24)
    .addItem("P!", 25)
    .addItem("Q!", 26)
    .addItem("R!", 27)
    .addItem("S!", 28)
    .addItem("T!", 29)
    .addItem("U!", 30)
    .addItem("V!", 31)
    ;

  cp5.addToggle("hut")
    .setPosition(1090, 86)
    .setSize(50, 20)
    .setValue(false)
    .setMode(ControlP5.SWITCH)
    ;
  cymbBox = cp5.addCheckBox("cymbBox")
    .setPosition(1080, 110)
    .setSize(10, 10)
    .setItemsPerRow(8)
    .setSpacingColumn(14)
    .setSpacingRow(10)
    .addItem("0)", 0)
    .addItem("1)", 1)
    .addItem("2)", 2)
    .addItem("3)", 3)
    .addItem("4)", 4)
    .addItem("5)", 5)
    .addItem("6)", 6)
    .addItem("7)", 7)
    .addItem("8)", 8)
    .addItem("9)'", 9)
    .addItem("A)", 10)
    .addItem("B)", 11)
    .addItem("C)", 12)
    .addItem("D)", 13)
    .addItem("E)", 14)
    .addItem("F)", 15)
    .addItem("G)", 16)
    .addItem("H)", 17)
    .addItem("I)", 18)
    .addItem("J)", 19)
    .addItem("K)", 20)
    .addItem("L)", 21)
    .addItem("M)", 22)
    .addItem("N)", 23)
    .addItem("O)", 24)
    .addItem("P)", 25)
    .addItem("Q)", 26)
    .addItem("R)", 27)
    .addItem("S)", 28)
    .addItem("T)", 29)
    .addItem("U)", 30)
    .addItem("V)", 31)
    ;

  cp5.addToggle("cut")
    .setPosition(1090, 186)
    .setSize(50, 20)
    .setValue(false)
    .setMode(ControlP5.SWITCH)
    ;
  cp5.addRadioButton("setSynth1OSC").setPosition(250, 670).setItemsPerRow(3).setItemWidth(82).setItemHeight(20)
    .addItem(":tb303", 0).addItem(":saw ", 1).addItem(":pulse", 2).addItem(":subpulse", 3).addItem(":dsaw", 4).addItem(":blade", 5)
    .align(CENTER, CENTER).activate(0).setNoneSelectedAllowed(false);              

  // Randomizer Button     
  cp5.addButton("randomizer").setPosition(950, 670).setSize(100, 20).setLabel("Randomize");
  cp5.addButton("restart").setPosition(1080, 670).setSize(100, 20).setLabel("Restarter");

  // Note Sequencer Sliders
  slides[0] = cp5.addSlider("note1Slider").setPosition(10, 210).setSize(20, 200).setRange(0, 90).setValue(0).setLabel(" 1");
  slides[1] = cp5.addSlider("note2Slider").setPosition(50, 210).setSize(20, 200).setRange(0, 90).setValue(0).setLabel(" 2");
  slides[2] = cp5.addSlider("note3Slider").setPosition(90, 210).setSize(20, 200).setRange(0, 90).setValue(0).setLabel(" 3");
  slides[3] = cp5.addSlider("note4Slider").setPosition(130, 210).setSize(20, 200).setRange(0, 90).setValue(0).setLabel(" 4");
  slides[4] = cp5.addSlider("note5Slider").setPosition(170, 210).setSize(20, 200).setRange(0, 90).setValue(0).setLabel(" 5");
  slides[5] = cp5.addSlider("note6Slider").setPosition(210, 210).setSize(20, 200).setRange(0, 90).setValue(0).setLabel(" 6");
  slides[6] = cp5.addSlider("note7Slider").setPosition(250, 210).setSize(20, 200).setRange(0, 90).setValue(0).setLabel(" 7");
  slides[7] = cp5.addSlider("note8Slider").setPosition(290, 210).setSize(20, 200).setRange(0, 90).setValue(0).setLabel(" 8");
  slides[8] = cp5.addSlider("note9Slider").setPosition(330, 210).setSize(20, 200).setRange(0, 90).setValue(0).setLabel(" 9");
  slides[9] = cp5.addSlider("note10Slider").setPosition(370, 210).setSize(20, 200).setRange(0, 90).setValue(0).setLabel(" 10");
  slides[10] = cp5.addSlider("note11Slider").setPosition(410, 210).setSize(20, 200).setRange(0, 90).setValue(0).setLabel(" 11");
  slides[11] = cp5.addSlider("note12Slider").setPosition(450, 210).setSize(20, 200).setRange(0, 90).setValue(0).setLabel(" 12");
  slides[12] = cp5.addSlider("note13Slider").setPosition(490, 210).setSize(20, 200).setRange(0, 90).setValue(0).setLabel(" 13");
  slides[13] = cp5.addSlider("note14Slider").setPosition(530, 210).setSize(20, 200).setRange(0, 90).setValue(0).setLabel(" 14");
  slides[14] = cp5.addSlider("note15Slider").setPosition(570, 210).setSize(20, 200).setRange(0, 90).setValue(0).setLabel(" 15");
  slides[15] = cp5.addSlider("note16Slider").setPosition(610, 210).setSize(20, 200).setRange(0, 90).setValue(0).setLabel(" 16");
  slides[16] = cp5.addSlider("note17Slider").setPosition(650, 210).setSize(20, 200).setRange(0, 90).setValue(0).setLabel(" 17");
  slides[17] = cp5.addSlider("note18Slider").setPosition(690, 210).setSize(20, 200).setRange(0, 90).setValue(0).setLabel(" 18");
  slides[18] = cp5.addSlider("note19Slider").setPosition(730, 210).setSize(20, 200).setRange(0, 90).setValue(0).setLabel(" 19");
  slides[19] = cp5.addSlider("note20Slider").setPosition(770, 210).setSize(20, 200).setRange(0, 90).setValue(0).setLabel(" 20");
  slides[20] = cp5.addSlider("note21Slider").setPosition(810, 210).setSize(20, 200).setRange(0, 90).setValue(0).setLabel(" 21");
  slides[21] = cp5.addSlider("note22Slider").setPosition(850, 210).setSize(20, 200).setRange(0, 90).setValue(0).setLabel(" 22");
  slides[22] = cp5.addSlider("note23Slider").setPosition(890, 210).setSize(20, 200).setRange(0, 90).setValue(0).setLabel(" 23");
  slides[23] = cp5.addSlider("note24Slider").setPosition(930, 210).setSize(20, 200).setRange(0, 90).setValue(0).setLabel(" 24");
  slides[24] = cp5.addSlider("note25Slider").setPosition(970, 210).setSize(20, 200).setRange(0, 90).setValue(0).setLabel(" 25");
  slides[25] = cp5.addSlider("note26Slider").setPosition(1010, 210).setSize(20, 200).setRange(0, 90).setValue(0).setLabel(" 26");
  slides[26] = cp5.addSlider("note27Slider").setPosition(1050, 210).setSize(20, 200).setRange(0, 90).setValue(0).setLabel(" 27");
  slides[27] = cp5.addSlider("note28Slider").setPosition(1090, 210).setSize(20, 200).setRange(0, 90).setValue(0).setLabel(" 28");
  slides[28] = cp5.addSlider("note29Slider").setPosition(1130, 210).setSize(20, 200).setRange(0, 90).setValue(0).setLabel(" 29");
  slides[29] = cp5.addSlider("note30Slider").setPosition(1170, 210).setSize(20, 200).setRange(0, 90).setValue(0).setLabel(" 30");
  slides[30] = cp5.addSlider("note31Slider").setPosition(1210, 210).setSize(20, 200).setRange(0, 90).setValue(0).setLabel(" 31");
  slides[31] = cp5.addSlider("note32Slider").setPosition(1250, 210).setSize(20, 200).setRange(0, 90).setValue(0).setLabel(" 32");
  //SECOND LINE
  slides[32] = cp5.addSlider("note33Slider").setPosition(10, 430).setSize(20, 200).setRange(0, 90).setValue(0).setLabel(" 33");
  slides[33] = cp5.addSlider("note34Slider").setPosition(50, 430).setSize(20, 200).setRange(0, 90).setValue(0).setLabel(" 34");
  slides[34] = cp5.addSlider("note35Slider").setPosition(90, 430).setSize(20, 200).setRange(0, 90).setValue(0).setLabel(" 35");
  slides[35] = cp5.addSlider("note36Slider").setPosition(130, 430).setSize(20, 200).setRange(0, 90).setValue(0).setLabel(" 36");
  slides[36] = cp5.addSlider("note37Slider").setPosition(170, 430).setSize(20, 200).setRange(0, 90).setValue(0).setLabel(" 37");
  slides[37] = cp5.addSlider("note38Slider").setPosition(210, 430).setSize(20, 200).setRange(0, 90).setValue(0).setLabel(" 38");
  slides[38] = cp5.addSlider("note39Slider").setPosition(250, 430).setSize(20, 200).setRange(0, 90).setValue(0).setLabel(" 39");
  slides[39] = cp5.addSlider("note40Slider").setPosition(290, 430).setSize(20, 200).setRange(0, 90).setValue(0).setLabel(" 40");
  slides[40] = cp5.addSlider("note41Slider").setPosition(330, 430).setSize(20, 200).setRange(0, 90).setValue(0).setLabel(" 41");
  slides[41] = cp5.addSlider("note42Slider").setPosition(370, 430).setSize(20, 200).setRange(0, 90).setValue(0).setLabel(" 42");
  slides[42] = cp5.addSlider("note43Slider").setPosition(410, 430).setSize(20, 200).setRange(0, 90).setValue(0).setLabel(" 43");
  slides[43] = cp5.addSlider("note44Slider").setPosition(450, 430).setSize(20, 200).setRange(0, 90).setValue(0).setLabel(" 44");
  slides[44] = cp5.addSlider("note45Slider").setPosition(490, 430).setSize(20, 200).setRange(0, 90).setValue(0).setLabel(" 45");
  slides[45] = cp5.addSlider("note46Slider").setPosition(530, 430).setSize(20, 200).setRange(0, 90).setValue(0).setLabel(" 46");
  slides[46] = cp5.addSlider("note47Slider").setPosition(570, 430).setSize(20, 200).setRange(0, 90).setValue(0).setLabel(" 47");
  slides[47] = cp5.addSlider("note48Slider").setPosition(610, 430).setSize(20, 200).setRange(0, 90).setValue(0).setLabel(" 48");
  slides[48] = cp5.addSlider("note49Slider").setPosition(650, 430).setSize(20, 200).setRange(0, 90).setValue(0).setLabel(" 49");
  slides[49] = cp5.addSlider("note50Slider").setPosition(690, 430).setSize(20, 200).setRange(0, 90).setValue(0).setLabel(" 50");
  slides[50] = cp5.addSlider("note51Slider").setPosition(730, 430).setSize(20, 200).setRange(0, 90).setValue(0).setLabel(" 51");
  slides[51] = cp5.addSlider("note52Slider").setPosition(770, 430).setSize(20, 200).setRange(0, 90).setValue(0).setLabel(" 52");
  slides[52] = cp5.addSlider("note53Slider").setPosition(810, 430).setSize(20, 200).setRange(0, 90).setValue(0).setLabel(" 53");
  slides[53] = cp5.addSlider("note54Slider").setPosition(850, 430).setSize(20, 200).setRange(0, 90).setValue(0).setLabel(" 54");
  slides[54] = cp5.addSlider("note55Slider").setPosition(890, 430).setSize(20, 200).setRange(0, 90).setValue(0).setLabel(" 55");
  slides[55] = cp5.addSlider("note56Slider").setPosition(930, 430).setSize(20, 200).setRange(0, 90).setValue(0).setLabel(" 56");
  slides[56] = cp5.addSlider("note57Slider").setPosition(970, 430).setSize(20, 200).setRange(0, 90).setValue(0).setLabel(" 57");
  slides[57] = cp5.addSlider("note58Slider").setPosition(1010, 430).setSize(20, 200).setRange(0, 90).setValue(0).setLabel(" 58");
  slides[58] = cp5.addSlider("note59Slider").setPosition(1050, 430).setSize(20, 200).setRange(0, 90).setValue(0).setLabel(" 59");
  slides[59] = cp5.addSlider("note60Slider").setPosition(1090, 430).setSize(20, 200).setRange(0, 90).setValue(0).setLabel(" 60");
  slides[60] = cp5.addSlider("note61Slider").setPosition(1130, 430).setSize(20, 200).setRange(0, 90).setValue(0).setLabel(" 61");
  slides[61] = cp5.addSlider("note62Slider").setPosition(1170, 430).setSize(20, 200).setRange(0, 90).setValue(0).setLabel(" 62");
  slides[62] = cp5.addSlider("note63Slider").setPosition(1210, 430).setSize(20, 200).setRange(0, 90).setValue(0).setLabel(" 63");
  slides[63] = cp5.addSlider("note64Slider").setPosition(1250, 430).setSize(20, 200).setRange(0, 90).setValue(0).setLabel(" 64");
  // Various text labels for the UI
  // cp5.addTextlabel("label2a").setText("SYNTH FILTER").setPosition(395, 5).setFont(font2);
  //  cp5.addTextlabel("label2b").setText("AMP ENVELOPE").setPosition(600, 5).setFont(font2);
}