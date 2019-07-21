%Bipolar for the raw data
%SETTINGS

%Current Amplitude
currents=[5];

%Prescribe current ratio
neg_ratio=[1 0.9 0.825 0.75 0.6 0.5 0.4 0.2 0];
pos_ratio=1-neg_ratio;

%Bipolar or monopolar?
%Bipolar=1;

%Which electrodes?
%see 'Electrode Centroid' for the names
%Cathode='J';
%Anode='I';


%Load model
tic
model=optic_seline;
toc



%% 

for cur=1:1
    for iter=1
%         clearvars -except model cur iter currents pointcount totcount neg_ratio pos_ratio neg_el pos_el
        current=currents(cur);
        %Find the location of the maximum potential as the centre point
        tic
pot=mpheval(model,'V');
toc
        coord=pot.p.*1000;
        coord=coord';
        pot=pot.d1.*1000.*currents(cur);
        max_p=max(abs(pot))   ;
        max_p_coord=coord(find(abs(pot)==max(abs(pot))),:)';
        
        biggesty=750;
        biggestz=750;
        smallesty=-750;
        smallestz=-750;
        
        
        %Calculate the firing probability. Check if they are all 0. If so, break, if not, add n and make a new box
        prob=ones();
        plotted=zeros();
        plottedprob=zeros();
        n=10;
        count=0;

        while any(prob)
            p=makebox_raw(max_p_coord,n,coord);
            for points=1:length(p)
                if p(points,1)<smallesty || p(points,1)>biggesty || p(points,2)<smallestz || p(points,2)>biggestz
                    prob(points)=0;
                    %                 runcountsumsum(points)=0;
                else
                    
                    prob(points)=testfunct_eight(model,p(points,1),p(points,2),max_p_coord,currents(cur));
                    %               runcountsumsum(points)=runcountsum;
                    
                end
                count=count+1;
                %             fire_matrix(:,:,count)=firemat;
                
                plotted(count,1)=p(points,1);
                plotted(count,2)=p(points,2);
                plottedprob(count,1)=prob(points);
            end
            %         totruncount=sum(runcountsumsum);
            fprintf('Estimating the boundary,n=%d\n', n)
            n=n+5;
        end
        %     totcount_one=sum(totruncount);
        
        %Return the points to be calculated
        Yinit=min(p(:,1)):10:max(p(:,1));
        if Yinit(1)<smallesty
            Yinit(1)=smallesty;
        end
        if Yinit(length(Yinit))>biggesty
            Yinit(length(Yinit))=biggesty;
        end
        Yinit(Yinit>biggesty)=[];
        Yinit(Yinit<smallesty)=[];
        Zinit=min(p(:,2)):10:max(p(:,2));
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
        coord_init=cat(2,Y',Z');
        coord_init=reshape(coord_init,[],2);
        coord_init(ismember(coord_init,plotted,'rows'),:)=[];
        
        Yinit=Yinit';
        fname=strcat('YinitJIf_raw_ ',string(int16(100*neg_ratio(iter))),string(int16(current)));
        %     fname=strcat('YinitJ ',string(int16(current)));
        fname=char(fname);
        save(fname,'Yinit');
        
        Zinit=Zinit';
        fname=strcat('ZinitJIf_raw_ ',string(int16(100*neg_ratio(iter))),string(int16(current)));
        fname=char(fname);
        save(fname,'Zinit');
        %%
        
        %Generate the initial map
        
        % % Load the grid containing all the value
        
        % Select the Z and Y location of the fiber.
        % IMPORTANT : the value of Z and Y must be present in the grid.
        
        % %exclude the region where the electrode is
        % Z(all([Z>=-15;Z<=15],1))=[];
        
        % Determine the location of the node of ranvier. The node length is fixed
        % (1 um) but the node-node distance is dependant on the fiber diameter
        % IMPORTANT : the fiber diameter must be in the interval [0.25,3]
        
        %     runcountsumsum=zeros();
        axonProbabilitytemp=zeros(length(coord_init),1);
        for i=1:length(coord_init)
            tic
            axonProbabilitytemp(i,1)=testfunct_eight(model,coord_init(i,1),coord_init(i,2),max_p_coord,current);
            toc
            %     runcountsumsum(i)=runcountsum;
            %     fire_matrix(:,:,count+i)=firemat;
            fprintf('Generating the initial map %.2f%% done\n', 100*i/length(coord_init))
        end
        
        fname=strcat('axonProbabilitytempJIf_raw_ ',string(int16(100*neg_ratio(iter))),string(int16(current)));
        fname=char(fname);
        save(fname,'axonProbabilitytemp');
        
        plotted=[plotted(:,:);coord_init(:,1:2)];
        plottedprob=[plottedprob;axonProbabilitytemp];
        combine=[plotted,plottedprob];
        for l=1:size(combine,1)
            if combine(l,1)>biggesty || combine(l,1)<smallesty || combine(l,2)>biggestz || combine(l,2)<smallestz
                combine(l,:)=[NaN NaN NaN];
            end
        end
        combine(any(isnan(combine),2),:)=[];
        
        fname=strcat('combineJIf_raw_ ',string(int16(100*neg_ratio(iter))),string(int16(current)));
        fname=char(fname);
        save(fname,'combine');
        
        
        axonProbability=zeros(length(Zinit),length(Yinit));
        for lplot=1:size(combine,1)
            Yindex=find(Yinit==combine(lplot,1));
            Zindex=find(Zinit==combine(lplot,2));
            axonProbability(Zindex,Yindex)=combine(lplot,3);
        end
        
        fname=strcat('axonProbabilityJIf_raw_ ',string(int16(100*neg_ratio(iter))),string(int16(current)));
        fname=char(fname);
        save(fname,'axonProbability');
        
        %interpolate to get a 20x20 map
        
        x5=min(Yinit):5:max(Yinit);
        x6=min(Zinit):5:max(Zinit);
        
        vm2=zeros(numel(x6),numel(x5));
        
        for k=1:numel(x6)
            for l=1:numel(x5)
                vm2(k,l)=interpn(Zinit,Yinit,axonProbability,x6(k),x5(l),'linear');
            end
        end
        
        
        
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
        for lenborder=1:size(yzborder,1)
            newPoints(lenborder,1)=yzborder(lenborder,1)-5;
            newPoints(lenborder,2)=yzborder(lenborder,2);
            newPoints(lenborder,3)=yzborder(lenborder,1)+5;
            newPoints(lenborder,4)=yzborder(lenborder,2);
            newPoints(lenborder,5)=yzborder(lenborder,1);
            newPoints(lenborder,6)=yzborder(lenborder,2)-5;
            newPoints(lenborder,7)=yzborder(lenborder,1);
            newPoints(lenborder,8)=yzborder(lenborder,2)+5;
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
        
        %
        % Collect the newPoints, make sure they are not already calculated in the initial map
        newPoints(any(isnan(newPoints),2),:)=[];
        newPoints=unique(newPoints,'rows','stable');
        newPoints(ismember(newPoints,combinv,'rows'),:)=[];
        pointcount(iter)=length(combinv)+length(newPoints);
        
        %% Refine the Map
        newY=zeros(length(newPoints),1);
        newZ=zeros(length(newPoints),1);
        axprob=zeros(length(newPoints),1);
        
        counter=0;
        %     runcountsumsum=zeros();
        for j=1:length(newPoints)
            newY(j)=newPoints(j,2);
            newZ(j)=newPoints(j,1);
            Yn=newPoints(j,2);
            Zn=newPoints(j,1);
            axprob(j)=testfunct_eight(model,Yn,Zn, max_p_coord(1),currents(cur));
            %         fire_matrix(:,:,count+i+j)=firemat;
            counter=counter+1;
            fprintf('Running Neuron and calculating probabilities %.2f%% done\n', 100*counter/length(newPoints))
            if counter==floor(0.3*length(newPoints))||counter==floor(0.5*length(newPoints))||counter==floor(0.7*length(newPoints))||counter==floor(0.9*length(newPoints))
                fname=strcat('axprobJIf_raw_temp ',string(int16(100*neg_ratio(iter))),string(int16(current)));
                fname=char(fname);
                save(fname,'axprob');
            end
        end
        %     totcount_three=sum(runcountsumsum);
        %     totcount(iter)=totcount_one+totcount_two+totcount_three;
        
        fname=strcat('axprobJIf_raw_ ',string(int16(100*neg_ratio(iter))),string(int16(current)));
        fname=char(fname);
        save(fname,'axprob');
        %     save('firematrix.mat','fire_matrix');
        for k=1:length(axprob)
            vm2(floor((newZ(k)-min(Zinit))/5)+1,floor((newY(k)-min(Yinit))/5)+1)=axprob(k);
        end
        
        fname=strcat('vmtwoJIf_raw_ ',string(int16(100*neg_ratio(iter))),string(int16(current)));
        fname=char(fname);
        save(fname,'vm2');
        
        allcoordY=sort(unique([Yinit;newY]));
        allcoordZ=sort(unique([Zinit;newZ]));
        
        x1=floor(min(allcoordY)):5:floor(max(allcoordY));
        x2=floor(min(allcoordZ)):5:floor(max(allcoordZ));
        
        
        x3=floor(min(allcoordY)):1:floor(max(allcoordY));
        x4=floor(min(allcoordZ)):1:floor(max(allcoordZ));
        vmnew=zeros(numel(x4),numel(x3));
        
        for k=1:numel(x4)
            for l=1:numel(x3)
                vmnew(k,l)=interpn(x2,x1,vm2,x4(k),x3(l),'linear');
            end
        end
        
        %pad array
        left=ceil(abs(smallesty-min(Yinit)));right=ceil(abs(biggesty-max(Yinit)));
        bottom=ceil(abs(smallestz-min(Zinit)));top=ceil(abs(biggestz-max(Zinit)));
        
        vmnew=[zeros(length(x4),int16(left)),vmnew,zeros(length(x4),int16(right))];
        vmnew=padarray(vmnew,bottom,'pre');
        vmnew=padarray(vmnew,top,'post');
        
        fname=strcat('vmnewJIf_raw_ ',string(int16(100*neg_ratio(iter))),string(int16(current)));
        fname=char(fname);
        save(fname,'vmnew');
        
        %     Cut out the area that is outside of the optic nerve
            	xpos=load('xpos.mat');
                xpos=cell2mat(struct2cell(xpos));
            	ypos=load('ypos.mat');
                ypos=cell2mat(struct2cell(ypos));
            	cut=roipoly(vmnew,xpos,ypos);
            	vmnew=vmnew.*cut;
        %
        %     %Calculate the area of the optic fibre in um2 (circular)
        %     area=pi*750*750;
        %
        %     %Calculate the area of the optic fibre in um2 (elliptical)
        %     % area=pi*1675*1325*0.25;
        %     prob_1=zeros(length(neg_ratio),1);
        %     prob_09=zeros(length(neg_ratio),1);
        %     prob_05=zeros(length(neg_ratio),1);
        %     prob_01=zeros(length(neg_ratio),1);
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