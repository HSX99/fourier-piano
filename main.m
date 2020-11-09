
%% recording
timeSpan = 5;
fs = 8192;
x = record(timeSpan, fs); % record voice
timeWindow = 0.2;
windowOverlap = 0.3;    % overlap between consecutive windows (0 = no overlap, etc.)
low_c = 3;  % lowest c shown on the piano
high_c = 5; % highest c shown on the piano

%% train
load('train.mat');
fs = Fs;    % the sampling frequency of the sound 
x = y;      % the signal
timeWindow = 0.2;
windowOverlap = 0.3;    % overlap between consecutive windows (0 = no overlap, etc.)
low_c = 5;  % lowest c shown on the piano
high_c = 7; % highest c shown on the piano

%% intel
[x,fs] = audioread('sounds/intel-sound-logo.mp3');
x = mean(x,2);  % naive stereo -> mono
% sound(x,fs)
timeWindow = 0.12;       % seconds per window
windowOverlap = 0.3;    % overlap between consecutive windows (0 = no overlap, etc.)
low_c = 4;  % lowest c shown on the piano
high_c = 5; % highest c shown on the piano

%%

[F, allFFTWindows,nWindows] = split2windows(x, fs, timeWindow,windowOverlap); % divide signal into windows and perform FFT on each window
nOctaves = high_c - low_c;
delta = 0.51; %  extra space to show the left and rightmost keys completely on the piano
C0 = 16.4;  % frequency of bottom C
freq_limits = [(C0-delta)*2.^low_c, (C0+delta)*2.^high_c];

maxFFT = max_in_range(allFFTWindows,F,freq_limits); % used for scaling the piano background

h = figure;
% filename = 'gifs/intel.gif';

for i = 1:nWindows
    X = allFFTWindows(i,:);
    plot_piano(F,X,maxFFT,freq_limits,nOctaves)
    % make_gif(h,F,X,maxFFT,freq_limits,nOctaves,i,filename);
    pause(0.01)
end

