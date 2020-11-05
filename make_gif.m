function [] = make_gif(h,F,X,maxFFT,limits,i,filename)
axis tight manual % this ensures that getframe() returns a consistent size

plot_piano(F,X,maxFFT,limits)
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

end
