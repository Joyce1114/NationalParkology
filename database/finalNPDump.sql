--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.2

-- Started on 2017-04-26 04:22:16 EDT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2483 (class 1262 OID 16451)
-- Name: NP; Type: DATABASE; Schema: -; Owner: postgres
--

-- CREATE DATABASE NP WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';


ALTER DATABASE NP OWNER TO postgres;

\connect NP

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12655)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2485 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 192 (class 1259 OID 16540)
-- Name: Climate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE Climate (
    name character varying(50) NOT NULL,
    description character varying(1024)
);


ALTER TABLE Climate OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 16470)
-- Name: Continent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE Continent (
    name character varying(50) NOT NULL
);


ALTER TABLE Continent OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 16475)
-- Name: Country; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE Country (
    name character varying(16) NOT NULL,
    language character varying(100),
    continent character varying(30)
);


ALTER TABLE Country OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 16532)
-- Name: Geology; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE Geology (
    name character varying(16) NOT NULL,
    description character varying(1024)
);


ALTER TABLE Geology OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 16571)
-- Name: HasRecreation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE HasRecreation (
    recreation_name character varying(1024),
    description character varying(1024),
    park_id integer NOT NULL
);


ALTER TABLE HasRecreation OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 16556)
-- Name: HasStats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE HasStats (
    year integer NOT NULL,
    num_visitor integer,
    park_id integer NOT NULL
);


ALTER TABLE HasStats OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 16485)
-- Name: IsInCountry; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE IsInCountry (
    country_name character varying(50) NOT NULL,
    park_id integer NOT NULL
);


ALTER TABLE IsInCountry OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 16587)
-- Name: IsOfClimate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE IsOfClimate (
    Name character varying(50) NOT NULL,
    park_id integer NOT NULL
);


ALTER TABLE IsOfClimate OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 16600)
-- Name: IsOfGeology; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE IsOfGeology (
    name character varying NOT NULL,
    park_id integer NOT NULL
);


ALTER TABLE IsOfGeology OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 16452)
-- Name: NationalPark; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE NationalPark (
    name character varying(50) NOT NULL,
    history character varying(500),
    url character varying(300),
    imgurl character varying(300),
    id integer NOT NULL
);


ALTER TABLE NationalPark OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 16460)
-- Name: PriceInfo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE PriceInfo (
    price double precision,
    id integer NOT NULL
);


ALTER TABLE PriceInfo OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 16548)
-- Name: Recreation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE Recreation (
    name character varying(1024) NOT NULL
);


ALTER TABLE Recreation OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 16498)
-- Name: VisitorStats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE VisitorStats (
    year integer NOT NULL
);


ALTER TABLE VisitorStats OWNER TO postgres;

--
-- TOC entry 2473 (class 0 OID 16540)
-- Dependencies: 192
-- Data for Name: Climate; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO Climate VALUES ('Tropical Wet', 'Temperatures stay the same throughout most of the year because these areas are found along the equator and receive constant direct sunlight.  The average temperature is about 80 degrees (27 Celsius) as you can see from the line below.  The temperatures feel hotter because the humidity is usually very high.  Humidity is the amount of water in the air.  Daytime temperatures rarely go over 93 degrees, and nighttime temperatures rarely go below 68 degrees. ');
INSERT INTO Climate VALUES ('Tropical Wet and Dry', 'During the wet season, temperatures average about 77 degrees.  During the dry season, temperatures average about 68 degrees.  The temperatures stay high throughout the year because of the latitude where this climate occurs.  Areas near the equator receive constant direct sunlight and therefore, heat.   The slight difference in temperature is enough to change the wind patterns and keep this area dry for much of the year, until the winds shift and the rainy season begins.  ''),');
INSERT INTO Climate VALUES ('Humid Subtropical', 'a type of terrain with little to no vegetation. This is normally because it also has very little water, although other factors, such as poisoning with salt and similar substances, or just extreme exhaustion of the soil may also be a factor.
Although deserts are generally thought of as hot places, many are not - the Gobi and similar deserts (including those in the Artic and Antartic) are famously chilly places and the Bledow Desert in Poland manages to exist in a temperate region. Although heat often does play a major part in the existence of a desert, and area can dry out just as easily because its ''rainfall'' rarely, if ever, melts or just because it is in the rainshadow of a mountain range and receives little or no rain in the first place.''),
');
INSERT INTO Climate VALUES ('Continental Humid', 'A forest will tend to be sparsely settled compared to agricultural land (since, if it were not sparsely settled, the trees would have been felled and the land turned over to agriculture), but may still contain villages and towns, let alone smaller habitations.
A forest may - or may not - be managed by a forester of one kind or another.');
INSERT INTO Climate VALUES ('Mediterranean', 'The climate is known for warm to hot, dry summers and mild to cool, wet winters. Winter temperatures are usually between 30 and 65 degrees.  Summer months all average above 50 degrees.  The warmest month averages about 72 degrees.  The cause of this climate is directly related to large bodies of water such as the Mediterranean Sea and ocean currents.  During the summer, cold currents keep the climate mild and dry.  Ocean currents shift as the seasons change. During the winter the water that was warmed up all summer moves in and keeps the land warm and often brings rain.  ''),');
INSERT INTO Climate VALUES ('Tundra', 'Winters are very harsh in Tundra climate.  Winter months temperatures are usually between -18 and -50 degrees.  Summer temperatures range from 35-50 degrees.  High latitudes are the main cause of of the low temperatures.  These areas mainly receive indirect sunlight.  Indirect sunlight delivers light, but little heat.  Even during the summer, Tundra mainly receives indirect sunlight, which is why temperatures rarely go above 50 degrees.  ''),');
INSERT INTO Climate VALUES ('Ice Cap', 'Ice Cap is the coldest climate on Earth.  Antarctica is usually colder than the Arctic.  The warmest month averages about -16  degrees.  The coldest month averages about -70 degrees.  During the winter, temperatures regularly reach -90 degrees. The coldest temperature ever recorded was -128.6 degrees.  Ice Cap temperatures are so low because of its latitude near the poles.  These areas receive only indirect sunlight, and during winter it doesn''t even receive indirect sunlight!   During the winter this area is in total darkness (see image above). ');
INSERT INTO Climate VALUES ('Desert', 'Temperatures can reach as high as 130 degrees or as low as negative 30 degrees.  The temperatures will depend on the latitude of the desert.  The farther from the equator the colder they will be.  On the map above you can see areas of cold desert (light red) and hot desert (dark red), and distance from the equator is clearly the cause.  ''),');
INSERT INTO Climate VALUES ('Semiarid', 'The temperatures in Semiarid climate depend on the latitude.  They will follow the same temperature patterns as the surrounding area.  For example in northern United States the Semiarid climate can be very cold, especially during winter.  Temperatures can be as low as -15 degrees.  However, it the African Sahel or northern Australia, temperatures remain high throughout the year, so latitude is clearly the cause of temperature in Semiarid climate. '')');
INSERT INTO Climate VALUES ('Arid', 'Temperatures can reach as high as 130 degrees or as low as negative 30 degrees.  The temperatures will depend on the latitude of the desert.  The farther from the equator the colder they will be.  On the map above you can see areas of cold desert (light red) and hot desert (dark red), and distance from the equator is clearly the cause.  ''),');


--
-- TOC entry 2468 (class 0 OID 16470)
-- Dependencies: 187
-- Data for Name: Continent; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO Continent VALUES ('North America');
INSERT INTO Continent VALUES ('Latin America');
INSERT INTO Continent VALUES ('Asia');
INSERT INTO Continent VALUES ('Africa');
INSERT INTO Continent VALUES ('Europe');
INSERT INTO Continent VALUES ('Australia');
INSERT INTO Continent VALUES ('Antarctica');


--
-- TOC entry 2469 (class 0 OID 16475)
-- Dependencies: 188
-- Data for Name: Country; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO Country VALUES ('USA', 'English', 'North America');
INSERT INTO Country VALUES('Iceland','Icelandic, Danish, Norwegian, Swedish','Europe');
INSERT INTO Country VALUES('Australia', 'English', 'Australia');
INSERT INTO Country VALUES('Turkey','Turkish, Arabic','Europe');
INSERT INTO Country VALUES('Iceland','Icelandic, Danish, Norwegian, Swedish','Europe');
INSERT INTO Country VALUES('Kenya','English, Swahili','Africa');
INSERT INTO Country VALUES('South Africa',' Afrikaans, English, Ndebele, Northern Sotho, Sotho, Swazi, Tsonga, Tswana, Venda, Xhosa and Zulu','Africa');



--
-- TOC entry 2472 (class 0 OID 16532)
-- Dependencies: 191
-- Data for Name: Geology; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO Geology VALUES ('Canyon', 'Canyon');
INSERT INTO Geology VALUES ('Cave/Crevice', 'Natural opening within a rock formation which is large enough to permit a human to enter.A fracture is any separation in a geologic formation, such as a joint or

a fault that divides the rock into two or more pieces. A fracture will sometimes form a deep fissure or crevice in the rock. Fractures are commonly caused by stress exceeding the rock strength, causing the rock to lose cohesion along its weakest plane.');
INSERT INTO Geology VALUES ('Desert', 'a type of terrain with little to no vegetation. This is normally because it also has very little water, although other factors, such as poisoning with salt and similar substances, or just extreme exhaustion of the soil may also be a factor.

Although deserts are generally thought of as hot places, many are not - the Gobi and similar deserts (including those in the Artic and Antartic) are famously chilly places and the Bledow Desert in Poland manages to exist in a temperate region. Although heat often does play a major part in the existence of a desert, and area can dry out just as easily because its ''rainfall'' rarely, if ever, melts or just because it is in the rainshadow of a mountain range and receives little or no rain in the first place.''),

');
INSERT INTO Geology VALUES ('Forest', 'A forest will tend to be sparsely settled compared to agricultural land (since, if it were not sparsely settled, the trees would have been felled and the land turned over to agriculture), but may still contain villages and towns, let alone smaller habitations.

A forest may - or may not - be managed by a forester of one kind or another.');
INSERT INTO Geology VALUES ('Glacier', ' Glaciers are large masses of persistent ice (surviving over a time scale of many years). Glaciers are primarily found in the Antarctic  though much slower - a fast glacier may move a couple of meters per day (though the Jakobshavn Glacier in Greenland moves up to 20 meters a day). Fast-moving glaciers can even produce ''''glacial earthquakes''''.');
INSERT INTO Geology VALUES ('Glaciers flow', ' rather like rivers or lava flows');
INSERT INTO Geology VALUES ('Lake', 'Lakes are usually very important to the societies that live around them, serving as a source of food, water and transport - the Sea of Galilee3 - should be familiar to us all, as should the Dead Sea (actually a salt lake) which despite being dead (as the name implies) serves as a salt mine for the whole region.''),');
INSERT INTO Geology VALUES ('Lava Field', 'Lava Field');
INSERT INTO Geology VALUES ('Mountain', 'A monadnock, inselberg or kopje is a short but steep mountain rising out of lower or flatter terrain. Geologically, they are formed when a harder, erosion-resistant rock is surrounded by softer more readily eroded rock. After many years of weathering, the hard rock remains tall and unaffected, while the softer materials have worn far away. The resulting terrain is a steep cliff-face a little like a plateau, often adorned with vegetation on the top.

In arid or over-farmed environments, it''s quite common for a monadnock to be a refuge for wildlife. The high rock retains topsoil and thick vegetation, where the lower more heavily traveled and eroded lands are barren in comparison. Steep cliffs at the edges of the monadnock serve to isolate the local lifeforms.');
INSERT INTO Geology VALUES ('Volcano', 'Volcano');
INSERT INTO Geology VALUES ('Plain', 'Plain');
INSERT INTO Geology VALUES ('Swamp', 'A swamp is a region that mixes solid land with shallow bodies of water. The water is very slow moving, and covered by abundant vegetation which in some cases may be hard to distinguish from solid land merely by looking at it, thus making movement very difficult without (flat) boats The animals living in a swamp are likely to be abundant and diverse, and usually swamps are plagued by stinging insects such as mosquitoes. Leeches are also common in most freshwater swamps.

Swamps can occur in any suitable climate - large areas of tundra become swamp during the summer thaw - and can vary in vegetative cover from little but tussock grass (as found in many peat bogs) to a thick, jungle like tree cover.'')');

INSERT INTO Geology VALUES ('Crave','Crave');
INSERT INTO Geology VALUES ('Quicksand','Quicksand');
INSERT INTO Geology VALUES ('Sand deposits','Sand deposits');
INSERT INTO Geology VALUES ('Granite','Granite');
INSERT INTO Geology VALUES ('Flora','Flora');

--
-- TOC entry 2476 (class 0 OID 16571)
-- Dependencies: 195
-- Data for Name: HasRecreation; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO HasRecreation VALUES ('volunteer program', NULL, 1);
INSERT INTO HasRecreation VALUES ('outdoor recreation', 'What ever type of outdoor recreation you enjoy chances are Big South Fork National River and Recreation Area has a place you can do it.  The hardest part of your visit may be deciding which trail overlook historic site natural feature or program to try next!', 1);
INSERT INTO HasRecreation VALUES ('sunset', 'Want to watch a sunset?  Do you get up early enough to enjoy a sunrise?  There are overlooks all along the Big South Fork River gorge where you can catch the suns first or last rays of the day.', 1);
INSERT INTO HasRecreation VALUES ('hiking', 'Hiking on your agenda?  You can choose from any number of hikes ranging from a lazy stroll along the river to a multi-day hike through the backcountry.', 1);
INSERT INTO HasRecreation VALUES ('horse riding', 'Do you have a horse?  Big South Fork has miles of horse trails, stabling facilities at Bandy Creek Stables and even two equestrian campgrounds at Station Camp in Tenn. and Bear Creek in Ky.', 1);
INSERT INTO HasRecreation VALUES ('coal mine visit', 'Want to visit a company town and enter a coal mine?  Visit the Blue Heron Mining Community a coal mining town once owned by the Stearns Coal and Lumber Company.  You can even ride the Big South Fork Scenic Railway from Stearns into Blue Heron. ', 1);
INSERT INTO HasRecreation VALUES ('row boat', 'Looking for something a little more extreme.  Try whitewater rafting the Big South Fork River, mountain biking through the backcountry or rock climbing on the miles of cliff lines throughout the park.', 1);
INSERT INTO HasRecreation VALUES ('Biking', 'Looking for something a little more extreme.  Try whitewater rafting the Big South Fork River, mountain biking through the backcountry or rock climbing on the miles of cliff lines throughout the park.', 1);
INSERT INTO HasRecreation VALUES ('rock climbing', 'Looking for something a little more extreme.  Try whitewater rafting the Big South Fork River, mountain biking through the backcountry or rock climbing on the miles of cliff lines throughout the park.', 1);
INSERT INTO HasRecreation VALUES ('Explore This Park', NULL, 2);
INSERT INTO HasRecreation VALUES ('Solar eclipse', '2017 Solar Eclipse at Yellowstone', 3);
INSERT INTO HasRecreation VALUES ('hiking', NULL, 3);
INSERT INTO HasRecreation VALUES ('Camping', NULL, 3);
INSERT INTO HasRecreation VALUES ('Biking', NULL, 3);
INSERT INTO HasRecreation VALUES ('row boat', NULL, 3);
INSERT INTO HasRecreation VALUES ('Fishing', NULL, 3);
INSERT INTO HasRecreation VALUES ('Camping', NULL, 4);
INSERT INTO HasRecreation VALUES ('Backpacking', NULL, 4);
INSERT INTO HasRecreation VALUES ('Photography', NULL, 4);
INSERT INTO HasRecreation VALUES ('Birdwatching', NULL, 4);
INSERT INTO HasRecreation VALUES ('Fishing', NULL, 4);
INSERT INTO HasRecreation VALUES ('horse riding', NULL, 4);
INSERT INTO HasRecreation VALUES ('hiking', NULL, 5);
INSERT INTO HasRecreation VALUES ('Fishing', NULL, 5);
INSERT INTO HasRecreation VALUES ('hiking', NULL, 6);
INSERT INTO HasRecreation VALUES ('Fishing', NULL, 6);
INSERT INTO HasRecreation VALUES ('Birdwatching', NULL, 6);
INSERT INTO HasRecreation VALUES ('hiking', NULL, 7);
INSERT INTO HasRecreation VALUES ('sea shore', NULL, 8);
INSERT INTO HasRecreation VALUES ('Birdwatching', NULL, 8);
INSERT INTO HasRecreation VALUES ('hiking', NULL, 9);
INSERT INTO HasRecreation VALUES ('Camping', NULL, 9);
INSERT INTO HasRecreation VALUES ('swimming', NULL, 10);
INSERT INTO HasRecreation VALUES ('hiking', NULL, 11);
INSERT INTO HasRecreation VALUES ('stargazing', NULL, 12);
INSERT INTO HasRecreation VALUES ('scenic drive', NULL, 12);
INSERT INTO HasRecreation VALUES ('american culture', NULL, 13);
INSERT INTO HasRecreation VALUES ('swamps', NULL, 13);
INSERT INTO HasRecreation VALUES ('waterfall', NULL, 13);
INSERT INTO HasRecreation VALUES ('Mount Rushmore Audio Tour', NULL, 14);
INSERT INTO HasRecreation VALUES ('hiking', NULL, 15);
INSERT INTO HasRecreation VALUES ('american culture', NULL, 15);
INSERT INTO HasRecreation VALUES ('hiking', NULL, 16);
INSERT INTO HasRecreation VALUES ('Camping', NULL, 16);
INSERT INTO HasRecreation VALUES ('hiking', NULL, 17);
INSERT INTO HasRecreation VALUES ('Camping', NULL, 17);
INSERT INTO HasRecreation VALUES ('swimming', NULL, 18);
INSERT INTO HasRecreation VALUES ('Camping', NULL, 18);
INSERT INTO HasRecreation VALUES ('sand', NULL, 19);
INSERT INTO HasRecreation VALUES ('Camping', NULL, 19);
INSERT INTO HasRecreation VALUES ('hiking', NULL, 20);
INSERT INTO HasRecreation VALUES ('Camping', NULL, 20);
INSERT INTO HasRecreation VALUES ('hiking', NULL, 21);
INSERT INTO HasRecreation VALUES ('Camping', NULL, 21);
INSERT INTO HasRecreation VALUES ('Backpacking', NULL, 22);
INSERT INTO HasRecreation VALUES ('Camping', NULL, 22);
INSERT INTO HasRecreation VALUES ('american culture', NULL, 23);
INSERT INTO HasRecreation VALUES ('hiking', NULL, 24);
INSERT INTO HasRecreation VALUES ('Camping', NULL, 24);
INSERT INTO HasRecreation VALUES ('Camping', NULL, 25);
INSERT INTO HasRecreation VALUES ('hiking', NULL, 25);
INSERT INTO HasRecreation VALUES ('row boat', NULL, 26);
INSERT INTO HasRecreation VALUES ('Fishing', NULL, 27);
INSERT INTO HasRecreation VALUES ('swimming', NULL, 27);
INSERT INTO HasRecreation VALUES ('kayaking', NULL, 27);
INSERT INTO HasRecreation VALUES ('Biking', NULL, 27);
INSERT INTO HasRecreation VALUES ('Camping', NULL, 28);
INSERT INTO HasRecreation VALUES ('Photography', NULL, 28);
INSERT INTO HasRecreation VALUES ('Fishing', NULL, 28);
INSERT INTO HasRecreation VALUES ('row boat', NULL, 28);
INSERT INTO HasRecreation VALUES ('ski', NULL, 28);
INSERT INTO HasRecreation VALUES ('row boat', NULL, 29);
INSERT INTO HasRecreation VALUES ('glacier', NULL, 29);
INSERT INTO HasRecreation VALUES ('hiking', NULL, 30);
INSERT INTO HasRecreation VALUES ('Camping', NULL, 30);
INSERT INTO HasRecreation VALUES ('stargazing', NULL, 31);
INSERT INTO HasRecreation VALUES ('open air museum','Housing the best preserved wall paintings (frescoes), this whole valley is full of pretty chapels and monasteries.', 31);
INSERT INTO HasRecreation VALUES ('church', 'Picturesque views, thrilling feelings appears when you enter inside ancient orthodox churches', 31);
INSERT INTO HasRecreation VALUES ('fairy chimneys', 'A hoodoo (also called a tent rock, fairy chimney or earth pyramid) is a tall, thin spire of rock that protrudes from the bottom of an arid drainage basin or badland.', 31);
INSERT INTO HasRecreation VALUES ('underground', 'here is an underground city in Goreme, built by ancient Hittites tribe for protection against enemies.', 31);
INSERT INTO HasRecreation VALUES ('hot air balloon', 'Cappadocia is known around the world as one of the best places to fly with hot air balloons.', 31);
INSERT INTO HasRecreation VALUES ('hiking',NULL, 32);
INSERT INTO HasRecreation VALUES ('rock climbing', NULL, 32);
INSERT INTO HasRecreation VALUES ('Camping', NULL, 32);
INSERT INTO HasRecreation VALUES ('wildlife',NULL, 32);
INSERT INTO HasRecreation VALUES ('sky dive',NULL, 33);
INSERT INTO HasRecreation VALUES ('rock climbing', NULL, 33);
INSERT INTO HasRecreation VALUES ('Camping', NULL, 33);
INSERT INTO HasRecreation VALUES ('wildlife',NULL, 33);
INSERT INTO HasRecreation VALUES ('Biking', NULL, 34);
INSERT INTO HasRecreation VALUES ('Camping', NULL, 34);
INSERT INTO HasRecreation VALUES ('wildlife',NULL, 34);

--
-- TOC entry 2475 (class 0 OID 16556)
-- Dependencies: 194
-- Data for Name: HasStats; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2470 (class 0 OID 16485)
-- Dependencies: 189
-- Data for Name: IsInCountry; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO IsInCountry VALUES ('USA', 1);
INSERT INTO IsInCountry VALUES ('USA', 2);
INSERT INTO IsInCountry VALUES ('USA', 3);
INSERT INTO IsInCountry VALUES ('USA', 4);
INSERT INTO IsInCountry VALUES ('USA', 5);
INSERT INTO IsInCountry VALUES ('USA', 6);
INSERT INTO IsInCountry VALUES ('USA', 7);
INSERT INTO IsInCountry VALUES ('USA', 8);
INSERT INTO IsInCountry VALUES ('USA', 9);
INSERT INTO IsInCountry VALUES ('USA', 10);
INSERT INTO IsInCountry VALUES ('USA', 11);
INSERT INTO IsInCountry VALUES ('USA', 12);
INSERT INTO IsInCountry VALUES ('USA', 13);
INSERT INTO IsInCountry VALUES ('USA', 14);
INSERT INTO IsInCountry VALUES ('USA', 15);
INSERT INTO IsInCountry VALUES ('USA', 16);
INSERT INTO IsInCountry VALUES ('USA', 17);
INSERT INTO IsInCountry VALUES ('USA', 18);
INSERT INTO IsInCountry VALUES ('USA', 19);
INSERT INTO IsInCountry VALUES ('USA', 20);
INSERT INTO IsInCountry VALUES ('USA', 21);
INSERT INTO IsInCountry VALUES ('USA', 22);
INSERT INTO IsInCountry VALUES ('USA', 23);
INSERT INTO IsInCountry VALUES ('USA', 24);
INSERT INTO IsInCountry VALUES ('USA', 25);
INSERT INTO IsInCountry VALUES ('USA', 26);
INSERT INTO IsInCountry VALUES ('USA', 27);
INSERT INTO IsInCountry VALUES ('USA', 28);
INSERT INTO IsInCountry VALUES ('USA', 29);
INSERT INTO IsInCountry VALUES ('USA', 30);
INSERT INTO IsInCountry VALUES ('Turkey', 31);
INSERT INTO IsInCountry VALUES ('Iceland', 32);
INSERT INTO IsInCountry VALUES ('Kenya', 33);
INSERT INTO IsInCountry VALUES ('South Africa', 34);


--
-- TOC entry 2477 (class 0 OID 16587)
-- Dependencies: 196
-- Data for Name: IsOfClimate; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO IsOfClimate VALUES ('Humid Subtropical', 1);
INSERT INTO IsOfClimate VALUES ('Mediterranean', 2);
INSERT INTO IsOfClimate VALUES ('Humid Subtropical', 3);
INSERT INTO IsOfClimate VALUES ('Mediterranean', 4);
INSERT INTO IsOfClimate VALUES ('Mediterranean', 5);
INSERT INTO IsOfClimate VALUES ('Humid Subtropical', 6);
INSERT INTO IsOfClimate VALUES ('Continental Humid', 7);
INSERT INTO IsOfClimate VALUES ('Continental Humid', 8);
INSERT INTO IsOfClimate VALUES ('Mediterranean', 9);
INSERT INTO IsOfClimate VALUES ('Mediterranean', 10);
INSERT INTO IsOfClimate VALUES ('Continental Humid', 11);
INSERT INTO IsOfClimate VALUES ('Semiarid', 12);
INSERT INTO IsOfClimate VALUES ('Mediterranean', 13);
INSERT INTO IsOfClimate VALUES ('Mediterranean', 14);
INSERT INTO IsOfClimate VALUES ('Mediterranean', 15);
INSERT INTO IsOfClimate VALUES ('Continental Humid', 16);
INSERT INTO IsOfClimate VALUES ('Semiarid', 17);
INSERT INTO IsOfClimate VALUES ('Semiarid', 18);
INSERT INTO IsOfClimate VALUES ('Desert', 19);
INSERT INTO IsOfClimate VALUES ('Desert', 20);
INSERT INTO IsOfClimate VALUES ('Continental Humid', 21);
INSERT INTO IsOfClimate VALUES ('Continental Humid', 22);
INSERT INTO IsOfClimate VALUES ('Continental Humid', 23);
INSERT INTO IsOfClimate VALUES ('Continental Humid', 24);
INSERT INTO IsOfClimate VALUES ('Continental Humid', 25);
INSERT INTO IsOfClimate VALUES ('Semiarid', 26);
INSERT INTO IsOfClimate VALUES ('Semiarid', 27);
INSERT INTO IsOfClimate VALUES ('Ice Cap', 28);
INSERT INTO IsOfClimate VALUES ('Ice Cap', 29);
INSERT INTO IsOfClimate VALUES ('Semiarid', 30);
INSERT INTO IsOfClimate VALUES ('Continental Humid', 31);
INSERT INTO IsOfClimate VALUES ('Ice Cap', 32);
INSERT INTO IsOfClimate VALUES ('Tropical Wet and Dry', 33);
INSERT INTO IsOfClimate VALUES ('Tropical Wet', 34);

--
-- TOC entry 2478 (class 0 OID 16600)
-- Dependencies: 197
-- Data for Name: IsOfGeology; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO IsOfGeology VALUES ('Forest', 1);
INSERT INTO IsOfGeology VALUES ('Plain', 2);
INSERT INTO IsOfGeology VALUES ('Lava Field', 3);
INSERT INTO IsOfGeology VALUES ('Mountain', 4);
INSERT INTO IsOfGeology VALUES ('Cave/Crevice', 5);
INSERT INTO IsOfGeology VALUES ('Plain', 6);
INSERT INTO IsOfGeology VALUES ('Lake', 7);
INSERT INTO IsOfGeology VALUES ('Lake', 8);
INSERT INTO IsOfGeology VALUES ('Mountain', 9);
INSERT INTO IsOfGeology VALUES ('Plain', 10);
INSERT INTO IsOfGeology VALUES ('Lake', 11);
INSERT INTO IsOfGeology VALUES ('Cave/Crevice', 12);
INSERT INTO IsOfGeology VALUES ('Plain', 13);
INSERT INTO IsOfGeology VALUES ('Mountain', 14);
INSERT INTO IsOfGeology VALUES ('Mountain', 15);
INSERT INTO IsOfGeology VALUES ('Lake', 16);
INSERT INTO IsOfGeology VALUES ('Cave/Crevice', 17);
INSERT INTO IsOfGeology VALUES ('Mountain', 18);
INSERT INTO IsOfGeology VALUES ('Desert', 19);
INSERT INTO IsOfGeology VALUES ('Mountain', 20);
INSERT INTO IsOfGeology VALUES ('Lake', 21);
INSERT INTO IsOfGeology VALUES ('Plain', 22);
INSERT INTO IsOfGeology VALUES ('Lake', 23);
INSERT INTO IsOfGeology VALUES ('Mountain', 24);
INSERT INTO IsOfGeology VALUES ('Lake', 25);
INSERT INTO IsOfGeology VALUES ('Mountain', 26);
INSERT INTO IsOfGeology VALUES ('Mountain', 27);
INSERT INTO IsOfGeology VALUES ('Glacier', 28);
INSERT INTO IsOfGeology VALUES ('Glacier', 29);
INSERT INTO IsOfGeology VALUES ('Mountain', 30);
INSERT INTO IsOfGeology VALUES ('Mountain', 31);
INSERT INTO IsOfGeology VALUES ('Glacier', 32);
INSERT INTO IsOfGeology VALUES ('Mountain', 32);
INSERT INTO IsOfGeology VALUES ('Crave', 32);
INSERT INTO IsOfGeology VALUES ('Quicksand', 32);
INSERT INTO IsOfGeology VALUES ('Plain', 33);
INSERT INTO IsOfGeology VALUES ('Desert', 33);
INSERT INTO IsOfGeology VALUES ('Lake', 33);
INSERT INTO IsOfGeology VALUES ('Sand deposits', 34);
INSERT INTO IsOfGeology VALUES ('Granite', 34);
INSERT INTO IsOfGeology VALUES ('Flora', 34);


--
-- TOC entry 2466 (class 0 OID 16452)
-- Dependencies: 185
-- Data for Name: NationalPark; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO NationalPark VALUES ('Big South Fork National River and Recreation Area', 'Encompassing 125,000 acres of the Cumberland Plateau, Big South Fork National River and Recreation Area protects the free-flowing Big South Fork of the Cumberland River and its tributaries. The area boasts miles of scenic gorges and sandstone bluffs, is rich with natural and historic features and has been developed to provide visitors with a wide range of outdoor recreational activities. ', 'https://www.nps.gov/biso/index.htm', 'http://cdn.onlyinyourstate.com/wp-content/uploads/2016/10/5202908723_0bdb2770ef_b.jpg', 1);
INSERT INTO NationalPark VALUES ('Abraham Lincoln Birthplace', 'For over a century people from around the world have come to rural Central Kentucky to honor the humble beginnings of our 16th president, Abraham Lincoln. His early life on Kentucky''s frontier shaped his character and prepared him to lead the nation through Civil War. The country''s first memorial to Lincoln, built with donations from young and old, enshrines the symbolic birthplace cabin.', 'https://www.nps.gov/abli/index.htm', 'https://www.nps.gov/common/uploads/grid_builder/akr/crop16_9/CE200B0A-1DD8-B71B-0B7F92423F967117.jpg?width=950&quality=90&mode=crop', 2);
INSERT INTO NationalPark VALUES ('Yellowstone National Park', 'Visit Yellowstone and experience the world''s first national park. Marvel at a volcano hidden power rising up in colorful hot springs, mudpots, and geysers. Explore mountains, forests, and lakes to watch wildlife and witness the drama of the natural world unfold. Discover the history that led to the conservation of our national treasures for the benefit and enjoyment of the people.', 'https://www.nps.gov/yell/index.htm', 'https://www.nps.gov/common/uploads/grid_builder/imr/crop16_9/DB7F397B-1DD8-B71B-0BCC3874F8109351.jpg?width=950&quality=90&mode=crop', 3);
INSERT INTO NationalPark VALUES ('Yosemite National Park', 'Not just a great valley, but a shrine to human foresight, the strength of granite, the power of glaciers, the persistence of life, and the tranquility of the High Sierra.', 'https://www.nps.gov/yose/index.htm', 'https://www.nps.gov/common/uploads/grid_builder/pwr/crop16_9/2A84C724-1DD8-B71B-0B0F4361A736E640.jpg?width=950&quality=90&mode=crop', 4);
INSERT INTO NationalPark VALUES ('Theodore Roosevelt National Park', 'When Theodore Roosevelt came to Dakota Territory to hunt bison in 1883, he was a skinny, young, spectacled dude from New York. He could not have imagined how his adventure in this remote and unfamiliar place would forever alter the course of the nation. The rugged landscape and strenuous life that TR experienced here would help shape a conservation policy that we still benefit from today. ', 'https://www.nps.gov/thro/index.htm', 'https://www.nps.gov/common/uploads/grid_builder/mwr/crop16_9/C5A4C491-1DD8-B71B-0BBCC15C3FBB77D1.jpg?width=307&quality=90&mode=crop', 5);
INSERT INTO NationalPark VALUES ('Tallgrass Prairie National Preserve', 'Tallgrass prairie once covered 170 million acres of North America. Within a generation the vast majority was developed and plowed under. Today less than 4% remains, mostly here in the Kansas Flint Hills. The preserve protects a nationally significant remnant of the once vast tallgrass prairie and its cultural resources. Here the tallgrass prairie takes its last stand. ', 'https://www.nps.gov/tapr/index.htm', 'https://www.nps.gov/common/uploads/grid_builder/mwr/crop16_9/92080D2B-1DD8-B71B-0BDB95151AD46100.JPG?width=465&quality=90&mode=crop', 6);
INSERT INTO NationalPark VALUES ('Sleeping Bear Dunes National Lakeshore', 'Miles of sand beach, bluffs that tower 450 above Lake Michigan, lush forests, clear inland lakes, unique flora and fauna make up the natural world of Sleeping Bear Dunes. High dunes afford spectacular views across the lake. An island lighthouse, US Life-Saving Service stations, coastal villages, and picturesque farmsteads reflect the park rich maritime, agricultural, and recreational history. ', 'https://www.nps.gov/slbe/index.htm', 'https://www.nps.gov/common/uploads/grid_builder/mwr/crop16_9/238BE30E-1DD8-B71B-0BACF6E5B55CBDEB.jpg?width=950&quality=90&mode=crop', 7);
INSERT INTO NationalPark VALUES ('Point Reyes National Seashore', 'From its thunderous ocean breakers crashing against rocky headlands and expansive sand beaches to its open grasslands, brushy hillsides, and forested ridges, Point Reyes offers visitors over 1500 species of plants and animals to discover. Home to several cultures over thousands of years, the Seashore preserves a tapestry of stories and interactions of people. Point Reyes awaits your exploration. ', 'https://www.nps.gov/pore/index.htm', 'https://www.nps.gov/common/uploads/grid_builder/pwr/crop16_9/E48707D9-1DD8-B71B-0B8B487E5AE0A63E.jpg?width=307&quality=90&mode=crop', 8);
INSERT INTO NationalPark VALUES ('Petrified Forest National Park', 'Did you know that Petrified Forest is more spectacular than ever? While the park has all the wonders known for a century, there are many new adventures and discoveries to share. There are backcountry hikes into areas never open before such as Red Basin and little known areas like the Martha''s Butte. There are new exhibits that bring the stories to life. Come rediscover Petrified Forest! ', 'https://www.nps.gov/pefo/index.htm', 'https://www.nps.gov/common/uploads/grid_builder/imr/crop16_9/69D5EB42-1DD8-B71B-0B4D1DC97B92B948.jpg?width=950&quality=90&mode=crop', 9);
INSERT INTO NationalPark VALUES ('Padre Island National Seashore', 'Padre Island National Seashore separates the Gulf of Mexico from the Laguna Madre, one of a few hypersaline lagoons in the world. The park protects 70 miles of coastline, dunes, prairies, and wind tidal flats teeming with life. It is a safe nesting ground for the Kemp ridley sea turtle and a haven for 380 bird species. It also has a rich history, including the Spanish shipwrecks of 1554. ', 'https://www.nps.gov/pais/index.htm', 'https://www.nps.gov/common/uploads/grid_builder/imr/crop16_9/2AA937AD-1DD8-B71B-0B19AC32B418ABA4.jpg?width=307&quality=90&mode=crop', 10);
INSERT INTO NationalPark VALUES ('Obed Wild & Scenic River', 'The Obed Wild and Scenic River looks much the same today as it did when the first white settlers strolled its banks in the late 1700s. While meagerly populated due to poor farming soil, the river was a hospitable fishing and hunting area for trappers and pioneers. Today, the Obed stretches along the Cumberland Plateau and offers visitors a variety of outdoor recreational opportunities. ', 'https://www.nps.gov/obed/index.htm', 'https://www.nps.gov/common/uploads/grid_builder/akr/crop16_9/615E8B3A-1DD8-B71B-0B44893A0F10D343.jpg?width=465&quality=90&mode=crop', 11);
INSERT INTO NationalPark VALUES ('Natural Bridges National Monument', 'Three majestic natural bridges invite you to ponder the power of water in a landscape usually defined by its absence. View them from an overlook, or hit the trails and experience their grandeur from below. Declared a National Monument in 1908, the bridges are named Kachina, Owachomo and Sipapu in honor of the Native Americans that once made this area their home. ', 'https://www.nps.gov/nabr/index.htm', 'https://www.nps.gov/common/uploads/grid_builder/imr/crop16_9/74235799-1DD8-B71B-0B5ECFA442C70F3D.jpg?width=465&quality=90&mode=crop', 12);
INSERT INTO NationalPark VALUES ('Natchez Trace Parkway', 'The Natchez Trace Parkway is a 444-mile recreational road and scenic drive through three states. It roughly follows the Old Natchez Trace a historic travel corridor used by American Indians, Kaintucks, European settlers, slave traders, soldiers, and future presidents. Today, people can enjoy not only a scenic drive but also hiking, biking, horseback riding, and camping along the parkway. ', 'https://www.nps.gov/natr/index.htm', 'https://www.nps.gov/common/uploads/grid_builder/akr/crop16_9/D438D336-1DD8-B71B-0B9BEA2135423214.jpg?width=950&quality=90&mode=crop', 13);
INSERT INTO NationalPark VALUES ('Mount Rushmore National Memorial', 'Majestic figures of George Washington, Thomas Jefferson, Theodore Roosevelt and Abraham Lincoln, surrounded by the beauty of the Black Hills of South Dakota, tell the story of the birth, growth, development and preservation of this country. From the history of the first inhabitants to the diversity of America today, Mount Rushmore brings visitors face to face with the rich heritage we all share. ', 'https://www.nps.gov/moru/index.htm', 'https://www.nps.gov/common/uploads/grid_builder/mwr/crop16_9/C6C71E83-1DD8-B71B-0B3B2B02603AB440.jpg?width=307&quality=90&mode=crop', 14);
INSERT INTO NationalPark VALUES ('Mount Rainier National Park', 'Ascending to 14,410 feet above sea level, Mount Rainier stands as an icon in the Washington landscape. An active volcano, Mount Rainier is the most glaciated peak in the contiguous U.S.A., spawning six major rivers. Subalpine wildflower meadows ring the icy volcano while ancient forest cloaks Mount Rainier lower slopes. Wildlife abounds in the park ecosystems. A lifetime of discovery awaits. ', 'https://www.nps.gov/mora/index.htm', 'https://www.nps.gov/common/uploads/grid_builder/pwr/crop16_9/F096F25E-1DD8-B71B-0BB2F7B3366C4901.JPG?width=307&quality=90&mode=crop', 15);
INSERT INTO NationalPark VALUES ('Mississippi National River & Recreation Area', 'In the middle of a bustling urban setting, this 72 mile river park offers quiet stretches for fishing, boating and canoeing.Other spots are excellent for birdwatching, bicycling and hiking. And there are plenty of visitor centers that highlight the history and science of the Mississippi River.If you are interested in the Mississippi River, this is a great place to start your exploration. ', 'https://www.nps.gov/miss/index.htm', 'https://www.nps.gov/common/uploads/grid_builder/mwr/crop16_9/04F1460F-1DD8-B71B-0BBAB00A54E1EC4B.jpg?width=465&quality=90&mode=crop', 16);
INSERT INTO NationalPark VALUES ('Mammoth Cave National Park', 'Mammoth Cave National Park preserves the cave system and a part of the Green River valley and hilly country of south central Kentucky. This is the world''s longest known cave system, with more than 400 miles explored. Early guide Stephen Bishop called the cave a grand, gloomy and peculiar place, but its vast chambers and complex labyrinths have earned its name - Mammoth. ', 'https://www.nps.gov/maca/index.htm', 'https://www.nps.gov/common/uploads/grid_builder/akr/crop16_9/97257870-1DD8-B71B-0B4A4AAF80A4E8E7.jpg?width=950&quality=90&mode=crop', 17);
INSERT INTO NationalPark VALUES ('Lake Mead National Recreation Area', 'Boat, hike, cycle, camp and fish at America most diverse national recreation area. With striking landscapes and brilliant blue waters, this year-round playground spreads across 1.5 million acres of mountains, canyons, valleys and two vast lakes. See the Hoover Dam from the waters of Lake Mead or Lake Mohave, or find solitude in one of the park''s nine wilderness areas. ', 'https://www.nps.gov/lake/index.htm', 'https://www.nps.gov/common/uploads/grid_builder/pwr/crop16_9/0FE723A4-1DD8-B71B-0B294802FC685A6D.jpg?width=950&quality=90&mode=crop', 18);
INSERT INTO NationalPark VALUES ('Joshua Tree National Park', 'Two distinct desert ecosystems, the Mojave and the Colorado, come together in Joshua Tree National Park. A fascinating variety of plants and animals make their homes in a land sculpted by strong winds and occasional torrents of rain. Dark night skies, a rich cultural history, and surreal geologic features add to the wonder of this vast wilderness in southern California. Come explore for yourself. ', 'https://www.nps.gov/jotr/index.htm', 'https://www.nps.gov/common/uploads/grid_builder/pwr/crop16_9/557E15C9-1DD8-B71B-0B4517C08222B3F9.jpg?width=465&quality=90&mode=crop', 19);
INSERT INTO NationalPark VALUES ('John Day Fossil Beds National Monument', 'Colorful rock formations at John Day Fossil Beds preserve a world class record of plant and animal evolution, changing climate, and past ecosystems that span over 40 million years. Exhibits and a working lab at the Thomas Condon Paleontology Center as well as scenic drives and hikes at all three units allow visitors to explore the prehistoric past of Oregon and see science in action. ', 'https://www.nps.gov/joda/index.htm', 'https://www.nps.gov/common/uploads/grid_builder/pwr/crop16_9/53E53F43-1DD8-B71B-0BDCA4868ADAD2E5.jpg?width=950&quality=90&mode=crop', 20);
INSERT INTO NationalPark VALUES ('Isle Royale National Park', 'Explore a rugged, isolated island, far from the sights and sounds of civilization. Surrounded by Lake Superior, Isle Royale offers unparalleled solitude and adventures for backpackers, hikers, boaters, kayakers, canoeists and scuba divers. Here, amid stunning scenic beauty, you''ll find opportunities for reflection and discovery, and make memories that last a lifetime. ', 'https://www.nps.gov/isro/index.htm', 'https://www.nps.gov/common/uploads/grid_builder/mwr/crop16_9/5A6B601E-1DD8-B71B-0B2F62ED27AA6FB7.jpg?width=950&quality=90&mode=crop', 21);
INSERT INTO NationalPark VALUES ('Hovenweep National Monument', 'Once home to over 2,500 people, Hovenweep includes six prehistoric villages built between A.D. 1200 and 1300. Explore a variety of structures, including multistory towers perched on canyon rims and balanced on boulders. The construction and attention to detail will leave you marveling at the skill and motivation of the builders. ', 'https://www.nps.gov/hove/index.htm', 'https://www.nps.gov/common/uploads/grid_builder/imr/crop16_9/C6E2DD0E-1DD8-B71B-0BEF17A52FAEBF1E.jpg?width=307&quality=90&mode=crop', 22);
INSERT INTO NationalPark VALUES ('Harpers Ferry National Historical Park', 'A visit to this quaint, historic community, at the confluence of the Potomac and Shenandoah rivers, is like stepping into the past.Stroll the picturesque streets, visit exhibits and museums, or hike our trails and battlefields. Spend a day or a weekend. We have something for everyone, so come and discover Harpers Ferry! ', 'https://www.nps.gov/hafe/index.htm', 'https://www.nps.gov/common/uploads/grid_builder/ncr/crop16_9/D2CCB487-1DD8-B71B-0B6A929FDA3088C8.jpg?width=465&quality=90&mode=crop', 23);
INSERT INTO NationalPark VALUES ('Great Smoky Mountains National Park', 'Ridge upon ridge of forest straddles the border between North Carolina and Tennessee in Great Smoky Mountains National Park. World renowned for its diversity of plant and animal life, the beauty of its ancient mountains, and the quality of its remnants of Southern Appalachian mountain culture, this is America''s most visited national park. ', 'https://www.nps.gov/grsm/index.htm', 'https://www.nps.gov/common/uploads/grid_builder/akr/crop16_9/42D5A0DE-1DD8-B71B-0B142ACA49A96CDE.jpg?width=465&quality=90&mode=crop', 24);
INSERT INTO NationalPark VALUES ('Great Falls Park', 'At Great Falls, the Potomac River builds up speed and force as it falls over a series of steep, jagged rocks and flows through the narrow Mather Gorge. The Patowmack Canal offers a glimpse into the early history of this country.Great Falls Park has many opportunities to explore history and nature, all in a beautiful 800-acre park only 15 miles from the Nation''s Capital. ', 'https://www.nps.gov/grfa/index.htm', 'http://static1.squarespace.com/static/53387395e4b081b17a047be0/t/53bad877e4b06596281c530b/1404754041320/greatfallsmagentasunrise.jpg', 25);
INSERT INTO NationalPark VALUES ('Grand Canyon National Park', 'Unique combinations of geologic color and erosional forms decorate a canyon that is 277 river miles (446km) long, up to 18 miles (29km) wide, and a mile (1.6km) deep. Grand Canyon overwhelms our senses through its immense size ', 'https://www.nps.gov/grca/index.htm', 'https://www.nps.gov/common/uploads/grid_builder/imr/crop16_9/77F6AD51-1DD8-B71B-0B45850A92DFEFE3.jpg?width=307&quality=90&mode=crop', 26);
INSERT INTO NationalPark VALUES ('Glen Canyon National Recreation Area', 'Encompassing over 1.25 million acres, Glen Canyon National Recreation Area offers unparalleled opportunities for water-based & backcountry recreation. The recreation area stretches for hundreds of miles from Lees Ferry in Arizona to the Orange Cliffs of southern Utah, encompassing scenic vistas, geologic wonders, and a vast panorama of human history.', 'https://www.nps.gov/glca/index.htm', 'https://www.nps.gov/common/uploads/grid_builder/imr/crop16_9/84C871F3-1DD8-B71B-0BCAD116B65E0D38.jpg?width=950&quality=90&mode=crop', 27);
INSERT INTO NationalPark VALUES ('Glacier National Park', 'As the Crown of the Continent, Glacier is the headwaters for streams that flow to the Pacific Ocean, the Gulf of Mexico, and to Hudson''s Bay. What happens here affects waters in a huge section of North America. Due to a detection of invasive mussel populations in central Montana, Glacier has closed all park waters to boating until further notice. Please see the press release for further details. ', 'https://www.nps.gov/glac/index.htm', 'https://www.nps.gov/common/uploads/grid_builder/imr/crop16_9/DA3C1F02-1DD8-B71B-0BEA9E07D90D38B8.jpg?width=950&quality=90&mode=crop', 28);
INSERT INTO NationalPark VALUES ('Glacier Bay National Park & Preserve', 'Covering 3.3 million acres of rugged mountains, dynamic glaciers, temperate rainforest, wild coastlines and deep sheltered fjords, Glacier Bay National Park is a highlight of Alaska''s Inside Passage and part of a 25-million acre World Heritage Site one of the world largest international protected areas. From sea to summit, Glacier Bay offers limitless opportunities for adventure and inspiration. ', 'https://www.nps.gov/glba/index.htm', 'https://www.nps.gov/common/uploads/grid_builder/akr/crop16_9/3AD5B405-1DD8-B71B-0BF8C764F38F60F9.jpg?width=307&quality=90&mode=crop', 29);
INSERT INTO NationalPark VALUES ('Gettysburg National Military Park', 'The Battle of Gettysburg was a turning point in the Civil War, the Union victory that ended General Robert E. Lee''s second and most ambitious invasion of the North. Often referred to as the High Water Mark of the Rebellion, Gettysburg was the Civil War''s bloodiest battle and was also the inspiration for President Abraham Lincoln''s immortal Gettysburg Address.', 'https://www.nps.gov/gett/index.htm', 'https://www.nps.gov/common/uploads/grid_builder/ner/crop16_9/3B95DFE6-1DD8-B71B-0BC2E8AB63004114.jpg?width=950&quality=90&mode=crop', 30);
INSERT INTO NationalPark VALUES ('Göreme National Park','In a spectacular landscape, entirely sculpted by erosion, the Göreme valley and its surroundings contain rock-hewn sanctuaries that provide unique evidence of Byzantine art in the post-Iconoclastic period. Dwellings, troglodyte villages and underground towns – the remains of a traditional human habitat dating back to the 4th century – can also be seen there.','http://whc.unesco.org/en/list/357', 'http://media-1.web.britannica.com/eb-media/84/153484-004-0E9C6B26.jpg', 31); 
INSERT INTO NationalPark VALUES ('Vatnajökull National Park','Vatnajökull National Park is one of three national parks in Iceland. It encompasses all of Vatnajökull glacier and extensive surrounding areas. These include the national parks previously existing at Skaftafell in the southwest and Jökulsárgljúfur in the north.', 'http://www.vatnajokulsthjodgardur.is/english', 'http://www.visiticeland.com/Media/SvartifossAug09-78_79_80SHTM.jpg?w=800&h=450&mode=crop&format=jpg', 32); 
INSERT INTO NationalPark VALUES ('Masai Mara National Reserve','It is globally famous for its exceptional population of Masai lions, African leopards and Tanzanian cheetahs, and the annual migration of zebra, Thomson''s gazelle, and wildebeest to and from the Serengeti every year from July to October, known as the Great Migration.','http://www.maasaimara.com/', 'https://cloudfront.safaribookings.com/library/kenya/xxl/Masai_Mara_National_Reserve_016.jpg', 33);
INSERT INTO NationalPark VALUES ('Kruger National Park','Kruger National Park is one of the largest game reserves in Africa. The park is part of the Kruger to Canyons Biosphere an area designated by the United Nations Educational, Scientific and Cultural Organization (UNESCO) as an International Man and Biosphere Reserve.','https://www.sanparks.org/parks/kruger', 'http://whalecoast.biz/wp-content/uploads/2016/09/kruger-national-park-south-africa-attraction-safari-trips.jpg', 34);

--
-- TOC entry 2467 (class 0 OID 16460)
-- Dependencies: 186
-- Data for Name: PriceInfo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO PriceInfo VALUES (0, 1);
INSERT INTO PriceInfo VALUES (0, 2);
INSERT INTO PriceInfo VALUES (20, 3);
INSERT INTO PriceInfo VALUES (0, 4);
INSERT INTO PriceInfo VALUES (12, 5);
INSERT INTO PriceInfo VALUES (0, 6);
INSERT INTO PriceInfo VALUES (15, 7);
INSERT INTO PriceInfo VALUES (0, 8);
INSERT INTO PriceInfo VALUES (20, 9);
INSERT INTO PriceInfo VALUES (10, 10);
INSERT INTO PriceInfo VALUES (10, 11);
INSERT INTO PriceInfo VALUES (10, 12);
INSERT INTO PriceInfo VALUES (0, 13);
INSERT INTO PriceInfo VALUES (0, 14);
INSERT INTO PriceInfo VALUES (10, 15);
INSERT INTO PriceInfo VALUES (0, 16);
INSERT INTO PriceInfo VALUES (0, 17);
INSERT INTO PriceInfo VALUES (10, 18);
INSERT INTO PriceInfo VALUES (25, 19);
INSERT INTO PriceInfo VALUES (0, 20);
INSERT INTO PriceInfo VALUES (7, 21);
INSERT INTO PriceInfo VALUES (0, 22);
INSERT INTO PriceInfo VALUES (5, 23);
INSERT INTO PriceInfo VALUES (0, 24);
INSERT INTO PriceInfo VALUES (5, 25);
INSERT INTO PriceInfo VALUES (0, 26);
INSERT INTO PriceInfo VALUES (12, 27);
INSERT INTO PriceInfo VALUES (30, 28);
INSERT INTO PriceInfo VALUES (0, 29);
INSERT INTO PriceInfo VALUES (0, 30);
INSERT INTO PriceInfo VALUES (22, 31);
INSERT INTO PriceInfo VALUES (0, 32);
INSERT INTO PriceInfo VALUES (80, 33);
INSERT INTO PriceInfo VALUES (24, 34);


--
-- TOC entry 2474 (class 0 OID 16548)
-- Dependencies: 193
-- Data for Name: Recreation; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO Recreation VALUES ('volunteer program');
INSERT INTO Recreation VALUES ('outdoor recreation');
INSERT INTO Recreation VALUES ('sunset');
INSERT INTO Recreation VALUES ('hiking');
INSERT INTO Recreation VALUES ('horse riding');
INSERT INTO Recreation VALUES ('coal mine visit');
INSERT INTO Recreation VALUES ('row boat');
INSERT INTO Recreation VALUES ('Biking');
INSERT INTO Recreation VALUES ('rock climbing');
INSERT INTO Recreation VALUES ('Explore This Park');
INSERT INTO Recreation VALUES ('Ranger Programs');
INSERT INTO Recreation VALUES ('Solar eclipse');
INSERT INTO Recreation VALUES ('Camping');
INSERT INTO Recreation VALUES ('Fishing');
INSERT INTO Recreation VALUES ('Backpacking');
INSERT INTO Recreation VALUES ('Photography');
INSERT INTO Recreation VALUES ('Birdwatching');
INSERT INTO Recreation VALUES ('sea shore');
INSERT INTO Recreation VALUES ('swimming');
INSERT INTO Recreation VALUES ('stargazing');
INSERT INTO Recreation VALUES ('scenic drive');
INSERT INTO Recreation VALUES ('american culture');
INSERT INTO Recreation VALUES ('swamps');
INSERT INTO Recreation VALUES ('waterfall');
INSERT INTO Recreation VALUES ('Mount Rushmore Audio Tour');
INSERT INTO Recreation VALUES ('sculpted faces of George Washington Thomas Jefferson Theodore Roosevelt and Abraham Lincoln');
INSERT INTO Recreation VALUES ('sand');
INSERT INTO Recreation VALUES ('kayaking');
INSERT INTO Recreation VALUES ('ski');
INSERT INTO Recreation VALUES ('glacier');
INSERT INTO Recreation VALUES ('hot air baloon');
INSERT INTO Recreation VALUES ('church');
INSERT INTO Recreation VALUES ('fairy chimneys');
INSERT INTO Recreation VALUES ('open air museum');
INSERT INTO Recreation VALUES ('underground');
INSERT INTO Recreation VALUES ('sky dive');
INSERT INTO Recreation VALUES ('wildlife');




--
-- TOC entry 2471 (class 0 OID 16498)
-- Dependencies: 190
-- Data for Name: VisitorStats; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2332 (class 2606 OID 16547)
-- Name: Climate Climate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY Climate
    ADD CONSTRAINT Climate_pkey PRIMARY KEY (name);


--
-- TOC entry 2324 (class 2606 OID 16474)
-- Name: Continent Continent_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY Continent
    ADD CONSTRAINT Continent_pkey PRIMARY KEY (name);


--
-- TOC entry 2326 (class 2606 OID 16479)
-- Name: Country Country_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY Country
    ADD CONSTRAINT Country_pkey PRIMARY KEY (name);


--
-- TOC entry 2330 (class 2606 OID 16539)
-- Name: Geology Geology_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY Geology
    ADD CONSTRAINT Geology_pkey PRIMARY KEY (name);


--
-- TOC entry 2336 (class 2606 OID 16625)
-- Name: HasStats HasStats_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY HasStats
    ADD CONSTRAINT HasStats_pkey PRIMARY KEY (park_id, year);


--
-- TOC entry 2320 (class 2606 OID 16618)
-- Name: NationalPark NationalPark_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY NationalPark
    ADD CONSTRAINT NationalPark_pkey PRIMARY KEY (id);


--
-- TOC entry 2322 (class 2606 OID 16647)
-- Name: PriceInfo PriceInfo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY PriceInfo
    ADD CONSTRAINT PriceInfo_pkey PRIMARY KEY (id);


--
-- TOC entry 2334 (class 2606 OID 16661)
-- Name: Recreation Recreation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY Recreation
    ADD CONSTRAINT Recreation_pkey PRIMARY KEY (name);


--
-- TOC entry 2328 (class 2606 OID 16502)
-- Name: VisitorStats VisitorStats_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY VisitorStats
    ADD CONSTRAINT VisitorStats_pkey PRIMARY KEY (year);


--
-- TOC entry 2338 (class 2606 OID 16480)
-- Name: Country continent; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY Country
    ADD CONSTRAINT continent FOREIGN KEY (continent) REFERENCES Continent(name);


--
-- TOC entry 2339 (class 2606 OID 16493)
-- Name: IsInCountry country_name; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY IsInCountry
    ADD CONSTRAINT country_name FOREIGN KEY (country_name) REFERENCES Country(name);


--
-- TOC entry 2337 (class 2606 OID 16648)
-- Name: PriceInfo id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY PriceInfo
    ADD CONSTRAINT id FOREIGN KEY (id) REFERENCES NationalPark(id);


--
-- TOC entry 2345 (class 2606 OID 16595)
-- Name: IsOfClimate name; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY IsOfClimate
    ADD CONSTRAINT name FOREIGN KEY (Name) REFERENCES Climate(name);


--
-- TOC entry 2347 (class 2606 OID 16611)
-- Name: IsOfGeology name; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY IsOfGeology
    ADD CONSTRAINT name FOREIGN KEY (name) REFERENCES Geology(name);


--
-- TOC entry 2343 (class 2606 OID 16619)
-- Name: HasRecreation park_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY HasRecreation
    ADD CONSTRAINT park_id FOREIGN KEY (park_id) REFERENCES NationalPark(id);


--
-- TOC entry 2342 (class 2606 OID 16626)
-- Name: HasStats park_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY HasStats
    ADD CONSTRAINT park_id FOREIGN KEY (park_id) REFERENCES NationalPark(id);


--
-- TOC entry 2340 (class 2606 OID 16631)
-- Name: IsInCountry park_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY IsInCountry
    ADD CONSTRAINT park_id FOREIGN KEY (park_id) REFERENCES NationalPark(id);


--
-- TOC entry 2346 (class 2606 OID 16636)
-- Name: IsOfClimate park_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY IsOfClimate
    ADD CONSTRAINT park_id FOREIGN KEY (park_id) REFERENCES NationalPark(id);


--
-- TOC entry 2348 (class 2606 OID 16641)
-- Name: IsOfGeology park_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY IsOfGeology
    ADD CONSTRAINT park_id FOREIGN KEY (park_id) REFERENCES NationalPark(id);


--
-- TOC entry 2344 (class 2606 OID 16667)
-- Name: HasRecreation recreation_name; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY HasRecreation
    ADD CONSTRAINT recreation_name FOREIGN KEY (recreation_name) REFERENCES Recreation(name);


--
-- TOC entry 2341 (class 2606 OID 16561)
-- Name: HasStats year; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY HasStats
    ADD CONSTRAINT year FOREIGN KEY (year) REFERENCES VisitorStats(year);


-- Completed on 2017-04-26 04:22:17 EDT

--
-- PostgreSQL database dump complete
--

