function [] = plot_piano(maxFFT,low,high,A)
    % plots the piano backdrop in the active figure
    % maxFFT: the maximum amplitude, sets the y-limit of the piano plot
    % low, high: the lowest and highest octave to be displayed
    % A: the tuning of the piano, e.g. 442 Hz
    
    NOTE_ABOVE_RATIO = 2^(1/12);    % factor of adjecent piano keys
    NOTE_BELOW_RATIO = 2^(-1/12);
    HALFWAY_ABOVE_FACTOR = (1 + NOTE_ABOVE_RATIO)/2;    % upper edge of piano key
    HALFWAY_BELOW_FACTOR = (1 + NOTE_BELOW_RATIO)/2;    % lower edge of piano key

    c0 = (A/16)*NOTE_BELOW_RATIO^(9);

    f_min = c0.*(2.^low)*HALFWAY_BELOW_FACTOR;
    f_max = c0.*(2.^high)*HALFWAY_ABOVE_FACTOR;

    [notes,whiteKeysIndexes,blackKeysIndexes] = piano_info(A);
    yMax = 1.2*maxFFT;

    % plot the white keys
    for i = 1:length(whiteKeysIndexes)

        note = notes(whiteKeysIndexes(i));

        if (note > f_min) && (note < f_max)
            area(log(note.*[HALFWAY_BELOW_FACTOR, HALFWAY_ABOVE_FACTOR]), [yMax, yMax], 'FaceColor', 'w')
        end
    end

    % plot the black keys
    for i = 1:length(blackKeysIndexes)

        note = notes(blackKeysIndexes(i));

        if (note >= f_min) && (note <= f_max)
            area(log(note.*[HALFWAY_BELOW_FACTOR, HALFWAY_ABOVE_FACTOR]), [yMax, yMax], 0, 'FaceColor', 'k')
        end

    end

    % set limits, tick label font size and figure size

    xlim(log([f_min, f_max]))
    ylim([0, yMax])

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

