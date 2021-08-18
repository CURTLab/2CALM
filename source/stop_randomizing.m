options.Interpreter = 'tex';
options.Default = 'NO';
button = questdlg('\fontsize{12}Do you want to generate a normal or polarized distribution','Random','Normal','Polarized',options);

switch button
    case 'Normal'
       clear('button')
       random_stop;
       quit cancel;
    case 'Polarized'
        clear('button')
      RANDOM_POLARIZED;
        quit cancel;
end
