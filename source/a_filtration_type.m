options.Interpreter = 'tex';
options.Default = 'Main-clusters filtration: (DBSCAN)';
button = questdlg('\fontsize{12} Outliers Filtration',' Filter',...
    'Fast filtration: nearest neighbor (NN)','Main-clusters filtration: (DBSCAN)',options);

switch button
    case 'Fast filtration: nearest neighbor (NN)'
       clear('button')
       ster=0;
       quit cancel;
      
    case 'Main-clusters filtration: (DBSCAN)'
        clear('button')
        ster=1;
        quit cancel;
end