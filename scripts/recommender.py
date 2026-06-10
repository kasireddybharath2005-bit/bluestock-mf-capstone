import pandas as pd

funds = pd.read_csv(
    "../data/processed/fund_scorecard.csv"
)

risk = input(
    "Risk Appetite (Low/Moderate/High): "
)

if risk == "Low":

    result = funds.sort_values(
        "sortino",
        ascending=False
    ).head(3)

elif risk == "Moderate":

    result = funds.sort_values(
        "sharpe",
        ascending=False
    ).head(3)

else:

    result = funds.sort_values(
        "cagr",
        ascending=False
    ).head(3)

print(result)
