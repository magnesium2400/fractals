classdef PenroseHalfkite < Fractal
    properties
        shape = struct('X', (1+sqrt(5))/2*[0, cos(pi/5), 1, NaN], 'Y', (1+sqrt(5))/2*[0, sin(pi/5), 0, NaN]);
    end

    methods
        function out = makeChildren(obj)
            phi = (1+sqrt(5))/2;
            t = pi/5;
            out(1) = defineChild(obj, @PenroseHalfkite, phi*[cos(t), sin(t)], -3*t, 0, 1/phi, 1);
            out(2) = defineChild(obj, @PenroseHalfkite, phi*[cos(t), sin(t)], 2*t, 1, 1/phi, 1);
            out(3) = defineChild(obj, @PenroseHalfdart, 1/phi*[cos(t), sin(t)], -4*t, 0, 1/phi, 1);
        end
    end
end
