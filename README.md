# <div align="center">  Hospital Covid Case Tracker </div>
###	This project aims to help reduce COVID-19 exposure at hospitals and minimize disease transmission to and between medical professionals. This database can be used to store information of doctor patient interactions, admission dates and medication used.
----------------------------------------------------------------------------------
###	<div align="center">Installing dependencies   </div> 
*	MySQL Workbench >= 8.0.
*	Scripts included in the **[SQL Folder](https://github.com/HmSalah/COVID_case_tracker/tree/main/SQL)**.
###	<div align="center"> Download and setup  </div> 
1.	Database Creation
	*	From MySQL Workbench open **create_db_hospital.sql** script.
	*	Execute the script.
	
2.	Patient Information
	*	From MySQL Workbench open **patient_information.sql** script.
	*	Execute the script.
	
3.	Stored procedures and views
	*	From file open **stored_procedures_views.sql** script.
	*	Execute the script.
-----------------------------------------------------------------------------------	
##	<div align="center"> Database Modeling Process </div> 	 ##
1.	**[Requirements Gathering](https://github.com/HmSalah/COVID_case_tracker/blob/main/README.md#-user-requirements-)**
	*	Created a [Statement of Requirements](https://github.com/HmSalah/COVID_case_tracker/blob/main/README.md#--1--statement-of-requirements) by summarizing all users’ requirements. 
	
2.	**[Building a Conceptual Model](https://github.com/HmSalah/COVID_case_tracker/blob/main/README.md#-2--conceptual-model-)**
  	*	Provided a high-level overview of the hospital domain and the things involved in this domain.
	
3.	**[Building a Logical - Physical Model](https://github.com/HmSalah/COVID_case_tracker/blob/main/README.md#-3--logicalphysical-mysql-model-)**
	*	Using MySQL, I created a Logical Model by definining the entities and relationships.
	*	Inserted primary keys and foreign keys.
     	*	Specified the data type for each attribute.
     	*	Gauranteed flexibility for future change, applied Normalization (1NF,2NF,3NF) forms to prevent data duplication.


-----------------------------------------------------------------------------------	
##  <div align="center"> User Requirements </div> 
######	<div align="center"> Conducted a survey with actual nurses and lab technichians that work at hospitals to deterimine what they want from this database.  </div>
### Questionnaire Survey
*	**Nurse:** *“I want to know the name of COVID patients, their symptoms, the doctors that treated them and when they Last tested for COVID and method of testing.*
* 	**Lab Technician:** *“We want to limit COVID-19 exposure on our floor by identifying all COVID patients and have their names, numbers, room and floor they located at, we also do not want to have a lot of patients in our floors, we have limited beds and rooms.”*

* 	**Social Worker:** *“our department requests a database that stores phone numbers of patients work number and immediate family to advice them to get checked for COVID as well as quarantine."*

* 	**Doctor:** *“I am looking for the safety of my fellow doctors and nurses. COVID is extremely contagious, therefore I request a detailed info of doctors and staff who are and have treated COVID patients to limit the exposure of this virus.”*

* 	**Hospital CEO:** *“We are trying to improve our system and operate effectively during the COVID-19 pandemic and follow infection prevention and control recommendations tailored to their setting minimizing disease transmission to patients, HCP, and others. If you could develop a database that can help with minimizing the amount of exposure to others.*

-----------------------------------------------------------------------------------	
##  <div align="center">  1- Statement of Requirements 

###### <div align="center"> This summary of all users’ requirements.</div>

* **Patient:** 
  - Information: Full Name, Phone Number, Home Address, Contact Information and Relationship.
* **Symptom:** 
  - Symptom Name	
  - Symptoms Start Date
* **Testing:**
  - COVID Testing Date
  - COVID Testing Method
* **Treatment:**
  - Treatment Name
  - Treatment Date/Time
* **Medical Professional:**
  - Doctor: Full Name
  - Nurse: Full Name
* **Admissions:**
  - Floor #
  - Room  #

-----------------------------------------------------------------------------------
##	<div align="center"> 2- Conceptual Model </div>
####	<div align="center"> 	A detailed description of the possible entities & attributes </div> 
<p align="center">  <img src="https://github.com/HmSalah/COVID_case_tracker/blob/889f18aefd219a4eafa80da7c1251c7364d597d5/ER%20Diagram%20Models/conceptual_model.png" alt="animated" /></p>

##	<div align="center"> 3- Logical/Physical MySQL Model </div>
####	<div align="center">The construction of the database using MySQL Workbench </div>
<p align="center"> <img src="https://github.com/HmSalah/COVID_case_tracker/blob/57e29dae1aea4948381600842c3591f0aa836aa6/ER%20Diagram%20Models/logical_physical_model.png"  alt="animated" /></p>


