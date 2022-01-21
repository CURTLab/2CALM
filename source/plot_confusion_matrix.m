Init_data_store

confusion = zeros(NumSamp_A,NumSamp_B);

labels_A = cell(1,NumSamp_A);
labels_B = cell(1,NumSamp_B);

for iw=1:NumSamp_A
    
    close all
    fullpath1=Amds.Files{iw,1};
 
    pathname1=[extractAfter(fullpath1,endtext)];
    va=extractBefore(pathname1,'_');
    vb=extractAfter(fullpath1,'_ORG\');
    vb=extractBefore(vb,'_');
    [~,basename,~]=fileparts(fullpath1);
    li=find(basename == '_', 1, 'last');
    vc=extractAfter(basename,li);
    exname1=[vb,'-',va,'-',Atype,'-',vc];
    clear('va','vb','vc','basename');
    
    labels_A{iw} = exname1;
end
    
%%%%%%%%%%%%%%%%%%%%%%% Loading data 2 %%%%%%%%%%%%%
for kw=1:NumSamp_B
    close all
    fullpath2=Bmds.Files{kw,1};

    pathname2=[extractAfter(fullpath2,endtext)];
    va=extractBefore(pathname2,'_');
    vb=extractAfter(fullpath2,'_ORG\');
    vb=extractBefore(vb,'_');
    [~,basename,~]=fileparts(fullpath2);
    li=find(basename == '_', 1, 'last');
    vc=extractAfter(basename,li);
    exname2=[vb,'-',va,'-',Btype,'-',vc];
    clear('va','vb','vc','basename');

    labels_B{kw} = exname2;
end

for iw=1:NumSamp_A
    for kw=1:NumSamp_B
        file=['Res-',labels_A{iw},' vs ',labels_B{kw},'.mat'];
        load(file,'prob');
        confusion(iw,kw) = prob(1);
    end
end

% custom color map for confusion matrix
ConfusionColormap = [0:1.0/255.0:1;0:1.0/255.0:1;ones(1,256)]';

% set the percentage values
imagesc(confusion);
title('Confusion Matrix');
textStrings = num2str(confusion(:).*100, '%.1f%%\n');
textStrings = strtrim(cellstr(textStrings));

[x,y] = meshgrid(1:size(confusion,2),1:size(confusion,1));
hStrings = text(x(:),y(:),textStrings(:), ...
    'HorizontalAlignment','center');

colormap(flipud(ConfusionColormap));

midValue = mean(get(gca,'CLim'));
textColors = repmat(confusion(:) > midValue,1,3);
set(hStrings,{'Color'},num2cell(textColors,2));

set(gca,'XTick',1:NumSamp_B,...
    'XTickLabel',labels_B,...
    'YTick',1:NumSamp_A,...
    'YTickLabel',labels_A,...
    'TickLength',[0 0]);
xtickangle(45)

clear('labels_A','labels_B','ConfusionColormap','prob','textStrings','midValue','textColors','hStrings')