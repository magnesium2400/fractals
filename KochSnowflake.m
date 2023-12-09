classdef KochSnowflake < Fractal
    properties
        shape = struct('X', [0, -sqrt(3), sqrt(3)], 'Y', [2, -1, -1]);
    end

    methods
        function out = makeChildren(obj)
            r = obj.params;
            out(1) = defineChild(obj, @KochSnowflake, [cos(pi/6), sin(pi/6)]*(1+r), -pi/3, 0, r, 1, obj.params);
            out(2) = defineChild(obj, @KochSnowflake, [-cos(pi/6), sin(pi/6)]*(1+r), pi/3, 0, r, 1, obj.params);
            % out(3) = defineChild(obj, @KochSnowflake, [0 -1]*(1+r), pi, 0, r, 1, obj.params);
        end
    end
end
