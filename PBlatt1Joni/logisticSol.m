function y = logisticSol(p, t)
y = p.xi .* (p.p_0./(p.p_0 + (p.xi - p.p_0) .* exp(-p.alpha .* (t - p.t_0))));