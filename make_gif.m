function [] = make_gif(F,allFFTWindows,maxFFT,c_low,c_high,A,filename)
[nWindows, ~] = size(allFFTWindows);

h = figure;
hold on
axis tight manual % this ensures that getframe() returns a consistent size

plot_piano(maxFFT,c_low,c_high,A);    % plot piano backdrop

for i = 1:nWindows
    X = allFFTWindows(i,:);
    fft_win = plot(log(F),X,'color','r', 'Linewidth', 3);
    drawnow 
    % Capture the plot as an image 
    frame = getframe(h); 
    im = frame2im(frame); 
    [imind,cm] = rgb2ind(im,256); 
    % Write to the GIF File 
    if i == 1 
      imwrite(imind,cm,filename,'gif', 'Loopcount',inf); 
    else 
      imwrite(imind,cm,filename,'gif','WriteMode','append'); 
    end 
    delete(fft_win)     % delete current fft from plot
end
hold off

end
