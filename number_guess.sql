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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    user_name character varying(22) NOT NULL,
    games_played integer NOT NULL,
    best_game integer NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (33, '500', 1, 10);
INSERT INTO public.users VALUES (2, 'user_1710463686295', 2, 735);
INSERT INTO public.users VALUES (1, 'user_1710463686296', 5, 148);
INSERT INTO public.users VALUES (18, 'user_1710464713496', 2, 388);
INSERT INTO public.users VALUES (4, 'user_1710463720180', 2, 376);
INSERT INTO public.users VALUES (17, 'user_1710464713497', 5, 132);
INSERT INTO public.users VALUES (3, 'user_1710463720181', 5, 26);
INSERT INTO public.users VALUES (6, 'user_1710463849229', 2, 28);
INSERT INTO public.users VALUES (35, 'user_1710466385289', 2, 237);
INSERT INTO public.users VALUES (20, 'user_1710464736326', 2, 277);
INSERT INTO public.users VALUES (5, 'user_1710463849230', 5, 581);
INSERT INTO public.users VALUES (19, 'user_1710464736327', 5, 183);
INSERT INTO public.users VALUES (8, 'user_1710464216539', 2, 255);
INSERT INTO public.users VALUES (34, 'user_1710466385290', 5, 125);
INSERT INTO public.users VALUES (7, 'user_1710464216540', 5, 313);
INSERT INTO public.users VALUES (10, 'user_1710464355647', 2, 853);
INSERT INTO public.users VALUES (22, 'user_1710465669127', 2, 652);
INSERT INTO public.users VALUES (9, 'user_1710464355648', 5, 123);
INSERT INTO public.users VALUES (21, 'user_1710465669128', 5, 226);
INSERT INTO public.users VALUES (12, 'user_1710464390037', 2, 17);
INSERT INTO public.users VALUES (37, 'user_1710466447883', 2, 254);
INSERT INTO public.users VALUES (11, 'user_1710464390038', 5, 106);
INSERT INTO public.users VALUES (24, 'user_1710465681448', 2, 130);
INSERT INTO public.users VALUES (14, 'user_1710464397546', 2, 136);
INSERT INTO public.users VALUES (36, 'user_1710466447884', 5, 127);
INSERT INTO public.users VALUES (13, 'user_1710464397547', 5, 359);
INSERT INTO public.users VALUES (23, 'user_1710465681449', 5, 327);
INSERT INTO public.users VALUES (16, 'user_1710464666521', 2, 774);
INSERT INTO public.users VALUES (15, 'user_1710464666522', 5, 93);
INSERT INTO public.users VALUES (26, 'user_1710465720199', 2, 798);
INSERT INTO public.users VALUES (25, 'user_1710465720200', 5, 42);
INSERT INTO public.users VALUES (28, 'user_1710465780019', 2, 46);
INSERT INTO public.users VALUES (27, 'user_1710465780020', 5, 35);
INSERT INTO public.users VALUES (30, 'user_1710465792687', 2, 293);
INSERT INTO public.users VALUES (29, 'user_1710465792688', 5, 5);
INSERT INTO public.users VALUES (32, 'user_1710465805907', 2, 31);
INSERT INTO public.users VALUES (31, 'user_1710465805908', 5, 20);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 37, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

