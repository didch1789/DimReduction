function convolved_activation = hrf_convolution(hidden_activation, timescale)
    % hidden_activation: (time x unit) matrix
    % convolved_activation: (time x unit) matrix (same size after trimming)
    
    hrf = spm_hrf(timescale);
    [num_timepoints, num_units] = size(hidden_activation);
    convolved_activation = zeros(num_timepoints, num_units);
    
    for u = 1:num_units
        temp_conv = conv(hidden_activation(:, u), hrf, 'full'); % Convolve
        convolved_activation(:, u) = temp_conv(1:num_timepoints); 
    end
end