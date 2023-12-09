classdef PenroseSun < Fractal
    properties
        shape = struct('X', [0 0], 'Y', [0 0]);
    end

    methods
        function out = makeChildren(obj)
            t = pi/5;
            out(1) = defineChild(obj, @PenroseHalfkite, [0 0], 0, 0, 1, 1);
            out(2) = defineChild(obj, @PenroseHalfkite, [0 0], 2*t, 0, 1, 1);
            out(3) = defineChild(obj, @PenroseHalfkite, [0 0], 4*t, 0, 1, 1);
            out(4) = defineChild(obj, @PenroseHalfkite, [0 0], 6*t, 0, 1, 1);
            out(5) = defineChild(obj, @PenroseHalfkite, [0 0], 8*t, 0, 1, 1);

            out(6) = defineChild(obj, @PenroseHalfkite, [0 0], -3*t, 1, 1, 1);
            out(7) = defineChild(obj, @PenroseHalfkite, [0 0], -1*t, 1, 1, 1);
            out(8) = defineChild(obj, @PenroseHalfkite, [0 0], 1*t, 1, 1, 1);
            out(9) = defineChild(obj, @PenroseHalfkite, [0 0], 3*t, 1, 1, 1);
            out(10) = defineChild(obj, @PenroseHalfkite, [0 0], 5*t, 1, 1, 1);
        end
    end
end
