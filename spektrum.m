% Name: Stefan Grubmüller 03 5BHEL
% Datum: 29.01.21

% spektrum
% function:
%	Liefert je nach Fenster ein lineares / logarithmisches Spektrum
% parameter:
% 	S -> Spektrum (auf fs/2 beschränkt)                                                                 
% 	f -> Frequenzvektor zur Ausgabe
%
% 	s -> Zeitsignal                                                              
% 	fs-> Abtastrate des Zeitsignales                                  
% 	windowtype -> Fenstertyp
% 	linlog -> 0 ... linear; 1 ... logarithmisch
function [S_mag, f] = spektrum(s, fs, windowtype, linlog)

    % Anzahl der Punkte
    N = length(s);
    % Auswahl des Fensters
    switch windowtype
    case 'hanning'
        w = window(@hanning, N); % Erzeugen eines Hanning Fensters
    otherwise
        w = rectwin(N); % Rechteckfenster
    end                     
    s = s.*w'; % Fensterrung des Zeitsignals
                                                          
    [S_mag, f] = my_fft(s, fs, N);                                                                                                            
    if linlog                                                                                                          
        S_mag = 20 * log10(S_mag);                                                                                                          
    end                                                                                                          
end                                                                                                          
