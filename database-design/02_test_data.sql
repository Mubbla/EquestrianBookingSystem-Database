USE EquestrianBookingSystem;

-- People 3 is both a student and an owner.
INSERT INTO Person (person_id, name, email, phone) VALUES
(1, 'Alva Lind',   'alva@example.test',   '070-1111111'),
(2, 'Erik Berg',   'erik@example.test',   '070-2222222'),
(3, 'Sara Holm',   'sara@example.test',   '070-3333333'),
(4, 'Noah Ek',     'noah@example.test',   '070-4444444'),
(5, 'Ingrid Dahl', 'ingrid@example.test', '070-5555555');

INSERT INTO Owner (person_id, contact_details_shareable) VALUES
(3, FALSE),
(5, TRUE);

INSERT INTO Student (person_id, rider_length, rider_age) VALUES
(1, 1.68, 18),
(2, 1.52, 14),
(3, 1.60, 16),
(4, 1.40, 10);

-- Horses 1 and 2 are school horses.
-- Horses 3 and 4 are privately owned and not directly bookable.
INSERT INTO Horse (horse_id, name, age, bookable) VALUES
(1, 'Luna',   12, TRUE),
(2, 'Blixt',   9, TRUE),
(3, 'Freja',  14, FALSE),
(4, 'Max',    11, FALSE);

INSERT INTO FullSizeHorse (horse_id, minimum_rider_age) VALUES
(1, 12),
(3, 16);

INSERT INTO Pony (horse_id, minimum_rider_length) VALUES
(2, 1.30),
(4, 1.40);

INSERT INTO Lesson (lesson_id, starts_at, ends_at, capacity) VALUES
(1, '2026-11-20 18:00', '2026-11-20 19:00', 6),
(2, '2026-11-27 17:00', '2026-11-27 18:00', 6),
(3, '2026-11-28 10:00', '2026-11-28 11:00', 4);

-- Freja has two owners. Max has one.
-- The school horses have no personal owner rows.
INSERT INTO HorseOwnership (horse_id, owner_id) VALUES
(3, 3),
(3, 5),
(4, 5);

INSERT INTO Booking
    (student_id, horse_id, lesson_id, booked_at, status)
VALUES
(1, 1, 1, '2026-11-19 12:00', 'COMPLETED'),
(2, 2, 1, '2026-11-19 12:15', 'COMPLETED'),
(3, 1, 2, '2026-11-25 10:00', 'BOOKED'),
(4, 2, 2, '2026-11-25 10:15', 'BOOKED'),
(1, 1, 3, '2026-11-25 11:00', 'CANCELLED');


