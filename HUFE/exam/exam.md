
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
