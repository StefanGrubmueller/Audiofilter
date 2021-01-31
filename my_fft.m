% Name: Stefan Grubmüller 03 5BHEL
% Datum: 29.01.21

% my_fft
% function:
%	berechnet fast furier transformation
% parameter:
% 	S_mag	...normiertes Betragsspektrum
% 	f		...dazupassender Frequenzvektor 
% 	fs		...Abtastrate
% 	N		... Anzahl der Werte für FFT
function [S_mag f] = my_fft(s,fs,N)

	S_mag = fft(s,N); 			
	S_mag = abs(S_mag);          	 % Betragsspektrum
	cutoff = ceil(N/2);          	 % Cutoff frequency (Nyquist Frequenz)
	S_mag = S_mag(1:cutoff);  	 	 % Betragsspektrum 0 -fs/2
	S_mag = S_mag / cutoff;      	 % Amplitudenkorrektur 
	f = (0:cutoff-1) * fs / N;   	 % Frequenzvektor

end
