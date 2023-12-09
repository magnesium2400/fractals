classdef FlakePenta < Fractal

    properties
        shape = NaN; %struct('X', cosd(90+(1:5)*72), 'Y', sind(90+(1:5)*72));
    end

    methods

        function out = makeChildren(obj)
            n = obj.params;
            s = 0;
            for ii = 1:floor(n/4); s = s + cos(2*pi*ii/n); end
            r = 0.5/(1 + s);
            t = 360/n;
            cossind = @(theta) [cosd(theta), sind(theta)];
            
            for ii = 1:n
                out(ii) = defineChild(obj, @FlakePenta, ...
                    (1-r)*cossind(90+ii*t), 0, 0, r, 1, n); %#ok<AGROW>
            end

            % out(n+1) = defineChild(obj, @FlakePenta, [0 0], pi, 0, (1-r)/(2*cos(pi/n)), 1, n);
            out(n+1) = defineChild(obj, @FlakePenta, [0 0], pi, 0, 1-2*r, 1, n);
        end

        % Override
        function obj = FlakePenta(tr, rt, fl, sz, d, params)
            obj@Fractal(tr, rt, fl, sz, d, params);
            obj.shape = struct('X', cosd(90+(1:obj.params)*360/params), 'Y', sind(90+(1:obj.params)*360/params));
        end

        % Override
        % function out = defineChild(obj, classHandle, trRelative, rtDelta, flStatus, szFraction, dDelta)
        %     out = defineChild@Fractal(obj, classHandle, trRelative, rtDelta, flStatus, szFraction, dDelta);
        %     out.param = obj.param;
        %     if isempty(obj.param)
        %         disp('here');
        %     end
        % 
        %     % obj.param
        %     obj.shape = struct('X', cosd(90+(1:obj.param)*72), 'Y', sind(90+(1:5)*72));
        % end

    end

end
