作者 [Upriver ](http://www.jianshu.com/users/a73daef9eba0)2015.06.05 01:24
写了12676字，被126人关注，获得了172个喜欢

SQL (FMDB)
字数1013 阅读2558 评论8 喜欢33

sql常用语句
创建表
CREATE TABLE IF NOT EXISTS "T_Person" (
"id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
"name" TEXT,
"age" INTEGER,
"heigth" REAL
)
//下边是sqllite编译器里边的语句

/*简单约束*/
CREATE TABLE IF NOT EXISTS t_student
(
id INTEGER PRIMARY KEY AUTOINCREMENT,
name TEXT,
age INTEGER
);

CREATE TABLE IF NOT EXISTS t_student
(
id INTEGER PRIMARY KEY AUTOINCREMENT,
name TEXT UNIQUE,
age INTEGER
);

/*添加主键*/
CREATE TABLE IF NOT EXISTS t_student
(
id INTEGER PRIMARY KEY AUTOINCREMENT,
name TEXT,
age INTEGER,
score REAL
);

/*添加主键*/
CREATE TABLE IF NOT EXISTS t_student
(
id INTEGER,
name TEXT,
age INTEGER,
score REAL,
PRIMARY KEY(id)
);
查询
/*分页*/
SELECT * FROM t_student
ORDER BY id ASC LIMIT 30, 10;

/*排序*/
SELECT * FROM t_student
WHERE score > 50
ORDER BY age DESC;

SELECT * FROM t_student
WHERE score < 50
ORDER BY age ASC , score DESC;

/*计量*/
SELECT COUNT(*)
FROM t_student
WHERE age > 50;

/*别名*/
SELECT name as myName, age as myAge, score as myScore
FROM t_student;

SELECT name myName, age myAge, score myScore
FROM t_student;

SELECT s.name myName, s.age myAge, s.score myScore
FROM t_student s
WHERE s.age > 50;

/*查询*/
SELECT name, age, score FROM t_student;
SELECT * FROM t_student;
修改
UPDATE t_student
SET name = 'MM'
WHERE age = 10;

UPDATE t_student
SET name = 'WW'
WHERE age is 7;

UPDATE t_student
SET name = 'XXOO'
WHERE age < 20;

UPDATE t_student
SET name = 'NNMM'
WHERE age < 50 and score > 10;

/*更新记录的name*/
UPDATE t_student SET name = 'zhangsan';
删除
DELETE FROM t_student;

DELETE FROM t_student WHERE age < 50;
插入
INSERT INTO t_student
(age, score, name)
VALUES
('28', 100, 'zhangsan');

INSERT INTO t_student
(name, age)
VALUES
('lisi', '28');

INSERT INTO t_student
(score)
VALUES
(100);
删除表
/*删除表*/
DROP TABLE IF EXISTS t_student;
FMDB
什么是FMDBFMDB是iOS平台的SQLite数据库框架FMDB以OC的方式封装了SQLite的C语言API
FMDB的优点使用起来更加面向对象，省去了很多麻烦、冗余的C语言代码对比苹果自带的Core Data框架，更加轻量级和灵活提供了多线程安全的数据库操作方法，有效地防止数据混乱
FMDB有三个主要的类FMDatabase:一个FMDatabase对象就代表一个单独的SQLite数据库,用来执行SQL语句
FMResultSet:使用FMDatabase执行查询后的结果集
FMDatabaseQueue :用于在多线程中执行多个查询或更新，它是线程安全的

       通过指定SQLite数据库文件路径来创建FMDatabase对象
       FMDatabase *db = [FMDatabase databaseWithPath:path];
        if (![db open]) {
           NSLog(@"数据库打开失败！");
        }

       文件路径有三种情况
       1.具体文件路径
       2.如果不存在会自动创建
       3.空字符串@"" 会在临时目录创建一个空的数据库 当FMDatabase连接关闭时，数据库文件也被删除 在FMDB中，除查询以外的所有操作，都称为“更新” create、drop、insert、update、delete等 使用executeUpdate:方法执行更新 - (BOOL)executeUpdate:(NSString*)sql, ... - (BOOL)executeUpdateWithFormat:(NSString*)format, ... - (BOOL)executeUpdate:(NSString*)sql withArgumentsInArray:(NSArray *)arguments 示例 [db executeUpdate:@"UPDATE t_student SET age = ? WHERE name = ?;", @20, @"Jack"]

查询的方法
查询方法
- (FMResultSet *)executeQuery:(NSString*)sql, ...
- (FMResultSet *)executeQueryWithFormat:(NSString*)format, ...
- (FMResultSet *)executeQuery:(NSString *)sql withArgumentsInArray:(NSArray *)arguments

示例
// 查询数据
<pre><code>
FMResultSet *rs = [db executeQuery:@"SELECT * FROM t_student"];
</code></pre>

// 遍历结果集
<pre><code>
while ([rs next]) {
NSString *name = [rs stringForColumn:@"name"];
int age = [rs intForColumn:@"age"];
double score = [rs doubleForColumn:@"score"];
}
</code></pre>
FMDatabaseQueue
FMDatabase这个类是线程不安全的，如果在多个线程同时使用一个FMDatabase实例,会造成数据混乱问题
为了保证线程安全,FMDB提供方便快捷的FMDatabaseQueue类
FMDatabaseQueue 的创建FMDatabaseQueue *queue = [FMDatabaseQueue databaseQueueWithPath:path];

简单使用
<pre><code>
[queue inDatabase:^(FMDatabase *db) {

[db executeUpdate:@"INSERT INTO t_student(name) VALUES (?)", @"Jack"];

[db executeUpdate:@"INSERT INTO t_student(name) VALUES (?)", @"Rose"];

[db executeUpdate:@"INSERT INTO t_student(name) VALUES (?)", @"Jim"];

FMResultSet *rs = [db executeQuery:@"select * from t_student"];

while ([rs next]) {
// …
}
}];

使用事务
[queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
[db executeUpdate:@"INSERT INTO t_student(name) VALUES (?)", @"Jack"];
[db executeUpdate:@"INSERT INTO t_student(name) VALUES (?)", @"Rose
"];
[db executeUpdate:@"
INSERT INTO t_student(name) VALUES (?)", @"Jim
"];

FMResultSet *rs = [db executeQuery:@"
select * from t_student
"];
while ([rs next]) {
// …
}
}];
</code></pre>
事务回滚
*rollback = YES;

总结：本博客主要学习了sql增删改查语句，学习了FMDB的框架的三个类:
FMDatabase对象就代表一个单独的SQLite数据库,FMDatabase执行查询后的结果集,FMDatabaseQueued串行队列，同步任务;
下次学习,感觉coreDate好强大，估计你用熟悉了，你就不想用sql语句
