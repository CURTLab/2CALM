options.Interpreter = 'tex';

x = inputdlg({'\fontsize{12}Enter number of neurons.'},'MLP',[1,40],{'30'},options);
if isempty(x)==0
NeuronNumber= str2double(x{1,1});
clear('x')
else
clear('x')
quit cancel
end