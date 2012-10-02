1. 
> library (TraMineR)
> data (biofam)
> biofam.seq<-biofam.seq<-seqdef (biofam[, 10:25], states=biofam.shortlab, lables=biofam.lab, weights=biofam$wp00tbgs, xstep=8)

* the sequence length*
 > seqlength (biofam.seq)

* the number of transitions*
> seqtransn (biofam.seq)

*the number of subsequences*
> seqsubsn (biofam.seq)

*the longitudinal entropy*
> seqient (biofam.seq)

*the turbulence*
> seqST (biofam.seq)

*the complexity index*
> seqici(biofam.seq)

*build a table of above characteristics*
> tab<-data.frame (seqlength (biofam.seq), seqtransn (biofam.seq), seqsubsn (biofam.seq), seqient (biofam.seq), seqST (biofam.seq), seqici(biofam.seq))
> tab [1:3,]

*2. Using summary(), look at the min, max, mean, medians and quartiles of the distribution of each of the computed longitudinal characteristics.*
> summary (seqlength (biofam.seq))

> summary (seqtransn (biofam.seq))

> summary (seqsubsn (biofam.seq))

> summary (seqient (biofam.seq))
      
> summary (seqST (biofam.seq))

> summary (seqici(biofam.seq))
  
*3. Display the histogram of each longitudinal characteristic but the length in a same graphic.*
> par (mfrow=c(2,3))
> hist (tab$Trans., col="LightBlue", main="The Number of Transitions")
> hist (tab$Subseq., col="LightBlue", main="The Number of Subsequences")
> hist (tab$Entropy, col="LightBlue", main="The Longitudinal Entropy")
> hist (tab$Turbulence, col="LightBlue", main="The Turbulence Index")
> hist (tab$C, col="LightBlue", main="The Complexity Index")

* 4. Generate the sequences of distinct successive states (DSS) and the table with the duration in the distinct successive states. Display the last 6 of them.*
> seqdss (biofam.seq)
> seqdur (biofam.seq)[1995:2000,]

*5. Compute the mean and the variance of the time spent in the successive states. Display their summaries. (Hint: use the apply function and specify na.rm=TRUE)*
> seqistatd (biofam.seq)
> summary (seqistatd (biofam.seq))

* 6. Generate a scatterplot matrix for comparing the Entropy with the Turbulence and
Complexity Index.*
>  plot (tab[, 2:4])

*7. Compare the distributions of the complexity index by birth cohorts using boxplots.*
> biofam$AgeGroup <- cut (biofam$birthyr, c("1900","1930","1940","1950", "1960"), lables=c("1990-1929", "1930-1939", "1940-1949", "1950-1959"), right=FALSE)
> boxplot(tab$C~biofam$AgeGroup, col="LightPink", main="Complexity Index comparison by Age Groups")

*8. Regress the complexity index on the birth cohort, the sex and the language of the
questionnaire. Comment the results.*
> lm. entrop <- lm(seqici(biofam.seq)~ AgeGroup + sex + plingu02, data = biofam)
> summary(lm.entrop)
