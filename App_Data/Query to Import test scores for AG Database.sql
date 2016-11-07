/******
	 This query is used to import Teacher Commments, LOSInformation, LOSInformationHistory, 
			and some testing data
	 Created On: 4 OCT 2016
	 Created By: Bill Van Brunt
 
	 See information in query: 'Query to import students into AG database'
 
  ******/
  use AG
/* used to clead inport data before application tables are filled */

update [AL_Achievement]
set ScienceScore= NULL
where ScienceScore =''
update [AL_Achievement]
set ScienceGrade= NULL
where ScienceGrade =''

update [AL_Achievement]
set ScienceScore= NULL
where SocialScore =''
update [AL_Achievement]
set SocialGrade= NULL
where SocialGrade =''

update [AL_Achievement]
set MathGrade= NULL
where MathGrade =''
update [AL_Achievement]
set MathScore= NULL
where MAthScore =''

update [AL_Achievement]
set ReadingGrade= NULL
where ReadingGrade =''
update [AL_Achievement]
set ReadingSCORE= NULL
where ReadingSCORE =''



INSERT INTO dbo.Notes
		   (StudentId
		   ,Notes)
	 select StudentID
			,   Comments  
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
				)

SELECT StudentId
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

SELECT ALH_ID
			StudentId
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



Insert into TestingData     --Aptitude
		( StudentId
		--, TestId
		, Subject
		, TestDate
		, TestName
		, TestScore
		, EnteredBy
		, EnteredDate
	)--8
	 SELECT   StudentId
		--	, APTTest
			,'Aptitude'
			,case 
				when APTTestDate IS NULL then '01/01/1900'
				when APTTestDate = '' then '01/01/1900'
				else APTTestDate
			  end 
			
			, APTTestName
			, OverAllScore
			, 'SYSTEM'
			, getdate()

FROM [AG].[dbo].[AL_Main] 
where APTTest IS NOT NULL and APTTestDate IS  NOT NULL and APTTestName <>'' and OverAllScore <>''

