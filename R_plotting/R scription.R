library(ggplot2)
library(plotrix)
library(patchwork)
library(reshape2)
library(tidyverse)
library(ggprism)
library(ggpubr)

sumNDVI=read.csv('E:\\footprint_all\\figures\\sumNDVI.csv',header = T)
data=read.csv('')
met_data=melt(data,id='Distance')
met_ndvi=melt(sumNDVI,id='sites')
ndvi=sumNDVI[1:50,]

#=========Representativeness scatter===============
data=read.csv('E:\\footprint_all\\figures\\represent.csv')
ggplot(data,aes(type,value),fill=T)+
  geom_jitter(aes(color=type),size=3,shape=15)+
  ggpubr::color_palette(c(2, 1, 3,4,5,6,7,8,12,10,11,9))+
  ggpubr::theme_pubclean()+
  theme_bw()+
  theme(legend.position = 'none')+
  theme(text = element_text(family = "Times New Roman",size=18))+
  xlab('Dominate land cover type')+
  ylab('Representativeness levels')


#--------------Sum of differences of NDVI---------
data = read.csv('E:\\footprint_all\\figures\\windowsize\\CRO.csv',header = T)
CRO <-ggplot(data,aes(sites,sum,fill=sites,alpha=0.9))+
  geom_bar(stat="summary",fun=mean,position="dodge")+
  stat_summary(fun.data = 'mean_sd', geom = "errorbar", width = 0.3,color="black")+
  theme_bw()+
  theme(legend.position = 'none')+
  theme(text = element_text(family = "Times New Roman",size=11))+
  theme(text = element_text(family = "Times New Roman",size=11))+
  xlab('CRO')+
  ylab(NULL)
CRO<-CRO + coord_flip()
CRO

data = read.csv('E:\\footprint_all\\figures\\windowsize\\MF.csv',header = T)
MF <-ggplot(data,aes(sites,sum,fill=sites,alpha=0.9))+
  geom_bar(stat="summary",fun=mean,position="dodge")+
  stat_summary(fun.data = 'mean_sd', geom = "errorbar", width = 0.3,color="black")+
  theme_bw()+
  theme(legend.position = 'none')+
  theme(text = element_text(family = "Times New Roman",size=11))+
  xlab('MF')+
  ylab(NULL)
MF<-MF + coord_flip()

data = read.csv('E:\\footprint_all\\figures\\windowsize\\DNF.csv',header = T)
DNF <-ggplot(data,aes(sites,sum,fill=sites,alpha=0.9))+
  geom_bar(stat="summary",fun=mean,position="dodge")+
  stat_summary(fun.data = 'mean_sd', geom = "errorbar", width = 0.3,color="black")+
  theme_bw()+
  theme(legend.position = 'none')+
  theme(text = element_text(family = "Times New Roman",size=11))+
  xlab('DNF')+
  ylab(NULL)
DNF<-DNF + coord_flip()

data = read.csv('E:\\footprint_all\\figures\\windowsize\\ENF.csv',header = T)
ENF <-ggplot(data,aes(sites,sum,fill=sites,alpha=0.9))+
  geom_bar(stat="summary",fun=mean,position="dodge")+
  stat_summary(fun.data = 'mean_sd', geom = "errorbar", width = 0.3,color="black")+
  theme_bw()+
  theme(legend.position = 'none')+
  theme(text = element_text(family = "Times New Roman",size=11))+
  xlab('ENF')+
  ylab(NULL)
ENF<-ENF + coord_flip()

data = read.csv('E:\\footprint_all\\figures\\windowsize\\GRA.csv',header = T)
GRA <-ggplot(data,aes(sites,sum,fill=sites,alpha=0.9))+
  geom_bar(stat="summary",fun=mean,position="dodge")+
  stat_summary(fun.data = 'mean_sd', geom = "errorbar", width = 0.3,color="black")+
  theme_bw()+
  theme(legend.position = 'none')+
  theme(text = element_text(family = "Times New Roman",size=11))+
  xlab('GRA')+
  ylab(NULL)
GRA<-GRA + coord_flip()


data = read.csv('E:\\footprint_all\\figures\\windowsize\\SAV.csv',header = T)
SAV <-ggplot(data,aes(sites,sum,fill=sites,alpha=0.9))+
  geom_bar(stat="summary",fun=mean,position="dodge")+
  stat_summary(fun.data = 'mean_sd', geom = "errorbar", width = 0.3,color="black")+
  theme_bw()+
  theme(legend.position = 'none')+
  theme(text = element_text(family = "Times New Roman",size=11))+
  xlab('SAV')+
  ylab(NULL)
SAV<-SAV + coord_flip()


data = read.csv('E:\\footprint_all\\figures\\windowsize\\WSA.csv',header = T)
WSA <-ggplot(data,aes(sites,sum,fill=sites,alpha=0.9))+
  geom_bar(stat="summary",fun=mean,position="dodge")+
  stat_summary(fun.data = 'mean_sd', geom = "errorbar", width = 0.3,color="black")+
  theme_bw()+
  theme(legend.position = 'none')+
  theme(text = element_text(family = "Times New Roman",size=11))+
  xlab('WSA')+
  ylab('Sum of NDVI differences 
       at each step')
WSA<-WSA + coord_flip()


data = read.csv('E:\\footprint_all\\figures\\windowsize\\EBF.csv',header = T)
EBF <-ggplot(data,aes(sites,sum,fill=sites,alpha=0.9))+
  geom_bar(stat="summary",fun=mean,position="dodge")+
  stat_summary(fun.data = 'mean_sd', geom = "errorbar", width = 0.3,color="black")+
  theme_bw()+
  theme(legend.position = 'none')+
  theme(text = element_text(family = "Times New Roman",size=11))+
  xlab('EBF')+
  ylab(NULL)
EBF<-EBF + coord_flip()


data = read.csv('E:\\footprint_all\\figures\\windowsize\\WET.csv',header = T)
WET <-ggplot(data,aes(sites,sum,fill=sites,alpha=0.9))+
  geom_bar(stat="summary",fun=mean,position="dodge")+
  stat_summary(fun.data = 'mean_sd', geom = "errorbar", width = 0.3,color="black")+
  theme_bw()+
  theme(legend.position = 'none')+
  theme(text = element_text(family = "Times New Roman",size=11))+
  xlab('WET')+
  ylab('')+
  ylab(NULL)
WET<-WET + coord_flip()

data = read.csv('E:\\footprint_all\\figures\\windowsize\\DBF.csv',header = T)
DBF <-ggplot(data,aes(sites,sum,fill=sites,alpha=0.9))+
  geom_bar(stat="summary",fun=mean,position="dodge")+
  stat_summary(fun.data = 'mean_sd', geom = "errorbar", width = 0.3,color="black")+
  theme_bw()+
  theme(legend.position = 'none')+
  theme(text = element_text(family = "Times New Roman",size=11))+
  xlab('DBF')+
  ylab(NULL)
DBF<-DBF + coord_flip()

data = read.csv('E:\\footprint_all\\figures\\windowsize\\OSH.csv',header = T)
OSH <-ggplot(data,aes(sites,sum,fill=sites,alpha=0.9))+
  geom_bar(stat="summary",fun=mean,position="dodge")+
  stat_summary(fun.data = 'mean_sd', geom = "errorbar", width = 0.3,color="black")+
  theme_bw()+
  theme(legend.position = 'none')+
  theme(text = element_text(family = "Times New Roman",size=11))+
  xlab('OSH')+
  ylab('')+
  ylab(NULL)
OSH<-OSH + coord_flip()

data = read.csv('E:\\footprint_all\\figures\\windowsize\\CSH.csv',header = T)
CSH <-ggplot(data,aes(sites,sum,fill=sites,alpha=0.9))+
  geom_bar(stat="summary",fun=mean,position="dodge",width = 0.4)+
  stat_summary(fun.data = 'mean_sd', geom = "errorbar", width = 0.3,color="black")+
  theme_bw()+
  theme(legend.position = 'none')+
  theme(text = element_text(family = "Times New Roman",size=11))+
  xlab('CSH')+
  ylab('Sum of NDVI differences 
       at each step')
CSH<-CSH + coord_flip()

data = read.csv('E:\\footprint_all\\figures\\windowsize\\DNF.csv',header = T)
DNF <-ggplot(data,aes(sites,sum,fill=sites,alpha=0.9))+
  geom_bar(stat="summary",fun=mean,position="dodge",width=0.2)+
  stat_summary(fun.data = 'mean_sd', geom = "errorbar", width = 0.3,color="black")+
  theme_bw()+
  theme(legend.position = 'none')+
  theme(text = element_text(family = "Times New Roman",size=11))+
  xlab('DNF')+
  ylab('Sum of NDVI differences
       at each step')
DNF<-DNF + coord_flip()


WSA+CSH+DNF+plot_spacer()+ 
  plot_layout(nrow=2,ncol=3,heights = c(1,5))



#=====================Dumbbell plotting==========================
data<-read.csv('E:\\footprint_all\\figures\\percent_semiv_2\\GRA.csv',header = T,check.names = F)
data_melt<-melt(data,id.vars = 'sites')
GRA <- ggplot(data_melt,aes(x= value, y= sites)) +  
  geom_line(aes(group = sites),color=3) +
  geom_point(aes(color = variable, size = value))+ 
  theme_bw() +
  theme(legend.position = 'none')+
  theme(text = element_text(family = "Times New Roman",size=11))+
  xlab('GRA')+
  ylab('Sites')
 GRA

data<-read.csv('E:\\footprint_all\\figures\\percent_semiv_2\\MF.csv',header = T,check.names = F)
data_melt<-melt(data,id.vars = 'sites')
MF <- ggplot(data_melt,aes(x= value, y= sites)) +  
  geom_line(aes(group = sites),color=3) +
  geom_point(aes(color = variable, size = value))+ 
  theme_bw() +
  theme(legend.position = 'none')+
  theme(text = element_text(family = "Times New Roman",size=11))+
  xlab('MF')+
  ylab('Sites')
MF

data<-read.csv('E:\\footprint_all\\figures\\percent_semiv_2\\ENF.csv',header = T,check.names = F)
data_melt<-melt(data,id.vars = 'sites')
ENF <- ggplot(data_melt,aes(x= value, y= sites)) +  
  geom_line(aes(group = sites),color=3) +
  geom_point(aes(color = variable, size = value))+ 
  theme_bw() +
  theme(legend.position = 'none')+
  theme(text = element_text(family = "Times New Roman",size=11))+
  xlab('ENF')+
  ylab('Sites')
ENF

data<-read.csv('E:\\footprint_all\\figures\\percent_semiv_2\\SAV.csv',header = T,check.names = F)
data_melt<-melt(data,id.vars = 'sites')
SAV <- ggplot(data_melt,aes(x= value, y= sites)) +  
  geom_line(aes(group = sites),color=3) +
  geom_point(aes(color = variable, size = value))+ 
  theme_bw() +
  theme(legend.position = 'none')+
  theme(text = element_text(family = "Times New Roman",size=11))+
  xlab('SAV')+
  ylab('Sites')
SAV

data<-read.csv('E:\\footprint_all\\figures\\percent_semiv_2\\WSA.csv',header = T,check.names = F)
data_melt<-melt(data,id.vars = 'sites')
WSA <- ggplot(data_melt,aes(x= value, y= sites)) +  
  geom_line(aes(group = sites),color=3) +
  geom_point(aes(color = variable, size = value))+ 
  theme_bw() +
  theme(legend.position = 'none')+
  theme(text = element_text(family = "Times New Roman",size=11))+
  xlab('WSA')+
  ylab('Sites')
WSA

data<-read.csv('E:\\footprint_all\\figures\\percent_semiv_2\\EBF.csv',header = T,check.names = F)
data_melt<-melt(data,id.vars = 'sites')
EBF <- ggplot(data_melt,aes(x= value, y= sites)) +  
  geom_line(aes(group = sites),color=3) +
  geom_point(aes(color = variable, size = value))+ 
  theme_bw() +
  theme(legend.position = 'none')+
  theme(text = element_text(family = "Times New Roman",size=11))+
  xlab('EBF')+
  ylab('Sites')
EBF

data<-read.csv('E:\\footprint_all\\figures\\percent_semiv_2\\WET.csv',header = T,check.names = F)
data_melt<-melt(data,id.vars = 'sites')
WET <- ggplot(data_melt,aes(x= value, y= sites)) +  
  geom_line(aes(group = sites),color=3) +
  geom_point(aes(color = variable, size = value))+ 
  theme_bw() +
  theme(legend.position = 'none')+
  theme(text = element_text(family = "Times New Roman",size=11))+
  xlab('WET')+
  ylab('Sites')
WET

data<-read.csv('E:\\footprint_all\\figures\\percent_semiv_2\\DBF.csv',header = T,check.names = F)
data_melt<-melt(data,id.vars = 'sites')
DBF <- ggplot(data_melt,aes(x= value, y= sites)) +  
  geom_line(aes(group = sites),color=3) +
  geom_point(aes(color = variable, size = value))+ 
  theme_bw() +
  theme(legend.position = 'none')+
  theme(text = element_text(family = "Times New Roman",size=11))+
  xlab('DBF')+
  ylab('Sites')
DBF

data<-read.csv('E:\\footprint_all\\figures\\percent_semiv_2\\ENF.csv',header = T,check.names = F)
data_melt<-melt(data,id.vars = 'sites')
ENF <- ggplot(data_melt,aes(x= value, y= sites)) +  
  geom_line(aes(group = sites),color=3) +
  geom_point(aes(color = variable, size = value))+ 
  theme_bw() +
  theme(legend.position = 'none')+
  theme(text = element_text(family = "Times New Roman",size=11))+
  xlab('ENF')+
  ylab('Sites')
ENF

data<-read.csv('E:\\footprint_all\\figures\\percent_semiv_2\\OSH.csv',header = T,check.names = F)
data_melt<-melt(data,id.vars = 'sites')
OSH <- ggplot(data_melt,aes(x= value, y= sites)) +  
  geom_line(aes(group = sites),color=3) +
  geom_point(aes(color = variable, size = value))+ 
  theme_bw() +
  theme(legend.position = 'none')+
  theme(text = element_text(family = "Times New Roman",size=11))+
  xlab('OSH')+
  ylab('Sites')
OSH

data<-read.csv('E:\\footprint_all\\figures\\percent_semiv_2\\CSH.csv',header = T,check.names = F)
data_melt<-melt(data,id.vars = 'sites')
CSH <- ggplot(data_melt,aes(x= value, y= sites)) +  
  geom_line(aes(group = sites),color=3) +
  geom_point(aes(color = variable, size = value))+ 
  theme_bw() +
  theme(legend.position = 'none')+
  theme(text = element_text(family = "Times New Roman",size=11))+
  xlab('CSH')+
  ylab('Sites')
CSH

data<-read.csv('E:\\footprint_all\\figures\\percent_semiv_2\\DNF.csv',header = T,check.names = F)
data_melt<-melt(data,id.vars = 'sites')
DNF <- ggplot(data_melt,aes(x= value, y= sites)) +  
  geom_line(aes(group = sites),color=3) +
  geom_point(aes(color = variable, size = value))+ 
  theme_bw() +
  theme(legend.position = 'bottom')+
  theme(text = element_text(family = "Times New Roman",size=11))+
  xlab('DNF')+
  ylab('Sites')
DNF

cowplot::plot_grid(WSA,CSH,DNF,ncol = 3)

cowplot::plot_grid(ENF,GRA,DBF,WET,CRO,EBF,MF,SAV,OSH,WSA,CSH,DNF,ncol = 3)

WSA+CSH+DNF+plot_spacer()+
  plot_layout(nrow=2,ncol=3,heights = c(1,4))


ENF+GRA+DBF+WET+CRO+EBF+MF+SAV+OSH+WSA+CSH+DNF+
  plot_layout(nrow=4,ncol=3,heights = c(3,2,1,1),guides = 'collect') #widths = c(2,1)
#================Box plotting==============================
data=read.csv('E:\\footprint_all\\figures\\percent_semiv_2\\fp_area.csv')

g <- ggplot(data, aes(x=types,y=areas,fill=T))
  g + geom_boxplot(color=1,outlier.color = 'red',linetype=1,lwd=0.5)+ 
    # stat_boxplot(geom = 'errorbar',linetype=5,lwd=1,width=0.4)+  
    scale_fill_manual(values=alpha(c(13), 0.5))+
    geom_dotplot(binwidth=0.29,
                 binaxis='y', 
                 stackdir='center', 
                 dotsize = .5, 
                 fill=4,
                 color=4) +
    theme_bw()+
    theme(axis.text.x = element_text(angle=0, vjust=0.6,size = 15)) +
    theme(text = element_text(family = "Times New Roman",size=18))+
    labs(#title=" ",
    # subtitle=" ",
    # caption=" ",
    x="Abbreviation of vegetation type",
    y=expression(paste("90% footprint area (km"^"2",")"))
    )+
    theme(legend.position = 'none')

