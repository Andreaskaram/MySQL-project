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
