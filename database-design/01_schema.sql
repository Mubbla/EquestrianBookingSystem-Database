USE EquestrianBookingSystem;


-- Stores information shared by all people in the system.
CREATE TABLE Person (
    person_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE,
    phone VARCHAR(30) NULL,
    
    PRIMARY KEY (person_id)
) ENGINE=InnoDB;

-- Stores details specific to people who are horse owners.
-- contact_details_shareable indicates whether the owner's contact details may be shared
-- directly with a student interested in the privately owned horse.
CREATE TABLE Owner (
    person_id INT NOT NULL,
    contact_details_shareable BOOLEAN NOT NULL DEFAULT FALSE,
    
    PRIMARY KEY (person_id),
    
    FOREIGN KEY (person_id)
        REFERENCES Person(person_id)
        ON DELETE CASCADE
) ENGINE=InnoDB;

-- Stores details specific to students.
-- rider_length and rider_age are used to check whether a student
-- meets the booking requirements for a specific horse.
CREATE TABLE Student (
    person_id INT NOT NULL,
    rider_length DECIMAL(3,2),
    rider_age INT,
    
    PRIMARY KEY (person_id),
    
    FOREIGN KEY (person_id)
        REFERENCES Person(person_id)
        ON DELETE CASCADE
) ENGINE=InnoDB;

-- Stores horses. bookable indicates whether a horse can
-- be booked directly through the system.
CREATE TABLE Horse (
horse_id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(50) NOT NULL,
age INT NULL,
bookable BOOLEAN NOT NULL,

PRIMARY KEY (horse_id)
) ENGINE=InnoDB;

-- Stores booking requirements specific to full-size horses.
CREATE TABLE FullSizeHorse (
    horse_id INT NOT NULL,
    minimum_rider_age INT NOT NULL,
    
    PRIMARY KEY (horse_id),
    
    FOREIGN KEY (horse_id)
        REFERENCES Horse(horse_id)
        ON DELETE CASCADE
) ENGINE=InnoDB;

-- Stores booking requirements specific to ponies.
CREATE TABLE Pony (
    horse_id INT NOT NULL,
    minimum_rider_length DECIMAL(3,2) NOT NULL,
    
    PRIMARY KEY (horse_id),
    
    FOREIGN KEY (horse_id)
        REFERENCES Horse(horse_id)
        ON DELETE CASCADE
) ENGINE=InnoDB;

-- Stores lesson times and capacity.
CREATE TABLE Lesson (
    lesson_id INT NOT NULL AUTO_INCREMENT,
    starts_at DATETIME NOT NULL,
    ends_at DATETIME NOT NULL,
    capacity INT NOT NULL,
    
    PRIMARY KEY (lesson_id),
    
    CONSTRAINT chk_lesson_times
        CHECK (ends_at > starts_at),
        
    CONSTRAINT chk_lesson_capacity
        CHECK (capacity > 0)
) ENGINE=InnoDB;

-- Links horses to their owners.
-- Each row represents one ownership relationship.
CREATE TABLE HorseOwnership (
    horse_id INT NOT NULL,
    owner_id INT NOT NULL,
    
    PRIMARY KEY (horse_id, owner_id),
    
    FOREIGN KEY (horse_id)
        REFERENCES Horse(horse_id)
        ON DELETE CASCADE,
        
    FOREIGN KEY (owner_id)
        REFERENCES Owner(person_id)
        ON DELETE CASCADE
) ENGINE=InnoDB;


-- Stores bookings linking one student, one horse, and one lesson.
CREATE TABLE Booking (
    booking_id INT NOT NULL AUTO_INCREMENT,
    student_id INT NOT NULL,
    horse_id INT NOT NULL,
    lesson_id INT NOT NULL,
    booked_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) NOT NULL DEFAULT 'BOOKED',

    PRIMARY KEY (booking_id),

    CONSTRAINT fk_booking_student
        FOREIGN KEY (student_id)
        REFERENCES Student(person_id)
        ON DELETE RESTRICT,

    CONSTRAINT fk_booking_horse
        FOREIGN KEY (horse_id)
        REFERENCES Horse(horse_id)
        ON DELETE RESTRICT,

    CONSTRAINT fk_booking_lesson
        FOREIGN KEY (lesson_id)
        REFERENCES Lesson(lesson_id)
        ON DELETE RESTRICT,

    CONSTRAINT chk_booking_status
        CHECK (status IN ('BOOKED', 'CANCELLED', 'COMPLETED'))
) ENGINE=InnoDB;


SHOW TABLES;