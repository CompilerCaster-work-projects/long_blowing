# long_blowing

## Description
It is required to analyze the %/number of inadmissions by the list of packs (PAK - the machine on which the driver undergoes medical examination). It is interesting to understand the difference between short and long blowdown (within the framework of testing from 09.12.2023 long blowdown is forced on these PAKs).
By default we have short blowdown enabled during breathalyzer testing (most clients, with few exceptions key, etc.): 
1. this requires less blow intensity for the client (short blow) - and has a % impact on tolerance. The hypothesis is that this % is negligible and close to 0%. (excluding technical malfunction of the breathalyzer, or cases of alcohol vapor detection).;
2. The switch was forced as part of the quantitative breathalyzer test (long blow). The hypothesis is that the client may have difficulties with the long blow, which ultimately affects the % of under-admissions.; 

At the top level compare this: 
1. % of unavailability on average for a short blowout and for a long blowout. See what the difference is. If we can see the details of what exactly affects the % underruns - it will be useful. But if we realize at the top level that there is no influence, then there will be no texture to study/dig deeper into the details.; 
2. Inspection time timings - how much the total inspection time increases with a long blowout.;

## How to run and get results

run ```script_for_time.sql```

We upload data on the examinations where the breathalyzer stage was present (due to failures, canceled examinations, etc. it may not be present, although it would be important for us to know about these examinations as well (if the failure, cancellation, etc. but there is no way to find this out due to the structure of the documents, so we are satisfied with what we have) and calculate the total average time of these examinations on the part of the driver (i.e. time for taking the examination into work, time for checking the examination by a medic, etc. are not taken into account) with grouping by PAK for two periods:
1. 20.11 - 08.12 
2. 10.12 - 28.12, to see just how the average inspection time has changed.


