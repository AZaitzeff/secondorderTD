
test=1;

if test==1
    double=0;
    T=.5;%time value
    numpts=1501;
    Ns=[8192,8192*2];
    testdumbbell;
elseif test==2
    double=1;
    T=.5;%time value
    numpts=1501;
    Ns=[16,32,64,128,256];
    testdumbbell;
elseif test==3
    double=0;
    T=.75;%time value
    numpts=1501;
    Ns=[8192,8192*2];
    testdumbbell;
else
    double=1;
    T=.75;%time value
    numpts=1501;
    Ns=[16,32,64,128,256];
    testdumbbell;
end






