#Verse 1 Methods
################################################################
define :verse1LH1 do |flag|
  v = randomVelocity v, 0.17, 0.18
  listOfNotes = [:as3,:g3,:ds3]
  parseChordVel listOfNotes, 8, 4, 3, v
  v = randomVelocity v, 0.17, 0.18
  listOfNotes = [:as3,:f3,:d3,:as2]
  parseChordVel listOfNotes, 8, 4, 4, v
  v = randomVelocity v, 0.17, 0.18
  listOfNotes = [:g3,:ds3,:c3]
  parseChordVel listOfNotes, 4, 2, 3, v
  v = randomVelocity v, 0.17, 0.18
  listOfNotes = [:g3,:f3,:d3,:as2]
  parseChordVel listOfNotes, 4, 2, 4, v
  v = randomVelocity v, 0.17, 0.18
  listOfNotes = [:g3,:ds3,:c3,:gs2]
  parseChordVel listOfNotes, 8, 4, 4, v
  v = randomVelocity v, 0.17, 0.18
  listOfNotes = [:f3,:ds3,:as2]
  parseChordVel listOfNotes, 4, 2, 3, v
  v = randomVelocity v, 0.17, 0.18
  listOfNotes = [:f3,:d3,:as2]
  parseChordVel listOfNotes, 4, 2, 3, v
  v = randomVelocity v, 0.17, 0.18
  listOfNotes = [:as3,:ds3]
  parseChordVel listOfNotes, 4, 2, 2, v
  listOfNotes = [:as3,:c3]
  parseChordVel listOfNotes, 4, 2, 2, v
  listOfNotes = [:c5,:d3]
  parseChordVel listOfNotes, 8, 4, 2, v
  if(flag == true)
    listOfNotes = [:c6,:a4,:f4,:g2]
    parseChordVel listOfNotes, 4, 1.5, 4, v
    play :d5, sustain: 2, release: 2, vel: 0.22
    sleep 0.5
    listOfNotes = [:d5,:b4,:g4,:g2]
    parseChordVel listOfNotes, 4, 2, 4, v
  else
    4.times do
      play :g2, sustain: 2, release: 2, vel: v
      sleep 1
    end
  end
end

define :verseHelper1 do
  listOfNotes = [:ds5,:as4,:as4,:ds5,:ds5,:f5,:as4,:as4,:as4,:g5,:gs5,:g5,:f5,:ds5,:f5,:g5,:gs5,:g5]
  x = 0
  l = listOfNotes.length
  sleep 1
  l.times do
    v = randomVelocity v, 0.18, 0.19
    if (x == 0) or (x == 6) or (x == 8) or (x == 11) or (x == 14) or (x == 17)
      play listOfNotes[x], sustain: 1, release: 1, vel: v
      sleep 0.5
    elsif (x == 1)
      play listOfNotes[x], sustain: 0.5, release: 0.5, vel: v
      sleep 0.25
    elsif (x == 2)
      play listOfNotes[x], sustain: 8, release: 8, vel: v
      sleep 1.5
    elsif (x == 7)
      play listOfNotes[x], sustain: 8, release: 8, vel: v
      sleep 1.5
    else
      play listOfNotes[x], sustain: 2, release: 2, vel: 0.2
      sleep 0.75
    end
    x = x + 1
  end
end

define :verse1RH1 do
  verseHelper1
  listOfNotes = [:c5,:c5,:d5,:ds5,:ds5,:d5,:d5,:ds5,:f5,:gs5,:g5,:f5,:ds5,:g5,:g5,:f5,:e5,:c5]
  x = 0
  l = listOfNotes.length
  #sleep before everything starts to offset
  l.times do
    v = randomVelocity v, 0.18, 0.19
    if (x == 0) or (x == 6) or (x == 12)
      play listOfNotes[x], sustain: 4, release: 4, vel: v
      sleep 1.5
    elsif (x == 1) or (x == 2) or (x == 7) or (x == 8)
      play listOfNotes[x], sustain: 0.5, release: 0.5, vel: v
      sleep 0.25
    elsif  (x == 5) or (x == 11) or (x == 13) or (x == 16)
      play listOfNotes[x], sustain: 2, release: 2, vel: v
      sleep 0.5
    elsif (x == 17) or (x == 18)
      play listOfNotes[x], sustain: 8, release: 8, vel: v
      sleep 1
    else
      play listOfNotes[x], sustain: 2, release: 2, vel: 0.2
      sleep 0.75
    end
    x = x + 1
  end
end

define :verse1RH2 do
  verseHelper1
  listOfNotes = [:c5,:c5,:d5,:ds5,:ds5,:d5,:d5,:ds5,:f5,:gs5,:g5,:f5,:ds5,:g5,:g5,:f5,:e5,:f5,:g5,:gs5,:g5]
  x = 0
  l = listOfNotes.length
  #sleep before everything starts to offset
  l.times do
    v = randomVelocity v, 0.18, 0.19
    if (x == 0) or (x == 6) or (x == 12)
      play listOfNotes[x], sustain: 4, release: 4, vel: v
      sleep 1.5
    elsif (x == 1) or (x == 2) or (x == 7) or (x == 8)
      play listOfNotes[x], sustain: 0.5, release: 0.5, vel: v
      sleep 0.25
    elsif  (x == 5) or (x == 11) or (x == 13) or (x == 16) or (x == 19)
      play listOfNotes[x], sustain: 2, release: 2, vel: v
      sleep 0.5
    elsif (x == 20)
      play listOfNotes[x], sustain: 16, release: 16, vel: v
      chordNotes = [:c5,:a4]
      parseChordVel chordNotes, 2, 1, 2, v
      chordNotes = [:b4,:g4]
      parseChordVel chordNotes, 2, 1, 2, v
      chordNotes = [:c5,:a4]
      parseChordVel chordNotes, 2, 1, 2, v
      chordNotes = [:d5,:b4]
      parseChordVel chordNotes, 2, 1, 2, v
    else
      play listOfNotes[x], sustain: 2, release: 2, vel: 0.2
      sleep 0.75
    end
    x = x + 1
  end
end

define :verse1 do
  in_thread do
    verse1RH1
  end
  verse1LH1 true
  in_thread do
    verse1RH2
  end
  verse1LH1 false
end

#Bridge 1 Methods
################################################################
define :bridgeLH1 do
  define :callback do |note|
    play note, sustain: 2, release: 2, vel: 0.2
    sleep 0.5
  end
  listOfNotes = [:gs2,:g2,:c3,:f2,:as2,:f3,:e3,:ds3,:as2,:a2]
  8.times do
    callback listOfNotes[0]
  end
  4.times do
    callback listOfNotes[1]
  end
  4.times do
    callback listOfNotes[2]
  end
  4.times do
    callback listOfNotes[3]
  end
  6.times do
    callback listOfNotes[4]
  end
  callback listOfNotes[5]
  callback listOfNotes[6]
  2.times do
    callback listOfNotes[7]
  end
  callback listOfNotes[8]
  callback listOfNotes[9]
end

define :bridgeRH1Chords do
  v = randomVelocity v, 0.19, 0.205
  listOfNotes = [:g4,:c5]
  parseChordVel listOfNotes, 8, 4, 2, v
  listOfNotes = [:d5,:as4]
  parseChordVel listOfNotes, 4, 2, 2, v
  listOfNotes = [:as4,:g4]
  parseChordVel listOfNotes, 4, 2, 2, v
  listOfNotes = [:as4,:g4]
  2.times do
    parseChordVel listOfNotes, 4, 2, 2, v
  end
  listOfNotes = [:as4,:cs5,:f5]
  parseChordVel listOfNotes, 2, 1, 3, v
  listOfNotes = [:g5,:ds5]
  parseChordVel listOfNotes, 2, 1, 2, v
  listOfNotes = [:gs5,:f5]
  parseChordVel listOfNotes, 2, 1, 2, v
  listOfNotes = [:as5,:g5]
  parseChordVel listOfNotes, 2, 1, 2, v
end

define :bridgeRH1Extra do
  listOfNotes = [:ds5,:ds5,:d5,:ds5,:ds5,:d5,:f5,:f5,:ds5,:d5,:c5,:d5,:ds5,:ds5,:d5,:f5,:d5,:c5]
  x = 0
  l = listOfNotes.length
  #sleep before everything starts to offset
  l.times do
    v = randomVelocity v, 0.18, 0.19
    if (x == 2) or (x == 5) or (x == 8) or (x == 11) or (x == 14)
      play listOfNotes[x], sustain: 1, release: 1, vel: v
      sleep 0.5
    elsif (x == 9)
      play listOfNotes[x], sustain: 0.3, release: 0.3, vel: v
      sleep 0.5
    elsif (x == 17)
      play listOfNotes[x], sustain: 0.5, release: 0.5, vel: v
      sleep 0.25
    else
      play listOfNotes[x], sustain: 2, release: 2, vel: 0.2
      sleep 0.75
    end
    x = x + 1
  end
end

define :bridgeLH2 do
  define :callback do |note|
    play note, sustain: 2, release: 2, vel: 0.2
    sleep 0.5
  end
  listOfNotes = [:gs2,:g2,:c3,:d3,:g2]
  8.times do
    callback listOfNotes[0]
  end
  4.times do
    callback listOfNotes[1]
  end
  4.times do
    callback listOfNotes[2]
  end
  8.times do
    callback listOfNotes[3]
  end
  play listOfNotes[4], sustain: 4, release: 4, vel: 0.2
  sleep 2
  2.times do
    play listOfNotes[4], sustain: 2, release: 2, vel: 0.2
    sleep 0.75
  end
  callback listOfNotes[4]
end

define :bridgeRH2Chords do
  v = randomVelocity v, 0.205, 0.22
  2.times do
    2.times do
      listOfNotes = [:ds5,:c5]
      parseChordVel listOfNotes, 2, 0.75, 2, v
    end
    listOfNotes = [:d5,:as4]
    parseChordVel listOfNotes, 2, 0.5, 2, v
  end
  listOfNotes = [:f5,:d5]
  parseChordVel listOfNotes, 2, 0.75, 2, v
  listOfNotes = [:f5,:d5]
  parseChordVel listOfNotes, 2, 0.75, 2, v
  listOfNotes = [:ds5,:c5]
  parseChordVel listOfNotes, 2, 0.5, 2, v
  listOfNotes = [:d5,:as4]
  parseChordVel listOfNotes, 2, 0.75, 2, v
  listOfNotes = [:ds5,:c5]
  parseChordVel listOfNotes, 2, 0.75, 2, v
  listOfNotes = [:f5,:d5]
  parseChordVel listOfNotes, 2, 0.5, 2, v
  listOfNotes = [:g5,:d5,:c5]
  parseChordVel listOfNotes, 2, 0.75, 3, v
  listOfNotes = [:gs5,:d5,:c5]
  parseChordVel listOfNotes, 2, 0.75, 3, v
  listOfNotes = [:g5,:d5,:c5]
  parseChordVel listOfNotes, 2, 0.5, 3, v
  listOfNotes = [:f5,:d5,:c5]
  parseChordVel listOfNotes, 2, 0.75, 3, v
  listOfNotes = [:ds5,:c5]
  parseChordVel listOfNotes, 2, 0.75, 2, v
  listOfNotes = [:f5,:d5,:c5]
  parseChordVel listOfNotes, 2, 0.5, 3, v
  listOfNotes = [:g5,:f5,:c5,:a4]
  parseChordVel listOfNotes, 4, 2, 4, v
  listOfNotes = [:g5,:d5,:b4]
  parseChordVel listOfNotes, 2, 0.75, 3, v
  listOfNotes = [:a5,:f5,:c5]
  parseChordVel listOfNotes, 2, 0.75, 3, v
  listOfNotes = [:b5,:g5,:d5]
  parseChordVel listOfNotes, 2, 0.5, 3, v
end

define :bridge1 do
  in_thread do
    in_thread do
      bridgeRH1Extra
    end
    bridgeRH1Chords
  end
  bridgeLH1
  in_thread do
    bridgeRH2Chords
  end
  bridgeLH2
end