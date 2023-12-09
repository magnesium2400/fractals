classdef Sphinx6 < Fractal

    properties
        shape = struct('X', [0 -1 -2 -3 -1 1 3 2], 'Y', sqrt(3)*[0 1 0 -1 -1 -1 -1 0]);
    end

    methods
        function out = makeChildren(obj)
            out(1) = defineChild(obj, @Sphinx6, [-2, 0]/2, -2*pi/3, 0, 0.5, 1);
            out(2) = defineChild(obj, @Sphinx6, [-3, -sqrt(3)]/2, 0, 1, 0.5, 1);
            out(3) = defineChild(obj, @Sphinx6, [3, -sqrt(3)]/2, 0, 1, 0.5, 1);
            out(4) = defineChild(obj, @Sphinx6, [1, -sqrt(3)]/2, pi, 1, 0.5, 1);
        end
    end
end


