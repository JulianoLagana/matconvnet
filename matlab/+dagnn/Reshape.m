classdef Reshape < dagnn.ElementWise
  properties
    newDimensions
  end

  methods
    function outputs = forward(obj, inputs, params)
      outputs{1} = vl_nnreshape(inputs{1},obj.newDimensions);
    end

    function [derInputs, derParams] = backward(obj, inputs, params, derOutputs)
      derInputs{1} = vl_nnreshape(inputs{1}, obj.newDimensions, derOutputs{1});
      derParams = {} ;  
    end

    % ---------------------------------------------------------------------
    function obj = Reshape(varargin)
      obj.load(varargin{:}) ;
    end

    function obj = reset(obj)
      reset@dagnn.ElementWise(obj) ;
    end
  end
end
