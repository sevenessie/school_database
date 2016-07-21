# name, list of triggering events, conditions that must be meet to fire the rule, short description of operations performed and its complexity.


# Name: Payment_promo
# List of triggering events: after insert into payment
# Conditions to fire the rule: if payment_value > 2000 then update payment value = payment_value*0,9


define rule payment_promo
on retrieve payment_value from payment
if payment_value > 2000 then
update payment value = payment_value*0,9


# Name: Salary_emp
# List of triggering events: after insert into reservation
# Conditions to fire the rule:  create rule employee_salary after insert of reservation execute procedure InserttoSalary


create table employee salary(
employee_id INT,
salary INT,
bonus INT)

define rule employee_salary
on insert to Bonus
if employee has reservatiob then
salary = typ lekcji * czas trwania

rule triggered by data retireval

