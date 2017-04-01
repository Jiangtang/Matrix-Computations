function walker
% WALKER  Human gait. Version: March 5, 2016.
% This model, developed by Nikolaus Troje, is a five-term Fourier series
% with vector-valued coefficients that are the principal components for
% data obtained in motion capture experiments involving subjects wearing
% reflective markers walking on a treadmill.  The components, which are
% also known as "postures" or "eigenwalkers", correspond to the static
% position, forward motion, sideways sway, and two hopping/bouncing
% movements that differ in the phase relationship between the upper and
% lower portions of the body.  The postures are also classified by gender.
% Sliders allow you to vary the amount that each component contributes to
% the overall motion.  A slider setting greater than 1.0 overemphasizes
% the characteristic.  Can you see whether positive values of the gender
% coefficient correspond to male or female subjects?
%
% References:
% http://blogs.mathworks.com/cleve/2016/04/11/...
% ...the-eigenwalker-model-of-the-human-gait
% http://jov.arvojournals.org/article.aspx?articleid=2192503
% http://www.biomotionlab.ca/walking.php
% http://www.biomotionlab.ca/Text/WDP2002_Troje.pdf
% http://www.biomotionlab.ca/Text/trojeChapter07b.pdf

% Copyright 2014-2016 Cleve Moler
% Copyright 2014-2016 The MathWorks, Inc.

% The body is represented by 15 points in three space, i.e. a vector of
% length 45.  The data consists of F, five vectors describing the average
% female and M, five vectors describing the average male.  Four linked
% segments, indexed by L, are the head, torso, arms, and legs.

    % Initial view

    clf
    shg
    set(gcf,'color','white', ...
        'name','Eigenwalker', ...
        'menu','none', ...
        'numbertitle','off')
    F = [];
    M = [];
    H = [];
    load walkers  % Load F and M, Females and Males -- and a surprise.
    V = (F+M)/2;  % Coefficient matrix.
    X = reshape(V(:,1),15,3);
    L = {[1 5],[5 12],[2 3 4 5 6 7 8],[9 10 11 12 13 14 15]};  % Links
    p = zeros(1,4);
    for k = 1:4
       p(k) = line(X(L{k},1),X(L{k},2),X(L{k},3), ...
          'marker','o', ...
          'markersize',10, ...
          'linestyle','-');
    end
    set(p(1),'tag','happy', ...
        'userdata',zeros(1,3));
    axis([-750 750 -750 750 0 1500])
    lift = get(gca,'position')+[0 .04 0 0];
    set(gca,'xtick',[], ...
        'ytick',[], ...
        'ztick',[], ...
        'position',lift, ...
        'clipping','off')
    view(160,10)

    % Sliders and controls

    labels = {'speed','stride','sway','hop','bounce','gender'};
    sliders = zeros(1,6);
    for j = 1:6
       switch j
          case 1
              smin = 0;
              start = 1; 
              smax = 3;
          case 6
              smin = -3;
              start = 0;
              smax = 3;
           otherwise
              smin = -2;
              start = 1;
              smax = 2;
       end
       slider_txt = uicontrol('style','text', ...   % above a slider
           'string',sprintf('%4.2f',start), ...
           'back','white', ...
           'units','normalized', ...
           'position',[.16*j-.10 .11 .08 .03]);
       sliders(j) = uicontrol('style','slider', ...
           'background','white', ...
           'units','normalized', ...
           'pos',[.16*j-.13 .07 .14 .03], ...
           'min',smin, ...
           'max',smax, ...
           'val',start, ...
           'sliderstep',[1 2]/(10*smax), ...
           'userdata',slider_txt, ...
           'callback',@slider_cb);
       uicontrol('style','text', ...  % below a slider
           'string',labels{j}, ...
           'background','white', ...
           'units','normalized', ...
           'position',[.16*j-.12 .02 .10 .04])
    end
    stop = uicontrol('style','toggle', ...
        'units','normalized', ...
        'position',[.91 .94 .08 .05], ...
        'background','white', ...
        'fontweight','bold', ...
        'string','stop');
    uicontrol('style','radio', ...
        'units','normalized', ...
        'position',[.03 .90 .08 .08], ...
        'userdata',H, ...
        'background','white', ...
        'callback',@radio_cb)
    uicontrol('style','text', ...
        'units','normalized', ...
        'position',[.72 .25 .25 .08], ...
        'background','white', ...
        'fontangle','italic', ...
        'fontsize',get(0,'defaultuicontrolfontsize')-2, ...
        'string',{'Click on the figure','to rotate the view'})
    cameratoolbar setmode orbit

    % Start walkin'...

    period = 151.5751;
    omega = 2*pi/period;
    fps = 120;    % 120 fps when s(1)=1
    t = 0;
    dt = 2*pi/omega/fps;
    while get(stop,'value') == 0
        s = cell2mat(get(sliders,'value'));
        t = t + s(1)*dt;
        c = [1 sin(omega*t) cos(omega*t) sin(2*omega*t) cos(2*omega*t)]';
        c = [1; s(2:5).*c(2:5)];
        V = (F+M)/2 + s(6)*(F-M)/2;
        X = reshape(V*c,15,3);
        H = get(p(1),'userdata');
        e = ones(size(H,1),1);
        XH = [X(e,:)+H; X(5,:)];
        set(p(1),'xdata',XH(:,1), ...
            'ydata',XH(:,2), ...
            'zdata',XH(:,3))
        for k = 2:4
            set(p(k),'xdata',X(L{k},1), ...
                'ydata',X(L{k},2), ...
                'zdata',X(L{k},3));
        end
        pause(1/(s(1)*fps))
    end;
    cameratoolbar close
    set(stop,'value',0, ...
        'string','close', ...
        'fontweight','bold', ...
        'callback','close(gcf)')
    
 % -------------------------------------------------------------
 
    function slider_cb(s,~)
        % Update the text above a slider
        stxt = get(s,'userdata');
        sval = get(s,'value');
        sprf = sprintf('%4.2f',sval);
        set(stxt,'string',sprf);
    end % slider_cb
    
 % -------------------------------------------------------------
 
    function radio_cb(s,~)
        % Happy face
        p1 = findobj('tag','happy');
        if get(s,'value')
            set(p1,'marker','none', ...
                'userdata',get(s,'userdata'))
        else
            set(p1,'marker','o', ...
                'userdata',zeros(1,3))
        end;
    end % radio_cb
        
end % walker_2016
