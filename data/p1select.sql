--write an update to update the history of nationalpark
UPDATE NationalPark
SET history = 'Yellowstone National Park has rich human and ecological stories that continue to unfold. People have spent time in the Yellowstone region for more than 11,000 years. Many tribes and bands used the park as their home, hunting grounds, and transportation routes prior to and after European American arrival. Yellowstone was established as the first national park in 1872 in the world.'
WHERE id = 1;

-- a simple query to select national park whose price is less than 15 dollars
SELECT NationalPark.id, name, PriceInfo.tTime, PriceInfo.people_group
FROM  NationalPark, PriceInfo
WHERE NationalPark.id = PriceInfo.id AND PriceInfo.price < 15.0;

-- a query that selects the nationalpark in uSA
SELECT DISTINCT NationalPark.id, NationalPark.name
FROM NationalPark, Country, IsInCountry
WHERE NationalPark.id = IsInCountry.park_id AND Country.name = 'USA' AND Country.name = IsInCountry.country_name;

-- update the name of a national park
UPDATE nationalpark SET name = 'Yellowstone National Park' WHERE id = 1;

-- select national park whose recreation containing bird
SELECT DISTINCT np.name  
FROM NationalPark np, HasRecreation hr 
WHERE hr.park_id = np.id AND hr.description LIKE '%bird%' or hr.description LIKE '%see bird%';

-- select national park whose description containing indigenous culture 
SELECT DISTINCT np.name
FROM Nationalpark np, HasRecreation hr, IsInCountry c
WHERE hr.park_id = np.id AND c.park_id = np.id
AND (
hr.description LIKE '%indigenous culture%'
OR np.history LIKE '%indigenous culture%'
);

-- queries to find national parks where the ticket price for adults is under 10 dollars and annual visitor size over 5000
SELECT np.id, np.name, pi.tTime, pi.people_group, hs.num_visitor, pi.price
FROM NationalPark np, PriceInfo pi, HasStats hs 
WHERE pi.id = np.id AND hs.park_id = np.id 
		AND pi.people_group LIKE '%Adult%'
        AND pi.price < 20 
        AND hs.num_visitor > 5000 
        AND hs.year = (SELECT MAX(hs2.year) FROM HasStats hs2 WHERE hs2.park_id = np.id);