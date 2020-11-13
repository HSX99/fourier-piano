function [] = plot_sequence(F,allFFTWindows,maxFFT,c_low,c_high,A,pause_time)
[nWindows, ~] = size(allFFTWindows);

figure; hold on; 
axis tight manual % this ensures that getframe() returns a consistent size

plot_piano(maxFFT,c_low,c_high,A);    % plot piano backdrop

for i = 1:nWindows
    X = allFFTWindows(i,:);
    fft_win = plot(log(F),X,'color','r', 'Linewidth', 3);
    drawnow 
    pause(pause_time)
    if i < nWindows
        delete(fft_win)     % delete current fft from plot
    end
end
hold off
end
