function    Switch(fr_s1,fr_s2,fr_Y_env, fr_Y_cert,R)

%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
 clear inform;M=1;
     clear  fi1  fi2  fi3  fn1  fn2  fn3 
     inform(1,:)=R(:,1);inform(2,:)=R(:,3);inform(3,:)=R(:,4);inform(4,:)=R(:,5);
    for i=1:73
       data_select(i).sbject.S_fr_Y_env=cell(1,1);         
       data_select(i).sbject.informm=zeros(1,1);
       data_select(i).sbject.s1fi=cell(1,1);    
       data_select(i).sbject.s2fi=cell(1,1);  
       data_select(i).sbject.S_fr_Y_cert=cell(1,1);  
    end
     for i=1:73 
      data_select(i).sbject.S_fr_Y_env=cell(1,200);         
      data_select(i).sbject.informm=inform(:,M:M+199);
      M=M+200;
     end
     M=1;
     for i=1:73  
         for j=1:200
      data_select(i).sbject.s1fi{1,j}=fr_s1{1,M};
      data_select(i).sbject.s2fi{1,j}=fr_s2{1,M};
      M=M+1;
         end
     end
     M=1;
      for i=1:73  
         for j=1:200
      data_select(i).sbject.S_fr_Y_env{1,j}=fr_Y_env{1,M};
      data_select(i).sbject.S_fr_Y_cert{1,j}=fr_Y_cert{1,M};
      M=M+1;
         end
      end
  clear inform inform1 e1 e2 e3 fi1 fi2 fi3 clear index3;
      A=1 ;B=1;C=1;
     for i=1:73
     coh=0;error=0;
     inform= data_select(i).sbject.informm;j=2;
      while(j<=199)
           if(inform(4,j)==0)
          if  (inform(3,j)~=inform(3,j+1))% && inform(4,j+1)==1) % ||(inform(4,j)==1 && inform(3,j)==inform(3,j-1)))
        %                       
              index3(1,C)=(i-1)*200+j;% 
              C=C+1; j=j+1;
              end
           end           
            j=j+1;
  end     
     end 
     %%
   clear sw3 sw2 sw1 ir3 ir2 ir1 fs13 fs12 fs11 fs23 fs22 fs21 anum
   k=size(index3,2); anum=randi([1 k],1,20);
       clear  ing_sw3  ing_sw2  ing_sw1 Mean_ing1 Mean_ing2 Mean_ing3  aing_sw1  aing_sw2  aing_sw3
   clear cet_sw3  cet_sw2   Mean_cet1 Mean_cet2 Mean_cet3  acet_sw1  acet_sw2  acet_sw3
   clear  ama_ing1 ama_ing2 ama_ing3  ama_cet1  ama_cet2 ama_cet3  num_aing;
   clear  s1_sw3  s1_sw2  s1_sw1 Mean_s11 Mean_s12 Mean_s33  as1_sw1  as1_sw2  as1_sw3
   clear  s2_sw3  s2_sw2  s2_sw1 Mean_s21 Mean_s22 Mean_s33  as2_sw1  as2_sw2  as2_sw3
    clear allre3 allre2 allre1 as  ama_env1  ama_env2  ama_env3
   clear numnan1 numnan2 numnan3 arrmean1 arrmean2 arrmean3  
   clear Tnan1;

   Nindex=size(index3,2);
   for i=1: Nindex
     k=index3(1,i);
     aing_sw3{1,i}=fr_Y_env{1,k+2}; aing_sw3{1,i}(end,1)=NaN;
     aing_sw2{1,i}=fr_Y_env{1,k-1}; aing_sw2{1,i}(end,1)=NaN;
     acet_sw3{1,i}=fr_Y_cert{1,k+2};acet_sw2{1,i}=fr_Y_cert{1,k-1};
     as1_sw3{1,i}=fr_s1{1,k+2};as1_sw2{1,i}=fr_s1{1,k-1};
     as2_sw3{1,i}=fr_s2{1,k+2};as2_sw2{1,i}=fr_s2{1,k-1};
   end
   for i=1: Nindex       
    num1(2,i)=size(aing_sw2{1,i},1); num1(3,i)=size(aing_sw3{1,i},1);
       end   
  ama_ing2= nan(max(num1(2,:)),Nindex);ama_ing3= nan(max(num1(3,:)),Nindex);
   ama_cet2= nan(max(num1(2,:)),Nindex);ama_cet3= nan(max(num1(3,:)),Nindex);
   ama_s12= nan(max(num1(2,:)),Nindex);ama_s13= nan(max(num1(3,:)),Nindex);
   ama_s22= nan(max(num1(2,:)),Nindex);ama_s23= nan(max(num1(3,:)),Nindex);
   for i=1: Nindex
     ans=aing_sw2{1,i};a=size(ans,1);ama_ing2(1:a,i)=ans;clear ans a;
     ans=aing_sw3{1,i};a=size(ans,1);ama_ing3(1:a,i)=ans;clear ans a;
     ans=acet_sw2{1,i};a=size(ans,1);ama_cet2(1:a,i)=ans;clear ans a;
     ans=acet_sw3{1,i};a=size(ans,1);ama_cet3(1:a,i)=ans;clear ans a;
     ans=as1_sw2{1,i};a=size(ans,1);ama_s12(1:a,i)=ans;clear ans a;
     ans=as1_sw3{1,i};a=size(ans,1);ama_s13(1:a,i)=ans;clear ans a;
     ans=as2_sw2{1,i};a=size(ans,1);ama_s22(1:a,i)=ans;clear ans a;
     ans=as2_sw3{1,i};a=size(ans,1);ama_s23(1:a,i)=ans;clear ans a;    
   end
    %%%%%%%%%%%%%%%%%%%%%
   
     for i=1:max(num1(2,:))
      clear ans; ans=isnan((ama_ing2(i,:)));ans=find(ans==1);Tnan1(i,3)= length(ans);
      end
    for i=1:max(num1(3,:))
     clear ans; ans=isnan((ama_ing3(i,:)));ans=find(ans==1);Tnan1(i,5)= length(ans);
    end
    for i=1:size(ama_ing2,2)
        ama_ing2(:,i)= ama_ing2(:,i)- ama_ing2(1,i);
        ama_ing3(:,i)= ama_ing3(:,i)- ama_ing3(1,i);
    end
      Tnan1(:,4)= Nindex-Tnan1(:,3);Mean_ing2(:,1)=mean(ama_ing2,2,'omitnan');
      Tnan1(:,6)= Nindex-Tnan1(:,5);Mean_ing3(:,1)=mean(ama_ing3,2,'omitnan');
      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
     Mean_cet2(:,1)=mean(ama_cet2,2,'omitnan');
     Mean_cet3(:,1)=mean(ama_cet3,2,'omitnan');
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
    for i=1:size(ama_s12,2)
        ama_s12(:,i)= ama_s12(:,i)- ama_s12(1,i);
        ama_s13(:,i)= ama_s13(:,i)- ama_s13(1,i);
        ama_s22(:,i)= ama_s22(:,i)- ama_s22(1,i);
        ama_s23(:,i)= ama_s23(:,i)- ama_s23(1,i);
    end  
    
    clear Mean_s12 Mean_s13 Mean_s22 Mean_s23
     Mean_s12(:,1)=mean(ama_s12,2,'omitnan');
     Mean_s13(:,1)=mean(ama_s13,2,'omitnan');
     Mean_s22(:,1)=mean(ama_s22,2,'omitnan');
     Mean_s23(:,1)=mean(ama_s23,2,'omitnan');
      %%%%%%%%%%%%%%
    
   figure;
   for j=1:20 
    hold all;ii=anum(1,j);i=index3(ii);
    clear sw1 sw2 sw3 ir1 ir2 ir3;        
    ing_sw3= fr_Y_env{1,i+2}; ing_sw3(:,1)=ing_sw3(:,1)-ing_sw3(1,1);
    ing_sw2= fr_Y_env{1,i-1};ing_sw2(:,1)=ing_sw2(:,1)-ing_sw2(1,1);%sw2(:,end)=sw2(:,end);%+fr_Y_cert{1,i-1}(:,end);
    %plot(ing_sw3,'color',[.7 1 .7]); plot(ing_sw2,'color',[1 .7 .7]);
    plot(ing_sw3,'color',[0  0 0]); plot(ing_sw2,'color',[1 0 1 ]);
   end
   
    hold all; 
     n1=plot(Mean_ing2(1:1500,1),'m','linewidth',2); hold all;
     n2=plot(Mean_ing3(1:1500,1),'k','linewidth',2); hold all;
    % text(1,1.2,'Integral Population ','FontSize',10);
      x=[0,0];  y=[-0.05 1];
      line(x,y,'Color','black','LineStyle','--');
      set(gca,'TickDir','out');
      set(gca, 'YTick',[0 .6 1.2],'FontSize',10)%ok
      set(gca, 'XTick',[0 1500])
      axis([-100 1800 -0.05 1.2])     
      x0=0;y0=0;width=330.045524;height=250.585736;%width=660.091047;
          set(gcf,'position',[x0,y0,width,height]);
     xlabel('Time relative to feedback (ms)','FontSize',10);  
  ylabel('Firing rate(Hz)','FontSize',10);  
     legend([n1,n2],'2pre-Switch ','Switch','FontSize',8);
          legend('boxoff');
     %%%%%%%%%%%%%%%%%%%%%%%%
   figure;
   for j=1:20 
    hold all;ii=anum(1,j);i=index3(ii); 
    cet_sw3= fr_Y_cert{1,i+2};%sw3(:,end)=sw3(:,end);%+fr_Y_cert{1,i}(:,end); 
    cet_sw2= fr_Y_cert{1,i-1};%sw2(:,end)=sw2(:,end);%+fr_Y_cert{1,i-1}(:,end);
    plot(cet_sw2,'color',[1 0 1]); plot(cet_sw3,'color',[0 0 0]);
   end
     hold all; 
     n1=plot(Mean_cet2(1:1500,1),'m','linewidth',2); hold all;
     n2=plot(Mean_cet3(1:1500,1),'k','linewidth',2); hold all;
     %text(1,40,'Certainty Population','FontSize',8);
    x=[0,0];  y=[-0.1 35];
       line(x,y,'Color','black','LineStyle','--');
        set(gca,'TickDir','out');
          set(gca, 'YTick',[0 20 40 ],'FontSize',10)%ok
       set(gca, 'XTick',[0 1500])
        axis([-100 1800 -0.1 45])     
     x0=0;y0=0;width=330.045524;height=250.585736;%width=660.091047;
          set(gcf,'position',[x0,y0,width,height]);
     xlabel('Time relative to feedback (ms)','FontSize',10);  
  ylabel('Firing rate(Hz)','FontSize',10);  
     legend([n1,n2],'2pre-Switch ','Switch','FontSize',8);
          legend('boxoff');
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   
     figure;hold all;
   for j=1:20 
    hold all;ii=anum(1,j);i=index3(ii); 
    s1_sw3=fr_s1{1,i+2};s1_sw3(:,1)= s1_sw3(:,1)- s1_sw3(1,1);
    s1_sw2=fr_s1{1,i-1};s1_sw2(:,1)= s1_sw2(:,1)- s1_sw2(1,1);
    s2_sw3=fr_s2{1,i+2};s2_sw3(:,1)= s2_sw3(:,1)- s2_sw3(1,1);
    s2_sw2=fr_s2{1,i-1};s2_sw2(:,1)= s2_sw2(:,1)- s2_sw2(1,1);
    plot(s1_sw2,'color',[1 0 1]);hold all; plot(s2_sw2,'--','color',[0 0 0 ]);
    plot(s1_sw3,'color',[1 0 1]);hold all;plot(s2_sw3,'--','color',[0 0 0 ]);
   end 
   %%%%%%%%%%%%%%%%%%%%%%%%%%%
     hold all; 
     n1=plot(Mean_s12(1:1500,1),'m','linewidth',2); hold all;
     n2=plot(Mean_s13(1:1500,1),'k','linewidth',2); hold all;
     plot(Mean_s22(1:1500,1),'--m','linewidth',2); hold all;
     plot(Mean_s23(1:1500,1),'--k','linewidth',2); hold all;
     text(100,.2,'Sensorimorot Population ','FontSize',8);
    x=[0,0];  y=[-0.05 .55];
       line(x,y,'Color','black','LineStyle','--');
        set(gca,'TickDir','out');
       set(gca, 'YTick',[0 .3 .6 ],'FontSize',10)%ok
       set(gca, 'XTick',[0 1500])
      axis([-100 1800 -0.05 .65])     
      x0=0;y0=0;width=330.045524;height=250.585736;%width=660.091047;
      set(gcf,'position',[x0,y0,width,height]);
   xlabel('Time relative to feedback (ms)','FontSize',10);  
  ylabel('Firing rate(Hz)','FontSize',10);  
   legend([n1,n2],'2pre-Switch winner neuronal pop ','Switch winner neuronal pop ','FontSize',8);
          legend('boxoff');    

end

