# <div align="center">  Hospital Covid Case Tracker </div>
###	This database aims to detect hospital patients and their exposure to COVID-19 minimizing disease transmission to patients, medical professionals, and others.
##	<div align="center"> Database Modeling Process </div> 	 ##
1.	**Requirements Gathering**
	*	A summary of all users’ requirements.
	*	Created A Statement of Requirements
	

2.	**Building a Conceptual Model**
  	*	Provided a high-level overview of the business domain and the things involved in this domain.
3.	**Building a Logical - Physical Model**
	*	Using MySQL, I created a Logical Model by definining the entities and relationships.
	*	Inserted primary keys and foreign keys.
     	*	Specified the date type for each attribute.
     	*	Gauranteed flexibility for future change, applied Normalization (1NF,2NF,3NF) forms to prevent data duplication.


-----------------------------------------------------------------------------------	
##  <div align="center"> User Requirements </div> 
######	Conducted a survey with actual nurses, pharmacists and lab technichians that work at hospitals to deterimine what they want from this database.  
### Questionnaire Survey
*	**Nurse:** *“I want to know the name of COVID patients, doctors that treated them, when they Last tested and method of testing. When was the patient exposed and where for tracking, signs, symptoms, and case severity?.”*

* 	**Lab Technician:** *“We want to limit COVID-19 exposure on our floor by identifying all COVID patients and have their names, numbers, room and floor they located at, we also do not want to have a lot of patients in our floors, we have limited beds and rooms.”*

* 	**Social Worker:** *“our department requests a database that stores phone numbers of patients work number and immediate family to advice them to get checked for COVID as well as quarantine."*

* 	**Doctor:** *“I really am looking for the safety of my staff and fellow doctors and nurses. COVID is extremely contagious and therefore I request a detailed info of doctors and staff who are and have treated COVID patients to limit the exposure of this virus.”*

* 	**Hospital CEO:** *“We are trying to improve our system and operate effectively during the COVID-19 pandemic and follow infection prevention and control recommendations tailored to their setting minimizing disease transmission to patients, HCP, and others. If you could develop a database that can help with minimizing the amount of exposure to others, as well as provide a dataset to for visualization to compare with other hospitals to provide insights and how we stand between other major care providers.”*

-----------------------------------------------------------------------------------	
##  <div align="center">  Statement of Requirements 

###### This is a summary of all users’ requirements to develop a single shared database.

* Patient: 
  - Information: Full Name, Phone Number, Home Address. 
* Symptom: 
  - Symptoms Start Date
  - Last Testing Date
  - Testing Method
  - Medicine Issued
* Medication:
  - Name
  - Serial Number
* Medical Professional:
  - Doctor: Full Name
  - Nurse: Full Name
* COVID Wing:
  - Floor #: Floors are numbered using a 2-digit standard starting with ‘01’ for the first floor and continue up for every floor above.
  - Room  #: Rooms are numbered using a standard three-digit numbering scheme.

-----------------------------------------------------------------------------------
## <div align="center">  Conceptual Model </div>
#### <div align="center"> 	A detailed description of the possible entities </div> ####
![alt text](https://github.com/HmSalah/COVID_case_tracker/blob/main/ER%20Diagram%20Models/conceptual_model.png?raw=true)
##  <div align="center"> Logical/Physical MySQL Model </div>
#### <div align="center">The construction of a database using MySQL </div>
![alt text](https://github.com/HmSalah/COVID_case_tracker/blob/main/ER%20Diagram%20Models/Logical-Physical%20Model.png?raw=true)

