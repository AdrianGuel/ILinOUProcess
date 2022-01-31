%initialconditions
%Information length from stochastic simulation of the OU process
%      dx = theta * ( mu - x(t) ) dt + sigma dW,   
%      x(0) = x0,
% using an initial gaussian distribution p(x,0)~N(0,sigma)

close all
clc

%Create data 
OUprocessSS;

%Plot IL vs X0
load('ILvsx0')

fig=figure('visible','off');
set(fig, 'Position',  [567,165,838,413])
set(gcf,'color','w');
ax1 = axes();
hold(ax1,'on')
grid(ax1,'on')
xlabel(ax1,'$x(0)$','Interpreter','Latex','FontSize', 14)
ylabel(ax1,'$\mathcal{L}(\infty)$','Interpreter','Latex','FontSize', 14)
plot(ax1,x0,ILi,'k','LineWidth',2)
plot(ax1,x0,ILit,'r--')
legend(ax1,{'Estimated','Theoretical'});
saveas(fig,'savedFigure','eps');

%Plot E and IL vs time
fig2=figure('visible','off');
set(fig2, 'Position',  [567,165,838,413])
set(gcf,'color','w');
ax2 = subplot(1,2,1);
hold(ax2,'on')
grid(ax2,'on')
xlabel(ax2,'$t$','Interpreter','Latex','FontSize', 14)
ylabel(ax2,'$\mathcal{L}$','Interpreter','Latex','FontSize', 14)

ax3 = subplot(1,2,2);
hold(ax3,'on')
grid(ax3,'on')
xlabel(ax3,'$t$','Interpreter','Latex','FontSize', 14)
ylabel(ax3,'$\mathcal{E}$','Interpreter','Latex','FontSize', 14)

for k=1:length(x0)
load(strcat('ILvsx0',num2str(k)));
plot(ax2,t,IL,'k','LineWidth',2)
plot(ax2,t,ILt,'r--')

plot(ax3,t,E,'k','LineWidth',2)
plot(ax3,t,Et,'r--')
end
legend(ax2,{'Estimated','Theoretical'});
saveas(fig2,'savedFigure','eps');
