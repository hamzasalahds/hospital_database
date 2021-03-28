--	Execute this script to insert patient information

INSERT INTO Doctors VALUES (DEFAULT, "Michael", "Rubin");
INSERT INTO Doctors VALUES (DEFAULT, "Mike", "Lowery");
INSERT INTO Doctors VALUES (DEFAULT, "Steven", "Segal");
INSERT INTO Doctors VALUES (DEFAULT, "Goeorge", "Ball");
INSERT INTO Doctors VALUES (DEFAULT, "Amy", "White");
INSERT INTO Doctors VALUES (DEFAULT, "Ruby", "Secret");
INSERT INTO Doctors VALUES (DEFAULT, "Robert", "Half");
INSERT INTO Doctors VALUES (DEFAULT, "Calib", "Callhoun");
     
     
INSERT INTO Nurses VALUES (DEFAULT, "Jenna", "Slim");
INSERT INTO Nurses VALUES (DEFAULT, "Mike", "Johnson");
INSERT INTO Nurses VALUES (DEFAULT, "Calvin", "Harris");
INSERT INTO Nurses VALUES (DEFAULT, "Scott", "Veele");
INSERT INTO Nurses VALUES (DEFAULT, "Ramy", "Ayoub");
INSERT INTO Nurses VALUES (DEFAULT, "Sarah", "Heart");
INSERT INTO Nurses VALUES (DEFAULT, "Kevin", "Malone");
INSERT INTO Nurses VALUES (DEFAULT, "Souraya", "Jenkins");

INSERT INTO COVID_Wing VALUES (1, 100);
INSERT INTO COVID_Wing VALUES (1, 101);
INSERT INTO COVID_Wing VALUES (1, 102);
INSERT INTO COVID_Wing VALUES (1, 103);
INSERT INTO COVID_Wing VALUES (1, 104);
INSERT INTO COVID_Wing VALUES (1, 105);
INSERT INTO COVID_Wing VALUES (1, 106);
INSERT INTO COVID_Wing VALUES (1, 107);
INSERT INTO COVID_Wing VALUES (1, 108);
INSERT INTO COVID_Wing VALUES (2, 109);
INSERT INTO COVID_Wing VALUES (2, 110);
INSERT INTO COVID_Wing VALUES (2, 111);
INSERT INTO COVID_Wing VALUES (3, 112);
INSERT INTO COVID_Wing VALUES (3, 113);
INSERT INTO COVID_Wing VALUES (4, 114);
INSERT INTO COVID_Wing VALUES (5, 115);

INSERT INTO Records_Patients VALUES (DEFAULT, "John", "Que", 9017277012, "3442 James Ave", "Memphis", "TN", 38111, 1, 2);
INSERT INTO Records_Patients VALUES (DEFAULT, "Salma", "White", 9017333128, "15 Brawm St.", "Memphis", "TN", 38112, 4, 6);
INSERT INTO Records_Patients VALUES (DEFAULT, "Inna", "Gold", 7317277012, "45 Macon St.", "Savannah", "TN",38372, 6, 1);
INSERT INTO Records_Patients VALUES (DEFAULT, "Irina", "Rimes", 5017277012, "100 Jefferson St.", "West-Memphis", "AR", 29991, 7, 3);
INSERT INTO Records_Patients VALUES (DEFAULT, "Serena", "Williams", 9017277012, "12 Carl Rd.", "Memphis", "TN", 38111, 1, 2);
INSERT INTO Records_Patients VALUES (DEFAULT, "Alex", "Rogers", 7737277012, "22nd St Apt.15", "Chicago", "IL", 60543, 8, 8);
INSERT INTO Records_Patients VALUES (DEFAULT, "Samy", "Cort", 9017279012, "8 Oak Dr.", "Memphis", "TN", 38111, 3, 2);
INSERT INTO Records_Patients VALUES (DEFAULT, "TJ", "Williams", 9017877012, "11 Sandra BLVD",  "Memphis", "TN", 38112, 6, 5);
INSERT INTO Records_Patients VALUES (DEFAULT, "Sondra", "Davell", 9017277012, "5553 King St.", "Memphis", "TN", 38123, 7, 7);
INSERT INTO Records_Patients VALUES (DEFAULT, "Cassandra", "Darvel", 9413337012, "2234 Oak Court", "Memphis", "TN", 38111, 3, 3);
INSERT INTO Records_Patients VALUES (DEFAULT, "Ellea", "Hope", 9015557012, "12 Independet St.", "Memphis", "TN", 38112, 3, 8);
INSERT INTO Records_Patients VALUES (DEFAULT, "Lilly", "yang", 9015577012, "10 James town", "Memphis", "TN", 38113, 1, 8);

INSERT INTO Records_Admissions VALUES (1, 1, 100, "2020-01-01 08:00:00");
INSERT INTO Records_Admissions VALUES (2, 1, 102, "2020-01-02 09:23:00");
INSERT INTO Records_Admissions VALUES (3, 1, 103, "2020-01-03 07:30:00");
INSERT INTO Records_Admissions VALUES (4, 1, 104, "2020-01-04 10:26:00");
INSERT INTO Records_Admissions VALUES (5, 1, 105, "2020-01-05 06:23:00");
INSERT INTO Records_Admissions VALUES (6, 1, 106, "2020-01-06 09:40:00");
INSERT INTO Records_Admissions VALUES (7, 1, 107, "2020-01-07 08:20:00");
INSERT INTO Records_Admissions VALUES (8, 1, 108, "2020-01-08 08:20:00");
INSERT INTO Records_Admissions VALUES (9, 2, 109, "2020-01-09 08:20:00");
INSERT INTO Records_Admissions VALUES (10, 2, 110, "2020-01-10 08:20:00");
INSERT INTO Records_Admissions VALUES (11, 2, 111, "2020-01-11 08:20:00");
INSERT INTO Records_Admissions VALUES (12, 3, 112, "2020-01-12 08:20:00");

INSERT INTO Records_Doctors_Shifts VALUES ("2020-01-02 08:00:00", "2020-01-02 20:30:00", 1);
INSERT INTO Records_Doctors_Shifts VALUES ("2020-01-03 09:23:00", "2020-01-03 21:30:00", 2);
INSERT INTO Records_Doctors_Shifts VALUES ("2020-01-04 07:30:00", "2020-01-04 21:30:00", 3);
INSERT INTO Records_Doctors_Shifts VALUES ("2020-01-05 10:26:00", "2020-01-05 21:43:00", 4);
INSERT INTO Records_Doctors_Shifts VALUES ("2020-01-06 06:23:00", "2020-01-06 20:23:00", 5);
INSERT INTO Records_Doctors_Shifts VALUES ("2020-01-07 09:40:00", "2020-01-07 22:30:00", 6);
INSERT INTO Records_Doctors_Shifts VALUES ("2020-01-08 08:20:00", "2020-01-08 18:16:00", 7);
INSERT INTO Records_Doctors_Shifts VALUES ("2020-01-09 10:23:00", "2020-01-09 23:10:00", 8);
INSERT INTO Records_Doctors_Shifts VALUES ("2020-01-10 07:00:00", "2020-01-10 17:00:00", 1);
INSERT INTO Records_Doctors_Shifts VALUES ("2020-01-11 09:16:00", "2020-01-11 20:13:00", 2);
INSERT INTO Records_Doctors_Shifts VALUES ("2020-01-12 08:40:00", "2020-01-12 21:23:00", 3);
INSERT INTO Records_Doctors_Shifts VALUES ("2020-01-13 10:10:00", "2020-01-13 22:20:00", 4);


INSERT INTO Records_Nurses_Shifts VALUES ("2020-01-02 08:00:00", "2020-01-02 20:30:00", 1);
INSERT INTO Records_Nurses_Shifts VALUES ("2020-01-03 09:23:00", "2020-01-03 21:30:00", 2);
INSERT INTO Records_Nurses_Shifts VALUES ("2020-01-04 07:30:00", "2020-01-04 21:30:00", 3);
INSERT INTO Records_Nurses_Shifts VALUES ("2020-01-05 10:26:00", "2020-01-05 21:43:00", 4);
INSERT INTO Records_Nurses_Shifts VALUES ("2020-01-06 06:23:00", "2020-01-06 20:23:00", 5);
INSERT INTO Records_Nurses_Shifts VALUES ("2020-01-07 09:40:00", "2020-01-07 22:30:00", 6);
INSERT INTO Records_Nurses_Shifts VALUES ("2020-01-08 08:20:00", "2020-01-08 18:16:00", 7);
INSERT INTO Records_Nurses_Shifts VALUES ("2020-01-09 10:23:00", "2020-01-09 23:10:00", 8);
INSERT INTO Records_Nurses_Shifts VALUES ("2020-01-10 07:00:00", "2020-01-10 17:00:00", 1);
INSERT INTO Records_Nurses_Shifts VALUES ("2020-01-11 09:16:00", "2020-01-11 20:13:00", 2);
INSERT INTO Records_Nurses_Shifts VALUES ("2020-01-12 08:40:00", "2020-01-12 21:23:00", 3);
INSERT INTO Records_Nurses_Shifts VALUES ("2020-01-13 10:10:00", "2020-01-13 22:20:00", 4);



INSERT INTO Testing_Methods VALUES (1, "PCR");
INSERT INTO Testing_Methods VALUES (2, "Antibody");

INSERT INTO Records_Testing VALUES (DEFAULT, "2020-01-02 08:00:00", 1, 1, 1);
INSERT INTO Records_Testing VALUES (DEFAULT, "2022-01-03 10:13:00", 2, 2, 2);
INSERT INTO Records_Testing VALUES (DEFAULT, "2020-01-04 12:30:00", 3, 3, 1);
INSERT INTO Records_Testing VALUES (DEFAULT, "2020-01-05 11:26:00", 4, 4, 1);
INSERT INTO Records_Testing VALUES (DEFAULT, "2020-01-06 07:13:00", 5, 5, 2);
INSERT INTO Records_Testing VALUES (DEFAULT, "2020-01-07 10:15:00", 6, 6, 1);
INSERT INTO Records_Testing VALUES (DEFAULT, "2020-01-08 09:20:00", 7, 7, 2);
INSERT INTO Records_Testing VALUES (DEFAULT, "2020-01-09 11:23:00", 8, 8, 2);
INSERT INTO Records_Testing VALUES (DEFAULT, "2020-01-10 08:00:00", 1, 9, 2);
INSERT INTO Records_Testing VALUES (DEFAULT, "2020-01-11 09:30:00", 2, 10, 1);
INSERT INTO Records_Testing VALUES (DEFAULT, "2020-01-12 09:40:00", 3, 11, 1);
INSERT INTO Records_Testing VALUES (DEFAULT, "2020-01-13 11:10:00", 4, 12, 2);


INSERT INTO Covid_Treatments VALUES (DEFAULT, "Arbidol");
INSERT INTO Covid_Treatments VALUES (DEFAULT, "Chloroquine");
INSERT INTO Covid_Treatments VALUES (DEFAULT, "Interferon alfa-2b");
INSERT INTO Covid_Treatments VALUES (DEFAULT, "Remdesivir");
INSERT INTO Covid_Treatments VALUES (DEFAULT, "Favipiravir");
INSERT INTO Covid_Treatments VALUES (DEFAULT, "Actemra");
INSERT INTO Covid_Treatments VALUES (DEFAULT, "Kevzara");
INSERT INTO Covid_Treatments VALUES (DEFAULT, "CD24Fc");
INSERT INTO Covid_Treatments VALUES (DEFAULT, "Sylvant");
INSERT INTO Covid_Treatments VALUES (DEFAULT, "Prezcobix"); 
INSERT INTO Covid_Treatments VALUES (DEFAULT, "Losartan");
INSERT INTO Covid_Treatments VALUES (DEFAULT, "Plasmapheresis");


INSERT INTO Records_Treatments VALUES (1, 1, "2020-01-03 08:00:00", 2);
INSERT INTO Records_Treatments VALUES (2, 3, "2022-01-04 09:13:00", 3);
INSERT INTO Records_Treatments VALUES (3, 6, "2020-01-05 11:30:00", 4);
INSERT INTO Records_Treatments VALUES (4, 2, "2020-01-06 12:26:00", 5); 
INSERT INTO Records_Treatments VALUES (5, 7, "2020-01-07 08:13:00", 6);
INSERT INTO Records_Treatments VALUES (6, 8, "2020-01-08 11:15:00", 7);
INSERT INTO Records_Treatments VALUES (7, 9, "2020-01-09 10:20:00", 8);
INSERT INTO Records_Treatments VALUES (8, 10, "2020-01-10 12:23:00", 1);
INSERT INTO Records_Treatments VALUES (9, 11,  "2020-01-11 06:00:00", 2);
INSERT INTO Records_Treatments VALUES (10, 12, "2020-01-12 06:30:00", 3);
INSERT INTO Records_Treatments VALUES (11, 1, "2020-01-13 8:30:00", 4);
INSERT INTO Records_Treatments VALUES (12, 4,  "2020-01-14 12:20:00", 1);


INSERT INTO Symptoms VALUES (DEFAULT,"Cough");
INSERT INTO Symptoms VALUES (DEFAULT,"Fever");
INSERT INTO Symptoms VALUES (DEFAULT,"Headache");
INSERT INTO Symptoms VALUES (DEFAULT,"Migraine");
INSERT INTO Symptoms VALUES (DEFAULT,"Impaired Taste");
INSERT INTO Symptoms VALUES (DEFAULT,"Impared Smell");
INSERT INTO Symptoms VALUES (DEFAULT,"Stomache Ache");
INSERT INTO Symptoms VALUES (DEFAULT,"Chills");
INSERT INTO Symptoms VALUES (DEFAULT,"Nausea");
INSERT INTO Symptoms VALUES (DEFAULT,"Bronchitis");
INSERT INTO Symptoms VALUES (DEFAULT,"Difficulty Breathing");
INSERT INTO Symptoms VALUES (DEFAULT,"Pneumonia");

INSERT INTO Contact_Relationships VALUES (DEFAULT, "Family");
INSERT INTO Contact_Relationships VALUES (DEFAULT, "Friend");
INSERT INTO Contact_Relationships VALUES (DEFAULT, "Co-Worker");
INSERT INTO Contact_Relationships VALUES (DEFAULT, "Acquaintance");

INSERT INTO Contact_Information VALUES (DEFAULT, "Sarah Palmer", 7337277012, 1);
INSERT INTO Contact_Information VALUES (DEFAULT, "Jennifer James", 7313227012, 2);
INSERT INTO Contact_Information VALUES (DEFAULT, "Sarah Palmer", 7317277012, 3);
INSERT INTO Contact_Information VALUES (DEFAULT, "Mariah Jones", 7317277012, 4);
INSERT INTO Contact_Information VALUES (DEFAULT, "Jenna Brooks", 7314439224, 3);
INSERT INTO Contact_Information VALUES (DEFAULT, "Delialah Scovy", 7551438294, 2);

INSERT INTO Records_Contacts VALUES (1, 1);
INSERT INTO Records_Contacts  VALUES (2, 2);
INSERT INTO Records_Contacts   VALUES (3, 3);
INSERT INTO Records_Contacts  VALUES (4, 4);
INSERT INTO Records_Contacts  VALUES (5, 5);
INSERT INTO Records_Contacts  VALUES (6, 6);

INSERT INTO Records_Symptoms VALUES (1, 1, "2020-01-01 10:00:00");
INSERT INTO Records_Symptoms VALUES (1, 2, "2020-01-02 06:30:00");
INSERT INTO Records_Symptoms VALUES (2, 1, "2020-01-01 07:00:00");
INSERT INTO Records_Symptoms VALUES (2, 2, "2020-01-01 11:40:00");
INSERT INTO Records_Symptoms VALUES (2, 3, "2020-01-01 02:30:00");
INSERT INTO Records_Symptoms VALUES (3, 4, "2020-01-02 04:00:00");
INSERT INTO Records_Symptoms VALUES (4, 5, "2019-12-28 18:30:00");
INSERT INTO Records_Symptoms VALUES (5, 6, "2019-12-25 20:15:00");
INSERT INTO Records_Symptoms VALUES (6, 7, "2020-01-04 15:30:00");
INSERT INTO Records_Symptoms VALUES (7, 8, "2020-01-05 07:00:00");
INSERT INTO Records_Symptoms VALUES (8, 9, "2019-12-26 12:15:00");
INSERT INTO Records_Symptoms VALUES (9, 10, "2020-01-07 11:00:00");
INSERT INTO Records_Symptoms VALUES (10, 11, "2019-12-28 01:00:00");
INSERT INTO Records_Symptoms VALUES (11, 2,  "2020-01-08 16:30:00");
INSERT INTO Records_Symptoms VALUES (11, 4, "2020-01-08 19:30:00");
INSERT INTO Records_Symptoms VALUES (11, 5, "2020-01-09 23:30:00");
INSERT INTO Records_Symptoms VALUES (12, 11, "2020-01-08 08:00:00");
INSERT INTO Records_Symptoms VALUES (12, 1, "2020-01-09 08:00:00");
INSERT INTO Records_Symptoms VALUES (12, 2, "2020-01-09 10:00:00");
INSERT INTO Records_Symptoms VALUES (12, 4, "2020-01-10 08:00:00");














     
	













     
	
