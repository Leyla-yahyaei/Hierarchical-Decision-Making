function  [y_1,y_2,s1,s2,response_time,Y_enviroment,Y_certainty]=Hierarchical_decision_module(coh,trial_length,Y_enviroment) 
%global dt; global trial_length; global stim_onset;
% Initialise response time.
clear y_1 y_2 s1  s2 y_env;
response_time=0;
dt = 0.5;%dt = 0.0005;
%%%%%%%%%%%% DECISION PARAMETERS
%%%% Synaptic time and other constants
tnmda=100; % NMDAr
tampa=2;   % AMPAr
gamma=0.641;  % Gamma
% FI curve parameters
a = 270; b = 108; d = 0.1540;  % Parameters for excitatory cells
% Parameters to be varied
mu0       = 30.0;      % External stimulus strength
noise_amp = 0.025;     % Noise amplitude into selective populations
%noise_amp1 = 0.055;     % Noise amplitude into selective populations
%---- Initial conditions and clearing variables -----------
s1_in=0.1; s2_in=0.1;
I_eta1_in = noise_amp*randn ; I_eta2_in = noise_amp*randn ;
I_noise1_in=noise_amp*randn ;I_noise2_in=0.025*randn ;I_noise3_in=0.025*rand;
% Intialise and vectorise variables to be used in loops below
s1 = s1_in.*ones(1,trial_length); s2 = s2_in.*ones(1,trial_length);
I_eta1 = I_eta1_in.*ones(1,trial_length);%noise
I_eta2 = I_eta2_in.*ones(1,trial_length);
I_noise1 = I_noise1_in.*ones(1,trial_length);
I_noise2 = I_noise2_in.*ones(1,trial_length);
I_noise3 = I_noise3_in.*ones(1,trial_length);

%%%%%%%%%%%% UNCERTAINTY MODULE PARAMETERS:
gain_uncertainty = 1;   % Gain of input-output function (cf. Wong & Wang, 2006)
tau_mc_uncertainty = 150;        % Membrane time constant (cf. Wilson and Cowan, 1972)
gain_inh = 1;           % Gain of input-output function (cf. Wong & Wang, 2006)
tau_mc_inhibitory = 150;% Membrane time constant (cf. Wilson and Cowan, 1972)
j_mc0 = 0.009;          % Excitation constant from uncertainty to sensorimotor
j_mc_v_inh = 1;         % Coupling strength from decision module to inhibtory neural population
mu= 30;                 % Tonic constant bias input used for uncertainty-encoding I-O function.
j_u_inh = 0.5;          % Inhibition strength constant from inhibitory neural population to to uncertainty-encoding neural population
j_self_uncertainty = 0; % Self excitation constant for uncertainty populations.
t_u = 50;%500;              % Integration delay after simtulus onset for uncertinaty-encoding population
% tU is the time delay from stimulus onset to activation onset (by removing the top-down inhibition) 
t_inh =50;%500;            % Integration delay after simtulus onset for Inhibtory population
% Initialise state vectors with zeros (for better performance)
y_mc_inhibitory = zeros(1,trial_length);
Y_certainty = zeros(1,trial_length);
 I_enviroment =zeros(1,1);I_certainty =zeros(1,1);
%y_mc_uncertainty = zeros(1,trial_length);
%overall_mc_input = zeros(1,trial_length);  
% Initialise state vectors with zeros (for better performance)
y_1 = zeros(1,trial_length); y_2 = zeros(1,trial_length);
% Initialise state vectors with zeros (for better performance)
Isyn1 = zeros(1,trial_length); Isyn2 = zeros(1,trial_length);
% Booleans to indicate decision threshold crossing in sensorimotor % module.
decision_module_crossed = false;
y_env=zeros(1,trial_length);
for t=1:trial_length-1
      %Constant effective external current input
    I0E1 = 0.3255; I0E2 = 0.3255; %I0;    
    % External stimulus
    NFF=0; if coh~=0  NFF=1; end
    JAext =0.00052; %0.00052; % Synaptic coupling constant to external inputs    
    I_stim_1=NFF*JAext*mu0*(1+coh/100); % To population 1
    I_stim_2=NFF*JAext*mu0*(1-coh/100); % To population 2     
    % Recurrent synaptic coupling constants
%     JN11 = 0.2500; JN22 = 0.2500; % 1.59
%      JN12 = 0.0497; JN21 = 0.0497;
   JN11 = 0.2609; JN22 = 0.2609; % 1.59% ok hast
   JN12 = 0.0497; JN21 = 0.0497;
    %%%% FI curve parameters %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     JA_vec = [0, 0.0005, 0.0010, 0.0015, 0.0020];
%     JA11 = JA_vec(1); JA22 = JA11; JA12 = 0.1*JA11; JA21 = JA12;
       % Resonse function of competiting excitatory population 1
    Isyn1(t)=JN11.*s1(t)-JN12.*s2(t)+I0E1+I_stim_1+ I_eta1(t);
    Isyn2(t)=JN22.*s2(t)-JN21.*s1(t)+I0E2+I_stim_2+ I_eta2(t);
   %fA1 = JA12*( -276*Isyn2 + 106 ).*( sign(Isyn2-0.4) + 1 )/2;
    y_1(t)=(a.*Isyn1(t) - b)./(1-exp(-d.*(a.*Isyn1(t)-b)));
    % Response function of competiting excitatory population 2
    %fA2 = JA12*( -276*Isyn1 + 106 ).*( sign(Isyn1-0.4) + 1 )/2;
    y_2(t)=(a.*Isyn2(t)-b)./(1- exp(-d.*(a.*Isyn2(t)-b)));    
    % Dynamical equations   % Mean NMDA-receptor dynamics
     s1(t+1)=s1(t)+dt*(-(s1(t)/tnmda)+(1-s1(t))*gamma*y_1(t)/1000);
     s2(t+1)=s2(t)+dt*(-(s2(t)/tnmda)+(1-s2(t))*gamma*y_2(t)/1000); 
        % Noise through synaptic currents of pop1 and 2
    I_eta1(t+1)=I_eta1(t)+(dt/tampa)*(-I_eta1(t))+sqrt(dt/tampa)*noise_amp*randn;
    I_eta2(t+1)=I_eta2(t)+(dt/tampa)*(-I_eta2(t))+sqrt(dt/tampa)*noise_amp*randn;    
    % To ensure firing rates are always positive
    if (y_1(t) < 0 ) y_1(t) = 0;  end
    if (y_2(t) < 0)  y_2(t) = 0;  end    
    I_noise1(t+1)=I_noise1(t)+(dt/tampa)*(-I_noise1(t))+sqrt(dt/tampa)*noise_amp*randn;
    I_noise2(t+1)=I_noise2(t)+(dt/tampa)*(-I_noise2(t))+sqrt(dt/tampa)*noise_amp*randn; 
   %%%%%%%%%%%%%%%%%%%%%%%%ENVIROMENT MODULE INTEGRATE:
   y_conf(t)=abs(y_1(t)-y_2(t)); %  j_self_env=0;
   t_env=100;%50ms% Integration delay after simtulus onset for uncertinaty-encoding population
   gain_confidence =1.3;%1.3;%1.7;% 1.4;%1.6;  % Coupling strength from decision module to certainty neural population      
   gain_certainty=1;      % Gain of input-output function (cf. Wong & Wang, 2006)
   tc_certainty = 150;    % Membrane time constant (cf. Wilson and Cowan, 1972)
  % input to enviroment;
  %tc_counter=150;
   gain_enviroment =1;  % Gain of input-output function (cf. Wong & Wang, 2006)
   %gain_input_enviroment=.9; % Coupling strength from certainty to enviroment neural population      
   tc_enviroment=150; % Membrane time constant (cf. Wilson and Cowan, 1972)
   Self_exc_enviroment=1.44;%1.44;%1.46;%1.4;% 1.08;%1.08;%1.1;%1.38;%38;%1.38;%1.35;%Self excitation constant for uncertainty populations.
   Self_exc_counter=1; %1.01;%
   gain_counter=1;
   top_down_enviroment=((t_env)/dt>t)*1000;    
   I_certainty =(gain_confidence*y_conf(t));%-top_down_enviroment;%Gain=wiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii       
   Fi_certainty=heaviside(I_certainty )*I_certainty ;% Input-Output function%firing rate
   Y_certainty(t+1)=Y_certainty(t)+(dt/tc_certainty)*(-Y_certainty(t)+Fi_certainty+I_noise1(t));%%Noise% Dynamical equations.
   I_enviroment =gain_enviroment*(Self_exc_enviroment*Y_enviroment(t));%-(j_u_inh * y_mc_inhib(t));%-top_down_enviroment;
   Fi_enviroment=heaviside(I_enviroment )*I_enviroment ;%Input-Output function     
   Y_enviroment(t+1)=Y_enviroment(t)+(dt/tc_enviroment)*...
     (-Y_enviroment(t)+Fi_enviroment+I_noise2(t)); 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
end    %%%%%%%%%%%%%%%%%%%%%%%%%%%UNCERTAINTY MODULE INTEGRATE END    
end
 % Function end
