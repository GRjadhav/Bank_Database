create database BMS_DB1;

use BMS_DB1;

show databases;

-- CUSTOMER_PERSONAL_INFO

create table customer_personal_info
(
customer_id varchar(5),
customer_name varchar(30),
date_of_birth date,
guardian_name varchar(30),
address varchar(50),
contact_no bigint(10),
mail_id varchar(30),
gender char(1),
marital_status varchar(10),
identification_doc_type varchar(20),
id_doc_no varchar(20),
citizenship varchar(10),
constraint cust_pers_info_pk primary key(customer_id)
);

show tables;

-- CUSTOMER_REFERENCE_INFO

create table customer_reference_info
(
customer_id varchar(5),
reference_acc_name varchar(20),
reference_acc_no bigint(16),
reference_acc_address varchar(50),
relation varchar(25),
constraint cust_ref_info_pk primary key(customer_id),
constraint cust_ref_info_fk foreign key(customer_id) references customer_personal_info(customer_id)
);


-- BANK_INFO

create table bank_info
(
IFSC_code varchar(15),
bank_name varchar(25),
branch_name varchar(25),
constraint bank_info_pk primary key(IFSC_code)
);

-- ACCOUNT_INFO

create table account_info
(
account_number bigint(16),
customer_id varchar(5),
account_type varchar(10),
registration_date date,
activation_date date,
IFSC_code varchar(10),
intrest decimal(7,2),
initial_deposit bigint(10),
constraint acc_info_pk primary key(account_number),
constraint acc_info_pers_fk foreign key(customer_id) references customer_reference_info(customer_id),
constraint acc_info_bank_fk foreign key(IFSC_code) references bank_info(IFSC_code)
);

insert into bank_info(IFSC_code,bank_name,branch_name)values('HDVL0012','HDFC','VALASARAVAKKAM');
insert into bank_info(IFSC_code,bank_name,branch_name)values('SBITN0123','SBI','TNAGAR');
insert into bank_info(IFSC_code,bank_name,branch_name)values('ICITN0232','ICICI','TNAGAR');
insert into bank_info(IFSC_code,bank_name,branch_name)values('ICIPG0242','ICICI','PERUNGUDI');
insert into bank_info(IFSC_code,bank_name,branch_name)values('SBISD0113','SBI','SAIDAPET');

select * from BANK_INFO;

insert into customer_personal_info(customer_id,customer_name,date_of_birth,guardian_name,address,contact_no,mail_id,gender,marital_status,identification_doc_type,id_doc_no,citizenship)values(00010,'vishnu','1-2-03','prasad','14-B,neelkamal apt,hyderabad','1234567890','vishnu123@gmail.com','M','married','aadhar card','A90001112','INDIAN');
insert into customer_personal_info(customer_id,customer_name,date_of_birth,guardian_name,address,contact_no,mail_id,gender,marital_status,identification_doc_type,id_doc_no,citizenship)values(00020,'dheeraj','30-5-08','dinesh','r.no-2,kudigupal street,karnataka','1234567891','12dheeraj@gmail.com','M','single','pan card','P900010','INDIAN');
insert into customer_personal_info(customer_id,customer_name,date_of_birth,guardian_name,address,contact_no,mail_id,gender,marital_status,identification_doc_type,id_doc_no,citizenship)values(00030,'shruti','17-7-05','deepak','15/16-pedrry road,banglore','1234567889','theshruti@gmail.com','F','single','aadhar card','A90001113','INDIAN');
insert into customer_personal_info(customer_id,customer_name,date_of_birth,guardian_name,address,contact_no,mail_id,gender,marital_status,identification_doc_type,id_doc_no,citizenship)values(00040,'vidya','9-9-01','dev','9-A,mhada colony,bimbisar nagar,mumbai','1234567888','kvidya44@gmail.com','F','married','voter id','IKFJK32341','INDIAN');
insert into customer_personal_info(customer_id,customer_name,date_of_birth,guardian_name,address,contact_no,mail_id,gender,marital_status,identification_doc_type,id_doc_no,citizenship)values(00050,'shravani','24-12-03','ramlingam','7-A,gayatri cootage,chennai','1234567789','shrau31@gmail.com','F','married','pan card','P900079','INDIAN');

SELECT * FROM CUSTOMER_PERSONAL_INFO;

delete from CUSTOMER_PERSONAL_INFO where customer_id=5;
set sql_safe_updates=0;

update CUSTOMER_PERSONAL_INFO
set date_of_birth="2011-12-11"
where customer_id=50;