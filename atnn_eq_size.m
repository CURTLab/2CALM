if  Nm > 100000 && fdif > Thre
        Nm=100000;
        atnn_stop_big;
elseif NM >= 100000 && Nm < 100000 && fdif > Thre
        atnn_stop_equalize;
elseif NM < 100000 && Nm < 100000 && fdif > Thre
        atnn_stop_equalize;
       
else
    atnn_stop_noequalize;
end   
clear('NM','Nm','fdif')