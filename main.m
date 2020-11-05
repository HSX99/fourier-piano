clear all

timeSpan = 6;
fs = 4000;
nSamples = fs*timeSpan;

%%
x = record(timeSpan, fs);

%%
timeWindow = 0.4;
windowOverlap = 0.3;
nSamplesWindow = fs*timeWindow;
nWindows = floor((nSamples-(nSamplesWindow*windowOverlap))/(nSamplesWindow*(1-windowOverlap)));

allFFTWindows = nan(nWindows,nSamplesWindow/2);

for i = 1:nWindows
    a = floor((i-1)*nSamplesWindow*(1-windowOverlap)+1);
    b = a + nSamplesWindow - 1;
    xWindowed = x(a:b).*hamming(nSamplesWindow);
    [F,X] = single_sided_spectrum(xWindowed,fs,timeWindow);
    allFFTWindows(i,:) = X;
end

limits = 1e3.*[0.2538, 1.08];
above = F > limits(1);
below = F < limits(2);
inPianoRange = bitand(above, below);
F = F(inPianoRange);
allFFTWindows = allFFTWindows(:,inPianoRange==1);
maxFFT = max(allFFTWindows(:));
%%
h = figure;
filename = 'animation.gif';
for i = 1:nWindows
    X = allFFTWindows(i,:);
    % plot_piano(F,X,maxFFT,limits)
    make_gif(h,F,X,maxFFT,limits,i,filename);
    % pause(0.01)
end



