%%Load the gridded data, specify the current amplitude and cathodic and/or
%%anodic ratio

neg_el=load('circularONJ.txt');
pos_el=load('CircularONJ.txt');

currentAmplitudes=[15];

%Prescribe the ratio of cathodic and anodic current injections. For fixed
%cathodic, use 1 for neg_ratio, and pos_ratio can be any value between 0 and 1


neg_ratio= [1];
pos_ratio = [0];



for iter_curr = 1:length(currentAmplitudes)
    for iter_ratio = 1:length(neg_ratio)
        clearvars -except iter_ratio iter_curr currentAmplitudes neg_ratio pos_ratio neg_el pos_el
        curr=currentAmplitudes(iter_curr);
        neg_mult=neg_el;
        pos_mult=pos_el;
        comb_mult=zeros(length(neg_mult),4);
        
        %% Multiplication and superposition of the potential grid. Here the
        %cathodic current is fixed, hence only pos_mult is multiplied with
        %pos_ratio. Change as necessary.
        for ind=1:length(neg_mult)
            neg_mult(ind,4)=neg_mult(ind,4)*curr;
            pos_mult(ind,4)=pos_mult(ind,4)*-curr*pos_ratio(iter_ratio);
            comb_mult(ind,4)=neg_mult(ind,4)+pos_mult(ind,4);
            %             comb_mult(ind,4)=neg_mult(ind,4);
        end
        comb_mult(:,1:3)=neg_mult(:,1:3);
        
        %% %%Predicting the initial sampling area
        
        
        %Find the point where the absolute potential is the highest. This
        %will be the centre point for the initial sampling area calculation
        el_loc=[comb_mult((abs(comb_mult(:,4))==max(abs(comb_mult(:,4)))),1), ...
            comb_mult((abs(comb_mult(:,4))==max(abs(comb_mult(:,4)))),2), ...
            comb_mult((abs(comb_mult(:,4))==max(abs(comb_mult(:,4)))),3)];
        
        
        %Specify the grid size from COMSOL
        smallesty=min(comb_mult(:,2));
        biggesty=max(comb_mult(:,2));
        smallestz=min(comb_mult(:,3));
        biggestz=max(comb_mult(:,3));
        grid=[smallesty,biggesty,smallestz,biggestz];
        
        %Define the initial sampling resolution.
        d=10;
        
        %Calculate the firing probability. Check if they are all 0. If so, break, if not, add n and make a new box
        prob=ones();
        plotted=zeros();
        plottedprob=zeros();
        n=10; %The initial guess for the size of the bounding box. n=10 makes a 100umx100um square around the centre point
        count=0;
        while any(prob)
            p=makebox(el_loc,n,grid);
            for points=1:length(p)
                if p(points,1)<smallesty || p(points,1)>biggesty || p(points,2)<smallestz || p(points,2)>biggestz
                    test = 'test 1'
                    prob(points)=0;
                else
                    test = 'test 2'
                    prob(points)=testfunct_three(comb_mult,p(points,1),p(points,2),el_loc);
                end
                count=count+1;
                plotted(count,1)=p(points,1);
                plotted(count,2)=p(points,2);
                plottedprob(count,1)=prob(points);
            end
            fprintf('Estimating the boundary,n=%d\n', n)
            n=n+5;
        end
        
        %Return the points to be calculated
        Yinit=min(p(:,1)):d:max(p(:,1));
        if Yinit(1)<smallesty
            Yinit(1)=smallesty;
        end
        if Yinit(length(Yinit))>biggesty
            Yinit(length(Yinit))=biggesty;
        end
        Yinit(Yinit>biggesty)=[];
        Yinit(Yinit<smallesty)=[];
        Zinit=min(p(:,2)):d:max(p(:,2));
        if Zinit(1)<smallestz
            Zinit(1)=smallestz;
        end
        if Zinit(length(Zinit))>biggestz
            Zinit(length(Zinit))=biggestz;
        end
        Zinit(Zinit>biggestz)=[];
        Zinit(Zinit<smallestz)=[];
        Yinit=unique(Yinit);
        Zinit=unique(Zinit);
        [Y,Z]=meshgrid(Yinit,Zinit);
        coord=cat(2,Y',Z');
        coord=reshape(coord,[],2);
        coord(ismember(coord,plotted,'rows'),:)=[];
        
        file_name=strcat(string(int16(100*neg_ratio(iter_ratio))),'_', string(int16(100*neg_ratio(iter_ratio))),'_', string(int16(curr)));
        
        Yinit=Yinit';
        fname=strcat('YinitJIfspnewProbn ',file_name);
        fname=char(fname);
        save(fname,'Yinit');
        
        Zinit=Zinit';
        fname=strcat('ZinitJIfspnewProbn ',file_name);
        fname=char(fname);
        save(fname,'Zinit');
        
        %% Generate the initial map
        
        
        for i=1:length(coord)
            axonProbabilitytemp(i,1)=testfunct_three(comb_mult,coord(i,1),coord(i,2),el_loc);
            fprintf('Generating the initial map %.2f%% done\n', 100*i/length(coord))
            if i==floor(0.3*length(coord))||i==floor(0.5*length(coord))||i==floor(0.7*length(coord))||i==floor(0.9*length(coord))
                fname=strcat('axonProbJIfspnewProbntemp ',file_name);
                fname=char(fname);
                save(fname,'axonProbabilitytemp');
            end
        end
        
        fname=strcat('axonProbabilitytempJIfspnewProbn ',file_name);
        fname=char(fname);
        save(fname,'axonProbabilitytemp');
        
        plotted=[plotted(:,:);coord(:,1:2)];
        plottedprob=[plottedprob;axonProbabilitytemp];
        combine=[plotted,plottedprob];
        for l=1:size(combine,1)
            if combine(l,1)>biggesty || combine(l,1)<smallesty || combine(l,2)>biggestz || combine(l,2)<smallestz
                combine(l,:)=[NaN NaN NaN];
            end
        end
        combine(any(isnan(combine),2),:)=[];
        
        fname=strcat('combineJIfspnewProbn ',file_name);
        fname=char(fname);
        save(fname,'combine');
        
        
        axonProbability=zeros(length(Zinit),length(Yinit));
        for lplot=1:size(combine,1)
            Yindex=find(Yinit==combine(lplot,1));
            Zindex=find(Zinit==combine(lplot,2));
            axonProbability(Zindex,Yindex)=combine(lplot,3);
        end
        
        fname=strcat('axonProbabilityJIfspnewProbn ',string(int16(100*neg_ratio(iter_ratio))),string(int16(curr)));
        fname=char(fname);
        save(fname,'axonProbability');
        
        
        
        %% Find New Points to refine the map
        %Detect the border of the initial probability map
        BW=zeros(size(axonProbability,1)*size(axonProbability,2),2);
        counter=0;
        down=[];
        
        for zcoord=1:size(axonProbability,1)-1
            for ycoord=1:size(axonProbability,2)
                neighbour1=axonProbability(zcoord+1,ycoord);
                if abs(axonProbability(zcoord,ycoord)-neighbour1)>=0.7*axonProbability(zcoord,ycoord) && axonProbability(zcoord,ycoord)~=0
                    counter=counter+1;
                    BW(counter,1)=zcoord;
                    BW(counter,2)=ycoord;
                else
                    
                end
            end
        end
        
        for zcoord=2:size(axonProbability,1)
            for ycoord=1:size(axonProbability,2)
                neighbour2=axonProbability(zcoord-1,ycoord);
                if abs(axonProbability(zcoord,ycoord)-neighbour2)>=0.7*axonProbability(zcoord,ycoord) && axonProbability(zcoord,ycoord)~=0
                    counter=counter+1;
                    BW(counter,1)=zcoord;
                    BW(counter,2)=ycoord;
                else
                    
                end
            end
        end
        
        for zcoord=1:size(axonProbability,1)
            for ycoord=1:size(axonProbability,2)-1
                neighbour3=axonProbability(zcoord,ycoord+1);
                if abs(axonProbability(zcoord,ycoord)-neighbour3)>=0.7*axonProbability(zcoord,ycoord) && axonProbability(zcoord,ycoord)~=0
                    counter=counter+1;
                    BW(counter,1)=zcoord;
                    BW(counter,2)=ycoord;
                else
                    
                end
            end
        end
        
        for zcoord=1:size(axonProbability,1)
            for ycoord=2:size(axonProbability,2)
                neighbour4=axonProbability(zcoord,ycoord-1);
                if abs(axonProbability(zcoord,ycoord)-neighbour4)>=0.7*axonProbability(zcoord,ycoord) && axonProbability(zcoord,ycoord)~=0
                    counter=counter+1;
                    BW(counter,1)=zcoord;
                    BW(counter,2)=ycoord;
                else
                    
                end
            end
        end
        
        BW=unique(BW,'rows');
        BW( ~any(BW,2), : ) = []; % removes all rows with all zero
        
        %Translate the location of the border to y-z-coordinate
        yzborder=zeros(length(BW),2);
        
        for len=1:length(BW)
            yzborder(len,1)=Zinit(BW(len,1));
            yzborder(len,2)=Yinit(BW(len,2));
        end
        
        %Add new points
        newPoints=zeros(length(yzborder),8);
        d=5;
        for lenborder=1:size(yzborder,1)
            newPoints(lenborder,1)=yzborder(lenborder,1)-d/2;
            newPoints(lenborder,2)=yzborder(lenborder,2);
            newPoints(lenborder,3)=yzborder(lenborder,1)+d/2;
            newPoints(lenborder,4)=yzborder(lenborder,2);
            newPoints(lenborder,5)=yzborder(lenborder,1);
            newPoints(lenborder,6)=yzborder(lenborder,2)-d/2;
            newPoints(lenborder,7)=yzborder(lenborder,1);
            newPoints(lenborder,8)=yzborder(lenborder,2)+d/2;
        end
        
        newPoints=[newPoints(:,1),newPoints(:,2);newPoints(:,3),newPoints(:,4);newPoints(:,5),newPoints(:,6);newPoints(:,7),newPoints(:,8)];
        
        %Check if outside of the border
        for lennewPoints=1:size(newPoints,1)
            if newPoints(lennewPoints,1)>biggestz || newPoints(lennewPoints,1)<smallestz || newPoints(lennewPoints,2)>biggesty || newPoints(lennewPoints,2)<smallesty
                newPoints(lennewPoints,:)=[NaN NaN];
            else
                
            end
        end
        
        %Grid of plotted points
        combinv=[combine(:,2),combine(:,1)];
        
        
        % Collect the newPoints, make sure they are not already calculated in the initial map
        newPoints(any(isnan(newPoints),2),:)=[];
        newPoints=unique(newPoints,'rows','stable');
        newPoints(ismember(newPoints,combinv,'rows'),:)=[];
        
        %Refine the Map
        newY=zeros(length(newPoints),1);
        newZ=zeros(length(newPoints),1);
        axprob=zeros(length(newPoints),1);
        
        counter=0;
        for j=1:length(newPoints)
            newY(j)=newPoints(j,2);
            newZ(j)=newPoints(j,1);
            Yn=newPoints(j,2);
            Zn=newPoints(j,1);
            axprob(j)=testfunct_three(comb_mult,Yn,Zn,el_loc);
            counter=counter+1;
            fprintf('Running Neuron and calculating probabilities %.2f%% done\n', 100*counter/length(newPoints))
            if counter==floor(0.3*length(newPoints))||counter==floor(0.5*length(newPoints))||counter==floor(0.7*length(newPoints))||counter==floor(0.9*length(newPoints))
                fname=strcat('axprobJIfspnewProbntemp ',file_name);
                fname=char(fname);
                save(fname,'axprob');
            end
        end
        
        
        %%Interpolation to get the 1um x1um map
        %interpolate to get a 20x20 map
        
        x5=min(Yinit):d/2:max(Yinit);
        x6=min(Zinit):d/2:max(Zinit);
        
        vmint=zeros(numel(x6),numel(x5));
        
        for k=1:numel(x6)
            for l=1:numel(x5)
                vmint(k,l)=interpn(Zinit,Yinit,axonProbability,x6(k),x5(l),'linear');
            end
        end
        
        fname=strcat('axprobJIfspnewProbn ',file_name);
        fname=char(fname);
        save(fname,'axprob');
        
        
        for k=1:length(axprob)
            vmint(floor((newZ(k)-min(Zinit))/(d/2))+1,floor((newY(k)-min(Yinit))/(d/2))+1)=axprob(k);
        end
        
        fname=strcat('vmintJIfspnewProbn ',string(int16(100*neg_ratio(iter_ratio))),string(int16(curr)));
        fname=char(fname);
        save(fname,'vmint');
        
        allcoordY=sort(unique([Yinit;newY]));
        allcoordZ=sort(unique([Zinit;newZ]));
        
        x1=floor(min(allcoordY)):d/2:floor(max(allcoordY));
        x2=floor(min(allcoordZ)):d/2:floor(max(allcoordZ));
        
        
        x3=floor(min(allcoordY)):1:floor(max(allcoordY));
        x4=floor(min(allcoordZ)):1:floor(max(allcoordZ));
        vmnew=zeros(numel(x4),numel(x3));
        
        for k=1:numel(x4)
            for l=1:numel(x3)
                vmnew(k,l)=interpn(x2,x1,vmint,x4(k),x3(l),'linear');
            end
        end
        
        %pad array to get the full-sized map
        left=abs(smallesty-min(Yinit));right=abs(biggesty-max(Yinit));
        bottom=abs(smallestz-min(Zinit));top=abs(biggestz-max(Zinit));
        
        vmnew=[zeros(length(x4),int16(left)),vmnew,zeros(length(x4),int16(right))];
        vmnew=padarray(vmnew,bottom,'pre');
        vmnew=padarray(vmnew,top,'post');
        
        xpos=load('xpos.mat');
        xpos=cell2mat(struct2cell(xpos));
        ypos=load('ypos.mat');
        ypos=cell2mat(struct2cell(ypos));
        cut=roipoly(vmnew,xpos,ypos);
        vmnew=vmnew.*cut;
        
        fname=strcat('vmnewJIfspnewProbn ',file_name);
        fname=char(fname);
        save(fname,'vmnew');
        
        %     Cut out the area that is outside of the optic nerve
        
        
        
        %%Calculate the number of pixels with higher than
        %     %Calculate the area of the optic fibre in um2 (circular)
        %     area=pi*750*750;
        %
        %
        %     %Count the percentage area of probabilities >=1
        %     prob_1(iter)=(length(find(vmnew>=1))/area)*100;
        %
        %     %Count the percentage area of probabilities >=0.9
        %     prob_09(iter)=(length(find(vmnew>=0.9))/area)*100;
        %
        %     %Count the percentage area of probabilities >=0.5
        %     prob_05(iter)=(length(find(vmnew>=0.5))/area)*100;
        %
        %     %Count the percentage area of probabilities >=0.1
        %     prob_01(iter)=(length(find(vmnew>=0.1))/area)*100;
        
        
    end
end