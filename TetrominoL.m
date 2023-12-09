classdef TetrominoL < Fractal

    properties
        shape = struct('X', [0 0 -1 -1 2 2], 'Y', [0 1 1 -1 -1 0]);
    end

    methods
        function out = makeChildren(obj)
            out(1) = defineChild(obj, @TetrominoL, [0.5, -0.5], 0, 0, 0.5, 1);
            out(2) = defineChild(obj, @TetrominoL, [1.5, -0.5], pi, 0, 0.5, 1);
            out(3) = defineChild(obj, @TetrominoL, [-0.5, 0.5], pi/2, 1, 0.5, 1);
            out(4) = defineChild(obj, @TetrominoL, [-0.5, -0.5], -pi/2, 1, 0.5, 1);
        end
    end
end

