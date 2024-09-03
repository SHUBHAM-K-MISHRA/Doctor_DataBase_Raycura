CREATE TABLE Doctor (
    DoctorID INT PRIMARY KEY,
    Name VARCHAR(50)
);

CREATE TABLE Patient (
    PatientID INT PRIMARY KEY,
    Name VARCHAR(50),
    DoctorID INT,
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID)
);


CREATE TABLE Activity (
    ActivityID INT PRIMARY KEY,
    PatientID INT,
    HandFlexion INT,
    KneeFlexion INT,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);

INSERT INTO Doctor (DoctorID, Name)
VALUES
(1, 'Dr1'),
(2, 'Dr2'),
(3, 'Dr3');


INSERT INTO Patient (PatientID, Name, DoctorID)
VALUES
(1, 'P1', 1),
(2, 'P2', 1),
(3, 'P3', 2);


INSERT INTO Activity (ActivityID, PatientID, HandFlexion, KneeFlexion)
VALUES
(1, 1, 30, 45),
(2, 2, 50, 60),
(3, 3, 70, 90);

SELECT p.Name,a.HandFlexion
FROM Activity a
JOIN Patient p ON a.PatientID = p.PatientID
WHERE p.DoctorID = 2 AND p.PatientID=5;

SELECT * FROM Activity WHERE PatientID = 2;




select * from Doctor;
select * from Patient;
select * from Activity;

UPDATE Patient
SET DoctorID = 1
WHERE PatientID = 2;

UPDATE Patient
SET DoctorID = 1
WHERE PatientID = 3;


INSERT INTO Patient (PatientID, Name, DoctorID)
VALUES
(4, 'P1', 2),
(5, 'P2', 2),
(6, 'P3', 2);

INSERT INTO Patient (PatientID, Name, DoctorID)
VALUES
(7, 'P1', 3),
(8, 'P2', 3),
(9, 'P3', 3);

INSERT INTO Activity (ActivityID, PatientID, HandFlexion, KneeFlexion)
VALUES
(4, 4, 80, 55),
(5, 5, 90, 65),
(6, 6, 100, 97),
(7, 7, 46, 76),
(8, 8, 10, 07),
(9, 9, 41, 26);


-- Update HandFlexion values for multiple ActivityIDs
UPDATE Activity
SET HandFlexion = CASE
    WHEN ActivityID = 1 THEN 1
    WHEN ActivityID = 2 THEN 2
    WHEN ActivityID = 3 THEN 3
	WHEN ActivityID = 4 THEN 4
    WHEN ActivityID = 5 THEN 5
    WHEN ActivityID = 6 THEN 6
	WHEN ActivityID = 7 THEN 7
    WHEN ActivityID = 8 THEN 8
    WHEN ActivityID = 9 THEN 9
    ELSE HandFlexion
END;

SELECT d.Name AS DoctorName, a.HandFlexion,p.Name
FROM Activity a
JOIN Patient p ON a.PatientID = p.PatientID
JOIN Doctor d ON p.DoctorID = d.DoctorID
WHERE p.DoctorID = 2 AND p.PatientID = 5;

