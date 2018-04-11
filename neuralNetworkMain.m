clear; clc;

load('patterns');

arrsize = size(patterns);

DisplayPattern(patterns(1,:));

weights = zeros([arrsize(2),arrsize(2)]);

for x = 1:arrsize(1)
    v = patterns(x,:);
    weights = weights + (v'*v);
end

for x = 1:arrsize(2)
    weights(x,x) = 0;
end

choice = menu('What pattern should you add noise too?', '1','2','3','4','5');
noiselevel = input('How much noise? (Between 0 and 1)');
while noiselevel > 1 || noiselevel < 0
    noiselevel = input('Noise has to be between 0 and 1, I told you.');
end

subplot(2,2,1);
DisplayPattern(patterns(choice,:));

noisePattern = patterns(choice,:);
noisePattern = AddNoise(noisePattern, noiselevel);
subplot(2,2,2);
DisplayPattern(noisePattern);

outputVector = noisePattern*weights;
subplot(2,2,3);
DisplayPattern(outputVector);


outputVector = exp(outputVector)./(exp(outputVector) + 1);

for x = 1:length(outputVector)
    if outputVector(x) > 0.9
        outputVector(x) = 1;
    else
        outputVector(x) = -1;
    end
end

counts = [1:5];

for x = 1:length(outputVector)
    if outputVector(x) == patterns(1,x)
        counts(1) = counts(1) + 1;
    end
    if outputVector(x) == patterns(2,x)
        counts(2) = counts(2) + 1;
    end
    if outputVector(x) == patterns(3,x)
        counts(3) = counts(3) + 1;
    end
    if outputVector(x) == patterns(4,x)
        counts(4) = counts(4) + 1;
    end
    if outputVector(x) == patterns(5,x)
        counts(5) = counts(5) + 1;
    end
end

maxVectorVal = max(counts);
maxVector = find(counts == maxVectorVal);

subplot(2,2,4);
DisplayPattern(patterns(maxVector,:));

