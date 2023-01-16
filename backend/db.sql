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
1	arrow	2	2	1	является
2	arrow	2	3	1	использует
3	arrow	2	4	3	является
4	arrow	2	4	1	является
5	arrow	2	4	5	использует
6	arrow	2	4	6	обеспечивает работу
7	arrow	2	4	7	начинает соединение с
8	arrow	2	8	4	подключается к
9	arrow	2	8	9	обращается к
10	arrow	2	10	9	является
11	arrow	2	8	11	отправляет
12	arrow	2	10	12	принимает
13	arrow	2	12	11	является
14	arrow	2	4	13	использует
15	arrow	2	4	14	использует
16	arrow	2	4	15	стандартизирован в
17	arrow	2	4	16	обеспечивает
18	arrow	2	4	2	работает поверх
19	arrow	2	10	4	поддерживает
20	arrow	2	8	7	инициирует
21	arrow	2	14	13	основан на
22	arrow	2	10	2	использует
\.


--
-- Data for Name: node; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.node (id, size, color, term, definition) FROM stdin;
1	10	#00B060	Протокол передачи данных	набор соглашений интерфейса логического уровня, которые определяют обмен данными между различными программами. Эти соглашения задают единообразный способ передачи сообщений и обработки ошибок при взаимодействии программного обеспечения разнесённой в пространстве аппаратуры, соединённой тем или иным интерфейсом.
2	10	#00B060	TCP	(протокол управления передачей) – это стандарт связи, который позволяет прикладным программам и вычислительным устройствам обмениваться сообщениями по сети. Он предназначен для отправки пакетов по интернету и обеспечения успешной доставки данных и сообщений по сетям. TCP является одним из основных стандартов, определяющих правила Интернета, и включен в стандарты, определенные Инженерным советом Интернета (IETF). Это один из наиболее часто используемых протоколов в рамках цифровой сетевой связи, который обеспечивает сквозную доставку данных.
3	10	#00B060	API	это механизмы, которые позволяют двум программным компонентам взаимодействовать друг с другом, используя набор определений и протоколов.
4	10	#00B060	WebSocket	(веб-сокет) – это протокол связи, предназначенный для обмена сообщениями между клиентом и сервером в режиме реального времени. Для установления соединения клиент и сервер обмениваются особыми HTTP-запросами. После ответа от сервера устанавливается TCP-соединение, с помощью которого клиент и сервер могут начать двунаправленный обмен сообщениями.
5	10	#00B060	Обработчик событий	это функция, которая обрабатывает, или откликается на событие. Приложения должны зарегистрировать свои функции обработчиков событий в веб-браузере, указав тип события и цель. Когда в указанном целевом объекте возникнет событие указанного типа, браузер вызовет обработчик. Когда обработчики событий вызываются для какого-то объекта, мы иногда говорим, что браузер «возбудил» или «сгенерировал» событие.
6	10	#00B060	Приложение реального времени	это приложение, которое реализует процесс непрерывного получения и отправки данных в определенный временной интервал.
7	10	#00B060	Handshake	(рукопожатие) – процесс установки связи, в ходе которого браузер и сервер подтверждают свое намерение взаимодействовать по постоянному соединению.
8	10	#00B060	Клиент	это аппаратный или программный компонент вычислительной системы, посылающий запросы серверу.
9	10	#00B060	Сервер	это программный компонент вычислительной системы, выполняющий сервисные (обслуживающие) функции по запросу клиента, предоставляя ему доступ к определённым ресурсам или услугам.
10	10	#00B060	Веб-сервер	сервер, принимающий HTTP-запросы от клиентов, обычно веб-браузеров, и выдающий им HTTP-ответы, как правило, вместе с HTML-страницей, изображением, файлом, медиа-потоком или другими данными. Веб-сервером называют как ПО, выполняющее функции веб-сервера, так и непосредственно компьютер, на котором это ПО работает. Клиент, которым обычно является веб-браузер, передает веб-серверу запросы на получение ресурсов, обозначенных URL-адресами. Ресурсы – это HTML-страницы, изображения, файлы, медиа-потоки или другие данные, которые необходимы клиенту. В ответ веб-сервер передает клиенту запрошенные данные. Этот обмен происходит по протоколу HTTP.
11	10	#00B060	Запрос	представляет собой обращение к данным для получения информации или выполнения действий с данными. Запрос можно использовать для получения ответа на простой вопрос, выполнения расчетов, объединения данных из разных таблиц, а также для добавления, изменения или удаления данных в таблице.
12	10	#00B060	HTTP-запрос	это сообщение, отправляемое клиентом, чтобы инициировать реакцию со стороны сервера. Стартовая строка состоит из трёх элементов: метода HTTP, цели запроса и версии HTTP.
13	10	#00B060	SSL-сертификат	это цифровой сертификат, удостоверяющий подлинность веб-сайта и позволяющий использовать зашифрованное соединение. Аббревиатура SSL означает Secure Sockets Layer – протокол безопасности, создающий зашифрованное соединение между веб-сервером и веб-браузером. SSL-сертификаты сайтов требуются для обеспечения безопасности данных пользователей, подтверждения прав собственности на сайт, предотвращения создание поддельной версии сайта злоумышленниками и обеспечения доверия со стороны пользователей.
14	10	#00B060	Протокол TLS	криптографический протокол, который обеспечивает защищённый обмен данными между сервером и клиентом. Протокол работает на трёх уровнях защиты: отвечает за конфиденциальность передаваемых от компьютера к компьютеру данных, проводит аутентификацию, следит за целостностью передаваемой информации.
15	10	#00B060	RFC	(англ. Request for Comments – букв. «запрос комментариев», «тема для обсуждения») – рабочее предложение, документ из серии пронумерованных информационных документов Интернета, которые содержат технические спецификации и стандарты, широко применяемые во всемирной сети и регламентирующие внутреннюю жизнь Интернета. Эти документы могут содержать технические спецификации и стандарты, широко применяемые в сети. В документы RFC помимо стандартов Интернета входят также исторические справки, концепции, введения в новые направления в исследованиях, руководства по внедрению технологий, результаты экспериментов, предложения и рекомендации по развитию существующих стандартов и другие новые идеи в IT. Некоторые из таких документов представляют собой отчеты рабочих групп или описания ресурсов. Первичной публикацией документов RFC занимается IETF под эгидой ISOC. Правами на RFC обладает именно ISOC.
16	10	#00B060	Полнодуплексная связь	это связь с возможностью передачи информации между двумя устройствами в обоих направлениях, причем данные можно передавать и принимать одновременно.
\.


--
-- Name: edge_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.edge_id_seq', 22, true);


--
-- Name: node_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.node_id_seq', 16, true);


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

