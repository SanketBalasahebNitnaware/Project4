create database usersdata;
use usersdata;

CREATE TABLE users(
user_id INT (11) PRIMARY KEY NOT NULL,
product_id INT(11) NOT NULL,
transaction_date DATE NOT NULL
);
ALTER TABLE users DROP PRIMARY KEY;


INSERT INTO users(user_id,product_id,transaction_date) VALUES (1,101,'2020-02-12');
INSERT INTO users(user_id,product_id,transaction_date) VALUES (2,105,'2020-02-13');
INSERT INTO users(user_id,product_id,transaction_date) VALUES (1,111,'2020-02-14');
INSERT INTO users(user_id,product_id,transaction_date) VALUES (3,121,'2020-02-15');
INSERT INTO users(user_id,product_id,transaction_date) VALUES (1,101,'2020-02-16');
INSERT INTO users(user_id,product_id,transaction_date) VALUES (2,105,'2020-02-17');
INSERT INTO users(user_id,product_id,transaction_date) VALUES (4,101,'2020-02-16');
INSERT INTO users(user_id,product_id,transaction_date) VALUES (3,105,'2020-02-15');

select * from users;
delete from users 
	where 
		transaction_date = '0002-12-20';
        
        
        

-- select user_id, transaction_date as superuser_date from users group by user_id order by transaction_date desc ;

 with distint_users (user_id) as
		(select distinct c.user_id
		from users c),
		tas  as
			(SELECT a.user_id,a.transaction_date as superuser_date,
			ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY transaction_date) AS ts 
			FROM users a)
select distint_users.user_id,tas.superuser_date
-- distint_users.users_id , tas.transaction_date as superuser_date
from  distint_users 
left join tas
on distint_users.user_id = tas.user_id and ts = 2
        ;
        
        



CREATE TABLE users_1(
user_id INT (11) NOT NULL,
action varchar(30) NOT NULL,
action_date DATE NOT NULL
);


INSERT INTO users_1(user_id,action,action_date) VALUES (1,'start','2020-02-12');
INSERT INTO users_1(user_id,action,action_date) VALUES (1,'cancel','2020-02-13');
INSERT INTO users_1(user_id,action,action_date) VALUES (2,'start','2020-02-11');
INSERT INTO users_1(user_id,action,action_date) VALUES (2,'publish','2020-02-14');
INSERT INTO users_1(user_id,action,action_date) VALUES (3,'start','2020-02-15');
INSERT INTO users_1(user_id,action,action_date) VALUES (3,'cancel','2020-02-15');
INSERT INTO users_1(user_id,action,action_date) VALUES (4,'start','2020-02-18');
INSERT INTO users_1(user_id,action,action_date) VALUES (1,'publish','2020-02-19');


with users_dis  (user_id)  as (select distinct user_id from users_1),
	date_rank as  (select *,
					ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY action_date DESC) AS dr
                    from users_1),
	latest as (select *
				from date_rank 
				where dr =1),
	nxt_last as (select *
					from date_rank
					where dr =2)
select z.user_id,u.action_date-v.action_date as days_elapsed from 
users_dis as z
left join
latest as u
on  z.user_id=u.user_id
left join nxt_last as v
on u.user_id=v.user_id
;

create table items(
		date date not null,
        item varchar(11) not null);
        
insert into items(date,item) values ('2020-01-01','apple');
insert into items(date,item) values ('2020-01-01','apple');
insert into items(date,item) values ('2020-01-01','pear');
insert into items(date,item) values ('2020-01-01','pear');
insert into items(date,item) values ('2020-01-02','pear');
insert into items(date,item) values ('2020-01-02','pear');
insert into items(date,item) values ('2020-01-02','pear');
insert into items(date,item) values ('2020-01-02','orange');

select * from items;

with counts as (select * , count(*) as item_count from items group by 1,2 order by 1 ),

		date_rk AS (SELECT *, 
				RANK() OVER (PARTITION BY date ORDER BY item_count DESC) AS date_rank
				FROM counts)
		
select date,item
from date_rk
where date_rank = 1;


create table transactions(
		sender int(2) not null,
        receiver int(2) not null,
        amount int(11) not null,
        transaction_date date not null);
        
insert into transactions(sender,receiver,amount,transaction_date) values(5,2,10,'2020-02-12');
insert into transactions(sender,receiver,amount,transaction_date) values(1,3,15,'2020-02-13');
insert into transactions(sender,receiver,amount,transaction_date) values(2,1,20,'2020-02-13');
insert into transactions(sender,receiver,amount,transaction_date) values(1,3,25,'2020-02-14');
insert into transactions(sender,receiver,amount,transaction_date) values(3,1,20,'2020-02-15');
insert into transactions(sender,receiver,amount,transaction_date) values(3,2,15,'2020-02-15');
insert into transactions(sender,receiver,amount,transaction_date) values(1,4,5,'2020-02-16');

select * from transactions;

with debits as (select sender,sum(amount) as debited from transactions group by 1),
	credits as (select receiver,sum(amount) as credited from transactions group by 1)
    
SELECT 
   COALESCE(sender, receiver) AS user, 
   COALESCE(credited, 0) - COALESCE(debited, 0) AS net_change 
FROM debits d
left JOIN credits c
ON d.sender = c.receiver
union
SELECT 
   COALESCE(sender, receiver) AS user, 
   COALESCE(credited, 0) - COALESCE(debited, 0) AS net_change 
FROM debits d
right JOIN credits c
ON d.sender = c.receiver
ORDER BY 2 DESC;
        
        
--

create table users_2 (
	user_id int(3),
    action varchar(20),
    date date not null);
    
insert into users_2(user_id,action,date) values (1,'start','2020-01-01');
insert into users_2(user_id,action,date) values (1,'cancel','2020-01-02');
insert into users_2(user_id,action,date) values (2,'start','2020-01-03');
insert into users_2(user_id,action,date) values (2,'publish','2020-01-04');
insert into users_2(user_id,action,date) values (3,'start','2020-01-05');
insert into users_2(user_id,action,date) values (3,'cancel','2020-01-06');
insert into users_2(user_id,action,date) values (4,'start','2020-01-07');

select * from users_2;


with t1 as (SELECT 
   user_id,
   SUM(CASE WHEN action = 'start' THEN 1 ELSE 0 END) AS starts, 
   SUM(CASE WHEN action = 'cancel' THEN 1 ELSE 0 END) AS cancels, 
   SUM(CASE WHEN action = 'publish' THEN 1 ELSE 0 END) AS publishes
FROM users_2
GROUP BY 1
ORDER BY 1)
select    user_id, 
   1.0*publishes/starts AS publish_rate , 
   1.0*cancels/starts AS cancel_rate
FROM t1