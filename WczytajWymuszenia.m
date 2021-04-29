function [parametryFunkcji] = WczytajWymuszenia()
temp = fopen('Dane/Wymuszenia.txt', 'r');
number = str2num(fgetl(temp));
for i=1:number
     dane = str2num(fgetl(temp));
     L = (dane(1)-dane(3))^2+(dane(2)-dane(4))^2;
     L = sqrt(L);
     a = dane(5);
     w = dane(6);
     fi = dane(7);
     parametryFunkcji(i,:) = [L, a, w, fi];
end