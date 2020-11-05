function [] = plot_piano(F,X)
%PLOT_PIANO Summary of this function goes here
%   Detailed explanation goes here

[notes,whiteKeysIndexes,blackKeysIndexes] = piano_info();

% Plot Piano
A = 1.2 .* max(X);
clf
hold on
for i = 1+1:60-1
    index = whiteKeysIndexes(i);
    prev_note = notes(index-1);
    note = notes(index);
    next_note = notes(index+1);
    % area(log([mean([prev_note, note]), mean([note, next_note])]), [A, A], 'FaceColor', 'w')
    area([mean([prev_note, note]), mean([note, next_note])], [A, A], 'FaceColor', 'w')
end

for i = 1+1:42-1
    index = blackKeysIndexes(i);
    prev_note = notes(index-1);
    note = notes(index);
    next_note = notes(index+1);    
    % area(log([mean([prev_note, note]), mean([note, next_note])]), [A, A], 'FaceColor', 'k')
    area([mean([prev_note, note]), mean([note, next_note])], [A, A], 'FaceColor', 'k')
end

% plot(log(F),X,'color','r', 'Linewidth', 3)
plot(F,X,'color','r', 'Linewidth', 3)
% xlim([4 7])
xlim(exp([4 7]))
hold off

end

