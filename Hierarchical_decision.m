% Copyright 2023 Leyla-yahyaie%
% Hierarchical Decision-Making _modelling is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.%
% strategy-monitoring_modelling is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.%
% You should have received a copy of the GNU General Public License
% along with strategy-monitoring_modelling.  If not, see <https://www.gnu.org/licenses/>.
% global dt; global trial_length; global stim_onset; global stim_duration;
clear;
info_data(1)=load('data_info/S1_1_info.mat');
info_data(2)=load('data_info/S1_2_info.mat');
info_data(3)=load('data_info/S1_3_info.mat');
info_data(4)=load('data_info/S1_4_info.mat');
info_data(5)=load('data_info/S2_1_info.mat');
info_data(6)=load('data_info/S2_2_info.mat');
info_data(7)=load('data_info/S2_3_info.mat');
info_data(8)=load('data_info/S2_4_info.mat');
info_data(9)=load('data_info/S3_1_info.mat');
info_data(10)=load('data_info/S3_2_info.mat');
info_data(11)=load('data_info/S3_3_info.mat');
info_data(12)=load('data_info/S3_4_info.mat');
info_data(13)=load('data_info/S4_1_info.mat');
info_data(14)=load('data_info/S4_2_info.mat');
info_data(15)=load('data_info/S4_3_info.mat');
info_data(16)=load('data_info/S4_4_info.mat');
info_data(17)=load('data_info/S4_5_info.mat');
info_data(18)=load('data_info/S4_6_info.mat');
info_data(19)=load('data_info/S5_1_info.mat');
info_data(20)=load('data_info/S5_2_info.mat');
info_data(21)=load('data_info/S5_3_info.mat');
info_data(22)=load('data_info/S5_4_info.mat');
info_data(23)=load('data_info/S5_5_info.mat');
info_data(24)=load('data_info/S5_6_info.mat');
info_data(25)=load('data_info/S6_1_info.mat');
info_data(26)=load('data_info/S6_2_info.mat');
info_data(27)=load('data_info/S6_3_info.mat');
info_data(28)=load('data_info/S6_4_info.mat');
info_data(29)=load('data_info/S7_1_info.mat');
info_data(30)=load('data_info/S7_2_info.mat');
info_data(31)=load('data_info/S7_3_info.mat');
info_data(32)=load('data_info/S7_4_info.mat');
info_data(33)=load('data_info/S8_1_info.mat');
info_data(34)=load('data_info/S8_2_info.mat');
info_data(35)=load('data_info/S8_3_info.mat');
info_data(36)=load('data_info/S8_4_info.mat');
info_data(37)=load('data_info/S9_1_info.mat');
info_data(38)=load('data_info/S9_2_info.mat');
info_data(39)=load('data_info/S9_3_info.mat');
info_data(40)=load('data_info/S9_4_info.mat');
info_data(41)=load('data_info/S10_1_info.mat');
info_data(42)=load('data_info/S10_2_info.mat');
info_data(43)=load('data_info/S10_3_info.mat');
info_data(44)=load('data_info/S10_4_info.mat');
info_data(45)=load('data_info/S10_5_info.mat');
info_data(46)=load('data_info/S11_1_info.mat');
info_data(47)=load('data_info/S11_2_info.mat');
info_data(48)=load('data_info/S11_3_info.mat');
info_data(49)=load('data_info/S11_4_info.mat');
info_data(50)=load('data_info/S11_5_info.mat');
info_data(51)=load('data_info/S12_1_info.mat');
info_data(52)=load('data_info/S12_2_info.mat');
info_data(53)=load('data_info/S12_3_info.mat');
info_data(54)=load('data_info/S12_4_info.mat');
info_data(55)=load('data_info/S13_1_info.mat');
info_data(56)=load('data_info/S13_2_info.mat');
info_data(57)=load('data_info/S13_3_info.mat');
info_data(58)=load('data_info/S13_4_info.mat');
info_data(59)=load('data_info/S14_1_info.mat');
info_data(60)=load('data_info/S14_2_info.mat');
info_data(61)=load('data_info/S14_3_info.mat');
info_data(62)=load('data_info/S14_4_info.mat');
info_data(63)=load('data_info/S15_1_info.mat');
info_data(64)=load('data_info/S15_2_info.mat');
info_data(65)=load('data_info/S15_3_info.mat');
info_data(66)=load('data_info/S16_1_info.mat');
info_data(67)=load('data_info/S16_2_info.mat');
info_data(68)=load('data_info/S16_3_info.mat');
info_data(69)=load('data_info/S16_4_info.mat');
info_data(70)=load('data_info/S17_1_info.mat');
info_data(71)=load('data_info/S17_2_info.mat');
info_data(72)=load('data_info/S17_3_info.mat');
info_data(73)=load('data_info/S17_4_info.mat');
dt = 0.5;num=0;tc_enviroment= 150;
%%%%Threshold values:
decision_module_threshold = .5;
%motor_target_threshold = 17.4;
%%%%%%%%%%%%%%%%%%%%%%
% clearvars -except coherences motor_target_threshold decision_module_threshold ...
%     stim_duration stim_onset trial_length dt
% coherences = [0,3.2,6.4,12.8,25.6,51.2];
n_of_trials = 200;Start=tic;
% This is the struct where all the results are saved.
% % Main nested for loop.nv_choice',0,'feedback',0,'confidence',0,'endconf',0),10,1);
index=0;
% Each evidence quality is assumed to be a block of trials.
clear fr_Y_env  fr_Y_cert fr_s1 fr_s2 fr_counter
for k = 1:73%no_of_blocks
    k
    duration=info_data(k).info.SD; coherences=info_data(k).info.coh;
    enviroment=info_data(k).info.enviroment;
    env_choice=1;
    %%%%%%%%%%%%%%%%%%
    
    i=1; y_env=zeros(1,1);Y_enviroment=.05;chang=0;%Y_counter=.001;%.005
    gain_enviroment=1;Self_exc_enviroment=1.4;%1.08;
    band=.18;
    while(i<= n_of_trials)
        stim_duration=duration(i);coh= coherences(i); index = index+1;
        trial_length=round(stim_duration/(dt/1000));
        %This function integrates the sensorimotor module and uncertainty
        %module.
        [y_1,y_2,s1,s2,response_time,Y_enviroment,Y_certainty]=Hierarchical_decision_module(coh,trial_length,Y_enviroment) ;
        %###########################
        %%%% Save trial in struct:
        if(s1(1,end) > s2(1,end)) choice=1;
        else   choice=0;
        end
        conf=abs(s1(1,end)-s2(1,end));
        if (choice==0 || enviroment(i)~=env_choice)
            feedback(i)=0;
        else
            feedback(i)=1;
        end
        fr_Y_env{1,index}(:,1)=Y_enviroment;
        fr_Y_cert{1,index}(:,1)=Y_certainty;
        fr_s1{1,index}(:,1)=s1; fr_s2{1,index}(:,1)=s2;
        R(index,1)=coh;
        R(index,2)=choice;
        R(index,3)=enviroment(i);
        R(index,4)=env_choice;
        R(index,5)= feedback(i);
        R(index,6)=Y_enviroment(1,1);
        R(index,7)=Y_enviroment(1,end);
        R(index,9)=Y_certainty(1,end);
        Temp=Y_enviroment(1,end);
        if feedback(i)==0
            I_enviroment =gain_enviroment*(Self_exc_enviroment*Y_enviroment(1,end))...
                +1.32*Y_certainty(1,end);%+.0006;%*Y_counter(1,end);%.95%1.5
            Fi_enviroment=heaviside(I_enviroment )*I_enviroment ;
            Y_enviroment=Y_enviroment(1,end)+(dt/tc_enviroment)*...
                (-Y_enviroment(1,end)+Fi_enviroment)+(.025*randn);
            fr_Y_env{1,index}(end+1,1)=Y_enviroment;
            R(index,10)=Y_enviroment;
            band=band-.00856*band;%.0009
            if   (Y_enviroment(1,end)>band)  %2
                env_choice=~env_choice;
                Y_enviroment= .05;
                band=.18;
            end
        else
            Y_enviroment=.05;%+.0006;%*Y_counter(1,end);
            band=band-.00856*band; %.009
            fr_Y_env{1,index}(end+1,1)=Y_enviroment;
        end
        R(index,8)=Y_enviroment(1,1);
        clear Y_certainty; i=i+1;
        %%%%%%%%%%%%%%%%%%
        
    end
end
%% A function that plots consecutive errors effect on switch to new enviroment
Consecutive_errors(fr_s1,fr_s2,fr_Y_env, fr_Y_cert,R);

%% A function that plots urgency of the decision
Urgency(fr_s1,fr_s2,fr_Y_env, fr_Y_cert,R);

%% A function plots coherence effect of a decision
Coherence(fr_s1,fr_s2,fr_Y_env, fr_Y_cert,R);

%% A function plots switch vs noswitch
Switch(fr_s1,fr_s2,fr_Y_env, fr_Y_cert,R);
