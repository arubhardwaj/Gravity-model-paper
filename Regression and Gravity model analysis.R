# Model

## Pooling
panel.pool <- plm(ltrade~ldist+lGDP+lchinaGDP+lPop+lchinaPop+ExRate+landlock_dummy, data = panel, model = "pooling")

summary(panel.pool)

## Fixed Effect

panel.fe <- plm(ltrade~ldist+lGDP+lchinaGDP+lPop+lchinaPop+ExRate+landlock_dummy, data = panel, model = "within")
summary(panel.fe)

## Random Effect

panel.random <- plm(ltrade~ldist+lGDP+lchinaGDP+lPop+lchinaPop+ExRate+landlock_dummy, data = panel, model = "random")

summary(panel.random)



# Gravity


## Poisson Pseudo Maximum Likelihood (PPML)

ppml <- ppml(
  dependent_variable = "ltrade",
  distance = "ldist",
  additional_regressors = c("lGDP", "lchinaGDP", "lPop", "lchinaPop", "ExRate", "landlock_dummy"),
  data = panel
)
summary(ppml)

ppml_robust <- ppml(
  dependent_variable = "ltrade",
  distance = "ldist",
  additional_regressors = c("lGDP", "lchinaGDP", "lPop", "lchinaPop", "ExRate", "landlock_dummy"),
  robust = TRUE,
  data = panel
)

summary(ppml_robust)

## Gamma Pseudo Maximum Likelihood (GPML)

gpml <- gpml(
  dependent_variable = "ltrade",
  distance = "ldist",
  additional_regressors = c("lGDP", "lchinaGDP", "lPop", "lchinaPop", "ExRate", "landlock_dummy"),
  data = panel
)
summary(gpml)


gpml_robust <- gpml(
  dependent_variable = "ltrade",
  distance = "ldist",
  additional_regressors = c("lGDP", "lchinaGDP", "lPop", "lchinaPop", "ExRate", "landlock_dummy"),
  robust = TRUE,
  data = panel
)

summary(gpml)




## Negative Binomial Pseudo Maximum Likelihood (NBPML)

nbpml <- nbpml(
  dependent_variable = "bilateral_trade",
  distance = "ldist",
  additional_regressors = c("lGDP", "lchinaGDP", "lPop", "lchinaPop", "ExRate", "landlock_dummy"),
  data = panel
)
summary(nbpml)

nbpml_robust <- nbpml(
  dependent_variable = "bilateral_trade",
  distance = "ldist",
  additional_regressors = c("lGDP", "lchinaGDP", "lPop", "lchinaPop", "ExRate", "landlock_dummy"),
  robust = TRUE,
  data = panel
)
summary(nbpml_robust)


# Breusch-Pagan Lagrangian multiplier test for random effects model

bptest<-bptest(ltrade~ldist+lGDP+lchinaGDP+lPop+lchinaPop+ExRate+landlock_dummy, data = panel)
bptest

# Tables
texreg(list(panel.pool, panel.fe, panel.random))

texreg(list(nbpml, ppml, gpml))
texreg(list(gpml_robust))

corrplot(p.df, method="circle")

a<-stat.desc(stat)
xtable(a)
