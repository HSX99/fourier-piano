function [] = display_sequence(F,allFFTWindows,maxFFT,c_low,c_high)
[nWindows, ~] = size(allFFTWindows);
h = figure;
hold on
axis tight manual % this ensures that getframe() returns a consistent size

plot_piano(maxFFT,c_low,c_high);    % plot piano backdrop

for i = 1:nWindows
    X = allFFTWindows(i,:);
    fft_win = plot(log(F),X,'color','r', 'Linewidth', 3);
    drawnow 
    pause(0.4)
    delete(fft_win)     % delete current fft from plot
end
hold off
end
