
function simM=a_similarity_M(averag,alfa)
if averag < alfa
    simM=averag/(2*alfa);
else
    simM=1-alfa/(2*averag);
end