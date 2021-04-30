function Q_TEMP = NewRaph(Q_TEMP, ParyObrotowe, ParyPostepowe, WymObrotowe, WymPostepowe, T_TEMP)
    %Rozwi�zanie uk�adu r�wna� metod� Newtona-Raphsona

    F = ones(length(Q_TEMP),1);
    EPS = 10e-9;
    IleIteracji = 1;
    MaxIteracji = 25;

    while(norm(F) > EPS && IleIteracji < MaxIteracji)
        F = Wiezy(Q_TEMP, ParyObrotowe, ParyPostepowe, WymObrotowe, WymPostepowe, T_TEMP);
        FQ = Jakobian(Q_TEMP, ParyObrotowe, ParyPostepowe, WymObrotowe, WymPostepowe);
        Q_TEMP = Q_TEMP - FQ\F;
        IleIteracji = IleIteracji + 1;
    end
    
    
    if(IleIteracji > MaxIteracji)
        disp('Nie uda�o si� uzyska� zbie�no�ci po za�o�onej liczbie iteracji')
    end
end

