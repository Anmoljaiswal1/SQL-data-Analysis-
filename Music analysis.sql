create database music_project;

use music_project;

show tables;

select * from album2;
select * from artist;
select * from contry;
select * from customer;
select * from employee;
select * from genre;
select * from invoice_line;
select * from media;
select * from playlist;
select * from playlist tack;
select * from track;


# no. of song in each genre 
select g.name, count(t.album_id) as num_of_albums from genre g 
inner join track t 
on g.genre_id = t.genre_id 
group by g.name;

# revenue genrate by top ten country
select i.billing_country, sum(i_n.quantity * i_n.unit_price) as total_geneated_revenue from contry i
left join invoice_line i_n 
on i.invoice_id = i_n.invoice_id
group by i.billing_country
order by 2 desc
limit 10;

# count of tracks in each year
select year(i.invoice_date) as years, count(t.track_id) as num_of_track from contry i
inner join invoice_line i_n
on i.invoice_id = i_n.invoice_id
inner join track t
on t.track_id = i_n.track_id
group by year(i.invoice_date);

# top 5 artist that lunched the higest track 
select a.name, count(t.track_id) as number_of_track from artist a 
inner join album2 ab 
on a.artist_id = ab.artist_id
inner join track t 
on t.album_id = ab.album_id
group by a.name
order by number_of_track desc
limit 5;

# customer and there payment from rock genre 
select concat(c.first_name, ' ', c.last_name) as customer_name, c.country as country, sum(i_n.unit_price * i_n.quantity) as payment  from customer c
inner join contry co
on c.customer_id = co.customer_id
inner join invoice_line i_n
on i_n.invoice_id = co.invoice_id
where i_n.track_id in (select track_id from track
where genre_id = (select genre_id from genre 
where name = "rock")) 

 
 
 group by customer_name, country
order by 3 desc;

# total collection done by each genre 
Select g.name as genre_name, round(sum(c.total), 2) as total_collection from genre g
inner join track t
on t.genre_id = g.genre_id
inner join invoice_line i_n
on i_n.track_id = t.track_id
inner join contry c
on c.invoice_id = i_n.invoice_id
group by g.name 
order by total_collection desc; 
  

#  guy Report to whom 
select concat(e.first_name, " report to  ", e1.first_name) as employee_to_manager  from employee  e1
inner join employee e
on e1.employee_id = e.reports_to;

# Top 5 Artist according to there song sales and dont show the sales data 
with tab as
(
    select
        a.name as artist_name,
        sum(c.total) as total_collection
    from artist a
    inner join album2 ab on a.artist_id = ab.artist_id
    inner join track t on ab.album_id = t.album_id
    inner join invoice_line i_n on t.track_id = i_n.track_id
    inner join contry c on c.invoice_id = i_n.invoice_id
    group by a.name
)
select artist_name from tab
order by total_collection desc
limit 5;