## ⚡️ Q1 已知二叉树的遍历序列如下，先画出这两棵二叉树，然后分别写出它们的先序序列和后序序列。

(1)先序序列：A BCDEF GH
中序序列：CBEDFAGH
请写出该二叉树的后序遍历序列。

CEFDBHGA

(2) 后序序列为DCEGBFHKJIA，
中序序列为DCBGEAHFIJK
请写出该二叉树的先序遍历序列。

ABCDBGIHFJK

## Q2 请说明什么是哈夫曼树？有个序列是(12,4,5,6,1,2),画出其哈夫曼树，并求出其带权路径长度WPL。

12*1+4*3+5*3+6*3+1*4+2*4=12+12+15+18+4+8=69

z h

12 -> 0
4 -> 101

## Q3 请实现二分查找算法

```c
int binarySearch (int arr [], int n, int key) {

}
```

## Q7 查询计算机系（CS）年龄在 20 岁以下的学生的学号和姓名

假设有以下关系模式：
学生 : Student(Sno, Sname, Ssex, Sage, Sdept)
课程 : Course(Cno, Cname, Cpno, Ccredit)
学生选课 : SC(Sno, Cno, Grade)

```sql
SELECT Sno, Sname FROM Student WHERE Sdept = 'CS' AND Sage < 20
```

## 考试时间

- 120 fz 200 score
- 120/200 \* 2 = 1.2 fz

## 关系 R(A，B) 和 S(B，C) 中分别有 2 个和 3 个元组，属性 B 是 R 的主码，则 R 与 S 进行自 然连接计算得到的元组数目的范围是 ( )。

### min = -

R = [(1,x),(2,x,)]
S = [(3,y),(4,y),(5,y)]
R\*S = []

### max = 3

R = [(1,x1),(2,x2)]
S = [(1,y1),(1,y2),(1,y3)]
R\*S = [(x1,y1),(x1,y2),(x1,y3)]

data base manager system DBMS

T3 -> T2 W3B -> R2B
T2 -> T1 W2B -> R1B
T1 -> T2 W1A -> R2B

## Student 表示学生实体（属性 Sno、 Sname、 Ssex、 Sage、 Sdept 分别表示学生的学号、姓名、性别、年龄、所在系），Sports 表示运动项目实体（属性 SportNo、SportName、SportUnit 分 别表示运动项目的编号、名称、项目的计分单位），Student 与 Sports 之间的参与关系用 SS 表示（联 系的属性 Grade 表示比赛成绩）。

```sql
-- 创建 SS 表（学生参与运动项目的成绩表）
CREATE TABLE SS (
    Sno VARCHAR(20) NOT NULL,       -- 学生学号，引用 Student 表的主键
    SportNo INT NOT NULL,           -- 运动项目编号，引用 Sports 表的主键
    Grade DECIMAL(5,2),             -- 比赛成绩（示例：允许小数，如 95.5）
    PRIMARY KEY (Sno, SportNo),     -- 联合主键，确保同一学生同一项目只能有一条记录
    FOREIGN KEY (Sno) REFERENCES Student(Sno) ON DELETE CASCADE,
    FOREIGN KEY (SportNo) REFERENCES Sports(SportNo) ON DELETE CASCADE
);
```

### 查询” 计算机” 系的学生参加了哪些运动项目，只把运动项目名称列出，去除重复记录

SELECT DISTINCT SportName FROM Sports WHERE SportNo IN (
SELECT SportNo FROM SS WHERE Sno IN (
SELECT Sno FROM Student WHERE Sdept = 'CS'
)
);

> CS -> Sno -> SportNo -> SportName

### 用关系代数表达式表达以下查询, (1) 查询参加” 跳高” 的学生的姓名

T1 T2 T3

删除非“跳高”学生 T2
跳高学生number T2 连接 T3
跳高学生名字 在连接 T1
投影找出学生名字字段

### 查询参加了所有运动项目的学生姓名

T2 连接 T3

投影名字
