classdef DragonCurve < Fractal
    properties
        shape = struct('X', [1, 0, 0, NaN], 'Y', [0, 0, 1, NaN]);
    end

    methods
        function out = makeChildren(obj)
            out(1) = defineChild(obj, @DragonCurve, [0.5 0.5], -3*pi/4, 0, 1/sqrt(2), 1);
            out(2) = defineChild(obj, @DragonCurve, [-0.5 0.5], -pi/4, 0, 1/sqrt(2), 1);
        end
    end
end
