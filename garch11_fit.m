function [coeff, STDresiduals, condSTD] = garch11_fit(y)
% Fits a GARCH(1,1) to input series y and returns 
% the estimated coefficients and devolatilised series
spec = garchset('P', 1, 'Q', 1, 'C', 0, 'Display', 'off');  
[coeff,errors,loglik,residuals,condSTD] = garchfit(spec, y);
STDresiduals = residuals ./ condSTD;
end

