using DataFrames, CSV, Statistics, StatsBase, XLSX

df = CSV.read("./input/Uncertainty Viz - Gas FF Module - Slopes-Data.csv")
select!(df, Symbol.(["Model", "Scenario", "Region", "Variable", 2020, 2030, 2040, 2050, 2060, 2070, 2080, 2090]))

df = stack(df, 5:size(df)[2])
rename!(df, [:year, :value, :model, :scenario, :region, :variable])

CSV.write("../src/assets/data/uncertainty.csv", df)
