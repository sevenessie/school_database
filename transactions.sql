# EQUIPMENT ON SALE



    set transaction name 'eq sale';

    

    declare 

      cursor equipment_cur1 IS

      select * from equipment where production_date between '00/01/01' and '05/01/01'

      for update of price;

    begin

      for equipment_rec IN equipment_cur1

    loop

      update equipment

      set price = price * 0.5

      where current of equipment_cur1;

    end loop;

    end;

    /

     

create or replace view Equipment_on_sale

  as 

  select equipment_id, NAM, BRAND, round(price) as Price2, SIZ, amount    from equipment where production_date between '00/01/01' and '05/01/01'

  ;



select * from equipment_on_sale;







# UPDATE OF LEVEL



savepoint merging;



set transaction name levupdate;



create or replace view Custlevels

as

select Reservation.Customer_id, customer.lev

, count (Reservation.Customer_id) as total

from Reservation

inner join Customer 

on Reservation.Customer_id = Customer.Customer_id

 group by reservation.Customer_id, customer.lev;

 

-- select * from Custlevels;



  

 merge into customer C

 using (select * from Custlevels 

 where  total = 2 and lev= 'begginer' ) L

 on (C.Customer_id = L.Customer_id)

 when matched then update set C.lev = 'intermediate';

 

select * from Custlevels;



# EQUIPMENT INCOME





create or replace view allrents

as

select

x.equipment_id,

x.rent_count

from 

  (select

  r.equipment_id, 

  count(*) as rent_count,

  rank() over(order by count(*) desc) as rank

    from Rental r

    group by

    r.equipment_id) x

    where 

    x.rank > 0 

    ;



create or replace view eq_income

as

select allrents.rent_count, equipment.equipment_id, equipment.price, equipment.nam, equipment.brand

, equipment.price*allrents.rent_count as total

from allrents

inner join equipment on

allrents.equipment_id = equipment.equipment_id

order by total desc;





select * from eq_income;



merge into Equipment E

 using (select * from eq_income

 where  total > 3000 ) I

 on (E.Equipment_id = I.Equipment_id)

 when matched then update set E.price = price + 10;



