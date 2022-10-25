Create table Member(
	m_id varchar(20) primary key,
    m_pwd varchar(20) not null,
    m_alias varchar(20) not null,
    m_name varchar(20) not null,
    m_email varchar(50) not null,
    m_phone char(11) not null,
    m_addr varchar(255) not null,
    m_sname varchar(20),
    m_bname varchar(50),
    m_bnumber char(10)
);

DELIMITER //
CREATE DEFINER=`scott`@`%` PROCEDURE `sp_member_insert`(
   IN   m_id    VARCHAR(20),
   IN   m_pwd    VARCHAR(20),
   IN   m_alias       VARCHAR(20),
   IN    m_name       VARCHAR(20),
   IN   m_email      VARCHAR(20),
   IN   m_phone      CHAR(11),
   IN   m_addr       VARCHAR(255),
   IN   m_sname      VARCHAR(20),
   IN   m_bname      VARCHAR(50),
   IN   m_bnumber      CHAR(10)
)
BEGIN
   INSERT INTO member VALUES(m_id, m_pwd, m_alias, m_name, m_email, m_phone, m_addr, m_sname, m_bname, m_bnumber);
   COMMIT;
END //
DELIMITER ;

-- idcheck Stored Procedure
DELIMITER //
CREATE PROCEDURE sp_member_idcheck
(
   IN v_m_id   VARCHAR(20),
   OUT t_m_id   VARCHAR(20)
)
BEGIN
   SELECT m_id INTO t_m_id
   FROM member
   WHERE  m_id = v_m_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_member_select (
   IN v_m_id varchar(20),
   OUT v_m_name varchar(20),
   OUT V_m_email varchar(100)
)
BEGIN
   SELECT m_name, m_email INTO v_m_id, v_m_email
   FROM member
   WHERE m_id = v_m_id;
END //
DELIMITER ;

-- Login Stored Procedure
DELIMITER //
CREATE PROCEDURE sp_member_login
(
   IN v_m_id VARCHAR(20),
   OUT v_m_pwd VARCHAR(12)
)
BEGIN
   SELECT m_pwd  INTO v_m_pwd
   FROM member
   WHERE m_id = v_m_id;
END //
DELIMITER ;






