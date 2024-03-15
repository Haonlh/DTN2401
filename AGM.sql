Create Database TestingSystem;

Use TestingSystem;

Create Table Department(
	DepartmentID int auto_increment primary key,
    DepartmentName char not null
);

Create Table _Position(
	PositionID int auto_increment primary key,
    PositionName char not null
);

Create Table _Account(
	AccountID int auto_increment primary key,
    Email char not null,
    Username char not null,
    Fullname char not null,
    DepartmentID int,
    PositionID int,
    CreateDate date,
    Foreign key (DepartmentID) references Department(DepartmentID),
    Foreign key (PositionID) references _Position(PositionID)
);

Create Table _Group(
	GroupID int auto_increment primary key,
    GroupName char not null,
    CreatorID int,
    CreatDate date,
    Foreign key (CreatorID) references _Account(AccountID)
);

Create Table GroupAccount(
	GroupID int ,
    AccountID int,
    JoinDate date,
    Foreign key (GroupID) references _Group(GroupID),
    Foreign key (AccountID) references _Account(AccountID)
);

Create Table TypeQuestion(
	TypeID int auto_increment primary key,
    TypeName enum('Essay', 'Mutiple-Choice')
);

Create Table CategoryQuestion(
	CategoryID int auto_increment primary key,
    CategoryName char
);

Create Table question(
	QuestionID int auto_increment primary key,
    Content text,
    CategoryID int ,
    TypeID int ,
    CreatorID int , 
    CreateDate date,
    Foreign key (CategoryID) references CategoryQuestion(CategoryID),
    Foreign key (TypeID) references TypeQuestion(TypeID),
    Foreign key (CreatorID) references _Account(AccountID)
);

Create Table Answer (
	AnswerID int auto_increment primary key,
    Content text,
    QuestionID int,
    isCorrect boolean,
    Foreign key (QuestionID) references question(QuestionID)
);

Create Table Exam(
	ExamID int auto_increment primary key,
    _Code char,
    Title char,
    CategoryID int ,
    Duration time,
    CreatorID int, 
    CreateDate date,
    Foreign key (CategoryID) references CategoryQuestion(CategoryID),
    Foreign key (CategoryID) references CategoryQuestion(CategoryID),
    Foreign key (CreatorID) references _Account(AccountID)
);

Create Table ExamQuestion(
	ExamID int ,
    QuestionID int, 
    Foreign key (ExamID) references Exam(ExamID),
    Foreign key (QuestionID) references question(QuestionID)
);

CREATE TABLE trainee(
	trainee_id int auto_increment primary key,
    full_name varchar(30) NOT NULL,
    birth_date date NOT NULL,
    gender enum('male', 'female', 'unknown'),
    et_iq int CHECK(et_iq >= 0 AND et_iq <= 20),
    et_gmath int CHECK(et_gmath >= 0 AND et_gmath <= 20),
    et_english int CHECK(et_english >= 0 AND et_english <= 20),
    training_class varchar(10),
    evaluation_notes text
);

ALTER TABLE trainee
ADD VTI_Acount int unique not null;





