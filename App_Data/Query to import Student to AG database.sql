/******
	 This query is used to import student Infoemation Teacher Commments, 
	 Created On: 4 OCT 2016
	 Created By: Bill Van Brunt
 
	This query imports Notes, LOSInformation, LOSInformationHistory, and testingData tables 
	 See information in query: 'Query to import students into AG database'
 
  ******/
  use AG

/* used to clead inport data before application tables are filled */

--update [AL_Achievement]
--set ScienceScore= NULL
--where ScienceScore =''
--update [AL_Achievement]
--set ScienceGrade= NULL
--where ScienceGrade =''

--update [AL_Achievement]
--set ScienceScore= NULL
--where SocialScore =''
--update [AL_Achievement]
--set SocialGrade= NULL
--where SocialGrade =''

--update [AL_Achievement]
--set MathGrade= NULL
--where MathGrade =''
--update [AL_Achievement]
--set MathScore= NULL
--where MAthScore =''

--update [AL_Achievement]
--set ReadingGrade= NULL
--where ReadingGrade =''
--update [AL_Achievement]
--set ReadingSCORE= NULL
--where ReadingSCORE =''

--Used to clean out all tables 

truncate table Notes
truncate table LOSInfromation
truncate table LOSInfromationHistory
truncate table testingdata
truncate table StudentInformation
truncate table testingdata

insert into StudentInformation
	(StudentId 
	,[CheckListScore]
	,[PortfolioSubmitted]
	,[EligibiliyType]
	,[PlacementDate]
	,[LastModifiedDate]
	,[LastModifiedBy]
	,[LastModifiedReason]
	,[RecordCreatedDate]
	,[Decision]
	)

Select StudentId
      , case 
	  When [CheckList] IS NULL 
		then ''
		else	
			[CheckList]
		end 
      ,[Portfolio]
      ,case 
		when LangLOS = 'E' and  [MathLOS]='E'
		then 'AG'
		when LangLOS = 'E'  and  [MathLOS]='NE'
		then 'AR'
		when  [MathLOS]='E'and LangLOS = 'NE'
		then  'AM'
		else 'NA'
		END AS [EligibiliyType]
      ,case 
		when [GRSDate] IS NULL
			THEN '1900-01-01'
		ELSE [GRSDate]
		end
      ,GETDATE()
      ,'vanbruw'
      ,'System Build 2016'
      ,case 
		when LastModifiedDate IS NULL 
		then '1900/01/01'
		else	
			LastModifiedDate
		end
     
	 ,case 
		when LangLOS = 'E' and  [MathLOS]='E'
		then 8
		when LangLOS = 'E'  and  [MathLOS]='NE'
		then 9
		when  [MathLOS]='E'and LangLOS = 'NE'
		then  10
		when LangLOS = 'E' and  MathLOS = 'E' and SciLOS = 'E' and SOCLOS = 'E' 
		then 5
		else 0
	 END	
			
FROM [297-DWHSE2].GCSOnline.dbo.AL_Main

INSERT INTO dbo.Notes
		   (StudentId
		   ,Notes)
	 select StudentID
			, 'BELOW DATA IS FROM PREVIOUS SYSTEM <br />' +  Comments  
	 FROM AG.dbo.AL_Main
	 where Comments <> ''	
	
insert into  LOSInfromation
				( StudentId
				,Reading
				,Math
				,Science
				,SocialStudies
				,Comments
				,LOSInformationEnterBy
				,LOSInfromationEnteredDate
				,ChangeType
				,TraditionalStudy
				)

SELECT StudentId
			
			,case 
				when LangLOS IS NULL then 'NE'
				when LangLOS = 'E' then 'AG'
			   else
				'NE'
			end
			,case
				when MathLOS IS NULL then 'NE'
				when MathLOS = 'E' then 'AG'
			else
				'NE'
			end
			,case
				when SciLOS IS NULL then 'NE'
				when SciLOS = 'E' then 'AG'
			else
				'NE'
			end
			,case
				when SOCLOS IS NULL then 'NE'
				when SOCLOS = 'E' then 'AG'
			else
				'NE'
			end
			
			, Comments
			
			,case 
					when ModifiedBy IS NULL then 'System Transfer'
					else
						ModifiedBy
					end
			,case 
					when LastModifiedDate IS NULL then '1900/01/01'
					else
					LastModifiedDate
					END
			 ,case 
					when ChangeType IS NULL then ''
					else
					ChangeType
					END
			,case 
				when LangLOS ='E' and MathLOS='E'
					then 'Both'
				when LangLOS ='E' and MathLOS='NE'
					then 'Reading'
				when LangLOS= 'NE' and MathLOS='E'
					then 'Math'
				else 'none'
			end
		FROM AG.dbo.AL_Main

insert into LOSInfromationHistory
				(
				StudentId
				,Decision
				,Reading
				,Math
				,Science
				,SocialStudies
				,Comments
				,LOSInformationEnterBy
				,LOSInfromationEnteredDate
				,ChangeType
				)

SELECT		StudentId
			,Decision
			, case 
					when LangLOS IS NULL then ''
				else
					LangLOS
				end
			,case
					when MathLOS IS NULL then ''
				else
					MathLOS
				end
			,case 
					when SciLOS IS NULL then ''
				else
					SciLOS
				end
			,case 
					when SOCLOS IS NULL then ''
				else
					SOCLOS
				end
			,Comments
			
			,case 
					when ModifiedBy IS NULL then 'System Transfer'
					else
						ModifiedBy
					end
			,case 
					when LastModifiedDate IS NULL then '1900/01/01'
					else
					LastModifiedDate
				END
			,case 
					when CA IS NULL then ''
					else
					CA
				END

FROM AG.dbo.AL_MainHistory

insert into TestingData
			(	StudentId
				, Subject
				, TestDate
				, TestName
				, TestScore
				, EnteredBy
				, EnteredDate
			)
SELECT StudentId
			
			, 'Reading'
			, case 
					when OriginalTestDate IS NULL then '01/01/1900'
					when OriginalTestDate = '' then '01/01/1900'
			   else 
					OriginalTestDate
			   end 
			, TestName
			, ReadingScore
			, 'SYSTEM'
			, getdate()
		FROM [AG].[dbo].AL_Achievement 
		where DATALENGTH(ReadingScore)> 0

insert into TestingData
		( StudentId
		, Subject
		, TestDate
		, TestName
		, TestScore
		, EnteredBy
		, EnteredDate
	)
	 SELECT StudentId
			
			, 'Math'
			, case 
				when OriginalTestDate IS NULL then '01/01/1900'
				when OriginalTestDate = '' then '01/01/1900'
			else OriginalTestDate
			   end 
			
			, TestName
			
			, MathScore
			, 'SYSTEM'
			, getdate()

FROM [AG].[dbo].AL_Achievement 
where DATALENGTH(MathScore)> 0

insert into TestingData
		( StudentId
		
		, Subject
		, TestDate
		, TestName
		, TestScore
		, EnteredBy
		, EnteredDate
	)
	 SELECT StudentId
			
			, 'Science'
			, case 
				when OriginalTestDate IS NULL then '01/01/1900'
				when OriginalTestDate = '' then '01/01/1900'
			else OriginalTestDate
			   end 
			
			, TestName
			
			,  ScienceScore
			, 'SYSTEM'
			, getdate()

FROM [AG].[dbo].AL_Achievement 
where DATALENGTH(ScienceScore)> 0

insert into TestingData
		( StudentId
		
		, Subject
		, TestDate
		, TestName
		, TestScore
		, EnteredBy
		, EnteredDate
	)
	 SELECT StudentId
			
			, 'History'
			, case 
				when OriginalTestDate IS NULL then '01/01/1900'
				when OriginalTestDate = '' then '01/01/1900'
			else OriginalTestDate
			   end 
			
			, TestName
			
			,  SocialScore
			, 'SYSTEM'
			, getdate()

FROM [AG].[dbo].AL_Achievement 
where DATALENGTH(SocialScore) > 1

Insert into TestingData
		( StudentId
		, Subject
		, TestDate
		, TestName
		, TestScore
		, EnteredBy
		, EnteredDate
	)
	 SELECT StudentId
			, 'Aptitude'
			, case 
				when OriginalTestDate IS NULL then '01/01/1900'
				when OriginalTestDate = '' then '01/01/1900'
			else OriginalTestDate
			   end as TestDate 
			
			, TestName
			, OverAllScore
			, 'SYSTEM'
			, getdate()

FROM [AG].[dbo].AL_Achievement 
where  DATALENGTH(ltrim(rtrim(OverAllScore))) > 1

 insert into TeacherInput
		( StudentId
		, Name
		, RatingDate
		, Rating
		,ModifiedDate
		,ModifiedBy
		
	)
	 SELECT StudentId
			,'GRS'
			, case 
				when [GRSDate] IS NULL then '01/01/1900'
				when [GRSDate] = '' then '01/01/1900'
			else [GRSDate]
			   end 
			
			,GRS
			, case 
				when [ModDateGRD] IS NULL then '01/01/1900'
				when [ModDateGRD] = '' then '01/01/1900'
			else [ModDateGRD]
			   end 
			,case 
				when [ModByGRD] IS NULL then 'System'
				when [ModByGRD] = '' then 'System'
			else [ModByGRD]
			   end 
FROM [AG].[dbo].AL_Achievement 
where testname='GRS' and  DATALENGTH(ltrim(rtrim(OverallScore))) >1


-- GRADES ENTERED HERE ---------------------------------------

insert into TestingData
			(	StudentId
				, Subject
				, TestDate
				, TestName
				, TestScore
				, EnteredBy
				, EnteredDate
			)
SELECT StudentId
			
			, 'Reading'
			, case 
					when OriginalTestDate IS NULL then '01/01/1900'
					when OriginalTestDate = '' then '01/01/1900'
			   else 
					OriginalTestDate
			   end 
			, 'Grade Reading'
			, ReadingScore
			, 'SYSTEM'
			, getdate()
		FROM [AG].[dbo].AL_Achievement 
		where TestName='Grades' and DATALENGTH(ReadingGrade) > 0

insert into TestingData
			( StudentId
		, Subject
		, TestDate
		, TestName
		, TestScore
		, EnteredBy
		, EnteredDate
	)
	 SELECT StudentId
			
			, 'Math'
			, case 
				when OriginalTestDate IS NULL then '01/01/1900'
				when OriginalTestDate = '' then '01/01/1900'
			else OriginalTestDate
			   end 
			
			, 'Grade Math'
			
			, MathScore
			, 'SYSTEM'
			, getdate()

FROM [AG].[dbo].AL_Achievement 
where TestName='Grades' and DATALENGTH(MathGrade) > 0

insert into TestingData
		( StudentId
		
		, Subject
		, TestDate
		, TestName
		, TestScore
		, EnteredBy
		, EnteredDate
	)
	 SELECT StudentId
			
			, 'Science'
			, case 
				when OriginalTestDate IS NULL then '01/01/1900'
				when OriginalTestDate = '' then '01/01/1900'
			else OriginalTestDate
			   end 
			
			, 'Grade Science'
			
			,  ScienceScore
			, 'SYSTEM'
			, getdate()

FROM [AG].[dbo].AL_Achievement 
where TestName='Grades' and DATALENGTH(ScienceGrade) > 0

insert into TestingData
		( StudentId
		
		, Subject
		, TestDate
		, TestName
		, TestScore
		, EnteredBy
		, EnteredDate
	)
	 SELECT StudentId
			
			, 'History'
			, case 
				when OriginalTestDate IS NULL then '01/01/1900'
				when OriginalTestDate = '' then '01/01/1900'
			else OriginalTestDate
			   end 
			
			, 'Grade Social Studies' 
			
			,  SocialScore
			, 'SYSTEM'
			, getdate()

FROM [AG].[dbo].AL_Achievement 
where TestName ='Grades' and  DATALENGTH(SocialGrade) > 0

