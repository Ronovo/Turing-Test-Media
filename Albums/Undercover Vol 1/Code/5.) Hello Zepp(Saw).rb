#The Saw Theme V1.0 (Before Refactoring)
#I did this over the course of the last 4 hours.
#Enjoy <3

#It's kinda long. lol. Close to 800 lines.
#Oh WEll.

#Thank you for watching!
#I Hope the rest of your night goes wonderful!
#Don't let Jigsaw get you! >:)

#I wanna play a game

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

###INtro Methods
#####################
define :intro do
  in_thread do
    3.times do
      introRightHand true
    end
    introRightHand false
  end
  introLeftHand
end

define :introLeftHand do
  listOfNotes = [:gs2,:cs2]
  x = 0
  4.times do
    parseChord listOfNotes, 8, 8, 2
    x = x + 1
  end
  listOfNotes = [:cs3, :gs2, :cs2]
  parseChord listOfNotes, 4, 2, 3
  listOfNotes = [:cs3, :gs3]
  parseChord listOfNotes, 4, 2, 2
  2.times do
    play :gs3, sustain: 4, release: 4
    sleep 2
  end
  2.times do
    listOfNotes = [:cs3, :gs2, :cs2]
    parseChord listOfNotes, 4, 2, 3
    listOfNotes = [:cs3,:gs3]
    3.times do
      parseChord listOfNotes, 4, 2, 2
    end
  end
  listOfNotes = [:cs3, :gs2, :cs2]
  parseChord listOfNotes, 4, 2, 3
  listOfNotes = [:cs3,:gs3]
  parseChord listOfNotes, 4, 2, 2
  play :gs3, sustain: 8, release: 8
  sleep 4
end

define :introRightHand do |flag|
  introNotes = [:cs4,:ds4,:e4]
  #Sleep Counter
  s = 2
  2.times do
    x = 0
    3.times do
      if (x == 2)
        play introNotes[x], sustain: 1, release: 1
        x = x + 1
        sleep s
        #Cuts Rest for next loop
        s = s - 0.5
      else
        play introNotes[x], sustain: 0.5, release: 0.5
        x = x + 1
        sleep 0.5
      end
    end
  end
  introNotes = [:cs4,:cs4,:ds4,:e4]
  x = 0
  4.times do
    if (x == 3)
      play introNotes[x], sustain: 1, release: 1
      x = x + 1
      sleep 1
    else
      play introNotes[x], sustain: 0.5, release: 0.5
      x = x + 1
      sleep 0.5
    end
  end
  introNotes = [:cs4,:ds4,:e4]
  2.times do
    x = 0
    3.times do
      if (x == 2)
        play introNotes[x], sustain: 1, release: 1
        x = x + 1
        sleep 2
      else
        play introNotes[x], sustain: 0.5, release: 0.5
        x = x + 1
        sleep 0.5
      end
    end
  end
  s = 1
  if (flag == true)
    introNotes = [:ds4,:e4,:fs4]
    x = 0
    3.times do
      if (x == 2)
        play introNotes[x], sustain: 1, release: 1
        x = x + 1
        sleep s
      else
        play introNotes[x], sustain: 0.5, release: 0.5
        x = x + 1
        sleep 0.5
      end
    end
  end
end

######
# SOLO 1
#####
define :solo1 do
  2.times do
    in_thread do
      solo1LH
    end
    solo1RH
  end
end

define :soloHelper do |notes, n, s, t|
  x = 0
  t.times do
    play notes[x], sustain: n, release: n
    x = x + 1
    sleep 0.2
    s = s - 0.2
  end
  sleep s
end

define :solo1LH do
  listOfNotes = [:gs4, :cs5, :e5]
  soloHelper listOfNotes, 4, 4, 3
  listOfNotes = [:fs4, :b4, :ds5]
  soloHelper listOfNotes, 4, 4, 3
  listOfNotes = [:e4,:gs4,:cs5]
  soloHelper listOfNotes, 8, 8, 3
  
  listOfNotes = [:gs4, :cs5, :e5]
  soloHelper listOfNotes, 4, 4, 3
  listOfNotes = [:b4, :ds5, :fs5]
  soloHelper listOfNotes, 4, 3.25, 3
  listOfNotes = [:ds5]
  soloHelper listOfNotes, 2, 0.75, 1
  listOfNotes = [:e4,:gs4,:cs5]
  soloHelper listOfNotes, 2, 8, 3
end

define :solo1RH do
  notes = [:cs3,:gs3,:e4,:gs3,:cs3,:gs3,:ds4,:gs3,:cs3,:gs3,:cs4,:gs3,:cs2,:gs3,:cs4,:gs3]
  l = notes.length
  x = 0
  l.times do
    play notes[x], sustain: 2, release: 2
    x = x + 1
    sleep 1
  end
  notes = [:cs3,:gs3,:e4,:gs3,:cs3,:gs3,:ds4,:gs3,:cs3,:gs3,:e4,:ds4,:cs1,:gs3,:cs4,:gs3]
  l = notes.length
  x = 0
  l.times do
    play notes[x], sustain: 2, release: 2
    x = x + 1
    sleep 1
  end
end

####
#Main Riff
####
define :main1 do
  2.times do
    in_thread do
      introRightHand true
    end
    main1LH
  end
  in_thread do
    2.times do
      main1RH
    end
  end
  main2LH
  main3LH
end

define :main1LH do
  in_thread do
    2.times do
      play :cs1, release: 8, sustain: 8
      sleep 8
    end
  end
  32.times do
    play :cs2, sustain: 2, release: 2, vel: 0.125
    sleep 0.5
  end
end

define :main2LH do
  in_thread do
    2.times do
      play :cs2, release: 8, sustain: 8
      sleep 8
    end
  end
  32.times do
    play :cs3, sustain: 2, release: 2, vel: 0.17
    sleep 0.5
  end
end

define :main3LH do
  in_thread do
    16.times do
      play :cs2, release: 2, sustain: 2, vel: 0.15
      sleep 1
    end
  end
  32.times do
    play :cs3, sustain: 2, release: 2, vel: 0.17
    sleep 0.5
  end
end

define :main1RH do
  introNotes = [:cs5,:ds5,:e5]
  #Sleep Counter
  s = 2
  2.times do
    x = 0
    3.times do
      if (x == 2)
        play introNotes[x], sustain: 1, release: 1
        x = x + 1
        sleep s
        #Cuts Rest for next loop
        s = s - 0.5
      else
        play introNotes[x], sustain: 0.5, release: 0.5
        x = x + 1
        sleep 0.5
      end
    end
  end
  introNotes = [:cs5,:cs5,:ds5,:e5]
  x = 0
  4.times do
    if (x == 3)
      play introNotes[x], sustain: 1, release: 1
      x = x + 1
      sleep 1
    else
      play introNotes[x], sustain: 0.5, release: 0.5
      x = x + 1
      sleep 0.5
    end
  end
  introNotes = [:cs5,:ds5,:e5]
  2.times do
    x = 0
    3.times do
      if (x == 2)
        play introNotes[x], sustain: 1, release: 1
        x = x + 1
        sleep 2
      else
        play introNotes[x], sustain: 0.5, release: 0.5
        x = x + 1
        sleep 0.5
      end
    end
  end
  s = 1
  introNotes = [:ds5,:e5,:fs5]
  x = 0
  3.times do
    if (x == 2)
      play introNotes[x], sustain: 1, release: 1
      x = x + 1
      sleep s
    else
      play introNotes[x], sustain: 0.5, release: 0.5
      x = x + 1
      sleep 0.5
    end
  end
end

####
#MAIN 2
###############

define :main2LH1 do
  in_thread do
    2.times do
      8.times do
        play :cs2, release: 2, sustain: 2, vel: 0.17
        sleep 0.5
      end
      4.times do
        play :e2, release: 2, sustain: 2, vel: 0.17
        sleep 0.5
      end
      4.times do
        play :fs2, release: 2, sustain: 2, vel: 0.17
        sleep 0.5
      end
    end
  end
  32.times do
    play :cs3, sustain: 2, release: 2, vel: 0.15
    sleep 0.5
  end
end

define :main2LH2 do
  in_thread do
    8.times do
      play :gs2, release: 2, sustain: 2, vel: 0.19
      sleep 0.5
    end
    4.times do
      play :a2, release: 2, sustain: 2, vel: 0.19
      sleep 0.5
    end
    4.times do
      play :as2, release: 2, sustain: 2, vel: 0.19
      sleep 0.5
    end
  end
  16.times do
    play :cs3, sustain: 2, release: 2, vel: 0.17
    sleep 0.5
  end
end

define :main2RH1 do
  introNotes = [:cs4,:ds4,:e4]
  #Sleep Counter
  x = 0
  3.times do
    if (x == 2)
      play introNotes[x], sustain: 1, release: 1
      x = x + 1
      sleep 2
    else
      play introNotes[x], sustain: 0.5, release: 0.5
      x = x + 1
      sleep 0.5
    end
  end
  introNotes = [:e4,:fs4,:gs4]
  x = 0
  x = 0
  3.times do
    if (x == 2)
      play introNotes[x], sustain: 1, release: 1
      x = x + 1
      sleep 2
    else
      play introNotes[x], sustain: 0.5, release: 0.5
      x = x + 1
      sleep 0.5
    end
  end
  introNotes = [:gs4,:as4,:b4]
  x = 0
  x = 0
  3.times do
    if (x == 2)
      play introNotes[x], sustain: 1, release: 1
      x = x + 1
      sleep 1
    else
      play introNotes[x], sustain: 0.5, release: 0.5
      x = x + 1
      sleep 0.5
    end
  end
end

define :main2RH2 do
  introNotes = [:cs4,:ds4,:e4]
  #Sleep Counter
  x = 0
  3.times do
    if (x == 2)
      play introNotes[x], sustain: 1, release: 1
      x = x + 1
      sleep 2
    else
      play introNotes[x], sustain: 0.5, release: 0.5
      x = x + 1
      sleep 0.5
    end
  end
  introNotes = [:e4,:fs4,:gs4]
  x = 0
  x = 0
  3.times do
    if (x == 2)
      play introNotes[x], sustain: 1, release: 1
      x = x + 1
      sleep 1
    else
      play introNotes[x], sustain: 0.5, release: 0.5
      x = x + 1
      sleep 0.5
    end
  end
  introNotes = [:gs4,:fs4,:gs4, :as4,:b4]
  x = 0
  x = 0
  5.times do
    if (x == 4)
      play introNotes[x], sustain: 1, release: 1
      x = x + 1
      sleep 1
    else
      play introNotes[x], sustain: 0.5, release: 0.5
      x = x + 1
      sleep 0.5
    end
  end
end

define :main2 do
  in_thread do
    2.times do
      main2RH1
    end
    3.times do
      main2RH2
    end
  end
  2.times do
    main2LH1
  end
  main2LH2
end

#####
#solo 2
####
define :solo2LH1 do
  listOfNotes = [:gs4, :cs5, :e5]
  parseChord listOfNotes, 4, 4, 3
  listOfNotes = [:fs4, :b4, :ds5]
  parseChord listOfNotes, 4, 4, 3
  listOfNotes = [:e4,:gs4,:cs5]
  parseChord listOfNotes, 8, 8, 3
  
  listOfNotes = [:e4,:gs4,:cs5, :e5]
  parseChord listOfNotes, 4, 4, 4
  listOfNotes = [:fs4, :b4, :fs5]
  parseChord listOfNotes, 4, 4, 4
  listOfNotes = [:e4,:cs5, :e5]
  parseChord listOfNotes, 2, 2, 3
  listOfNotes = [:ds4]
  parseChord listOfNotes, 2, 2, 1
  listOfNotes = [:cs4]
  parseChord listOfNotes, 4, 4, 1
end

define :solo2LH2 do |flag|
  if (flag == true)
    listOfNotes = [:e6, :ds6, :cs6,:ds6,:cs6,:b5,:cs6,:cs6,:ds6]
  else
    listOfNotes = [:e6, :ds6, :cs6,:ds6,:cs6,:b5,:cs6,:cs7,:ds7]
  end
  x = 0
  9.times do
    if(x == 0) or (x == 3)
      play listOfNotes[x], sustain: 2, release: 2
      x = x + 1
      sleep 2
    elsif (x == 6)
      play listOfNotes[x], sustain: 7, release: 7
      x = x + 1
      sleep 7.6
    elsif (x == 7) or (x ==8)
      play listOfNotes[x], sustain: 0.5, release: 0.5
      x = x + 1
      sleep 0.2
    else
      play listOfNotes[x]
      x = x + 1
      sleep 1
    end
  end
  if (flag == true)
    listOfNotes = [:e6, :ds6, :cs6,:ds6,:e6,:fs6]
  else
    listOfNotes = [:e7, :ds7, :cs7,:ds7,:e7,:fs7]
  end
  x = 0
  6.times do
    if (x == 0) or (x == 3)
      play listOfNotes[x], sustain: 4, release: 4
      x = x + 1
      sleep 2
    else
      play listOfNotes[x], sustain: 2, release: 2
      x = x + 1
      sleep 1
    end
  end
  if (flag == true)
    listOfNotes = [:cs6,:e6,:gs6]
  else
    listOfNotes = [:cs7,:e7, :gs7]
  end
  soloHelper listOfNotes, 4, 3, 4
  listOfNotes = [:e7, :gs6, :e6,:cs6,:gs5,:e5,:cs5,:ds5]
  l = listOfNotes.length
  x = 0
  l.times do
    play listOfNotes[x], sustain: 0.5, release: 0.5
    x = x + 1
    sleep 0.5
  end
end

define :solo2LH3 do
  listOfNotes = [:e6, :ds6, :cs6,:ds6,:cs6,:b5,:cs6,:cs6,:ds6]
  x = 0
  9.times do
    if(x == 0) or (x == 3)
      play listOfNotes[x], sustain: 2, release: 2
      x = x + 1
      sleep 2
    elsif (x == 6)
      play listOfNotes[x], sustain: 7, release: 7
      x = x + 1
      sleep 7.6
    elsif (x == 7) or (x ==8)
      play listOfNotes[x], sustain: 0.5, release: 0.5
      x = x + 1
      sleep 0.2
    else
      play listOfNotes[x]
      x = x + 1
      sleep 1
    end
  end
  listOfNotes = [:e6, :ds6, :cs6,:ds6,:e6,:fs6]
  x = 0
  6.times do
    if (x == 0) or (x == 3)
      play listOfNotes[x], sustain: 4, release: 4
      x = x + 1
      sleep 2
    else
      play listOfNotes[x], sustain: 2, release: 2
      x = x + 1
      sleep 1
    end
  end
  listOfNotes = [:cs6,:e6,:gs6]
  soloHelper listOfNotes, 4, 3, 4
  listOfNotes = [:e7,:gs6, :e6,:cs6,:gs5,:e5,:cs5,:gs4,:e4,:cs,:gs3,:e3,:cs3]#,:ds4,:e4,:gs4]
  l = listOfNotes.length
  x = 0
  l.times do
    if(x > 9) and (x < 10)
      play listOfNotes[x], sustain: 2, release: 2
      x = x + 1
      sleep 0.75
    elsif (x > 10) and (x < l)
      play listOfNotes[x], sustain: 4, release: 4
      x = x + 1
      sleep 1
    elsif(x == l)
      play listOfNotes[x], sustain: 8, release: 8
      x = x + 1
      sleep 2
    else
      play listOfNotes[x], sustain: 0.5, release: 0.5
      x = x + 1
      sleep 0.5
    end
  end
  listOfNotes = [:e1,:e2,:e3]
  parseChordVel listOfNotes, 8, 8, 3, 0.25
  
end


define :solo2RH1 do
  listOfNotes = [:e3,:gs3,:e4]
  parseChord listOfNotes, 2, 1, 3
  listOfNotes = [:cs4,:ds4,:e4]
  x = 0
  3.times do
    x = x + 1
    play listOfNotes[x], sustain: 2, release: 2
    sleep 1
  end
  
  listOfNotes = [:ds3,:fs3,:ds4]
  parseChord listOfNotes, 2, 1, 3
  listOfNotes = [:b3,:cs4,:ds4]
  x = 0
  3.times do
    x = x + 1
    play listOfNotes[x], sustain: 2, release: 2
    sleep 1
  end
  
  listOfNotes = [:cs3,:e3,:cs4]
  parseChord listOfNotes, 2, 1, 3
  listOfNotes = [:gs3,:b3,:cs4]
  x = 0
  3.times do
    x = x + 1
    play listOfNotes[x], sustain: 2, release: 2
    sleep 1
  end
  
  listOfNotes = [:e3,:e4]
  parseChord listOfNotes, 4, 2, 2
  listOfNotes = [:fs3,:fs4]
  parseChord listOfNotes, 4, 2, 2
  2.times do
    listOfNotes = [:e2,:cs3,:e3]
    parseChord listOfNotes, 4, 2, 3
    listOfNotes = [:cs2,:cs3]
    parseChord listOfNotes, 2, 1, 2
    listOfNotes = [:b1,:b2]
    parseChord listOfNotes, 2, 1, 2
  end
  
  listOfNotes = [:cs3,:gs3,:cs4]
  parseChordVel listOfNotes, 16, 8, 3, 0.215
end

define :solo2RH2 do
  listOfNotes = [:cs2,:cs1]
  parseChord listOfNotes, 4, 4, 2
  listOfNotes = [:b1,:b0]
  parseChord listOfNotes, 4, 4, 2
  listOfNotes = [:cs2,:cs1]
  parseChord listOfNotes, 2, 2, 2
  listOfNotes = [:ds2,:ds1]
  parseChord listOfNotes, 2, 2, 2
  listOfNotes = [:e2,:e1]
  parseChord listOfNotes, 2, 2, 2
  listOfNotes = [:fs2,:fs1]
  parseChord listOfNotes, 2, 2, 2
  listOfNotes = [:cs3,:cs2]
  parseChord listOfNotes, 4, 4, 2
  listOfNotes = [:b2,:b1]
  parseChord listOfNotes, 2, 4, 2
  listOfNotes = [:cs3,:cs2]
  parseChord listOfNotes, 4, 4, 2
end
define :solo2 do
  in_thread do
    solo2RH1
  end
  solo2LH1
  solo2LH2 true
  in_thread do
    solo2RH2
  end
  solo2LH2 false
end
#########################
#SONG METHOD
########################
with_synth :piano do
  with_fx :lpf, cutoff: 95 do
    with_fx :reverb, room: 0.97 do
      with_bpm 135 do
        intro
        solo1
      end
      with_bpm 138 do
        main1
      end
      with_bpm 141 do
        main2
        solo2
      end
      with_bpm 144 do
        main1
        main2
      end
      with_bpm 132 do
        solo2LH3
      end
    end
  end
end

#All the code will be availabe in the description in a pastebin as always.
#Don't worry about following along. :p
