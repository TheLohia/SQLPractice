WITH RankedScores AS (
	SELECT 
		*,
		RANK() OVER (PARTITION BY testid ORDER BY score) as ScoreRank,
		CAST(100 * PERCENT_RANK() OVER (PARTITION BY testid ORDER BY score) AS DECIMAL(5,2)) as PercentRank,
		ROW_NUMBER() OVER (PARTITION BY testid ORDER BY score) as RowNum,
		CAST(100 * CUME_DIST() OVER score_window AS DECIMAL(5,2)) as CumeDist
	FROM
		Stats.Scores
	
	WINDOW score_window AS (PARTITION BY testid ORDER BY score)
	)
SELECT 
	RS1.testid as TestID,
	RS1.studentid as StudentID,
	RS1.score as Score,
	RS1.PercentRank as PercentRankFunc,
	CAST(100 * (CAST(RS2.ScoreRank AS DECIMAL(5,2)) - 1)/(RS3.CountRow - 1) AS DECIMAL(5,2)) as PercentRankCalc,
	RS1.CumeDist as CumeDistFunc,
	CAST(100 * CAST(RS2.MaxRowNum AS DECIMAL(5,2))/RS3.CountRow AS DECIMAL(5,2)) as CumeDistCalc, 
	RS1.*,
	'RS1 _ RS2',
	RS2.*,
	'RS2 _ RS3',
	RS3.*
FROM
	RankedScores RS1
LEFT JOIN
	(
		SELECT DISTINCT
			testid,
			ScoreRank,
			MAX(RowNum) as MaxRowNum
		FROM
			RankedScores
		GROUP BY
			testid,
			ScoreRank
	) AS RS2
ON
	RS1.testid = RS2.testid
AND
	RS1.ScoreRank = RS2.ScoreRank
LEFT JOIN
	(
		SELECT DISTINCT
			testid,
			COUNT(*) as CountRow
		FROM
			RankedScores
		GROUP BY
			testid
	) AS RS3
ON
	RS1.testid = RS3.testid 