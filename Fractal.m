classdef (Abstract) Fractal < matlab.mixin.Heterogeneous & handle

    properties (Abstract)
        shape
    end

    properties
        tr % translate
        rt % rotate
        fl % flip
        sz % size
        d % depth

        params % optional parameters
        Parent
        Children
        flipX
    end


    methods (Abstract)
        out = makeChildren(obj)
    end

    methods
        
        function obj = Fractal(tr, rt, fl, sz, d, params)
            [obj.tr, obj.rt, obj.fl, obj.sz, obj.d] = deal(tr, rt, fl, sz, d);
            obj.Parent = [];
            if fl; obj.flipX = -1; else; obj.flipX = 1; end
            if exist('params', 'var'); obj.params = params; end
            if d; obj.Children = makeChildren(obj); end
        end

        function out = getX(obj)
            s = obj.shape; 
            r = obj.rt;
            out = (s.X*obj.flipX*cos(r)-s.Y*sin(r))*obj.sz + obj.tr(1);
        end
        
        function out = getY(obj)
            s = obj.shape; 
            r = obj.rt;
            out = (s.X*obj.flipX*sin(r)+s.Y*cos(r))*obj.sz + obj.tr(2);
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

        function out = defineChild(obj, classHandle, trRelative, rtDelta, flStatus, szFraction, dDelta, params)

            args = { ...
                obj.tr + obj.sz*rotxy(obj, trRelative(1), trRelative(2)), ...
                obj.rt + rtDelta*obj.flipX, ...
                xor(obj.fl, flStatus), ...
                obj.sz*szFraction, ...
                obj.d-dDelta };
            if exist('params', 'var'); args{end+1} = params; end

            out = classHandle(args{:});
            out.Parent = obj;
        end

        function out = rotxy(obj,x,y)
            out = [x*cos(obj.rt)*obj.flipX - y*sin(obj.rt), x*sin(obj.rt)*obj.flipX + y*cos(obj.rt)];
        end
    
    end

end
