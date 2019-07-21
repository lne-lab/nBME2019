function [ X,P,idx1,idx2 ] = getFiberValues( on, Y, Z)
%GETFIBERVALUES Summary of this function goes here
%   Detailed explanation goes here

idx1 = find(abs(on(:,2)-Y) < 1e-2);
idx2 = find(abs(on(:,3)-Z) < 1e-2);

idx = intersect(idx1,idx2);

X = on(idx,1);
P = on(idx,4);


end

