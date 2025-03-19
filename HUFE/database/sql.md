# SQl

## 题目

### 怎么去判断为NULL

```sql
  SELECT * FROM table WHERE COLUMN IS NULL
```

姓名 IS NULL


### 设有学生选课关系 SC（学号，课程号，成绩），使用 SQL 语句检索每门课程的最高分

```sql
SELECT 课程号, MAX(成绩) FROM SC GROUP BY 课程号

-- 这个SQL查询用于查找每门课程的最高分数
-- 解析:
-- 1. SELECT 课程号, MAX(成绩): 选择课程号和每个课程的最高成绩
-- 2. FROM SC: 从学生选课关系表(SC)中获取数据
-- 3. GROUP BY 课程号: 按课程号分组，这样MAX()函数会应用到每个课程组中
-- 结果将返回一个包含所有课程号及其对应最高成绩的列表
```

### 查询所有学生的选课情况，输出学号，姓名，课程号，课程名.

学生表 student(stuId,stuName,stuAge,stuSex)
课程表 Course(courseId,courseName,teacherId)
成绩表 Scores(stuId,courseId,score)
教师表 Teacher(teacherId,teacherName)

```sql

SELECT s.stuId, s.stuName, sc.courseId, sc.courseName
FROM student s, Scores sc, Course c
WHERE s.stuId = sc.stuId AND sc.courseId = c.courseId

-- 这个SQL查询用于检索所有学生的选课情况，输出学号，姓名，课程号，课程名
-- 解析:
-- 1. SELECT s.stuId, s.stuName, sc.courseId, sc.courseName: 选择学生学号，姓名，课程号，课程名
-- 2. FROM student s, Scores sc, Course c: 从学生表(student)，成绩表(Scores)，课程表(Course)中获取数据
-- 3. WHERE s.stuId = sc.stuId AND sc.courseId = c.courseId: 使用学生表和成绩表的学号关联，以及成绩表和课程表的课程号关联
-- 结果将返回一个包含所有学生的选课情况的列表
```
