# Some data preparation

latinA <- log(Exports_latin+Import_latin)
Africa <- log(Export_africa+Import_africa)
Asia <-  log(Export_asia+Import_asia)
MiddleEast <- log(Export_middle+Import_middle)
lExLatin <- log(Exports_latin)
lImLatin <- log(Import_latin)
lExAfrica <- log(Export_africa)
lImpAfrica <- log(Import_africa)
lExAsia <- log(Export_asia)
lImAsia <- log(Import_asia)
lExMiddle <- log(Export_middle)
lImMiddle <- log(Import_middle)
World <- log(Export_world+Import_world)
lExWorld <- log(Export_world)
lImWorld <- log(Import_world)

year <- Year
plot.trade <- data.frame(World, lExWorld, lImWorld, latinA, Africa, Asia, MiddleEast, Year, lExLatin, lImLatin, lExAfrica, lImpAfrica, lExAsia, lImAsia, lExMiddle, lImMiddle)


## Net Exports from China

difflatin <- Exports_latin-Import_latin
diffafrica <- Export_africa-Import_africa
diffmiddle <- Export_middle-Import_middle
diffasia <- Export_asia-Import_asia
diffworld <- Export_world-Import_world
a <- data.frame(year, diffworld, diffafrica, difflatin, diffmiddle, diffasia )


# Plots
## World diff plot
ggplot(a, mapping = aes(year, diffworld) )+
  geom_bar(stat = "identity", fill = "#56B4E9")+xlab("Year")+
  ylab(" ")+
  geom_hline(yintercept = 0)

## Latin America diff Plot
a1 <- a %>% mutate(Trade = ifelse(difflatin < 0, "Deficit", "Surplus"))%>%
  ggplot(a, mapping = aes(year, difflatin, fill = Trade))+
  geom_bar(stat = "identity")+xlab("Latin America")+
  ylab(" ")+
  geom_hline(yintercept = 0)


## Asia diff Plot
a2 <- a %>% mutate(Trade = ifelse(diffasia < 0, "Deficit", "Surplus"))%>%
  ggplot(a, mapping = aes(year, diffasia, fill = Trade))+
  geom_bar(stat = "identity")+xlab("South Asia")+
  ylab(" ")+
  geom_hline(yintercept = 0)
  
## Africa diff Plot

a3 <- a %>% mutate(Trade = ifelse(diffafrica < 0, "Deficit", "Surplus"))%>%
  ggplot(a, mapping = aes(year, diffafrica, fill = Trade))+
  geom_bar(stat = "identity")+xlab("Africa")+
  ylab(" ")+
  geom_hline(yintercept = 0)

## Middle East diff Plot
a4 <- a %>% mutate(Trade = ifelse(diffmiddle < 0, "Deficit", "Surplus"))%>%
  ggplot(a, mapping = aes(year, diffmiddle, fill = Trade))+
  geom_bar(stat = "identity")+xlab("Middle East")+
  ylab(" ")+
  geom_hline(yintercept = 0)
  
grid.arrange(a1, a2, a3, a4, ncol=2)

  
  
## Latin America
ggplot(plot.trade, mapping = aes(x=Year, y = latinA))+
  geom_line(xlim(2001, 2019))+
  ylab("Bilateral Trade with Latin America on Logarithemic scale")




# Asia

ggplot(plot.trade, aes(x=Year))+
  geom_line(aes(y=lExAsia), col = 'blue')+
  geom_line(aes(y=lImAsia), col = 'green')

# Africa

ggplot(plot.trade, aes(x=Year))+
  geom_line(aes(y=Africa), col = 'red')+
  geom_line(aes(y=lExAfrica), col = 'blue')+
  geom_line(aes(y=lImpAfrica), col = 'green')


# World
ggplot(plot.trade, aes(x=Year))+ 
  geom_line(aes(y=World, color = 'Total Trade'), cex = 1.0)+
  geom_line(aes(y=lExWorld, color = 'Exports'), linetype = 'dashed', cex = 1)+
  geom_line(aes(y=lImWorld, color = 'Imports'), linetype = 'dashed', cex = 1)+
  xlim(2001,2019)+
  labs(x = "Year",
        y = "Values (log scale)",
        color = "Legend", title = " China's Trade Overview",
       subtitle = " Total Trade, Exports and Imports from 2001 to 2019 ") +
  scale_color_manual(" ",values=c("blue", "red", "22"))

# Middle East

ggplot(plot.trade, aes(x=Year))+
  geom_line(aes(y=MiddleEast), col = 'red')+
  geom_line(aes(y=lExMiddle), col = 'blue')+
  geom_line(aes(y=lImMiddle), col = 'green')


# Trave Vs. GDP Plot

ggplot(data = p.df, aes(x = lGDP, y = ltrade)) + 
  geom_point(color='#000099') +
  geom_smooth(color='red', method='lm', aes(x=lGDP, y=ltrade))+
  labs(title = "Bilateral Trade and the Size of Economies",
       subtitle = "Growth of bilateral trade with the increase in the size of the economy",
       caption = "Source: Own computation using data from Trade Map \n (https://www.trademap.org/)")+
  xlab("GDP")+ylab("Bilateral Trade")

