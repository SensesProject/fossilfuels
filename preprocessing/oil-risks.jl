using DataFrames, CSV, Statistics, StatsBase, XLSX

df = DataFrame(XLSX.readtable("./input/Risks Data - 1802.xlsx", 2)...)
select!(df, Symbol.(["Risk Factor Pathway", "Sector", "Model", "Scenario", "Geography", "Units", 2020.0, 2040.0, 2060.0, 2080.0, 2100.0]))

df = stack(df, 7:size(df)[2])
rename!(df, [:year, :value, :category, :variable, :model, :scenario, :region, :unit])


df = df[.|(df.category .== "Revenue"), :]
df = df[.|(df.variable .== "Gas", df.variable .== "Coal", df.variable .== "Oil"), :]
df = df[.|(df.model .== "REMIND-MAgPIE 1.7-3.0"), :]
# df = df[.|(df.scenario .== "PEP_NoPolicy", df.scenario .== "PEP_1p5C_red_eff", df.scenario .== "PEP_2C_red_eff"), :]
# df = unstack(df, :year, :value)

df.value = df.value / 1000000

CSV.write("../src/assets/data/oil-risks.csv", df)

# df2 = DataFrame(XLSX.readtable("./input/PepData_FinanceLearnModule.xlsx", 1)...)
# df2 = unstack(df2, :period, :value)
# df2.category = map(v -> v[1], split.(df2.variable, "|"))
# df2.var = map(v -> v[size(v)[1]], split.(df2.variable, "|"))
#
# select!(df2, Symbol.(["model", "scenario", "region", "unit", "var", "category", 2020, 2040, 2060, 2080, 2100]))
#
# df2 = stack(df2, 7:size(df2)[2])
# rename!(df2, [:year, :value, :model, :scenario, :region, :unit, :variable, :category])
#
# df2 = df2[.|(df2.category .== "Primary Energy", df2.category .== "Price"), :]
# df2 = df2[.|(df2.variable .== "Gas", df2.variable .== "Coal", df2.variable .== "Oil"), :]
#
# df2 = unstack(df2, :year, :value)
# df1 = unstack(df, :year, :value)
#
# combo = vcat(df1, df2)
# sort!(combo, [order(:scenario), order(:variable), order(:category)])
#
# CSV.write("../src/assets/data/oil-risks-unstacked.csv", combo)
# CSV.write("../src/assets/data/oil-risks-vars.csv", DataFrame(unique(df2.variable)))
#
# # DataFrame(unique(df2.variable))
# # df2 = unstack(df2, :year, :value)
#
# price  = df2[df2.variable .== "Price|Primary Energy|Gas", :]
# CSV.write("../src/assets/data/oil-risks-price.csv", price)
# # price.unit
