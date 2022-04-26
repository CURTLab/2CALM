%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Results tables  %%%%%%%%%%%%%%%%%%%%%
A =  Resampl_number;
%%%%%%%%%%%%%%%%%%% RIPLEY %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Sim_ripley_M=[];                           %%%%%%%%%%%% similarity average
Sim_ripley_M(1:NumSamp_A,1:NumSamp_B)=0;
Sim_ripley_L=[];                          %%%%%%%%%%%%%%% simirarity field
Sim_ripley_L(1:NumSamp_A,1:NumSamp_B)=0;
Sim_ripley_AVP=[];
Sim_ripley_AVP(1:NumSamp_A,1:NumSamp_B)=0;  %%%%%%%%%%%%%% average p value

Sim_boot_M=[];                           %%%%%%%%%%%%  similarity M
Sim_boot_M(1:NumSamp_A,1:NumSamp_B)=0;
Sim_boot_L=[];                          %%%%%%%%%%%%%%% simirarity field
Sim_boot_L(1:NumSamp_A,1:NumSamp_B)=0;
Sim_boot_AVP=[];
Sim_boot_AVP(1:NumSamp_A,1:NumSamp_B)=0;  %%%%%%%%%%%%%% average p value

Sim_boot1_M=[];                           %%%%%%%%%%%% first level similarity average
Sim_boot1_M(1:NumSamp_A,1:NumSamp_B)=0;
Sim_boot1_L=[];                          %%%%%%%%%%%%%%% first level  simirarity field
Sim_boot1_L(1:NumSamp_A,1:NumSamp_B)=0;
Sim_boot1_AVP=[];
Sim_boot1_AVP(1:NumSamp_A,1:NumSamp_B)=0;  %%%%%%%%%%%%%% first level average p value

Sim_MLP=[];
Sim_MLP(1:NumSamp_A,1:NumSamp_B)=0;  %%%%%%%%%%%%%% sim probability


%%%%%%%%%%%%%%%%%%%%% Global Parameters%%%%%%%%%%%%%%%%%%%%%%%%
clear('Volum1','Volum2','Lambda_dens1', 'Lambda_dens2', 'Curv1','Curv2')

Volum1(1:3,1:NumSamp_A)=0;
Volum2(1:3,1:NumSamp_B)=0;

Lambda_dens1(1:3,1:NumSamp_A)=0;
Lambda_dens2(1:3,1:NumSamp_B)=0;

Curv1(1,1:NumSamp_A)=0;
Curv2(1,1:NumSamp_B)=0;

%%%%%%%%%%%%%%%%%%%% Main Loop %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%% Loading data 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
gindex=0;

for iw=1:NumSamp_A
    
    close all
    %pathname1=[pathname01,num2str(iw),'.mat'];
    fullpath1=Amds.Files{iw,1};
    load(fullpath1)
    
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
    
    yos(iw,1)={exname1};
    if exist('par','var') == 1
        colhead1=par.pkdesc.desc';
        dat1=par.pkmatrix;
        [xi1,yi1,zi1,ini1,sxi1,szi1,fri1,lasti1,rgi1,rgfi1,rgsi1]=data_extraction_index(colhead1);
        clear('par');
    else
        clear
        a_info_wrong_data;
        stop_wrong_data;
    end
    %%%%%%%%%%% NaN elimination
    ww=[];
    for j=1:lasti1
        snan=isnan(dat1(:,j));
        snani=find(snan==1);
        ww=union(ww,snani);
    end
    dat1(ww,:)=[];
    %%%%%%%%%%%%%%% global parameters %%%%%%%%%%%%%%%%%%%%%%%%
    N1=size(dat1,1);
    pos1tem=[dat1(:,xi1),dat1(:,yi1),dat1(:,zi1)];
    [Vb,~]=Vbox(pos1tem);             % box volumen
    %Vb=Vb*1e-9;
    Lambda1b=N1/Vb;                   % convex hull volumen
    [~,v] = convhulln(pos1tem);
    %v=v*1e-9;
    lambda1conv=N1/v;
    shp = alphaShape(pos1tem);       % shape volumen
    Vshape = volume(shp);
    %Vshape=Vshape*1e-9;
    lambda1shape=N1/Vshape;
    
    Volum1(1,iw)=Vb;
    Volum1(2,iw)=v;
    Volum1(3,iw)=Vshape;
    Lambda_dens1(1,iw)=Lambda1b;
    Lambda_dens1(2,iw)=lambda1conv;
    Lambda_dens1(3,iw)=lambda1shape;
    Curv1(1,iw)=curvature(pos1tem);
    SP=mean(pos1tem);
    DIA=pdist2(SP,pos1tem);
    ep=find(DIA>0.9*max(DIA));
    DIA1=median(DIA(:,ep));
    Volum1(4,iw)=DIA1;
    Volum1(5,iw)=N1;
    clear('v','pos1tem','shp','Vshape','Vb')
    
    %%%%%%%%%%%%%%%%%%%%%%% Loading data 2 %%%%%%%%%%%%%
    for kw=1:NumSamp_B
        
        gindex=gindex+1;
        para_name=[num2str(iw),'/',num2str(kw)];
        x_paren(1,gindex)={para_name};
        
        
        tic
        close all
        fullpath2=Bmds.Files{kw,1};
        load(fullpath2)
        
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
        
        xos(1,kw)={exname2};
        
        if exist('par','var') == 1
            colhead2=par.pkdesc.desc';
            dat2=par.pkmatrix;
            [xi2,yi2,zi2,ini2,sxi2,szi2,fri2,lasti2,rgi2,rgfi2,rgsi2]=data_extraction_index(colhead2);
            clear('par');
        else
            clear
            a_info_wrong_data;
            stop_wrong_data;
        end
        
        %%%%%%%%%%% NaN elimination
        
        ww=[];
        for j=1:lasti2
            snan=isnan(dat2(:,j));
            snani=find(snan==1);
            ww=union(ww,snani);
        end
        dat2(ww,:)=[];
        
        N2=size(dat2,1);
        
        pos2tem=[dat2(:,xi1),dat2(:,yi1),dat2(:,zi1)];
        
        if Volum2(1,kw)== 0
            [Vb,~]=Vbox(pos2tem);
            %Vb=Vb*1e-9;
            Lambda2b=N2/Vb;
            [~,v] = convhulln(pos2tem);
            %v=v*1e-9;
            lambda2conv=N2/v;
            shp = alphaShape(pos2tem);
            Vshape = volume(shp);
            %Vshape=Vshape*1e-9;
            lambda2shape=N2/Vshape;
            
            Volum2(1,kw)=Vb;
            Volum2(2,kw)=v;
            Volum2(3,kw)=Vshape;
            Lambda_dens2(1,kw)=Lambda2b;
            Lambda_dens2(2,kw)=lambda2conv;
            Lambda_dens2(3,kw)=lambda2shape;
            Curv2(1,kw)=curvature(pos2tem);
            SP=mean(pos2tem);
            DIA=pdist2(SP,pos2tem);
            ep=find(DIA>0.9*max(DIA));
            DIA2=median(DIA(:,ep));
            Volum2(4,kw)=DIA2;
            Volum2(5,kw)=N2;
        end
        clear('v','pos2tem','shp','Vshape','Vb')
        clear('ww','snan','snani')
        
        
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        para=[exname1,' vs ',exname2];
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        %plot_reduction;
        
        %%%%%%%%%%%%%%%%%%%%%%% RIPLEY  %%%%%%%%%%%%%%%%%%%
        Series_analysis_ripley3d;
        cleaning_ripl;
        
        %%%%%%%%%%%%%%%%%%%%%%% bootstrap density curvature %%%%%%%%%%%%%%%%%%%
        Series_bootstrap;
        
        %%%%%%%%%%%%%%%%%%%% MLP %%%%%%%%%%%%%%%%%%%%%%%%
        tt_test_mlp;
        
        save_pair;
        
        disp('Processing time of one pair')
        toc
    end
    
end
save_sim_array;
save_all_compar;

