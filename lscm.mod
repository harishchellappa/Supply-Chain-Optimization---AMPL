# AMPL model file for LSCM
# No. of periods
param n;
set N := {1..n};
# Demand in period 𝑡,𝑡∈𝑁
param d {t in N};
# Unit production cost in period 𝑡,𝑡∈𝑁
param p {t in N};
# Unit module cost in period 𝑡,𝑡∈𝑁
param f {t in N};
# Unit storage cost in period 𝑡,𝑡∈𝑁
param h {t in N};
# Maximum production capacity in any period
param C; 
# No. units produced in period 𝑡,𝑡∈𝑁
var x {t in N} >= 0;
# Inventory at the end of each period
var s {t in 0..n} >= 0;
# Number of capacity modules installed in period 𝑡,𝑡∈𝑁
var y {t in N} >=0 integer;
# Sum of cost of producing x[t] units, storing s[t] units and cost of y[t] in time 𝑡,𝑡∈𝑁
minimize z: sum {t in N} (p[t]*x[t] + h[t]*s[t] + y[t]*f[t]);
# Initial inventory is 0
subject to initial_inventory: s[0] = 0;
# Inventory at time 𝑡,𝑡∈𝑁
subject to inventory {t in N}: s[t] = s[t-1] + x[t] - d[t];
# Production Limit at time 𝑡,𝑡∈𝑁 
subject to production_limit {t in N}: x[t]<=y[t]*C;
