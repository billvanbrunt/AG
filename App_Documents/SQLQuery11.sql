create table #tmpRead 
(StudentId bigint,
ScaleScore float
) 


insert into #tmpRead 
(
StudentId
,ScaleScore
)
Select 
Student_Id
,[EOG Reading Scale Score]
FROM [297-dwhse2].gcsonline.[dbo].[Core_Student_Assessments_EOGs_pivot]
where [EOG Reading Scale Score] <> 0




update TestingData

set ScaleScore = (select ScaleScore
				  from #tmpRead t
				  where studentID ='')

				  
 WHere t.StudentId in (studentId) and  [Subject] ='Reading' AND EnteredBy = 'EOGload_100814'


