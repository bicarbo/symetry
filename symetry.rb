############################################################
#  PLEXMELODY #
############################################################
bpm = 92
# SET THE TEMPO OF YOUR LIVE SET HERE
use_bpm bpm
use_debug false

# VARIABLES FOR THE INSTRUMENTS AND MIXER - CHANGED VIA OSC
beat1Cutoff = 0
beat1Vol = 1.0
kickToggle = 0
kickVol = 1.0
kickDecay = 1.0
kickRate = 1
kickAttack = 1
clapToggle = 0
clapVol = 1
clapDecay = 0
clapRate = 1.0
clapAttack = 0
hihatToggle = 0
hihatVol = 1.0
hihatDecay = 0
hihatRate = 1.0
hihatAttack = 1.0
cymbVol = 1
cymbDecay = 0
cymbRate = 1.0
cymbAttack = 0
cymbToggle = 0
drumReverb = 0
lowKill = 0
synthCutoff = 0
synthResonance = 0.5
synthAttack =
  synthRelease = 0.05
synthReverb = 0.5
synthDistortion = 0.2
trootToggle = 0
synthWaveform = :tb303
synthVol = 1
nappeVol = 1
nuotit = [64, :r, 67, :r, 63, :r, 58, :r, :r, 56, 63, :r, :r, :r, :r, 58, 60, :r, :r, 54, 49, :r, :r, :r, :r, :r, :r, :r, :r, :r, :r, :r, 67, :r, 68, :r, 63, :r, 60, :r, :r, 56, 65, :r, :r, :r, :r, 63, 59,:r, :r, 54, 49, :r, :r, :r, :r, :r, :r, :r, :r, :r, :r, :r]
kickSample = :bd_haus
clapSample = :drum_cowbell
hihatSample = :elec_blup
beat1Sample = :loop_amen
clapSample = "/home/mathieu21/Musique/Samples/afx.ogg"
kickPattern = [1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 1, 1, 1, 1, 0]
clapPattern = [0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0, 1, 0]
hihatPattern = [0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 1, 1, 1, 1, 0]


live_loop :kickdrum do
  with_fx :distortion, mix: 0.2 do
    32.times do
      sample kickSample, amp: kickPattern.ring.tick*kickVol*1.5, rate: kickRate , release: kickAttack, cutoff: 110 if (kickToggle == 1)
      sleep 0.25
    end
  end
end

live_loop :clapdrum, sync: :kickdrum do
  with_fx :distortion, mix: 0.2 do
    32.times do
      sample clapSample, amp: clapPattern.ring.tick*clapVol*1.5, rate:  clapRate, release: clapAttack, cutoff: 110 if (clapToggle == 1)#line( 1, 2.8 ,step: 9).tick*
      sleep 0.25
    end
  end
end

live_loop :hihatdrum, sync: :kickdrum do
  with_fx :distortion, mix: 0.2 do
    32.times do
      sample hihatSample, amp: hihatVol*1.5, rate:  ring(10, 15, 12, 20).choose*hihatRate, release: hihatAttack, cutoff: 110 if (hihatToggle == 1)#hihatPattern.ring.tick*
      sleep 0.125
    end
  end
end




live_loop :cymb, sync: :kickdrum do
  with_fx :distortion, mix: 0.2 do
    sample :elec_tick  ,  time_dis: 5, rate:  ring(1, 1.5,1, 2).tick,  amp: cymbVol*1.5, cutoff: 110 if (trootToggle == 1)
    sleep  line(1, 0.05, steps:10).tick
  end
end

live_loop :nappe, sync: :kickdrum do
  with_fx :reverb, room: 0.9 do
    use_synth :fm
    play  (ring 80, 85, 51, 63).tick,amp: nappeVol, release: 6, attack: 2, cutoff: 90, res: 50#80, 89, 54
    sleep (ring 4, 4, 3, 5).look;
  end
end


live_loop :synth, sync: :kickdrum do
  with_fx :reverb, room: synthReverb do
    with_fx :distortion, mix: 0.5, distort: synthDistortion do
      use_synth synthWaveform
      play nuotit.ring.tick, amp: synthVol, attack: synthAttack, release: synthRelease, cutoff: synthCutoff, res: synthResonance
      sleep 0.5
    end
  end
end


live_loop :synthOSC do
  osc=sync "/synth"
  if (osc[0] == 0)
    synthCutoff = osc[1]
  elsif (osc[0] == 1)
    synthResonance = osc[1]
  elsif (osc[0] == 2)
    synthAttack = osc[1]
  elsif (osc[0] == 3)
    synthRelease = osc[1]
  elsif (osc[0] == 4)
    synthReverb = osc[1]
  elsif (osc[0] == 5)
    synthDistortion = osc[1]
  elsif (osc[0] == 6)
    synth2Volume = osc[1]
  elsif (osc[0] == 7)
    synth2Transpose = osc[1]
  end
end

live_loop :waveform1OSC do
  osc=sync "/waveform1"
  if (osc[0] == 0)
    synthWaveform = :tb303
  elsif (osc[0] == 1)
    synthWaveform = :pulse
  elsif (osc[0] == 2)
    synthWaveform = :pluck
  elsif (osc[0] == 3)
    synthWaveform = :mod_fm
  elsif (osc[0] == 4)
    synthWaveform = :subpulse
  elsif (osc[0] == 5)
    synthWaveform = :zawa
  end
end

live_loop :muting do
  osc=sync "/mute"
  if (osc[0] == 0)
    kickToggle = osc[1]
  elsif (osc[0] == 1)
    clapToggle = osc[1]
  elsif (osc[0] == 2)
    hihatToggle = osc[1]
  elsif (osc[0] == 3)
    trootToggle = osc[1]
  elsif (osc[0] == 4)
    synthVol = osc[1]
  elsif (osc[0] == 5)
    nappeVol = osc[1]
  end
end

live_loop :noteOSC do
  oscN=sync "/notes"
  for i in 0..63
    if (oscN[i] == 0)
      nuotit[i] = :r
    else nuotit[i] = oscN[i]
    end
  end
end

live_loop :kickMotif do
  oscP=sync "/bassTable"
  kickPattern = oscP
end


live_loop :kickOSC do
  oscK=sync "/kick"
  if (oscK[0] == 0)
    kickRate = oscK[1]
  elsif (oscK[0] == 1)
    kickVol = oscK[1]
  elsif (oscK[0] == 2)
    kickAttack = oscK[1]
  end
end

live_loop :clapMotif do
  oscC=sync "/clapTable"
  clapPattern = oscC
end

live_loop :clapOSC do
  oscC=sync "/clap"
  if (oscC[0] == 0)
    clapRate = oscC[1]
  elsif (oscC[0] == 1)
    clapVol = oscC[1]
  elsif (oscC[0] == 2)
    clapAttack = oscC[1]
  end
end

live_loop :hihatMotif do
  oscE=sync "/hihatTable"
  hihatPattern = oscE
end

live_loop :hihatOSC do
  oscH=sync "/hihat"
  if (oscH[0] == 0)
    hihatRate = oscH[1]
  elsif (oscH[0] == 1)
    hihatVol = oscH[1]
  elsif (oscH[0] == 2)
    hihatAttack = oscH[1]
  end
end

live_loop :cymbMotif do
  oscC=sync "/cymbTable"
  cymbPattern = oscC
end

live_loop :cymbOSC do
  oscC=sync "/cymb"
  if (oscC[0] == 0)
    cymbRate = oscC[1]
  elsif (oscC[0] == 1)
    cymbVol = oscC[1]
  elsif (oscC[0] == 2)
    cymbAttack = oscC[1]
  end
end