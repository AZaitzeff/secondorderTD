
test=1;

if test==1
    double=0;
    T=.5;%time value
    numpts=501;
    Ns=[4096,8192];
    testdumbbell;
elseif test==2
    double=1;
    T=.5;%time value
    numpts=501;
    Ns=[64,128,256,512];
    testdumbbell;
elseif test==3
    double=0;
    T=.75;%time value
    numpts=1001;
    Ns=[4096,8192];
    testdumbbell;
else
    double=1;
    T=.75;%time value
    numpts=1001;
    Ns=[64,128,256,512];
    testdumbbell;
end






