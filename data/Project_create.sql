CREATE TABLE NationalPark(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    history VARCHAR(500),
    url VARCHAR(300),
    imgurl VARCHAR(300),
    size FLOAT
);

CREATE TABLE Continent(
    name VARCHAR(50) PRIMARY KEY
);

CREATE TABLE Country(
    name VARCHAR(16) PRIMARY KEY,
    language VARCHAR(100),
    continent VARCHAR(30) REFERENCES Continent(Name)
);

CREATE TABLE Geology(
    name VARCHAR(16) NOT NULL PRIMARY KEY,
    description VARCHAR(1024)
);

CREATE TABLE Climate(
    name VARCHAR(50) NOT NULL PRIMARY KEY,
    description VARCHAR(1024)
);

CREATE TABLE PriceInfo(
    price FLOAT,
    id INTEGER NOT NULL REFERENCES NationalPark(id),
    PRIMARY KEY(id)
);

CREATE TABLE VisitorStats(
    year INTEGER NOT NULL,
    PRIMARY KEY(year)
);

CREATE TABLE Recreation(
    name VARCHAR(16) NOT NULL PRIMARY KEY,
    description VARCHAR(1024)
);

CREATE TABLE IsInCountry(
    park_id INTEGER NOT NULL,
    country_name CHAR(50) NOT NULL,
    FOREIGN KEY(park_id) REFERENCES NationalPark(id),
    FOREIGN KEY(country_name) REFERENCES Country(name)
);

CREATE TABLE HasStats(
    park_id INTEGER NOT NULL,
    year INTEGER,
    num_visitor INTEGER,
    PRIMARY KEY(park_id, year),
    FOREIGN KEY(year) REFERENCES VisitorStats(year),
    FOREIGN KEY(park_id) REFERENCES NationalPark(id)
);

CREATE TABLE HasRecreation(
    park_id INTEGER NOT NULL REFERENCES NationalPark(id),
    recreation_name VARCHAR(16) NOT NULL REFERENCES Recreation(name),
    description VARCHAR(1024)
);

CREATE TABLE IsOfClimate(
    park_id INTEGER NOT NULL REFERENCES NationalPark(Id),
    Name VARCHAR(50) NOT NULL,
    FOREIGN KEY(name) REFERENCES Climate(Name)
);

CREATE TABLE IsOfGeology(
    park_id INTEGER NOT NULL REFERENCES NationalPark(id),
    name VARCHAR(16) NOT NULL REFERENCES Geology(name)
);

------ Views for Queries

CREATE VIEW ParkInfo(name, history, website, image, language, country, geology, climate, price, recreation) AS (
SELECT park.name, park.history, park.url, park.imgurl, country.language, country.name, geology.name, climate.name, priceinfo.price, recreation.name
FROM NationalPark park, Continent continent, Country country, Geology geology, Climate climate, PriceInfo priceinfo, Recreation recreation, 
IsInCountry incountry, HasStats stats, HasRecreation hasRecreation, IsOfClimate ofClimate, IsOfGeology ofGeology
WHERE park.id = incountry.park_id
AND incountry.country_name = country.name
AND park.id = stats.park_id
AND park.id = hasRecreation.park_id
AND hasRecreation.recreation_name = recreation.name
AND park.id = ofClimate.park_id
AND ofClimate.name = climate.name
AND park.id = ofGeology.park_id
AND ofGeology.name = geology.name
);


--------Populating data

-- Insert Indepent Tabel Content

-- National Park

INSERT INTO NationalPark(name, history, url, imgurl, size)
VALUES
('Yellowstone National Park',
'Yellowstone National Park is a national park located in the U.S. states of Wyoming, Montana and Idaho. It was established by the U.S. Congress and signed into law by President Ulysses S. Grant on March 1, 1872.',
'https://www.nps.gov/yell/index.htm',
'http://kids.nationalgeographic.com/content/dam/kids/photos/articles/History/M-Z/YELLOWSTONE%20LAKE.jpg.adapt.945.1.jpg',
3471),

('Yosemite National Park',
'Not just a great valley, but a shrine to human foresight, the strength of granite, the power of glaciers, the persistence of life, and the tranquility of the High Sierra.
First protected in 1864, Yosemite National Park is best known for its waterfalls, but within its nearly 1,200 square miles, you can find deep valleys, grand meadows, ancient giant sequoias, a vast wilderness area, and much more.',
'https://www.nps.gov/yose/index.htm',
'http://cdn.history.com/sites/2/2015/09/iStock_000038100826_Large.jpg',
1200),

('Arenal Volcano National Park',
'In the middle of the dense Costa Rican rainforest, there’s a rumbling active volcano (yes, you can actually see the lava pouring down the sides), surrounded by hot springs, fauna-filled forests, and plenty of hidden waterfalls. Ask anyone who’s been to Arenal and they’ll tell you: It’s paradise.',
'http://www.arenal.net/arenal_volcano_national_park.htm',
'http://images.huffingtonpost.com/2014-06-03-IguazuLucioSassi.jpg',
1300),

('Iguazu National Park',
'The Iguazu National Park on the Argentina/Brazil border is easily the most amazing waterfall park on Earth. Whether you prefer to cool off in the clouds of mist or enjoy the over 2000 species of plants, strolling the walkways around this roaring, watery wonderland is an experience you’ll never forget.',
'http://whc.unesco.org/en/list/303',
'http://images.huffingtonpost.com/2014-06-03-IguazuLucioSassi.jpg',
2000),

('Uluru-Kata Tjuta National Park',
'Uluru is Australia''s most recognizable natural icon and has become a focal point for Australia and the world''s acknowledgement of Australian indigenous culture.',
'https://parksaustralia.gov.au/uluru/', 
'https://parksaustralia.gov.au/uluru/images/home-1.jpg',
515),

('Göreme National Park',
'In a spectacular landscape, entirely sculpted by erosion, the Göreme valley and its surroundings contain rock-hewn sanctuaries that provide unique evidence of Byzantine art in the post-Iconoclastic period. Dwellings, troglodyte villages and underground towns – the remains of a traditional human habitat dating back to the 4th century – can also be seen there.',
'http://whc.unesco.org/en/list/357',
'https://media1.britannica.com/eb-media/84/153484-004-0E9C6B26.jpg',
899),

('Kruger National Park',
'Kruger National Park is one of the largest game reserves in Africa. The park is part of the Kruger to Canyons Biosphere an area designated by the United Nations Educational, Scientific and Cultural Organization (UNESCO) as an International Man and Biosphere Reserve.',
'https://www.sanparks.org/parks/kruger',
'http://www.krugerpark.co.za/images/camp-shawu-accommodation-kp-590x390.jpg',
7544),

('Masai Mara National Reserve',
'It is globally famous for its exceptional population of Masai lions, African leopards and Tanzanian cheetahs, and the annual migration of zebra, Thomson''s gazelle, and wildebeest to and from the Serengeti every year from July to October, known as the Great Migration.',
'http://www.maasaimara.com/',
'https://cloudfront.safaribookings.com/library/kenya/xxl/Masai_Mara_National_Reserve_042.jpg',
580),

('Vatnajökull National Park',
'Vatnajökull National Park is one of three national parks in Iceland. It encompasses all of Vatnajökull glacier and extensive surrounding areas. These include the national parks previously existing at Skaftafell in the southwest and Jökulsárgljúfur in the north.',
'http://www.vatnajokulsthjodgardur.is/english',
'http://www.vatnajokulsthjodgardur.is/media/hausamyndir/forsidubanner/header31.jpg',
7456)
;

-- Continent
INSERT INTO Continent(name) 
VALUES
('North America'),

('Latin America'),

('Asia'),

('Africa'),

('Europe'),

('Australia'),

('Antarctica');

-- Geology
INSERT INTO Geology(name, description)
VALUES 
('Canyon', ''), 

('Cave/Crevice', 'Natural opening within a rock formation which is large enough to permit a human to enter.A fracture is any separation in a geologic formation, such as a joint or
a fault that divides the rock into two or more pieces. A fracture will sometimes form a deep fissure or crevice in the rock. Fractures are commonly caused by stress exceeding the rock strength, causing the rock to lose cohesion along its weakest plane.'), 

('Desert', 'a type of terrain with little to no vegetation. This is normally because it also has very little water, although other factors, such as poisoning with salt and similar substances, or just extreme exhaustion of the soil may also be a factor.
Although deserts are generally thought of as hot places, many are not - the Gobi and similar deserts (including those in the Artic and Antartic) are famously chilly places and the Bledow Desert in Poland manages to exist in a temperate region. Although heat often does play a major part in the existence of a desert, and area can dry out just as easily because its ''rainfall'' rarely, if ever, melts or just because it is in the rainshadow of a mountain range and receives little or no rain in the first place.'),

('Forest', 'A forest will tend to be sparsely settled compared to agricultural land (since, if it were not sparsely settled, the trees would have been felled and the land turned over to agriculture), but may still contain villages and towns, let alone smaller habitations.
A forest may - or may not - be managed by a forester of one kind or another.'), 

('Glacier', 'Glaciers are large masses of persistent ice (surviving over a time scale of many years). Glaciers are primarily found in the Antarctic, Greenland, certain other parts of the high Arctic, and high mountains.
Glaciers flow, rather like rivers or lava flows, though much slower - a ''fast'' glacier may move a couple of meters per day (though the Jakobshavn Glacier in Greenland moves up to 20 meters a day). Fast-moving glaciers can even produce ''glacial earthquakes'', and the frequency of these quakes appears to be increasing — possibly due to climate change?'),

('Lake', 'Lakes are usually very important to the societies that live around them, serving as a source of food, water and transport - the Sea of Galilee3 - should be familiar to us all, as should the Dead Sea (actually a salt lake) which despite being dead (as the name implies) serves as a salt mine for the whole region.'),

('Lava Field', ''), 

('Mountain', 'A monadnock, inselberg or kopje is a short but steep mountain rising out of lower or flatter terrain. Geologically, they are formed when a harder, erosion-resistant rock is surrounded by softer more readily eroded rock. After many years of weathering, the hard rock remains tall and unaffected, while the softer materials have worn far away. The resulting terrain is a steep cliff-face a little like a plateau, often adorned with vegetation on the top.
In arid or over-farmed environments, it''s quite common for a monadnock to be a refuge for wildlife. The high rock retains topsoil and thick vegetation, where the lower more heavily traveled and eroded lands are barren in comparison. Steep cliffs at the edges of the monadnock serve to isolate the local lifeforms.'),

('Volcano', ''), 

('Plain', 'Plain'),

('Swamp', 'A swamp is a region that mixes solid land with shallow bodies of water. The water is very slow moving, and covered by abundant vegetation which in some cases may be hard to distinguish from solid land merely by looking at it, thus making movement very difficult without (flat) boats The animals living in a swamp are likely to be abundant and diverse, and usually swamps are plagued by stinging insects such as mosquitoes. Leeches are also common in most freshwater swamps.
Swamps can occur in any suitable climate - large areas of tundra become swamp during the summer thaw - and can vary in vegetative cover from little but tussock grass (as found in many peat bogs) to a thick, jungle like tree cover.')
;

-- Climate 
INSERT INTO Climate(name, description)
VALUES 
('Tropical Wet', 'Temperatures stay the same throughout most of the year because these areas are found along the equator and receive constant direct sunlight.  The average temperature is about 80 degrees (27 Celsius) as you can see from the line below.  The temperatures feel hotter because the humidity is usually very high.  Humidity is the amount of water in the air.  Daytime temperatures rarely go over 93 degrees, and nighttime temperatures rarely go below 68 degrees. '),

('Tropical Wet and Dry', 'During the wet season, temperatures average about 77 degrees.  During the dry season, temperatures average about 68 degrees.  The temperatures stay high throughout the year because of the latitude where this climate occurs.  Areas near the equator receive constant direct sunlight and therefore, heat.   The slight difference in temperature is enough to change the wind patterns and keep this area dry for much of the year, until the winds shift and the rainy season begins.  '),

('Humid Subtropical', 'Humid Subtropical climate is known for hot humid summers and mild winters.  During the summer the average temperature is between 70 and 80 degrees.  The coldest month usually averages 45-50 degrees.  Since Humid Subtropical is found between 20o and 40o latitude, they receive direct sunlight for a large part of the year. '),

('Continental Humid', 'Similar to Subarctic climate, Humid Continental has a wide range of temperatures, which means low cold temperatures and high warm temperatures.  Summer month temperatures average about 71 degrees and winter months usually average 25 degrees. However, summer days can reach over 100 and winter months often reach below zero, which produces a 100 degree temperature range.  The main reason for the temperatures of Humid Continental is latitude.   Places that are 40 degrees away from the equator are over 2,800 miles from the equator, this results in less direct sunlight and less warmth.'),

('Mediterranean', 'The climate is known for warm to hot, dry summers and mild to cool, wet winters. Winter temperatures are usually between 30 and 65 degrees.  Summer months all average above 50 degrees.  The warmest month averages about 72 degrees.  The cause of this climate is directly related to large bodies of water such as the Mediterranean Sea and ocean currents.  During the summer, cold currents keep the climate mild and dry.  Ocean currents shift as the seasons change. During the winter the water that was warmed up all summer moves in and keeps the land warm and often brings rain.  '),

('Tundra', 'Winters are very harsh in Tundra climate.  Winter months temperatures are usually between -18 and -50 degrees.  "Summer" temperatures range from 35-50 degrees.  High latitudes are the main cause of of the low temperatures.  These areas mainly receive indirect sunlight.  Indirect sunlight delivers light, but little heat.  Even during the summer, Tundra mainly receives indirect sunlight, which is why temperatures rarely go above 50 degrees.  '),

('Ice Cap', 'Ice Cap is the coldest climate on Earth.  Antarctica is usually colder than the Arctic.  The "warmest" month averages about -16  degrees.  The coldest month averages about -70 degrees.  During the winter, temperatures regularly reach -90 degrees. The coldest temperature ever recorded was -128.6 degrees.  Ice Cap temperatures are so low because of its latitude near the poles.  These areas receive only indirect sunlight, and during winter it doesn''t even receive indirect sunlight!   During the winter this area is in total darkness (see image above). '),

('Arid', 'Temperatures can reach as high as 130 degrees or as low as negative 30 degrees.  The temperatures will depend on the latitude of the desert.  The farther from the equator the colder they will be.  On the map above you can see areas of cold desert (light red) and hot desert (dark red), and distance from the equator is clearly the cause.  '),

('Desert', 'Temperatures can reach as high as 130 degrees or as low as negative 30 degrees.  The temperatures will depend on the latitude of the desert.  The farther from the equator the colder they will be.  On the map above you can see areas of cold desert (light red) and hot desert (dark red), and distance from the equator is clearly the cause.  '),

('Semiarid', 'The temperatures in Semiarid climate depend on the latitude.  They will follow the same temperature patterns as the surrounding area.  For example in northern United States the Semiarid climate can be very cold, especially during winter.  Temperatures can be as low as -15 degrees.  However, it the African Sahel or northern Australia, temperatures remain high throughout the year, so latitude is clearly the cause of temperature in Semiarid climate. ')
;



-- Recreation
INSERT INTO Recreation(name, description) 
VAlUES 
('Rock Climbing', 'The goal is to reach the summit of a formation or the endpoint of a usually pre-defined route without falling. Due to the length and extended endurance required and because accidents are more likely to happen on descent than ascent, Rock Climbers do not usually climb back down the route. It is very rare for a climber to downclimb, especially on the larger multiple pitches (class III- IV and /or multi-day grades IV-VI climbs). Professional Rock climbing competitions have the objectives of either completing the route in the quickest possible time or attaining the farthest point on an increasingly difficult route. Scrambling, another activity involving the scaling of hills and similar formations, is similar to rock climbing. However, rock climbing is generally differentiated by its sustained use of hands to support the climber''s weight as well as to provide balance.'),

('Snorkeling', ' After exploring the sea, relax on the crescent-shaped beach and appreciate the scenery at one of the country''s most idyllic national parks.'), 

('Orienteering', ' Leave the GPS system at home for an orienteering adventure using just a map and compass to follow clues around one of the park''s 30 courses. You can choose to set your own pace, whether it''s a slowpoke family stroll while the kids master the compass or a competitive jaunt to race to the final clue.'), 

('Hiking', 'a long, vigorous walk, usually on trails (footpaths), in the countryside, while the word walking is used for shorter, particularly urban walks.'), 

('Horseback Riding', 'Horses are trained and ridden for practical working purposes such as in police work or for controlling herd animals on a ranch. They are also used in competitive sports including, but not limited to, dressage, endurance riding, eventing, reining, show jumping, tent pegging, vaulting, polo, horse racing, driving, and rodeo. (See additional equestrian sports listed later in this article for more examples.) Some popular forms of competition are grouped together at horse shows, where horses perform in a wide variety of disciplines. Horses (and other equids such as mules and donkeys) are used for non-competitive recreational riding such as fox hunting, trail riding or hacking. There is public access to horse trails in almost every part of the world; many parks, ranches, and public stables offer both guided and independent riding. Horses are also used for therapeutic purposes, both in specialized paraequestrian competition as well as non-competitive riding to improve human health and emotional development.'), 

('Rafting', 'Rafting and white water rafting are recreational outdoor activities which use an inflatable raft to navigate a river or other body of water. This is often done on whitewater or different degrees of rough water, and generally represents a new and challenging environment for participants. Dealing with risk and the need for teamwork is often a part of the experience.[1] The development of this activity as a leisure sport has become popular since the mid-1970s, evolving from individuals paddling 10 feet (3.0 m) rafts with double-bladed paddles to multi-person rafts propelled by single-bladed paddles and steered by a tour guide at the stern. It is considered an extreme sport, and can be fatal. The International Rafting Federation, often referred to as the IRF, is the worldwide body which oversees all aspects of the sport'), 

('Spelunking', 'The challenges involved in caving vary according to the cave being visited, but – in addition to the total absence of light beyond the entrance – often include the negotiation of pitches, squeezes,[2] and water hazards.[3] Cave diving is a distinct, and more hazardous, sub-speciality undertaken by a small minority of technically proficient cavers.[4] In an area of overlap between recreational pursuit and scientific study, the most devoted and serious-minded cavers become accomplished at the surveying and mapping of caves and the formal (though usually private) publication of their efforts.'), 

('Paddling', 'Paddling with regard to watercraft is the act of manually propelling a boat using a paddle. The paddle, which consists of one or two blades joined to a shaft, is also used to steer the vessel. The paddle is not connected to the boat (unlike in rowing where the oar is connected to the boat).'), 

('Sandboarding', 'You''ll need good equipment, such as downhill skis, a snowboard or a flat-bottomed plastic sled, to set off on a wild ride through the sand. The conditions aren''t good after rain or when the weather is too dry as the sand may be too soft to pick up some speed. Sandboarding is permitted on any of the unvegetated dunes and is particularly good at the 300-foot slope near the Castle Creek Picnic Area.'), 

('Wildlife Viewing', 'Black bears and grizzlies make their home in forests while coyotes, gray wolves and bobcats frolic in the meadows. Bison, elk and moose roam the grasslands while bighorn sheep meander along the mountainside. Bald eagles soar overhead and trumpeter swans make their nests alongside the park''s rivers. Bring a pair of binoculars and a camera, and join a ranger tour to learn more about these fascinating residents.'), 

('Glacier Hike', 'You know what it is. Hike in the glacier.'),

('Walk', 'Take a walk man')
;

-- Country
INSERT INTO Country(name, language, continent) 
VALUES
('Australia', 'English', 'Australia'),

('France', 'French', 'Europe'),

('United States', 'English', 'North America'),

('Spain', 'Spanish', 'Europe'),

('China', 'Chinese', 'Asia'),

('Italy', 'Italian', 'Europe'),

('Turkey', 'Turkish', 'Europe'),

('Germany', 'German', 'Europe'),

('United Kingdom', 'English', 'Europe'),

('Mexico', 'Spanish', 'North America'),

('Russia', 'Russian', 'Europe'),

('Iceland', 'Icelandic', 'Europe'),

('Kenya', 'Swahili', 'Africa')
;


-- Populate data

-- Define insert Function

CREATE OR REPLACE FUNCTION InsertPark
(
parkname VARCHAR(100),
country VARCHAR(50),
geology VARCHAR(50),
climate VARCHAR(50),
price FLOAT,
recreation VARCHAR(100)
) 
RETURNS void AS $$

DECLARE id INT;
BEGIN
id := 
(
    SELECT np.id
    FROM NationalPark np
    WHERE np.name = parkname
);

INSERT INTO IsInCountry(park_id, country_name)
VALUES (id, country);

INSERT INTO HasRecreation(park_id, recreation_name)
VALUES (id, recreation);

INSERT INTO IsOfClimate(park_id, name)
VALUES (id, climate);

INSERT INTO IsOfGeology(park_id, name)
VALUES (id, geology);

INSERT INTO PriceInfo(price, id) 
VALUES (price, id);
END;
$$ LANGUAGE plpgsql;

-- Populating New Tuples

SELECT InsertPark
(
    'Göreme National Park',
    'Turkey',
    'Cave/Crevice',
    'Semiarid',
    15,
    'Sandboarding'
);

SELECT InsertPark
(
    'Kruger National Park',
    'South Africa',
    'Desert',
    'Desert',
    5,
    'Sandboarding'
);

SELECT InsertPark
(
    'Vatnajökull National Park',
    'Iceland',
    'Glacier',
    'Ice Cap',
    14,
    'Glacier Hike'
);

SELECT InsertPark
(
    'Masai Mara National Reserve',
    'Kenya',
    'Desert',
    'Desert',
    13,
    'Sandboarding'
);

SELECT InsertPark
(
    'Uluru-Kata Tjuta National Park',
    'Australia',
    'Plain',
    'Mediterranean',
    30,
    'Walk'
);

-- -- Insert new tuples
-- INSERT INTO NationalPark(id, name, history, url, size) 
-- VALUES(2,'Uluru-Kata Tjuta National Park','Uluru is Australia''s most 
--     recognizable natural icon and has become a focal point for Australia and the world''s 
--     acknowledgement of Australian indigenous culture.',
--     'https://parksaustralia.gov.au/uluru/', 
--     515);

-- INSERT INTO PriceInfo(tTime, people_group, price, id)
-- VALUES('201604','Children', 9.59, 2);
-- INSERT INTO PriceInfo(tTime, people_group, price, id) 
-- VALUES('201605','Adults', 19.18, 2);

-- INSERT INTO IsInCountry(park_id, country_name) VALUES(2, 'Australia');

-- INSERT INTO VisitorStats(year) VALUES(2014);

-- INSERT INTO HasStats(park_id, year, num_visitor) VALUES(2, 2014, 279461);

-- INSERT INTO IsOfGeology(park_id, name, description)
-- VALUES (2,
--     'Crevice',
--     'These domed rock formations are composed of conglomerate, 
--     a sedimentary rock consisting of cobbles and boulders of varying 
--     rock types including granite and basalt, cemented by a matrix of
--     sandstone. The crevasses are due to erosion, primarily by water.
--     Although it is a dry region, the large area of these domes 
--     collects a lot of rainwater, which runs off in steep waterfalls 
--     during rain.');


-- INSERT INTO IsOfClimate(name, park_id, maxtemp, mintemp) 
-- VALUES (
--     'desert/arid climate',
--     2,
--     113,
--     23);


-- INSERT INTO HasRecreation(park_id, recreation_name, description)
-- VALUES (
-- 2,
-- 'birdwatching',
-- 'We have recorded 178 species of bird in the park including several rare species such as the scarlet-chested parrot and the grey honeyeater. Their songs and colours fill this arid landscape. The best time to see birds is early in the morning.  Being quiet and patient is the key to success - you may well hear a bird before you see it.');

-- INSERT INTO HasRecreation(park_id, recreation_name, description)
-- VALUES (
-- 2,
-- 'bushwalking',
-- 'A number of walks allow you to fully explore Uluru Kata Tjuta National Park. Most of the walks are wheelchair accessible, and range from easy to moderate. Walking reveals the natural beauty and rich culture of Uluru. Follow the footsteps of the ancestral beings that shaped this astonishing landscape.');


-- INSERT INTO HasRecreation(park_id, recreation_name, description)
-- VALUES (
-- 2,
-- 'sunrise',
-- 'Uluru is famous the world over for its spectacular sunrises and sunsets. Watch as the rock changes colour before your very eyes. There are five viewing areas built specifically for experiencing and photographing this beautiful landscape.');




-- -- Populating data #1
-- INSERT INTO NationalPark(id, name, history, url, size) VALUES(1,'YellowStone','Yellowstone National Park is a national park located in the U.S. states of Wyoming, Montana and Idaho. It was established by the U.S. Congress and signed into law by President Ulysses S. Grant on March 1, 1872.',
--     'http://whc.unesco.org/en/list/357/', 3471.00);
-- INSERT INTO PriceInfo(tTime, people_group, price, id) VAlUES('201505','Children', 2.5,1); --dollars
-- INSERT INTO PriceInfo(tTime, people_group, price, id)VALUES('201505','Adults',5.0,1);
-- INSERT INTO PriceInfo(tTime, people_group, price, id) VALUES('201501','Adults',4.0,1);
-- INSERT INTO IsInCountry(park_id, country_name) VALUES(1, 'USA');
-- INSERT INTO VisitorStats(year) VALUES(2015);
-- INSERT INTO HasStats(park_id, year, num_visitor) VALUES(1, 2015, 200000);
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(1, 'camping','If you’re interested in camping, Yellowstone is the place to go. We have 12 campgrounds and well over 2,000 campsites, and that’s not even mentioning the backcountry sites.');
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(1, 'fishing', 'The fishing season begins the Saturday of Memorial Day weekend (usually the last weekend in May) and extends through and includes the first Sunday in November.');
-- INSERT INTO IsOfClimate(name, park_id, maxtemp, mintemp)  VALUES('continental climate',1, 15.8, 1.3); 
-- INSERT INTO IsOfGeology (park_id, name, description) VALUES(1, 'volcanic','The Yellowstone Caldera is a volcanic caldera and supervolcano located in Yellowstone National Park in the United States, sometimes referred to as the Yellowstone Supervolcano.');



-- -- Populating data #3
-- INSERT INTO NationalPark(id, name, history, url, size) VALUES(3,'Göreme National Park','In a spectacular landscape, entirely sculpted by erosion, the Göreme valley and its surroundings contain rock-hewn sanctuaries that provide unique evidence of Byzantine art in the post-Iconoclastic period. Dwellings, troglodyte villages and underground towns – the remains of a traditional human habitat dating back to the 4th century – can also be seen there.',
--     'http://whc.unesco.org/en/list/357', 38); --miles
-- INSERT INTO PriceInfo(tTime, people_group, price, id) VAlUES('20170101','Adult', 0, 3); --dollars
-- INSERT INTO PriceInfo(tTime, people_group, price, id)VALUES('20170101','Children',0,3);
-- INSERT INTO IsInCountry(park_id, country_name) VALUES(3, 'Turkey');
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(3, 'open air museum','Housing the best preserved wall paintings (frescoes), this whole valley is full of pretty chapels and monasteries.'
-- );
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(3, 'church', 'Picturesque views, thrilling feelings appears when you enter inside ancient orthodox churches'
-- );
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(3, 'fairy chimneys', 'A hoodoo (also called a tent rock, fairy chimney or earth pyramid) is a tall, thin spire of rock that protrudes from the bottom of an arid drainage basin or badland.'
--     );
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(3, 'underground', 'here is an underground city in Goreme, built by ancient Hittites tribe for protection against enemies.'
--     );
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(3, 'hot air balloon', 'Cappadocia is known around the world as one of the best places to fly with hot air balloons.'
-- );

-- INSERT INTO IsOfClimate(name, park_id, maxtemp, mintemp)  VALUES('continental Climate', 3, 23, -3); 
-- INSERT INTO IsOfGeology (park_id, name, description) VALUES(3, 'fairy chimneys','fairy chimneys were formed when lava covering the tuff (consolidated volcanic ash) gave way along preexisting cracks of sloping areas and became isolated pinnacles. They can attain a height of up to forty meters, have conical shapes and consist of caps of harder rock resting on pillars of softer rock.'
-- );



-- -- Populating data #4
-- INSERT INTO NationalPark(id, name, history, url, size) VALUES(4,'Vatnajökull National Park','Vatnajökull National Park is one of three national parks in Iceland. It encompasses all of Vatnajökull glacier and extensive surrounding areas. These include the national parks previously existing at Skaftafell in the southwest and Jökulsárgljúfur in the north.',
--     'http://www.vatnajokulsthjodgardur.is/english', 7456); --miles
-- INSERT INTO PriceInfo(tTime, people_group, price, id) VAlUES('20170101','Adult', 0, 4); --dollars
-- INSERT INTO PriceInfo(tTime, people_group, price, id)VALUES('20170101','Children',0,4);
-- INSERT INTO IsInCountry(park_id, country_name) VALUES(4, 'Iceland');
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(4, 'hiking',null);
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(4, 'glacier walk', null);
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(4, 'ice craving tour', null);
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(4, 'sight seeing', null);
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(4, 'row boat', null);
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(4, 'hafragilsfoss', null);
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(4, 'air tours', null);
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(4, 'boat tours', null);
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(4, 'climbing', null);
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(4, 'camping', null);
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(4, 'wildlife', null);
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(4, 'aurora borealis', null);
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(4, 'midnight sun', null);

-- INSERT INTO IsOfClimate(name, park_id, maxtemp, mintemp)  VALUES('polar climate', 4, 16, -4); 

-- INSERT INTO IsOfGeology (park_id, name, description) VALUES(4, 'lowland',null);
-- INSERT INTO IsOfGeology (park_id, name, description) VALUES(4, 'rivers',null);
-- INSERT INTO IsOfGeology (park_id, name, description) VALUES(4, 'black sand',null);
-- INSERT INTO IsOfGeology (park_id, name, description) VALUES(4, 'ice',null);
-- INSERT INTO IsOfGeology (park_id, name, description) VALUES(4, 'snow',null);
-- INSERT INTO IsOfGeology (park_id, name, description) VALUES(4, 'glacier',null);
-- INSERT INTO IsOfGeology (park_id, name, description) VALUES(4, 'mountain',null);
-- INSERT INTO IsOfGeology (park_id, name, description) VALUES(4, 'quicksand',null);
-- INSERT INTO IsOfGeology (park_id, name, description) VALUES(4, 'waterfall',null);
-- INSERT INTO IsOfGeology (park_id, name, description) VALUES(4, 'crave',null);
-- INSERT INTO IsOfGeology (park_id, name, description) VALUES(4, 'tundra',null);




-- -- Populating data #5
-- INSERT INTO NationalPark(id, name, history, url, size) VALUES(5,'Masai Mara National Reserve','It is globally famous for its exceptional population of Masai lions, African leopards and Tanzanian cheetahs, and the annual migration of zebra, Thomson''s gazelle, and wildebeest to and from the Serengeti every year from July to October, known as the Great Migration.',
--     'http://www.maasaimara.com/', 580);
-- INSERT INTO PriceInfo(tTime, people_group, price, id) VAlUES('20170101','Adults',80 , 5); --dollars
-- INSERT INTO PriceInfo(tTime, people_group, price, id)VALUES('20170101','Children',30,5);
-- INSERT INTO IsInCountry(park_id, country_name) VALUES(5, 'Kenya');
-- INSERT INTO VisitorStats(year) VALUES(2007);
-- INSERT INTO HasStats(park_id, year, num_visitor) VALUES(5, 2007,290000 );
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(5, 'migration safari',null);
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(5, 'elephants',null);
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(5, 'kilimanjaro',null);
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(5, 'sky dive',null);
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(5, 'sky diving',null);
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(5, 'big cat',null);
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(5, 'lion',null);
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(5, 'balloon trip',null);
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(5, 'rhino',null);
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(5, 'sandy beach',null);
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(5, 'maasai culture',null);
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(5, 'flamingos',null);
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(5, 'kiss a giraffe',null);
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(5, 'golf',null);
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(5, 'zebra',null);
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(5, 'wildlife',null);
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(5, 'bird',null);
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(5, 'mara river',null);
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(5, 'wildlife',null);

-- INSERT INTO IsOfClimate(name, park_id, maxtemp, mintemp)  VALUES('tropical savanna climate', 5, 30, 15); 
-- INSERT INTO IsOfGeology (park_id, name, description) VALUES(5, 'rainfall',null);
-- INSERT INTO IsOfGeology (park_id, name, description) VALUES(5, 'terrain',null);
-- INSERT INTO IsOfGeology (park_id, name, description) VALUES(5, 'grassland',null);
-- INSERT INTO IsOfGeology (park_id, name, description) VALUES(5, 'river',null);
-- INSERT INTO IsOfGeology (park_id, name, description) VALUES(5, 'swamp',null);




-- -- Populating data #6
-- INSERT INTO NationalPark(id, name, history, url, size) VALUES(6,'Kruger National Park','Kruger National Park is one of the largest game reserves in Africa. The park is part of the Kruger to Canyons Biosphere an area designated by the United Nations Educational, Scientific and Cultural Organization (UNESCO) as an International Man and Biosphere Reserve.',
--     'https://www.sanparks.org/parks/kruger', 7523);
-- INSERT INTO PriceInfo(tTime, people_group, price, id) VAlUES('20170101','Adults', 24, 6); --dollars
-- INSERT INTO PriceInfo(tTime, people_group, price, id)VALUES('20170101','Children',12,6);
-- INSERT INTO IsInCountry(park_id, country_name) VALUES(6, 'South Africa');
-- INSERT INTO HasStats(park_id, year, num_visitor) VALUES(6, 2014,4167216);
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(6, 'buffalo',null);
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(6, 'elephant', null);
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(6, 'leopard',null);
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(6, 'lion', null);
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(6, 'rhino',null);
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(6, 'bird', null);
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(6, 'tree',null);
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(6, 'the big five', ' Buffalo, Elephant, Leopard, Lion and Rhino');
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(6, 'the little five', 'Buffalo Weaver, Elephant Shrew, Leopard Tortoise, Ant Lion and Rhino Beetle');
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(6, 'Five Trees', 'Baobab, Fever Tree, Knob Thorn, Marula, Mopane');
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(6, 'wild trails', null);
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(6, 'game drivers',null);
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(6, 'guided walks', null);
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(6, 'mountain biking',null);
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(6, 'backpacking', null);
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(6, 'eco-trails', null);
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(6, 'golf',null);
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(6, 'birding', null);
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(6, 'swimming', null);
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(6, 'camps',null);
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(6, 'picnic', null);


-- INSERT INTO IsOfClimate(name, park_id, maxtemp, mintemp)  VALUES('tropical savanna climate', 6, 30, 8); 
-- INSERT INTO IsOfGeology (park_id, name, description) VALUES(6, 'flora',null);
-- INSERT INTO IsOfGeology (park_id, name, description) VALUES(6, 'fauna',null);
-- INSERT INTO IsOfGeology (park_id, name, description) VALUES(6, 'basalt',null);
-- INSERT INTO IsOfGeology (park_id, name, description) VALUES(6, 'conglomerate',null);
-- INSERT INTO IsOfGeology (park_id, name, description) VALUES(6, 'gabbro',null);
-- INSERT INTO IsOfGeology (park_id, name, description) VALUES(6, 'granite',null);
-- INSERT INTO IsOfGeology (park_id, name, description) VALUES(6, 'ryolite',null);
-- INSERT INTO IsOfGeology (park_id, name, description) VALUES(6, 'sand deposits',null);


-- INSERT INTO Geology (name, description) VALUES('fairy chimneys','fairy chimneys were formed when lava covering the tuff (consolidated volcanic ash) gave way along preexisting cracks of sloping areas and became isolated pinnacles. They can attain a height of up to forty meters, have conical shapes and consist of caps of harder rock resting on pillars of softer rock.');
-- INSERT INTO Geology (name, description) VALUES('lowland',null);
-- INSERT INTO Geology (name, description) VALUES('rivers',null);
-- INSERT INTO Geology (name, description) VALUES('black sand',null);
-- INSERT INTO Geology (name, description) VALUES('ice',null);
-- INSERT INTO Geology (name, description) VALUES('snow',null);
-- INSERT INTO Geology (name, description) VALUES('glacier',null);
-- INSERT INTO Geology (name, description) VALUES('mountain',null);
-- INSERT INTO Geology (name, description) VALUES('quicksand',null);
-- INSERT INTO Geology (name, description) VALUES('waterfall',null);
-- INSERT INTO Geology (name, description) VALUES('crave',null);
-- INSERT INTO Geology (name, description) VALUES('tundra',null);
-- INSERT INTO Geology (name, description) VALUES('rainfall',null);
-- INSERT INTO Geology (name, description) VALUES('terrain',null);
-- INSERT INTO Geology (name, description) VALUES('grassland',null);
-- INSERT INTO Geology (name, description) VALUES('river',null);
-- INSERT INTO Geology (name, description) VALUES('swamp',null);
-- INSERT INTO Geology (name, description) VALUES('flora',null);
-- INSERT INTO Geology (name, description) VALUES('fauna',null);
-- INSERT INTO Geology (name, description) VALUES('basalt',null);
-- INSERT INTO Geology (name, description) VALUES('conglomerate',null);
-- INSERT INTO Geology (name, description) VALUES('gabbro',null);
-- INSERT INTO Geology (name, description) VALUES('granite',null);
-- INSERT INTO Geology (name, description) VALUES('ryolite',null);
-- INSERT INTO Geology (name, description) VALUES('sand deposits',null);


-- --Rec data
-- INSERT INTO Recreation(name) VALUES('camping');
-- INSERT INTO Recreation(name) VALUES('fishing');
-- INSERT INTO Recreation(name)VALUES ('birdwatching');
-- INSERT INTO Recreation(name)VALUES ('bushwalking');
-- INSERT INTO Recreation(name)VALUES ('sunrise');
-- INSERT INTO Recreation(name) VALUES('open air museum');
-- INSERT INTO Recreation(name) VALUES('church');
-- INSERT INTO Recreation(name) VALUES('fairy chimneys');
-- INSERT INTO Recreation(name) VALUES('underground');
-- INSERT INTO Recreation(name) VALUES('hot air balloon');
-- INSERT INTO Recreation(name) VALUES('hiking');
-- INSERT INTO Recreation(name) VALUES('glacier walk');
-- INSERT INTO Recreation(name) VALUES('ice craving tour');
-- INSERT INTO Recreation(name) VALUES('sight seeing');
-- INSERT INTO Recreation(name) VALUES('row boat');
-- INSERT INTO Recreation(name) VALUES('hafragilsfoss');
-- INSERT INTO Recreation(name) VALUES('air tours');
-- INSERT INTO Recreation(name) VALUES('boat tours');
-- INSERT INTO Recreation(name) VALUES('climbing');
-- INSERT INTO Recreation(name) VALUES('wildlife');
-- INSERT INTO Recreation(name) VALUES('aurora borealis');
-- INSERT INTO Recreation(name) VALUES('midnight sun');
-- INSERT INTO Recreation(name) VALUES('migration safari');
-- INSERT INTO Recreation(name) VALUES('elephants');
-- INSERT INTO Recreation(name) VALUES('kilimanjaro');
-- INSERT INTO Recreation(name) VALUES('sky diving');
-- INSERT INTO Recreation(name) VALUES('sky dive');
-- INSERT INTO Recreation(name) VALUES('big cat');
-- INSERT INTO Recreation(name) VALUES('lion');
-- INSERT INTO Recreation(name) VALUES('balloon trip');
-- INSERT INTO Recreation(name) VALUES('rhino');
-- INSERT INTO Recreation(name) VALUES('sandy beach');
-- INSERT INTO Recreation(name) VALUES('maasai culture');
-- INSERT INTO Recreation(name) VALUES('flamingos');
-- INSERT INTO Recreation(name) VALUES('kiss a giraffe');
-- INSERT INTO Recreation(name) VALUES('golf');
-- INSERT INTO Recreation(name) VALUES('zebra');
-- INSERT INTO Recreation(name) VALUES('bird');
-- INSERT INTO Recreation(name) VALUES('mara river');
-- INSERT INTO Recreation(name) VALUES('buffalo');
-- INSERT INTO Recreation(name) VALUES('leopard');
-- INSERT INTO Recreation(name) VALUES('tree');
-- INSERT INTO Recreation(name) VALUES('the big five');

-- INSERT INTO Recreation(name) VALUES('the little five');
-- INSERT INTO Recreation(name) VALUES('five trees');
-- INSERT INTO Recreation(name) VALUES('wild trails');
-- INSERT INTO Recreation(name) VALUES('game drivers');
-- INSERT INTO Recreation(name) VALUES('guided walks');
-- INSERT INTO Recreation(name) VALUES('mountain biking');
-- INSERT INTO Recreation(name) VALUES('backpacking');
-- INSERT INTO Recreation(name) VALUES('eco-trails');
-- INSERT INTO Recreation(name) VALUES('birding');
-- INSERT INTO Recreation(name) VALUES('swimming');
-- INSERT INTO Recreation(name) VALUES('camps');
-- INSERT INTO Recreation(name) VALUES('picnic');


-- --country
-- INSERT INTO Country(name, language, continent) VALUES('Australia', 'English', 'Australia');
-- INSERT INTO Country (name, language, continent) VALUES('USA','English','North America');
-- INSERT INTO Country (name, language, continent) VALUES('Turkey','Turkish, Arabic','Europe');
-- INSERT INTO Country (name, language, continent) VALUES('Iceland','Icelandic, Danish, Norwegian, Swedish','Europe');
-- INSERT INTO Country (name, language, continent) VALUES('Kenya','English, Swahili','Africa');
-- INSERT INTO Country (name, language, continent) VALUES('South Africa',' Afrikaans, English, Ndebele, Northern Sotho, Sotho, Swazi, Tsonga, Tswana, Venda, Xhosa and Zulu','Africa');






-- -- Populating data #7
-- INSERT INTO NationalPark(id, name, history, url, size) VALUES(7,'Lençóis Maranhenses National Park Parque Lençóis Maranhenses','',
--     'https://parquelencois.com.br/', 598);
-- INSERT INTO PriceInfo(tTime, people_group, price, id) VAlUES('','', , ); --dollars
-- INSERT INTO PriceInfo(tTime, people_group, price, id)VALUES('','',,);
-- INSERT INTO PriceInfo(tTime, people_group, price, id) VALUES('','',,);
-- INSERT INTO Country (name, language, continent) VALUES('Brazil','Portuguese','South America');

-- INSERT INTO IsInCountry(park_id, country_name) VALUES(, '');
-- INSERT INTO VisitorStats(year) VALUES();
-- INSERT INTO HasStats(park_id, year, num_visitor) VALUES(, , );
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(7, 'Cabure','bath in the sea');
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(7, 'Mandacaru fishing', '');
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(7, 'beach', '');
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(7, 'fishing', '');
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(7, '', '');
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(7, '', '');
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(7, '', '');
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(7, '', '');
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(7, '', '');
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(7, '', '');
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(7, '', '');
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(7, '', '');

-- INSERT INTO IsOfClimate(name, park_id, maxtemp, mintemp)  VALUES('', , , ); 
-- INSERT INTO IsOfGeology (park_id, name, description) VALUES(7, 'low flat flooded land',null);
-- INSERT INTO IsOfGeology (park_id, name, description) VALUES(7, 'discrete sand dunes',null);
-- INSERT INTO IsOfGeology (park_id, name, description) VALUES(7, 'desert',null);
-- INSERT INTO IsOfGeology (park_id, name, description) VALUES(7, 'sand',null);
-- INSERT INTO IsOfGeology (park_id, name, description) VALUES(7, 'freshwater lagoon',null);


-- -- Populating data #8
-- INSERT INTO NationalPark(id, name, history, url, size) VALUES(,'','',
--     '', );
-- INSERT INTO PriceInfo(tTime, people_group, price, id) VAlUES('','', , ); --dollars
-- INSERT INTO PriceInfo(tTime, people_group, price, id)VALUES('','',,);
-- INSERT INTO PriceInfo(tTime, people_group, price, id) VALUES('','',,);
-- INSERT INTO Country (name, language, continent) VALUES('','','');
-- INSERT INTO IsInCountry(park_id, country_name) VALUES(, '');
-- INSERT INTO VisitorStats(year) VALUES();
-- INSERT INTO HasStats(park_id, year, num_visitor) VALUES(, , );
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(, '',''
-- );
-- INSERT INTO HasRecreation(park_id, recreation_name, description) VALUES(, '', ''
-- );
-- INSERT INTO IsOfClimate(name, park_id, maxtemp, mintemp)  VALUES('', , , ); 
-- INSERT INTO IsOfGeology (park_id, name, description) VALUES(, '',''
-- );
