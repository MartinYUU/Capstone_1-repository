/*
This is query tab for the queries and reasons behind the queries.
I found two differnet sources for block parties in chicago and 
one for food trucks that are registered with the city of chicago.
*/


# with 431 rows returned, i can see that there are at least 431 
# companies that own 1 or more food trucks but a total of 2010
# food trucks. does not sound like many compared to the millions
# of people in chicago. Could mean the demand for more food 
# food trucks is there
SELECT DISTINCT LEGAL_NAME, COUNT(LEGAL_NAME)
FROM market_research.food_trucks_chicago 
GROUP BY LEGAL_NAME
;

SELECT LEGAL_NAME
FROM market_research.food_trucks_chicago 
;

 
 # The chicago_block_parties2024 dataset only had block parties
 # for october. 193 block party requests have been submitted 
 # for october 2024 so far compared to the 193 in 2012 and 255 in 2011
 # demand this time of year seems to be steady. 
 SELECT * 
 FROM chicago_block_parties2024
 WHERE STR_TO_DATE(EVENT_DATE, '%m/%d/%Y') BETWEEN '2024-10-01' AND '2024-10-31' # DATA would not import in date format
 ;
 
 SELECT DISTINCT PERMIT_NUMBER, EFFECTIVE_DATE # some records are duplicated so needed distinct 
 FROM block_parties_in_chicago2
 WHERE STR_TO_DATE(EFFECTIVE_DATE, '%m/%d/%Y') BETWEEN '2011-10-01' AND '2011-10-31'
 ; 

SELECT DISTINCT PERMIT_NUMBER
 FROM block_parties_in_chicago2
 WHERE STR_TO_DATE(EFFECTIVE_DATE, '%m/%d/%Y') BETWEEN '2012-10-01' AND '2012-10-31'
 ; 
 
 
 
 # Thousands of opportunities every summer in block parties alone
 # 3400 in 2012 and 3900 in 2011
 # looks promising for futrure summers
  SELECT DISTINCT * # some records are duplicated so needed distinct 
 FROM block_parties_in_chicago2
 WHERE STR_TO_DATE(EFFECTIVE_DATE, '%m/%d/%Y') BETWEEN '2011-07-01' AND '2011-08-31'
 ; 

SELECT DISTINCT *
 FROM block_parties_in_chicago2
 WHERE STR_TO_DATE(EFFECTIVE_DATE, '%m/%d/%Y') BETWEEN '2012-06-01' AND '2012-08-30'