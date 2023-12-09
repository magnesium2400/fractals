classdef PythagoreanTree < Fractal
    properties
        shape = struct('X', [-1 1 1 -1], 'Y', [-1 -1 1 1]);
    end

    methods
        function out = makeChildren(obj)
            t = obj.params;
            out(1) = defineChild(obj, @PythagoreanTree, [ 1, 1]+[cos(pi/4+t), sin(pi/4+t)]*sin(t)*sqrt(2), t-pi/2, 0, sin(t), 1, t);
            out(2) = defineChild(obj, @PythagoreanTree, [-1, 1]+[cos(pi/4+t), sin(pi/4+t)]*cos(t)*sqrt(2), t, 0, cos(t), 1, t);
        end
    end
end
