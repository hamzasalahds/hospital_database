--------	Test history for all patients, the type of covid test and date/time of test and nurse first_name who administered the test.

CREATE OR REPLACE VIEW covid_test_history AS
SELECT CONCAT(p.first_name," ", p.last_name) AS Covid_Patient, n.first_name AS Nurse, tm.name AS CovTest, tr.test_date AS Test_Date_Time
FROM nurses n
JOIN records_testing tr USING(nurse_id)
JOIN records_patients p USING(patient_Id)
JOIN testing_methods tm USING(method_id);

--------	All doctors and nurses who have treated covid patients.

CREATE OR REPLACE VIEW doctors_nurses_exposure AS
SELECT CONCAT(d.first_name," ", d.last_name) AS Doctor, dsr.shift_start, dsr.shift_end, CONCAT(p.first_name," ", p.last_name) AS Covid_Patient,
	   CONCAT(n.first_name," ", n.last_name) AS Nurse, dsr.shift_start AS Nurse_Shift_Start, dsr.shift_end AS Nurse_Shift_End
FROM records_doctors_shifts dsr
JOIN doctors d USING(doctor_id)
JOIN records_patients p USING(doctor_id)
JOIN nurses n USING(nurse_id)
JOIN records_nurses_shifts nsr USING(nurse_id)
WHERE dsr.shift_start BETWEEN '2020-01-02' AND '2020-01-012'
GROUP BY covid_patient;

-------------------------------------------------------------------------------------------------------
--------	Patients covid medication records with start date and doctor who administered the treatment.

CREATE OR REPLACE VIEW patient_medicine_records AS
SELECT CONCAT(p.first_name," ",p.last_name) AS Patient_Name, CONCAT(d.first_name," ", d.last_name) AS Doctor, ct.name AS Covid_Treatment, rt.start_date_time AS Start_Date_Time
FROM doctors d 
JOIN records_patients p USING(doctor_id)
JOIN records_treatments rt USING(patient_id)
JOIN covid_treatments  ct USING(treatment_id);


--------	Patient symptoms and dates it appearad if they know, the admission date and the total days paitent waited after symptoms appeared to admission.

CREATE OR REPLACE VIEW patient_symptom_records AS
SELECT 	CONCAT(rp.first_name," ", rp.last_name) AS Patient, ra.date_of_admission AS Date_of_Admission, s.name AS Symptoms, 
		rs.start_date_time AS Time_Appeared, ABS(DATEDIFF(date_of_admission, rs.start_date_time)) AS Days_between_symptoms_and_admission
FROM covid_wing cw
JOIN records_admissions ra USING(floor,room)
JOIN records_patients rp USING(patient_id)
JOIN records_symptoms rs USING(patient_id)
JOIN symptoms s USING(symptom_id);

--------	The floor and room numbers, fullnames and addresses of all covid patients along with their contact information relationship----

CREATE OR REPLACE VIEW patients_with_contact_info AS
SELECT patient_id AS Patient_Id, CONCAT(first_name," ",last_name) AS Patient_Name, p.phone AS Phone_Number, CONCAT(ra.floor," - ",ra.room) AS Floor_Room_Number, 
ci.full_name AS Contact, cre.relationship_type AS Relationship, ci.phone_number AS Contact_Number
FROM records_admissions ra
JOIN records_patients p USING(patient_id)
JOIN records_contacts rc USING(patient_id)
JOIN contact_information ci USING(contact_id)
JOIN contact_relationships cre USING(type_id)
WHERE patient_id IN (SELECT patient_id FROM records_contacts)
ORDER BY Patient_id;


--------	Patients with no contact information.

CREATE OR REPLACE VIEW patients_with_no_contact_info AS
SELECT patient_id, CONCAT(first_name," ",last_name) AS Patient_Name, concat(ra.floor," - ",ra.room) AS Floor_Room_Number
FROM records_admissions ra
JOIN records_patients p USING(patient_id)
WHERE patient_id NOT IN (SELECT patient_id FROM records_contacts);

--	--------------------------------------------------------
----	Stored Procedures --------------------------------
----------------------------------------------------------

--	--------------------------------------------------------

DROP PROCEDURE IF EXISTS get_contact_records_by_patient;
DELIMITER $$
CREATE PROCEDURE get_contact_records_by_patient(
patient_id INT
)
BEGIN
SELECT CONCAT(rp.first_name," ",rp.last_name) AS Patient_Name, rp.phone AS Phone_Number, 
ci.full_name AS Contact, cre.relationship_type AS Relationship, ci.phone_number AS Contact_Number
FROM records_patients rp
JOIN records_contacts rc USING(patient_id)
JOIN contact_information ci USING(contact_id)
JOIN contact_relationships cre USING(type_id)
	WHERE rp.patient_id = IFNULL(patient_id, rp.patient_id);
    
END$$
DELIMITER ;

--	--------------------------------------------------------

DROP PROCEDURE IF EXISTS get_patients_by_zip;
DELIMITER $$
CREATE PROCEDURE get_patients_by_zip(
zip INT
)
BEGIN
	SELECT * FROM records_patients rp
    WHERE rp.zip = IFNULL(zip, rp.zip);
    
    
END$$
DELIMITER ;

--	--------------------------------------------------------
--	Get treatment records by specific patient

DROP PROCEDURE IF EXISTS get_treatment_records_by_patient;
DELIMITER $$
CREATE PROCEDURE get_treatment_records_by_patient(
patient_id INT
)
BEGIN
	SELECT CONCAT(rp.first_name," ",rp.last_name) AS Patient_Name, CONCAT(d.first_name," ", d.last_name) AS Doctor, ct.name AS Covid_Treatment, rt.start_date_time AS Start_Date_Time
	FROM doctors d
	JOIN records_patients rp USING(doctor_id)
	JOIN records_treatments rt USING(patient_id)
	JOIN covid_treatments  ct USING(treatment_id)
    WHERE rp.patient_id = IFNULL(patient_id, rt.patient_id);
END$$
DELIMITER ;


--	--------------------------------------------------------
--	 get all symptoms for specific patients

DROP PROCEDURE IF EXISTS get_symptom_records_by_patient;
DELIMITER $$
CREATE PROCEDURE get_symptom_records_by_patient(
patient_id INT
)
BEGIN
	SELECT 	CONCAT(rp.first_name," ", rp.last_name) AS Patient, ra.date_of_admission AS Date_of_Admission, s.name AS Symptoms, 
		rs.start_date_time AS Time_Appeared
FROM covid_wing cw
JOIN records_admissions ra USING(floor,room)
JOIN records_patients rp USING(patient_id)
JOIN records_symptoms rs USING(patient_id)
JOIN symptoms s USING(symptom_id)
WHERE rp.patient_id = IFNULL(patient_id, rp.patient_id);
    
END$$
DELIMITER ;

--	----------------------
--	---------------------
DROP PROCEDURE IF EXISTS add_patient;
DELIMITER $$
CREATE PROCEDURE add_patient(
first_name VARCHAR(50),
last_name VARCHAR(50),
phone VARCHAR(50),
street VARCHAR(255),
city VARCHAR(50),
state CHAR(2),
zip INT,
doctor_id INT,
nurse_id INT,
symptom_id INT,
start_date_time DATETIME,
contact_name VARCHAR(255),
contact_phone VARCHAR(50),
contact_relationship TINYINT
)
BEGIN
INSERT INTO records_patients VALUES (DEFAULT, first_name, last_name, phone, street, city, state, zip, doctor_id, nurse_id);
INSERT INTO records_symptoms VALUES (LAST_INSERT_ID(), symptom_id, start_date_time);
INSERT INTO contact_information VALUES (DEFAULT, contact_name, contact_phone, contact_relationship);
INSERT INTO records_contacts VALUES (patient_id, last_insert_id());
END$$
DELIMITER ;
--	--------------------


