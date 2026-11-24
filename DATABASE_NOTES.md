# Database Notes

## Application Idea

I want to connect my existing Java-based booking system for a riding school to a MySQL database. The program already handles horses and bookings, but the information is only stored while the program is running. With the database, the information will persist after the program is closed.

I also want to develop the booking feature so that bookings are linked to a specific lesson time. This will make it possible to see who is riding, which horse is being used, and when the lesson takes place.

## Users and Purpose

The system’s main users are the riding school’s staff, who manage horses, lessons, and bookings. Riders can be registered and assigned to lessons. The system should make it easier to plan lessons and check which horses are booked or available.

## Information Managed by the Database

The database needs to store information about horses, their type and booking requirements, riders, instructors, lesson dates and times, and bookings. A booking links a rider to a lesson and a horse. A horse can be booked for different lessons at different times.

## Examples of What Users Should Be Able to Do

- Add and update horses and riders.
- Create lessons with a time, instructor, and number of available places.
- Book a rider into a lesson and assign a horse.
- Check availability and view lesson bookings.
- Cancel a booking.

## Next Step

Draw an ER/EER diagram based on the information and relationships above. One possible many-to-many relationship is between riders and lessons, with a booking as the junction table. A lesson can then have several bookings.