function [x] = LiczWymuszenia(t, rzadPochodnej, numerWymuszenia)
    parametryFunkcji = WczytajWymuszenia;
    L = parametryFunkcji(numerWymuszenia, 1);
    a = parametryFunkcji(numerWymuszenia, 2);
    w = parametryFunkcji(numerWymuszenia, 3);
    fi = parametryFunkcji(numerWymuszenia, 4);
    if rzadPochodnej == 0
        x = L + a*sin(w*t+fi);
    elseif rzadPochodnej == 1
        x = w*a*cos(w*t+fi);
    elseif rzadPochodnej == 2
        x = -w*w*a*sin(w*t+fi);
    end
end