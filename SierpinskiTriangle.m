classdef SierpinskiTriangle < Fractal
    properties
        shape = struct('X', [0, -sqrt(3), sqrt(3)], 'Y', [-2, 1, 1]);
    end

    methods
        function out = makeChildren(obj)
            out(1) = defineChild(obj, @SierpinskiTriangle, [cos(pi/6), -sin(pi/6)]*2, 0, 0, 1/2, 1);
            out(2) = defineChild(obj, @SierpinskiTriangle, [-cos(pi/6), -sin(pi/6)]*2, 0, 0, 1/2, 1);
            out(3) = defineChild(obj, @SierpinskiTriangle, [cos(pi/2), sin(pi/2)]*2, 0, 0, 1/2, 1);
        end
    end
end
