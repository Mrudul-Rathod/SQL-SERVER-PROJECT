INDIA CENSUS ANALYSIS



SELECT * from Census
order by state asc


      -- A. COUNTRY TOTAL QUERIES


-- 1. Total Number of Population of India
   
   select sum(population) as population from census;


-- 2. Total Number of Workers in India
      
    select sum(Workers) as Total_Workers from Census;


-- 3. Total Number of Male Workers and Female Workers in India
    
	select sum(Male_Workers) as Total_Male_workers,
	       sum(Female_Workers) as Total_Female_Workers
		from Census;


-- 4. Total Number of People from  Different Relegions present in India

      select sum(Hindus) as Total_Hindus,
	         sum(Muslims) as Total_Muslims,
			 sum(Christians) as Total_Christians,
			 sum(Sikhs) as Total_Sikhs,
			 sum(Buddhists) as Total_Buddhists,
			 sum(Jains) as Total_Jains
       from Census;


-- 5. Total Number of Workers from different Profession in India

      select sum(Cultivator_Workers) as Total_Cultivator_Workers,
	         sum(Agricultural_Workers) as Total_Agriculltural_workers,
			 SUM(Household_Workers) as Total_Household_Workers
	  from Census;


-- 6. Total Number of People in different Age Groups present in India

      select sum(Age_Group_0_29) as Total_Age_Group_0_29,
	         sum(Age_Group_30_49) as Total_Age_Group_30_49,
			 sum(Age_Group_50) as Total_Age_Group_50
      from Census;



-- 7. Total Literate and Literacy Rate of India
     
	 select sum(Literate) as Total_Literate, 
	  round((sum(Literate)/sum(population))*100,0) as Total_Literacy_Rate
	       from census;


	
	-- B. STATE WISE QUERIES


-- 8. Total Population according to States from highest to Lowest
    
	select state, sum(population) as population from Census
	   group by state 
	     order by population desc;



-- 9. Total number of Males and Females according to states
    
	select state, sum(male) as Male, sum(female) as Female from Census 
	   group by State 
	     order by state asc



-- 10. States having Female workers more than Male workers

    select state, sum(Female_Workers) as Female_Workers, sum(Male_Workers) as Male_workers from census  
	   where Female_Workers > Male_Workers 
	     group by State
	       order by Female_Workers desc



-- 11. Literacy Rate of States from Highest to Lowest

     select state, round((sum(Literate)/sum(population))*100,0) as Literacy_Rate
	       from census
		     group by State 
			   order by Literacy_Rate desc;



-- 12. Population having different Relegion from different States

     select state, sum(Hindus) as Hindus,
	   sum(Muslims) as Muslims,
	     sum(Christians) as Christians,
		   sum(Sikhs) as Sikhs, 
		     sum(Buddhists) as Buddhists,
			   sum(Jains) as Jains
			     from Census
				   group by State
				    order by Hindus desc;
	    
	     

-- 13. Top 5 States having high number of Agricultural Workers
      
	  select Top 5 State, sum(Agricultural_Workers) as Agricultural_Workers from census
	     group by state
	       order by Agricultural_Workers desc;



-- 14. 5 States having Lowest number of Agricultural Workers

      select Top 5 State, sum(Agricultural_Workers) as Agricultural_Workers from census
	     group by state
	       order by Agricultural_Workers asc;


-- 15. States having more Household Workers compared to Cultivator workers and Agricultural Workers

      select state, sum(Household_Workers) as Household_Workers,
                    sum(Cultivator_Workers) as Cultivator_Workers,
					sum(Agricultural_workers) as Agricultural_workers
			        from Census 
				      where Household_Workers>Cultivator_Workers
				       AND Household_Workers>Agricultural_Workers
				        group by state
					     order by Household_Workers desc;



-- 16. States having more Cultivator Workers than Household Workers and more Household Workers than Agricultural Workers 

      
	   select state, sum(Cultivator_Workers) as Cultivator_Workers,
                    sum(Household_Workers) as Household_Workers,
					sum(Agricultural_workers) as Agricultural_workers
			        from Census 
				      where Cultivator_Workers>Household_Workers
				       AND Household_Workers>Agricultural_Workers
				        group by state
					     order by Household_Workers desc;


-- 17. States having People with Higher Graduate Education from Highest to Lowest

       select state, sum(Graduate_Education) as Graduate_Educatiohn
	      from Census
		    Group By State
			  Order By Graduate_Educatiohn desc;



-- 18. Find States in which there are more than 250,000 Gratuates

       select state, sum(Graduate_Education) as Graduate_Education
	     from Census 
		   where Graduate_Education>250000
			 group by state
			   order by Graduate_Education desc;


-- 19. Find States in which there are Less than 150,000 Secondary Educates
 
       select state, sum(Secondary_Education) as Secondary_Education
	     from Census
		   group by State
		     having sum(Secondary_Education)<150000
		       order by Secondary_Education;



-- 20. Find People having Age Group 50 according to State from Highest to lowest

       select state, sum(Age_Group_50) as Age_Group_50
	      from Census
		    Group by State
			  order by Age_Group_50 desc;


-- 21. Find Population of Districts of Gujarat from Highest to Lowest

       select State, District, Population 
	   from Census
	     where State = 'Gujarat' 
		   order by Population desc;

				
-- 22. Find the Number of Hindus present in Assam district from Highest to Lowest

       select State, District, Hindus
	   from Census
	     where state = 'Assam'
		   order by Hindus desc;



-- 23. Find the Number of Literate People present in Kerala District from Highest to Lowest

       SELECT State, District, Literate
	   FROM Census
	     WHERE State = 'Kerala'
		   ORDER BY Literate DESC;



-- 24. Find Number of Male Workers and Female Workers of Jammu and Kashmir

       SELECT State, District, Male_Workers, Female_Workers
	   FROM Census
	     WHERE State = 'Jammu and Kashmir'
		   ORDER BY District;


    -- C. REGION WISE QUERY
	

-- 25. Adding New Column REGION in the current Table Census

       ALTER TABLE Census
         ADD Region nvarchar(255);



-- 26. Updating New Column Region in the Current Table Census
       
	   UPDATE Census
  SET Region = 'North' WHERE State IN 
                     ('Jammu and Kashmir' , 'Himachal Pradesh', 'Punjab', 'Uttarakhand', 'Haryana', 'Uttar Pradesh', 'Delhi', 'Rajasthan', 'Chandigarh')

       UPDATE Census
  SET Region = 'South' WHERE State IN ('Andhra Pradesh', 'Karnataka', 'Kerala', 'Tamil Nadu', 'Telangana', 'Puducherry', 'Lakshadweep')

       UPDATE Census 
  SET Region = 'West' WHERE State IN ('Gujarat', 'Maharashtra', 'Dadra and Nagar Haveli', 'Daman and Diu', 'goa')

       UPDATE Census
  SET Region = 'East' WHERE State IN ('Andaman And Nicobar Islands', 'Bihar', 'Jharkhand', 'Orissa', 'West Bengal')

       UPDATE Census
  SET Region = 'North East' WHERE State IN ( 'Arunachal Pradesh', 'Assam', 'Manipur', 'Meghalaya', 'Mizoram', 'Nagaland', 'Sikkim', 'Tripura')

       UPDATE Census
  SET Region = 'Central' WHERE State IN ('Madhya Pradesh', 'Chhattisgarh')



-- 27. Which Region has the Highest Number of Population

       SELECT Region, SUM(Population) as Population
	   FROM Census
	     GROUP BY Region
	       ORDER BY Population DESC;


-- 28. Number of people from different Relegion according to Region from Highest to Lowest

       SELECT Region, SUM(Hindus) as Hindus,
	                  SUM(Muslims) as Muslims,
					  SUM(Christians) as Christians,
					  SUM(Sikhs) as Sikhs,
					  SUM(Buddhists) as Buddhists,
					  SUM(Jains) as Jains
       FROM Census
	   GROUP BY Region;



-- 29. Region wise Literacy rate Highest to Lowest
       
	   SELECT Region, 
	   round((sum(Literate)/sum(population))*100,0) as Literacy_Rate
	   FROM Census
	   GROUP BY Region;
	   



