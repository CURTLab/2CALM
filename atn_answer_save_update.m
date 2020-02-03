options.Interpreter = 'tex';
options.Default = 'NO';

button = questdlg('\fontsize{10}Do you want to save the selected regions?',' ROI','YES','NO',options);

switch button
    case 'YES'
           close all
           clear('button')
           atn_select_region_sample;
    case 'NO'
            close all
            pos=[dat(:,xi),dat(:,yi),dat(:,zi)];
            if sum(dat(:,rgsi))==0
             clnew=dat(:,rgi);
             ttext='No region is saved';
            else
             clnew=dat(:,rgsi);
             ttext='These regions are saved';
            end
            
            plot2d_region(pos,clnew,pos,N_region)
            suptitle ([exname,' \newline',ttext])
            
            clear('button','pos','clnew','ttext')
            clc
            quit cancel
end