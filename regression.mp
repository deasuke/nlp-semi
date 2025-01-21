prologues:=3;
outputtemplate:="%j-%c.mps";

verbatimtex
%&latex
\documentclass[uplatex]{jsarticle}
\begin{document}
etex;

def measure(expr u, v, l) =
  begingroup
  save p, q, r, x, y; pair p, q, r;
  q = 0.5[u,v];
  (x, y) = u-q;
  r = q + (u-q)/sqrt(x*x+y*y)*l;
  p = r rotatedaround(q, 90);
  u...p...v
  endgroup
enddef;

beginfig(0)
pickup pencircle scaled 1bp;
drawoptions(withcolor black);
draw (-200,0)--(200,0);
draw (200,0)+10dir(160)--(200,0)--(200,0)+10dir(-160);
label.urt(btex {\Large$x$} etex, (200,0));
drawoptions(withcolor blue);
draw
  for i = -1.5 step 0.05 until 1.5:
    (i*100, i*i*100+50)...
  endfor
  (1.5*100, 1.5*1.5*100+50);

drawoptions(withcolor black);
pickup pencircle scaled 3bp;
for i = -1.4 step 0.1 until 0.45:
  drawdot (i*100, i*i*100+30+uniformdeviate(40));
endfor
for i = 0.6 step 0.1 until 1.45:
  drawdot (i*100, i*i*100+30+uniformdeviate(40));
endfor

drawdot(50, 25+50+30);
label.top(btex {\Large $(x_i, y_i\kern0.05em)$} etex, (50, 25+50+30));
drawdot(50, 25+50);

drawoptions(withcolor red);
pickup pencircle scaled 1bp;
draw (50, 25+50)--(50, 25+50+30);
drawoptions(withcolor black);
draw measure((50, 25+50+30), (50, 25+50), 7);  
label.lft(btex {\Large $\left|f(x_i)-y_i\kern0.05em\right|$} etex, (50, 25+50+15));
endfig;
end
