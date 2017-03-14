classdef Constant < dagnn.Layer
  properties
    value
  end

  methods
    function outputs = forward(obj, inputs, params)
      outputs{1} = obj.value ;
    end

    function [derInputs, derParams] = backward(obj, inputs, param, derOutputs)
      derInputs = {} ;
      derParams = {} ;
    end

    function obj = Constant(varargin)
      obj.load(varargin) ;
    end
    
    function move(obj, device)
        switch device
            case 'cpu'
                obj.value = gather(obj.value);
            case 'gpu'
                obj.value = gpuArray(obj.value);
        end
    end
    
    
  end
end
