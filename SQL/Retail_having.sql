select Customer_ID as customer, count(*) as transaction_num, AVG(Quantity) as avg_quan from public.retail_transaction where Item_Category = 'DAIRY' group by customer having avg(Quantity)>5 order by transaction_num;

select Customer_ID as customer, count(*) as transaction_num from
public.retail_transaction group by customer having count(*)>3 order by transaction_num desc;

select Item_Category, AVG(Quantity) as avg_quan, min(Quantity) as min_quan, max(Quantity) as max_quan,
count(*) as cnt from public.retail_transaction
where Customer_ID between 100 and 800 group by Item_Category having max(Quantity)>5 order by cnt desc;

create table new as select * from public.retail_transaction;
select * from new;