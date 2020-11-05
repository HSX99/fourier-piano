clear all

timeSpan = 5;
fs = 4000;
nSamples = fs*timeSpan;

%%
x = record(timeSpan, fs);

%%
timeWindow = 0.4;
windowOverlap = 0.3;
nSamplesWindow = fs*timeWindow;
% nWindows = floor(timeSpan/timeWindow);
nWindows = floor((nSamples-(nSamplesWindow*windowOverlap))/(nSamplesWindow*(1-windowOverlap)));

h = figure;
for i = 1:nWindows
    a = floor((i-1)*nSamplesWindow*(1-windowOverlap)+1);
    b = a + nSamplesWindow - 1;
    xWindowed = x(a:b).*hamming(nSamplesWindow);
    xWnorm = xWindowed./norm(xWindowed);
    [F,X] = single_sided_spectrum(xWnorm,fs,timeWindow);
    % plot_piano(F,X)
    make_gif(h,F,X,i);
    % pause(0.01)
end



