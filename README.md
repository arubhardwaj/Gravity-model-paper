# Gravity model paper
This repository includes codes, from R, for the paper I wrote in August, 2020. The paper can be found on my [website](https://arubhardwaj.github.io/Documents/JCGS_Paper.pdf).

# Files
Priliminary R file includes all the libraries and necessary preliminary codes required to write for preparing the data. 
Regression and gravity model R file has all codes on the panel regressions and gravity models.
Plot R file is of figures I made for visualizing. They are mentioned in my paper, though image file is not available here.

# Data
It also includes 2 data files, I scaped from various sources for my analysis. Most data is extracted from [Trade Map](https://www.trademap.org/). However, data on distance and landlocked countries is taken from other source. [Paper](https://arubhardwaj.github.io/Documents/JCGS_Paper.pdf) has a detailed table on sources and description.


\begin{table}
    \centering
    \begin{tabular}{l|l|l|l}
    \hline
        \textbf{Variable} & \textbf{Description} & \textbf{Unit} & \textbf{Data Source}  \\
        \hline
        $X_{ijt}$ & Bilateral trade between China (i) and the trade  &  in USD '000 & UN Comtrade \\
         &  (j) partners during the year t & \\
        \hline
        $distance_{ij}$ & Distance between Beijing (i) and national      & Km & Google Maps \\
             & capitals (j) of trade partners & & \\
         \hline
         $GDP_{it}$ & Gross Domestic Product of China in the $t^{th}$ & Constant USD & World Bank and \\
           & year &     & OCED \\
        \hline
         $GDP_{jt}$ & Gross Domestic Product of trade partner in the $t^{th}$ & Constant USD & World Bank and \\
          & year &     & OCED \\        
        \hline
        $Pop_{it}$ & Population of China in the year t & units & United Nations \\
            &     &   & \\    
        \hline
        $Pop_{jt}$ & Population of trade partner in the year t & units & United Nations \\
            &     &     &    \\
        \hline
        $XE_{ijt}$ & Exchange rate between China and trade partner in  & USD & IMF: International \\
            & year t    &    & Financial Statistics \\
        \hline
        $\theta_{j}$ & Dummy variable for landlocked countries & Dummy  & Geography Realm \\
          & (1= landlocked and 0 = not landlocked)  & Variable   & \\
        \hline
        
    \end{tabular}
    \caption{Description and Data Sources of Variables}
    \label{tab:data}
\end{table}


# Plot
Some plots made here are extra, here!!!!

Feel free reach me, if there is anything related to his code. Just drop me an [email](mailto:aruecon@gmail.com), and I will get back soon
