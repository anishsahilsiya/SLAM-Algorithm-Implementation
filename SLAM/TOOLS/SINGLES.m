function H = ONE (prediction, observations, compatibility)
%-------------------------------------------------------
% University of Zaragoza
% Centro Politecnico Superior
% Robotics and Real Time Group
% Authors:  J. Neira, J. Tardos
% Date   :  7-2004
%-------------------------------------------------------
%-------------------------------------------------------
global chi2;
global configuration;

H = zeros(1, observations.m);

% You have observations.m observations, and prediction.n
% predicted features.
%
% For every observation i, check whether it has only one neighbour,
% feature, and whether that feature j  has only that one neighbour
% observation i.  If so, H(i) = j.
%
% You will need to check the compatibility.ic matrix
% for this:
%
% compatibility.ic(i,j) = 1 if observation i is a neighbour of
% feature j.
for i = 1:observations.m
    count = 0;
    for j = 2:prediction.n
        if compatibility.ic(i, j) == 1
             count = count+1;
             p = j;
        end
    end
    if count == 1
        H(i) = p;
    end
end

configuration.name = 'ONLY NEIGHBOUR';
