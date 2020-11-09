function [] = plot_piano(frequencies,fftVec,fftMax,freqLimits,nOctaves)
%PLOT_PIANO Summary of this function goes here
%   Detailed explanation goes here

[notes,whiteKeysIndexes,blackKeysIndexes] = piano_info();

A = 1.2*fftMax;
clf
hold on
f_min = freqLimits(1);
f_max = freqLimits(2);

for i = 1+1:60-1
    index = whiteKeysIndexes(i);
    note = notes(index);
    if (note > f_min) && (note < f_max)
        beginKey = mean([notes(index-1), note]);
        endKey = mean([note, notes(index+1)]);
        area(log([beginKey, endKey]), [A, A], 'FaceColor', 'w')
    end
end

for i = 1+1:42-1
    index = blackKeysIndexes(i);
    note = notes(index);
    if (note >= f_min) && (note <= f_max)
        beginKey = mean([notes(index-1), note]);
        endKey = mean([note, notes(index+1)]);
        area(log([beginKey, endKey]), [A, A], 0, 'FaceColor', 'k')
    end

end

plot(log(frequencies),fftVec,'color','r', 'Linewidth', 3)

xlim(log([f_min, f_max]))
ylim([0, A])

c_octaves = log(16.4.*(2.^(1:8))); % octaves of C
xticks(c_octaves) 
xticklabels({'C1','C2','C3','C4','C5','C6','C7','C8'})
yticks([])

x0=100;y0=100;
width=550*nOctaves;
height=400;

a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',16)

set(gcf,'units','points','position',[x0,y0,width,height])
hold off

end

