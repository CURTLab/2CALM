%options.Interpreter = 'tex';

x = inputdlg({'Enter number of neurons.'},'MLP',[1,40],{'30'});
if isempty(x)==0
NeuronNumber= str2double(x{1,1});
clear('x')
else
clear('x')
quit cancel
end