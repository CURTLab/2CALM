
options.Interpreter = 'tex';
options.Default = 'I DO NOT KNOW';

button = questdlg('\fontsize{12}Enter target hypothesis of samples similarity: ',...
    'MACHINE LEARNING','DISSIMILAR','SIMILAR','I DO NOT KNOW',options);
switch button
    case 'DISSIMILAR'
          clc
         clear('button','options')
         out=0;
    
    case 'SIMILAR'
         out=1;
         clear('button','options')
      
    case 'I DO NOT KNOW'
        out=-1;
        clc
        clear('button','options')
end