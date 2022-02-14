--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

-- Started on 2022-02-14 19:46:17

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

--
-- TOC entry 3349 (class 1262 OID 49943)
-- Name: demo_db; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE demo_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.utf8';


ALTER DATABASE demo_db OWNER TO postgres;

\connect demo_db

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

--
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3350 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 209 (class 1259 OID 49944)
-- Name: books; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.books (
    id bigint NOT NULL,
    created_date timestamp without time zone,
    updated_date timestamp without time zone,
    name character varying(255),
    no_of_pages bigint
);


ALTER TABLE public.books OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 49985)
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 49949)
-- Name: inventory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventory (
    id bigint NOT NULL,
    created_date timestamp without time zone,
    updated_date timestamp without time zone,
    book_count bigint,
    store_id bigint,
    book_id bigint
);


ALTER TABLE public.inventory OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 49954)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying(20)
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 49964)
-- Name: user_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_roles (
    user_id bigint NOT NULL,
    role_id bigint NOT NULL
);


ALTER TABLE public.user_roles OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 50071)
-- Name: user_store; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_store (
    id bigint NOT NULL,
    created_date timestamp without time zone,
    updated_date timestamp without time zone,
    name character varying(255),
    user_id bigint
);


ALTER TABLE public.user_store OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 50060)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    created_date timestamp without time zone,
    updated_date timestamp without time zone,
    email character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    password character varying(255),
    username character varying(255)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 3337 (class 0 OID 49944)
-- Dependencies: 209
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.books VALUES (6, '2022-02-14 19:10:55.936666', '2022-02-14 19:10:55.936666', 'Issac newton biography', 400);
INSERT INTO public.books VALUES (7, '2022-02-14 19:12:13.863142', '2022-02-14 19:12:13.863142', 'Fear Not: Be Strong', 350);
INSERT INTO public.books VALUES (8, '2022-02-14 19:12:39.995041', '2022-02-14 19:12:39.995041', 'Become an Engineer Not Just an Engineering Graduate', 800);
INSERT INTO public.books VALUES (9, '2022-02-14 19:12:39.995041', '2022-02-14 19:12:39.995041', 'Art of not giving', 800);


--
-- TOC entry 3338 (class 0 OID 49949)
-- Dependencies: 210
-- Data for Name: inventory; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.inventory VALUES (1, '2022-02-14 19:10:55.936', '2022-02-14 19:10:55.936', 25, 1, 6);
INSERT INTO public.inventory VALUES (3, '2022-02-14 19:10:55.936', '2022-02-14 19:10:55.936', 30, 7, 8);
INSERT INTO public.inventory VALUES (4, '2022-02-14 19:10:55.936', '2022-02-14 19:10:55.936', 50, 6, 7);
INSERT INTO public.inventory VALUES (2, '2022-02-14 19:10:55.936', '2022-02-14 19:34:50.00429', 100, 1, 7);


--
-- TOC entry 3339 (class 0 OID 49954)
-- Dependencies: 211
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.roles VALUES (1, 'ROLE_USER');
INSERT INTO public.roles VALUES (2, 'ROLE_MODERATOR');
INSERT INTO public.roles VALUES (3, 'ROLE_ADMIN');


--
-- TOC entry 3340 (class 0 OID 49964)
-- Dependencies: 212
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.user_roles VALUES (4, 1);
INSERT INTO public.user_roles VALUES (5, 1);


--
-- TOC entry 3343 (class 0 OID 50071)
-- Dependencies: 215
-- Data for Name: user_store; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.user_store VALUES (1, '2022-02-14 17:52:00.219', '2022-02-14 17:52:00.219', 'Delhi Store', 4);
INSERT INTO public.user_store VALUES (2, '2022-02-14 17:52:00.219', '2022-02-14 17:52:00.219', 'Pune Store', 4);
INSERT INTO public.user_store VALUES (3, '2022-02-14 17:52:00.219', '2022-02-14 17:52:00.219', 'Mumbai Store', 4);
INSERT INTO public.user_store VALUES (5, '2022-02-14 17:52:00.219', '2022-02-14 17:52:00.219', 'Chennai Store', 5);
INSERT INTO public.user_store VALUES (6, '2022-02-14 17:52:00.219', '2022-02-14 17:52:00.219', 'Gujarat Store', 5);
INSERT INTO public.user_store VALUES (7, '2022-02-14 17:52:00.219', '2022-02-14 17:52:00.219', 'Banglore Store', 5);


--
-- TOC entry 3342 (class 0 OID 50060)
-- Dependencies: 214
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users VALUES (4, '2022-02-14 17:52:00.219221', '2022-02-14 17:52:00.219221', 'newUser2@gmail.com', NULL, NULL, '$2a$10$5ut/1dJiHVfd.MMBQKDZK.fd0nwGn6ryLpGuTxN7BRkdxNNMWPTGO', 'User Two');
INSERT INTO public.users VALUES (5, '2022-02-14 18:57:53.669492', '2022-02-14 18:57:53.669492', 'newUser2@gmail.com', NULL, NULL, '$2a$10$el0yh/iD3EIl56CnCrUZd.2cy9JBkjji7.I66UB9afNyZcpbTgyLC', 'User Three');


--
-- TOC entry 3351 (class 0 OID 0)
-- Dependencies: 213
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hibernate_sequence', 8, true);


--
-- TOC entry 3185 (class 2606 OID 49948)
-- Name: books books_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- TOC entry 3187 (class 2606 OID 49953)
-- Name: inventory inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_pkey PRIMARY KEY (id);


--
-- TOC entry 3189 (class 2606 OID 49958)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 3195 (class 2606 OID 50075)
-- Name: user_store store_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_store
    ADD CONSTRAINT store_pkey PRIMARY KEY (id);


--
-- TOC entry 3191 (class 2606 OID 49968)
-- Name: user_roles user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 3193 (class 2606 OID 50066)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3197 (class 2606 OID 49991)
-- Name: user_roles fkh8ciramu9cc9q3qcqiv4ue8a6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT fkh8ciramu9cc9q3qcqiv4ue8a6 FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- TOC entry 3196 (class 2606 OID 50055)
-- Name: inventory fkhqmqb0lhe7i8lnvexhw50xpi5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT fkhqmqb0lhe7i8lnvexhw50xpi5 FOREIGN KEY (book_id) REFERENCES public.books(id);


-- Completed on 2022-02-14 19:46:17

--
-- PostgreSQL database dump complete
--

