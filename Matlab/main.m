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

% This is the main file to run the PWO algorithm.
%
% You can define your objective function in a separate file and pass its
% handle to fobj. The required parameters are:
%__________________________________________
% fobj = @YourObjectiveFunction
% dim = number of your variables
% Max_iteration = maximum number of generations
% SearchAgents_no = number of search agents
% lb = lower bound (scalar or vector)
% ub = upper bound (scalar or vector)
%
% To run PWO: [Best_score,Best_pos,PWO_cg_curve]=PWO(SearchAgents_no,Max_iteration,lb,ub,dim,fobj)
%__________________________________________

clear all 
clc

SearchAgents_no=30; % Number of search agents

Function_name='F1'; % Name of the test function (e.g., F1 to F23)

Max_iteration=500; % Maximum number of iterations

% Load details of the selected benchmark function
[lb,ub,dim,fobj]=Get_Functions_details(Function_name);

% Run the Painted Wolf Optimization algorithm
[Best_score,Best_pos,PWO_cg_curve]=PWO(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);

figure('Position',[500 500 660 290])
%Draw search space
subplot(1,2,1);
func_plot(Function_name);
title('Parameter space')
xlabel('x_1');
ylabel('x_2');
zlabel([Function_name,'( x_1 , x_2 )'])

%Draw objective space
subplot(1,2,2);
semilogy(PWO_cg_curve,'Color','r')
title('Objective space')
xlabel('Iteration');
ylabel('Best score obtained so far');

axis tight
grid on
box on
legend('PWO')

display(['The best solution obtained by PWO is : ', num2str(Best_pos)]);
display(['The best optimal value of the objective function found by PWO is : ', num2str(Best_score)]);
