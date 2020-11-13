

%% recording
timeSpan = 5;
fs = 8192;
x = record(timeSpan, fs); % record voice
timeWindow = 0.2;
windowOverlap = 0.3;    % overlap between consecutive windows (0 = no overlap, etc.)
low_c = 3;  % lowest c shown on the piano
high_c = 5; % highest c shown on the piano

%% train
A = 440;
load('train.mat');
fs = Fs;    % the sampling frequency of the sound 
x = y;      % the signal
timeWindow = 0.2;
windowOverlap = 0.3;    % overlap between consecutive windows (0 = no overlap, etc.)
low_c = 5;  % lowest c shown on the piano
high_c = 7; % highest c shown on the piano
frameTime = timeWindow*(1-windowOverlap);

%% intel
[x,fs] = audioread('sounds/intel-sound-logo.mp3');
x = mean(x,2);  % naive stereo -> mono
timeWindow = 0.12;       % seconds per window
windowOverlap = 0.3;    % overlap between consecutive windows (0 = no overlap, etc.)
low_c = 4;  % lowest c shown on the piano
high_c = 5; % highest c shown on the piano

%% twin peaks
% set tuning convention, e.g. 435, 440, 442
A = 440;
% [x,fs] = audioread('sounds/twin-peaks-theme.mp3',44100.*[1.0, 7.15]);
[x,fs] = audioread('sounds/twin-peaks-theme.mp3',[46100, 331900]);  % wamp
x = mean(x,2);  % naive stereo -> mono
timeWindow = 0.24;       % seconds per window
windowOverlap = 0.1;    % overlap between consecutive windows (0 = no overlap, etc.)
low_c = 2;  % lowest c shown on the piano
high_c = 6; % highest c shown on the piano
frameTime = timeWindow*(1-0.1);

%% Simon Åkesson's Gbmaj7#9#11no3
A = 442;
% [x,fs] = audioread('sounds/Gbmaj7#9#11no3.mp3');  %
[x,fs] = audioread('sounds/Gbmaj7#9#11no3.mp3', [4.15e5, 5.8e5]);  %
x = mean(x,2);  % naive stereo -> mono

% timeWindow = 0.2;       % seconds per window
timeWindow = 0.3*length(x)/fs;       % seconds per window
windowOverlap = 0.9;    % overlap between consecutive windows (0 = no overlap, etc.)
low_c = 2;  % lowest c shown on the piano
high_c = 5; % highest c shown on the piano
frameTime = 5; %timeWindow*(1-windowOverlap);

%%
sound(x,fs)

%%
[F, allFFTWindows,nWindows] = split2windows(x, fs, timeWindow,windowOverlap); % divide signal into windows and perform FFT on each window

maxFFT = max_in_range(allFFTWindows,F,low_c,high_c); % used for scaling the piano background
%%
plot_sequence(F,allFFTWindows,maxFFT,low_c,high_c,A,frameTime)

%%
make_gif(F,allFFTWindows,maxFFT,low_c,high_c,A,'gifs/train.gif')

%%
plot_sequence(F,allFFTWindows,maxFFT,low_c,high_c,A,1)
saveas(gcf,'pngs/chord.png')




