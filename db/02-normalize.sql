-- 1. Graduate Table (Dimensions / Demographics)
CREATE TABLE IF NOT EXISTS graduate (
    grad_id TEXT PRIMARY KEY,
    major TEXT NOT NULL,
    major_category TEXT NOT NULL,
    region TEXT
);

-- 2. Academics Table (Academic Performance & Institution Metrics)
CREATE TABLE IF NOT EXISTS academics (
    grad_id TEXT PRIMARY KEY REFERENCES graduate(grad_id) ON DELETE CASCADE,
    gpa NUMERIC,
    had_internship INTEGER,
    completed_on_time INTEGER,
    institution_tier TEXT,
    institution_selectivity_pctile INTEGER
);

-- 3. Money Table (Costs, Debt, and Baseline Benchmarks)
CREATE TABLE IF NOT EXISTS money (
    grad_id TEXT PRIMARY KEY REFERENCES graduate(grad_id) ON DELETE CASCADE,
    net_cost_usd NUMERIC,
    debt_usd NUMERIC,
    earnings_10yr_usd NUMERIC,
    hs_baseline_10yr_usd NUMERIC,
    added_earnings_10yr_usd NUMERIC
);

-- 4. ROI Targets Table (Financial Performance Indicators)
CREATE TABLE IF NOT EXISTS roi_targets (
    grad_id TEXT PRIMARY KEY REFERENCES graduate(grad_id) ON DELETE CASCADE,
    net_roi_usd NUMERIC,
    roi_pct NUMERIC,
    positive_roi INTEGER,
    high_roi INTEGER
);

-- Populate Tables from graduate_staging
INSERT INTO graduate (grad_id, major, major_category, region)
SELECT DISTINCT grad_id, major, major_category, region
FROM graduate_staging
ON CONFLICT (grad_id) DO NOTHING;

INSERT INTO academics (grad_id, gpa, had_internship, completed_on_time, institution_tier, institution_selectivity_pctile)
SELECT grad_id, gpa, had_internship, completed_on_time, institution_tier, institution_selectivity_pctile
FROM graduate_staging
ON CONFLICT (grad_id) DO NOTHING;

INSERT INTO money (grad_id, net_cost_usd, debt_usd, earnings_10yr_usd, hs_baseline_10yr_usd, added_earnings_10yr_usd)
SELECT grad_id, net_cost_usd, debt_usd, earnings_10yr_usd, hs_baseline_10yr_usd, added_earnings_10yr_usd
FROM graduate_staging
ON CONFLICT (grad_id) DO NOTHING;

INSERT INTO roi_targets (grad_id, net_roi_usd, roi_pct, positive_roi, high_roi)
SELECT grad_id, net_roi_usd, roi_pct, positive_roi, high_roi
FROM graduate_staging
ON CONFLICT (grad_id) DO NOTHING;