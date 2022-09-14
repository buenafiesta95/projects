#TASK 1
select client_id from bank.client
where district_id = 1
limit 5;
#TASK 2
select max(client_id) from bank.client
where district_id = 72;
#TASK 3
select amount from bank.loan
ORDER BY amount limit 3;
#TASK 4
select distinct status from bank.loan
ORDER BY status asc;
#TASK 5
select loan_id, payments from bank.loan
ORDER BY payments desc limit 1;
#TASK 6
select account_id, amount from bank.loan
order by account_id limit 5;
#TASK 7
select account_id from bank.loan
where duration = 60
order by amount asc limit 5;
#Task 8
select distinct k_symbol from bank.order
where k_symbol <> ""
order by k_symbol;
#TASK 9
select order_id from bank.order
where account_id = 34;
#TASK 10
select distinct account_id from bank.order
where order_id between 29540 and 29560;
#TASK 11
select distinct amount from bank.order
where account_to = 30067122;
#TASK 12
select trans_id, date, type, amount from bank.trans
where account_id = 793
order by date desc limit 10;
#TASK 13
select district_id, count(district_id) from bank.client
where district_id < 10
group by district_id
order by district_id asc;
#TASK 14
select distinct(type), count(type) from bank.card
group by type;
#TASK 15
select account_id, amount from bank.loan
order by amount desc limit 10
#TASK 16
select date from bank.loan
where date <930907
order by date desc;
#TASK 17
select duration, `date`, count(amount) from bank.loan
where date LIKE "9712%"
group by date, duration
order by date ASC, duration ASC;
#TASK 18
select account_id, `type`, sum(amount) as total_amount  from bank.trans
where account_id = 396
group by `type`
order by `type`, total_amount;
#TASK 19
select account_id, `type`, floor(sum(amount)) as total_amount,
case when `type`='PRIJEM' then 'Incoming'
	 when `type`='VYDAJ' then 'Outgoing'
	 else `type` end as 'transaction_type'
from trans
where account_id = 396
group by `type`
order by `type`