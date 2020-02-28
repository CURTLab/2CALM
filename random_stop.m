options.Interpreter = 'tex';
options.Default = 'OK';
button = questdlg('\fontsize{12} Select base data for randomizing.'  ,' RANDOM','OK','STOP',options);

switch button
    case 'STOP'
       clear('button')
       A_start;
    case 'OK'
        clear('button')
        try
        random_load;
        catch
            clc
            A_start;
        end
        A_random_generator_neu;
        quit cancel;
end
