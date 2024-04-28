# long_blowing

## Description
It is required to analyze the %/number of inadmissions by the list of packs (PAK - the machine on which the driver undergoes medical examination). It is interesting to understand the difference between short and long blowdown (within the framework of testing from 09.12.2023 long blowdown is forced on these PAKs).
By default we have short blowdown enabled during breathalyzer testing (most clients, with few exceptions key, etc.): 
1. this requires less blow intensity for the client (short blow) - and has a % impact on tolerance. The hypothesis is that this % is negligible and close to 0%. (excluding technical malfunction of the breathalyzer, or cases of alcohol vapor detection).;
2. The switch was forced as part of the quantitative breathalyzer test (long blow). The hypothesis is that the client may have difficulties with the long blow, which ultimately affects the % of under-admissions.; 

At the top level compare this: 
a) % of unavailability on average for a short blowout and for a long blowout. See what the difference is. If we can see the details of what exactly affects the % underruns - it will be useful. But if we realize at the top level that there is no influence, then there will be no texture to study/dig deeper into the details. 
b) Inspection time timings - how much the total inspection time increases with a long blowout. 

