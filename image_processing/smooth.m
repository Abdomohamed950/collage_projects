function smoothed = smooth (x, width)
% Left
for n = 1:2
    smoothed(1) = x(1);
    smoothed(2) = mean(x(1):x(3));
end
% Middle
for n = 3:98
    W = (width - 1) / 2; % Width should be odd
    smoothed(n) = mean (x(n-W:n+W));
end
% Right
for n = 99:100
    smoothed(99) = mean(x(98):x(100));
    smoothed(100) = x(100);
end
end
