prologues:=3;
outputtemplate:="%j-%c.mps";

verbatimtex
%&latex
\documentclass[uplatex]{jsarticle}
\begin{document}
etex;


def sigmoid(expr x) =
   1/(2-x*(1-0.5x*(1-(x/3)*(1-0.25x*(1-0.2x*(1-(x/6)*(1-(x/7)*(1-0.125x*(1-(x/9))))))))))
enddef;

beginfig(0)
pickup pencircle scaled 1bp;
drawoptions(withcolor black);
z1 = (300,0);
draw -z1--z1;
draw z1+10dir(160)--z1--z1+10dir(-160);
label.urt(btex {\Large$x$} etex, z1);
z2 = (0, 115);
draw (0, -15)--z2;
draw z2+10dir(-70)--z2--z2+10dir(-110);
label.ulft(btex {\Large$y$} etex, z2);
label.lrt(btex {\Large$\frac12$} etex, (0,50));
label.llft(btex {\Large$1$} etex, (0,100));
label.llft(btex {\Large$O$} etex, (0,0));
draw
  for i = -3.0 step 0.05 until 3.0:
    100*(i, sigmoid(i))...
  endfor
  (3.0, sigmoid(3.0))*100;
drawoptions(withcolor blue);
draw (-300,100)--(300,100) dashed evenly;

endfig;
end
