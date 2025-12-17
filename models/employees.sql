with calc_employees as (
    select 
        date_part('year',current_date) - date_part('year',BirthDate) as age,
        date_part('year',current_date) - date_part('year',HireDate) as lengthofservice,
        FirstName || " " || LastName as name,
        *
    from {{source('sources','employees')}}
)
select * from calc_employees