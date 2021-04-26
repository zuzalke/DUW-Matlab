function q=NewRaph(q0,t)

q=q0;
F=Wiezy(q,t);
iter=1; %Licznik iteracji
while((norm(F)>1e-10)&(iter<25))
    F=Wiezy(q,t);
    Fq=Jakobian(q);
    q=q-Fq\F;
    iter=iter+1;
end
if iter>=25
    disp("BŁĄD: po 25 iteracjach N-R nie uzyskano zbieżności");
    q=q0;
end
