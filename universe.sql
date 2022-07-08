--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    age integer NOT NULL,
    distance integer,
    has_life boolean,
    is_beautiful boolean,
    size numeric NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    distance integer,
    age integer NOT NULL,
    has_life boolean,
    is_beautiful boolean,
    size numeric NOT NULL,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    age integer NOT NULL,
    distance integer,
    has_life boolean,
    is_beautiful boolean,
    size numeric NOT NULL,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: satellite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satellite (
    satellite_id integer NOT NULL,
    name character varying(30),
    color character varying(30) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.satellite OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satellite_satellite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satellite_satellite_id_seq OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satellite_satellite_id_seq OWNED BY public.satellite.satellite_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    age integer NOT NULL,
    distance integer,
    has_life boolean,
    is_beautiful boolean,
    size numeric NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: satellite satellite_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite ALTER COLUMN satellite_id SET DEFAULT nextval('public.satellite_satellite_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 50234, 1312, true, true, 352.222);
INSERT INTO public.galaxy VALUES (2, 'GA1', 3452, 1231, false, false, 123.51);
INSERT INTO public.galaxy VALUES (3, 'GA2', 3452, 1231, true, true, 123.23);
INSERT INTO public.galaxy VALUES (4, 'GA3', 141, 534, false, true, 2540.2);
INSERT INTO public.galaxy VALUES (5, 'GA4', 1, 1, false, false, 3.4);
INSERT INTO public.galaxy VALUES (6, 'GrrA1', 3452, 1231, false, false, 123.51);
INSERT INTO public.galaxy VALUES (7, 'gGA2', 3452, 1231, true, true, 123.23);
INSERT INTO public.galaxy VALUES (8, 'GfA3', 141, 534, false, true, 2540.2);
INSERT INTO public.galaxy VALUES (9, 'GA8', 1, 1, false, false, 3.4);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'luna', 100, 500, true, true, 2.53, 1);
INSERT INTO public.moon VALUES (3, 'MOO1', 263, 234234, true, true, 52324.632345, 6);
INSERT INTO public.moon VALUES (4, 'MOO2', 263, 234234, true, true, 52324.632345, 6);
INSERT INTO public.moon VALUES (5, 'MOO3', 263, 234234, true, true, 52324.632345, 6);
INSERT INTO public.moon VALUES (6, 'MOO4', 263, 234234, true, true, 52324.632345, 6);
INSERT INTO public.moon VALUES (7, 'MOO5', 263, 234234, true, true, 52324.632345, 6);
INSERT INTO public.moon VALUES (8, 'OOM1', 263, 234234, true, true, 52324.632345, 2);
INSERT INTO public.moon VALUES (9, 'OOM2', 263, 234234, true, true, 52324.632345, 2);
INSERT INTO public.moon VALUES (10, 'OOM3', 263, 234234, true, true, 52324.632345, 2);
INSERT INTO public.moon VALUES (11, 'OOM4', 263, 234234, true, true, 52324.632345, 2);
INSERT INTO public.moon VALUES (12, 'OOM5', 263, 234234, true, true, 52324.632345, 2);
INSERT INTO public.moon VALUES (13, 'OOM6', 263, 234234, true, true, 52324.632345, 2);
INSERT INTO public.moon VALUES (14, 'OOM7', 263, 234234, true, true, 52324.632345, 2);
INSERT INTO public.moon VALUES (15, 'OMO1', 263, 234234, true, true, 52324.632345, 2);
INSERT INTO public.moon VALUES (16, 'OMO2', 263, 234234, true, true, 52324.632345, 2);
INSERT INTO public.moon VALUES (17, 'OMO3', 263, 234234, true, true, 52324.632345, 2);
INSERT INTO public.moon VALUES (18, 'OMO4', 263, 234234, true, true, 52324.632345, 2);
INSERT INTO public.moon VALUES (19, 'OMO5', 263, 234234, true, true, 52324.632345, 2);
INSERT INTO public.moon VALUES (20, 'OMO6', 263, 234234, true, true, 52324.632345, 3);
INSERT INTO public.moon VALUES (21, 'OMO7', 263, 234234, true, true, 52324.632345, 3);
INSERT INTO public.moon VALUES (22, 'OMO8', 263, 234234, true, true, 52324.632345, 3);
INSERT INTO public.moon VALUES (23, 'OMO9', 263, 234234, true, true, 52324.632345, 1);
INSERT INTO public.moon VALUES (24, 'OMO10', 263, 234234, true, true, 52324.632345, 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 98, 24, true, true, 63.23, 1);
INSERT INTO public.planet VALUES (2, 'PLA1', 3425, 2356, false, true, 2.636373568, 2);
INSERT INTO public.planet VALUES (3, 'PLA2', 3425, 2356, false, true, 2.636373568, 2);
INSERT INTO public.planet VALUES (4, 'PLA3', 3425, 2356, false, true, 2.636373568, 2);
INSERT INTO public.planet VALUES (5, 'PLA4', 3425, 2356, false, true, 2.636373568, 2);
INSERT INTO public.planet VALUES (6, 'PLA5', 3425, 2356, false, true, 2.636373568, 2);
INSERT INTO public.planet VALUES (7, 'PLA6', 3425, 2356, false, true, 2.636373568, 2);
INSERT INTO public.planet VALUES (8, 'LPA1', 3425, 2356, false, true, 2.636373568, 1);
INSERT INTO public.planet VALUES (9, 'LPA2', 3425, 2356, false, true, 2.636373568, 1);
INSERT INTO public.planet VALUES (10, 'LPA3', 3425, 2356, false, true, 2.636373568, 1);
INSERT INTO public.planet VALUES (11, 'LPA4', 3425, 2356, false, true, 2.636373568, 1);
INSERT INTO public.planet VALUES (12, 'LPA5', 3425, 2356, false, true, 2.636373568, 1);
INSERT INTO public.planet VALUES (13, 'LPA6', 3425, 2356, false, true, 2.636373568, 1);


--
-- Data for Name: satellite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satellite VALUES (1, 'Franco', 'Rosso', 'Bella');
INSERT INTO public.satellite VALUES (2, 'Mario', 'Verdi', 'Desc');
INSERT INTO public.satellite VALUES (3, 'Gianni', 'Bordo', 'Descrizione');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 958, 234234, false, true, 66.333, 1);
INSERT INTO public.star VALUES (2, 'STA1', 41, 52, false, false, 14.6, 3);
INSERT INTO public.star VALUES (3, 'STA2', 41, 52, false, false, 14.6, 3);
INSERT INTO public.star VALUES (4, 'STA3', 41, 52, false, false, 14.6, 3);
INSERT INTO public.star VALUES (5, 'AST1', 41, 52, false, false, 14.6, 4);
INSERT INTO public.star VALUES (6, 'AST2', 41, 52, false, false, 14.6, 4);
INSERT INTO public.star VALUES (7, 'AST3', 41, 52, false, false, 14.6, 4);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 9, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satellite_satellite_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: satellite satellite_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_pkey PRIMARY KEY (satellite_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy UNIQUE (name);


--
-- Name: moon unique_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon UNIQUE (name);


--
-- Name: satellite unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: planet unique_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet UNIQUE (name);


--
-- Name: star unique_star; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star UNIQUE (name);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

