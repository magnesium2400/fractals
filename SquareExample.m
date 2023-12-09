classdef SquareExample < Fractal
    properties
        shape = struct('X', [-1 1 1 -1], 'Y', [-1 -1 1 1]);
    end

    methods
        function out = makeChildren(obj)
            % out(1) = SquareExample(obj.tr+rotxy(obj,1,1)*obj.sz*1/3, obj.rt, 0, obj.sz*2/3, obj.d-1);
            % out(2) = SquareExample(obj.tr+rotxy(obj,-1,1)*obj.sz*2/3, obj.rt, 0, obj.sz*1/3, obj.d-1);
            % out(3) = SquareExample(obj.tr+rotxy(obj,-1,0)*obj.sz*2/3, obj.rt, 0, obj.sz*1/3, obj.d-1);
            % out(4) = SquareExample(obj.tr+rotxy(obj,-1,-1)*obj.sz*2/3, obj.rt, 0, obj.sz*1/3, obj.d-1);
            % out(5) = SquareExample(obj.tr+rotxy(obj,0,-1)*obj.sz*2/3, obj.rt, 0, obj.sz*1/3, obj.d-1);
            % out(6) = SquareExample(obj.tr+rotxy(obj,1,-1)*obj.sz*2/3, obj.rt, 0, obj.sz*1/3, obj.d-1);
            t = pi/5;
            out(1) = defineChild(obj, @SquareExample, [ 1, 1]+[cos(pi/4+t), sin(pi/4+t)]*sin(t)*sqrt(2), t-pi/2, 0, sin(t), 1);
            out(2) = defineChild(obj, @SquareExample, [-1, 1]+[cos(pi/4+t), sin(pi/4+t)]*cos(t)*sqrt(2), t, 0, cos(t), 1);
        end
    end
end
