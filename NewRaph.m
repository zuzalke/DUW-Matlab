function q=NewRaph(q0,t)

q=q0;
F=Fi(q,t);
iter=1; %Licznik iteracji
while((norm(F)>1e-10)&(iter<25))
    F=Fi(q,t);
    Fq=Jakobian(q);
    q=q-Fq\F;
    iter=iter+1;
end
if iter>=25
    disp("B£¥D: po 25 iteracjach N-R nie uzyskano zbie¿noœci");
    q=q0;
end