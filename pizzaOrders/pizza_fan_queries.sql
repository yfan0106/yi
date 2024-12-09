# Q1 Fan #
/*select customer_name, phone,zipcode
from customer
order by customer_name;

# Q2 Fan #
select customer_name
from customer
where customer_name like "% B%"
order by customer_name;

# Q3 Fan #
select customer_name,`order`.order_id,order_date
from customer
inner join `order` on customer.customer_id=`order`.customer_id
where `order`.order_date like "2020-08-%"
and customer_name like "% F%"
order by order_date;

# Q4 Fan #
select customer_name, order_id, order_date, order_time
from customer,`order`,employee
where customer.customer_id=`order`.customer_id
and employee.employee_id=`order`.employee_id
and (customer_name="Reese Campbell"or customer_name= "Arianna Hale")
and employee_name="Owen Amarone"
order by customer_name;

# Q5 Fan #
select customer_name,count(order_id)as ToatalOrders
from customer,`order`,employee
where customer.customer_id=`order`.customer_id
and employee.employee_id=`order`.employee_id
and employee_name="Sophia Grumello"
group by customer_name
order by count(order_id) desc;

# Q6 Fan #
select pizza.pizza_id, sum(topping_price)as TotalToppingPrice
from pizza
inner join pizza_toppings on pizza.pizza_id=pizza_toppings.pizza_id
inner join toppings on toppings.topping_id=pizza_toppings.topping_id
where size_id=2
group by pizza_id
order by pizza_id;

# Q7 Fan #
select customer_name, count(quantity) as TotalPizza
from customer,pizza_order,`order`,employee
where customer.customer_id=`order`.customer_id
and `order`.order_id=pizza_order.order_id
and employee_name="Harper Asti"
and order_date="2021-04-01"
and order_time > "13:00:00"
group by customer_name
order by count(quantity) desc;

# Q8 Fan #
select employee_name,count(`order`.order_id)as TotalDelievery
from employee,`order`,pizza_order,pizza
where employee.employee_id=`order`.employee_id
and pizza_order.order_id=`order`.order_id
and pizza.pizza_id=pizza_order.p_id
and (size_id=2 or size_id=3)
group by employee_name
order by count(`order`.order_id) desc;

# Q9 Fan #
select customer_name, count(`order`.order_id) as TotalOrder
from customer,`order`, pizza_toppings,pizza_order
where customer.customer_id=`order`.customer_id
and `order`.order_id=pizza_order.order_id
and pizza_order.p_id=pizza_toppings.pizza_id
and topping_id=9
group by customer_name
order by count(`order`.order_id) desc;*/

# Q10 Fan #
select size_description,count(`order`.order_id)as TotalOrder
from size,`order`,pizza_toppings,employee,pizza_order,pizza
where  pizza_toppings.pizza_id=pizza_order.p_id
and size.size_id=pizza.size_id
and pizza.pizza_id=pizza_toppings.pizza_id
and pizza_order.order_id=`order`.order_id
and employee.employee_id=`order`.employee_id
and topping_id=1
and (employee_name="Camila Carema"or employee_name="Michael Custoza" or employee_name="Isabella Inferno")
group by size_description
order by count(`order`.order_id) desc;


















































































