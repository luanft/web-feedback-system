/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     9/5/2015 6:37:14 PM                          */
/*==============================================================*/


drop table if exists ACCOUNT;

drop table if exists CARE;

drop table if exists CAREER_OBJECTIVE;

drop table if exists CATEGORY;

drop table if exists COMPANY;

drop table if exists EDUCATION;

drop table if exists EXPERIENCE;

drop table if exists JOB;

drop table if exists JOB_RECCOMENDED;

drop table if exists LANGUAGE;

drop table if exists REFERENCE;

drop table if exists RESUME;

drop table if exists SCHOOL;

drop table if exists SKILL;

drop table if exists XPATH;

/*==============================================================*/
/* Table: ACCOUNT                                               */
/*==============================================================*/
create table ACCOUNT
(
   AccountId            int not null auto_increment,
   UserName             text,
   Email                char(100),
   Password             text,
   AccountType          char(10),
   TimeReceiveEmail     char(10),
   NumberReceiveEmail   int,
   IsActive             bool,
   primary key (AccountId),
   unique key AK_Key_2 (Email)
);

/*==============================================================*/
/* Table: CARE                                                  */
/*==============================================================*/
create table CARE
(
   CategoryId           int not null,
   AccountId            int not null,
   primary key (CategoryId, AccountId)
);

/*==============================================================*/
/* Table: CAREER_OBJECTIVE                                      */
/*==============================================================*/
create table CAREER_OBJECTIVE
(
   DesireSalary         int,
   RecentSalary         int,
   PositionType         text,
   DesireCareerLevel    text,
   DesireWorkLocation   text,
   WillingToRelocate    blob,
   WillingToTravel      blob,
   CareerObjective      text,
   CareerObjectiveId    int not null auto_increment,
   ResumeId             int not null,
   primary key (CareerObjectiveId)
);

/*==============================================================*/
/* Table: CATEGORY                                              */
/*==============================================================*/
create table CATEGORY
(
   CategoryId           int not null auto_increment,
   Description          text,
   primary key (CategoryId)
);

/*==============================================================*/
/* Table: COMPANY                                               */
/*==============================================================*/
create table COMPANY
(
   CompanyId            int not null auto_increment,
   AccountId            int not null,
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
   EducationId          int not null auto_increment,
   ResumeId             int not null,
   SchoolID             int not null,
   EducationLevel       text,
   primary key (EducationId)
);

/*==============================================================*/
/* Table: EXPERIENCE                                            */
/*==============================================================*/
create table EXPERIENCE
(
   ExperienceId         int not null auto_increment,
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
   JobId                int not null auto_increment,
   CategoryId           int not null,
   AccountId            int not null,
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
/* Table: JOB_RECCOMENDED                                       */
/*==============================================================*/
create table JOB_RECCOMENDED
(
   AccountId            int not null,
   JobId                int not null,
   IsFit                bool,
   primary key (AccountId, JobId)
);

/*==============================================================*/
/* Table: LANGUAGE                                              */
/*==============================================================*/
create table LANGUAGE
(
   Name                 text,
   Level                text,
   LanguageId           int not null auto_increment,
   ResumeId             int,
   primary key (LanguageId)
);

/*==============================================================*/
/* Table: REFERENCE                                             */
/*==============================================================*/
create table REFERENCE
(
   Type                 text,
   Name                 text,
   JobTitle             text,
   Phone                char(15),
   Email                char(100),
   ReferenceId          int not null auto_increment,
   ResumeId             int not null,
   primary key (ReferenceId)
);

/*==============================================================*/
/* Table: RESUME                                                */
/*==============================================================*/
create table RESUME
(
   ResumeId             int not null auto_increment,
   AccountId            int not null,
   Title                text,
   Name                 text,
   Birthday             datetime,
   Gender               text,
   MaritalStatus        blob,
   PlaceOfBirth         text,
   Hometown             text,
   Nationality          text,
   Avatar               text,
   Address              text,
   Email                char(100),
   Phone                char(15),
   Hobby                text,
   primary key (ResumeId)
);

/*==============================================================*/
/* Table: SCHOOL                                                */
/*==============================================================*/
create table SCHOOL
(
   SchoolID             int not null auto_increment,
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
   SkillId              int not null auto_increment,
   ResumeId             int not null,
   primary key (SkillId)
);

/*==============================================================*/
/* Table: XPATH                                                 */
/*==============================================================*/
create table XPATH
(
   home_url             char(200) not null,
   CategoryId           int not null,
   base_url             text,
   xpath_code           text,
   job_xpath            text,
   company_xpath        text,
   location_xpath       text,
   description_xpath    text,
   salary_xpath         text,
   requirement_xpath    text,
   benifit_xpath        text,
   expired_xpath        text,
   tags_xpath           text,
   login_url            text,
   login_data           text,
   id                   int not null,
   primary key (home_url)
);

alter table CARE add constraint FK_CARE foreign key (CategoryId)
      references CATEGORY (CategoryId) on delete restrict on update restrict;

alter table CARE add constraint FK_CARE2 foreign key (AccountId)
      references ACCOUNT (AccountId) on delete restrict on update restrict;

alter table CAREER_OBJECTIVE add constraint FK_Relationship_5 foreign key (ResumeId)
      references RESUME (ResumeId) on delete restrict on update restrict;

alter table COMPANY add constraint FK_Relationship_12 foreign key (AccountId)
      references ACCOUNT (AccountId) on delete restrict on update restrict;

alter table EDUCATION add constraint FK_Relationship_2 foreign key (ResumeId)
      references RESUME (ResumeId) on delete restrict on update restrict;

alter table EDUCATION add constraint FK_Relationship_6 foreign key (SchoolID)
      references SCHOOL (SchoolID) on delete restrict on update restrict;

alter table EXPERIENCE add constraint FK_Relationship_4 foreign key (ResumeId)
      references RESUME (ResumeId) on delete restrict on update restrict;

alter table JOB add constraint FK_Relationship_11 foreign key (CategoryId)
      references CATEGORY (CategoryId) on delete restrict on update restrict;

alter table JOB add constraint FK_Relationship_14 foreign key (AccountId)
      references ACCOUNT (AccountId) on delete restrict on update restrict;

alter table JOB_RECCOMENDED add constraint FK_JOB_RECCOMENDED foreign key (AccountId)
      references ACCOUNT (AccountId) on delete restrict on update restrict;

alter table JOB_RECCOMENDED add constraint FK_JOB_RECCOMENDED2 foreign key (JobId)
      references JOB (JobId) on delete restrict on update restrict;

alter table LANGUAGE add constraint FK_Relationship_16 foreign key (ResumeId)
      references RESUME (ResumeId) on delete restrict on update restrict;

alter table REFERENCE add constraint FK_Relationship_8 foreign key (ResumeId)
      references RESUME (ResumeId) on delete restrict on update restrict;

alter table RESUME add constraint FK_Relationship_9 foreign key (AccountId)
      references ACCOUNT (AccountId) on delete restrict on update restrict;

alter table SKILL add constraint FK_Relationship_1 foreign key (ResumeId)
      references RESUME (ResumeId) on delete restrict on update restrict;

alter table XPATH add constraint FK_Relationship_15 foreign key (CategoryId)
      references CATEGORY (CategoryId) on delete restrict on update restrict;

