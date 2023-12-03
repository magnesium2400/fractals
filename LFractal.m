classdef LFractal

    properties
        tr % translate
        rt % rotate
        % fl % flip
        sz % size

        Children
        shape = struct('X', [-1 1 1 0 0 -1], 'Y', [1 1 0 0 -1 -1]);
    end


    methods
        function obj = LFractal(tr, rt, sz, d)
            [obj.tr, obj.rt, obj.sz] = deal(tr, rt, sz);
            if d
                obj.Children = makeChildren(obj, d-1);
            end
        end


        function out = makeChildren(obj, d)
            rotxy = @(x,y,t) [x*cos(t) - y*sin(t), x*sin(t) + y*cos(t)];
            out(1) = LFractal(obj.tr, obj.rt, obj.sz/2, d);
            out(2) = LFractal(obj.tr + obj.sz/2*rotxy(-1,1,obj.rt), obj.rt, obj.sz/2, d);
            out(3) = LFractal(obj.tr + obj.sz/2*rotxy(-1,-1,obj.rt), obj.rt+pi/2, obj.sz/2, d);
            out(4) = LFractal(obj.tr + obj.sz/2*rotxy(1,1,obj.rt), obj.rt-pi/2, obj.sz/2, d);
        end

        function out = getX(obj)
            s = obj.shape; 
            r = obj.rt;
            out = (s.X*cos(r)-s.Y*sin(r))*obj.sz + obj.tr(1);
        end
        
        function out = getY(obj)
            s = obj.shape; 
            r = obj.rt;
            out = (s.X*sin(r)+s.Y*cos(r))*obj.sz + obj.tr(2);
        end

        function out = getAllChildren(obj)
            out = obj.Children;
            unsearched = true(1, numel(out));

            while any(unsearched)
                id = find(unsearched, 1);
                if (id)
                    c = out(id).Children;
                    out = [out, c]; %#ok<AGROW>
                    unsearched = [unsearched, true(1, numel(c))]; %#ok<AGROW>
                end
                unsearched(id) = false;
            end

        end


    end
end
