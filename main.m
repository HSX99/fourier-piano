
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
timeWindow = 0.12;       % seconds per window
windowOverlap = 0.3;    % overlap between consecutive windows (0 = no overlap, etc.)
low_c = 4;  % lowest c shown on the piano
high_c = 5; % highest c shown on the piano


%%
sound(x,fs)

%%
[F, allFFTWindows,nWindows] = split2windows(x, fs, timeWindow,windowOverlap); % divide signal into windows and perform FFT on each window

maxFFT = max_in_range(allFFTWindows,F,low_c,high_c); % used for scaling the piano background
%%
display_sequence(F,allFFTWindows,maxFFT,low_c,high_c)

%%
make_gif(F,allFFTWindows,maxFFT,low_c,high_c,'test-new.gif')




