function [niter, vr_iter, vp_iter, vs_iter, dns_iter] = mat_inverse(freq, vr_exp, ...
    sigma, thk, vp, vs, dns, maxiter, mu, tol_vs, gui, object, msg)
% input:
%   1. dispersion curve
%       freq, vr_exp, sigma
%   2. initial model
%       thk, vp, vs, dns
%   3. parameters control the inversion
%       maxiter, mu, tol_vs (change in vs)
%   4. GUI parameters
%       gui (true/false), object, label, msg (message to show, as %d/%d)
% Modification history:
% 01/19/2017: Pablo Pizarro (UChile)
%               (1) Deleted files related to Love wave
% 01/20/2017: Pablo Pizarro (UChile)
%               (1) Add GUI support
%               (2) Iteration number is displayed on GUI
%               (3) Some statuses are displayed on GUI

% Number of layers
nl = length(thk);

% Weight matrix
w = diag(1 ./ sigma);

% Second derivative
delta = curv(nl, nl + 1);
L = delta;
rms = zeros(maxiter, 1);

% Initialize intial guess
m0 = vs;
vp0 = vp;
vs0 = vs;
dns0 = dns;

% Initialize interation variables
vp_iter = zeros(nl + 1, maxiter);
vs_iter = zeros(nl + 1, maxiter);
dns_iter = zeros(nl + 1, maxiter);
vr_iter = zeros(length(freq), maxiter);

% Check if gui parameters is defined
if ~ exist('gui', 'var')
    gui = false;
end

for i = 1:maxiter
    
    % If GUI
    if gui
        pause(0.01);
        set(object, 'string', sprintf(msg, i, maxiter));
    end
 
    % Calculate theoretical phase velocity and partial derivatives
    % warning: presently the code only handle 1 type of dispersion!
    [vr, dvrvs, ~] = mat_disperse(thk, dns0, vp0, vs0, freq);
    jac = real(squeeze(dvrvs)); % jac = [real(squeeze(dvrvs)) real(squeeze(dvrrho))];
 
    % Calculate the rms error
    error = w * (vr - vr_exp);
    rms(i) = sqrt(mean(error .^ 2));
 
    % Least square inversion
    wjac = w * jac;
 
    b = w * (vr_exp - vr + jac * m0);
    m1 = (wjac'*wjac + mu^2*(L' * L)) \ (wjac'*b);
 
    % Evaluate new model
    vs1 = m1(1:nl + 1);
    vp1 = vp;
    dns1 = dns; % dns1 = m1(nl+2:nl+2+nl);
    vr = mat_disperse(thk, dns1, vp1, vs1, freq);
    error1 = w * (vr - vr_exp);
    rms1 = sqrt(mean(error1 .^ 2));
 
    % Store the models
    vp_iter(:, i) = vp1;
    vs_iter(:, i) = vs1;
    dns_iter(:, i) = dns1;
    vr_iter(:, i) = vr(:);
 
    % Check for convergence, only check vs ?
    diff_vs = vs1 - vs0;
    rms_vs_change = sqrt(mean(diff_vs .^ 2));
 
    if rms_vs_change < tol_vs || rms1 <= 1
        break
    end
 
    m0 = m1;
    dns0 = dns1;
    vp0 = vp1;
    vs0 = vs1;
end
niter = i;
end

% Curvature matrix for regularization
function delta = curv(m, ~)
delta = diag(ones(1, m), 0) + diag(- 2 * ones(1, m - 1), 1) + diag(ones(1, m - 2), 2);
tmp = zeros(m, 1);
tmp(m) = - 1;
tmp(m - 1) = 1;
delta = [delta tmp];
end