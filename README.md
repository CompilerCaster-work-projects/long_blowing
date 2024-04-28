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

**run** ```script_for_time.sql```

We upload data on the examinations where the breathalyzer stage was present (due to failures, canceled examinations, etc. it may not be present, although it would be important for us to know about these examinations as well (if the failure, cancellation, etc. but there is no way to find this out due to the structure of the documents, so we are satisfied with what we have) and calculate the total average time of these examinations on the part of the driver (i.e. time for taking the examination into work, time for checking the examination by a medic, etc. are not taken into account) with grouping by PAK for two periods:
1. 20.11 - 08.12 
2. 10.12 - 28.12, to see just how the average inspection time has changed.

**run** ```script_for_numberpercentage_of_non-admissions.sql```

Here, grouped by PAC, we take data on the number of inspections for the same periods as in the first script (total for 2 periods), as well as data on the number of failures to pass, where the remarks column included the reason "Alcohol" for the period before and for the period after the start of the experiment. And here we need only the last attempts (and there can be only 3 of them within one inspection) that fit the above criteria, but, unfortunately, it will be difficult or almost impossible to do it within this database, so we take all attempts of drivers.

As a result, after all the uploads and some manipulations with VLOOKUP, we get the following:
![image](https://github.com/CompilerCaster/long_blowing/assets/128957307/06ba8d07-8684-42c4-9f4d-7548532b80fe)

and this is data that can already be used for some kind of analysis:
![image](https://github.com/CompilerCaster/long_blowing/assets/128957307/63c843be-741a-485e-abd8-0ad98fd1d629)

We see that there is very little data, and it is impossible to draw any hasty conclusions about the change in the %/percentage of non-admissions. It is also very good that these data are correctly compared with the daily reports that arrive in the mail every morning and report the number of non-admissions by companies and for reasons (including alcohol). That is, nothing much can be said here and it is worth continuing the experiment. But if the hypothesis is confirmed in the future, then it is worth removing the long purge, because it is important to us that, in compliance with the laws and norms of medical examination, customers, regardless of the health of their employees, have as large a percentage of admissions as possible, and there are minimum non-admissions. This has a very strong effect on customer loyalty (no one likes it when your employees can't go to work). Although it is worth noting that some large clients do not care about this (as for who does not care and who does not, I am also conducting an analysis).

