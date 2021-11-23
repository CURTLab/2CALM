
Nt=size(in,1);
test_d=[];
inn=in;
inn(:,1)=inn(:,1)/100;
inn=inn';
for i=1:Nt
    test_d(:,:,:,i)=inn(:,i);
end
tr=ou(:,1);
tr=tr';
target_d=categorical(tr);
%%%%%%%%%%%%%%%%%%%%%%%%%%prediction%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Predict_cnn=(predict(net_cnn,test_d));
Predict_cnn=flip(double(mean(Predict_cnn)));
prob=Predict_cnn;
