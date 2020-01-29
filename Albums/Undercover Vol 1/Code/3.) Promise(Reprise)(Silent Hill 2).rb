#Promise (Reprise) V1
#From Silent Hill 2
#I might sit down and replay this game again this week.
#Gets under my skin everytime

#I will add some florishes to this later
define :randomVelocity do |v, a, b|
  v = rrand(a,b)
end
define :parseChord do |notes, n, s, t|
  x = 0
  t.times do
    play notes[x], sustain: n, release: n
    x = x + 1
  end
  sleep s
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
  v = 0
  x = 0
  t.times do
    v = randomVelocity v, 0.185, 0.205
    play notes[x], sustain: n, release: n, vel: v
    x = x + 1
    sleep o
    s = s - o
  end
  sleep s
end



define :introLH1 do
  define :helper do |listOfNotes|
    x = 0
    v = 0
    4.times do
      v = randomVelocity v, 0.185, 0.205
      if (x == 0)
        play listOfNotes[x], sustain: 4, release: 4, vel: v
      else
        play listOfNotes[x], sustain: 2, release: 2, vel: v
      end
      x = x + 1
      sleep 0.75
    end
  end
  listOfNotes = [:d3,:g3,:d4,:g3]
  helper listOfNotes
  listOfNotes = [:ds3,:g3,:d4,:g3]
  helper listOfNotes
  listOfNotes = [:e3,:g3,:c4,:g3]
  helper listOfNotes
  listOfNotes = [:ds3,:g3,:c4,:g3]
  helper listOfNotes
end

define :introRH1 do
  v = randomVelocity v, 0.195, 0.22
  sleep 4.5
  play :g5, sustain: 2, release: 2, vel: v
  v = randomVelocity v, 0.195, 0.22
  sleep 1.5
  play :g4, sustain: 6, release: 6, vel: v, amp: 1.1
  sleep 4.5
  play :d5, sustain: 4, release: 4
  v = randomVelocity v, 0.195, 0.22
  sleep 3
  play :g5, sustain: 2, release: 2, vel: v
  sleep 1.5
  v = randomVelocity v, 0.195, 0.22
  play :g4, sustain: 6, release: 6, vel: v, amp: 1.1
  sleep 5.25
  v = randomVelocity v, 0.195, 0.22
  play :g4, vel: v
  sleep 0.75
  v = randomVelocity v, 0.195, 0.22
  play :a4, sustain: 0.25, release: 0.5, vel: v
  sleep 0.75
  v = randomVelocity v, 0.195, 0.22
  play :g5, sustain: 2, release: 2, vel: v
  sleep 1.5
  v = randomVelocity v, 0.195, 0.22
  play :a5, sustain: 0.5, release: 0.5, vel: v
  sleep 1.5
end

define :mainRH1 do |flag|
  if (flag == true)
    listOfNotes = [:g5,:a5,:as5,:c6,:d6,:c6,:as5,:a5,:g5]
  else
    listOfNotes = [:g4,:a4,:as4,:c5,:d5,:c5,:as4,:a4,:g4]
  end
  x = 0
  9.times do
    v = randomVelocity v, 0.185, 0.205
    if(x == 4)
      play :g4, vel: v
    end
    if(x == 8)
      play listOfNotes[x], sustain: 4, release: 4, vel: v
      x = x + 1
      sleep 2.25
    else
      play listOfNotes[x], vel: v
      x = x + 1
      sleep 0.375
    end
  end
  if (flag == true)
    listOfNotes = [:a5,:as5,:c6,:as5,:a5,:g5,:as5,:a5,:g5,:f5,:a5,:g5]
  else
    listOfNotes = [:a4,:as4,:c5,:as4,:a4,:g4,:as4,:a4,:g4,:f4,:a4,:g4]
  end
  x = 0
  l = listOfNotes.length
  l.times do
    v = randomVelocity v, 0.185, 0.205
    if (x == 2)
      play :g4, sustain: 2, release: 2, vel: v
    end
    if (x == 2) or (x == 3) or (x == 4) or (x == 10)
      play listOfNotes[x], sustain: 3, release: 3, vel: v
      x = x + 1
      sleep 0.75
    elsif (x == 5)
      play listOfNotes[x], sustain: 2, release: 2, vel: v
      x = x + 1
      sleep 0.75
    else
      play listOfNotes[x], vel: v
      x = x + 1
      sleep 0.375
    end
  end
end

define :mainRH2 do
  3.times do
    v = randomVelocity v, 0.195, 0.22
    play :d6, release: 2, sustain: 2, vel: v
    sleep 0.75
  end
  v = randomVelocity v, 0.195, 0.22
  play :d6, release: 4, sustain: 4, vel: v
  sleep 0.75
  
  3.times do
    v = randomVelocity v, 0.195, 0.22
    play :as5, release: 2, sustain: 2, vel: v
    sleep 0.75
  end
  v = randomVelocity v, 0.195, 0.22
  play :as5, release: 4, sustain: 4, vel: v
  sleep 0.75
  
  3.times do
    v = randomVelocity v, 0.195, 0.22
    play :c6, release: 2, sustain: 2, vel: v
    sleep 0.75
  end
  v = randomVelocity v, 0.195, 0.22
  play :c6, release: 4, sustain: 4, vel: v
  sleep 0.75
  
  2.times do
    v
    play :as5, release: 2, sustain: 2, vel: v
    sleep 0.75
  end
  v = randomVelocity v, 0.195, 0.22
  play :c6, release: 2, sustain: 2, vel: v
  sleep 0.75
  play :c6, release: 4, sustain: 4, vel: v
  sleep 0.75
  
end

define :outroRH do
  3.times do
    v = randomVelocity v, 0.195, 0.22
    play :d6, release: 2, sustain: 2, vel: v
    sleep 0.75
  end
  v = randomVelocity v, 0.195, 0.22
  play :d6, release: 4, sustain: 4, vel: v
  sleep 0.75
  
  3.times do
    v = randomVelocity v, 0.195, 0.22
    play :as5, release: 2, sustain: 2, vel: v
    sleep 1
  end
  play :as5, release: 4, sustain: 4, vel: v
  sleep 1
  
  3.times do
    v = randomVelocity v, 0.195, 0.22
    play :c6, release: 2, sustain: 2, vel: v
    sleep 1.25
  end
  play :c6, release: 4, sustain: 4, vel: v
  sleep 1.25
  
  2.times do
    v = randomVelocity v, 0.195, 0.22
    play :as5, release: 2, sustain: 2, vel: v
    sleep 1.5
  end
  v = randomVelocity v, 0.195, 0.22
  play :c6, release: 2, sustain: 2, vel: v
  sleep 1.5
  play :c6, release: 4, sustain: 4, vel: v
  sleep 1.5
end

define :outroLH do
  define :helper do |listOfNotes, s|
    x = 0
    4.times do
      v = randomVelocity v, 0.185, 0.205
      if (x == 0)
        play listOfNotes[x], sustain: 4, release: 4, vel: v
      else
        play listOfNotes[x], sustain: 2, release: 2, vel: v
      end
      x = x + 1
      sleep s
    end
  end
  listOfNotes = [:d3,:g3,:d4,:g3]
  helper listOfNotes, 0.75
  listOfNotes = [:ds3,:g3,:d4,:g3]
  helper listOfNotes, 1
  listOfNotes = [:e3,:g3,:c4,:g3]
  helper listOfNotes, 1.25
  listOfNotes = [:ds3,:g3,:c4,:g3]
  helper listOfNotes, 1.5
end

define :song do
  with_bpm 116 do
    2.times do
      introLH1
    end
    in_thread do
      introRH1
    end
    2.times do
      introLH1
    end
  end
  with_bpm 120 do
    2.times do
      in_thread do
        mainRH1 false
      end
      2.times do
        introLH1
      end
    end
  end
  with_bpm 125 do
    2.times do
      in_thread do
        mainRH1 false
      end
      introLH1
    end
  end
  with_bpm 130 do
    4.times do
      in_thread do
        mainRH1 true
      end
      introLH1
    end
  end
  with_bpm 135 do
    3.times do
      in_thread do
        mainRH2
      end
      introLH1
    end
  end
  with_bpm 120 do
    in_thread do
      outroLH
    end
    outroRH
    listOfNotes = [:g2,:g3,:g4,:g5]
    parseOffset listOfNotes, 32, 16, 4, 1.5
  end
end

with_synth :piano do
  with_fx :lpf, cutoff: 90 do
    with_fx :reverb, room: 0.99 do
      song
    end
  end
end