function  Urgency(fr_s1,fr_s2,fr_Y_env, fr_Y_cert,R)

%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
 clear inform;M=1;
     clear  fi1  fi2  fi3  fm1  fm2  fm3 
     inform(1,:)=R(:,1);inform(2,:)=R(:,3);inform(3,:)=R(:,4);inform(4,:)=R(:,5);
     for i=1:73
      data_select(i).sbject.S_fr_Y_env=cell(1,200);         
      data_select(i).sbject.informm=inform(:,M:M+199); 
      M=M+200;
     end
     M=1;
     for i=1:73  
       for j=1:200
      data_select(i).sbject.S_fr_Y_env{1,j}=fr_Y_env{1,M};
      data_select(i).sbject.S_fr_Y_intg{1,j}=fr_Y_cert{1,M}; M=M+1;
         end
      end
  clear inform inform1 e1 e2 e3 fi1 fi2 fi3 clear index3;
      A=1 ;B=1;C=1;
     for i=1:73
     coh=0;error=0;
     inform= data_select(i).sbject.informm;j=10;
      while(j<=199)
           if  (inform(3,j)~=inform(3,j+1))% && inform(4,j+1)==1) % ||(inform(4,j)==1 && inform(3,j)==inform(3,j-1)))
        %  if inform(4,j)==0
             if (inform(3,j-1)==inform(3,j) && inform(3,j-2)==inform(3,j)...
               && inform(3,j-3)==inform(3,j) && inform(3,j-4)==inform(3,j) ...
               && inform(3,j-5)==inform(3,j) && inform(3,j-6)==inform(3,j) ...
               && inform(3,j-7)==inform(3,j) && inform(3,j-8)==inform(3,j)) ...
        % && inform(3,j-9)==inform(3,j))   
          index3(1,C)=(i-1)*200+j;C=C+1;
             end 
     %   end
          end
            j=j+1;
      end   
     end
    
     %%
    clear  ing_urg3  ing_urg2  ing_urg1 Mean_ing1 Mean_ing2 Mean_ing3  aing_urg1  aing_urg2  aing_urg3
   clear cet_urg3  cet_urg2  cet_urg1 Mean_cet1 Mean_cet2 Mean_cet3  acet_urg1  acet_urg2  acet_urg3
   clear  ama_ing1 ama_ing2 ama_ing3  ama_cet1  ama_cet2 ama_cet3 
   clear  s1_urg3  s1_urg2  s1_urg1 Mean_s11 Mean_s12  Mean_s13  as1_urg1  as1_urg2  as1_urg3
   clear  s2_urg3  s2_urg2  s2_urg1 Mean_s21 Mean_s22  Mean_s23  as2_urg1  as2_urg2  as2_urg3
   clear ama_s11 ama_s12 ama_s13 ama_s21 ama_s22 ama_s23 Tnan1 num_as1 num_as2
   k=size(index3,2); anum=randi([1 k],1,20);
   Nindex=size(index3,2);
   for i=1: Nindex
     k=index3(1,i);
     aing_urg3{1,i}=fr_Y_env{1,k};aing_urg2{1,i}=fr_Y_env{1,k-4};aing_urg1{1,i}=fr_Y_env{1,k-8};
    aing_urg3{1,i}(end,1)=NaN; aing_urg2{1,i}(end,1)=NaN; aing_urg1{1,i}(end,1)=NaN;
     acet_urg3{1,i}=fr_Y_cert{1,k};acet_urg2{1,i}=fr_Y_cert{1,k-4};acet_urg1{1,i}=fr_Y_cert{1,k-8};
     as1_urg3{1,i}=fr_s1{1,k};as1_urg2{1,i}=fr_s1{1,k-4};as1_urg1{1,i}=fr_s1{1,k-8};
     as2_urg3{1,i}=fr_s2{1,k};as2_urg2{1,i}=fr_s2{1,k-4};as2_urg1{1,i}=fr_s2{1,k-8};
   end
   for i=1: Nindex       
    num_aing(1,i)=size(aing_urg1{1,i},1);num_aing(2,i)=size(aing_urg2{1,i},1);num_aing(3,i)=size(aing_urg3{1,i},1);
    num_acet(1,i)=size(acet_urg1{1,i},1);num_acet(2,i)=size(acet_urg2{1,i},1);num_acet(3,i)=size(acet_urg3{1,i},1);
    num_as1(1,i)=size(as1_urg1{1,i},1);  num_as1(2,i)=size(as1_urg2{1,i},1); num_as1(3,i)=size(as1_urg3{1,i},1);
    num_as2(1,i)=size(as2_urg1{1,i},1);  num_as2(2,i)=size(as2_urg2{1,i},1); num_as2(3,i)=size(as2_urg3{1,i},1);
   end   
   ama_ing1=nan(max(num_aing(1,:)),Nindex);ama_ing2= nan(max(num_aing(2,:)),Nindex);ama_ing3= nan(max(num_aing(3,:)),Nindex);
   ama_cet1=nan(max(num_acet(1,:)),Nindex);ama_cet2= nan(max(num_acet(2,:)),Nindex);ama_cet3= nan(max(num_acet(3,:)),Nindex);
   ama_s11=nan(max(num_as1(1,:)),Nindex);ama_s12= nan(max(num_as1(2,:)),Nindex);ama_s13= nan(max(num_as1(3,:)),Nindex);
   ama_s21=nan(max(num_as2(1,:)),Nindex);ama_s22= nan(max(num_as2(2,:)),Nindex);ama_s23= nan(max(num_as2(3,:)),Nindex);
   for i=1: Nindex
     ans=aing_urg1{1,i};a=size(ans,1);ama_ing1(1:a,i)=ans;clear ans a;
     ans=aing_urg2{1,i};a=size(ans,1);ama_ing2(1:a,i)=ans;clear ans a;
     ans=aing_urg3{1,i};a=size(ans,1);ama_ing3(1:a,i)=ans;clear ans a;
     ans=acet_urg1{1,i};a=size(ans,1);ama_cet1(1:a,i)=ans;clear ans a;
     ans=acet_urg2{1,i};a=size(ans,1);ama_cet2(1:a,i)=ans;clear ans a;
     ans=acet_urg3{1,i};a=size(ans,1);ama_cet3(1:a,i)=ans;clear ans a;
     ans=as1_urg1{1,i};a=size(ans,1);ama_s11(1:a,i)=ans;clear ans a;
     ans=as1_urg2{1,i};a=size(ans,1);ama_s12(1:a,i)=ans;clear ans a;
     ans=as1_urg3{1,i};a=size(ans,1);ama_s13(1:a,i)=ans;clear ans a;
     ans=as2_urg1{1,i};a=size(ans,1);ama_s21(1:a,i)=ans;clear ans a;
     ans=as2_urg2{1,i};a=size(ans,1);ama_s22(1:a,i)=ans;clear ans a;
     ans=as2_urg3{1,i};a=size(ans,1);ama_s23(1:a,i)=ans;clear ans a;    
   end
    %%%%%%%%%%%%%%%%%%%%%
    for i=1:max(num_aing(1,:))
      clear ans; ans=isnan((ama_ing1(i,:)));ans=find(ans==1);Tnan1(i,1)= length(ans);
    end
     for i=1:max(num_aing(2,:))
      clear ans; ans=isnan((ama_ing2(i,:)));ans=find(ans==1);Tnan1(i,3)= length(ans);
      end
    for i=1:max(num_aing(3,:))
     clear ans; ans=isnan((ama_ing3(i,:)));ans=find(ans==1);Tnan1(i,5)= length(ans);
    end  
    for i=1:size(ama_ing1,2)
       ama_ing1(:,i)= ama_ing1(:,i)-ama_ing1(1,i); 
       ama_ing2(:,i)= ama_ing2(:,i)-ama_ing2(1,i);
       ama_ing3(:,i)= ama_ing3(:,i)-ama_ing3(1,i);
    end
      Tnan1(:,2)= Nindex-Tnan1(:,1);Mean_ing1(:,1)=mean(ama_ing1,2,'omitnan');
      Tnan1(:,4)= Nindex-Tnan1(:,3);Mean_ing2(:,1)=mean(ama_ing2,2,'omitnan');
      Tnan1(:,6)= Nindex-Tnan1(:,5);Mean_ing3(:,1)=mean(ama_ing3,2,'omitnan');
      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
      %%
       
      %%
       for i=1:size(ama_cet1,2)
        ama_cet1(:,i)= ama_cet1(:,i)-ama_cet1(1,i);
       ama_cet2(:,i)= ama_cet2(:,i)-ama_cet2(1,i);
       ama_cet3(:,i)= ama_cet3(:,i)-ama_cet3(1,i);
       end      
     Mean_cet1(:,1)=mean(ama_cet1,2,'omitnan');
     Mean_cet2(:,1)=mean(ama_cet2,2,'omitnan');
     Mean_cet3(:,1)=mean(ama_cet3,2,'omitnan');
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
      for i=1:size(ama_s11,2)
        ama_s11(:,i)=ama_s11(:,i)-ama_s11(1,i);
        ama_s12(:,i)=ama_s12(:,i)-ama_s12(1,i);
        ama_s13(:,i)=ama_s13(:,i)-ama_s13(1,i);
        ama_s21(:,i)=ama_s21(:,i)-ama_s21(1,i);
        ama_s22(:,i)=ama_s22(:,i)-ama_s22(1,i);
        ama_s23(:,i)=ama_s23(:,i)-ama_s23(1,i);
     end
     Mean_s11(:,1)=mean(ama_s11,2,'omitnan');
     Mean_s12(:,1)=mean(ama_s12,2,'omitnan');
     Mean_s13(:,1)=mean(ama_s13,2,'omitnan');
     Mean_s21(:,1)=mean(ama_s21,2,'omitnan');
     Mean_s22(:,1)=mean(ama_s22,2,'omitnan');
     Mean_s23(:,1)=mean(ama_s23,2,'omitnan');
      %%%%%%%%%%%%%%
     figure;
   for j=1:20 
    hold all;ii=anum(1,j);i=index3(ii);
    clear urg1 urg2 urg3 ir1 ir2 ir3;        
    ing_urg3= fr_Y_env{1,i}; ing_urg3(:,1)=ing_urg3(:,1)-ing_urg3(1,1);%urg3(:,end)=urg3(:,end);%+fr_Y_cert{1,i}(:,end); 
    ing_urg2= fr_Y_env{1,i-1};ing_urg2(:,1)=ing_urg2(:,1)-ing_urg2(1,1);%urg2(:,end)=urg2(:,end);%+fr_Y_cert{1,i-1}(:,end);
    ing_urg1= fr_Y_env{1,i-2};ing_urg1(:,1)=ing_urg1(:,1)-ing_urg1(1,1);%urg1(:,end)=urg1(:,end);%+fr_Y_cert{1,i-2}(:,end);
    plot(ing_urg1,'color',[0.4660 0.6740 0.1880]); plot(ing_urg2,'color',[0.9290 0.6940 0.1250]);plot(ing_urg3,'color',[0.6350 0.0780 0.1840]);
   end
     hold all; 
     n1=plot(Mean_ing1(1:1500,1),'color',[0.4660 0.6740 0.1880],'linewidth',2); hold all;
     n2=plot(Mean_ing2(1:1500,1),'color',[0.9290 0.6940 0.1250],'linewidth',2); hold all;
     n3=plot(Mean_ing3(1:1500,1),'color',[0.6350 0.0780 0.1840],'linewidth',2);hold all;
     %text(1,1,'Integral Population ','FontSize',10);           
    x0=0;y0=0;width=330.045524;height=250.585736;%width=660.091047;
     set(gcf,'position',[x0,y0,width,height]);
     set(gca,'TickDir','out');
     x=[0,0];  y=[-0.05 .6];
     line(x,y,'Color','black','LineStyle','--');
     set(gca,'TickDir','out');
     set(gca, 'YTick',[0 1 ],'FontSize',10)%ok
      set(gca, 'XTick',[0 1500])
      axis([-100 1800 -0.05 1])                
xlabel('Time relative to feedback (ms)','FontSize',10);  
  ylabel('Firing rate(Hz)','FontSize',10); 
   legend([n3,n2,n1],'2-3 trials since lasy correct switch',...
   '4-5-6 trials since lasy correct switch',...
   '>=7 trials since lasy correct switch','FontSize',8);
   legend('boxoff');      
        %%%%%%%%%%%%%%%%%%%%%%%%
   figure;
   for j=1:20 
    hold all;ii=anum(1,j);i=index3(ii); 
    cet_urg3= fr_Y_cert{1,i}; cet_urg3(:,1)=cet_urg3(:,1)-cet_urg3(1,1);%urg3(:,end)=urg3(:,end);%+fr_Y_cert{1,i}(:,end); 
    cet_urg2= fr_Y_cert{1,i-1};cet_urg2(:,1)=cet_urg2(:,1)-cet_urg2(1,1);%urg2(:,end)=urg2(:,end);%+fr_Y_cert{1,i-1}(:,end);
    cet_urg1= fr_Y_cert{1,i-2};cet_urg1(:,1)=cet_urg1(:,1)-cet_urg1(1,1);%urg1(:,end)=urg1(:,end);%+fr_Y_cert{1,i-2}(:,end);
    plot(cet_urg1,'color',[0.4660 0.6740 0.1880]); plot(cet_urg2,'color',[0.9290 0.6940 0.1250]);plot(cet_urg3,'color',[0.6350 0.0780 0.1840]);
   end
     hold all; 
    n1= plot(Mean_cet1(1:1200,1),'color',[0.4660 0.6740 0.1880],'linewidth',2); hold all;
    n2= plot(Mean_cet2(1:1200,1),'color',[0.9290 0.6940 0.1250],'linewidth',2); hold all;
    n3= plot(Mean_cet3(1:1200,1),'color',[0.6350 0.0780 0.1840],'linewidth',2);hold all; 
     xlabel('Time','FontSize',10.45);ylabel('Firing rate(Hz)','FontSize',10.45);
    %text(1,40,'Certainty Population ','FontSize',10);
    xlabel('Time relative to feedback (ms)','FontSize',10);  
    ylabel('Firing rate(Hz)','FontSize',10);      
    x0=0;y0=0;width=330.045524;height=250.585736;%width=660.091047;
    set(gcf,'position',[x0,y0,width,height]);
    set(gca,'TickDir','out');
    x=[0,0];  y=[-0.5 40];
    line(x,y,'Color','black','LineStyle','--');
    set(gca,'TickDir','out');
    set(gca, 'YTick',[0 20 40 ],'FontSize',10)%ok
    set(gca, 'XTick',[0 1500])
    axis([-100 1800 -0.5 45])
    legend([n3,n2,n1],'2-3 trials since lasy correct switch',...
    '4-5-6 trials since lasy correct switch',...
    '>=7 trials since lasy correct switch','FontSize',8);
     legend('boxoff');    
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   figure;hold all;
   for j=1:20 
    hold all;ii=anum(1,j);i=index3(ii); 
    s1_urg3=fr_s1{1,i}; s1_urg3(:,1)=s1_urg3(:,1)-s1_urg3(1,1);
    s1_urg2=fr_s1{1,i-1};s1_urg2(:,1)=s1_urg2(:,1)-s1_urg2(1,1);
    s1_urg1=fr_s1{1,i-2};s1_urg1(:,1)=s1_urg1(:,1)-s1_urg1(1,1);
    s2_urg3=fr_s2{1,i};s2_urg3(:,1)=s2_urg3(:,1)-s2_urg3(1,1);
    s2_urg2=fr_s2{1,i-1};s2_urg2(:,1)=s2_urg2(:,1)-s2_urg2(1,1);
    s2_urg1=fr_s2{1,i-2};;s2_urg1(:,1)=s2_urg1(:,1)-s2_urg1(1,1);
    plot(s1_urg1,'color',[0.4660 0.6740 0.1880]);hold all; plot(s2_urg1,'--','color',[0.4660 0.6740 0.1880]);
    plot(s1_urg2,'color',[0.9290 0.6940 0.1250]);hold all;plot(s2_urg2,'--','color',[0.9290 0.6940 0.1250]);
    plot(s1_urg3,'color',[0.6350 0.0780 0.1840]);hold all; plot(s2_urg3,'--','color',[0.6350 0.0780 0.1840]);
   end 
    hold all; 
    n1= plot(Mean_s11(1:1200,1),'color',[0.4660 0.6740 0.1880],'linewidth',2); hold all;
    n2=plot(Mean_s12(1:1200,1),'color',[0.9290 0.6940 0.1250],'linewidth',2); hold all;
    n3= plot(Mean_s13(1:1200,1),'color',[0.6350 0.0780 0.1840],'linewidth',2);hold all; 
    plot(Mean_s21(1:1200,1),'--','color',[0.4660 0.6740 0.1880],'linewidth',2); hold all;
    plot(Mean_s22(1:1200,1),'--','color',[0.9290 0.6940 0.1250],'linewidth',2); hold all;
    plot(Mean_s23(1:1200,1),'--','color',[0.6350 0.0780 0.1840],'linewidth',2);hold all; 
     text(100,.2,'Sensorimorot module ','FontSize',10);
    xlabel('Time relative to feedback (ms)','FontSize',10);  
    ylabel('Firing rate(Hz)','FontSize',10);      
    x0=0;y0=0;width=330.045524;height=250.585736;%width=660.091047;
    set(gcf,'position',[x0,y0,width,height]);
    set(gca,'TickDir','out');
    x=[0,0];  y=[-0.1 .55];
    line(x,y,'Color','black','LineStyle','--');
    set(gca,'TickDir','out');
    set(gca, 'YTick',[0 .6 ],'FontSize',10)%ok
    set(gca, 'XTick',[0 1500])
    axis([-100 1800 -0.1 .6])
    legend([n3,n2,n1],'2-3 trials since lasy correct switch',...
    '4-5-6 trials since lasy correct switch',...
    '>=7 trials since lasy correct switch','FontSize',8);
      legend('boxoff');
      xlabel('Time relative to feedback (ms)','FontSize',10);  
      ylabel('Firing rate(Hz)','FontSize',10); 
     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
end

