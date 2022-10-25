
CREATE table Funding(
   f_number int primary key auto_increment,
    f_title varchar(255) not null,
    f_comments varchar(50) not null,
    f_contents varchar(5000),
    f_image varchar(100),
    f_target bigint not null,
    f_price int not null,
    f_total bigint   
);

DELIMITER //
CREATE PROCEDURE sp_funding_insert
(
   IN v_f_title      VARCHAR(255),
   IN v_f_comments   VARCHAR(40),
   IN v_f_contents   VARCHAR(5000),
   IN v_f_image      VARCHAR(100),
   IN v_f_target     INT,
   IN v_f_price      INT
)
BEGIN
   INSERT INTO funding(f_title, f_comments, f_contents, f_image, f_target, f_price) 
   VALUES(v_f_title, v_f_comments, v_f_contents, v_f_image, v_f_target, v_f_price);
   COMMIT;
END //
DELIMITER ;