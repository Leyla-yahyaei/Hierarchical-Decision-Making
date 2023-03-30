function  Consecutive_errors(fr_s1,fr_s2,fr_Y_env, fr_Y_cert,R)

%UNTITLED Summary of this function goes here
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
     data_select(i).sbject.S_fr_Y_cert{1,j}= fr_Y_cert{1,M};
      M=M+1;
         end
      end
  clear inform inform1 e1 e2 e3 fi1 fi2 fi3 fi fn  index1  index2  index3;
      A=1 ;B=1;C=1;
     for i=1:73
     coh=0;error=0;
     inform=data_select(i).sbject.informm;j=1;
      while(j<=199)
           if(inform(4,j)==0 )
            error=error+1;
           if  (inform(3,j)~=inform(3,j+1))% && inform(4,j+1)==1) % ||(inform(4,j)==1 && inform(3,j)==inform(3,j-1)))
                if error ==1
                   index1(1,A)=(i-1)*200+j; A=A+1;error=0; 
                elseif error ==2
                   index2(1,B)=(i-1)*200+j;B=B+1;error=0;
                elseif error ==3
                   index3(1,C)=(i-1)*200+j;C=C+1;error=0;
                end
                 error=0;
           end
       %     end
          elseif  inform(4,j)==1
              error=0;
           end
            j=j+1;
  end     
     end 
     %%
     %anum=[170,205,150,91,111,42,175,12,222,148,60,7,142,179,115,328,89,110,68,217];
   clear  ing_er3  ing_er2  ing_er1 Mean_ing1 Mean_ing2 Mean_ing3  aing_er1  aing_er2  aing_er3
   clear cet_er3  cet_er2  cet_er1 Mean_cet1 Mean_cet2 Mean_cet3  acet_er1  acet_er2  acet_er3
   clear  ama_ing1 ama_ing2 ama_ing3  ama_cet1  ama_cet2 ama_cet3 
   clear  s1_er3  s1_er2  s1_er1 Mean_s11 Mean_s12 Mean_s33  as1_er1  as1_er2  as1_er3
   clear  s2_er3  s2_er2  s2_er1 Mean_s21 Mean_s22 Mean_s33  as2_er1  as2_er2  as2_er3
   k1=size(index1,2); anum1=randi([1 k1],1,20);
   k2=size(index2,2); anum2=randi([1 k2],1,20);
   k3=size(index3,2); anum3=randi([1 k3],1,20);
   clear allre3 allre2 allre1 as  ama_env1  ama_env2  ama_env3
   clear numnan1 numnan2 numnan3 arrmean1 arrmean2 arrmean3
   Nindex3=size(index3,2);
   for i=1: Nindex3
     k=index3(1,i);
     aing_er3{1,i}=fr_Y_env{1,k};
     acet_er3{1,i}= fr_Y_cert{1,k};
     as1_er3{1,i}=fr_s1{1,k};
     as2_er3{1,i}=fr_s2{1,k};
   end
    
   
   Nindex2=size(index2,2);
   for i=1: Nindex2
     k=index2(1,i);
    aing_er2{1,i}=fr_Y_env{1,k};
    acet_er2{1,i}= fr_Y_cert{1,k};
    as1_er2{1,i}=fr_s1{1,k};
    as2_er2{1,i}=fr_s2{1,k};
   end 
    Nindex1=size(index1,2);
   for i=1: Nindex1
     k=index1(1,i);
     aing_er1{1,i}=fr_Y_env{1,k};
     acet_er1{1,i}= fr_Y_cert{1,k};
     as1_er1{1,i}=fr_s1{1,k};
     as2_er1{1,i}=fr_s2{1,k};
   end
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%       
   for i=1: Nindex1       
    num_aing(1,i)=size(aing_er1{1,i},1);
        num_acet(1,i)=size(acet_er1{1,i},1);
        num_as1(1,i)=size(as1_er1{1,i},1);  
        num_as2(1,i)=size(as2_er1{1,i},1); 
       end 
       for i=1: Nindex2       
        num_aing(2,i)=size(aing_er2{1,i},1);
        num_acet(2,i)=size(acet_er2{1,i},1);
        num_as1(2,i)=size(as1_er2{1,i},1); 
        num_as2(2,i)=size(as2_er2{1,i},1); 
       end 
       for i=1: Nindex3       
        num_aing(3,i)=size(aing_er3{1,i},1);   
        num_acet(3,i)=size(acet_er3{1,i},1);
        num_as1(3,i)=size(as1_er3{1,i},1);
        num_as2(3,i)=size(as2_er3{1,i},1);
       end   
       ama_ing1=nan(max(num_aing(1,:)),Nindex1);ama_ing2= nan(max(num_aing(2,:)),Nindex2);ama_ing3= nan(max(num_aing(3,:)),Nindex3);
       ama_cet1=nan(max(num_acet(1,:)),Nindex1);ama_cet2= nan(max(num_acet(2,:)),Nindex2);ama_cet3= nan(max(num_acet(3,:)),Nindex3);
       ama_s11=nan(max(num_as1(1,:)),Nindex1);ama_s12= nan(max(num_as1(2,:)),Nindex2);ama_s13= nan(max(num_as1(3,:)),Nindex3);
       ama_s21=nan(max(num_as2(1,:)),Nindex1);ama_s22= nan(max(num_as2(2,:)),Nindex2);ama_s23= nan(max(num_as2(3,:)),Nindex3);

        for i=1: Nindex1
         ans=aing_er1{1,i};a=size(ans,1);ama_ing1(1:a,i)=ans;clear ans a;
         ans=acet_er1{1,i};a=size(ans,1);ama_cet1(1:a,i)=ans;clear ans a;
         ans=as1_er1{1,i};a=size(ans,1);ama_s11(1:a,i)=ans;clear ans a;
         ans=as2_er1{1,i};a=size(ans,1);ama_s21(1:a,i)=ans;clear ans a;
        end
         for i=1: Nindex2
         ans=aing_er2{1,i};a=size(ans,1);ama_ing2(1:a,i)=ans;clear ans a;
         ans=acet_er2{1,i};a=size(ans,1);ama_cet2(1:a,i)=ans;clear ans a;
         ans=as1_er2{1,i};a=size(ans,1);ama_s12(1:a,i)=ans;clear ans a;
         ans=as2_er2{1,i};a=size(ans,1);ama_s22(1:a,i)=ans;clear ans a;
         end
          for i=1: Nindex3
         ans=aing_er3{1,i};a=size(ans,1);ama_ing3(1:a,i)=ans;clear ans a;
         ans=acet_er3{1,i};a=size(ans,1);ama_cet3(1:a,i)=ans;clear ans a;
         ans=as1_er3{1,i};a=size(ans,1);ama_s13(1:a,i)=ans;clear ans a;
         ans=as2_er3{1,i};a=size(ans,1);ama_s23(1:a,i)=ans;clear ans a;    
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
        clear  Mean_ing1 Mean_ing2 Mean_ing3
        for i=1:size(ama_ing1,2)
            ama_ing1(:,i)= ama_ing1(:,i)- ama_ing1(1,i);
        end
          for i=1:size(ama_ing2,2)
            ama_ing2(:,i)= ama_ing2(:,i)- ama_ing2(1,i);
          end
        for i=1:size(ama_ing3,2)
            ama_ing3(:,i)= ama_ing3(:,i)-ama_ing3(1,i);
        end 
          Tnan1(:,2)= Nindex1-Tnan1(:,1);Mean_ing1(:,1)=mean(ama_ing1,2,'omitnan');
          Tnan1(:,4)= Nindex2-Tnan1(:,3);Mean_ing2(:,1)=mean(ama_ing2,2,'omitnan');
          Tnan1(:,6)= Nindex3-Tnan1(:,5);Mean_ing3(:,1)=mean(ama_ing3,2,'omitnan');
          %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
          clear Mean_cet1 Mean_cet2 Mean_cet3
         Mean_cet1(:,1)=mean(ama_cet1,2,'omitnan');
         Mean_cet2(:,1)=mean(ama_cet2,2,'omitnan');
         Mean_cet3(:,1)=mean(ama_cet3,2,'omitnan');
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
        clear  Mean_s11  Mean_s12  Mean_s13  Mean_s21  Mean_s22  Mean_s23
         for i=1:size(ama_s11,2)
           ama_s11(:,i)= ama_s11(:,i)- ama_s11(1,i);
        end
          for i=1:size(ama_s12,2)
            ama_s12(:,i)= ama_s12(:,i)-ama_s12(1,i);
          end
        for i=1:size(ama_s13,2)
           ama_s13(:,i)= ama_s13(:,i)-ama_s13(1,i);
        end 
        for i=1:size(ama_s11,2)
           ama_s21(:,i)= ama_s21(:,i)-ama_s21(1,i);
        end
          for i=1:size(ama_s12,2)
            ama_s22(:,i)= ama_s22(:,i)-ama_s22(1,i);
          end
        for i=1:size(ama_s13,2)
           ama_s23(:,i)= ama_s23(:,i)-ama_s23(1,i);
        end 
         Mean_s11(:,1)=mean(ama_s11,2,'omitnan');%Mean_s11(:,1)=Mean_s11(:,1)- Mean_s11(1,1);
         Mean_s12(:,1)=mean(ama_s12,2,'omitnan');%Mean_s12(:,1)=Mean_s12(:,1)- Mean_s12(1,1);
         Mean_s13(:,1)=mean(ama_s13,2,'omitnan');%Mean_s13(:,1)=Mean_s13(:,1)- Mean_s13(1,1);
         Mean_s21(:,1)=mean(ama_s21,2,'omitnan');%Mean_s21(:,1)=Mean_s21(:,1)- Mean_s21(1,1);
         Mean_s22(:,1)=mean(ama_s22,2,'omitnan');%Mean_s22(:,1)=Mean_s22(:,1)- Mean_s22(1,1);
         Mean_s23(:,1)=mean(ama_s23,2,'omitnan');%Mean_s23(:,1)=Mean_s23(:,1)- Mean_s23(1,1);
          %%%%%%%%%%%%%%
          figure;
       for j=1:20 
           clear   ing_er3   ing_er2   ing_er1
        hold all;ii1=anum1(1,j);i1=index1(ii1);
        ii2=anum2(1,j);i2=index2(ii2);
        ii3=anum3(1,j);i3=index3(ii3);
        clear er1 er2 er3 ir1 ir2 ir3;        
        ing_er3= fr_Y_env{1,i3};%er3(:,end)=er3(:,end);%+ fr_Y_cert{1,i}(:,end); 
        ing_er2= fr_Y_env{1,i2};%er2(:,end)=er2(:,end);%+ fr_Y_cert{1,i-1}(:,end);
        ing_er1= fr_Y_env{1,i1};%er1(:,end)=er1(:,end);%+ fr_Y_cert{1,i-2}(:,end);
        ing_er1(:,1)= ing_er1(:,1)- ing_er1(1,1);        
        ing_er2(:,1)= ing_er2(:,1)- ing_er2(1,1);
        ing_er3(:,1)= ing_er3(:,1)- ing_er3(1,1);
        plot(ing_er1,'color',[1 .7 .7]); plot(ing_er2,'color',[.7 .7 1]);plot(ing_er3,'color',[.7 1 .7]);
       end
      hold all; % 1734 1680
         n1=plot(Mean_ing1(1:1500,1),'r','linewidth',2); hold all;
         n2=plot(Mean_ing2(1:1500,1),'b','linewidth',2); hold all;
         n3= plot(Mean_ing3(1:1500,1),'g','linewidth',2);hold all;
         xlabel('Time relative to feedback(ms)','FontSize',10.45);ylabel('Firing Rate(HZ)','FontSize',10.45);
        % text(1,1.5,'Integral Population ','FontSize',10);
         x0=0;y0=0;width=330.045524;height=250.585736;%width=660.091047;
         set(gcf,'position',[x0,y0,width,height]);
         set(gca, 'XTick',[0 1000 2000],'FontSize',10); 
         axis([-100 1800 -0.05 1.5])  
         x=[0,0];y=[-0.05 1.5]; line(x,y,'Color','black','LineStyle','--');         
        legend('boxoff');
         legend([n1,n2,n3],'1-error','2-error','3-error','FontSize',8);
         set(gca,'TickDir','out'); 
     %%%%%%%%%%%%%%%%%%%%%%%%
   figure;
   for j=1:20 
    hold all;ii1=anum1(1,j);i1=index1(ii1);
    ii2=anum2(1,j);i2=index2(ii2); ii3=anum3(1,j);i3=index3(ii3);
    cet_er3=  fr_Y_cert{1,i3};%er3(:,end)=er3(:,end);%+ fr_Y_cert{1,i}(:,end); 
    cet_er2=  fr_Y_cert{1,i2};%er2(:,end)=er2(:,end);%+ fr_Y_cert{1,i-1}(:,end);
    cet_er1=  fr_Y_cert{1,i1};%er1(:,end)=er1(:,end);%+ fr_Y_cert{1,i-2}(:,end);
    plot(cet_er1,'color',[1 .7 .7]); plot(cet_er2,'color',[.7 .7 1]);plot(cet_er3,'color',[.7 1 .7]);
   end
     hold all; 
     n1=plot(Mean_cet1(1:1500,1),'r','linewidth',2); hold all;
     n2=plot(Mean_cet2(1:1500,1),'b','linewidth',2); hold all;
     n3=plot(Mean_cet3(1:1500,1),'g','linewidth',2);hold all; 
     xlabel('Time relative to feedback(ms)','FontSize',10.45);ylabel('Firing Rate(HZ)','FontSize',10);
   %  text(1,50,'Certainty Population','FontSize',10);
    x0=0;y0=0;width=330.045524;height=250.585736;%width=660.091047;
    set(gcf,'position',[x0,y0,width,height]);
    set(gca, 'XTick',[0 1000 2000],'FontSize',10);  
    set(gca, 'YTick',[0  15 35],'FontSize',10);
    axis([-100 1800 -0.05 35])  
    x=[0,0];y=[-0.05 35]; line(x,y,'Color','black','LineStyle','--');  
    legend('boxoff');               
      legend([n1,n2,n3],'1-error','2-error','3-error','FontSize',8);
      set(gca,'TickDir','out');    
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
     figure;hold all;
   for j=1:20 
    hold all;ii1=anum1(1,j);i1=index1(ii1);
    ii2=anum2(1,j);i2=index2(ii2); ii3=anum3(1,j);i3=index3(ii3);
    clear er1 er2 er3 ir1 ir2 ir3;        
    s1_er3=fr_s1{1,i3};s1_er2=fr_s1{1,i2};s1_er1=fr_s1{1,i1};
    s2_er3=fr_s2{1,i3};s2_er2=fr_s2{1,i2};s2_er1=fr_s2{1,i1};
    s1_er3(:,1)= s1_er3(:,1)- s1_er3(1,1); s2_er3(:,1)=s2_er3(:,1)-s2_er3(1,1);
    s1_er2(:,1)= s1_er2(:,1)- s1_er2(1,1);s2_er2(:,1)=s2_er2(:,1)-s2_er2(1,1);
    s1_er1(:,1)= s1_er1(:,1)- s1_er1(1,1);s2_er1(:,1)=s2_er1(:,1)-s2_er1(1,1);
    plot(s1_er1,'color',[1 .7 .7]);hold all; plot(s2_er1,'--','color',[1 .7 .7]);
    plot(s1_er2,'color',[.7 .7 1]);hold all;plot(s2_er2,'--','color',[.7 .7 1]);
    plot(s1_er3,'color',[.7 1 .7]);hold all; plot(s2_er3,'--','color',[.7 1 .7]);
   end 
    hold all; 
    n1= plot(Mean_s11(1:1500,1),'r','linewidth',2); hold all;
    n2=plot(Mean_s12(1:1500,1),'b','linewidth',2); hold all;
    n3= plot(Mean_s13(1:1500,1),'g','linewidth',2);hold all; 
     plot(Mean_s21(1:1500,1),'--r','linewidth',2); hold all;
     plot(Mean_s22(1:1500,1),'--b','linewidth',2); hold all;
     plot(Mean_s23(1:1500,1),'--g','linewidth',2);hold all; 
     xlabel('Time relative to feedback(ms)','FontSize',10.45);ylabel('Firing Rate(HZ)','FontSize',10.45);
    % text(1,.6,'Sensorimorot module ','FontSize',10);
     x0=0;y0=0;width=330.045524;height=250.585736;%width=660.091047;
     set(gcf,'position',[x0,y0,width,height]);
    set(gca, 'XTick',[0 1000 2000],'FontSize',10);  
     set(gca, 'YTick',[0 .3 .6  ],'FontSize',10);  
     axis([-100 1800 -0.05 .6])  
     x=[0,0];y=[-0.05 .6]; line(x,y,'Color','black','LineStyle','--');  
     legend('boxoff');               
      legend([n1,n2,n3],'1-error','2-error','3-error','FontSize',8);
      set(gca,'TickDir','out');
         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
end

