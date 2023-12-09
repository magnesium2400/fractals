classdef PenroseStar < Fractal
    properties
        shape = struct('X', [0 0], 'Y', [0 0]);
    end

    methods
        function out = makeChildren(obj)
            t = pi/5;
            cossin = @(theta) [cos(theta), sin(theta)];

            out(1) = defineChild(obj, @PenroseHalfdart, cossin(5*t), 0*t, 0, 1, 1);
            out(2) = defineChild(obj, @PenroseHalfdart, cossin(3*t), -2*t, 0, 1, 1);
            out(3) = defineChild(obj, @PenroseHalfdart, cossin(t), -4*t, 0, 1, 1);
            out(4) = defineChild(obj, @PenroseHalfdart, cossin(-1*t), -6*t, 0, 1, 1);
            out(5) = defineChild(obj, @PenroseHalfdart, cossin(-3*t), -8*t, 0, 1, 1);

            out(6) = defineChild(obj, @PenroseHalfdart, cossin(5*t), 5*t, 1, 1, 1);
            out(7) = defineChild(obj, @PenroseHalfdart, cossin(3*t), 3*t, 1, 1, 1);
            out(8) = defineChild(obj, @PenroseHalfdart, cossin(t), 1*t, 1, 1, 1);
            out(9) = defineChild(obj, @PenroseHalfdart, cossin(-1*t), -1*t, 1, 1, 1);
            out(10) = defineChild(obj, @PenroseHalfdart, cossin(-3*t), -3*t, 1, 1, 1);
        end
    end
end
