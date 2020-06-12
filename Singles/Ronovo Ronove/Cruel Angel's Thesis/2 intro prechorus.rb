#Intro Methods
####################################################
define :introLH1 do
  v = randomVelocity v, 0.17, 0.18
  listOfNotes = [:c4,:ds4,:g4]
  parseChordVel listOfNotes, 2, 2, 3, v
  v = randomVelocity v, 0.17, 0.18
  listOfNotes = [:c4,:f4,:gs4]
  v = randomVelocity v, 0.17, 0.18
  parseChordVel listOfNotes, 2, 2, 3, v
  listOfNotes = [:as3,:d4,:f4]
  v = randomVelocity v, 0.17, 0.18
  parseChordVel listOfNotes, 2, 2, 3, v
  listOfNotes = [:ds4,:as4]
  v = randomVelocity v, 0.17, 0.18
  parseChordVel listOfNotes, 2, 2, 3, v
  
  v = randomVelocity v, 0.17, 0.18
  listOfNotes = [:c4,:ds4,:g4]
  parseChordVel listOfNotes, 2, 2, 3, v
  v = randomVelocity v, 0.17, 0.18
  listOfNotes = [:ds4,:f4,:gs4,:c5]
  v = randomVelocity v, 0.17, 0.18
  parseChordVel listOfNotes, 2, 2, 4, v
  listOfNotes = [:d4,:f4,:g4,:as4,:d5]
  v = randomVelocity v, 0.17, 0.18
  parseChordVel listOfNotes, 2, 2, 5, v
  v = randomVelocity v, 0.17, 0.18
  listOfNotes = [:g4,:gs4,:c5,:ds5]
  parseChordVel listOfNotes, 4, 4, 4, v
end

define :introRH1 do
  listOfNotes = [:c5,:ds5,:f5,:ds5,:f5,:f5,:f5,:as5,:gs5,:g5,:f5,:g5]
  x = 0
  12.times do
    v = randomVelocity v, 0.2, 0.21
    if (x < 2)
      play listOfNotes[x], sustain: 2, release: 2, vel: v
      sleep 1
    elsif (x > 1) and (x < 4)
      play listOfNotes[x], sustain: 1, release: 1, vel: v
      sleep 0.75
    elsif (x > 3) and (x < 11) and (x != 9)
      play listOfNotes[x], sustain: 0.5, release: 0.5, vel: v
      sleep 0.5
    elsif (x == 9)
      play listOfNotes[x], sustain: 0.25, release: 0.25, vel: v
      sleep 0.25
    else
      play listOfNotes[x], sustain: 3, release: 3, vel: v
      sleep 1.25
    end
    x = x + 1
  end
  listOfNotes = [:g5,:as5,:c6,:f5,:ds5,:as5,:as5,:g5,:as5,:as5,:c6]
  x = 0
  11.times do
    v = randomVelocity v, 0.2, 0.21
    if (x < 2) or (x == 9)
      play listOfNotes[x], sustain: 2, release: 2, vel: v
      sleep 1
    elsif (x > 1) and (x < 4)
      play listOfNotes[x], sustain: 1, release: 1, vel: v
      sleep 0.75
    elsif (x > 3) and (x < 10)
      play listOfNotes[x], sustain: 0.5, release: 0.5, vel: v
      sleep 0.5
    else
      play listOfNotes[x], sustain: 16, release: 16, vel: v
      sleep 4
    end
    x = x + 1
  end
end

define :intro do
  in_thread do
    introLH1
  end
  introRH1
end

#PRECHORUS Methods
#######################
define :prechorusLH1 do
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

define :prechorusLH2 do
  listOfNotes = [:c3,:c3,:c3,:ds3,:f3,:f3,:f3,:f3,:c3,:as2,:as2,:as2,:b2,:c3,:c3,:c3]
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
    else
      play listOfNotes[x], sustain: 1, release: 1, vel: v
      sleep 0.5
    end
    x = x + 1
  end
end

define :prechorusRH1 do
  listOfNotes = [:c5,:ds5,:f5,:ds5,:f5,:f5,:f5,:as5,:gs5,:g5,:f5,:g5]
  x = 0
  l = listOfNotes.length
  l.times do
    v = randomVelocity v, 0.18, 0.19
    if (x < 2) #1
      play listOfNotes[x], sustain: 4, release: 4, vel: 0.21
      sleep 1
    elsif (x == 2)
      play listOfNotes[x], sustain: 2, release: 2, vel: v
      play :c4, sustain: 2, release: 2, vel: v
      play :gs4, sustain: 2, release: 2, vel: v
      sleep 0.75
    elsif (x == 3)
      play listOfNotes[x], sustain: 2, release: 2, vel: v
      sleep 0.75
    elsif (x > 3) and (x < 11) and (x != 5) and (x != 9)
      play listOfNotes[x], sustain: 0.5, release: 0.5, vel: v
      sleep 0.5
    elsif (x == 5)
      play listOfNotes[x], sustain: 0.5, release: 0.5, vel: v
      play :d4, sustain: 0.5, release: 0.5, vel: v
      play :as3, sustain: 0.5, release: 0.5, vel: v
      sleep 0.5
    elsif (x == 9)
      play listOfNotes[x], sustain: 0.5, release: 0.5, vel: v
      sleep 0.25
    elsif (x == 11)
      play listOfNotes[x], sustain: 3, release: 3, vel: v
      sleep 1.25
    else
      play listOfNotes[x], sustain: 1, release: 1, vel: v
      sleep 0.5
    end
    x = x + 1
  end
end

define :prechorusRH2 do
  listOfNotes = [:g5,:as5,:f5,:f5,:ds5,:d5,:d5,:d5,:d5,:g5,:g5]
  x = 0
  l = listOfNotes.length
  l.times do
    v = randomVelocity v, 0.18, 0.19
    if (x == 0)
      play listOfNotes[x], sustain: 2, release: 2, vel: v
      play :d5, sustain: 2, release: 2, vel: v
      sleep 1
    elsif (x == 2)
      play listOfNotes[x], sustain: 2, release: 2, vel: v
      play :gs5, sustain: 2, release: 2, vel: v
      play :c6, sustain: 2, release: 2, vel: v
      sleep 0.75
    elsif (x == 3)
      play listOfNotes[x], sustain: 2, release: 2, vel: v
      sleep 0.75
    elsif (x == 4)
      play listOfNotes[x], sustain: 1, release: 1, vel: v
      sleep 0.5
    elsif (x == 5) or (x == 6) or (x == 8)
      play listOfNotes[x], sustain: 2, release: 2, vel: 0.2
      play :as5, sustain: 2, release: 2, vel: v
      play :f5, sustain: 2, release: 2, vel: v
      sleep 0.5
    elsif (x == 7)
      play listOfNotes[x], sustain: 2, release: 2, vel: 0.21
      play :g5, sustain: 2, release: 2, vel: v
      sleep 0.5
    elsif (x == 9)
      play listOfNotes[x], sustain: 2, release: 2, vel: 0.22
      play :as5, sustain: 2, release: 2, vel: v
      sleep 0.75
    elsif (x == 10)
      play listOfNotes[x], sustain: 2, release: 2, vel: 0.22
      play :c6, sustain: 2, release: 2, vel: v
      #play :as2, sustain: 2, release: 2, vel: v
      sleep 1
    else
      play listOfNotes[x], sustain: 2, release: 2, vel: v
      sleep 1
    end
    x = x + 1
  end
end

define :prechorus do
  in_thread do
    prechorusLH1
    prechorusLH2
  end
  prechorusRH1
  prechorusRH2
end

define :glissando do
  7.times do
    i = [7, 6, 5, 4, 3, 2, 1].ring.tick
    play (scale, :c6, :major)[i], release: 0.25
    sleep 0.1
  end
  7.times do
    i = [7, 6, 5, 4, 3, 2, 1].ring.tick
    play (scale, :c5, :major)[i], release: 0.25
    sleep 0.1
  end
  7.times do
    i = [7, 6, 5, 4, 3, 2, 1].ring.tick
    play (scale, :c4, :major)[i], release: 0.25
    sleep 0.1
  end
  7.times do
    i = [7, 6, 5, 4, 3, 2, 1].ring.tick
    play (scale, :c3, :major)[i], release: 0.25
    sleep 0.1
  end
end

##| with_synth :piano do
##|   with_fx :reverb, room: 0.95 do
##|     with_fx :lpf, cutoff: 100 do
##|       with_bpm 125 do
##|         prechorus
##|       end
##|     end
##|   end
##| end
