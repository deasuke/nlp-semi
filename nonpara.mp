prologues:=3;
outputtemplate:="%j-%c.mps";

def ellipse(expr z, r, s) =
  z+r*dir(0)..z+s*dir(90)..z+r*dir(180)..z+s*dir(270)..cycle
enddef;

def circle(expr z, r) =
  ellipse(z, r, r)
enddef;

beginfig(0)
z1 = (110,150);
z2 = (290,110); z3 = (290, 190);
z4 = (290, 150);
r1 = 68;
r2 = 84;
r3 = 105;
r4 = 75;
r5 = 112;
pickup pencircle scaled 2bp;
drawoptions(withcolor black);
draw (0,0)--(400,0)--(400,300)--(0,300)--cycle;
pickup pencircle scaled 5bp;
for i = 0 upto 100:
  drawdot z1 + r1*sqrt(uniformdeviate(1.0))*dir(uniformdeviate(360));
endfor
for i = 0 upto 200:
  save tmp;
  tmp = uniformdeviate(360);
  drawdot z4 + sqrt(uniformdeviate(1.0))*(r2*cosd(tmp), r5*sind(tmp));
endfor

drawoptions(withcolor blue);
draw circle(z1, r2);
draw circle(z4, r3);
drawoptions(withcolor red);
draw circle(z1, r1);
draw circle(z2, r1);
draw circle(z3, r1);
drawoptions(withcolor 0.3[green, black]);
draw circle(z1, r4);
draw ellipse(z4, r2, r5);


endfig;

beginfig(1)
save r;
z1 = (110, 100); z2 = (110, 200);
z3 = (290, 150);
z4 = (110, 150);
z5 = (110, 95); z6 = (110, 205);
r1 = 65;
r2 = 75;
r3 = 90;
r4 = 70;
r5 = 50;
pickup pencircle scaled 2bp;
drawoptions(withcolor black);
draw (0,0)--(400,0)--(400,300)--(0,300)--cycle;
pickup pencircle scaled 5bp;
for i = 0 upto 100:
  drawdot z3 + r1*sqrt(uniformdeviate(1.0))*dir(uniformdeviate(360));
endfor
for i = 0 upto 70:
  save tmp;
  tmp = uniformdeviate(360);
  drawdot z5 + sqrt(uniformdeviate(1.0))*(r1*cosd(tmp), r5*sind(tmp));
  save tmp;
  tmp = uniformdeviate(360);
  drawdot z6 + sqrt(uniformdeviate(1.0))*(r1*cosd(tmp), r5*sind(tmp));
endfor

drawoptions(withcolor blue);
draw circle(z1, r1);
draw circle(z2, r1);
draw circle(z3, r1);
drawoptions(withcolor red);
draw circle(z4, r3);
draw circle(z3, r2);
drawoptions(withcolor 0.3[green, black]);
draw ellipse(z5, r1, r5);
draw ellipse(z6, r1, r5);
draw circle(z3, r4);
endfig;

end
