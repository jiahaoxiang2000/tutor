# %% how to use the
a = 1
print(a + a)
# how to print the python binary path
import sys
print(sys.executable)
# %% use the DuckDB

import duckdb

duckdb.sql("SELECT 42").show()

# %% create the database and table
# we have  student(stuId,stuName,stuAge,stuSex)
# Course(courseId,courseName,teacherId)
#  Scores(stuId,courseId,score), we want to get the all the student's name and their course name and score
# 1. create the database table for the student, course, scores
# 2. insert the fake data into the table
# 3. query the data from the table
# 4. show the result

# create the database, not connect to file
con = duckdb.connect()
# create the table
con.execute("CREATE TABLE student(stuId INTEGER,stuName VARCHAR,stuAge INTEGER,stuSex VARCHAR)")
con.execute("CREATE TABLE course(courseId INTEGER,courseName VARCHAR,teacherId INTEGER)")
con.execute("CREATE TABLE scores(stuId INTEGER,courseId INTEGER,score INTEGER)")
# insert the data into the table
con.execute("INSERT INTO student VALUES (1,'Tom',18,'M')")
con.execute("INSERT INTO student VALUES (2,'Jerry',19,'M')")
con.execute("INSERT INTO student VALUES (3,'Lily',20,'F')")
# insert the course data
con.execute("INSERT INTO course VALUES (1,'Math',1)")
con.execute("INSERT INTO course VALUES (2,'English',2)")
con.execute("INSERT INTO course VALUES (3,'Chinese',3)")
con.execute("INSERT INTO course VALUES (4,'Physics',4)")
# insert the scores data
con.execute("INSERT INTO scores VALUES (1,1,90)")
con.execute("INSERT INTO scores VALUES (1,2,80)")
con.execute("INSERT INTO scores VALUES (1,3,70)")
con.execute("INSERT INTO scores VALUES (1,4,60)")
con.execute("INSERT INTO scores VALUES (2,1,85)")
con.execute("INSERT INTO scores VALUES (2,2,75)")
con.execute("INSERT INTO scores VALUES (2,3,65)")
con.execute("INSERT INTO scores VALUES (2,4,55)")
con.execute("INSERT INTO scores VALUES (3,1,80)")
con.execute("INSERT INTO scores VALUES (3,2,70)")
con.execute("INSERT INTO scores VALUES (3,3,60)")
con.execute("INSERT INTO scores VALUES (3,4,50)")

# query the data from the table
result = con.sql("SELECT stuName,courseName,score FROM student,course,scores WHERE student.stuId = scores.stuId AND course.courseId = scores.courseId")
# show the result
result.show()
# %% question
#  每场比赛进球数( 队员编号,比赛场次,进球数,球队名,队长名 ),如果规定每个队员只能属于一个球队,每个球队只有一个队长
# FD：（（比赛场次，队员编号）-》进球数，队员编号-〉球队名，球队名—》队长名）
# （比赛场次,进球数）（队员编号,球队名,队长名）
#  （比赛场次，队员编号）——〉（进球数,球队名,队长名）
