function [F,allFFTWindows,nWindows] = split2windows(x,fs,timeWindow,windowOverlap)
nSamples = length(x);
nSamplesWindow = round(fs*timeWindow/2)*2; % even number of samples
nWindows = floor((nSamples-(nSamplesWindow*windowOverlap))/(nSamplesWindow*(1-windowOverlap)));

nSamples = round(((nWindows-1)*(1-windowOverlap) + 1)*nSamplesWindow + 1); % update length of x, NEEDS FIXING??

x = x(1:nSamples);

% allWindows = nan(nWindows,nSamplesWindow);
allFFTWindows = nan(nWindows,nSamplesWindow/2); % allocate
for i = 1:nWindows
    a = floor((i-1)*nSamplesWindow*(1-windowOverlap)+1);
    b = a + nSamplesWindow - 1;
    xWindowed = x(a:b).*hamming(nSamplesWindow);
        
    [F,X] = single_sided_spectrum(xWindowed,fs,timeWindow);
    
    % allWindows(i,:) = xWindowed;
    allFFTWindows(i,:) = X;
end

end

