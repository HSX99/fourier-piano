function [F,allFFTWindows,nWindows] = split2windows(x, fs)
timeWindow = 0.4;       % seconds per window
windowOverlap = 0.3;    % overlap between consecutive windows (0 = no overlap, etc.)

nSamples = length(x);

nSamplesWindow = round(fs*timeWindow/2)*2; %

nWindows = floor((nSamples-(nSamplesWindow*windowOverlap))/(nSamplesWindow*(1-windowOverlap)));

nSamples = ((nWindows-1)*(1-windowOverlap) + 1)*nSamplesWindow; % update length of x
x = x(1:nSamples);

allFFTWindows = nan(nWindows,nSamplesWindow/2);

for i = 1:nWindows
    a = floor((i-1)*nSamplesWindow*(1-windowOverlap)+1);
    b = a + nSamplesWindow - 1;
    xWindowed = x(a:b).*hamming(nSamplesWindow);
    [F,X] = single_sided_spectrum(xWindowed,fs,timeWindow);
    allFFTWindows(i,:) = X;
end

end

