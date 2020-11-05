timeSpan = 5;
timeWindow = 1;
fs = 5000;
n_windows = floor(timeSpan/timeWindow);
nSamples = fs*timeWindow;

x = record(timeSpan, fs);
h = figure;
for i = 1:n_windows
    x_window = x((i-1)*nSamples+1:i*nSamples);
            
    [F,X] = single_sided_spectrum(x_window,fs,timeWindow);
    
    % plot_piano(F,X)
    make_gif(h,F,X,i);
        
end



