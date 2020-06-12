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