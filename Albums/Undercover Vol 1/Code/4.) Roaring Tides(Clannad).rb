define :randomVelocity do |v, a, b|
  v = rrand(a,b)
end

define :parseChord do |notes, n, s, t|
  x = 0
  v = 0
  t.times do
    v = randomVelocity v, 0.19, 0.21
    play notes[x], sustain: n, release: n, vel: v
    x = x + 1
  end
  sleep s
end
##########################################################################
##INTRO METHODS
define :introLeftHand do |flag|
  if (flag == true)
    listOfNotes = [[:a3,:c4,:f2],[:b3,:d3,:g2],[:c4,:e3,:a2],[:b3,:d3,:g2],[:a3,:c4,:f2],[:b3,:d3,:g2],[:c4,:e3,:a2]]
  else
    listOfNotes = [[:a3,:c4,:f2],[:b3,:d3,:g2],[:c4,:e3,:a2],[:b3,:d3,:g2]]
  end
  x = 0
  l = listOfNotes.length
  l.times do
    if (flag == true) and (x ==  6)
      parseChord listOfNotes[x], 16, 6, 3
    else
      parseChord listOfNotes[x], 16, 9, 3
    end
    x = x + 1
  end
end

define :introRightHand do
  introNotes = [:a4, :e5, :a4, :g4, :a4]
  x = 0
  #Sleep 5 total
  5.times do
    v = randomVelocity v, 0.185, 0.205
    if (x == 5)
      play introNotes[x], sustain: 8, release: 8, vel: v
    else
      play introNotes[x], sustain: 4, release: 4, vel: v
    end
    x = x + 1
    sleep 1
  end
  sleep 4
  
  introNotes = [:g4,:g4,:a4,:e5,:a4,:g4,:a4,:e5,:a4,:g4,:a4]
  x = 0
  11.times do
    v = randomVelocity v, 0.185, 0.205
    if (x == 0)
      play introNotes[x], sustain: 8, release: 8, vel: v
      sleep 4
    else
      play introNotes[x], sustain: 4, release: 4, vel: v
      sleep 1
    end
    x = x + 1
  end
  v = randomVelocity v, 0.185, 0.205
  sleep 3
  play :e4, release: 2, sustain: 2, vel: v
  sleep 1
  play :g4, release: 4, sustain: 4, vel: v
  sleep 4
  introNotes = [:d4, :e4, :g4, :a4, :b4]
  x = 0
  5.times do
    v = randomVelocity v, 0.185, 0.205
    if (x == 3)
      play introNotes[x], sustain: 0.5, release: 0.5, vel: v
    else
      play introNotes[x], vel: v
    end
    x = x + 1
    sleep 1
  end
  
  introNotes = [:a4, :e5, :a4, :g4, :a4]
  x = 0
  5.times do
    v = randomVelocity v, 0.185, 0.205
    if (x == 5)
      play introNotes[x], sustain: 8, release: 8, vel: v
    else
      play introNotes[x], sustain: 4, release: 4, vel: v
    end
    x = x + 1
    sleep 1
  end
  sleep 2
  play :f5
  v = randomVelocity v, 0.185, 0.205
  sleep 1
  play :e5, release: 2, sustain: 2, vel: v
  v = randomVelocity v, 0.185, 0.205
  sleep 1
  play :d5, release: 4, sustain: 4, vel: v
  v = randomVelocity v, 0.185, 0.205
  sleep 4
  play :g4, release: 2, sustain: 2, vel: v
  v = randomVelocity v, 0.185, 0.205
  sleep 1
  play :a4, release: 4, sustain: 4, vel: v
  sleep 1
  play :e5, release: 4, sustain: 4, vel: v
  v = randomVelocity v, 0.185, 0.205
  sleep 1
  play :b4, vel: v
  sleep 1
  play :c5, release: 0.5, sustain: 0.5, vel: v
  sleep 1
  play :b4, release: 4, sustain: 4, vel: v
  sleep 1
  play :c5, vel: v
  v = randomVelocity v, 0.185, 0.205
  sleep 1
  play :d5, release: 2, sustain: 2, vel: v
  sleep 1
  play :e5, release: 4, sustain: 4, vel: v
  sleep 1
  play :a4, sustain: 6, release: 6, vel: v
  sleep 1
end

define :intro do
  play :e4, sustain: 8, release: 8
  sleep 2
  play :g4, sustain: 8, release: 8
  sleep 2
  introLeftHand false
  in_thread do
    introRightHand
  end
  introLeftHand true
  sleep 3
end
#################################################
#Main Methods
define :mainLeftHand do |t, noteChange, short|
  t.times do
    notes = [:f2,:c3,:f3,:a3,:c4,:a3,:f3,:a3]
    2.times do
      x = 0
      #Sleep 5 total
      8.times do
        v = randomVelocity v, 0.185, 0.205
        play notes[x], vel: v
        x = x + 1
        sleep 0.5
      end
    end
    notes = [:g2,:d3,:g3,:b3,:d4,:b3,:g3,:b3]
    2.times do
      x = 0
      8.times do
        v = randomVelocity v, 0.185, 0.205
        play notes[x], vel: v
        x = x + 1
        sleep 0.5
      end
    end
    notes = [:a2,:e3,:a3,:c4,:e4,:c4,:a3,:c4]
    2.times do
      x = 0
      8.times do
        v = randomVelocity v, 0.185, 0.205
        play notes[x], vel: v
        x = x + 1
        sleep 0.5
      end
    end
    if(noteChange == true)
      notes = [:g2,:d3,:g3,:d3,:b3,:d3,:g3,:d3]
    else
      notes = [:g2,:d3,:g3,:b3,:d4,:b3,:g3,:b3]
    end
    2.times do
      x = 0
      z = 8
      z.times do
        v = randomVelocity v, 0.185, 0.205
        play notes[x], vel: v
        x = x + 1
        sleep 0.5
      end
      if(noteChange == true)
        notes = [:g2,:d3,:g3,:b3,:d4,:b3,:g3,:b3]
      end
      if(short == true)
        notes = [:g2,:d3,:g3,:b3,:d4]
        z = 5
      end
    end
  end
end

define :mainRightHand do
  notes = [:a4, :e5, :a4,:g4]
  x = 0
  4.times do
    play notes[x], sustain: 4, release: 4
    x = x + 1
    sleep 1
  end
  play :a4, sustain: 8, release: 8
  sleep 4
  play :g4, sustain: 2, release: 2
  sleep 3
  notes = [:g4,:a4,:e5,:a4,:g4,:a4]
  2.times do
    x = 0
    4.times do
      play notes[x], sustain: 4, release: 4
      x = x + 1
      sleep 1
    end
  end
  a = 1
  2.times do
    play notes[x], sustain: 4, release: 4
    x = x + 1
    sleep a
    a = 3
  end
  play :e5, sustain: 4, release: 4
  sleep 1
  play :g4, sustain: 2, release: 2
  sleep 3
  notes = [:d4, :e4, :g4, :a4, :b4, :a4, :a4, :g4, :a4]
  x = 0
  9.times do
    v = randomVelocity v, 0.185, 0.205
    if (x == 2)
      play notes[x], sustain: 0.5, release: 0.5, vel: v
      sleep 1
    elsif (x == 5)
      play notes[x], sustain: 4, release: 4, vel: v
      sleep 3
    else
      play notes[x], sustain: 4, release: 4, vel: v
      sleep 1
    end
    x = x + 1
  end
  play :f5
  sleep 2
  notes = [:f5,:e5,:d5]
  x = 0
  3.times do
    play notes[x], release: 0.5, sustain: 0.5
    x = x + 1
    sleep 0.25
  end
  sleep 2.25
  notes = [:g4, :a4, :e5, :b4, :c5, :b4, :c5, :d5, :e5, :a4]
  x = 0
  10.times do
    play notes[x], sustain: 2, release: 2
    x = x + 1
    sleep 1
  end
  sleep 3
  play :e4, release: 4, sustain: 4
  sleep 1
  play :g4, release: 2, sustain: 2
  sleep 4
  play :g4, release: 4, sustain: 4
  sleep 1
  play :a4, release: 2, sustain: 2
  sleep 2
end
#######################################
#Riff Methods
define :riffHelper do |y,notes|
  x = 0
  4.times do
    v = randomVelocity v, 0.195, 0.215
    play notes[x], release: 4, sustain: 4
    x = x + 1
    sleep 1
  end
end

define :riffRightHand do
  y = 0
  extraNotes = [:a5,:b5,:c6]
  note = extraNotes[y]
  notes = [:d5,:e5,note,:e5]
  2.times do
    2.times do
      2.times do
        riffHelper y,notes
      end
      y = y + 1
      note = extraNotes[y]
      notes = [:d5,:e5,note,:e5]
    end
    y = 2
    2.times do
      2.times do
        riffHelper y,notes
      end
      y = y - 1
      note = extraNotes[y]
      notes = [:d5,:e5,note,:e5]
    end
  end
end

define :riffRightHand2 do
  listOfNotes = [[:a5, :c5, :a4, :f3],[:e6,:e5],[:a5,:a4],[:g5,:g4],[:a5,:a4]]
  x = 0
  5.times do
    if (x == 4)
      parseChord  listOfNotes[x], 0.5, 4, listOfNotes[x].length
    else
      parseChord listOfNotes[x], 0.5, 1, listOfNotes[x].length
    end
    x = x + 1
  end
  notes = [:g5, :b4, :g4]
  parseChord notes, 0.5, 3, 3
  2.times do
    x = 0
    listOfNotes = [[:g5,:g4],[:a5,:a4],[:e6,:e5],[:a5,:a4]]
    4.times do
      parseChord listOfNotes[x], 0.5, 1, 2
      x = x + 1
    end
  end
  listOfNotes = [[:g5,:g4],[:a5,:a4],[:e6,:e5],[:g5,:g4],[:d5,:d4],[:e5,:e4],[:g5,:g4],[:a5,:a4],[:b5,:b4]]
  x = 0
  l = listOfNotes.length
  l.times do
    if (x == 1)
      parseChord listOfNotes[x], 0.5, 4, 2
    elsif (x == 3)
      parseChord listOfNotes[x], 0.5, 2, 2
    else
      parseChord listOfNotes[x], 0.5, 1, 2
    end
    x = x + 1
  end
  listOfNotes = [[:a5,:a4],[:e6,:e5],[:a5,:a4],[:g5,:g4],[:a5,:a4],[:f6,:f5],[:e6,:e5],[:d6,:d5],[:g4,:g5]]
  x = 0
  l = listOfNotes.length
  l.times do
    if (x == 7)
      parseChord listOfNotes[x], 0.5, 3, 2
    elsif (x == 4)
      parseChord listOfNotes[x], 0.5, 2, 2
    else
      parseChord listOfNotes[x], 0.5, 1, 2
    end
    x = x + 1
  end
  listOfNotes = [[:a5,:a4],[:e6,:e5],[:b5,:b4],[:c6,:c5],[:b5,:b4],[:c6,:c5],[:d6,:d5],[:e6,:e5],[:a5,:a4],[:e5,:e4],[:g5,:g4]]
  x = 0
  l = listOfNotes.length
  l.times do
    if (x == 8)
      parseChord listOfNotes[x], 0.5, 3, 2
    elsif (x == 10)
      parseChord listOfNotes[x], 0.5, 2, 2
    else
      parseChord listOfNotes[x], 0.5, 1, 2
    end
    x = x + 1
  end
  notes = [:g5,:g4]
  in_thread do
    with_synth :growl do
      play :g5, attack: 0, release: 5, amp: 0.3
    end
  end
  parseChord notes, 0.5, 4, 2
end

define :endFlorish do
  notes = [:g5,:g4,:g2]
  in_thread do
    with_synth :growl do
      play :g5, attack: 0, release: 10, amp: 0.3
    end
  end
  parseChord notes, 0.5, 1, 3
  notes = [:d3, :g3, :b3, :d4, :g4, :b4, :d5, :g5, :b5, :d6, :g6, :b6, :d7, :g7]
  x = 0
  14.times do
    v = randomVelocity v, 0.195, 0.215
    if (x == 2) or (x == 7)
      play notes[x], sustain: 3, release: 3, vel: v
      x = x + 1
      sleep 0.5
    elsif (x == 6)
      play notes[x], sustain: 4, release: 4, vel: v
      x = x + 1
      sleep 0.5
    else
      play notes[x], sustain: 2, release: 2, vel: v
      x = x + 1
      sleep 1
    end
  end
end
################################################
# SONG
with_synth :piano do
  with_fx :lpf, cutoff: 80 do
    with_bpm 130 do
      with_fx :reverb, room: 1 do
        intro
      end
    end
  end
  with_fx :reverb, room: 0.97 do
    with_fx :lpf, cutoff: 85 do
      with_bpm 140 do
        mainLeftHand 1, false, false
        in_thread do
          mainLeftHand 2, true, false
        end
        mainRightHand
      end
    end
  end
  with_fx :reverb, room: 0.95 do
    with_fx :lpf, cutoff: 90 do
      with_bpm 146 do
        in_thread do
          mainLeftHand 2, false, true
        end
        riffRightHand
      end
      with_bpm 152 do
        in_thread do
          mainLeftHand 2, true, false
        end
        riffRightHand
      end
      with_bpm 155 do
        in_thread do
          mainLeftHand 2, false, false
        end
        riffRightHand2
      end
      with_bpm 150 do
        endFlorish
      end
    end
  end
end