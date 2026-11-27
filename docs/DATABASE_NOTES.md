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

## SQL Style

Queries use explicit `JOIN ... ON` syntax to combine tables.
Each relationship is stated next to the tables it connects,
while `WHERE` is used for filtering. This makes queries with
several tables easier to read and review.

## Business Rules

- A student cannot book two horses for the same lesson.
- A horse can appear in bookings for different lessons over time.
- A horse cannot have overlapping bookings.

## Booking Decisions

- A booking links one student, one horse, and one lesson.
- A cancelled booking remains in the database and gets the status `CANCELLED`.
- Booking status can be `BOOKED`, `CANCELLED`, or `COMPLETED`.
- A student cannot have two active bookings for the same lesson.
- A student, horse, or lesson cannot be deleted while bookings refer to it.

## Development Setup

The project uses its own MySQL container, Compose configuration,
and Docker volume. These are separate from the course lab
environment.

The project database uses localhost port 3320. The course lab
uses a separate Compose setup and port.

Local credentials are stored in `.env`. The `.env` file is
excluded from Git, and the Compose file reads the variables
from it.

## Future Improvements

In the current version, a booking is marked as `COMPLETED`
by the application or staff after the lesson has finished.
MySQL triggers respond to changes in table rows; they do not
run just because time passes. A future version could use the
MySQL Event Scheduler to periodically mark bookings as
`COMPLETED` when their lesson has ended. This would require
enabling the scheduler and handling time zones consistently.

## Next Step

Extend the database service to retrieve all horses, including 
privately owned horses, and display them in the application.