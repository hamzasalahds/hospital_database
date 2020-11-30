# Hospital Covid Case Tracker
This database aims to detect hospital patients and their exposure to COVID-19 minimizing disease transmission to patients, medical professionals, and others.
###	Process	 ###
*	**Requirements Gathering**
	*	A summary of all users’ requirements 
	*	interviewing Stakeholders/doctors/nurses/users.
	*	check existing forms, spreadsheets, databases, documents databases.

*	**Building Conceptual Model**
	*	Obtain a detailed description properties such as the possible entities.
  	*	Provides us with a high-level overview of the business domain and the things involved in this domain.
*	**Building Logical Model**
	*	Logical Model/Schema is an abstract data model that shows our entities and relationships, determine the specific type of database system (network, relational, object-oriented) that is required.
	*	Insert primary key, foreign keys in this stage.
     	*	which attribute type (char, int, varchar (50) etc..) to choose
     	*	Database properties: flexibility for change, control of duplication and how best to represent the constraints.
	*	Second-cut designs: the collection of iterations that each involves a revision of the tables that lead to a new design and review it with appropriate personnel if it solves problems or not.
*	**Building Physical Model**
  	*	Implementation of (Physical Model) involves the construction of a database  using an RDBMS such as MySQL or PostgreSQL depending on the needs of the business each program has its ups and downs according to the specification of a logical schema.
----------------------------------------------------------------------------------

##  User Requirements ##
* Nurse 1: *“I want to know the name of COVID patients, doctors that treated them, when they Last tested and method of testing. When was the patient exposed and where for tracking, signs, symptoms, and case severity?”*

* Nurse 2: *“We want to limit COVID-19 exposure on our floor by identifying all COVID patients and have their names, numbers, room and floor they located at, we also do not want to have a lot of patients in our floors, we have limited beds and rooms.”*

* Social Worker 1: *“our department requests a database that stores detailed information about how the patient contracted the virus including people he contacted like family, work info and number and friends, places and if participated in a large even such as a concert, rally other.”* 

* Doctor 1: *“I really am looking for the safety of my staff and fellow doctors and nurses. COVID is extremely contagious and therefore I request a detailed info of doctors and staff who are and have treated COVID patients to limit the exposure of this virus.”*

* Hospital CEO: *“We are trying to improve our system and operate effectively during the COVID-19 pandemic and follow infection prevention and control recommendations tailored to their setting minimizing disease transmission to patients, HCP, and others. If you could develop a database that can help with minimizing the amount of exposure to others, as well as provide a dataset to for visualization to compare with other hospitals to provide insights and how we stand between other major care providers.”*


##  Statement of Requirements ##

#### This is a summary of all users’ requirements to develop a single shared database.
######  The database should store the following information: ####
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


##  Conceptual Model ##
#### <div align="center"> 	A detailed description of the possible entities </div> ####
![alt text](https://github.com/HmSalah/COVID_case_tracker/blob/main/ER%20Diagram%20Models/conceptual_model.png?raw=true)
##  Logical/Physical MySQL Model ##
#### <div align="center">The construction of a database using MySQL </div> ####
![alt text](https://github.com/HmSalah/COVID_case_tracker/blob/main/ER%20Diagram%20Models/Logical-Physical%20Model.png?raw=true)

