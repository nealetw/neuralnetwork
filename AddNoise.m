function [ noiseVec ] = AddNoise( numVec, prob )
%ADDNOISE - randomly mutates an image vector by inverting pixels
% Black pixels have value of -1
% White pixels have value of +1
% Prob is the % noise to be added, higher numbers result in more noise

noiseVec = numVec;
for k = 1:length(numVec)
    if rand < prob
        noiseVec(k) = -noiseVec(k);
    end
end

end

