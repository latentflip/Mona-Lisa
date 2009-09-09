classdef circle
    %CIRCLE Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        red = 0.1;
        green = 0.1;
        blue = 0.1;
        alpha = 0;
        center = [10,10];
        radius = 5;
    end
    
    methods
        function c = circle(img)
            sz = size(img);
            x = floor(sz(1)*rand());
            y = floor(sz(2)*rand());
            c.center = [x,y];
            
            c.radius = floor( rand()*max(sz) );
            
            c.red = rand();
            c.green = rand();
            c.blue = rand();
            c.alpha = rand()*0.5;
        end
        function img = render(c, img)
            sz = size(img);
            mask = zeros(sz(1:2));
            
            for x = 1:sz(1)
                for y = 1:sz(2)
                    if (((x-c.center(1))^2 + (y-c.center(2))^2)<(c.radius^2))
                       mask(x,y)=1; 
                    end
                end
            end
            img(:,:,1)=img(:,:,1)+(mask*c.red*c.alpha);
            img(:,:,2)=img(:,:,2)+(mask*c.green*c.alpha);
            img(:,:,3)=img(:,:,3)+(mask*c.blue*c.alpha);
        end
    end
    
end

