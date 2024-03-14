--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(30) NOT NULL,
    diameter_in_lightyears integer,
    type_of_galaxy character varying(60),
    has_quasar boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    has_water boolean,
    historical_name boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_moons boolean,
    amount_of_moons integer,
    star_id integer,
    average_temperature_c numeric(100,2),
    life_description text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: quasar; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.quasar (
    quasar_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.quasar OWNER TO freecodecamp;

--
-- Name: quasar_quasar_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.quasar_quasar_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quasar_quasar_id_seq OWNER TO freecodecamp;

--
-- Name: quasar_quasar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.quasar_quasar_id_seq OWNED BY public.quasar.quasar_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_planets boolean,
    galaxy_id integer,
    amount_of_planets integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: quasar quasar_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.quasar ALTER COLUMN quasar_id SET DEFAULT nextval('public.quasar_quasar_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'andromeda', 152000, 'SA(s)b', true);
INSERT INTO public.galaxy VALUES (2, 'milky way', 87400, 'SBbc', false);
INSERT INTO public.galaxy VALUES (4, 'sculptor', 90000, 'SAB(s)c', false);
INSERT INTO public.galaxy VALUES (5, 'dwingeloo 1', 35000, 'SB(s)cd', false);
INSERT INTO public.galaxy VALUES (6, 'maffei 1', 75000, 'S0 pec', false);
INSERT INTO public.galaxy VALUES (3, 'markarian 231', NULL, 'Sc/quasar', true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon', 1, false, true);
INSERT INTO public.moon VALUES (2, 'phobos', 4, false, true);
INSERT INTO public.moon VALUES (3, 'deimos', 4, false, true);
INSERT INTO public.moon VALUES (4, 'io', 5, false, true);
INSERT INTO public.moon VALUES (5, 'europa', 5, true, true);
INSERT INTO public.moon VALUES (6, 'ganymede', 5, true, true);
INSERT INTO public.moon VALUES (7, 'callisto', 5, true, true);
INSERT INTO public.moon VALUES (8, 'metis', 5, true, true);
INSERT INTO public.moon VALUES (9, 'adrastea', 5, true, true);
INSERT INTO public.moon VALUES (10, 'amalthea', 5, true, true);
INSERT INTO public.moon VALUES (11, 'thebe', 5, true, true);
INSERT INTO public.moon VALUES (12, 'miranda', 7, true, true);
INSERT INTO public.moon VALUES (13, 'ariel', 7, true, true);
INSERT INTO public.moon VALUES (14, 'umbriel', 7, true, true);
INSERT INTO public.moon VALUES (15, 'titania', 7, true, true);
INSERT INTO public.moon VALUES (16, 'oberon', 7, true, true);
INSERT INTO public.moon VALUES (17, 'naiad', 8, false, true);
INSERT INTO public.moon VALUES (18, 'thalassa', 8, false, true);
INSERT INTO public.moon VALUES (19, 'despina', 8, false, true);
INSERT INTO public.moon VALUES (20, 'galatea', 8, false, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'mercury', false, NULL, 1, 164.00, NULL);
INSERT INTO public.planet VALUES (3, 'venus', false, NULL, 1, 453.00, NULL);
INSERT INTO public.planet VALUES (4, 'mars', true, 2, 1, -64.00, NULL);
INSERT INTO public.planet VALUES (5, 'jupiter', true, 95, 1, -185.00, NULL);
INSERT INTO public.planet VALUES (6, 'saturn', false, NULL, 1, -139.00, NULL);
INSERT INTO public.planet VALUES (7, 'uranus', true, 28, 1, -197.00, NULL);
INSERT INTO public.planet VALUES (8, 'neptune', true, 16, 1, -201.00, NULL);
INSERT INTO public.planet VALUES (9, 'gliese 876 d', false, NULL, 7, 341.00, NULL);
INSERT INTO public.planet VALUES (10, 'gliese 876 c', false, NULL, 7, NULL, NULL);
INSERT INTO public.planet VALUES (11, 'gliese 876 b', false, NULL, 7, -79.00, NULL);
INSERT INTO public.planet VALUES (12, 'gliese 876 e', false, NULL, 7, NULL, NULL);
INSERT INTO public.planet VALUES (1, 'earth', true, 1, 1, 15.00, 'diverse');


--
-- Data for Name: quasar; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.quasar VALUES (1, 'markarian 231', 3);
INSERT INTO public.quasar VALUES (2, 'andromeda parachute', 1);
INSERT INTO public.quasar VALUES (3, 'm31', 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'sun', true, 2, 8);
INSERT INTO public.star VALUES (2, 'sirius a', false, 2, NULL);
INSERT INTO public.star VALUES (3, 'sirius b', false, 2, NULL);
INSERT INTO public.star VALUES (4, 'alpheratz', false, 1, NULL);
INSERT INTO public.star VALUES (5, 'gx andromedae', true, 1, 2);
INSERT INTO public.star VALUES (6, 'mirach', true, 1, 1);
INSERT INTO public.star VALUES (7, 'gliese 876', true, 2, 4);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: quasar_quasar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.quasar_quasar_id_seq', 3, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 7, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: quasar quasar_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.quasar
    ADD CONSTRAINT quasar_name_key UNIQUE (name);


--
-- Name: quasar quasar_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.quasar
    ADD CONSTRAINT quasar_pkey PRIMARY KEY (quasar_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_part_of_planet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_part_of_planet_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_part_of_star_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_part_of_star_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: quasar quasar_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.quasar
    ADD CONSTRAINT quasar_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_part_of_galaxy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_part_of_galaxy_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

