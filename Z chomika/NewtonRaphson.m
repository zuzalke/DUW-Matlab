function q=NewtonRaphson(q0,t, Wiezy, rows)
% q=NewRaph(q0,t)
%   Rozwi�zanie uk�adu r�wna� metod� Newtona-Raphsona.
% Wej�cie:
%   q0 - przybli�enie startowe,
%   t - chwila, dla kt�rej poszukiwane jest rozwi�zanie.
% Wyj�cie:
%   q - uzyskane rozwi�zanie.
%
% Uk�ad r�wna� musi by� wpisany w pliku Wiezy.m.
% Macierz Jacobiego uk�adu r�wna� musi by� wpisana w pliku Jakobian.m.
%
%*************************************************************
%   Program stanowi za��cznik do ksi��ki:
%   Fr�czek J., Wojtyra M.: Kinematyka uk�ad�w wielocz�onowych.
%                           Metody obliczeniowe. WNT 2007.
%   Wersja 1.0
%*************************************************************

q=q0;

F=WektorPhi(q,t, Wiezy, rows);
iter=1; % Licznik iteracji
while ( (norm(F)>epsilon()) && (iter < 200) )
    F=WektorPhi(q,t, Wiezy, rows);
    Fq=MacierzJacobiego(q,t,Wiezy,rows);
    q=q-Fq\F;  % Fq\F jest r�wnowa�ne inv(Fq)*F, ale mniej kosztowne numerycznie
    iter=iter+1;
end
if iter >= 200
    disp('B��D: Po 200 iteracjach Newtona-Raphsona nie uzyskano zbie�no�ci ');
    norm(F)
    q=q0;
end

