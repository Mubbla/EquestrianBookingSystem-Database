USE EquestrianBookingSystem;

-- Creates a booking for student 2, horse 1, and lesson 3.
INSERT INTO Booking (student_id, horse_id, lesson_id)
VALUES (2, 1, 3);

-- Shows the booking for student 2 and lesson 3.
SELECT
	b.booking_id,
    p.name AS student_name,
    h.name AS horse_name,
    l.starts_at,
    b.status
FROM Booking b
JOIN Student s ON b.student_id = s.person_id
JOIN Person p ON s.person_id = p.person_id
JOIN Horse h ON b.horse_id = h.horse_id
JOIN Lesson l ON b.lesson_id = l.lesson_id
WHERE b.student_id = 2
  AND b.lesson_id = 3;

-- Cancels booking for booking_id retrieved in above SELECT statement.
UPDATE Booking b 
SET status = "CANCELLED"
WHERE b.booking_id = 7
AND b.status = 'BOOKED';
	
-- Finds bookable horses whose name contains the letter 'x'.
SELECT *
FROM Horse h
WHERE h.bookable = TRUE 
AND h.name LIKE '%x%';

-- Returns the first three horses in alphabetical order.
-- OFFSET 0 means that no rows are skipped.
SELECT *
FROM Horse h
ORDER BY h.name ASC
LIMIT 3 OFFSET 0;

-- Counts bookings for each lesson and status,
-- ordered by lesson start time (newest first) and status.
SELECT COUNT(*) AS booking_count, b.lesson_id, l.starts_at, b.status
FROM Booking b
JOIN Lesson l ON b.lesson_id = l.lesson_id
GROUP BY l.starts_at, b.lesson_id, b.status
ORDER BY l.starts_at DESC, b.status ASC;

-- Inserts test row to be deleted.
INSERT INTO Lesson (lesson_id, starts_at, ends_at, capacity) VALUES
(4, '2026-11-28 14:00', '2026-11-28 15:00', 4);
-- Deletes lesson 4 only if it has no booking history.
DELETE FROM Lesson
WHERE lesson_id = 4
  AND NOT EXISTS (
      SELECT 1
      FROM Booking b
      WHERE b.lesson_id = 4
  );

-- Creates a view with upcoming bookings
-- or replaces an already existing view, i.e. starts later than now.
CREATE OR REPLACE VIEW UpcomingBookings AS
SELECT b.booking_id, l.starts_at, b.student_id, b.horse_id
FROM Booking b
JOIN Lesson l ON b.lesson_id = l.lesson_id
WHERE b.status = 'BOOKED'
AND l.starts_at > NOW();









/****************************************************/

-- Lists each booking with the student's name, assigned horse,
-- lesson start time, and booking status.
SELECT
    p.name AS student_name,
    h.name AS horse_name,
    l.starts_at,
    b.status
FROM Booking b
JOIN Student s ON b.student_id = s.person_id
JOIN Person p ON s.person_id = p.person_id
JOIN Horse h ON b.horse_id = h.horse_id
JOIN Lesson l ON b.lesson_id = l.lesson_id
ORDER BY l.starts_at ASC, p.name ASC;

-- Lists each owner who agreed to share their contact details,
-- with their horse names grouped into one comma-separated list
-- using GROUP_CONCAT.
SELECT
    p.name AS owner_name,
    GROUP_CONCAT(h.name ORDER BY h.name SEPARATOR ', ') AS horses,
    p.email,
    p.phone
FROM HorseOwnership ho
JOIN Owner o ON ho.owner_id = o.person_id
JOIN Person p ON o.person_id = p.person_id
JOIN Horse h ON ho.horse_id = h.horse_id
WHERE o.contact_details_shareable = TRUE
GROUP BY p.person_id, p.name, p.email, p.phone
ORDER BY p.name ASC;












