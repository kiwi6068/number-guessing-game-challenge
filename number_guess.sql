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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    player_id integer NOT NULL,
    guess_count integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.players (
    player_id integer NOT NULL,
    name character varying(22) NOT NULL
);


ALTER TABLE public.players OWNER TO freecodecamp;

--
-- Name: players_player_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.players_player_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.players_player_id_seq OWNER TO freecodecamp;

--
-- Name: players_player_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.players_player_id_seq OWNED BY public.players.player_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: players player_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players ALTER COLUMN player_id SET DEFAULT nextval('public.players_player_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, NULL);
INSERT INTO public.games VALUES (2, 1, NULL);
INSERT INTO public.games VALUES (3, 2, 311);
INSERT INTO public.games VALUES (4, 2, NULL);
INSERT INTO public.games VALUES (5, 3, 931);
INSERT INTO public.games VALUES (6, 3, NULL);
INSERT INTO public.games VALUES (7, 2, NULL);
INSERT INTO public.games VALUES (8, 2, NULL);
INSERT INTO public.games VALUES (9, 2, NULL);
INSERT INTO public.games VALUES (10, 4, 757);
INSERT INTO public.games VALUES (11, 4, NULL);
INSERT INTO public.games VALUES (12, 5, 606);
INSERT INTO public.games VALUES (13, 5, NULL);
INSERT INTO public.games VALUES (14, 4, NULL);
INSERT INTO public.games VALUES (15, 4, NULL);
INSERT INTO public.games VALUES (16, 4, NULL);
INSERT INTO public.games VALUES (17, 6, 4);
INSERT INTO public.games VALUES (18, 6, NULL);
INSERT INTO public.games VALUES (19, 7, 703);
INSERT INTO public.games VALUES (20, 7, NULL);
INSERT INTO public.games VALUES (21, 8, 550);
INSERT INTO public.games VALUES (22, 8, NULL);
INSERT INTO public.games VALUES (23, 7, NULL);
INSERT INTO public.games VALUES (24, 7, NULL);
INSERT INTO public.games VALUES (25, 7, NULL);
INSERT INTO public.games VALUES (26, 9, 935);
INSERT INTO public.games VALUES (27, 9, NULL);
INSERT INTO public.games VALUES (28, 10, 447);
INSERT INTO public.games VALUES (29, 10, NULL);
INSERT INTO public.games VALUES (30, 9, NULL);
INSERT INTO public.games VALUES (31, 9, NULL);
INSERT INTO public.games VALUES (32, 9, NULL);


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.players VALUES (1, 'kaka');
INSERT INTO public.players VALUES (2, 'user_1716402611204');
INSERT INTO public.players VALUES (3, 'user_1716402611203');
INSERT INTO public.players VALUES (4, 'user_1716402826756');
INSERT INTO public.players VALUES (5, 'user_1716402826755');
INSERT INTO public.players VALUES (6, 'Tom');
INSERT INTO public.players VALUES (7, 'user_1716402907848');
INSERT INTO public.players VALUES (8, 'user_1716402907847');
INSERT INTO public.players VALUES (9, 'user_1716403042152');
INSERT INTO public.players VALUES (10, 'user_1716403042151');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 32, true);


--
-- Name: players_player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.players_player_id_seq', 10, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (player_id);


--
-- Name: games fk_player_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_player_id FOREIGN KEY (player_id) REFERENCES public.players(player_id);


--
-- PostgreSQL database dump complete
--

