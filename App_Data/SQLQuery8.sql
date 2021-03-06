
  use AG

insert into StudentInformation(
	   StudentId
	  ,CheckListScore
	  ,PortfolioSubmitted
	  ,EligibiliyType
	  ,LastModifiedBy
	  ,LastModifiedReason
	  ,RecordCreatedDate
	  , Decision
	  ,PlacementDate)
	SELECT 
		
		  StudentId
		  ,case when Checklist IS NULL then '' 
		  else
		  Checklist
		  end
		  ,case when Portfolio =''  then ''
	else
		Portfolio
		end

		  ,case Decision 
			when 'NE' then '10'
			when 'Talent Development' then '1'
			when 'Parent Refusal' then '11'
			when 'Eligible' then '4'
			when 'Test Now' then '6'
			when 'Screening' then '7'
			else '0'
			end
		 ,'SYSTEM'
		  ,'SystemUpgrade'
		  ,case when GRSDate IS NULL  then '01/01/1900'
			else
				GRSDATE
			end,
			Decision,
			case when PlacementDate IS NULL then '01/01/1900'
			else 
			CONVERT (VARCHAR, PlacementDate,101) 
			end AS PlacementDate
		 FROM AG.dbo.AL_Main
	  
	  
	 

	

	INSERT INTO dbo.Notes
		   (StudentId
		   ,Notes)
	 select StudentID
			, 'BELOW DATA IS FROM PREVIOUS SYSTEM <br />' +  Comments  
	 FROM AG.dbo.AL_Main
	 where Comments <>''
	
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
				(HistoryId 
				,StudentId
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
			,StudentId
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
					when CA IS NULL then ''
					else
					CA
					END
				FROM AG.dbo.AL_MainHistory

	insert into TestingData
			(	StudentId
				, TestId
				, SubjectMatter
				, DateTestTaken
				, TestName
				, TestScorePercentile
				, TestEnteredBy
				, TestEnteredDate
			)
	 SELECT StudentId
			, case 
						when RDSTest IS NULL then 0
						when RDSTest = '' then 0
					else 
						RDSTest
					end
			, 'Reading'
			, case 
					when RDSDate IS NULL then '01/01/1900'
					when RDSDate = '' then '01/01/1900'
			   else 
					RDSDate
			   end 
			, RDSTestName
			, ReadingScore
			, 'SYSTEM'
			, getdate()
		FROM [AG].[dbo].[AL_Main] 
		where RDSTest IS NOT NULL and RDSDate IS  NOT NULL and RDSTestName <>'' and ReadingScore <>''


insert into TestingData
		( StudentId
		, TestId
		, SubjectMatter
		, DateTestTaken
		, TestName
		, TestScorePercentile
		, TestEnteredBy
		, TestEnteredDate
	)
	 SELECT StudentId
			, case 
				when MATTest IS NULL then 0
				when MATTest = '' then 0
				else 
					MATTest
				end
			, 'Math'
			, case 
				when MATDate IS NULL then '01/01/1900'
				when MATDate = '' then '01/01/1900'
			else MATDate
			   end 
			
			, MATTestName
			
			, MathScore
			, 'SYSTEM'
			, getdate()

FROM [AG].[dbo].[AL_Main] 
where MATTest IS NOT NULL and MATDate IS  NOT NULL and MATTestName <>'' and MathScore <>''

insert into TestingData
		( StudentId
		, TestId
		, SubjectMatter
		, DateTestTaken
		, TestName
		, TestScorePercentile
		, TestEnteredBy
		, TestEnteredDate
	)
	 SELECT StudentId
			, case 
				when SCITest IS NULL then 'Data Not Available'
				when SCITest = '' then 'Data Not Available'
				else 
					SCITest
				end
			, 'Science'
			, case 
				when SCIDate IS NULL then '01/01/1900'
				when SCIDate = '' then '01/01/1900'
			else SCIDate
			   end 
			
			, SCITestName
			
			,  ScienceScore
			, 'SYSTEM'
			, getdate()

FROM [AG].[dbo].[AL_Main] 
where SCITest IS NOT NULL and SCIDate IS  NOT NULL and SCITestName <>'' and ScienceScore <>''

																															insert into TestingData
		( StudentId
		, TestId
		, SubjectMatter
		, DateTestTaken
		, TestName
		, TestScorePercentile
		, TestEnteredBy
		, TestEnteredDate
	)
	 SELECT StudentId
			, case 
				when SOCTest IS NULL then 0
				when SOCTest = '' then 0
				else 
					SOCTest
				end
			, 'History'
			, case 
				when SOCDate IS NULL then '01/01/1900'
				when SOCDate = '' then '01/01/1900'
			else SOCDate
			   end 
			
			, SOCTestName
			
			,  SocialScore
			, 'SYSTEM'
			, getdate()

FROM [AG].[dbo].[AL_Main] 
where SOCTest IS NOT NULL and SOCDate IS  NOT NULL and SOCTestName <>'' and SocialScore <>''



Insert into TestingData
		( StudentId
		, TestId
		, SubjectMatter
		, DateTestTaken
		, TestName
		, TestScorePercentile
		, TestEnteredBy
		, TestEnteredDate
	)
	 SELECT StudentId
			, case 
				when APTTest IS NULL then 0
				when APTTest = '' then 0
				else 
					APTTest
				end
			, 'Aptitude'
			, case 
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

