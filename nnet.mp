prologues:=3;
outputtemplate:="%j-%c.mps";

verbatimtex
%&latex
\documentclass[uplatex]{jsarticle}
\begin{document}
etex;

def ellipse(expr z, r, s) =
  z+r*dir(0)..z+s*dir(90)..z+r*dir(180)..z+s*dir(270)..cycle
enddef;

def circle(expr z, r) =
  ellipse(z, r, r)
enddef;

vardef dist(expr h, m, r, n) = 
  begingroup
    save d; numeric d;
    2m + 2r + (n-1)*d = h;
    d
  endgroup
enddef;

beginfig(0)
w=400; h=300; r = 20; m=10;

pickup pencircle scaled 2bp;
drawoptions(withcolor black);

d1 = dist(h, m, r, 5);
d2 = dist(h, m, r, 4);
d3 = dist(h, m, r, 3);

for i = 0 upto 4:
  draw circle((30, m+r+d1*i), r);
  draw (30+r, m+r+d1*i)--(70, m+r+d1*i);
endfor;
drawoptions(withcolor blue);
for i = 0 upto 3:
  draw circle((160, m+r+d2*i), r);
  draw (120, m+r+d2*i)--(160-r, m+r+d2*i);
  draw (160+r, m+r+d2*i)--(200, m+r+d2*i);
endfor;
for i = 0 upto 2:
  draw circle((290, m+r+d3*i), r);
  draw (250, m+r+d3*i)--(290-r, m+r+d3*i);
  draw (290+r, m+r+d3*i)--(330, m+r+d3*i);
endfor;
drawoptions(withcolor black);
for i = 0 upto 4:
  draw circle((420, m+r+d1*i), r);
  draw (380, m+r+d1*i)--(420-r, m+r+d1*i);
endfor;
drawoptions(withcolor red);
draw (70, 10)--(120, 10)--(120, h-10)--(70, h-10)--cycle;
draw (200, 10)--(250, 10)--(250, h-10)--(200, h-10)--cycle;
draw (330, 10)--(380, 10)--(380, h-10)--(330, h-10)--cycle;
drawoptions(withcolor black);
label(btex {\Large$x_0^{(1)}$} etex, (30, m+r+d1*4));
label(btex {\Large$x_0^{(2)}$} etex, (30, m+r+d1*3));
label(btex {\Large$x_0^{(3)}$} etex, (30, m+r+d1*2));
label(btex {\Large$x_0^{(4)}$} etex, (30, m+r+d1*1));
label(btex {\Large$x_0^{(5)}$} etex, (30, m+r+d1*0));
label(btex {\Large$y^{(1)}$} etex, (420, m+r+d1*4));
label(btex {\Large$y^{(2)}$} etex, (420, m+r+d1*3));
label(btex {\Large$y^{(3)}$} etex, (420, m+r+d1*2));
label(btex {\Large$y^{(4)}$} etex, (420, m+r+d1*1));
label(btex {\Large$y^{(5)}$} etex, (420, m+r+d1*0));

endfig;


end
