use AG

SELECT      c.SCHID AS CurrentSchoolId, 
			c.SCHTTL AS CurrentSchoolName, 
			c.CURRGRADE AS CurrentGrade, 
			c.STID AS StudentID,
			c.ADDR#  + ' ' + c.STRT  + ' ' + c.APT# As FullAddress,
			c.ADDR# AS StreetNo, 
			c.STRT AS StreetName, 
			c.APT# AS Apt,
			c.CITY, 
			c.ZIP, 
			ISNULL(c.NXTYRSCH, '') AS GEOSchoolId, 
			ISNULL(c.SCHTTL01, '') AS GeoSchoolName, 
			ISNULL(n.NXTYRSCH, '') AS NextGeoSchoolId, 
			ISNULL(n.SCHTTL01, '') AS NextGeoSchoolName, 
			ISNULL(n.NXTGR, '') AS NextYearGrade, 
			ISNULL(t.NextSchool, '') AS NextAssignedSchoolId,
			ISNULL(sch.Name, '') AS NextAssignedSchoolName, 
			ISNULL(t.NextGradeLevel, '') AS NextAssignedSchoolGraded

FROM [297-DWHSE2].NCWise_stage_20130701.dbo.rpt_StudentList_SchoolAssignments_CurrYr AS c 
FULL OUTER JOIN
		[297-DWHSE2].NCWise_stage_20130701.dbo.rpt_StudentList_SchoolAssignments_NextYr AS n 
		ON c.SCHID = n.SCHID 
		AND c.SCHTTL = n.SCHTTL 
		AND c.CURRGRADE = n.CURRGRADE 
		AND c.LSTNAME = n.LSTNAME 
		AND c.FRSTMDNME = n.FRSTMDNME 
LEFT OUTER JOIN
            [297-DWHSE2]. NCWise_stage_20130701.dbo.Core_Student_Transitions AS t 
		 ON c.SCHID = t.School AND c.STID = t.StudentID 
LEFT OUTER JOIN
                 [297-DWHSE2]. NCWise_stage_20130701.dbo.Core_School_Directory AS sch 
		  ON t.NextSchool = sch.School
JOIN   [297-DWHSE2]. NCWise_stage_20130701.[dbo].[Core_Student_Exceptionalities_pivot] AS cse 
		ON	c.STID = cse.StudentID
ORDER BY
			 CurrentSchoolId
			,CurrentGrade
			,LastName
			,FirstName