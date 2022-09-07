dd <- read.csv("firefightersRTM experiment-table.csv",skip=6,dec=".")
str(dd)
colnames(dd)[c(1,6,7)]<-c("run","End_time","Burned_plots")
dd$Prop_forest<-as.factor(dd$propforest)
dd$Nb_groups<-as.factor(dd$nb.groups)

boxplot(Burned_plots~Prop_forest*Nb_groups,data=dd)

boxplot(Burned_plots~Nb_groups*Prop_forest,data=dd)

dd$Prop_burned_plots<-dd$Burned_plots/(dd$propforest * 9)

boxplot(Prop_burned_plots~Nb_groups*Prop_forest,data=dd)

library(ggplot2)

g <- ggplot(dd,aes(x=Prop_forest,y=Prop_burned_plots,fill=Nb_groups))+geom_boxplot()
g

g2 <- ggplot(dd,aes(x=Prop_forest,y=End_time,fill=Nb_groups))+geom_boxplot()