classdef PenroseHalfdart < Fractal
    properties
        shape = struct('X', [0, cos(3*pi/5), 1, NaN], 'Y', [0, sin(3*pi/5), 0, NaN]);
    end

    methods
        function out = makeChildren(obj)
            phi = (1+sqrt(5))/2;
            t = pi/5;
            out(1) = defineChild(obj, @PenroseHalfdart, 1/phi*[cos(2*t), sin(2*t)], 4*t, 0, 1/phi, 1);
            out(2) = defineChild(obj, @PenroseHalfkite, [1 0], 0, 1, 1/phi, 1);
        end
    end
end
