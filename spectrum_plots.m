
timeSpan = 3;
fs = 4000;
nSamples = fs*timeSpan;

x = record(timeSpan, fs);
%%

x = x.*hamming(length(x));
[F,X] = single_sided_spectrum(x,fs,timeSpan);
%% 
x0=100;
y0=100;
width=2*550;
height=400;

peaks = 262.4.*(1:4);
a = [2.6, 0, -1.8, -1.8];
c_octave_labels = {'C1','C2','C3','C4','C5','C6'};

figure; plot(F,log(X))
hold on
plot(peaks, a, 'o', 'MarkerSize', 14, 'LineWidth', 3)
hold off
c_octaves = 16.4.*(2.^(1:6)); % octaves of C
xticks(c_octaves); xticklabels(c_octave_labels);
ylabel("Power (dB)")
set(gcf,'units','points','position',[x0,y0,width,height])
saveas(gcf,'c-linear-freq.png')
%%
figure; plot(log(F),log(X))
hold on
plot(log(peaks), a, 'o', 'MarkerSize', 14, 'LineWidth', 3)
hold off
c_octaves = log(16.4.*(2.^(1:6))); xticklabels(c_octave_labels);
xticks(c_octaves) 
xticklabels({'C1','C2','C3','C4','C5','C6','C7'})
ylabel("Power (dB)")
set(gcf,'units','points','position',[x0,y0,width,height])
saveas(gcf,'c-log-freq.png')
%%
figure;
logX = log(X);
logX = (logX-min(logX));
logX = logX./max(logX);
plot_piano(F,logX)
hold on
plot(log(peaks), [0.99, 0.78, 0.63, 0.63], 'o', 'MarkerSize', 14, 'LineWidth', 3)
hold off
set(gcf,'units','points','position',[x0,y0,width,height])
saveas(gcf,'c-piano.png')


