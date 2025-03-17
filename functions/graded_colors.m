function clrs = graded_colors(n_timebin)

color3x3 = ...
    [0.7333    0.8431    0.9020
    0.3686    0.6784    0.8314
    0.0039    0.4392    0.7020
    1.0000    0.6863    0.5804
    1.0000    0.4235    0.3137
    0.8353    0.1137    0.1451];

warmclrs = ...
    [repmat(color3x3(1, :), 3, 1);repmat(color3x3(2, :), 3, 1); repmat(color3x3(3, :), 3, 1)];
painclrs = ...
    repmat(color3x3(4:6, :), 3, 1);

t_epochs = cumsum([2 2 5 10 5 10 5 2 2]);
baseclr  = [127 127 127]./255;
n_conds  = 9;
x_time   = linspace(0, 43, n_timebin);
clrs     = zeros(n_conds, numel(x_time), 3);

for t_i = 1:numel(t_epochs)
    for cond_i = 1:n_conds
        warmclr = warmclrs(cond_i, :);
        painclr = painclrs(cond_i, :);

        if t_i == 1
            inidx = (x_time < t_epochs(t_i));
            clrs(cond_i, inidx, :) = repmat(baseclr, sum(inidx), 1);

        elseif t_i == 2
            inidx = (t_epochs(t_i-1) <= x_time) & (x_time < t_epochs(t_i));
            clrs(cond_i, inidx, :) = ...
                clr_interpolate(baseclr, warmclrs(cond_i, :), sum(inidx));

        elseif t_i == 3 
            inidx = (t_epochs(t_i-1) <= x_time) & (x_time < t_epochs(t_i));
            clrs(cond_i, inidx, :) = ...
                repmat(warmclr, sum(inidx), 1);

        elseif t_i == 4
            inidx = (t_epochs(t_i-1) <= x_time) & (x_time < t_epochs(t_i));
            clrs(cond_i, inidx, :) = ...
                clr_interpolate(warmclr, painclr, sum(inidx));

        elseif t_i == 5
            inidx = (t_epochs(t_i-1) <= x_time) & (x_time < t_epochs(t_i));
            clrs(cond_i, inidx, :) = ...
                repmat(painclr, sum(inidx), 1);

        elseif t_i == 6
            inidx = (t_epochs(t_i-1) <= x_time) & (x_time < t_epochs(t_i));
            clrs(cond_i, inidx, :) = ...
                clr_interpolate(painclr, warmclr, sum(inidx));

        elseif t_i == 7
            inidx = (t_epochs(t_i-1) <= x_time) & (x_time < t_epochs(t_i));
            clrs(cond_i, inidx, :) = ...
                repmat(warmclr, sum(inidx), 1);

        elseif t_i == 8
            inidx = (t_epochs(t_i-1) <= x_time) & (x_time < t_epochs(t_i));
            clrs(cond_i, inidx, :) = ...
                clr_interpolate(warmclr, baseclr, sum(inidx));

        elseif t_i == 9
            inidx = (t_epochs(t_i-1) <= x_time) & (x_time <= t_epochs(t_i));
            clrs(cond_i, inidx, :) = ...
                repmat(baseclr, sum(inidx), 1);
        end
    end
end