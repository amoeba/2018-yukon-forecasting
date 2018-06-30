2018-yukon-forecasting
======================

Data, code, and output for the 2018 operational forecast of Yukon River
Chinook salmon run timing

Forecasted Timing of Percentiles of Cumulative CPUE
---------------------------------------------------

<table>
<thead>
<tr class="header">
<th style="text-align: left;">Percentile</th>
<th style="text-align: right;">Predicted Date (Day of June)</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">15%</td>
<td style="text-align: right;">16</td>
</tr>
<tr class="even">
<td style="text-align: left;">25%</td>
<td style="text-align: right;">18</td>
</tr>
<tr class="odd">
<td style="text-align: left;">50%</td>
<td style="text-align: right;">22</td>
</tr>
</tbody>
</table>

### Latest Daily Forecast

![](daily_forecast/daily_forecast.png)

-   **Black line:** Logistic curve fit to the three predicted
    percentiles of cumulative CPUE. This is our cumulative %CPUE model.
-   **Red line:** Estimated cumulative %CPUE. This assumes the
    cumulative %CPUE model (black line) is correct and also assumes
    that, for example, if the cumulative CPUE at the 25% point is 10,
    then the end-of-season cumulative CPUE will be 40 (10/0.25).
    Cumulative %CPUE is then calculated from the daily cumulative CPUEs
    with 40 as the denominator. Daily CPUE values are from the LYTF set
    index.
-   **How to read the graph:** If the timing forecast and the above
    %CPUE model are correct, we would expect the red line to match the
    black line. If the timing forecast is wrong, we would expect
    substantial deviation between the red and black lines, though there
    is no hard cutoff for this.

### Final CPUE Heuristic

![](daily_forecast/final_cpue.png)

-   **Black, dotted line:** These are the final CPUE estimates we’ve
    made each day of the run.
-   **How to read the graph:** When the timing model is correct, we
    expect the time series of Final CPUE estimates to stabilize and
    oscillate around a value. When the timing model is appreciably
    wrong, the time series will not stabilize.

Previous years:
---------------

-   <https://github.com/amoeba/2017-yukon-forecasting>
-   <https://github.com/amoeba/2016-yukon-forecasting>
