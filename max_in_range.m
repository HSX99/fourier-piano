function maxFFT = max_in_range(allFFTWindows,F,low,high)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
NOTE_ABOVE_RATIO = 2^(1/12);    % factor of adjecent keys
NOTE_BELOW_RATIO = 2^(-1/12);
HALFWAY_ABOVE_FACTOR = (1 + NOTE_ABOVE_RATIO)/2;
HALFWAY_BELOW_FACTOR = (1 + NOTE_BELOW_RATIO)/2;
f_min = 16.4.*(2.^low)*HALFWAY_BELOW_FACTOR;
f_max = 16.4.*(2.^high)*HALFWAY_ABOVE_FACTOR;
above = F > f_min; 
below = F < f_max;
inPianoRange = bitand(above, below);
allFFTWindows__ = allFFTWindows(:,inPianoRange==1);
maxFFT = max(allFFTWindows__(:));
end

