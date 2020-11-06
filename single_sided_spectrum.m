function [F, X] = single_sided_spectrum(x,fs,timeSpan)
nSamples = fs*timeSpan;     % number of recorded samples
df = fs/nSamples;           % frequency resolution
fSpan = df:df:fs;           
F = fSpan(1:end/2);         % all frequencies represented in the fft
X_full = abs(fft(x));
X = X_full(1:length(F));    % only use half of the fft
end

