#sa = "C:/Users/Pc/Desktop/untitled.wav"
#Sample from the anime I use to close out the song. Not necessary unless you are doing the album playthrough.

define :parseChord do |notes, n, s, t|
  x = 0
  t.times do
    play notes[x], sustain: n, release: n
    x = x + 1
  end
  sleep s
end

define :randomVelocity do |v, a, b|
  v = rrand(a,b)
end
#new Method I created today!
#allows me to play with the velocity of the chords.
define :parseChordVel do |notes, n, s, t,v|
  x = 0
  t.times do
    play notes[x], sustain: n, release: n, vel: v
    x = x + 1
  end
  sleep s
end

define :parseOffset do |notes, n, s, t, o|
  x = 0
  t.times do
    play notes[x], sustain: n, release: n
    x = x + 1
    sleep o
    s = s - o
  end
  sleep s
end

define :introLH do
  notes = [[:cs2,:cs3],[:gs1, :gs2],[:a1,:a2],[:b1,:b2],[:cs2,:cs3],[:e2,:e3],[:a1,:a2],[:gs1,:gs2]]
  l = notes.length
  l.times do |i|
    if(i == 0) or (i == 4) or (i == 8)
      parseChord notes[i], 8, 3, 2
    elsif  (i == 1) or (i == 5)
      parseChord notes[i], 2, 1, 2
    else
      parseChord notes[i], 4, 2, 2
    end
  end
end

define :introLH2 do
  notes = [[:cs2,:cs3],[:gs1, :gs2],[:a1,:a2],[:b1,:b2],[:cs2,:cs3],[:e2,:e3],[:a1,:a2],[:gs1,:gs2]]
  l = notes.length
  v = 0
  l.times do |i|
    v = randomVelocity v, 0.21, 0.22
    if(i == 0) or (i == 4) or (i == 8)
      parseChordVel notes[i], 8, 3, 2, v
    elsif  (i == 1) or (i == 5)
      parseChordVel notes[i], 2, 1, 2, v
    else
      parseChordVel notes[i], 4, 2, 2, v
    end
  end
end

define :introLH3 do
  notes = [[:cs2,:cs3],[:gs1, :gs2],[:a1,:a2],[:b1,:b2],[:cs2,:cs3],[:e2,:e3],[:a1,:a2],[:gs1,:gs2]]
  l = notes.length
  v = 0
  l.times do |i|
    v = randomVelocity v, 0.23, 0.24
    if(i == 0) or (i == 4) or (i == 8)
      parseChordVel notes[i], 8, 3, 2, v
    elsif  (i == 1) or (i == 5)
      parseChordVel notes[i], 2, 1, 2, v
    else
      parseChordVel notes[i], 4, 2, 2, v
    end
  end
end

define :helper do |notes, extraNotes, x, y|
  v = randomVelocity v, 0.18, 0.208
  if (x > 5) and (x < 9)
    play notes[x], sustain: 4, release: 4, vel: v
    sleep 0.5
  elsif (x == 9)
    play extraNotes[y], sustain: 4, release: 4, vel: v
    sleep 0.5
  else
    play notes[x], sustain: 2, release: 2, vel: v
    sleep 0.25
  end
end

define :helper2 do |notes, x|
  v = randomVelocity v, 0.21, 0.22
  if (x == 5)
    play notes[x], sustain: 4, release: 4, vel: v
    sleep 0.5
  else
    play notes[x], sustain: 2, release: 2, vel: v
    sleep 0.25
  end
end

define :introRH do
  notes = [:gs4,:cs5,:ds5,:e5,:fs5,:gs5,:fs5,:e5,:ds5]
  extraNotes = [:e5,:b4]
  y = 0
  2.times do
    sleep 0.5
    10.times do |i|
      helper notes, extraNotes, i, y
    end
    y = y + 1
  end
  y = 0
  sleep 0.5
  10.times do |i|
    helper notes, extraNotes, i, y
  end
  notes = [:a4,:a5,:a4,:gs5,:a4,:fs5]
  notes2 = [:gs4,:gs5,:gs4,:fs5,:gs4,:ds5]
  sleep 0.25
  6.times do |i|
    helper2 notes, i
  end
  sleep 0.25
  6.times do |i|
    helper2 notes2, i
  end
end

define :introRH2 do
  notes = [:gs5,:cs6,:ds6,:e6,:fs6,:gs6,:fs6,:e6,:ds6]
  extraNotes = [:e6,:b5]
  y = 0
  2.times do
    sleep 0.5
    10.times do |i|
      helper notes, extraNotes, i, y
    end
    y = y + 1
  end
  y = 0
  sleep 0.5
  10.times do |i|
    helper notes, extraNotes, i, y
  end
  notes = [:a5,:a6,:a5,:gs6,:a5,:fs6]
  notes2 = [:gs5,:gs6,:gs5,:fs6,:gs5,:ds6]
  sleep 0.25
  6.times do |i|
    helper2 notes, i
  end
  sleep 0.25
  6.times do |i|
    helper2 notes2, i
  end
end

with_synth :piano do
  with_fx :reverb, room: 0.99 do
    with_fx :lpf, cutoff: 90 do
      with_bpm 70 do
        introLH2
      end
      with_bpm 75 do
        in_thread do
          introRH
        end
        introLH2
      end
      
      with_bpm 85 do
        introRH
      end
      with_bpm 90 do
        in_thread do
          introRH
        end
        introLH
      end
      
      with_bpm 95 do
        in_thread do
          introRH2
        end
        introLH2
      end
      with_bpm 105 do
        in_thread do
          introRH
          introRH2
        end
        2.times do
          introLH2
        end
      end
      with_bpm 115 do
        in_thread do
          2.times do
            introRH
          end
        end
        in_thread do
          2.times do
            introLH2
          end
        end
        3.times do
          introLH
        end
        sleep 2
        #with_fx :distortion, distort: 0.1 do
        #sample sa, lpf: 115, amp: 2
        #end
      end
    end
  end
end