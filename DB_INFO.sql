--������Ϣ��
create table AreaInfo
(
	--������
	AreaID int not null identity(1000,1) primary key,
	--��������
	AreaName varchar(50) not null,
	--״̬
	State bit not null  default(1),
	--����
	Sort int not null default(50),
	--����ʱ��
	CreateTime datetime not null default(getdate())
)
--������Ϣ��
create table DepartmentInfo
(
	--���ű��
	DepartID int not null identity(1000,1) primary key,
	--��������
	DepartName varchar(50) not null,
	--������
	AreaID int not null,
	--״̬
	State bit not null  default(1),
	--����
	Sort int not null default(50),
	--����ʱ��
	CreateTime datetime not null default(getdate()),
	--�������Լ��
	constraint [D_AreaID_FK] foreign key(AreaID) references AreaInfo(AreaID)
)
--ְλ��Ϣ��
create table OfficeInfo
(
	--ְλ���
	OfficeID int not null identity(1000,1) primary key,
	--ְλ����
	OfficeName varchar(50) not null,
	--״̬
	State bit not null  default(1),
	--����
	Sort int not null default(50),
	--����ʱ��
	CreateTime datetime not null default(getdate())
)
--�û���Ϣ��
create table UserInfo
(
	--�û����
	UserID int not null identity(1000,1) primary key,
	--�û���
	UserName varchar(30) not null ,
	--����
	PassWord varchar(50) not null,
	--����
	Name varchar(20) not null,
	--�Ա�
	Sex tinyint not null default(0),
	--ͷ��
	LitPic varchar(100),
	--��������
	AreaID int not null,
	--���ű��
	DepartID int not null,
	--ְλ
	OfficeID int not null default(-1),
	--�绰����
	Tel varchar(20) ,
	--����
	Mail varchar(30),
	--��ְʱ��
	InJoinTime DateTime not null default(getdate()),
	--ѧ��
	Edu varchar(30) not null default(''),
	--���˼���
	Briefly varchar(300) default(''),
	--���˼���
	Notes text default(''),
	--�Ƿ񳬼��û�
	IsSuper bit not null default(0),
	--����ʱ��
	CreateTime datetime not null default(getdate()),
	--�û�״̬
	Status tinyint not null default(1),
	--�������Լ��
	constraint [U_AreaID_FK] foreign key(AreaID) references AreaInfo(AreaID),
	--�������Լ��
	constraint [U_DepartmentID_FK] foreign key(DepartID) references DepartmentInfo(DepartID)
)
--��־��Ϣ��
create table ArticleInfo
(
	--��־���
	ArticleID bigint not null identity(1,1) primary key,
	--��־����
	Content text not null default(''),
	--��������
	AreaID int not null,
	--��������
	DepartID int not null,
	--�����߱��
	UserID int not null,
	--����ʱ��
	CreateTime datetime not null default(getdate()),
	--״̬
	State bit not null default(1)
)



