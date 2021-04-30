function [T,Q,DQ,D2Q]=Mechanizm(Wiezy, rows)
% [T,Q,DQ,D2Q]=KorbWodz
% Rozwi�zanie zada� kinematyki o po�o�eniu, pr�dko�ci i przyspieszeniu 
%   dla mechanizmu korbowo-wodzikowego.
% Wyj�cie:
%   T   - tablica do zapisu kolejnych chwil.
%   Q   - tablica do zapisu rozwi�za� zadania o po�o�eniu w kolejnych chwilach.
%   DQ  - tablica do zapisu rozwi�za� zadania o pr�dko�ci w kolejnych chwilach.
%   D2Q - tablica do zapisu rozwi�za� zad. o przyspieszeniu w kolejnych chwilach.

input_wymiary;

% Przybli�enie startowe (gdy brak rozwi�zania z poprzedniej chwili)

q = [0.7; -0.2; 0;
    0; 0.2; 0;
    0.2; 0.3; 0;
    1.55; -0.35; 0;
    0.9; 0.2; 0;
    0.2; -0.35; 0;
    0.6; -0.25; 0;
    0.15; -0.45; 0;
    0.25; 0.05; 0;
    0.7; 0; 0];
qdot=zeros(size(q));
qddot=zeros(size(q));

lroz=0; % Licznik rozwi�za� (s�u�y do numerowania kolumn w tablicach z wynikami)
dt=0.01; % Odst�p pomi�dzy kolejnymi chwilami

ZakresCzasu = 0:dt:1.5;
Q = zeros(size(q,1), length(ZakresCzasu));
DQ = zeros(size(Q));
D2Q = zeros(size(Q));
T = zeros(size(Q));

% Rozwi�zywanie zada� kinematyki w kolejnych chwilach t
for t=ZakresCzasu
    % Zadanie o po�o�eniu. 
    % Przybli�eniem pocz�tkowym jest rozwi�zanie z poprzedniej chwili, 
    % powi�kszone o sk�adniki wynikaj�ce z obliczonej pr�dko�ci i przyspieszenia.
    q0=q+qdot*dt+0.5*qddot*dt*dt;
    q=NewtonRaphson(q0,t,Wiezy,rows); 

    % Zadanie o predkosciach
    qdot=MacierzJacobiego(q,t,Wiezy,rows)\WektorPrawychPredk(q,t,Wiezy,rows);  % Zadanie o pr�dko�ci

    % Zadanie o przyspieszeniach
    qddot=MacierzJacobiego(q,t,Wiezy,rows)\WektorGamma(q,qdot,t,Wiezy,rows);  % Zadanie o przyspieszeniu

    % Zapis do tablic gromadz�cych wyniki
    lroz %Wyswietlana tylko do debugowania
    lroz=lroz+1;
    T(1,lroz)=t; 
    Q(:,lroz)=q;
    DQ(:,lroz)=qdot;
    D2Q(:,lroz)=qddot;
end
