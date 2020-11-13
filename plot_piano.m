function [] = plot_piano(maxFFT,low,high,A)
%PLOT_PIANO
NOTE_ABOVE_RATIO = 2^(1/12);    % factor of adjecent keys
NOTE_BELOW_RATIO = 2^(-1/12);
HALFWAY_ABOVE_FACTOR = (1 + NOTE_ABOVE_RATIO)/2;
HALFWAY_BELOW_FACTOR = (1 + NOTE_BELOW_RATIO)/2;
f_min = 16.4.*(2.^low)*HALFWAY_BELOW_FACTOR;
f_max = 16.4.*(2.^high)*HALFWAY_ABOVE_FACTOR;


[notes,whiteKeysIndexes,blackKeysIndexes] = piano_info(A);
A = 1.2*maxFFT;

% plot the white keys
for i = 1:length(whiteKeysIndexes)
    
    note = notes(whiteKeysIndexes(i));
    
    if (note > f_min) && (note < f_max)
        area(log(note.*[HALFWAY_BELOW_FACTOR, HALFWAY_ABOVE_FACTOR]), [A, A], 'FaceColor', 'w')
    end
end

% plot the black keys
for i = 1:length(blackKeysIndexes)
    
    note = notes(blackKeysIndexes(i));
    
    if (note >= f_min) && (note <= f_max)
        area(log(note.*[HALFWAY_BELOW_FACTOR, HALFWAY_ABOVE_FACTOR]), [A, A], 0, 'FaceColor', 'k')
    end

end

% set limits, tick label font size and figure size

xlim(log([f_min^(0.999), f_max^(1/0.9999)]))    %
ylim([0, A])

c_octaves = log(16.4.*(2.^(0:8))); % octaves of C
xticks(c_octaves) 
xticklabels({'C0','C1','C2','C3','C4','C5','C6','C7','C8'})
yticks([])

a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',16)

x0=100;
y0=100;
width=min([550*2,550*(high-low)]);
height=400;
set(gcf,'units','points','position',[x0,y0,width,height])

end

