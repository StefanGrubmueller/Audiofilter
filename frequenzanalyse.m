% Name: Stefan Grubmüller 03 5BHEL
% Datum: 29.01.21

% Frequenzanalyse
% function:
% 	Analysiert ein Audiofile
% parameter:
% 	audiofile...zu analysierende audioile
% 	tstart...Startpunkt der Analyse
% 	duration....Länge der Analyse
function [] = frequenzanalyse(audiofile, tstart, duration)

    frequenzbereich = [0 2e3];

    % File wird in den Vektor eingelesen 
	% y=Abgetastete Punkte 
	% Fs=Abtastfrequenz
    [y, Fs] = audioread(audiofile);
    
    file_duration = length(y) / Fs;
    % Start/Stop-Index für neuen Ausschnitts
    % Start- und Endwerte für normiertes Signal
    tstop= tstart + duration;
    i_start = Fs * tstart;
    i_stop = Fs * tstop;

    y_new = y(i_start+1:i_stop+1);
    % Normierung des neuen Ausschnittes
    y_max = abs(max(y_new));
    y_min = abs(min(y_new));
    m = max([y_max, y_min]);
    n = y_new./m;   %Normiertes Signal
  
	% Frequenzanalyse
    t = tstart:1/Fs:tstart+((length(y_new)-1)*1/Fs);
    
    % Hanningfester gewählt weil geringster Leakageeffekt
    [S, f] = spektrum(n, Fs, 'hanning', 1);
	
    % Analyse im Zeitbereich
    figure(1);
    plot(t, n);
    xlim([tstart, tstop]);
    xlabel("Zeit [s]");
    ylabel("Amplitude [1]");
	
    % Analyse im Frequenzbereich - Diagram 2
    figure(2);
    plot(f, S);
    xlabel("Frequenz[Hz]");
    ylabel("Spektrum");
    xlim(frequenzbereich); 
end