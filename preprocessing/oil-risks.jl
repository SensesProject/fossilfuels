using DataFrames, CSV, Statistics, StatsBase, XLSX

df = DataFrame(XLSX.readtable("./input/RiskFactorPathways_CD-LINKS.xlsx", "rfps_wide_cd-links_all")...)
df.scenario = map(v -> v[1], split.(df.scenario, " "))
df.scenario = replace.(df.scenario, "CD-LINKS_" => "")
df.category = map(v -> v[2], split.(df.variable, "|"))
df.var = map(v -> v[size(v)[1]], split.(df.variable, "|"))
select!(df, Symbol.(["model", "scenario", "region", "var", "category", 2020, 2040, 2060, 2080, 2100]))

df = stack(df, 6:size(df)[2])
rename!(df, [:year, :value, :model, :scenario, :region, :variable, :category])


df = df[.|(df.category .== "Direct emissions cost", df.category .== "Revenue"), :]
df = df[.|(df.variable .== "Gas", df.variable .== "Coal", df.variable .== "Oil"), :]
df = df[.|(df.scenario .== "NPi", df.scenario .== "NPi2020_1000", df.scenario .== "NPi2020_400"), :]
# df = unstack(df, :year, :value)

CSV.write("../src/assets/data/oil-risks.csv", df)
