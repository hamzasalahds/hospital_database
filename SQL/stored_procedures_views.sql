-- Test history for all patients, the type of covid test and date/time of test and nurse first_name who administered the test.


CREATE OR REPLACE VIEW covid_test_history AS
SELECT CONCAT(p.first_name," ", p.last_name) AS Covid_Patient, n.first_name AS Nurse, tm.name AS CovTest, tr.test_date AS Test_Date_Time
FROM Nurses n
JOIN Records_Testing tr USING(nurse_id)
JOIN Records_Patients p USING(patient_Id)
JOIN Testing_Methods tm USING(method_id);

--	--------------------------------------------------------------------------------------------------------------------------
--	##	Patient info including name and city their symptoms and testing methods with prescribed treatments.

CREATE OR REPLACE VIEW patient_symptoms_with_location AS
SELECT rp.patient_id, rp.first_name, rp.last_name, rp.city, s.name AS symptom, ra.date_of_admission, tm.name AS testing_method ,ct.name AS treatment FROM records_patients rp
JOIN records_admissions as ra USING(patient_id)
JOIN records_symptoms rs USING(patient_id)
JOIN symptoms s USING(symptom_id)
JOIN records_treatments rt USING(patient_id)
JOIN covid_treatments ct USING(treatment_id)
JOIN records_testing t USING(patient_id)
JOIN testing_methods tm USING(method_Id);


--	--------------------------------------------------------------------------------------------------------------------------
--	##	All doctors and nurses who treated COVID-19 patients between January-2-2020 and January-12-2020.

CREATE OR REPLACE VIEW doctors_nurses_exposure AS
SELECT  CONCAT(p.first_name," ", p.last_name) AS Covid_Patient, CONCAT(d.first_name," ", d.last_name) AS Doctor, dsr.shift_start AS Doctor_Shift_Start, dsr.shift_end AS Doctor_Shift_End,
	   CONCAT(n.first_name," ", n.last_name) AS Nurse, dsr.shift_start AS Nurse_Shift_Start, dsr.shift_end AS Nurse_Shift_End
FROM Records_Doctors_Shifts dsr
JOIN Doctors d USING(doctor_id)
JOIN Records_Patients p USING(doctor_id)
JOIN Nurses n USING(nurse_id)
JOIN Records_Nurses_Shifts nsr USING(nurse_id)
WHERE dsr.Shift_Start BETWEEN '2020-01-02' AND '2020-01-012'
GROUP BY Covid_Patient;

--	--------------------------------------------------------------------------------------------------------------------------
--	Patients covid medication records with start date and doctor who administered the treatment.

CREATE OR REPLACE VIEW patient_medicine_records AS
SELECT CONCAT(p.first_name," ",p.last_name) AS Patient_Name, CONCAT(d.first_name," ", d.last_name) AS Doctor, ct.name AS Covid_Treatment, rt.start_date_time AS Start_Date_Time
FROM Doctors d 
JOIN Records_Patients p USING(doctor_id)
JOIN Records_Treatments rt USING(patient_id)
JOIN Covid_Treatments  ct USING(treatment_id);

--	--------------------------------------------------------------------------------------------------------------------------
--	Patient symptoms and dates it appearad if they know, the admission date and the total days paitent waited after symptoms appeared to admission.

CREATE OR REPLACE VIEW patient_symptom_records AS
SELECT 	CONCAT(rp.first_name," ", rp.last_name) AS Patient, ra.date_of_admission AS Date_of_Admission, s.name AS Symptoms, 
		rs.start_date_time AS Time_Appeared, ABS(DATEDIFF(date_of_admission, rs.start_date_time)) AS Days_between_symptoms_and_admission
FROM COVID_Wing cw
JOIN Records_Admissions ra USING(floor,room)
JOIN Records_Patients rp USING(patient_id)
JOIN Records_Symptoms rs USING(patient_id)
JOIN Symptoms s USING(symptom_id);
								  
--	--------------------------------------------------------------------------------------------------------------------------
--	The floor and room numbers, fullnames and addresses of all covid patients along with their contact information relationship----

CREATE OR REPLACE VIEW patients_with_contact_info AS
SELECT patient_id AS Patient_Id, CONCAT(first_name," ",last_name) AS Patient_Name, p.phone AS Phone_Number, CONCAT(ra.floor," - ",ra.room) AS Floor_Room_Number, 
ci.full_name AS Contact, cre.relationship_type AS Relationship, ci.phone_number AS Contact_Number
FROM Records_Admissions ra
JOIN Records_Patients p USING(patient_id)
JOIN Records_Contacts rc USING(patient_id)
JOIN Contact_Information ci USING(contact_id)
JOIN Contact_Relationships cre USING(type_id)
WHERE patient_id IN (SELECT patient_id FROM Records_Contacts)
ORDER BY patient_id;

--	--------------------------------------------------------------------------------------------------------------------------
--	Patients with no contact information.

CREATE OR REPLACE VIEW patients_with_no_contact_info AS
SELECT patient_id, CONCAT(first_name," ",last_name) AS Patient_Name, concat(ra.floor," - ",ra.room) AS Floor_Room_Number
FROM Records_Admissions ra
JOIN Records_Patients p USING(patient_id)
WHERE patient_id NOT IN (SELECT patient_id FROM Records_Contacts);

--	--------------------------------------------------------------------------------------------------------------------------
--	Stored Procedures


DROP PROCEDURE IF EXISTS get_contact_records_by_patient;
DELIMITER $$
CREATE PROCEDURE get_contact_records_by_patient(
patient_id INT
)
BEGIN
SELECT CONCAT(rp.first_name," ",rp.last_name) AS Patient_Name, rp.phone AS Phone_Number, 
ci.full_name AS Contact, cre.relationship_type AS Relationship, ci.phone_number AS Contact_Number
FROM Records_Patients rp
JOIN Records_Contacts rc USING(patient_id)
JOIN Contact_Information ci USING(contact_id)
JOIN Contact_Relationships cre USING(type_id)
	WHERE rp.patient_id = IFNULL(patient_id, rp.patient_id);
    
END$$
DELIMITER ;

--	--------------------------------------------------------------------------------------------------------------------------

DROP PROCEDURE IF EXISTS get_patients_by_zip;
DELIMITER $$
CREATE PROCEDURE get_patients_by_zip(
zip INT
)
BEGIN
	SELECT * FROM Records_Patients rp
    WHERE rp.zip = IFNULL(zip, rp.zip);
    
    
END$$
DELIMITER ;

--	--------------------------------------------------------------------------------------------------------------------------
--	Get treatment records by specific patient

DROP PROCEDURE IF EXISTS get_treatment_records_by_patient;
DELIMITER $$
CREATE PROCEDURE get_treatment_records_by_patient(
patient_id INT
)
BEGIN
	SELECT CONCAT(rp.first_name," ",rp.last_name) AS Patient_Name, CONCAT(d.first_name," ", d.last_name) AS Doctor, ct.name AS Covid_Treatment, rt.start_date_time AS Start_Date_Time
	FROM Doctors d
	JOIN Records_Patients rp USING(doctor_id)
	JOIN Records_Treatments rt USING(patient_id)
	JOIN Covid_Treatments  ct USING(treatment_id)
    WHERE rp.patient_id = IFNULL(patient_id, rt.patient_id);
END$$
DELIMITER ;


--	--------------------------------------------------------------------------------------------------------------------------
--	 get all symptoms for specific patients

DROP PROCEDURE IF EXISTS get_symptom_records_by_patient;
DELIMITER $$
CREATE PROCEDURE get_symptom_records_by_patient(
patient_id INT
)
BEGIN
	SELECT 	CONCAT(rp.first_name," ", rp.last_name) AS Patient, ra.date_of_admission AS Date_of_Admission, s.name AS Symptoms, 
		rs.start_date_time AS Time_Appeared
FROM COVID_Wing cw
JOIN Records_Admissions ra USING(floor,room)
JOIN Records_Patients rp USING(patient_id)
JOIN Records_Symptoms rs USING(patient_id)
JOIN Symptoms s USING(symptom_id)
WHERE rp.patient_id = IFNULL(patient_id, rp.patient_id);
    
END$$
DELIMITER ;

--	--------------------------------------------------------------------------------------------------------------------------
