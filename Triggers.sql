--
-- ERWTHMA PRWTO
--


DELIMITER $$

CREATE TRIGGER insVen
AFTER INSERT
ON venues
FOR EACH ROW
BEGIN
    
    INSERT INTO log VALUES(USER(), NOW(), 'Insert', 'venues');
    
END $$

DELIMITER ;


DELIMITER $$

CREATE TRIGGER updVen
AFTER UPDATE
ON venues
FOR EACH ROW
BEGIN
    
    INSERT INTO log VALUES(USER(), NOW(), 'Update', 'venues');
    
END $$

DELIMITER ;



DELIMITER $$

CREATE TRIGGER delVen
AFTER DELETE
ON venues
FOR EACH ROW
BEGIN
    
    INSERT INTO log VALUES(USER(), NOW(), 'Delete', 'venues');
    
END $$

DELIMITER ;



DELIMITER $$

CREATE TRIGGER insPers
AFTER INSERT
ON person
FOR EACH ROW
BEGIN
    
    INSERT INTO log VALUES(USER(), NOW(), 'Insert', 'person');
    
END $$

DELIMITER ;



DELIMITER $$

CREATE TRIGGER updPers
AFTER UPDATE
ON person
FOR EACH ROW
BEGIN
    
    INSERT INTO log VALUES(USER(), NOW(), 'Update', 'person');
    
END $$

DELIMITER ;



DELIMITER $$

CREATE TRIGGER delPers
AFTER DELETE
ON person
FOR EACH ROW
BEGIN
    
    INSERT INTO log VALUES(USER(), NOW(), 'Delete', 'person');
    
END $$

DELIMITER ;



DELIMITER $$

CREATE TRIGGER insBand
AFTER INSERT
ON band
FOR EACH ROW
BEGIN
    
    INSERT INTO log VALUES(USER(), NOW(), 'Insert', 'band');
    
END $$

DELIMITER ;


DELIMITER $$

CREATE TRIGGER updBand
AFTER UPDATE
ON band
FOR EACH ROW
BEGIN
    
    INSERT INTO log VALUES(USER(), NOW(), 'Update', 'band');
    
END $$

DELIMITER ;


DELIMITER $$

CREATE TRIGGER delBand
AFTER DELETE
ON band
FOR EACH ROW
BEGIN
    
    INSERT INTO log VALUES(USER(), NOW(), 'Delete', 'band');
    
END $$

DELIMITER ;


DELIMITER $$

CREATE TRIGGER insAlbum
AFTER INSERT
ON album
FOR EACH ROW
BEGIN
    
    INSERT INTO log VALUES(USER(), NOW(), 'Insert', 'album');
    
END $$

DELIMITER ;


DELIMITER $$

CREATE TRIGGER updAlbum
AFTER UPDATE
ON album
FOR EACH ROW
BEGIN
    
    INSERT INTO log VALUES(USER(), NOW(), 'Update', 'album');
    
END $$

DELIMITER ;



DELIMITER $$

CREATE TRIGGER delAlbum
AFTER DELETE
ON album
FOR EACH ROW
BEGIN
    
    INSERT INTO log VALUES(USER(), NOW(), 'Delete', 'album');
    
END $$

DELIMITER ;



DELIMITER $$

CREATE TRIGGER insConc
AFTER INSERT
ON concert
FOR EACH ROW
BEGIN
    
    INSERT INTO log VALUES(USER(), NOW(), 'Insert', 'concert');
    
END $$

DELIMITER ;


DELIMITER $$

CREATE TRIGGER updConc
AFTER UPDATE
ON concert
FOR EACH ROW
BEGIN
    
    INSERT INTO log VALUES(USER(), NOW(), 'Update', 'concert');
    
END $$

DELIMITER ;



DELIMITER $$

CREATE TRIGGER delConc
AFTER DELETE
ON concert
FOR EACH ROW
BEGIN
    
    INSERT INTO log VALUES(USER(), NOW(), 'Delete', 'concert');
    
END $$

DELIMITER ;


--
-- ERWTHMA DEYTERO
--

DELIMITER $$

CREATE TRIGGER conScheduleCheck
BEFORE INSERT
ON concert
FOR EACH ROW
BEGIN

	DECLARE scheduled_count INT;

	IF ABS(DATEDIFF(CURDATE(), NEW.ConDate)) < 5 THEN
		SIGNAL SQLSTATE VALUE '45000'
        SET MESSAGE_TEXT = 'Concert must be scheduled at least 5 days before Concert Date!';
    END IF;
    
    SELECT COUNT(*)
    INTO scheduled_count
    FROM concert
    WHERE ArtistId = NEW.ArtistId
    AND Status = 'Scheduled';
    
    IF scheduled_count >= 3 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Artist already has 3 concerts scheduled!';
    END IF;
    
END $$

DELIMITER ;


--
-- TRITO ERWTHMA
--

DELIMITER $$

CREATE TRIGGER conCancelCheck
BEFORE UPDATE
ON concert
FOR EACH ROW
BEGIN

	IF (NEW.Status = 'Scheduled' AND OLD.Status = 'Cancelled') OR (NEW.Status = 'Cancelled' AND OLD.Status = 'Scheduled') THEN
		IF DATEDIFF(NEW.ConDate, CURDATE()) <= 3 THEN
			SIGNAL SQLSTATE VALUE '45000'
			SET MESSAGE_TEXT = 'You cannot cancel or reschedule a concert 3 days before concert date!';
		END IF;
    END IF;
    
    
END $$

DELIMITER ;

