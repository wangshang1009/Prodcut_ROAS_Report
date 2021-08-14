#---------Product sale list---------
select category.path as 分類,product.Prod_Id as prod_id,
product.name as 商品名稱,
sum(order_item.net_amount) as 營業額,count(order_item.item_NO) as 訂單數,count(distinct(Buyer_Id)) as 會員數,
	case
		when spec_value.cost is not null then 1-(spec_value.cost*sum(order_item.quantity)/sum(order_item.net_amount))
        when spec_value.cost is null then 1-(product.cost*sum(order_item.quantity)/sum(order_item.net_amount))
        else 0
	end as '毛利率'
from ((order_item
join product on product.prod_id = order_item.prod_id)
join category on category.Category_Id = product.Category_Id)
left join spec_value on spec_value.value_Id = order_item.SpecVal_Id
where date_format(date_add(order_item.create_time,interval 8 hour ),'%Y%m%d') between 20210705 and 20210711
and order_status in (1,2)
group by product.prod_id;


#---------Cart item list---------
select cart_item.prod_id as prod_id,product.name,sum(cart_item.Quantity) as 數量,
	case
		when Enabled = 1 then '上架'
        when Enabled = 0 then '下架'
        else 0
	end as 狀態
from cart_item 
join product on product.prod_id = cart_item.prod_id
and date_format(date_add(cart_item.update_time,interval 8 hour ),'%Y%m%d') between 20210705 and 20210711
group by cart_item.prod_id;