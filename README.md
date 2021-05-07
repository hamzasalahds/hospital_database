# <div align="center">  Hospital COVID Case Tracker </div>
###	This project aims to help reduce COVID-19 exposure at hospitals and minimize disease transmission to and between medical professionals. This database provides medical staff with access to up-to-date, accurate patient information such as admission dates, symptoms, treatments, and the assigned medical professional.
----------------------------------------------------------------------------------
###	<div align="center">Installing Dependencies   </div> 
*	MySQL Workbench >= 8.0.
*	Scripts included in the **[SQL Folder](https://github.com/HmSalah/COVID_case_tracker/tree/main/SQL)**.
###	<div align="center"> Download and Setup  </div> 
1.	Database Creation
	*	From MySQL Workbench open the **create_db_hospital.sql** script.
	*	Execute the script.
	
2.	Patient Information
	*	From MySQL Workbench open the **patient_information.sql** script.
	*	Execute the script.
	
3.	Stored procedures and views
	*	From MySQL Workbench open the **stored_procedures_views.sql** script.
	*	Execute the script.
-----------------------------------------------------------------------------------	
##	<div align="center"> Database Modeling Process </div> 	 ##
1.	**[Requirements Gathering](https://github.com/HmSalah/COVID_case_tracker/blob/main/README.md#-user-requirements-)**
	*	Created a [Statement of Requirements](https://github.com/HmSalah/COVID_case_tracker/blob/main/README.md#--1--statement-of-requirements) by summarizing [user requirements](https://github.com/HmSalah/sql_hospital_database/blob/main/README.md#-user-requirements-). 
	
2.	**[Building a Conceptual Model](https://github.com/HmSalah/COVID_case_tracker/blob/main/README.md#-2--conceptual-model-)**
  	*	Provided a high-level overview of the hospital domain and the things involved in this domain.
	
3.	**[Building a Logical - Physical Model](https://github.com/HmSalah/COVID_case_tracker/blob/main/README.md#-3--logicalphysical-mysql-model-erd-)**
	*	Using MySQL, I created a Logical Model by defining the entities and relationships.
	*	Inserted primary keys and foreign keys.
     	*	Specified the data type for each attribute.
     	*	Guaranteed flexibility for future change, applied Normalization (1NF,2NF,3NF) forms to prevent data duplication.


-----------------------------------------------------------------------------------	
##  <div align="center"> User Requirements </div> 
######	<div align="center"> Conducted a survey with nurses to determine what they want from this database.  </div>
### Questionnaire Survey
*	**Nurse 1:** *“I want to know the name of COVID patients, their symptoms, doctors that treated them, including the date and method of their last COVID test so that medical staff can access this information and to better protect ourselves from exposure and plan.*

* 	**Nurse 2:** *“We want to limit COVID-19 exposure on our floor by identifying all COVID patients and storing information such as names, numbers, and room/floor number they are located at because we have limited rooms and beds for COVID patients.”*

* 	**Social Worker:** *“Our department requests a database that stores phone numbers of patients' work numbers and immediate family to advise them to get checked for COVID as well as quarantine."*

* 	**Doctor:** *“I am looking for the safety of my fellow doctors and nurses. COVID is extremely contagious, therefore I request detailed info of doctors and staff who treat COVID patients each day and grant our staff access to this information to limit the exposure of this virus.”*

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
  - Shift Start/End
* **Admissions:**
  - Floor #
  - Room  #

-----------------------------------------------------------------------------------
##	<div align="center"> 2- Conceptual Model </div>
####	<div align="center"> 	A detailed description of the possible Entities & Attributes </div> 
<p align="center">  <img src="https://github.com/HmSalah/COVID_case_tracker/blob/889f18aefd219a4eafa80da7c1251c7364d597d5/ER%20Diagram%20Models/conceptual_model.png" alt="animated" /></p>

##	<div align="center"> 3- Logical/Physical EER Model (Enhanced Entity Relationship Diagram) </div>
####	<div align="center">The construction of the database using MySQL Workbench Model Editor  </div>
<p align="center"> <img src="https://github.com/HmSalah/COVID_case_tracker/blob/57e29dae1aea4948381600842c3591f0aa836aa6/ER%20Diagram%20Models/logical_physical_model.png"  alt="animated" /></p>


-----------------------------------------------------------------------------------
##	<div align="center"> Hospital Database in action! </div>
####	<div align="center">  Pass Parameters to a Stored Procedure to return a result set, Like viewing patients in a single zipcode. </div> 
![database3](https://user-images.githubusercontent.com/74623220/113911129-39306800-979f-11eb-8c3e-e58a95a8f623.png)
-----------------------------------------------------------------------------------	
####	<div align="center"> Get access to information from multiple tables in one place using Views </div> 
![database1](https://user-images.githubusercontent.com/74623220/113911132-39306800-979f-11eb-8d70-cd588bc35cf1.png)




