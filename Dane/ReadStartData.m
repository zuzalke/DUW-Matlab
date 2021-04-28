function [CoordinateSystem, RevoluteJoint, PrismaticJoint] = CzlonySrodki();
    temp = fopen('CzlonySrodki.txt', 'r');
    number = str2num(fgetl(temp));
    for i=1:number
        dane = str2num(fgetl(temp));
        CoordinateSystem(i,:)=[dane(1) dane(2) dane(3)];
    end

    temp = fopen('ParyObrotowe.txt', 'r');
    number = str2num(fgetl(temp));
    for i=1:number
        dane = str2num(fgetl(temp));
        czlon1 = dane(1);
        czlon2 = dane(2);
        os_x = dane(3);
        os_y = dane(4);
        if czlon1==0
            sa_x = os_x;
            sa_y = os_y;
        else
            sa_x = os_x - CoordinateSystem(czlon1,1);
            sa_y = os_y - CoordinateSystem(czlon1,2);
        end
        if czlon2==0
            sb_x = os_x;
            sb_y = os_y;
        else
            sb_x = os_x - CoordinateSystem(czlon2,1);
            sb_y = os_y - CoordinateSystem(czlon2,2);
        end
        RevoluteJoint(i,:) = [czlon1 czlon2 sa_x sa_y sb_x sb_y]; 
    end 
    
    temp = fopen('ParyPostepowe.txt', 'r');
    number = str2num(fgetl(temp));
    for i=1:number
        dane = str2num(fgetl(temp));
        czlon1 = dane(1);
        czlon2 = dane(2);
        fi = 0;
        punktA = [dane(3) dane(4)];
        punktB = [dane(5) dane(6)];
        if czlon1==0
            punktA = [0 0];
        else
            sa = punktA - CoordinateSystem(czlon1);
        end
        if czlon2==0
            punktB = [0 0];
        else
            sb = punktB - CoordinateSystem(czlon1);
        end
        v = punktA - punktB;
        v = v/norm(v);
        v = v*Rot(pi/2);
        PrismaticJoint(i,:) = [czlon1 czlon2 fi v sa sb];
    end
end