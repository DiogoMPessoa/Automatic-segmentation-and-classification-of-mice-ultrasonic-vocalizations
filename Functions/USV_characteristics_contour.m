function feat=USV_characteristics_contour(y,Fs,extraction)
if ~exist('extraction','var') || isempty(extraction)
    extraction = 'max';
end

%extraction='max','psd','max_tonality','syncro','wsst'
freqs_smooth = contour_extraction(y,Fs,extraction);% extract USV TF contour

[peak_frequency,Idx_peak] = max(freqs_smooth);
[min_frequency,Idx_min] = min(freqs_smooth);
freq_init = freqs_smooth(1);
freq_end = freqs_smooth(end);
bandwith = abs(peak_frequency-min_frequency);
mean_frequency = mean(freqs_smooth);
ste = Short_Time_Energy(y);
power_dB = Signal_Energy(y);

feat = [peak_frequency,min_frequency,freq_init,freq_end,bandwith,mean_frequency,ste,power_dB];
end