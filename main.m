 
% timeSpan = 6;
% fs = 8192;
% x = record(timeSpan, fs); % record voice

load('train.mat');
fs = Fs;    % the sampling frequency of the sound 
x = y;      % the signal

[F, allFFTWindows,nWindows] = split2windows(x, fs); % divide signal into windows

low_c = 5;  % lowest c shown on the piano
high_c = 7; % highest c shown on the piano
delta = 0.51; %  extra space to show the left and rightmost keys completely on the piano
C0 = 16.4;  % frequency of bottom C
freq_limits = [(C0-delta)*2.^low_c, (C0+delta)*2.^high_c];

maxFFT = max_in_range(allFFTWindows,F,freq_limits); % used for scaling the piano background

h = figure;
filename = 'gifs/gif-name.gif';

for i = 1:nWindows
    X = allFFTWindows(i,:);
    plot_piano(F,X,maxFFT,freq_limits)
    % make_gif(h,F,X,maxFFT,freq_limits,i,filename);
    pause(0.01)
end

