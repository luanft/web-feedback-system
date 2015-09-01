/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     9/1/2015 10:29:12 PM                         */
/*==============================================================*/


drop table if exists ACCOUNT;

drop table if exists CAREER_OBJECTIVE;

drop table if exists CATEGORY;

drop table if exists COMPANY;

drop table if exists EDUCATION;

drop table if exists EXPERIENCE;

drop table if exists JOB;

drop table if exists JOB_RECOMMENDED;

drop table if exists LANGUAGE;

drop table if exists PROFILE;

drop table if exists REFERENCE;

drop table if exists RESUME;

drop table if exists Relationship_15;

drop table if exists Relationship_17;

drop table if exists Relationship_7;

drop table if exists SCHOOL;

drop table if exists SKILL;

/*==============================================================*/
/* Table: ACCOUNT                                               */
/*==============================================================*/
create table ACCOUNT
(
   AccountId            int not null,
   JrID                 int,
   ResumeId             int,
   UserName             text,
   Email                text,
   Password             text,
   AccountType          char(10),
   primary key (AccountId)
);

/*==============================================================*/
/* Table: CAREER_OBJECTIVE                                      */
/*==============================================================*/
create table CAREER_OBJECTIVE
(
   DesirePosition       text,
   DesireSalary         int,
   RecentSalary         int,
   PositionType         text,
   DesireCareerLv       text,
   DesireWorkLocation   text,
   WillingToRelocate    blob,
   WillingToTravel      blob,
   CareerObjective      text,
   CareerObjectiveId    int not null,
   ResumeId             int not null,
   primary key (CareerObjectiveId)
);

/*==============================================================*/
/* Table: CATEGORY                                              */
/*==============================================================*/
create table CATEGORY
(
   CategoryId           int not null,
   SchoolID             int,
   CategoryName         text,
   primary key (CategoryId)
);

/*==============================================================*/
/* Table: COMPANY                                               */
/*==============================================================*/
create table COMPANY
(
   CompanyId            int not null,
   CompanyName          text,
   CompanySumary        text,
   primary key (CompanyId)
);

/*==============================================================*/
/* Table: EDUCATION                                             */
/*==============================================================*/
create table EDUCATION
(
   StartDate            date,
   EndDate              date,
   EducationDescription text,
   EducationId          int not null,
   ResumeId             int not null,
   SchoolID             int not null,
   EducationLv          text,
   primary key (EducationId)
);

/*==============================================================*/
/* Table: EXPERIENCE                                            */
/*==============================================================*/
create table EXPERIENCE
(
   ExperienceId         int not null,
   CategoryId           int not null,
   CompanyId            int not null,
   ResumeId             int not null,
   Company_name         text,
   JobTitle             text,
   Position             text,
   Description          text,
   Period               text,
   JobCategory          text,
   primary key (ExperienceId)
);

/*==============================================================*/
/* Table: JOB                                                   */
/*==============================================================*/
create table JOB
(
   JobId                int not null,
   CategoryId           int not null,
   CompanyId            int not null,
   JobName              text,
   Location             text,
   Salary               text,
   Description          text,
   Tags                 text,
   Requirement          text,
   Benifit              text,
   Expired              datetime,
   Source               text,
   primary key (JobId)
);

/*==============================================================*/
/* Table: JOB_RECOMMENDED                                       */
/*==============================================================*/
create table JOB_RECOMMENDED
(
   JrID                 int not null,
   AccountId            int not null,
   IsFit                bool,
   primary key (JrID)
);

/*==============================================================*/
/* Table: LANGUAGE                                              */
/*==============================================================*/
create table LANGUAGE
(
   Name                 text,
   Level                text,
   LanguageId           int not null,
   primary key (LanguageId)
);

/*==============================================================*/
/* Table: PROFILE                                               */
/*==============================================================*/
create table PROFILE
(
   Name                 text,
   Birthday             datetime,
   Gender               text,
   MaritalStatus        blob,
   PlaceOfBirth         text,
   Hometown             text,
   Nationality          text,
   Avatar               text,
   Address              text,
   Email                text,
   Phone                char(15),
   Hobby                text,
   ProfileId            int not null,
   ResumeId             int not null,
   primary key (ProfileId)
);

/*==============================================================*/
/* Table: REFERENCE                                             */
/*==============================================================*/
create table REFERENCE
(
   RefType              text,
   RefName              text,
   RefJobTitle          text,
   RefPhone             numeric(15,0),
   RefEmail             text,
   RefId                int not null,
   ResumeId             int not null,
   primary key (RefId)
);

/*==============================================================*/
/* Table: RESUME                                                */
/*==============================================================*/
create table RESUME
(
   ResumeId             int not null,
   ProfileId            int,
   AccountId            int not null,
   ResumeTitle          text,
   primary key (ResumeId)
);

/*==============================================================*/
/* Table: Relationship_15                                       */
/*==============================================================*/
create table Relationship_15
(
   CategoryId           int not null,
   CareerObjectiveId    int not null,
   primary key (CategoryId, CareerObjectiveId)
);

/*==============================================================*/
/* Table: Relationship_17                                       */
/*==============================================================*/
create table Relationship_17
(
   JobId                int not null,
   JrID                 int not null,
   primary key (JobId, JrID)
);

/*==============================================================*/
/* Table: Relationship_7                                        */
/*==============================================================*/
create table Relationship_7
(
   EducationId          int not null,
   LanguageId           int not null,
   primary key (EducationId, LanguageId)
);

/*==============================================================*/
/* Table: SCHOOL                                                */
/*==============================================================*/
create table SCHOOL
(
   SchoolID             int not null,
   SchoolName           text,
   primary key (SchoolID)
);

/*==============================================================*/
/* Table: SKILL                                                 */
/*==============================================================*/
create table SKILL
(
   Name                 text,
   Level                text,
   SkillId              int not null,
   ResumeId             int not null,
   primary key (SkillId)
);

alter table ACCOUNT add constraint FK_Relationship_12 foreign key (ResumeId)
      references RESUME (ResumeId);

alter table ACCOUNT add constraint FK_Relationship_20 foreign key (JrID)
      references JOB_RECOMMENDED (JrID);

alter table CAREER_OBJECTIVE add constraint FK_Relationship_6 foreign key (ResumeId)
      references RESUME (ResumeId);

alter table CATEGORY add constraint FK_Relationship_13 foreign key (SchoolID)
      references SCHOOL (SchoolID);

alter table EDUCATION add constraint FK_Relationship_2 foreign key (ResumeId)
      references RESUME (ResumeId);

alter table EDUCATION add constraint FK_Relationship_7 foreign key (SchoolID)
      references SCHOOL (SchoolID);

alter table EXPERIENCE add constraint FK_Relationship_16 foreign key (CompanyId)
      references COMPANY (CompanyId);

alter table EXPERIENCE add constraint FK_Relationship_17 foreign key (CategoryId)
      references CATEGORY (CategoryId);

alter table EXPERIENCE add constraint FK_Relationship_5 foreign key (ResumeId)
      references RESUME (ResumeId);

alter table JOB add constraint FK_Relationship_14 foreign key (CategoryId)
      references CATEGORY (CategoryId);

alter table JOB add constraint FK_Relationship_15 foreign key (CompanyId)
      references COMPANY (CompanyId);

alter table JOB_RECOMMENDED add constraint FK_Relationship_21 foreign key (AccountId)
      references ACCOUNT (AccountId);

alter table PROFILE add constraint FK_Relationship_4 foreign key (ResumeId)
      references RESUME (ResumeId);

alter table REFERENCE add constraint FK_Relationship_10 foreign key (ResumeId)
      references RESUME (ResumeId);

alter table RESUME add constraint FK_Relationship_11 foreign key (AccountId)
      references ACCOUNT (AccountId);

alter table RESUME add constraint FK_Relationship_3 foreign key (ProfileId)
      references PROFILE (ProfileId);

alter table Relationship_15 add constraint FK_Relationship_18 foreign key (CategoryId)
      references CATEGORY (CategoryId);

alter table Relationship_15 add constraint FK_Relationship_19 foreign key (CareerObjectiveId)
      references CAREER_OBJECTIVE (CareerObjectiveId);

alter table Relationship_17 add constraint FK_Relationship_22 foreign key (JobId)
      references JOB (JobId);

alter table Relationship_17 add constraint FK_Relationship_23 foreign key (JrID)
      references JOB_RECOMMENDED (JrID);

alter table Relationship_7 add constraint FK_Relationship_8 foreign key (EducationId)
      references EDUCATION (EducationId);

alter table Relationship_7 add constraint FK_Relationship_9 foreign key (LanguageId)
      references LANGUAGE (LanguageId);

alter table SKILL add constraint FK_Relationship_1 foreign key (ResumeId)
      references RESUME (ResumeId);

