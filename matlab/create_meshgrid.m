function [ grid ] = create_meshgrid( outDim, batchSize )
% Creates the correct input to make the function vl_nnbilinearsampler
% resize its input to the size specified in outDim (the same bilinear
% filter is applied to all channels, to all images).
%
% Example usage, resizes 4D input x into a 4D output y which has new 
% spatial dimensions 100x100: 
%   outDim = [100 100];   
%   batchSize = 31;
%   x = single(randi(10,[18,18,3,batchSize]));
%   grid = single(create_meshgrid(outDim, batchSize));
%   y = vl_nnbilinearsampler(x, grid);


    [b,a] = meshgrid(linspace(-1,1,outDim(1)), linspace(-1,1,outDim(2)));
    grid(1,:,:) = a;
    grid(2,:,:) = b;
    grid = repmat(grid,[1,1,1,batchSize]);

end

