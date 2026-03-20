
II. --Data analysis Queries--

1) -- Department-wise Promotion Rate Analysis--
SELECT Department,
	COUNT(CASE WHEN dbo.Performance_and_Ratings.Promotion_Eligibility = 'Yes' THEN 1 END)
		AS 'Promoted_Employees',
	COUNT(dbo.Employee_Demographics.Employee_ID) AS 'Total_Employees',
	COUNT(CASE WHEN dbo.Performance_and_Ratings.Promotion_Eligibility = 'Yes' THEN 1 END) * 100.0
		/ Count(dbo.Employee_Demographics.employee_id) AS 'Promotion_Rate'
FROM dbo.Performance_and_Ratings
INNER JOIN dbo.Employee_Demographics
	ON dbo.Performance_and_Ratings.Employee_ID = dbo.Employee_Demographics.Employee_ID
GROUP BY Department
ORDER BY Promotion_Rate DESC


2) --Promotion Probability by Performance Level
SELECT
    CASE
        WHEN Performance_Score >= 90 THEN 'High_Performance'
        WHEN Performance_Score >= 70 THEN 'Medium_Performance'
        ELSE 'Low_Performance'
    END AS Performance_Level,
    COUNT(*) AS 'Total_Employees',
	SUM(CASE WHEN Promotion_Eligibility = 'Yes' THEN 1 ELSE 0 END) AS 'Promoted_Employees',
    SUM(CASE WHEN Promotion_Eligibility = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*) AS 'Promotion_Rate_Percent'
FROM dbo.Performance_and_Ratings
GROUP BY
    CASE
        WHEN Performance_Score >= 90 THEN 'High_Performance'
        WHEN Performance_Score >= 70 THEN 'Medium_Performance'
        ELSE 'Low_Performance'
    END
ORDER BY Promotion_Rate_Percent DESC


3)--Performance Distribution--
SELECT CASE
		WHEN Performance_Score >= 90 THEN 'High'
		WHEN Performance_Score >= 70 THEN 'Medium'
		ELSE 'Low'
	   END AS 'Performance_Level',
	   COUNT(Employee_ID) AS 'Total_Employees',
	   COUNT(Employee_ID) * 100.0 / (SELECT COUNT(*) FROM dbo.Performance_and_Ratings)
		 AS 'Percentage'
FROM dbo.Performance_and_Ratings
GROUP BY CASE
		WHEN Performance_Score >= 90 THEN 'High'
		WHEN Performance_Score >= 70 THEN 'Medium'
		ELSE 'Low'
	   END
ORDER BY Total_Employees DESC


4) --Training vs Performance Analysis
SELECT CASE
		WHEN Performance_Score >= 90 THEN 'High'
		WHEN Performance_Score >= 70 THEN 'Medium'
		ELSE 'Low'
	END AS Performance_Level,
	AVG(Training_Hours) AS 'Avg_Training_Hours'
FROM dbo.Performance_and_Ratings
INNER JOIN dbo.Work_log
	ON dbo.Performance_and_Ratings.Employee_ID = dbo.Work_Log.Employee_ID
INNER JOIN dbo.Employee_Demographics
	ON dbo.Employee_Demographics.Employee_ID = dbo.Performance_and_Ratings.Employee_ID
GROUP BY CASE
		WHEN Performance_Score >= 90 THEN 'High'
		WHEN Performance_Score >= 70 THEN 'Medium'
		ELSE 'Low'
	END
ORDER BY Avg_Training_Hours DESC


5) --Peer vs Manager Evaluation Bias
a) --Following are the count of cases where PeerRating=ManagerFeedback
SELECT COUNT(Employee_ID) AS MatchCount,
    COUNT(Employee_ID) * 100.00 / (SELECT COUNT(*) FROM dbo.Performance_and_Ratings) AS 'Percentage'
FROM dbo.Performance_and_Ratings
WHERE Peer_Rating = Manager_Feedback

b)
SELECT
    CASE
        WHEN Peer_Rating > Manager_Feedback THEN 'Peer_Rating_Higher'
        WHEN Manager_Feedback > Peer_Rating THEN 'Manager_Rating_Higher'
        ELSE 'Ratings_Equal'
    END AS RatingComparison,
	COUNT(*) AS 'Total_Employees',
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM dbo.Performance_and_Ratings) AS 'Percentage'
FROM dbo.Performance_and_Ratings
GROUP BY
    CASE
        WHEN Peer_Rating > Manager_Feedback THEN 'Peer_Rating_Higher'
        WHEN Manager_Feedback > Peer_Rating THEN 'Manager_Rating_Higher'
        ELSE 'Ratings_Equal'
    END
ORDER BY Total_Employees DESC


6) --Top Performing Job Roles
SELECT Job_Role, AVG(KPI_Score) As 'Avg_KPI_Score',
	Avg(Performance_Score) AS 'Avg_Performance_Score'
FROM dbo.Performance_and_Ratings
INNER JOIN dbo.Employee_Demographics
	ON dbo.Performance_and_Ratings.Employee_ID = dbo.Employee_Demographics.Employee_ID
GROUP By Job_Role
ORDER BY Avg_KPI_Score DESC


7)  --Work Hours vs Performance Analysis--
SELECT COUNT(Performance_and_Ratings.Employee_ID) AS 'Total_Employees',
	CASE
		WHEN Performance_Score >= 90 THEN 'High'
		WHEN Performance_Score >= 70 THEN 'Medium'
		ELSE 'Low'
	END AS Performance_Level,
		AVG(Work_Hours_Logged) AS 'Avg_Work_Hours'
FROM dbo.Performance_and_Ratings
	INNER JOIN dbo.Work_log
		ON dbo.Performance_and_Ratings.Employee_ID = dbo.Work_log.Employee_ID
GROUP BY
	CASE
		WHEN Performance_Score >= 90 THEN 'High'
		WHEN Performance_Score >= 70 THEN 'Medium'
		ELSE 'Low'
		END
ORDER BY Performance_Level


8) --Attendance vs Task Completion
SELECT
	CASE
		WHEN Attendance >= 90 THEN 'High_Attendance'
		WHEN Attendance >= 80 THEN 'Medium_Attendance'
		ELSE 'Low_Attendance'
	END AS Attendance_Level,
	AVG(Task_Completion) AS 'Avg_Task_Completion'
FROM dbo.Work_Log
GROUP BY
	CASE
		WHEN Attendance >= 90 THEN 'High_Attendance'
		WHEN Attendance >= 80 THEN 'Medium_Attendance'
		ELSE 'Low_Attendance'
	END
ORDER BY Avg_Task_Completion DESC


9) --Department Productivity Comparison--
SELECT Department,
	   AVG(Task_Completion) AS 'Avg_Task_Completion_Rate',
	   COUNT(dbo.Work_log.Employee_ID) AS 'Total_Employees'
FROM dbo.Work_log
INNER JOIN dbo.Employee_Demographics
	ON dbo.Work_Log.Employee_ID = dbo.Employee_Demographics.Employee_ID
GROUP BY Department
ORDER BY Avg_Task_Completion_Rate DESC


10) --Training Investment by Department
SELECT Department,
	   AVG(Training_hours) AS 'Avg_Training_Hours',
	   COUNT(dbo.Work_Log.Employee_ID) AS 'Total_Employees'
FROM dbo.Work_Log
INNER JOIN dbo.Employee_Demographics
	ON dbo.Work_log.Employee_ID = dbo.Employee_Demographics.Employee_ID
GROUP BY Department
ORDER BY Avg_Training_Hours DESC
