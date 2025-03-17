function plot_graded(x, y, clrs)
% x
%   obx x 1
% y
%   obs x feats
% clrs
%   (obs - 1) x 3 (r g b)
n_obs = size(y, 1);

for obs_i = 1:n_obs-1
    plot(x(obs_i:obs_i+1, :), y(obs_i:obs_i+1, :), 'Color', clrs(obs_i, :)); hold on;
end

end