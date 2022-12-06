/User table fields: user_id, user_name, user_added_date, user_password, user_mobile/
create table User(user_id int AUTO_INCREMENT,
user_name VARCHAR(20) ,
user_added_date DATE ,
user_password VARCHAR(20) ,
user_mobile bigint(10) ,
PRIMARY KEY (user_id));
     
/Note table fields: note_id, note_title, note_content, note_status, note_creation_date/
create table Note(
note_id int AUTO_INCREMENT,
note_title VARCHAR(20),
note_content VARCHAR(200),
note_status VARCHAR(10),
note_creation_date DATE ,
PRIMARY KEY (note_id));
       
/Category table fields : category_id, category_name, category_descr, category_creation_date, category_creator/
create table Category (
category_id int AUTO_INCREMENT,
category_name VARCHAR(20),
category_descr VARCHAR(50),
category_creation_date DATE,
category_creator int,
PRIMARY KEY (category_id),
FOREIGN KEY (category_creator) REFERENCES User(user_id)
);

/Reminder table fields : reminder_id, reminder_name, reminder_descr, reminder_type, reminder_creation_date, reminder_creator/
create table Reminder(
reminder_id int AUTO_INCREMENT,
reminder_name VARCHAR(20),
reminder_descr VARCHAR(100),
reminder_type VARCHAR(20),
reminder_creation_date DATE ,
reminder_creator int,
PRIMARY KEY (reminder_id),
FOREIGN KEY (reminder_creator) REFERENCES User(user_id)
);

/NoteCategory table fields : notecategory_id, note_id, category_id/
create table NoteCategory(
notecategory_id int AUTO_INCREMENT,
note_id int,
category_id int,
PRIMARY KEY (notecategory_id),
FOREIGN KEY (note_id) REFERENCES Note(note_id),
FOREIGN KEY (category_id) REFERENCES Category(category_id)
);

/Notereminder table fields : notereminder_id, note_id, reminder_id/
create table Notereminder(
notereminder_id int AUTO_INCREMENT,
note_id int,
reminder_id int,
PRIMARY KEY (notereminder_id),
FOREIGN KEY (note_id) REFERENCES Note(note_id),
FOREIGN KEY (reminder_id) REFERENCES Reminder(reminder_id)
);

/usernote table fields : usernote_id, user_id, note_id/
create table UserNote(
usernote_id int AUTO_INCREMENT,
user_id int,
note_id int,
PRIMARY KEY (usernote_id),
FOREIGN KEY (user_id) REFERENCES User(user_id),
FOREIGN KEY (note_id) REFERENCES Note(note_id)
);


/Insert the rows into the created tables (Note, Category, Reminder, User, UserNote, NoteReminder and NoteCategory)./
Insert into Note(note_id,note_title,note_content,note_status,note_creation_date) VALUES ('1', 'java', 'streams', 'done', '2022-08-22');
Insert into Note(note_id,note_title,note_content,note_status,note_creation_date) VALUES ('2', 'sql', 'DML', 'done', '2022-09-12');
Insert into Note(note_id,note_title,note_content,note_status,note_creation_date) VALUES ('3', 'python', 'open source', 'done', '2022-10-05');
Insert into Note(note_id,note_title,note_content,note_status,note_creation_date) VALUES ('4', 'javascript', 'frontEnd', 'pending', '2022-11-18');

Insert into User(user_id,user_name,user_added_date,user_password,user_mobile) VALUES (1,'Mohammed Usman','2022-08-22','usman099',8971571164);
Insert into User(user_id,user_name,user_added_date,user_password,user_mobile) VALUES (2,'ruman','2022-08-10','ruman456',7676896828);

Insert into Category(category_id,category_name,category_descr,category_creation_date,category_creator) VALUES ('1','developer', 'software developer', '2020-12-17', '1');
Insert into Category(category_id,category_name,category_descr,category_creation_date,category_creator) VALUES ('2','tester', 'manual tester', '2021-01-19', '2');

Insert into Reminder(reminder_id,reminder_name,reminder_descr,reminder_type,reminder_creation_date,reminder_creator) VALUES ( '1','meeting', 'standup meeting', 'morning', '2022-03-25', '1');
Insert into Reminder(reminder_id,reminder_name,reminder_descr,reminder_type,reminder_creation_date,reminder_creator) VALUES ( '2','test', 'examination', 'afternoon', '2022-04-09', '2');

Insert into UserNote(usernote_id,user_id,note_id) VALUES ('1','1', '1');
Insert into UserNote(usernote_id,user_id,note_id) VALUES ('2','2', '2');

Insert into Notereminder(notereminder_id,note_id,reminder_id) values('1','1','1');
Insert into Notereminder(notereminder_id,note_id,reminder_id) values('2','2','2');

Insert into NoteCategory(notecategory_id,note_id, category_id) VALUES ('1', '1', '1');
Insert into NoteCategory(notecategory_id,note_id,category_id) VALUES ('2','2', '2');

/Fetch the row from User table based on Id and Password./
select * from User where user_id=1 and user_password='manju123';

/Fetch all the rows from Note table based on the field note_creation_date./
select * from Note where note_creation_date = '2022-08-22';

/Fetch all the Categories created after the particular Date./
select * from Category where category_creation_date >'2020-12-17';

/Fetch all the Note ID from UserNote table for a given User./
select note_id from Usernote where user_id=1;

/Write Update query to modify particular Note for the given note Id./
update Note set note_title='hibernate',note_content='hibernate architecture',note_status='pending' where note_id=4;

/Fetch all the Notes from the Note table by a particular User./
select * from Note inner join User on Note.note_id=User.user_id where user_id=1;

/Fetch all the Notes from the Note table for a particular Category./
select * from Note INNER JOIN NoteCategory ON Note.note_id=NoteCategory.note_id where NoteCategory.category_id=1;

/Fetch all the reminder details for a given note id./
select * from Reminder INNER JOIN Notereminder on Reminder.reminder_id=Notereminder.reminder_id where Reminder.reminder_id=1;

/Fetch the reminder details for a given reminder id./
select * from Reminder where reminder_id=2;

/Write a query to create a new Note from particular User (Use Note and UserNote tables - insert statement)./
Insert into Note (note_title,note_content,note_status,note_creation_date) values('api', 'email', 'pending', '2022-08-22');
Insert into UserNote (user_id, note_id) values(1, last_insert_id());

/Write a query to create a new Note from particular User to particular Category(Use Note and NoteCategory tables - insert statement)/
Insert into Note(note_title,note_content,note_status,note_creation_date)  values( 'jsp','jsp tags', 'done', '2022-09-12');
Insert into NoteCategory(note_id, category_id) values(last_insert_id(), 2);

/Write a query to set a reminder for a particular note (Use Reminder and NoteReminder tables - insert statement)/
Insert into Reminder(reminder_name,reminder_descr,reminder_type,reminder_creation_date,reminder_creator)  values('interview', 'java interview', 'morning', '2022-04-08', 2);
Insert into Notereminder (note_id,reminder_id) values(2,last_insert_id());

/Write a query to delete particular Note added by a User(Note and UserNote tables - delete statement)/
delete from UserNote where user_id=1 AND note_id=1;
delete from Notereminder where note_id=1;
delete from NoteCategory where note_id=1;
delete from Note where note_id=1;
