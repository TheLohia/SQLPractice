SELECT 
		*,
		RANK() OVER score_window as ScoreRank,
		CAST(100 * PERCENT_RANK() OVER score_window AS DECIMAL(5,2)) as PercentRank,
		CAST(100 * CUME_DIST() OVER score_window AS DECIMAL(5,2)) as CumeDist,
		percentile_cont(0.5) WITHIN GROUP (ORDER BY score) OVER (PARTITION BY testid) AS MedianCont,
		percentile_disc(0.5) WITHIN GROUP (ORDER BY score) OVER (PARTITION BY testid) AS MedianDisc
	FROM
		Stats.Scores
	WINDOW score_window AS (PARTITION BY testid ORDER BY score)
