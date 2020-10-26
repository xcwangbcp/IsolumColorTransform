% function IsoLumColorTransit fo the Display++,pls put the .mat into the
% same fold, and just input what transformation you want,will getit out.
clear 
load('Display++Color++Mode-Ubuntu-RadeonPsychlab.mat')
gray=c.inputValues(1).in;
green = c.inputValues(3).in;
red = c.inputValues(2).in;
blue =c.inputValues(4).in;
x = c.ramp;
% global x
plot(x,gray,'color','k','marker','o')
hold on
plot(x,green,'color','g','marker','o')
hold on
plot(x,red,'color','r','marker','o')
hold on
plot(x,blue,'color','b','marker','o')
disp('>>>What do you want? ')

reply = input('>>>If you want Red''s euquivelent luminance in Green press 1;,\n>>>Green to Red pres 2;\n>>>Green to Gray press 3;\n>>>Red to Gray press 4;\n  ');
switch reply
    case 1
        input = input('input the Red''s value \n');
        [k,b] =  fitted(x,red);
        [kk,bb] = fitted(x,green);
        Out = reversfit(input,k,b,kk,bb);
        disp([num2str(input),'Red = Green ',num2str(Out)]);
    case 2
        input = input('input the Green''s value\n');
        [k,b] =  fitted(x,green);
        [kk,bb] = fitted(x,red);
        Out = reversfit(input,k,b,kk,bb);
        disp([num2str(input),'Green = Red ',num2str(Out)]);
    case 3
        input = input('input the Green''s value \n');
        [k,b] =  fitted(x,green);
        [kk,bb] = fitted(x,gray);
        Out = reversfit(input,k,b,kk,bb);
        disp([num2str(input),'Green = Gray ',num2str(Out)]);
    case 4 
        input = input('input the Red''s value \n');
        [k,b] =  fitted(x,red);
        [kk,bb] = fitted(x,gray);
        Out = reversfit(input,k,b,kk,bb);
        disp([num2str(input),'Red = Gray ',num2str(Out)]);
end
% do the poly fitting
function [p1,p2] = fitted(x,y)
%          x = c.ramp;
%          global x
         p = polyfit(x,y,1);
         p1 = p(1);
         p2 = p(2);
end
% fitting back
function [valueColorkk] = reversfit(valueColork,k,b,kk,bb)
         valueColorkk = (valueColork*k+b-bb)/kk;
end
% end
