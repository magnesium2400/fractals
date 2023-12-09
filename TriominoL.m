classdef TriominoL < Fractal

    properties
        shape = struct('X', [-1 1 1 0 0 -1], 'Y', [1 1 0 0 -1 -1]);
    end

    methods
        function out = makeChildren(obj)
            out(1) = defineChild(obj, @TriominoL, [0 0], 0, 0, 0.5, 1);
            out(2) = defineChild(obj, @TriominoL, [-1 1]/2, 0, 0, 0.5, 1);
            out(3) = defineChild(obj, @TriominoL, [-1 -1]/2, pi/2, 0, 0.5, 1);
            out(4) = defineChild(obj, @TriominoL, [1 1]/2, -pi/2, 0, 0.5, 1);
        end
    end
end
