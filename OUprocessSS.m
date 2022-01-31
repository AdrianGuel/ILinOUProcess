%Information length from stochastic simulation of the OU process
%      dx = theta * ( mu - x(t) ) dt + sigma dW,   
%      x(0) = x0,
% using an initial gaussian distribution p(x,0)~N(0,sigma)

close all;
clc

%Stochastic simulation
theta=3;
mu=0;
sigma=0.1;
D=(sigma^2);
x0=-5:.1:5;
%x0=1;
N=2e5;
tmax=10;
timerVal = tic;
ILi=zeros(1,length(x0));
ILit=zeros(1,length(x0));
for l=1:length(x0)
    g = gpuDevice(1);
    [t,x]=ornstein_uhlenbeck_euler_maruyama ( theta, mu, sigma, x0(l), tmax, N);

    %deterministic solution of mu and sigma
    %tspan = [0 5];   

    opts = odeset('RelTol',1e-8,'AbsTol',1e-12);
    [t,y] = ode45(@(t,y) Sigmax(t,y,theta,D), t,  sigma, opts);
    [t,M] = ode45(@(t,y) Mux(t,y,theta), t, x0(l), opts);
    %plot ( t, x, 'k-' )

    xaux = linspace(-6,6,N);
    %xi=zeros(length(xaux),length(t),'gpuArray');
    f=zeros(length(xaux),length(t));
    %z=zeros(length(xaux),length(t));

    for k=1:length(t)
        %[f(:,k),xi(:,k)] = ksdensity(x(:,k),xaux);
        pd=fitdist(x(:,k),'normal');
        f(:,k)= pdf(pd,xaux);
        %z(:,k) = normpdf(xaux,M(k),sqrt(y(k)));

    %if mod(k,100)==0
          %plot(ax1,xi(:,k),f(:,k),'k',xaux,z(:,k),'b');
         % plot(ax1,xaux,f(:,k),'k',xaux,z(:,k),'b--');
        %end
    end
    % E=zeros(1,length(t));

    Ts=diff(t);
    % for k=2:length(t)
    %     E(k) =  4*(sum(sqrt(z(:,k))-sqrt(z(:,k-1)))/Ts(1))^2;
    % end

    %%Computation of IL
    % [fxz,fyz] = gradient(sqrt(z),Ts(1));
    % Ez=trapz(xaux,4*fxz.^2,1);
    % ILz=cumtrapz(t,Ez);

    [fx,fy] = gradient(sqrt(f),Ts(1));
    %fx= gradient(sqrt(f),Ts(1));
    E=trapz(xaux,4*fx.^2,1);
    IL=cumtrapz(t,sqrt(E));

    Et=((-theta*M).^2)./y+0.5*((-2*theta*y+D)./y).^2;
    ILt=cumtrapz(t,sqrt(Et));
    ILi(l)=IL(end);
    ILit(l)=ILt(end);
    save(strcat('f',num2str(l)),'f','-v7.3');
    save(strcat('ILvsx0',num2str(l)),'xaux','E','Et','IL','ILt','t','y','M');
    reset(g);
end

tEnd = toc(timerVal); 
save('ILvsx0','ILi','ILit','x0');


function dydt = Sigmax(t,y,theta,D)
   dydt=-2*theta*y+D;
end
 
function dydt = Mux(t,y,theta)
   dydt=-theta*y;
end
