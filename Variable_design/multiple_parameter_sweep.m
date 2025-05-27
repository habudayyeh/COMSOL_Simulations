%This code sweeps multiple parameters of the nanoantenna and calculates
%the optimum parameters. The best parameters are the ones which have the
%best collection eff. for a single mode fiber i.e. with NA=0.12. 
% The parameters that are sweeped are the central gap width, the period of
% the grooves, and the width and height of the grooves 

%% INITIALIZE VECTORS AND CONSTANTS
clear all
clc
theta=-pi/2:0.01:3*pi/2;
theta2=0:0.01:pi;
[x,y]=pol2cart(theta,ones(1,length(theta)));
theta=theta-pi/2;
intensity=zeros(length(theta),6,6,6,6);
Coll_int=zeros(length(theta2),6,6,6,6);
SM_coup_eff=zeros(6,6,6,6);
ix1=0;
ix2=0;
ix3=0;
ix4=0;
max_SM_Coup_eff=0;
log_id=fopen('output/log.txt','w');

%% EVALUATE THE COLL. EFF. FOR EACH SET OF PARAMETERS
fprintf(log_id,'Log file for vaiable design model\n');
fprintf(log_id,'Optimization began: %s\n',datestr(now));

for x1=200:200:1200
    ix1=ix1+1;
    for x2=x1+200:200:x1+1200
        ix2=ix2+1;
       for x3=x2+200:200:x2+1200
           ix3=ix3+1;
            for x4=x3+200:200:x3+1200
                ix4=ix4+1;
                model=model(x1,x2,x3,x4);
                Efar=mphinterp(model,'emw.normEfar','Coord',[x;y]);
                intensity=Efar.^2;
                str_parameters={'x1',x1;'x2',x2;'x3',x3;'x4',x4};
                I_fit=fit(theta',intensity','cubicinterp');
                Coll_int=integrate(I_fit,theta2,0)-integrate(I_fit,-theta2,0);
                SM_coup_eff=Coll_int(13)/max(Coll_int);
                file_name=sprintf('%s%s%d%s%d%s%d%s%d%s','output/','x1_',...
                    x1,'_x2_',x2,'_x3_',x3,'_x4_',x4,'.mat');
                save(file_name,'theta2','Coll_int','theta','Efar','intensity','str_parameters')
                if  SM_coup_eff>=max_SM_Coup_eff
                    max_SM_Coup_eff= SM_coup_eff;
                    x1_max=x1;
                    x2_max=x2;
                    x3_max=x3;
                    x4_max=x4;
                    max_Coll_int=Coll_int;
                    max_intensity=intensity;
                    max_Efar=Efar;
                    fprintf(log_id,'Temp. Max found for x1=%d,x2=%d,x3=%d,x4=%d, SM coup. eff=%f\n',...
                        x1_max,x2_max,x3_max,x4_max,max_SM_Coup_eff);
                end
                clear model
            end
        end
    end
end
fprintf(log_id,'Optimization Ended,Max found for x1=%d,x2=%d,x3=%d,x4=%d, SM coup. eff=%f\n',...
                        x1_max,x2_max,x3_max,x4_max,max_SM_Coup_eff);
%% FIND AND PLOT THE BEST SET OF PARAMETERS 
h(1)=figure;
polar(theta,max_Efar)
text(0,0,sprintf('%s %d\n %s %d\n %s %d\n %s %d' ,'x1',x1_max,'x2',x2_max,...
    'x3',x3_max,'x4',x4_max))
max_coll_eff=max_Coll_int/max(max_Coll_int);

h(2)=figure;
plot(theta2,max_coll_eff)
text(2.6,0.5,sprintf('%s %d\n %s %d\n %s %d\n %s %d\n %s %f' ,'x1', x1_max,'x2',...
    x2_max,'x3',x3_max,'x4',x4_max, 'max SM Coup eff=', max_SM_Coup_eff))
savefig(h,'output\max_coup_eff.fig');
fclose(log_id);