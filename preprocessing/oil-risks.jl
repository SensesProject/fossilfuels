using DataFrames, CSV, Statistics, StatsBase

df = CSV.read("./input/Risks Data - 1802 - Fossil Fuel.csv")
select!(df, Not(:Scenario))
select!(df, Not(:Units))

df = stack(df, 5:size(df)[2])
rename!(df, [:year, :value, :category, :variable, :model, :region])

df = df[.|(df.year .== Symbol(2020), df.year .== Symbol(2040), df.year .== Symbol(2060), df.year .== Symbol(2080), df.year .== Symbol(2100)), :]

df = unstack(df, :year, :value)


df = df[.|(df.category .== "Direct emissions cost", df.category .== "Revenue"), :]
df = df[.|(df.variable .== "Gas", df.variable .== "Coal", df.variable .== "Oil"), :]

df.Model
df[Symbol("Model")]

df =

df[Symbol("Risk Factor Pathway")]
