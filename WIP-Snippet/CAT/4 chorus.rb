#CHORUS Methods
#######################
define :chorusLH1 do
  listOfNotes = [:c3,:c3,:c3,:ds3,:f3,:f3,:f3,:f3,:c3,:as2,:as2,:as2,:d3,:ds3,:ds3,:ds3,:ds3,:d3]
  x = 0
  l = listOfNotes.length
  l.times do
    v = randomVelocity v, 0.2, 0.21
    if (x == 4)
      play listOfNotes[x], sustain: 0.5, release: 0.5, vel: v
      sleep 0.25
    elsif (x==7) or (x == 13) or (x == 15)
      play listOfNotes[x], sustain: 0.5, release: 0.5, vel: v
      sleep 0.25
    elsif (x == 5) or (x == 14)
      play listOfNotes[x], sustain: 0.5, release: 0.5, vel: v
      sleep 0.5
    else
      play listOfNotes[x], sustain: 1, release: 1, vel: v
      sleep 0.5
    end
    x = x + 1
  end
end

define :chorusLH2 do
  listOfNotes = [:c3,:c3,:c3,:ds3,:f3,:f3,:f3,:f3,:c3,:as2,:as2,:as2,:d3,:ds3,:d3]
  x = 0
  l = listOfNotes.length
  l.times do
    v = randomVelocity v, 0.2, 0.21
    if (x == 4) or (x==7)
      play listOfNotes[x], sustain: 0.5, release: 0.5, vel: v
      sleep 0.25
    elsif (x == 5)
      play listOfNotes[x], sustain: 0.5, release: 0.5, vel: v
      sleep 0.5
    elsif (x == 13) or (x == 14)
      play listOfNotes[x], sustain: 2, release: 2, vel: v
      sleep 1
    else
      play listOfNotes[x], sustain: 1, release: 1, vel: v
      sleep 0.5
    end
    x = x + 1
  end
end

define :chorusLH3 do                                                 #12
  listOfNotes = [:c3,:c3,:c3,:ds3,:f3,:f3,:f3,:f3,:c3,:as2,:as2,:as2,:b2,:c3,:c3,:c3,:as2]
  x = 0
  l = listOfNotes.length
  l.times do
    v = randomVelocity v, 0.2, 0.21
    if (x == 4) or (x==7) or (x == 13) or (x == 15)
      play listOfNotes[x], sustain: 0.5, release: 0.5, vel: v
      sleep 0.25
    elsif (x == 5)
      play listOfNotes[x], sustain: 0.5, release: 0.5, vel: v
      sleep 0.5
    elsif (x == 16)
      play listOfNotes[x], sustain: 2, release: 2, vel: v
      sleep 1
    else
      play listOfNotes[x], sustain: 1, release: 1, vel: v
      sleep 0.5
    end
    x = x + 1
  end
end

define :chorusLH4 do                                        #10  #11
  listOfNotes = [:c3,:c3,:c3,:ds3,:f3,:f3,:f3,:f3,:c3,:as2,:as2,:g2,:as2,:as2,:c3]
  x = 0
  l = listOfNotes.length
  l.times do
    v = randomVelocity v, 0.2, 0.21
    if (x == 4) or (x==7)
      play listOfNotes[x], sustain: 0.5, release: 0.5, vel: v
      sleep 0.25
    elsif (x == 5)
      play listOfNotes[x], sustain: 0.5, release: 0.5, vel: v
      sleep 0.5
    elsif (x == 13)
      play listOfNotes[x], sustain: 2, release: 2, vel: v
      sleep 0.75
    elsif (x == 14)
      play listOfNotes[x], sustain: 4, release: 4, vel: v
      sleep 1.25
    else
      play listOfNotes[x], sustain: 1, release: 1, vel: v
      sleep 0.5
    end
    x = x + 1
  end
end

define :chorusLH5 do
  listOfNotes = [:c3,:c3,:c3,:ds3,:f3,:f3,:f3,:f3,:c3,:f2,:f2,:g2,:g2,:gs2,:gs2,:as2,:as2]
  x = 0
  l = listOfNotes.length
  l.times do
    v = randomVelocity v, 0.2, 0.21
    if (x == 4) or (x==7)
      play listOfNotes[x], sustain: 0.5, release: 0.5, vel: v
      sleep 0.25
    elsif (x == 5)
      play listOfNotes[x], sustain: 0.5, release: 0.5, vel: v
      sleep 0.5
    else
      play listOfNotes[x], sustain: 1, release: 1, vel: v
      sleep 0.5
    end
    x = x + 1
  end
end

define :chorusRH1 do
  v = randomVelocity v, 0.19, 0.2
  play :c5, sustain: 2, release: 2, vel: v
  sleep 1
  notes = [:ds5,:c5,:g4]
  parseChordVel notes, 2, 1, 3, v
  notes = [:f5,:c5,:gs4]
  parseChordVel notes, 4, 0.75, 3, v
  play :ds5, sustain: 2, release: 2, vel: v
  sleep  0.75
  3.times do
    play :f5, sustain: 2, release: 2, vel: v
    sleep  0.5
  end
  play :as5, sustain: 2, release: 2, vel: v
  sleep  0.5
  play :gs5, sustain: 2, release: 2, vel: v
  sleep  0.5
  play :g5, sustain: 1, release: 1, vel: v
  sleep  0.25
  play :f5, sustain: 2, release: 2, vel: v
  sleep  0.5
  play :g5, sustain: 4, release: 4
  sleep 1.25
end

define :chorusRH2 do
  v = randomVelocity v, 0.19, 0.2
  notes = [:g5,:ds5]
  parseChordVel notes, 2, 1, 2, v
  notes = [:as5,:g5,:ds5]
  parseChordVel notes, 2, 1, 3, v
  notes = [:c6,:gs5,:ds5]
  parseChordVel notes, 2, 0.75, 3, v
  play :f5, sustain: 4, release: 4
  sleep 0.75
  notes = [:ds5,:d5,:d5,:c5,:d5,:f5,:ds5,:ds5]
  x = 0
  l = notes.length
  l.times do
    v = randomVelocity v, 0.2, 0.205
    if (x == 5)
      play notes[x], sustain: 1, release: 1, vel: v
      sleep 0.25
    elsif (x == 7)
      play notes[x], sustain: 4, release: 4, vel: v
      sleep 1.25
    else
      play notes[x], sustain: 2, release: 2, vel: v
      sleep 0.5
    end
    x = x + 1
  end
end

define :chorusRH4 do
  v = randomVelocity v, 0.19, 0.2
  notes = [:g5,:ds5]
  parseChordVel notes, 2, 1, 2, v
  notes = [:as5,:g5,:ds5]
  parseChordVel notes, 2, 1, 3, v
  notes = [:c6,:gs5,:ds5]
  parseChordVel notes, 2, 0.75, 3, v
  play :f5, sustain: 2, release: 2
  sleep 0.75
  play :ds5, sustain: 1, release: 1
  sleep 0.5
  2.times do
    notes = [:as5,:f5,:d5]
    parseChordVel notes, 1, 0.5, 3, v
  end
  notes = [:g5,:f5,:d5]
  parseChordVel notes, 1, 0.5, 3, v
  notes = [:as5,:f5,:d5]
  parseChordVel notes, 1, 0.5, 3, v
  notes = [:as5,:f5,:d5]
  parseChordVel notes, 1, 0.75, 3, v
  notes = [:ds5,:g5,:c6]
  parseChordVel notes, 1, 1.25, 3, v
end


define :chorus do
  in_thread do
    chorusLH1
    chorusLH2
  end
  chorusRH1
  chorusRH2
  
  2.times do
    in_thread do
      chorusLH1
      chorusLH3
    end
    chorusRH1
    chorusRH4
  end
end

define :chorus2 do
  2.times do
    in_thread do
      chorusLH1
      chorusLH3
    end
    chorusRH1
    chorusRH4
  end
end

define :chorus3 do
  in_thread do
    chorusLH1
    chorusLH2
  end
  chorusRH1
  chorusRH2
  
  in_thread do
    chorusLH1
    chorusLH3
  end
  chorusRH1
  chorusRH4
  
  
  in_thread do
    chorusLH1
    chorusLH5
  end
  chorusRH1
  chorusRH4
end