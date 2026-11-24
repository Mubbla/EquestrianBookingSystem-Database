# Database Thoughts

## Application Idea

I want to connect my existing Java-based booking system for a
riding school to a MySQL database. The program already handles
horses and bookings, but the information is only stored while
the program is running. The database will make the information
persist after the program is closed.

Bookings will be linked to a specific lesson time, so the system
can show which student is riding which horse and when.

## Users and Purpose

The system is primarily used by riding-school staff to manage
people, horses, lessons, and bookings. Students can be registered
and booked into lessons with a horse.

## Information Managed by the Database

The database will store:

- People and their roles as Students and Owners. A person can
  have both roles.
- Horses, including their type and booking requirements.
- Lessons and their dates and times.
- Bookings that connect one Student, one Lesson, and one Horse.

A Horse is either a FullSizeHorse or a Pony. Horse type is
separate from ownership. Each Horse has one Owner, and an Owner
can own several Horses.

## Examples of What Users Should Be Able to Do

- Add and update students, owners, and horses.
- Create lessons with a date and time.
- Book a student into a lesson and assign a horse.
- Check horse availability and view lesson bookings.
- Cancel a booking.

## Design Decisions

- `Person` is the supertype for `Student` and `Owner`. The roles
   can overlap.
- `Horse` has the subtypes `FullSizeHorse` and `Pony`.
-  Horse type and ownership are modelled separately.
- `Booking` links a student, a lesson, and a horse.

## Business Rules

- A student cannot book two horses for the same lesson.
- A horse can appear in bookings for different lessons over time.
- A horse cannot have overlapping bookings.

## Next Step

Map the EER diagram to MySQL tables, including primary keys,
foreign keys, and the uniqueness rule for `student_id` and
`lesson_id`.