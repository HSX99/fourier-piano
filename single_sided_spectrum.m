function [F, X] = single_sided_spectrum(x,fs,timeSpan)
%SINGLE_SIDED_SPECTRUM Summary of this function goes here
%   Detailed explanation goes here
% Fouriertransform
nSamples = fs*timeSpan;
df = fs/nSamples;   % resolution in frequency
fSpan = df:df:fs;
F = fSpan(1:end/2);
%X_full = 20*log(abs(fft(x)));   %
X_full = abs(fft(x));
X = X_full(1:length(F));    % only use half of the fft
end

