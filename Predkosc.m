function dq=Predkosc(q,t)

%ALERT PLIK NIEDOKONCZONY
global CoordinateSystem RevoluteJoint PrismaticJoint nobr npos ncz
Ft=[zeros(nobr,1);  ]                    %pochodna wiêzów wzglêdem czasu - niedokonczone!

Fq=Jakobian(q)