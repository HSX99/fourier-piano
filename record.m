function x = record(timeSpan, fs)
%RECORD Summary of this function goes here
% Detailed explanation goes here
% Settings
x = audiorecorder(fs, 16, 1);
disp('Start speaking.')
recordblocking(x, timeSpan);
disp('End of Recording.');
x = getaudiodata(x);
end

