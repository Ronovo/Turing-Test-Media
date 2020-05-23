#Solo Methods
####################################################
define :arp1 do
  listOfNotes = [:g2,:as2,:c3,:g2]
  v = randomVelocity v, 0.195, 0.215
  4.times do |i|
    v = randomVelocity v, 0.195, 0.215
    play listOfNotes[i], sustain: 0.5, release: 0.5, vel: v
    sleep 0.25
  end
  play :f2, sustain: 0.5, release: 0.5, vel: 0.205
  sleep 0.25
  listOfNotes = [:g2,:as2,:c3]
  3.times do |i|
    play listOfNotes[i], sustain: 1, release: 1, vel: v
    sleep 0.25
  end
end

define :arp2 do
  listOfNotes = [:ds2,:fs2,:gs2,:ds2]
  v = randomVelocity v, 0.195, 0.215
  4.times do |i|
    v = randomVelocity v, 0.195, 0.215
    play listOfNotes[i], sustain: 0.5, release: 0.5, vel: v
    sleep 0.25
  end
  play :cs2, sustain: 2, release: 2, vel:  0.204
  sleep 0.25
  listOfNotes = [:ds2,:fs2,:gs2]
  3.times do |i|
    play listOfNotes[i], sustain: 0.5, release: 0.5, vel: v
    sleep 0.25
  end
end

define :arp3 do
  listOfNotes = [:f2,:gs2,:as2,:f2]
  v = randomVelocity v, 0.195, 0.215
  4.times do |i|
    v = randomVelocity v, 0.195, 0.215
    play listOfNotes[i], sustain: 0.5, release: 0.5, vel: v
    sleep 0.25
  end
  play :ds2, sustain: 2, release: 2, vel:  0.22
  sleep 0.25
  listOfNotes = [:f2,:gs2,:as2]
  3.times do |i|
    play listOfNotes[i], sustain: 0.5, release: 0.5, vel: v
    sleep 0.25
  end
end

define :soloLH1 do
  2.times do
    4.times do
      arp1
    end
    2.times do
      arp2
    end
    2.times do
      arp3
    end
  end
end

define :soloLH2 do
  define :callback do |note|
    9.times do |i|
      if (i == 3) or (i == 6)
        play note, sustain: 0.5, release: 0.5, vel: 0.19
        sleep 0.25
      else
        play note, sustain: 1, release: 1, vel: 0.19
        sleep 0.5
      end
    end
  end
  
  7.times do |i|
    if (i == 3)
      play :f2, sustain: 2, release: 2, vel: 0.19
      sleep 0.75
    elsif (i == 5)
      play :f2, sustain: 0.5, release: 0.5, vel: 0.19
      sleep 0.25
    else
      play :f2, sustain: 1, release: 1, vel: 0.19
      sleep 0.5
    end
  end
  play :fs2, sustain: 1, release: 1
  sleep 0.5
  callback :g2
  callback :gs2
  callback :g2
  callback :f2
  callback :g2
  callback :gs2
  4.times do
    play :as2, sustain: 1, release: 1, vel: 0.19
    sleep 0.5
  end
  play :b2, sustain: 2, release: 2, vel: 0.19
  sleep 1
end

define :soloRH1 do
  v = randomVelocity v, 0.21, 0.22
  notes = [:c5,:gs4,:g4,:ds4]
  parseChordVel notes, 1, 0.5, 4, v
  parseChordVel notes, 1, 0.75, 4, v
  parseChordVel notes, 1, 0.75, 4, v
  notes = [:g4,:c4]
  parseChordVel notes, 2, 1, 2, v
  notes = [:f4,:c4]
  parseChordVel notes, 2, 1, 2, v
  notes = [:f4,:c5]
  parseChordVel notes, 4, 2, 2, v
  notes = [:c4,:g3]
  parseChordVel notes, 2, 1, 2, v
  parseChordVel notes, 2, 1, 2, v
  notes = [:g4,:c4]
  parseChordVel notes, 4, 2, 2, v
  parseChordVel notes, 2, 1, 2, v
  notes = [:f4,:c4]
  parseChordVel notes, 2, 1, 2, v
  notes = [:f4,:c5]
  parseChordVel notes, 3, 1.5, 2, v
  play :as4, sustain: 8, release: 8
  sleep 0.5
  2.times do
    play :d4, sustain: 2, release: 2
    sleep 1
  end
end

define :soloRH2 do
  v = randomVelocity v, 0.21, 0.22
  notes = [:g4,:c4]
  parseChordVel notes, 3, 1.5, 2, v
  play :c4, sustain: 1, release: 1
  sleep 0.5
  play :g4, sustain: 2, release: 2
  sleep 1
  play :f4, sustain: 2, release: 2, vel: 0.21
  sleep 1
  notes = [:f4,:c5]
  parseChordVel notes, 4, 2, 2, v
  sleep 1
  notes = [:as4,:d4]
  parseChordVel notes, 4, 1, 2, 0.22
  notes = [:as4,:ds4,:d5]
  parseChordVel notes, 16, 2, 2, 0.23
end

define :solo do
  soloLH1
  in_thread do
    soloRH1
    soloRH2
  end
  soloLH2
end

##| with_synth :piano do
##|   with_fx :reverb, room: 0.95 do
##|     with_fx :lpf, cutoff: 100 do
##|       with_bpm 123 do
##|         solo
##|       end
##|     end
##|   end
##| end

