function c0 = tuning(a4)
    % a4 = e.g. 440 or 442
    % NOTE_ABOVE_RATIO = 2^(1/12);    
    NOTE_BELOW_RATIO = 2^(-1/12); % factor between adjecent keys

    % c0 is 9 semitones below a0
    c0 = (a4/16)*NOTE_BELOW_RATIO^(9);

    % fs = 44100;
    % n_sec = 1;
    % t = (1:(n_sec*fs))./fs;
    % sound(sin(2*pi*a4*t),fs)
    % pause(n_sec)
end