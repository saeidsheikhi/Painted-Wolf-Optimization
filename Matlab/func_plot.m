%___________________________________________________________________%
%  Painted Wolf Optimization (PWO) source codes version 1.0         %
%                                                                   %
%  Developed in MATLAB R2016a or newer                              %
%                                                                   %
%  Author and programmer: Saeid Sheikhi                             %
%                                                                   %
%         e-Mail: Saeid.Sheikhi@oulu.fi                             %
%         Homepage: saeid.dev                                       %
%                                                                   %
%  Main paper: Saeid Sheikhi, "Painted Wolf Optimization: A Novel   %
%  Nature-Inspired Metaheuristic Algorithm for Real-World           %
%  Optimization Problems", Computers, Materials & Continua, 2026.   %
%  DOI: 10.32604/cmc.2026.077788                                    %
%___________________________________________________________________%

% This function draws the 2D landscape of a benchmark function.

function func_plot(func_name)

[lb,ub,dim,fobj]=Get_Functions_details(func_name);

switch func_name 
    case 'F1' 
        x=-100:2:100; y=x; %[-100,100]
        
    case 'F2' 
        x=-10:0.2:10; y=x; %[-10,10]
        
    case 'F3' 
        x=-100:2:100; y=x; %[-100,100]
        
    case 'F4' 
        x=-100:2:100; y=x; %[-100,100]
    case 'F5' 
        x=-30:0.6:30; y=x; %[-30,30]
    case 'F6' 
        x=-100:2:100; y=x; %[-100,100]
    case 'F7' 
        x=-1.28:0.03:1.28;  y=x;  %[-1.28,1.28]
    case 'F8' 
        x=-500:10:500;y=x; %[-500,500]
    case 'F9' 
        x=-5.12:0.1:5.12;   y=x; %[-5.12,5.12]    
    case 'F10' 
        x=-32:0.64:32; y=x;%[-32,32]
    case 'F11' 
        x=-600:12:600; y=x;%[-600,600]
    case 'F12' 
        x=-50:1:50; y=x;%[-50,50]
    case 'F13' 
        x=-50:1:50; y=x;%[-50,50]
    case 'F14' 
        x=-65:1.3:65; y=x;%[-65.536,65.536]
    case 'F15' 
        x=-5:0.1:5; y=x;%[-5,5]
    case 'F16' 
        x=-5:0.1:5; y=x;%[-5,5]
    case 'F17' 
        x=-5:0.1:10; y=0:0.1:15;%[-5,5]
    case 'F18' 
        x=-2:0.04:2; y=x;%[-2,2]
    case 'F19' 
        x=0:0.02:1; y=x;%[0,1]
    case 'F20' 
        x=0:0.02:1; y=x;%[0,1]        
    case 'F21' 
        x=0:0.2:10; y=x;%[0,10]
    case 'F22' 
        x=0:0.2:10; y=x;%[0,10]     
    case 'F23' 
        x=0:0.2:10; y=x;%[0,10]  
end    

L=length(x);
f=zeros(L,L);

for i=1:L
    for j=1:L
        if dim==2
            f(i,j)=fobj([x(i),y(j)]);
        elseif dim>2 && strcmp(func_name,'F17')~=1
            f(i,j)=fobj([x(i),y(j),zeros(1,dim-2)]);
        elseif dim>2 && strcmp(func_name,'F17')==1
            f(i,j)=fobj([x(i),y(j)]);
        end
    end
end

surfc(x,y,f','LineStyle','none');

end
