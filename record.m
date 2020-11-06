function x = record(timeSpan, fs)
%RECORD Summary of this function goes here
% Detailed explanation goes here
% Settings
x = audiorecorder(fs, 16, 1);
disp('RECORDING')
recordblocking(x, timeSpan);
disp('RECORDING FINISHED');
x = getaudiodata(x);
end

