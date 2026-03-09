This repository contains MATLAB implementations of Lagrange and Newton divided difference interpolation methods applied to daily maximum temperature data from the PAGASA synoptic station in Clark, Pampanga for the year 2025. The project demonstrates polynomial interpolation techniques and analyzes the errors (including Runge's phenomenon) that occur when approximating highly variable meteorological data.

├── README.md                       # This file
├── Clark Daily Data.xlsx           # Dataset (not included - see instructions)
├── temperature_analysis_clark.m    # Exploratory data analysis script
├── interpolation_temperature_analysis.m  # Main interpolation script
├── lagrange_interp.m                # Lagrange interpolation function
├── divided_diff.m                    # Newton divided differences function
├── newton_eval.m                     # Newton polynomial evaluation (Horner's method)
└── figures/                          # Output figures (created when running scripts)
    ├── figure1_trend.png
    ├── figure2_monthly_avg.png
    ├── figure3_moving_avg.png
    ├── figure4_interpolation.png
    ├── figure5_absolute_error.png
    └── figure6_relative_error.png
