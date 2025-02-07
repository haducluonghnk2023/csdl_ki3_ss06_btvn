-- cau 1
DELETE FROM Appointments
WHERE AppointmentDate < CURDATE()
  AND DoctorID = (SELECT DoctorID FROM Doctors WHERE FullName = 'Phan Huong');

SELECT a.AppointmentID, p.FullName AS PatientName, d.FullName AS DoctorName, a.AppointmentDate, a.Status
FROM Appointments a
JOIN Patients p ON a.PatientID = p.PatientID
JOIN Doctors d ON a.DoctorID = d.DoctorID
ORDER BY a.AppointmentDate;
-- cau 2
UPDATE Appointments
SET Status = 'Dang cho'
WHERE AppointmentDate >= CURDATE()
  AND PatientID = (SELECT PatientID FROM Patients WHERE FullName = 'Nguyen Van An')
  AND DoctorID = (SELECT DoctorID FROM Doctors WHERE FullName = 'Phan Huong');

SELECT a.AppointmentID, p.FullName AS PatientName, d.FullName AS DoctorName, a.AppointmentDate, a.Status
FROM Appointments a
JOIN Patients p ON a.PatientID = p.PatientID
JOIN Doctors d ON a.DoctorID = d.DoctorID
ORDER BY a.AppointmentDate;
-- cau 3
SELECT p.FullName AS PatientName, d.FullName AS DoctorName, a.AppointmentDate, mr.Diagnosis
FROM Patients p
JOIN Appointments a ON p.PatientID = a.PatientID
JOIN Doctors d ON a.DoctorID = d.DoctorID
JOIN MedicalRecords mr ON a.PatientID = mr.PatientID AND a.DoctorID = mr.DoctorID
WHERE p.PatientID IN (
    SELECT PatientID
    FROM Appointments
    GROUP BY PatientID, DoctorID
    HAVING COUNT(*) >= 2
)
ORDER BY p.FullName, d.FullName, a.AppointmentDate;
-- cau 4
SELECT UPPER(CONCAT('BỆNH NHÂN: ', p.FullName, ' - BÁC SĨ: ', d.FullName)) AS PatientDoctor,
       a.AppointmentDate, mr.Diagnosis, a.Status
FROM Appointments a
JOIN Patients p ON a.PatientID = p.PatientID
JOIN Doctors d ON a.DoctorID = d.DoctorID
LEFT JOIN MedicalRecords mr ON a.PatientID = mr.PatientID AND a.DoctorID = mr.DoctorID
ORDER BY a.AppointmentDate;
-- cau 5
SELECT
	p.FullName AS PatientName, 
    UPPER(CONCAT('BỆNH NHÂN: ', p.FullName, ' - BÁC SĨ: ', d.FullName)) AS PatientDoctor,
    a.AppointmentDate,
    YEAR(a.AppointmentDate) AS AppointmentYear, 
    a.Status AS AppointmentStatus
FROM Appointments a
JOIN Patients p ON a.PatientID = p.PatientID
JOIN Doctors d ON a.DoctorID = d.DoctorID
ORDER BY a.AppointmentDate;