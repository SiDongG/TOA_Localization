
Error=zeros(4,5);
y=1;
Var=1e-4*[0.0017968    0.0122    0.032401    0.085216    0.13898]; 
for Mode=1:4
    index=1;
    disp(Mode)
    for position=2:2:10
        x=sqrt(position^2-y^2);
        sum=0;
        var=Var(position/2);
        for i=1:100
            [X,Y]=Multilateration_LLS(Mode,x,y,var);
            sum=(X-x)^2+(Y-y)^2;
        end
        Error(Mode,index)=sum;
        index=index+1;
    end
end        

figure;
hold on; box on;
plot(2:2:10,Error(1,:),'k-','LineWidth',1);
plot(2:2:10,Error(2,:),'g-','LineWidth',1);
plot(2:2:10,Error(3,:),'r-','LineWidth',1);
plot(2:2:10,Error(4,:),'b-','LineWidth',1);

legend('LLS1','LLS2','WLLS','2SWLLS')

        