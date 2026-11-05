
CREATE TABLE graduate_staging (
    grad_id TEXT,
    major TEXT,
    major_category TEXT,
    institution_tier TEXT,
    institution_selectivity_pctile INTEGER,
    gpa NUMERIC,
    had_internship INTEGER,
    completed_on_time INTEGER,
    region TEXT,
    net_cost_usd NUMERIC,
    debt_usd NUMERIC,
    hs_baseline_10yr_usd NUMERIC,
    added_earnings_10yr_usd NUMERIC,
    earnings_10yr_usd NUMERIC,
    net_roi_usd NUMERIC,
    roi_pct NUMERIC,
    positive_roi INTEGER,
    high_roi INTEGER
);

COPY graduate_staging
FROM '/data/college_major_roi.csv'
WITH (
    FORMAT CSV,
    HEADER TRUE,
    NULL ''
);

CREATE INDEX idx_staging_major
ON graduate_staging(major);

CREATE INDEX idx_staging_category
ON graduate_staging(major_category);
