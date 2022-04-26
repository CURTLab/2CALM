%Init_data_store
load('series_settings.mat');

Amds = imageDatastore(SampleDir1, ...
    'IncludeSubfolders',true,'FileExtensions', ...
    '.mat','LabelSource','foldernames');
    
Bmds = imageDatastore(SampleDir2, ...
    'IncludeSubfolders',true,'FileExtensions', ...
    '.mat','LabelSource','foldernames');

clear('SampleDir1','SampleDir2');

AlabelCount = numel(Amds.Labels);
BlabelCount = numel(Bmds.Labels);

NumSamp_A=AlabelCount;
NumSamp_B=BlabelCount;

confusion = zeros(NumSamp_A,NumSamp_B);

labels_A = cell(1,NumSamp_A);
labels_B = cell(1,NumSamp_B);

for iw=1:NumSamp_A
    
    close all
    fullpath1=Amds.Files{iw,1};
 
   if isempty(SampleName1)
        [~,exname1,~]=fileparts(fullpath1);
    else
        [~,basename,~]=fileparts(fullpath1);
        li=find(basename == '_', 1, 'last');
        if isempty(li)
            vn=extractAfter(basename,li);
        else
            vn=num2str(iw);
        end
        exname1=[SampleName1,'-',vn];
        clear('li','vn','basename','fullpath1')
    end
    
    labels_A{iw} = exname1;
end
    
%%%%%%%%%%%%%%%%%%%%%%% Loading data 2 %%%%%%%%%%%%%
for kw=1:NumSamp_B
    close all
    fullpath2=Bmds.Files{kw,1};

    if isempty(SampleName1)
        [~,exname2,~]=fileparts(fullpath2);
    else
        [~,basename,~]=fileparts(fullpath2);
        li=find(basename == '_', 1, 'last');
        if isempty(li)
            vn=extractAfter(basename,li);
        else
            vn=num2str(kw);
        end
        exname2=[SampleName2,'-',vn];
        clear('li','vn','basename','fullpath2')
    end
    
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
h1 = figure;
set(h1,'Position',[50 50 750 750])
imagesc(confusion);
%title('Confusion Matrix');
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
set(gca,'xcolor','k') 
set(gca,'ycolor','k') 
%
xtickangle(45)

clear('labels_A','labels_B','ConfusionColormap','prob','textStrings','midValue','textColors','hStrings')