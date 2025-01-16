-- PRWTO PROCEDURE

DELIMITER $

CREATE PROCEDURE CalculateVenueScore(IN venueId INT, OUT venueScore INT)
BEGIN
    DECLARE capacityScore INT;
    DECLARE concertsScore INT;
    DECLARE yearsScore INT;
    DECLARE yearsOfOperation INT;


    SELECT 
        Capacity, 
        ConcertsHeld, 
        TIMESTAMPDIFF(YEAR, DateOpened, CURDATE()) AS YearsOfOperation
    INTO 
        @venueCapacity, 
        @venueConcerts, 
        yearsOfOperation
    FROM 
        venues 
    WHERE 
        VenId = venueId;
--Το FLOOR στρογγυλοποιεί το αποτέλεσμα προς τα κάτω. Το χρησιμοποιούμε ώστε να μην έχουμε δεκαδικόυς αριθμόυς
    SET capacityScore = FLOOR(@venueCapacity / 1000) * 1;
    SET concertsScore = FLOOR(@venueConcerts / 100) * 3;
    SET yearsScore = yearsOfOperation * 2;
    SET venueScore = capacityScore + concertsScore + yearsScore;
END $

DELIMITER ;

CALL CalculateVenueScore(1, @score);
SELECT @score AS VenueScore;

--Venue inserts
INSERT INTO `venues` (`VenId`, `VenName`, `Location`, `Capacity`, `ConcertsHeld`, `DateOpened`) 
VALUES 
(1, 'Athens Concert Hall', 'Athens, Greece', 2000, 350, '2005-06-15'),
(2, 'Thessaloniki Arena', 'Thessaloniki, Greece', 10000, 1200, '2010-09-10'),
(3, 'Patras Cultural Center', 'Patras, Greece', 1500, 450, '2000-03-25'),
(4, 'Heraklion Music Hall', 'Heraklion, Greece', 3000, 250, '2015-11-01'),
(5, 'Ioannina Open Theater', 'Ioannina, Greece', 5000, 800, '2018-05-20'),
(6, 'Larissa Exhibition Center', 'Larissa, Greece', 4000, 600, '2012-04-12'),
(7, 'Chania Concert Space', 'Chania, Greece', 2500, 150, '2020-01-01'),
(8, 'Kalamata Outdoor Stage', 'Kalamata, Greece', 1000, 50, '2017-07-15'),
(9, 'Rhodes Grand Theater', 'Rhodes, Greece', 3500, 700, '2008-10-05'),
(10, 'Corfu Philharmonic Hall', 'Corfu, Greece', 1200, 100, '1995-05-30');

--Consert inserts
INSERT INTO `concert` (`ConId`, `VenId`, `ArtistId`, `ConDate`, `Status`, `ReqCapacity`) 
VALUES 
(1, 1, 1, '2024-03-15', 'Scheduled', 1500),
(2, 2, 2, '2024-05-20', 'Completed', 9000),
(3, 3, 3, '2023-10-10', 'Completed', 1200),
(4, 4, 4, '2024-01-05', 'Cancelled', 2800),
(5, 5, 5, '2024-07-12', 'Scheduled', 4500),
(6, 6, 6, '2023-09-15', 'Completed', 1800),
(7, 7, 7, '2024-06-25', 'Scheduled', 3700),
(8, 8, 8, '2023-08-30', 'Completed', 800),
(9, 9, 9, '2024-11-10', 'Cancelled', 2300),
(10, 10, 10, '2024-03-10', 'Scheduled', 950)


-- DEYTERO PROCEDURE

DELIMITER $

CREATE PROCEDURE ManageConcert(
    IN artistId INT,
    IN concertDate DATE,
    IN action CHAR(1)
)
BEGIN
    DECLARE existingStatus ENUM('Scheduled', 'Cancelled', 'Completed');
    DECLARE message VARCHAR(255);
    
    -- Elegxei an yparxei synaulia gia ton kallitexnh kai thn hmeromhnia
    SELECT Status
    INTO existingStatus
    FROM concert
    WHERE ArtistId = artistId AND ConDate = concertDate;

    -- Cases gia to action
    CASE action
        WHEN 'i' THEN
            -- An yparxei
            IF existingStatus IS NOT NULL THEN
                IF existingStatus = 'Scheduled' THEN
                   SET message = 'A concert is already scheduled on this date.';
                ELSEIF existingStatus = 'Cancelled' THEN
                   SET message = 'A cocnert is cancelled on this date.';
                ELSE
                    SET message = 'The concert has already been completed.';
                END IF;
            ELSE
                -- Kainourgia synaulia me status scheduled
                INSERT INTO concert (VenId, ArtistId, ConDate, Status, ReqCapacity)
                VALUES (1, artistId, concertDate, 'Scheduled', 1000); -- Gia eukolia ebala oti oles oi kainourges synaulies programmatizontai sto venue 1 kai me reqcapacity 1000
                SET message = 'A new concert was scheduled successfully.';
            END IF;
        WHEN 'c' THEN
            -- Akyrwsh
            IF existingStatus IS NULL THEN
                SET message = 'No concert exists on this date.';
            ELSEIF existingStatus = 'Cancelled' THEN
               SET message = 'The concert is already cancelled.';
            ELSE
                UPDATE concert
                SET Status = 'Cancelled'
                WHERE ArtistId = artistId AND ConDate = concertDate;
                SET message = 'The concert was cancelled successfully.';
            END IF;
        WHEN 'a' THEN
            -- Ksana energopoiei mia akyrwmenh synaulia
            IF existingStatus IS NULL THEN
                SET message = 'No concert exists on this date.';
            ELSEIF existingStatus = 'Scheduled' THEN
                SET message = 'A concert is already scheduled on this date.';
            ELSEIF existingStatus = 'Cancelled' THEN
                UPDATE concert
                SET Status = 'Scheduled'
                WHERE ArtistId = artistId AND ConDate = concertDate;
                SET message = 'The concert was rescheduled successfully.';
            END IF;
        ELSE
        -- Gia opoiondhpote allo xarakthra
            SET message = 'I dont know what to do with that bro.';
    END CASE;
      -- Epistrefei to mhnuma sto telos
    SELECT message AS ResultMessage;
END$

DELIMITER ;