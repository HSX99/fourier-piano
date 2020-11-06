function maxFFT = max_in_range(allFFTWindows,F, limits)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
above = F > limits(1); 
below = F < limits(2);
inPianoRange = bitand(above, below);
allFFTWindows__ = allFFTWindows(:,inPianoRange==1);
maxFFT = max(allFFTWindows__(:));
end

