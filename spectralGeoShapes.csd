<CsoundSynthesizer>
<CsOptions>
-o prova.wav
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 1
nchnls = 2
0dbfs = 1

#include "geoShapes.udo"

  instr triangle
ageo = geoTriangle(p3, p4, p5, p6, p7, p8, p9, p10)
al = ageo * cos(p11 * $M_PI_2)
ar = ageo * sin(p11 * $M_PI_2)
  outs(al/2, ar/2)
  endin

  instr circle
ageo = geoCircle(p3, p4, p5, p6, p7, p8)
al = ageo * cos(p9 * $M_PI_2)
ar = ageo * sin(p9 * $M_PI_2)
  outs(al/2, ar/2)
  endin

  instr square
ageo = geoSquare(p3, p4, p5, p6, p7, p8)
al = ageo * cos(p9 * $M_PI_2)
ar = ageo * sin(p9 * $M_PI_2)
  outs(al/2, ar/2)
  endin


</CsInstruments>
<CsScore>

#include "geo.sco"

</CsScore>
</CsoundSynthesizer>
