for i=1:m
    if real(Y_rFFT(i))==0 || imag(Y_rFFT(i))==0
        Y_rFFT(i) = 1 + j*1;
    end
end