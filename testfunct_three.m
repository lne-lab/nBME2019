
function axonProbability=testfunct_three(data,Y,Z,el_loc)

data = comb_mult;
Y = p(points,1);
Z = p(points,2);


%% Use main3.hoc, optimisation done in MATLAB
fiberDiameter = 0.25:0.25:3;
% fiberDiameter = 0.25:0.25:3;

nodeLength = 1;
[nodeDiameter, nodeToNodeDistance] = fiberParameters(fiberDiameter);
internodeLength = nodeToNodeDistance - nodeLength;


longAxis = 1500;
shortAxis = 1500;
totalLength = 5000;

percentage_shift=[0:0.1:0.5];

turn = 1;

save par_fibDiam.txt fiberDiameter -ascii
save par_ntnlengths.txt nodeToNodeDistance -ascii
save par_ndiam.txt nodeDiameter -ascii

el_centroid=el_loc(1);
%     fiberProb = [1.56,13.2,27.5,21.4,13.125,8.61,5.43,3.51,1.91,1.28,0.59,0.48]./100;
fiberProb=[0.0688    0.3843    0.2475    0.1330    0.0719    0.0397    0.0245    0.0142    0.0080    0.0042    0.0024    0.0014];

tic 
[X,P] = getFiberValues(data,Y,Z);
toc
tempProb = zeros(length(fiberDiameter),length(percentage_shift));

for i=[1,12] %choose which fibre diameters
    
    for n=[1,6]%Choose which shift
        xnode = [el_centroid:nodeToNodeDistance(i):2500,el_centroid:-nodeToNodeDistance(i):-2500];
        xnode = sort(unique(xnode));
        numberofnode(i) = length(xnode);
        shift=percentage_shift.*nodeToNodeDistance(i);
        save par_nnodes.txt numberofnode -ascii
        %     shift=pshift;
        fiberProb = [1.56,13.2,27.5,21.4,13.125,8.61,5.43,3.51,1.91,1.28,0.59,0.48]./100;
        %         fiberProb=[0.0688    0.3843    0.2475    0.1330    0.0719    0.0397    0.0245    0.0142    0.0080    0.0042    0.0024    0.0014];
        tic
        v = interp1(X,P,(xnode-shift(n))','linear','extrap');
        t(i,n)=toc
        dlmwrite(sprintf('v_%d.txt',i-1),v,'\t')
        timestop='15,';
        amplitude='1,'; %Set current amplitude
        nFib=string(i-1);
        batch=strcat(' "batchrun(',timestop,amplitude,nFib,')"');
        syscall=char(strcat('C:\nrn\bin\nrniv.exe -nobanner main3.hoc -c ',batch,' -c "quit()"'));
        [status,result]=system(syscall);
        run = load('run.dat');
        tempProb(i,n)=run;
    end
end
stop=zeros(1,6);

%% Use main2.hoc, optimisation done in NEURON
while ~any(stop)
    %
    if tempProb(12,1)==tempProb(1,6)==tempProb(12,6)==tempProb(1,1)
        tempProb(:,:)=tempProb(12,1);
        stop(1:6)=1;
    end
    
    if tempProb(1,1)==tempProb(12,1)
        tempProb(:,1)=tempProb(1,1);
        stop(1)=1;
    end
    
    if tempProb(1,6)==tempProb(12,6)
        tempProb(:,6)=tempProb(1,6);
        stop(6)=1;
    end
    
    col=percentage_shift(logical(~stop));
    
    for j=1:length(col)
        for i = 1:length(numberofnode)
            xnode = [el_centroid:nodeToNodeDistance(i):2500,el_centroid:-nodeToNodeDistance(i):-2500];
            xnode = sort(unique(xnode));
            shift=col*nodeToNodeDistance(i);
            numberofnode(i) = length(xnode);
            v = interp1(X,P,(xnode-shift(j))','linear','extrap');
            dlmwrite(sprintf('v_%d.txt',i-1),v,'\t')
        end
        save par_nnodes.txt numberofnode -ascii
        
        [status,result]=system('C:\nrn\bin\nrniv.exe -nobanner main22.hoc -c "batchrun(15,1)" -c "quit()"');
        tempProb(:,find(percentage_shift==col(j))) = load('run.dat');
        stop(find(percentage_shift==col(j)))=1;
    end
    
    areaFrac = (fiberDiameter.^2)./(longAxis*shortAxis/4);
    maxProb=sum(fiberProb.*areaFrac)*6;
    axonProbability = sum(fiberProb.*areaFrac*tempProb)/maxProb;
    %     axonProbability = sum(sum(tempProb))/(45*31);
end