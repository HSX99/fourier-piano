function [] = plot_piano(frequencies,powerSpectrum)
%PLOT_PIANO Summary of this function goes here
%   Detailed explanation goes here

[notes,whiteKeysIndexes,blackKeysIndexes] = piano_info();

% Plot Piano
A = 1.2 .* max(powerSpectrum);
% A = 1.5;
clf
hold on
f_min = 0.2535e3;    
f_max = 1.08e3;

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

plot(log(frequencies),powerSpectrum,'color','r', 'Linewidth', 3)
ylim([0, A])

c_octaves = log(16.4.*(2.^(1:6))); % octaves of C
xticks(c_octaves) 
xticklabels({'C1','C2','C3','C4','C5','C6'})

xlim(log([f_min, f_max]))
% xlim([c_octaves(1), c_octaves(end)])
yticks([])
hold off
end

