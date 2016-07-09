--区域信息表
create table AreaInfo
(
	--区域编号
	AreaID int not null identity(1000,1) primary key,
	--区域名称
	AreaName nvarchar(50) not null,
	--状态
	State bit not null  default(1),
	--排序
	Sort int not null default(50),
	--创建时间
	CreateTime datetime not null default(getdate())
)
--部门信息表
create table DepartmentInfo
(
	--部门编号
	DepartID int not null identity(1000,1) primary key,
	--部门名称
	DepartName nvarchar(50) not null,
	--区域编号
	AreaID int not null,
	--状态
	State bit not null  default(1),
	--排序
	Sort int not null default(50),
	--创建时间
	CreateTime datetime not null default(getdate()),
	--区域外键约束
	constraint [D_AreaID_FK] foreign key(AreaID) references AreaInfo(AreaID)
)
--职位信息表
create table OfficeInfo
(
	--职位编号
	OfficeID int not null identity(1000,1) primary key,
	--职位名称
	OfficeName nvarchar(50) not null,
	--状态
	State bit not null  default(1),
	--排序
	Sort int not null default(50),
	--创建时间
	CreateTime datetime not null default(getdate())
)
--用户信息表
create table UserInfo
(
	--用户编号
	UserID int not null identity(1000,1) primary key,
	--用户名
	UserName nvarchar(30) not null ,
	--密码
	PassWord nvarchar(50) not null,
	--姓名
	Name nvarchar(20) not null,
	--性别
	Sex tinyint not null default(0),
	--头像
	LitPic nvarchar(100),
	--所属分区
	AreaID int not null,
	--部门编号
	DepartID int not null,
	--职位
	OfficeID int not null default(-1),
	--电话号码
	Tel nvarchar(20) ,
	--邮箱
	Mail nvarchar(30),
	--个人简言
	Briefly nvarchar(300) default(''),
	--个人简历
	Notes text default(''),
	--是否超级用户
	IsSuper bit not null default(0),
	--创建时间
	CreateTime datetime not null default(getdate()),
	--用户状态
	Status tinyint not null default(1),
	--区域外键约束
	constraint [U_AreaID_FK] foreign key(AreaID) references AreaInfo(AreaID),
	--部门外键约束
	constraint [U_DepartmentID_FK] foreign key(DepartID) references DepartmentInfo(DepartID)
)
--日志信息表
create table ArticleInfo
(
	--日志编号
	ArticleID bigint not null identity(1,1) primary key,
	--日志内容
	Content text not null default(''),
	--所属区域
	AreaID int not null,
	--所属部门
	DepartID int not null,
	--创建者编号
	UserID int not null,
	--创建时间
	CreateTime datetime not null default(getdate()),
	--状态
	State bit not null default(1)
)



