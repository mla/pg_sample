--
-- PostgreSQL database dump
--

-- Dumped from database version 13.10 (Ubuntu 13.10-1.pgdg20.04+1)
-- Dumped by pg_dump version 14.7 (Ubuntu 14.7-1.pgdg20.04+1)

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
-- Name: S'"chema; Type: SCHEMA; Schema: -; Owner: mla
--

CREATE SCHEMA "S'""chema";


ALTER SCHEMA "S'""chema" OWNER TO mla;

--
-- Name: long_schema_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; Type: SCHEMA; Schema: -; Owner: mla
--

CREATE SCHEMA long_schema_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;


ALTER SCHEMA long_schema_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx OWNER TO mla;

--
-- Name: pg_repack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_repack WITH SCHEMA public;


--
-- Name: EXTENSION pg_repack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_repack IS 'Reorganize tables in PostgreSQL databases with minimal locks';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: table; Type: TABLE; Schema: S'"chema; Owner: mla
--

CREATE TABLE "S'""chema"."table" (
    "table" text NOT NULL
);


ALTER TABLE "S'""chema"."table" OWNER TO mla;

--
-- Name: table_details; Type: TABLE; Schema: S'"chema; Owner: mla
--

CREATE TABLE "S'""chema".table_details (
    table_detail_id integer NOT NULL,
    "table" text NOT NULL
);


ALTER TABLE "S'""chema".table_details OWNER TO mla;

--
-- Name: table_details_table_detail_id_seq; Type: SEQUENCE; Schema: S'"chema; Owner: mla
--

CREATE SEQUENCE "S'""chema".table_details_table_detail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "S'""chema".table_details_table_detail_id_seq OWNER TO mla;

--
-- Name: table_details_table_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: S'"chema; Owner: mla
--

ALTER SEQUENCE "S'""chema".table_details_table_detail_id_seq OWNED BY "S'""chema".table_details.table_detail_id;


--
-- Name: child; Type: TABLE; Schema: long_schema_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; Owner: mla
--

CREATE TABLE long_schema_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.child (
    id integer NOT NULL,
    parent_id integer NOT NULL
);


ALTER TABLE long_schema_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.child OWNER TO mla;

--
-- Name: long_name_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx1; Type: TABLE; Schema: long_schema_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; Owner: mla
--

CREATE TABLE long_schema_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.long_name_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx1 (
    id integer NOT NULL
);


ALTER TABLE long_schema_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.long_name_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx1 OWNER TO mla;

--
-- Name: child1; Type: TABLE; Schema: public; Owner: mla
--

CREATE TABLE public.child1 (
    child_id integer NOT NULL,
    name text NOT NULL,
    parent_id integer
);


ALTER TABLE public.child1 OWNER TO mla;

--
-- Name: child10; Type: TABLE; Schema: public; Owner: mla
--

CREATE TABLE public.child10 (
    child_id integer NOT NULL,
    name text NOT NULL,
    parent_id integer
);


ALTER TABLE public.child10 OWNER TO mla;

--
-- Name: child2; Type: TABLE; Schema: public; Owner: mla
--

CREATE TABLE public.child2 (
    child_id integer NOT NULL,
    name text NOT NULL,
    parent_id integer
);


ALTER TABLE public.child2 OWNER TO mla;

--
-- Name: child3; Type: TABLE; Schema: public; Owner: mla
--

CREATE TABLE public.child3 (
    child_id integer NOT NULL,
    name text NOT NULL,
    parent_id integer
);


ALTER TABLE public.child3 OWNER TO mla;

--
-- Name: child4; Type: TABLE; Schema: public; Owner: mla
--

CREATE TABLE public.child4 (
    child_id integer NOT NULL,
    name text NOT NULL,
    parent_id integer
);


ALTER TABLE public.child4 OWNER TO mla;

--
-- Name: child5; Type: TABLE; Schema: public; Owner: mla
--

CREATE TABLE public.child5 (
    child_id integer NOT NULL,
    name text NOT NULL,
    parent_id integer
);


ALTER TABLE public.child5 OWNER TO mla;

--
-- Name: child6; Type: TABLE; Schema: public; Owner: mla
--

CREATE TABLE public.child6 (
    child_id integer NOT NULL,
    name text NOT NULL,
    parent_id integer
);


ALTER TABLE public.child6 OWNER TO mla;

--
-- Name: child7; Type: TABLE; Schema: public; Owner: mla
--

CREATE TABLE public.child7 (
    child_id integer NOT NULL,
    name text NOT NULL,
    parent_id integer
);


ALTER TABLE public.child7 OWNER TO mla;

--
-- Name: child8; Type: TABLE; Schema: public; Owner: mla
--

CREATE TABLE public.child8 (
    child_id integer NOT NULL,
    name text NOT NULL,
    parent_id integer
);


ALTER TABLE public.child8 OWNER TO mla;

--
-- Name: child9; Type: TABLE; Schema: public; Owner: mla
--

CREATE TABLE public.child9 (
    child_id integer NOT NULL,
    name text NOT NULL,
    parent_id integer
);


ALTER TABLE public.child9 OWNER TO mla;

--
-- Name: parent; Type: TABLE; Schema: public; Owner: mla
--

CREATE TABLE public.parent (
    parent_id integer NOT NULL,
    name text NOT NULL,
    favorite_child_id integer
);


ALTER TABLE public.parent OWNER TO mla;

--
-- Name: partition_parent; Type: TABLE; Schema: public; Owner: mla
--

CREATE TABLE public.partition_parent (
    id integer NOT NULL
)
PARTITION BY RANGE (id);


ALTER TABLE public.partition_parent OWNER TO mla;

--
-- Name: partition_child; Type: TABLE; Schema: public; Owner: mla
--

CREATE TABLE public.partition_child (
    id integer NOT NULL
);


ALTER TABLE public.partition_child OWNER TO mla;

--
-- Name: test_ordered; Type: TABLE; Schema: public; Owner: mla
--

CREATE TABLE public.test_ordered (
    id integer NOT NULL,
    name text
);


ALTER TABLE public.test_ordered OWNER TO mla;

--
-- Name: test_ordered_id_seq; Type: SEQUENCE; Schema: public; Owner: mla
--

CREATE SEQUENCE public.test_ordered_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.test_ordered_id_seq OWNER TO mla;

--
-- Name: test_ordered_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mla
--

ALTER SEQUENCE public.test_ordered_id_seq OWNED BY public.test_ordered.id;


--
-- Name: partition_child; Type: TABLE ATTACH; Schema: public; Owner: mla
--

ALTER TABLE ONLY public.partition_parent ATTACH PARTITION public.partition_child FOR VALUES FROM (0) TO (100);


--
-- Name: table_details table_detail_id; Type: DEFAULT; Schema: S'"chema; Owner: mla
--

ALTER TABLE ONLY "S'""chema".table_details ALTER COLUMN table_detail_id SET DEFAULT nextval('"S''""chema".table_details_table_detail_id_seq'::regclass);


--
-- Name: test_ordered id; Type: DEFAULT; Schema: public; Owner: mla
--

ALTER TABLE ONLY public.test_ordered ALTER COLUMN id SET DEFAULT nextval('public.test_ordered_id_seq'::regclass);


--
-- Name: table_details table_details_pkey; Type: CONSTRAINT; Schema: S'"chema; Owner: mla
--

ALTER TABLE ONLY "S'""chema".table_details
    ADD CONSTRAINT table_details_pkey PRIMARY KEY (table_detail_id);


--
-- Name: table table_pkey; Type: CONSTRAINT; Schema: S'"chema; Owner: mla
--

ALTER TABLE ONLY "S'""chema"."table"
    ADD CONSTRAINT table_pkey PRIMARY KEY ("table");


--
-- Name: child child_pkey; Type: CONSTRAINT; Schema: long_schema_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; Owner: mla
--

ALTER TABLE ONLY long_schema_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.child
    ADD CONSTRAINT child_pkey PRIMARY KEY (id);


--
-- Name: long_name_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx1 long_name_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx_pkey; Type: CONSTRAINT; Schema: long_schema_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; Owner: mla
--

ALTER TABLE ONLY long_schema_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.long_name_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx1
    ADD CONSTRAINT long_name_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx_pkey PRIMARY KEY (id);


--
-- Name: child10 child10_name_key; Type: CONSTRAINT; Schema: public; Owner: mla
--

ALTER TABLE ONLY public.child10
    ADD CONSTRAINT child10_name_key UNIQUE (name);


--
-- Name: child10 child10_pkey; Type: CONSTRAINT; Schema: public; Owner: mla
--

ALTER TABLE ONLY public.child10
    ADD CONSTRAINT child10_pkey PRIMARY KEY (child_id);


--
-- Name: child1 child1_name_key; Type: CONSTRAINT; Schema: public; Owner: mla
--

ALTER TABLE ONLY public.child1
    ADD CONSTRAINT child1_name_key UNIQUE (name);


--
-- Name: child1 child1_pkey; Type: CONSTRAINT; Schema: public; Owner: mla
--

ALTER TABLE ONLY public.child1
    ADD CONSTRAINT child1_pkey PRIMARY KEY (child_id);


--
-- Name: child2 child2_name_key; Type: CONSTRAINT; Schema: public; Owner: mla
--

ALTER TABLE ONLY public.child2
    ADD CONSTRAINT child2_name_key UNIQUE (name);


--
-- Name: child2 child2_pkey; Type: CONSTRAINT; Schema: public; Owner: mla
--

ALTER TABLE ONLY public.child2
    ADD CONSTRAINT child2_pkey PRIMARY KEY (child_id);


--
-- Name: child3 child3_name_key; Type: CONSTRAINT; Schema: public; Owner: mla
--

ALTER TABLE ONLY public.child3
    ADD CONSTRAINT child3_name_key UNIQUE (name);


--
-- Name: child3 child3_pkey; Type: CONSTRAINT; Schema: public; Owner: mla
--

ALTER TABLE ONLY public.child3
    ADD CONSTRAINT child3_pkey PRIMARY KEY (child_id);


--
-- Name: child4 child4_name_key; Type: CONSTRAINT; Schema: public; Owner: mla
--

ALTER TABLE ONLY public.child4
    ADD CONSTRAINT child4_name_key UNIQUE (name);


--
-- Name: child4 child4_pkey; Type: CONSTRAINT; Schema: public; Owner: mla
--

ALTER TABLE ONLY public.child4
    ADD CONSTRAINT child4_pkey PRIMARY KEY (child_id);


--
-- Name: child5 child5_name_key; Type: CONSTRAINT; Schema: public; Owner: mla
--

ALTER TABLE ONLY public.child5
    ADD CONSTRAINT child5_name_key UNIQUE (name);


--
-- Name: child5 child5_pkey; Type: CONSTRAINT; Schema: public; Owner: mla
--

ALTER TABLE ONLY public.child5
    ADD CONSTRAINT child5_pkey PRIMARY KEY (child_id);


--
-- Name: child6 child6_name_key; Type: CONSTRAINT; Schema: public; Owner: mla
--

ALTER TABLE ONLY public.child6
    ADD CONSTRAINT child6_name_key UNIQUE (name);


--
-- Name: child6 child6_pkey; Type: CONSTRAINT; Schema: public; Owner: mla
--

ALTER TABLE ONLY public.child6
    ADD CONSTRAINT child6_pkey PRIMARY KEY (child_id);


--
-- Name: child7 child7_name_key; Type: CONSTRAINT; Schema: public; Owner: mla
--

ALTER TABLE ONLY public.child7
    ADD CONSTRAINT child7_name_key UNIQUE (name);


--
-- Name: child7 child7_pkey; Type: CONSTRAINT; Schema: public; Owner: mla
--

ALTER TABLE ONLY public.child7
    ADD CONSTRAINT child7_pkey PRIMARY KEY (child_id);


--
-- Name: child8 child8_name_key; Type: CONSTRAINT; Schema: public; Owner: mla
--

ALTER TABLE ONLY public.child8
    ADD CONSTRAINT child8_name_key UNIQUE (name);


--
-- Name: child8 child8_pkey; Type: CONSTRAINT; Schema: public; Owner: mla
--

ALTER TABLE ONLY public.child8
    ADD CONSTRAINT child8_pkey PRIMARY KEY (child_id);


--
-- Name: child9 child9_name_key; Type: CONSTRAINT; Schema: public; Owner: mla
--

ALTER TABLE ONLY public.child9
    ADD CONSTRAINT child9_name_key UNIQUE (name);


--
-- Name: child9 child9_pkey; Type: CONSTRAINT; Schema: public; Owner: mla
--

ALTER TABLE ONLY public.child9
    ADD CONSTRAINT child9_pkey PRIMARY KEY (child_id);


--
-- Name: parent parent_name_key; Type: CONSTRAINT; Schema: public; Owner: mla
--

ALTER TABLE ONLY public.parent
    ADD CONSTRAINT parent_name_key UNIQUE (name);


--
-- Name: parent parent_pkey; Type: CONSTRAINT; Schema: public; Owner: mla
--

ALTER TABLE ONLY public.parent
    ADD CONSTRAINT parent_pkey PRIMARY KEY (parent_id);


--
-- Name: partition_parent partition_parent_pkey; Type: CONSTRAINT; Schema: public; Owner: mla
--

ALTER TABLE ONLY public.partition_parent
    ADD CONSTRAINT partition_parent_pkey PRIMARY KEY (id);


--
-- Name: partition_child partition_child_pkey; Type: CONSTRAINT; Schema: public; Owner: mla
--

ALTER TABLE ONLY public.partition_child
    ADD CONSTRAINT partition_child_pkey PRIMARY KEY (id);


--
-- Name: test_ordered test_ordered_pkey; Type: CONSTRAINT; Schema: public; Owner: mla
--

ALTER TABLE ONLY public.test_ordered
    ADD CONSTRAINT test_ordered_pkey PRIMARY KEY (id);


--
-- Name: my_index; Type: INDEX; Schema: public; Owner: mla
--

CREATE INDEX my_index ON public.test_ordered USING btree (name);

ALTER TABLE public.test_ordered CLUSTER ON my_index;


--
-- Name: partition_child_pkey; Type: INDEX ATTACH; Schema: public; Owner: mla
--

ALTER INDEX public.partition_parent_pkey ATTACH PARTITION public.partition_child_pkey;


--
-- Name: table_details table_details_table_fkey; Type: FK CONSTRAINT; Schema: S'"chema; Owner: mla
--

ALTER TABLE ONLY "S'""chema".table_details
    ADD CONSTRAINT table_details_table_fkey FOREIGN KEY ("table") REFERENCES "S'""chema"."table"("table") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: child child_parent_id_fkey; Type: FK CONSTRAINT; Schema: long_schema_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; Owner: mla
--

ALTER TABLE ONLY long_schema_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.child
    ADD CONSTRAINT child_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES long_schema_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx.long_name_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx1(id);


--
-- Name: child10 child10_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mla
--

ALTER TABLE ONLY public.child10
    ADD CONSTRAINT child10_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.parent(parent_id) ON UPDATE CASCADE;


--
-- Name: child1 child1_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mla
--

ALTER TABLE ONLY public.child1
    ADD CONSTRAINT child1_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.parent(parent_id) ON UPDATE CASCADE;


--
-- Name: child2 child2_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mla
--

ALTER TABLE ONLY public.child2
    ADD CONSTRAINT child2_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.parent(parent_id) ON UPDATE CASCADE;


--
-- Name: child3 child3_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mla
--

ALTER TABLE ONLY public.child3
    ADD CONSTRAINT child3_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.parent(parent_id) ON UPDATE CASCADE;


--
-- Name: child4 child4_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mla
--

ALTER TABLE ONLY public.child4
    ADD CONSTRAINT child4_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.parent(parent_id) ON UPDATE CASCADE;


--
-- Name: child5 child5_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mla
--

ALTER TABLE ONLY public.child5
    ADD CONSTRAINT child5_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.parent(parent_id) ON UPDATE CASCADE;


--
-- Name: child6 child6_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mla
--

ALTER TABLE ONLY public.child6
    ADD CONSTRAINT child6_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.parent(parent_id) ON UPDATE CASCADE;


--
-- Name: child7 child7_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mla
--

ALTER TABLE ONLY public.child7
    ADD CONSTRAINT child7_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.parent(parent_id) ON UPDATE CASCADE;


--
-- Name: child8 child8_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mla
--

ALTER TABLE ONLY public.child8
    ADD CONSTRAINT child8_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.parent(parent_id) ON UPDATE CASCADE;


--
-- Name: child9 child9_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mla
--

ALTER TABLE ONLY public.child9
    ADD CONSTRAINT child9_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.parent(parent_id) ON UPDATE CASCADE;


--
-- Name: parent parent_favorite_child_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mla
--

ALTER TABLE ONLY public.parent
    ADD CONSTRAINT parent_favorite_child_id_fkey FOREIGN KEY (favorite_child_id) REFERENCES public.child1(child_id);


--
-- PostgreSQL database dump complete
--


SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;


SELECT pg_catalog.setval('"S''""chema"."table_details_table_detail_id_seq"', 1);
SELECT pg_catalog.setval('"public"."test_ordered_id_seq"', 1);


ALTER TABLE "S'""chema"."table" DISABLE TRIGGER ALL;
ALTER TABLE "S'""chema"."table_details" DISABLE TRIGGER ALL;
ALTER TABLE "long_schema_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"."child" DISABLE TRIGGER ALL;
ALTER TABLE "long_schema_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"."long_name_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx1" DISABLE TRIGGER ALL;
ALTER TABLE "public"."child1" DISABLE TRIGGER ALL;
ALTER TABLE "public"."child10" DISABLE TRIGGER ALL;
ALTER TABLE "public"."child2" DISABLE TRIGGER ALL;
ALTER TABLE "public"."child3" DISABLE TRIGGER ALL;
ALTER TABLE "public"."child4" DISABLE TRIGGER ALL;
ALTER TABLE "public"."child5" DISABLE TRIGGER ALL;
ALTER TABLE "public"."child6" DISABLE TRIGGER ALL;
ALTER TABLE "public"."child7" DISABLE TRIGGER ALL;
ALTER TABLE "public"."child8" DISABLE TRIGGER ALL;
ALTER TABLE "public"."child9" DISABLE TRIGGER ALL;
ALTER TABLE "public"."parent" DISABLE TRIGGER ALL;
ALTER TABLE "public"."partition_child" DISABLE TRIGGER ALL;
ALTER TABLE "public"."test_ordered" DISABLE TRIGGER ALL;

COPY "S'""chema"."table" FROM stdin;
\.

COPY "S'""chema"."table_details" FROM stdin;
\.

COPY "long_schema_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"."child" FROM stdin;
1	1
2	2
3	3
4	4
5	5
6	6
7	7
8	8
9	9
10	10
\.

COPY "long_schema_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"."long_name_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx1" FROM stdin;
1
2
3
4
5
6
7
8
9
10
\.

COPY "public"."child1" FROM stdin;
1	c1	1
2	c2	2
3	c3	3
4	c4	4
5	c5	5
6	c6	6
7	c7	7
8	c8	8
9	c9	9
10	c10	10
11	c11	11
12	c12	12
13	c13	13
14	c14	14
15	c15	15
16	c16	16
17	c17	17
18	c18	18
19	c19	19
20	c20	20
21	c21	21
22	c22	22
23	c23	23
24	c24	24
25	c25	25
26	c26	26
27	c27	27
28	c28	28
29	c29	29
30	c30	30
31	c31	31
32	c32	32
33	c33	33
34	c34	34
35	c35	35
36	c36	36
37	c37	37
38	c38	38
39	c39	39
40	c40	40
41	c41	41
42	c42	42
43	c43	43
44	c44	44
45	c45	45
46	c46	46
47	c47	47
48	c48	48
49	c49	49
50	c50	50
51	c51	51
52	c52	52
53	c53	53
54	c54	54
55	c55	55
56	c56	56
57	c57	57
58	c58	58
59	c59	59
60	c60	60
61	c61	61
62	c62	62
63	c63	63
64	c64	64
65	c65	65
66	c66	66
67	c67	67
68	c68	68
69	c69	69
70	c70	70
71	c71	71
72	c72	72
73	c73	73
74	c74	74
75	c75	75
76	c76	76
77	c77	77
78	c78	78
79	c79	79
80	c80	80
81	c81	81
82	c82	82
83	c83	83
84	c84	84
85	c85	85
86	c86	86
87	c87	87
88	c88	88
89	c89	89
90	c90	90
91	c91	91
92	c92	92
93	c93	93
94	c94	94
95	c95	95
96	c96	96
97	c97	97
98	c98	98
99	c99	99
100	c100	100
\.

COPY "public"."child10" FROM stdin;
1	c1	901
2	c2	902
3	c3	903
4	c4	904
5	c5	905
6	c6	906
7	c7	907
8	c8	908
9	c9	909
10	c10	910
11	c11	911
12	c12	912
13	c13	913
14	c14	914
15	c15	915
16	c16	916
17	c17	917
18	c18	918
19	c19	919
20	c20	920
21	c21	921
22	c22	922
23	c23	923
24	c24	924
25	c25	925
26	c26	926
27	c27	927
28	c28	928
29	c29	929
30	c30	930
31	c31	931
32	c32	932
33	c33	933
34	c34	934
35	c35	935
36	c36	936
37	c37	937
38	c38	938
39	c39	939
40	c40	940
41	c41	941
42	c42	942
43	c43	943
44	c44	944
45	c45	945
46	c46	946
47	c47	947
48	c48	948
49	c49	949
50	c50	950
51	c51	951
52	c52	952
53	c53	953
54	c54	954
55	c55	955
56	c56	956
57	c57	957
58	c58	958
59	c59	959
60	c60	960
61	c61	961
62	c62	962
63	c63	963
64	c64	964
65	c65	965
66	c66	966
67	c67	967
68	c68	968
69	c69	969
70	c70	970
71	c71	971
72	c72	972
73	c73	973
74	c74	974
75	c75	975
76	c76	976
77	c77	977
78	c78	978
79	c79	979
80	c80	980
81	c81	981
82	c82	982
83	c83	983
84	c84	984
85	c85	985
86	c86	986
87	c87	987
88	c88	988
89	c89	989
90	c90	990
91	c91	991
92	c92	992
93	c93	993
94	c94	994
95	c95	995
96	c96	996
97	c97	997
98	c98	998
99	c99	999
100	c100	1000
\.

COPY "public"."child2" FROM stdin;
1	c1	101
2	c2	102
3	c3	103
4	c4	104
5	c5	105
6	c6	106
7	c7	107
8	c8	108
9	c9	109
10	c10	110
11	c11	111
12	c12	112
13	c13	113
14	c14	114
15	c15	115
16	c16	116
17	c17	117
18	c18	118
19	c19	119
20	c20	120
21	c21	121
22	c22	122
23	c23	123
24	c24	124
25	c25	125
26	c26	126
27	c27	127
28	c28	128
29	c29	129
30	c30	130
31	c31	131
32	c32	132
33	c33	133
34	c34	134
35	c35	135
36	c36	136
37	c37	137
38	c38	138
39	c39	139
40	c40	140
41	c41	141
42	c42	142
43	c43	143
44	c44	144
45	c45	145
46	c46	146
47	c47	147
48	c48	148
49	c49	149
50	c50	150
51	c51	151
52	c52	152
53	c53	153
54	c54	154
55	c55	155
56	c56	156
57	c57	157
58	c58	158
59	c59	159
60	c60	160
61	c61	161
62	c62	162
63	c63	163
64	c64	164
65	c65	165
66	c66	166
67	c67	167
68	c68	168
69	c69	169
70	c70	170
71	c71	171
72	c72	172
73	c73	173
74	c74	174
75	c75	175
76	c76	176
77	c77	177
78	c78	178
79	c79	179
80	c80	180
81	c81	181
82	c82	182
83	c83	183
84	c84	184
85	c85	185
86	c86	186
87	c87	187
88	c88	188
89	c89	189
90	c90	190
91	c91	191
92	c92	192
93	c93	193
94	c94	194
95	c95	195
96	c96	196
97	c97	197
98	c98	198
99	c99	199
100	c100	200
\.

COPY "public"."child3" FROM stdin;
1	c1	201
2	c2	202
3	c3	203
4	c4	204
5	c5	205
6	c6	206
7	c7	207
8	c8	208
9	c9	209
10	c10	210
11	c11	211
12	c12	212
13	c13	213
14	c14	214
15	c15	215
16	c16	216
17	c17	217
18	c18	218
19	c19	219
20	c20	220
21	c21	221
22	c22	222
23	c23	223
24	c24	224
25	c25	225
26	c26	226
27	c27	227
28	c28	228
29	c29	229
30	c30	230
31	c31	231
32	c32	232
33	c33	233
34	c34	234
35	c35	235
36	c36	236
37	c37	237
38	c38	238
39	c39	239
40	c40	240
41	c41	241
42	c42	242
43	c43	243
44	c44	244
45	c45	245
46	c46	246
47	c47	247
48	c48	248
49	c49	249
50	c50	250
51	c51	251
52	c52	252
53	c53	253
54	c54	254
55	c55	255
56	c56	256
57	c57	257
58	c58	258
59	c59	259
60	c60	260
61	c61	261
62	c62	262
63	c63	263
64	c64	264
65	c65	265
66	c66	266
67	c67	267
68	c68	268
69	c69	269
70	c70	270
71	c71	271
72	c72	272
73	c73	273
74	c74	274
75	c75	275
76	c76	276
77	c77	277
78	c78	278
79	c79	279
80	c80	280
81	c81	281
82	c82	282
83	c83	283
84	c84	284
85	c85	285
86	c86	286
87	c87	287
88	c88	288
89	c89	289
90	c90	290
91	c91	291
92	c92	292
93	c93	293
94	c94	294
95	c95	295
96	c96	296
97	c97	297
98	c98	298
99	c99	299
100	c100	300
\.

COPY "public"."child4" FROM stdin;
1	c1	301
2	c2	302
3	c3	303
4	c4	304
5	c5	305
6	c6	306
7	c7	307
8	c8	308
9	c9	309
10	c10	310
11	c11	311
12	c12	312
13	c13	313
14	c14	314
15	c15	315
16	c16	316
17	c17	317
18	c18	318
19	c19	319
20	c20	320
21	c21	321
22	c22	322
23	c23	323
24	c24	324
25	c25	325
26	c26	326
27	c27	327
28	c28	328
29	c29	329
30	c30	330
31	c31	331
32	c32	332
33	c33	333
34	c34	334
35	c35	335
36	c36	336
37	c37	337
38	c38	338
39	c39	339
40	c40	340
41	c41	341
42	c42	342
43	c43	343
44	c44	344
45	c45	345
46	c46	346
47	c47	347
48	c48	348
49	c49	349
50	c50	350
51	c51	351
52	c52	352
53	c53	353
54	c54	354
55	c55	355
56	c56	356
57	c57	357
58	c58	358
59	c59	359
60	c60	360
61	c61	361
62	c62	362
63	c63	363
64	c64	364
65	c65	365
66	c66	366
67	c67	367
68	c68	368
69	c69	369
70	c70	370
71	c71	371
72	c72	372
73	c73	373
74	c74	374
75	c75	375
76	c76	376
77	c77	377
78	c78	378
79	c79	379
80	c80	380
81	c81	381
82	c82	382
83	c83	383
84	c84	384
85	c85	385
86	c86	386
87	c87	387
88	c88	388
89	c89	389
90	c90	390
91	c91	391
92	c92	392
93	c93	393
94	c94	394
95	c95	395
96	c96	396
97	c97	397
98	c98	398
99	c99	399
100	c100	400
\.

COPY "public"."child5" FROM stdin;
1	c1	401
2	c2	402
3	c3	403
4	c4	404
5	c5	405
6	c6	406
7	c7	407
8	c8	408
9	c9	409
10	c10	410
11	c11	411
12	c12	412
13	c13	413
14	c14	414
15	c15	415
16	c16	416
17	c17	417
18	c18	418
19	c19	419
20	c20	420
21	c21	421
22	c22	422
23	c23	423
24	c24	424
25	c25	425
26	c26	426
27	c27	427
28	c28	428
29	c29	429
30	c30	430
31	c31	431
32	c32	432
33	c33	433
34	c34	434
35	c35	435
36	c36	436
37	c37	437
38	c38	438
39	c39	439
40	c40	440
41	c41	441
42	c42	442
43	c43	443
44	c44	444
45	c45	445
46	c46	446
47	c47	447
48	c48	448
49	c49	449
50	c50	450
51	c51	451
52	c52	452
53	c53	453
54	c54	454
55	c55	455
56	c56	456
57	c57	457
58	c58	458
59	c59	459
60	c60	460
61	c61	461
62	c62	462
63	c63	463
64	c64	464
65	c65	465
66	c66	466
67	c67	467
68	c68	468
69	c69	469
70	c70	470
71	c71	471
72	c72	472
73	c73	473
74	c74	474
75	c75	475
76	c76	476
77	c77	477
78	c78	478
79	c79	479
80	c80	480
81	c81	481
82	c82	482
83	c83	483
84	c84	484
85	c85	485
86	c86	486
87	c87	487
88	c88	488
89	c89	489
90	c90	490
91	c91	491
92	c92	492
93	c93	493
94	c94	494
95	c95	495
96	c96	496
97	c97	497
98	c98	498
99	c99	499
100	c100	500
\.

COPY "public"."child6" FROM stdin;
1	c1	501
2	c2	502
3	c3	503
4	c4	504
5	c5	505
6	c6	506
7	c7	507
8	c8	508
9	c9	509
10	c10	510
11	c11	511
12	c12	512
13	c13	513
14	c14	514
15	c15	515
16	c16	516
17	c17	517
18	c18	518
19	c19	519
20	c20	520
21	c21	521
22	c22	522
23	c23	523
24	c24	524
25	c25	525
26	c26	526
27	c27	527
28	c28	528
29	c29	529
30	c30	530
31	c31	531
32	c32	532
33	c33	533
34	c34	534
35	c35	535
36	c36	536
37	c37	537
38	c38	538
39	c39	539
40	c40	540
41	c41	541
42	c42	542
43	c43	543
44	c44	544
45	c45	545
46	c46	546
47	c47	547
48	c48	548
49	c49	549
50	c50	550
51	c51	551
52	c52	552
53	c53	553
54	c54	554
55	c55	555
56	c56	556
57	c57	557
58	c58	558
59	c59	559
60	c60	560
61	c61	561
62	c62	562
63	c63	563
64	c64	564
65	c65	565
66	c66	566
67	c67	567
68	c68	568
69	c69	569
70	c70	570
71	c71	571
72	c72	572
73	c73	573
74	c74	574
75	c75	575
76	c76	576
77	c77	577
78	c78	578
79	c79	579
80	c80	580
81	c81	581
82	c82	582
83	c83	583
84	c84	584
85	c85	585
86	c86	586
87	c87	587
88	c88	588
89	c89	589
90	c90	590
91	c91	591
92	c92	592
93	c93	593
94	c94	594
95	c95	595
96	c96	596
97	c97	597
98	c98	598
99	c99	599
100	c100	600
\.

COPY "public"."child7" FROM stdin;
1	c1	601
2	c2	602
3	c3	603
4	c4	604
5	c5	605
6	c6	606
7	c7	607
8	c8	608
9	c9	609
10	c10	610
11	c11	611
12	c12	612
13	c13	613
14	c14	614
15	c15	615
16	c16	616
17	c17	617
18	c18	618
19	c19	619
20	c20	620
21	c21	621
22	c22	622
23	c23	623
24	c24	624
25	c25	625
26	c26	626
27	c27	627
28	c28	628
29	c29	629
30	c30	630
31	c31	631
32	c32	632
33	c33	633
34	c34	634
35	c35	635
36	c36	636
37	c37	637
38	c38	638
39	c39	639
40	c40	640
41	c41	641
42	c42	642
43	c43	643
44	c44	644
45	c45	645
46	c46	646
47	c47	647
48	c48	648
49	c49	649
50	c50	650
51	c51	651
52	c52	652
53	c53	653
54	c54	654
55	c55	655
56	c56	656
57	c57	657
58	c58	658
59	c59	659
60	c60	660
61	c61	661
62	c62	662
63	c63	663
64	c64	664
65	c65	665
66	c66	666
67	c67	667
68	c68	668
69	c69	669
70	c70	670
71	c71	671
72	c72	672
73	c73	673
74	c74	674
75	c75	675
76	c76	676
77	c77	677
78	c78	678
79	c79	679
80	c80	680
81	c81	681
82	c82	682
83	c83	683
84	c84	684
85	c85	685
86	c86	686
87	c87	687
88	c88	688
89	c89	689
90	c90	690
91	c91	691
92	c92	692
93	c93	693
94	c94	694
95	c95	695
96	c96	696
97	c97	697
98	c98	698
99	c99	699
100	c100	700
\.

COPY "public"."child8" FROM stdin;
1	c1	701
2	c2	702
3	c3	703
4	c4	704
5	c5	705
6	c6	706
7	c7	707
8	c8	708
9	c9	709
10	c10	710
11	c11	711
12	c12	712
13	c13	713
14	c14	714
15	c15	715
16	c16	716
17	c17	717
18	c18	718
19	c19	719
20	c20	720
21	c21	721
22	c22	722
23	c23	723
24	c24	724
25	c25	725
26	c26	726
27	c27	727
28	c28	728
29	c29	729
30	c30	730
31	c31	731
32	c32	732
33	c33	733
34	c34	734
35	c35	735
36	c36	736
37	c37	737
38	c38	738
39	c39	739
40	c40	740
41	c41	741
42	c42	742
43	c43	743
44	c44	744
45	c45	745
46	c46	746
47	c47	747
48	c48	748
49	c49	749
50	c50	750
51	c51	751
52	c52	752
53	c53	753
54	c54	754
55	c55	755
56	c56	756
57	c57	757
58	c58	758
59	c59	759
60	c60	760
61	c61	761
62	c62	762
63	c63	763
64	c64	764
65	c65	765
66	c66	766
67	c67	767
68	c68	768
69	c69	769
70	c70	770
71	c71	771
72	c72	772
73	c73	773
74	c74	774
75	c75	775
76	c76	776
77	c77	777
78	c78	778
79	c79	779
80	c80	780
81	c81	781
82	c82	782
83	c83	783
84	c84	784
85	c85	785
86	c86	786
87	c87	787
88	c88	788
89	c89	789
90	c90	790
91	c91	791
92	c92	792
93	c93	793
94	c94	794
95	c95	795
96	c96	796
97	c97	797
98	c98	798
99	c99	799
100	c100	800
\.

COPY "public"."child9" FROM stdin;
1	c1	801
2	c2	802
3	c3	803
4	c4	804
5	c5	805
6	c6	806
7	c7	807
8	c8	808
9	c9	809
10	c10	810
11	c11	811
12	c12	812
13	c13	813
14	c14	814
15	c15	815
16	c16	816
17	c17	817
18	c18	818
19	c19	819
20	c20	820
21	c21	821
22	c22	822
23	c23	823
24	c24	824
25	c25	825
26	c26	826
27	c27	827
28	c28	828
29	c29	829
30	c30	830
31	c31	831
32	c32	832
33	c33	833
34	c34	834
35	c35	835
36	c36	836
37	c37	837
38	c38	838
39	c39	839
40	c40	840
41	c41	841
42	c42	842
43	c43	843
44	c44	844
45	c45	845
46	c46	846
47	c47	847
48	c48	848
49	c49	849
50	c50	850
51	c51	851
52	c52	852
53	c53	853
54	c54	854
55	c55	855
56	c56	856
57	c57	857
58	c58	858
59	c59	859
60	c60	860
61	c61	861
62	c62	862
63	c63	863
64	c64	864
65	c65	865
66	c66	866
67	c67	867
68	c68	868
69	c69	869
70	c70	870
71	c71	871
72	c72	872
73	c73	873
74	c74	874
75	c75	875
76	c76	876
77	c77	877
78	c78	878
79	c79	879
80	c80	880
81	c81	881
82	c82	882
83	c83	883
84	c84	884
85	c85	885
86	c86	886
87	c87	887
88	c88	888
89	c89	889
90	c90	890
91	c91	891
92	c92	892
93	c93	893
94	c94	894
95	c95	895
96	c96	896
97	c97	897
98	c98	898
99	c99	899
100	c100	900
\.

COPY "public"."parent" FROM stdin;
2	p2	\N
3	p3	\N
4	p4	\N
5	p5	\N
6	p6	\N
7	p7	\N
8	p8	\N
9	p9	\N
10	p10	\N
11	p11	\N
12	p12	\N
13	p13	\N
14	p14	\N
15	p15	\N
16	p16	\N
17	p17	\N
18	p18	\N
19	p19	\N
20	p20	\N
21	p21	\N
22	p22	\N
23	p23	\N
24	p24	\N
25	p25	\N
26	p26	\N
27	p27	\N
28	p28	\N
29	p29	\N
30	p30	\N
31	p31	\N
32	p32	\N
33	p33	\N
34	p34	\N
35	p35	\N
36	p36	\N
37	p37	\N
38	p38	\N
39	p39	\N
40	p40	\N
41	p41	\N
42	p42	\N
43	p43	\N
44	p44	\N
45	p45	\N
46	p46	\N
47	p47	\N
48	p48	\N
49	p49	\N
50	p50	\N
51	p51	\N
52	p52	\N
53	p53	\N
54	p54	\N
55	p55	\N
56	p56	\N
57	p57	\N
58	p58	\N
59	p59	\N
60	p60	\N
61	p61	\N
62	p62	\N
63	p63	\N
64	p64	\N
65	p65	\N
66	p66	\N
67	p67	\N
68	p68	\N
69	p69	\N
70	p70	\N
71	p71	\N
72	p72	\N
73	p73	\N
74	p74	\N
75	p75	\N
76	p76	\N
77	p77	\N
78	p78	\N
79	p79	\N
80	p80	\N
81	p81	\N
82	p82	\N
83	p83	\N
84	p84	\N
85	p85	\N
86	p86	\N
87	p87	\N
88	p88	\N
89	p89	\N
90	p90	\N
91	p91	\N
92	p92	\N
93	p93	\N
94	p94	\N
95	p95	\N
96	p96	\N
97	p97	\N
98	p98	\N
99	p99	\N
100	p100	\N
101	p101	\N
691	p691	\N
660	p660	\N
649	p649	\N
684	p684	\N
607	p607	\N
658	p658	\N
644	p644	\N
686	p686	\N
642	p642	\N
620	p620	\N
674	p674	\N
643	p643	\N
682	p682	\N
667	p667	\N
653	p653	\N
602	p602	\N
617	p617	\N
683	p683	\N
616	p616	\N
632	p632	\N
614	p614	\N
609	p609	\N
619	p619	\N
611	p611	\N
646	p646	\N
618	p618	\N
694	p694	\N
688	p688	\N
603	p603	\N
685	p685	\N
635	p635	\N
610	p610	\N
699	p699	\N
639	p639	\N
631	p631	\N
669	p669	\N
655	p655	\N
692	p692	\N
648	p648	\N
664	p664	\N
700	p700	\N
625	p625	\N
698	p698	\N
695	p695	\N
662	p662	\N
624	p624	\N
636	p636	\N
627	p627	\N
672	p672	\N
651	p651	\N
654	p654	\N
676	p676	\N
652	p652	\N
696	p696	\N
677	p677	\N
673	p673	\N
629	p629	\N
623	p623	\N
605	p605	\N
690	p690	\N
665	p665	\N
641	p641	\N
628	p628	\N
687	p687	\N
604	p604	\N
634	p634	\N
657	p657	\N
645	p645	\N
615	p615	\N
681	p681	\N
656	p656	\N
650	p650	\N
622	p622	\N
613	p613	\N
621	p621	\N
638	p638	\N
679	p679	\N
675	p675	\N
630	p630	\N
612	p612	\N
693	p693	\N
608	p608	\N
661	p661	\N
626	p626	\N
606	p606	\N
671	p671	\N
659	p659	\N
678	p678	\N
601	p601	\N
666	p666	\N
670	p670	\N
680	p680	\N
637	p637	\N
689	p689	\N
647	p647	\N
663	p663	\N
633	p633	\N
640	p640	\N
697	p697	\N
668	p668	\N
289	p289	\N
256	p256	\N
233	p233	\N
298	p298	\N
260	p260	\N
206	p206	\N
238	p238	\N
225	p225	\N
295	p295	\N
227	p227	\N
211	p211	\N
284	p284	\N
237	p237	\N
272	p272	\N
297	p297	\N
242	p242	\N
212	p212	\N
291	p291	\N
202	p202	\N
299	p299	\N
230	p230	\N
271	p271	\N
263	p263	\N
268	p268	\N
236	p236	\N
214	p214	\N
248	p248	\N
204	p204	\N
300	p300	\N
278	p278	\N
265	p265	\N
258	p258	\N
240	p240	\N
232	p232	\N
216	p216	\N
276	p276	\N
229	p229	\N
281	p281	\N
275	p275	\N
270	p270	\N
215	p215	\N
250	p250	\N
273	p273	\N
210	p210	\N
218	p218	\N
288	p288	\N
251	p251	\N
213	p213	\N
234	p234	\N
292	p292	\N
253	p253	\N
249	p249	\N
243	p243	\N
282	p282	\N
259	p259	\N
209	p209	\N
290	p290	\N
296	p296	\N
203	p203	\N
280	p280	\N
231	p231	\N
201	p201	\N
279	p279	\N
266	p266	\N
264	p264	\N
223	p223	\N
293	p293	\N
217	p217	\N
222	p222	\N
220	p220	\N
252	p252	\N
224	p224	\N
267	p267	\N
245	p245	\N
283	p283	\N
262	p262	\N
247	p247	\N
241	p241	\N
246	p246	\N
207	p207	\N
244	p244	\N
235	p235	\N
285	p285	\N
208	p208	\N
205	p205	\N
294	p294	\N
261	p261	\N
221	p221	\N
219	p219	\N
286	p286	\N
257	p257	\N
269	p269	\N
277	p277	\N
274	p274	\N
228	p228	\N
287	p287	\N
254	p254	\N
226	p226	\N
239	p239	\N
255	p255	\N
447	p447	\N
456	p456	\N
403	p403	\N
485	p485	\N
405	p405	\N
484	p484	\N
409	p409	\N
429	p429	\N
421	p421	\N
499	p499	\N
437	p437	\N
487	p487	\N
474	p474	\N
495	p495	\N
482	p482	\N
434	p434	\N
424	p424	\N
418	p418	\N
431	p431	\N
478	p478	\N
475	p475	\N
470	p470	\N
436	p436	\N
415	p415	\N
401	p401	\N
458	p458	\N
477	p477	\N
451	p451	\N
467	p467	\N
488	p488	\N
449	p449	\N
464	p464	\N
496	p496	\N
419	p419	\N
472	p472	\N
426	p426	\N
490	p490	\N
445	p445	\N
422	p422	\N
494	p494	\N
427	p427	\N
463	p463	\N
404	p404	\N
442	p442	\N
423	p423	\N
411	p411	\N
413	p413	\N
452	p452	\N
406	p406	\N
480	p480	\N
469	p469	\N
461	p461	\N
457	p457	\N
450	p450	\N
428	p428	\N
500	p500	\N
462	p462	\N
439	p439	\N
438	p438	\N
491	p491	\N
479	p479	\N
468	p468	\N
425	p425	\N
483	p483	\N
460	p460	\N
417	p417	\N
453	p453	\N
448	p448	\N
465	p465	\N
441	p441	\N
443	p443	\N
471	p471	\N
444	p444	\N
402	p402	\N
492	p492	\N
430	p430	\N
410	p410	\N
493	p493	\N
414	p414	\N
408	p408	\N
454	p454	\N
497	p497	\N
476	p476	\N
433	p433	\N
420	p420	\N
473	p473	\N
446	p446	\N
455	p455	\N
432	p432	\N
407	p407	\N
466	p466	\N
459	p459	\N
435	p435	\N
489	p489	\N
481	p481	\N
412	p412	\N
486	p486	\N
440	p440	\N
498	p498	\N
416	p416	\N
176	p176	\N
153	p153	\N
190	p190	\N
138	p138	\N
125	p125	\N
174	p174	\N
185	p185	\N
151	p151	\N
102	p102	\N
184	p184	\N
132	p132	\N
173	p173	\N
116	p116	\N
165	p165	\N
135	p135	\N
117	p117	\N
170	p170	\N
106	p106	\N
198	p198	\N
144	p144	\N
104	p104	\N
192	p192	\N
178	p178	\N
150	p150	\N
191	p191	\N
129	p129	\N
182	p182	\N
181	p181	\N
148	p148	\N
136	p136	\N
155	p155	\N
152	p152	\N
108	p108	\N
188	p188	\N
167	p167	\N
118	p118	\N
166	p166	\N
162	p162	\N
105	p105	\N
163	p163	\N
149	p149	\N
133	p133	\N
130	p130	\N
124	p124	\N
126	p126	\N
196	p196	\N
183	p183	\N
161	p161	\N
157	p157	\N
139	p139	\N
172	p172	\N
147	p147	\N
140	p140	\N
154	p154	\N
109	p109	\N
128	p128	\N
187	p187	\N
193	p193	\N
160	p160	\N
142	p142	\N
164	p164	\N
123	p123	\N
159	p159	\N
122	p122	\N
121	p121	\N
197	p197	\N
171	p171	\N
110	p110	\N
156	p156	\N
143	p143	\N
134	p134	\N
111	p111	\N
199	p199	\N
194	p194	\N
175	p175	\N
113	p113	\N
120	p120	\N
145	p145	\N
186	p186	\N
200	p200	\N
158	p158	\N
131	p131	\N
127	p127	\N
169	p169	\N
103	p103	\N
146	p146	\N
168	p168	\N
114	p114	\N
115	p115	\N
195	p195	\N
137	p137	\N
119	p119	\N
180	p180	\N
179	p179	\N
141	p141	\N
177	p177	\N
189	p189	\N
112	p112	\N
107	p107	\N
1	\\.	100
535	p535	\N
553	p553	\N
575	p575	\N
564	p564	\N
505	p505	\N
512	p512	\N
554	p554	\N
541	p541	\N
561	p561	\N
562	p562	\N
525	p525	\N
579	p579	\N
543	p543	\N
529	p529	\N
581	p581	\N
523	p523	\N
538	p538	\N
502	p502	\N
582	p582	\N
585	p585	\N
547	p547	\N
546	p546	\N
544	p544	\N
533	p533	\N
593	p593	\N
590	p590	\N
557	p557	\N
536	p536	\N
580	p580	\N
542	p542	\N
501	p501	\N
518	p518	\N
578	p578	\N
599	p599	\N
568	p568	\N
508	p508	\N
563	p563	\N
540	p540	\N
534	p534	\N
503	p503	\N
526	p526	\N
577	p577	\N
598	p598	\N
510	p510	\N
519	p519	\N
592	p592	\N
596	p596	\N
587	p587	\N
556	p556	\N
521	p521	\N
515	p515	\N
589	p589	\N
574	p574	\N
504	p504	\N
565	p565	\N
520	p520	\N
594	p594	\N
597	p597	\N
548	p548	\N
537	p537	\N
531	p531	\N
530	p530	\N
570	p570	\N
595	p595	\N
511	p511	\N
559	p559	\N
509	p509	\N
600	p600	\N
524	p524	\N
507	p507	\N
506	p506	\N
566	p566	\N
549	p549	\N
514	p514	\N
569	p569	\N
527	p527	\N
584	p584	\N
571	p571	\N
539	p539	\N
517	p517	\N
516	p516	\N
552	p552	\N
572	p572	\N
532	p532	\N
558	p558	\N
550	p550	\N
586	p586	\N
513	p513	\N
551	p551	\N
583	p583	\N
555	p555	\N
528	p528	\N
573	p573	\N
588	p588	\N
560	p560	\N
567	p567	\N
576	p576	\N
591	p591	\N
545	p545	\N
522	p522	\N
887	p887	\N
826	p826	\N
897	p897	\N
898	p898	\N
858	p858	\N
836	p836	\N
837	p837	\N
861	p861	\N
834	p834	\N
830	p830	\N
853	p853	\N
875	p875	\N
849	p849	\N
862	p862	\N
855	p855	\N
859	p859	\N
889	p889	\N
888	p888	\N
886	p886	\N
842	p842	\N
802	p802	\N
803	p803	\N
809	p809	\N
832	p832	\N
871	p871	\N
854	p854	\N
847	p847	\N
819	p819	\N
872	p872	\N
840	p840	\N
896	p896	\N
816	p816	\N
900	p900	\N
894	p894	\N
890	p890	\N
868	p868	\N
891	p891	\N
839	p839	\N
863	p863	\N
806	p806	\N
880	p880	\N
864	p864	\N
899	p899	\N
829	p829	\N
812	p812	\N
879	p879	\N
841	p841	\N
857	p857	\N
851	p851	\N
845	p845	\N
882	p882	\N
885	p885	\N
867	p867	\N
822	p822	\N
818	p818	\N
807	p807	\N
884	p884	\N
813	p813	\N
895	p895	\N
870	p870	\N
824	p824	\N
846	p846	\N
828	p828	\N
866	p866	\N
811	p811	\N
850	p850	\N
848	p848	\N
801	p801	\N
856	p856	\N
835	p835	\N
810	p810	\N
874	p874	\N
892	p892	\N
821	p821	\N
876	p876	\N
865	p865	\N
817	p817	\N
833	p833	\N
873	p873	\N
804	p804	\N
838	p838	\N
860	p860	\N
820	p820	\N
823	p823	\N
844	p844	\N
878	p878	\N
805	p805	\N
893	p893	\N
881	p881	\N
877	p877	\N
852	p852	\N
815	p815	\N
869	p869	\N
825	p825	\N
814	p814	\N
843	p843	\N
808	p808	\N
883	p883	\N
827	p827	\N
831	p831	\N
301	p301	\N
372	p372	\N
355	p355	\N
390	p390	\N
331	p331	\N
370	p370	\N
318	p318	\N
393	p393	\N
350	p350	\N
396	p396	\N
386	p386	\N
365	p365	\N
363	p363	\N
315	p315	\N
327	p327	\N
330	p330	\N
383	p383	\N
375	p375	\N
347	p347	\N
362	p362	\N
354	p354	\N
325	p325	\N
374	p374	\N
302	p302	\N
338	p338	\N
311	p311	\N
314	p314	\N
312	p312	\N
308	p308	\N
364	p364	\N
329	p329	\N
319	p319	\N
307	p307	\N
387	p387	\N
367	p367	\N
306	p306	\N
323	p323	\N
377	p377	\N
357	p357	\N
360	p360	\N
373	p373	\N
395	p395	\N
313	p313	\N
359	p359	\N
305	p305	\N
345	p345	\N
394	p394	\N
351	p351	\N
349	p349	\N
328	p328	\N
391	p391	\N
332	p332	\N
304	p304	\N
309	p309	\N
358	p358	\N
378	p378	\N
344	p344	\N
342	p342	\N
334	p334	\N
376	p376	\N
388	p388	\N
320	p320	\N
400	p400	\N
366	p366	\N
399	p399	\N
379	p379	\N
369	p369	\N
324	p324	\N
382	p382	\N
340	p340	\N
336	p336	\N
321	p321	\N
339	p339	\N
335	p335	\N
326	p326	\N
380	p380	\N
316	p316	\N
398	p398	\N
337	p337	\N
353	p353	\N
361	p361	\N
346	p346	\N
384	p384	\N
310	p310	\N
392	p392	\N
341	p341	\N
385	p385	\N
317	p317	\N
381	p381	\N
303	p303	\N
356	p356	\N
352	p352	\N
389	p389	\N
333	p333	\N
322	p322	\N
397	p397	\N
371	p371	\N
368	p368	\N
348	p348	\N
343	p343	\N
902	p902	\N
924	p924	\N
963	p963	\N
957	p957	\N
908	p908	\N
954	p954	\N
959	p959	\N
938	p938	\N
951	p951	\N
912	p912	\N
915	p915	\N
944	p944	\N
917	p917	\N
916	p916	\N
974	p974	\N
956	p956	\N
979	p979	\N
914	p914	\N
997	p997	\N
929	p929	\N
936	p936	\N
921	p921	\N
1000	p1000	\N
976	p976	\N
933	p933	\N
985	p985	\N
992	p992	\N
984	p984	\N
952	p952	\N
923	p923	\N
920	p920	\N
950	p950	\N
994	p994	\N
990	p990	\N
967	p967	\N
941	p941	\N
940	p940	\N
931	p931	\N
911	p911	\N
945	p945	\N
913	p913	\N
982	p982	\N
934	p934	\N
907	p907	\N
919	p919	\N
975	p975	\N
991	p991	\N
970	p970	\N
943	p943	\N
968	p968	\N
966	p966	\N
901	p901	\N
958	p958	\N
942	p942	\N
904	p904	\N
987	p987	\N
980	p980	\N
995	p995	\N
998	p998	\N
977	p977	\N
973	p973	\N
955	p955	\N
910	p910	\N
946	p946	\N
988	p988	\N
949	p949	\N
903	p903	\N
939	p939	\N
978	p978	\N
999	p999	\N
981	p981	\N
932	p932	\N
961	p961	\N
909	p909	\N
922	p922	\N
930	p930	\N
989	p989	\N
925	p925	\N
918	p918	\N
906	p906	\N
983	p983	\N
965	p965	\N
947	p947	\N
972	p972	\N
928	p928	\N
960	p960	\N
953	p953	\N
935	p935	\N
926	p926	\N
996	p996	\N
993	p993	\N
962	p962	\N
927	p927	\N
986	p986	\N
969	p969	\N
964	p964	\N
937	p937	\N
905	p905	\N
971	p971	\N
948	p948	\N
758	p758	\N
769	p769	\N
707	p707	\N
751	p751	\N
734	p734	\N
757	p757	\N
746	p746	\N
728	p728	\N
747	p747	\N
779	p779	\N
776	p776	\N
759	p759	\N
720	p720	\N
706	p706	\N
763	p763	\N
771	p771	\N
768	p768	\N
778	p778	\N
719	p719	\N
711	p711	\N
785	p785	\N
741	p741	\N
730	p730	\N
775	p775	\N
760	p760	\N
738	p738	\N
792	p792	\N
717	p717	\N
773	p773	\N
737	p737	\N
795	p795	\N
764	p764	\N
733	p733	\N
701	p701	\N
708	p708	\N
745	p745	\N
716	p716	\N
712	p712	\N
766	p766	\N
796	p796	\N
780	p780	\N
715	p715	\N
750	p750	\N
743	p743	\N
799	p799	\N
788	p788	\N
782	p782	\N
767	p767	\N
753	p753	\N
797	p797	\N
713	p713	\N
709	p709	\N
783	p783	\N
742	p742	\N
721	p721	\N
791	p791	\N
702	p702	\N
798	p798	\N
786	p786	\N
723	p723	\N
789	p789	\N
740	p740	\N
704	p704	\N
761	p761	\N
739	p739	\N
705	p705	\N
794	p794	\N
752	p752	\N
718	p718	\N
703	p703	\N
754	p754	\N
725	p725	\N
770	p770	\N
732	p732	\N
765	p765	\N
714	p714	\N
800	p800	\N
749	p749	\N
774	p774	\N
784	p784	\N
781	p781	\N
790	p790	\N
756	p756	\N
748	p748	\N
729	p729	\N
762	p762	\N
736	p736	\N
731	p731	\N
793	p793	\N
724	p724	\N
722	p722	\N
735	p735	\N
755	p755	\N
744	p744	\N
727	p727	\N
777	p777	\N
772	p772	\N
787	p787	\N
710	p710	\N
726	p726	\N
\.

COPY "public"."partition_child" FROM stdin;
10
\.

COPY "public"."test_ordered" FROM stdin;
2	a
1	b
\.


ALTER TABLE "S'""chema"."table" ENABLE TRIGGER ALL;
ALTER TABLE "S'""chema"."table_details" ENABLE TRIGGER ALL;
ALTER TABLE "long_schema_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"."child" ENABLE TRIGGER ALL;
ALTER TABLE "long_schema_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"."long_name_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx1" ENABLE TRIGGER ALL;
ALTER TABLE "public"."child1" ENABLE TRIGGER ALL;
ALTER TABLE "public"."child10" ENABLE TRIGGER ALL;
ALTER TABLE "public"."child2" ENABLE TRIGGER ALL;
ALTER TABLE "public"."child3" ENABLE TRIGGER ALL;
ALTER TABLE "public"."child4" ENABLE TRIGGER ALL;
ALTER TABLE "public"."child5" ENABLE TRIGGER ALL;
ALTER TABLE "public"."child6" ENABLE TRIGGER ALL;
ALTER TABLE "public"."child7" ENABLE TRIGGER ALL;
ALTER TABLE "public"."child8" ENABLE TRIGGER ALL;
ALTER TABLE "public"."child9" ENABLE TRIGGER ALL;
ALTER TABLE "public"."parent" ENABLE TRIGGER ALL;
ALTER TABLE "public"."partition_child" ENABLE TRIGGER ALL;
ALTER TABLE "public"."test_ordered" ENABLE TRIGGER ALL;

