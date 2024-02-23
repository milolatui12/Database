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
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(4,1),
    description text
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
    name character varying(30) NOT NULL,
    is_spherical boolean DEFAULT true,
    planet_id integer NOT NULL,
    distance_from_earth numeric(4,1)
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
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    has_life boolean DEFAULT false,
    star_id integer NOT NULL
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(4,1),
    galaxy_id integer NOT NULL
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
-- Name: tmp; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.tmp (
    tmp_id integer NOT NULL,
    name character varying(20) NOT NULL,
    total integer NOT NULL,
    fee numeric(4,1)
);


ALTER TABLE public.tmp OWNER TO freecodecamp;

--
-- Name: tmp_tmp_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.tmp_tmp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tmp_tmp_id_seq OWNER TO freecodecamp;

--
-- Name: tmp_tmp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.tmp_tmp_id_seq OWNED BY public.tmp.tmp_id;


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: tmp tmp_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.tmp ALTER COLUMN tmp_id SET DEFAULT nextval('public.tmp_tmp_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 130, 4.5, 'Andromeda is the closest big galaxy to the Milky Way and is expected to collide with the Milky Way around 4.5 billion years from now. The two will eventually merge into a single new galaxy called Milkdromeda.');
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 130, 1.1, 'The Milky Way[c] is the galaxy that includes the Solar System');
INSERT INTO public.galaxy VALUES (3, 'Milky Way1', 130, 1.1, 'The Milky Way[c] is the galaxy that includes the Solar System');
INSERT INTO public.galaxy VALUES (4, 'Milky Way3', 130, 1.1, 'The Milky Way[c] is the galaxy that includes the Solar System');
INSERT INTO public.galaxy VALUES (5, 'Milky Way11', 130, 1.1, 'The Milky Way[c] is the galaxy that includes the Solar System');
INSERT INTO public.galaxy VALUES (6, 'Milky Way12', 130, 1.1, 'The Milky Way[c] is the galaxy that includes the Solar System');
INSERT INTO public.galaxy VALUES (7, 'Milky Way13', 130, 1.1, 'The Milky Way[c] is the galaxy that includes the Solar System');
INSERT INTO public.galaxy VALUES (8, 'Milky Way14', 130, 1.1, 'The Milky Way[c] is the galaxy that includes the Solar System');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', true, 1, 0.1);
INSERT INTO public.moon VALUES (2, 'Moon2', true, 2, 0.1);
INSERT INTO public.moon VALUES (3, 'Moon3', true, 2, 0.1);
INSERT INTO public.moon VALUES (4, 'Moon4', true, 2, 0.1);
INSERT INTO public.moon VALUES (7, 'Moon22', true, 2, 0.1);
INSERT INTO public.moon VALUES (8, 'askjf', true, 2, 0.1);
INSERT INTO public.moon VALUES (9, 'uuu', true, 2, 0.1);
INSERT INTO public.moon VALUES (10, 'jjjj', true, 2, 0.1);
INSERT INTO public.moon VALUES (11, 'www', true, 2, 0.1);
INSERT INTO public.moon VALUES (12, 'iii', true, 2, 0.0);
INSERT INTO public.moon VALUES (13, 'Moon224', true, 2, 0.1);
INSERT INTO public.moon VALUES (14, 'asskjf', true, 2, 0.1);
INSERT INTO public.moon VALUES (15, 'u1uu', true, 2, 0.1);
INSERT INTO public.moon VALUES (16, 'jjj1j', true, 2, 0.1);
INSERT INTO public.moon VALUES (17, 'w1ww', true, 2, 0.1);
INSERT INTO public.moon VALUES (18, 'ii1i', true, 2, 0.0);
INSERT INTO public.moon VALUES (19, 'M3oon224', true, 2, 0.1);
INSERT INTO public.moon VALUES (20, '3asskjf', true, 2, 0.1);
INSERT INTO public.moon VALUES (21, 'u1u3u', true, 2, 0.1);
INSERT INTO public.moon VALUES (22, 'j3jj1j', true, 2, 0.1);
INSERT INTO public.moon VALUES (23, 'w1ww3', true, 2, 0.1);
INSERT INTO public.moon VALUES (24, 'ii13i', true, 2, 0.0);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, true, 2);
INSERT INTO public.planet VALUES (2, 'Earth3', 1, true, 2);
INSERT INTO public.planet VALUES (3, 'Earth4', 1, true, 2);
INSERT INTO public.planet VALUES (4, 'Earth6', 1, true, 2);
INSERT INTO public.planet VALUES (5, 'Earth7', 1, true, 2);
INSERT INTO public.planet VALUES (6, 'Earth8', 1, true, 2);
INSERT INTO public.planet VALUES (7, 'Earth9', 1, true, 2);
INSERT INTO public.planet VALUES (8, 'Earth10', 1, true, 2);
INSERT INTO public.planet VALUES (9, 'Earth11', 1, true, 2);
INSERT INTO public.planet VALUES (12, 'Earth121', 1, true, 2);
INSERT INTO public.planet VALUES (13, 'asdf2', 1, true, 3);
INSERT INTO public.planet VALUES (14, 'euiu2', 1, false, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'HR15', 10, 4.5, 1);
INSERT INTO public.star VALUES (2, 'Sun', 10, 0.1, 2);
INSERT INTO public.star VALUES (3, 'Sun2', 10, 0.1, 2);
INSERT INTO public.star VALUES (4, 'Sun6', 10, 0.1, 3);
INSERT INTO public.star VALUES (6, 'Sun5', 10, 0.1, 3);
INSERT INTO public.star VALUES (8, 'Sun7', 10, 0.1, 3);
INSERT INTO public.star VALUES (9, 'Sun8', 10, 0.1, 3);


--
-- Data for Name: tmp; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.tmp VALUES (1, 'abc', 10, 1.1);
INSERT INTO public.tmp VALUES (2, 'def', 20, 1.1);
INSERT INTO public.tmp VALUES (3, 'thg', 30, 1.1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: tmp_tmp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.tmp_tmp_id_seq', 3, true);


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
-- Name: tmp tmp_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.tmp
    ADD CONSTRAINT tmp_name_key UNIQUE (name);


--
-- Name: tmp tmp_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.tmp
    ADD CONSTRAINT tmp_pkey PRIMARY KEY (tmp_id);


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

