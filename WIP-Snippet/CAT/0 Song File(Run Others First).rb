#IF THERE IS AN ERROR SAYING IT CAN'T FIND A METHOD
#RUN OTHER FILES IN FOLDER

with_synth :piano do
  with_fx :reverb, room: 0.95 do
    with_fx :lpf, cutoff: 100 do
      with_bpm 95 do
        intro
      end
      with_bpm 125 do
        glissando
        prechorus
        verse1
        bridge1
        chorus
        solo
        chorus2
        verse1
        bridge1
        chorus3
        bridge1
        chorus2
      end
    end
  end
end