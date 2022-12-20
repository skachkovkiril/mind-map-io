--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3
-- Dumped by pg_dump version 14.6

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
-- Name: type_edge; Type: TYPE; Schema: public; Owner: root
--

CREATE TYPE public.type_edge AS ENUM (
    'arrow',
    'line'
);


ALTER TYPE public.type_edge OWNER TO root;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO root;

--
-- Name: edge; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.edge (
    id integer NOT NULL,
    type_edge public.type_edge NOT NULL,
    size integer NOT NULL,
    id_node_from integer NOT NULL,
    id_node_to integer NOT NULL,
    label character varying(100) NOT NULL
);


ALTER TABLE public.edge OWNER TO root;

--
-- Name: edge_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.edge_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.edge_id_seq OWNER TO root;

--
-- Name: edge_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.edge_id_seq OWNED BY public.edge.id;


--
-- Name: node; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.node (
    id integer NOT NULL,
    size integer NOT NULL,
    color character varying(45) NOT NULL,
    term character varying(100) NOT NULL,
    definition text NOT NULL
);


ALTER TABLE public.node OWNER TO root;

--
-- Name: node_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.node_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.node_id_seq OWNER TO root;

--
-- Name: node_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.node_id_seq OWNED BY public.node.id;


--
-- Name: edge id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.edge ALTER COLUMN id SET DEFAULT nextval('public.edge_id_seq'::regclass);


--
-- Name: node id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.node ALTER COLUMN id SET DEFAULT nextval('public.node_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.alembic_version (version_num) FROM stdin;
9bd7ff2270b3
\.


--
-- Data for Name: edge; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.edge (id, type_edge, size, id_node_from, id_node_to, label) FROM stdin;
\.


--
-- Data for Name: node; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.node (id, size, color, term, definition) FROM stdin;
\.


--
-- Name: edge_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.edge_id_seq', 1, false);


--
-- Name: node_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.node_id_seq', 1, false);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: edge edge_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.edge
    ADD CONSTRAINT edge_pkey PRIMARY KEY (id);


--
-- Name: node node_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.node
    ADD CONSTRAINT node_pkey PRIMARY KEY (id);


--
-- Name: node node_term_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.node
    ADD CONSTRAINT node_term_key UNIQUE (term);


--
-- Name: ix_edge_id_node_from; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX ix_edge_id_node_from ON public.edge USING btree (id_node_from);


--
-- Name: ix_edge_id_node_to; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX ix_edge_id_node_to ON public.edge USING btree (id_node_to);


--
-- Name: edge edge_id_node_from_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.edge
    ADD CONSTRAINT edge_id_node_from_fkey FOREIGN KEY (id_node_from) REFERENCES public.node(id);


--
-- Name: edge edge_id_node_to_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.edge
    ADD CONSTRAINT edge_id_node_to_fkey FOREIGN KEY (id_node_to) REFERENCES public.node(id);


--
-- PostgreSQL database dump complete
--

