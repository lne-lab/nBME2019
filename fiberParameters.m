function [ diameterRanvier, nodenodelength ] = fiberParameters( d )
%FIBERPARAMETERS Value taken from Li 2013
%   Detailed explanation goes here


diameterRanvier = 0.13*d+1.15;
nodenodelength = 76.5*d+53;

end

