Data Aquisition
---------------

The 2018 value of AMATC was retrieved using manually using
<http://w2.weather.gov/climate/xmacis.php?wfo=pafg>. The value was -3.2
°C.

Graphical Analysis
------------------

How does the 2018 value of AMATC, -3.2, compare to the historical data?

![](README_files/figure-markdown_strict/amatc_plot-1.png)

**Intepretation:** An AMATC of -3.2 °C slightly warmer than average
(-6.7 °C) so we would expect a slightly early run timing.

Forecast
--------

To forecast MDJ for 2018, I followed the approach as in previous years:

I fit a simple linear model of AMATC vs. MDJ using 55 years (1961 –
2017) of historical AMATC and MDJ. I then predicted the 2018 MDJ using
the fitted model which came out to be **June 18** which is just slightly
earlier than average (mean 21).

### Hindcasting

As with the full forecast and previous years, I used a hindcasting
approach (one-step-ahead cross-validation) to get a sense of how well
AMATC predicts MDJ.

I hindcasted MDJ using an arbitrary window of 2003 – 2017 (n=15) using
the same AMATC vs. MDJ model as above and calculated the following three
metrics:

<table>
<thead>
<tr class="header">
<th>Metric</th>
<th>Value (days)</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Mean absolute devitation</td>
<td>3.93</td>
</tr>
<tr class="even">
<td>Standard deviation of absolute deviations</td>
<td>3.06</td>
</tr>
<tr class="odd">
<td>Maximum absolute residual</td>
<td>12</td>
</tr>
<tr class="even">
<td>Mean deviation</td>
<td>-4</td>
</tr>
</tbody>
</table>

Predicted values of MDJ were rounded down to the nearest day because MDJ
is recorded at daily time steps.

**Interpretation**: The AMATC-only model is a lot less useful than the
full model and tends to generate predictions that are four days off the
true MDJ and tend to be biased 4 days early.
