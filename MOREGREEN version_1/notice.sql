
CREATE table Notice(
      n_number int primary key auto_increment,
    n_title varchar(255) not null,
    n_contents varchar(5000),
    n_date varchar(10) not null,
      -- n_date date not null, (기존)
    n_image varchar(100),
    n_count int
);

DELIMITER //
CREATE PROCEDURE sp_notice_insert
(
   IN v_n_title      VARCHAR(255),
   IN v_n_contents      VARCHAR(5000),
    IN v_n_image      VARCHAR(100),
   IN v_n_date         VARCHAR(10)
)
BEGIN
   INSERT INTO notice(n_title, n_contents, n_image, n_date, n_count) 
   VALUES(v_n_title, v_n_contents, v_n_image, v_n_date, 0);
   COMMIT;
END //
DELIMITER ;
