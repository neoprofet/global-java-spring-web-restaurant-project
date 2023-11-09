--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

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
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    id bigint NOT NULL,
    name character varying NOT NULL,
    phone character varying,
    discount_percent double precision
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customers_id_seq OWNER TO postgres;

--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- Name: ingredients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ingredients (
    id bigint NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.ingredients OWNER TO postgres;

--
-- Name: ingredients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ingredients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ingredients_id_seq OWNER TO postgres;

--
-- Name: ingredients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ingredients_id_seq OWNED BY public.ingredients.id;


--
-- Name: order_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_product (
    order_id bigint NOT NULL,
    product_id bigint NOT NULL
);


ALTER TABLE public.order_product OWNER TO postgres;

--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id bigint NOT NULL,
    customer_id bigint NOT NULL,
    price double precision NOT NULL,
    "time" timestamp with time zone DEFAULT now() NOT NULL,
    address character varying
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_id_seq OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: product_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_categories (
    id bigint NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.product_categories OWNER TO postgres;

--
-- Name: product_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_category_id_seq OWNER TO postgres;

--
-- Name: product_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_category_id_seq OWNED BY public.product_categories.id;


--
-- Name: product_ingredient; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_ingredient (
    product_id bigint,
    ingredient_id bigint
);


ALTER TABLE public.product_ingredient OWNER TO postgres;

--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id bigint NOT NULL,
    name character varying NOT NULL,
    category_id bigint NOT NULL,
    price double precision NOT NULL,
    serving_weight bigint,
    energy_value bigint
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_id_seq OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- Name: ingredients id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingredients ALTER COLUMN id SET DEFAULT nextval('public.ingredients_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: product_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_categories ALTER COLUMN id SET DEFAULT nextval('public.product_category_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (id, name, phone, discount_percent) FROM stdin;
1	Денис	+380501872923	0
2	Илья	+380954442415	0
3	Марія	+380665585270	0
4	Людмила	+380501862826	0
5	Илья	5252525	0
6	ahuet	0978564322	0
7	Denis	Yarovoy	0
\.


--
-- Data for Name: ingredients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ingredients (id, name) FROM stdin;
3	Flour
4	Eggs
5	Milk
6	Butter
7	Sunflower oil
8	Yeast
10	Water
12	Cinnamon
13	Milk chocolate
15	Guacamole
16	Artichokesс
17	Cream
18	Tomatoes
19	Onions
20	Garlic
21	Pepper
22	Lemon
23	Lime
24	Orange
26	Ginger
27	Honey
28	Vinegar
30	Wine
31	Beer
32	Rice
33	Pasta
38	Oats
40	Mustard
41	Mayonnaise
42	Ketchup
47	Chives
48	Parsley
49	Basil
50	Mint
51	Cilantro
52	Dill
53	Rosemary
54	Thyme
55	Paprika
56	Nutmeg
57	Cumin
58	Clove
59	Turmeric
60	Allspice
61	Almonds
62	Walnuts
63	Pecans
64	Cashews
65	Pistachios
66	Macadamia
67	Coconut
68	Raisins
69	Cranberries
80	Crackers
81	Garlic-walnut sauce
82	Lettuce
83	Chicken breast
84	Cucumber
86	Olives
87	Olive oil
88	Tuna
89	Celery
1	Salt
2	Sugar
99	Mustard
100	Spinach
101	Quinoa
102	Lime sauce
103	Black beans
104	Green beans
105	Green
106	Balsamic vinegar
107	Bacon
108	Avocado
109	Rice noodles
110	Shrimp
111	Carrot
112	Sesame
113	Pomegranate
114	Mustard sauce
115	Beef tenderloin
116	Lime and fish sauce
117	Champignon
119	Lemongrass
121	Galangal
122	Chilies
124	Lime juice
9	Baking powder
11	Vanilla extract
14	Cocoa powder
25	Chili pepper
29	Soy sauce
34	Rice vinegar
35	Soybean oil
36	Coconut milk
37	Peanut butter
39	Maple syrup
43	Worcestershire sauce
44	Sour cream
45	Cream cheese
46	Whipped cream
70	Cheddar cheese
71	Parmesan cheese
72	Mozzarella cheese
73	Swiss cheese
74	Blue cheese
75	Ricotta cheese
76	Provolone cheese
77	Brie cheese
78	Camembert cheese
79	Roquefort cheese
85	Feta cheese
90	Red onion
91	Dill pickles
92	Dijon mustard
93	Lemon juice
94	Boiled potatoes
95	Boiled carrots
96	Boiled sausage
97	Green peas
98	Green onions
118	Chicken broth
120	Kaffir lime leaves
123	Fish sauce
125	Cream
126	Duck
127	Seaweed
128	Bamboo shoots
129	Mirin
130	Curry paste
131	Broccoli
132	Vegetable broth
133	White beans
134	Paste
135	Gruyere cheese
136	Dried corn kernels pozole
137	Oregano
138	Tortillas
139	Ancho
140	Cilantro root
141	Baguette
142	Clams
143	White sauce
144	Coffee
145	Savoyardi lollipops
146	Mascarpone
147	Cookies
148	Vanilla
149	Gelatin
150	Puff pastry
151	Condensed milk
152	Bananas
153	Strawberries
154	Raspberries
155	Mangoes
156	Peaches
157	Glaze
158	Almond flour
159	Powdered sugar
160	Spaghetti
161	Teriyaki sauce
162	Taliatelle pasta
163	Spices
164	Omelette
165	Peanut sauce
166	Curry sauce
167	Cauliflower cabbage
168	Spicy sesame sauce
169	Buckwheat
170	Vegetable oil
171	Mashed potatoes
172	Fried potatoes
173	Baked potatoes
174	Squid rings
175	Dough
176	Marinara sauce
177	Sweet pepper
178	Green apples
179	Crab
180	Paprica
181	Fried Potato Bars
182	Ground beef
183	Ground chicken
184	Tzatziki sauce
185	Pineapple rings
186	Dorblu cheese
187	Herbs
188	Pork
189	Lamb
190	Veal tenderloin
191	Tonnato sauce (tuna and mayonnaise sauce)
192	Capers
193	Fruit jelly
194	Rabbit meat
195	Salmon
196	Orange sauce
197	Duck breast
198	Soda water
200	Pineapple juice
201	Apple
202	Cherries
203	Yogurt
205	Black tea
206	Blueberries
207	Milk foam
208	Espresso coffee
209	Hot chocolate
210	Cocoa
211	Chocolate syrup
212	Vanilla ice cream
213	Hot water
214	Green tea
215	Carbon dioxide
199	Ice
204	Papaya
216	Vodka
217	Peach liqueur
218	Orange juice
219	Cranberry juice
220	Dark rum
221	Light rum
222	Orange liqueur
223	Worcestershire sauce
224	Tequila
225	White dry wine
226	White semi-sweet wine
227	White semi-dry wine
228	Red dry wine
229	Red semi-sweet wine
230	Cognac
231	Scotch whiskey
232	White rum
\.


--
-- Data for Name: order_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_product (order_id, product_id) FROM stdin;
5	1
5	2
5	14
5	23
5	37
5	55
5	44
5	61
5	96
5	68
6	1
6	2
6	3
6	4
6	5
6	6
6	7
6	8
6	9
6	10
6	11
6	12
6	13
6	14
6	15
6	16
6	17
6	18
6	19
6	20
6	21
6	22
6	23
6	24
6	25
6	26
6	27
6	28
6	29
6	30
6	31
6	32
6	33
6	34
6	35
6	36
6	37
6	38
6	39
6	40
6	41
6	42
6	43
7	1
7	4
7	7
7	13
9	1
9	2
9	3
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, customer_id, price, "time", address) FROM stdin;
5	3	1764	2023-11-07 10:31:28.225984+02	\N
6	4	7626	2023-11-07 18:38:29.292177+02	Набережная 208
7	5	891	2023-11-07 19:43:12.110514+02	афццеце
9	7	688	2023-11-08 18:20:01.746391+02	Maidan svodoby 1
\.


--
-- Data for Name: product_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_categories (id, name) FROM stdin;
1	Salad
2	Soup
3	Dessert
4	Main
5	Starter
6	Burger
7	Steak
8	Alcoholic beverage
9	Non alcoholic beverage
\.


--
-- Data for Name: product_ingredient; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_ingredient (product_id, ingredient_id) FROM stdin;
1	1
1	18
1	83
1	4
1	71
1	80
1	81
1	82
2	1
2	18
2	55
2	55
2	84
2	85
2	86
2	87
2	93
3	88
3	89
3	90
3	91
3	92
3	93
3	41
3	82
4	1
4	4
4	41
4	91
4	94
4	95
4	96
4	97
4	98
4	99
5	100
5	101
5	102
5	103
5	51
5	100
5	21
6	88
6	4
6	86
6	94
6	104
6	105
6	18
7	18
7	72
7	49
7	87
7	106
8	83
8	107
8	108
8	4
8	18
8	82
8	74
9	21
9	109
9	110
9	111
9	112
9	29
10	113
10	114
10	62
10	82
10	87
11	115
11	116
11	84
11	112
11	50
11	18
11	19
12	118
12	110
12	117
12	119
12	121
12	122
12	20
12	123
12	2
12	93
12	18
12	36
12	51
12	48
12	91
12	124
13	117
13	19
13	20
13	6
13	94
13	118
13	105
13	125
14	118
14	109
14	4
14	98
14	26
14	29
14	20
14	126
14	127
14	128
14	129
15	118
15	109
15	4
15	98
15	26
15	29
15	20
15	126
15	127
15	128
15	129
15	122
16	118
16	36
16	83
16	94
16	95
16	93
16	29
16	2
16	98
16	26
16	20
16	130
16	131
17	18
17	111
17	94
17	19
17	89
17	49
17	87
17	20
17	71
17	132
17	133
17	134
18	118
18	17
18	70
18	135
18	94
18	19
18	89
18	111
18	20
18	105
19	118
19	136
19	137
19	138
19	139
19	140
19	19
19	20
19	102
20	132
20	18
20	55
20	19
20	20
20	141
20	87
20	28
20	105
21	118
21	142
21	94
21	19
21	89
21	107
21	143
21	5
21	105
22	2
22	144
22	14
22	145
22	146
23	2
23	4
23	147
23	148
23	45
24	2
24	17
24	148
24	149
25	2
25	148
25	150
25	5
25	17
25	4
25	6
26	27
26	150
26	148
26	151
27	151
27	152
27	17
27	4
27	147
27	151
29	24
29	152
29	5
29	2
29	148
29	93
29	153
29	154
29	155
29	156
28	24
28	152
28	2
28	93
28	153
28	154
28	155
28	156
28	10
30	150
30	2
30	6
30	148
30	157
30	158
31	150
31	2
31	6
31	13
31	159
32	150
32	2
32	6
32	159
33	150
33	2
33	6
33	159
33	154
34	160
34	117
34	100
34	20
34	87
35	94
35	131
35	95
35	97
35	112
35	161
36	162
36	117
36	17
36	48
36	20
37	94
37	17
37	71
37	20
37	163
38	32
38	64
38	95
38	87
38	163
38	97
39	109
39	164
39	110
39	165
39	29
39	23
40	109
40	166
40	167
40	128
40	112
40	163
41	109
41	84
41	105
41	112
41	168
42	169
42	81
42	19
42	170
42	163
43	171
43	117
43	54
43	6
43	1
43	21
44	141
44	18
44	20
44	87
44	49
45	174
45	175
45	22
45	176
46	70
46	175
46	176
47	141
47	108
47	18
47	20
47	87
47	49
48	19
48	87
48	177
48	178
48	18
49	179
49	32
49	18
49	180
49	19
49	163
50	181
50	1
51	181
51	1
52	182
52	70
52	91
52	19
52	114
53	182
53	82
53	19
53	18
53	41
54	182
54	108
54	19
54	18
54	82
54	73
55	182
55	117
55	77
55	90
55	82
56	182
56	107
56	70
56	82
57	183
57	70
57	19
57	41
58	183
58	117
58	77
58	90
58	82
59	183
59	185
59	82
59	186
59	19
59	41
60	183
60	86
60	85
60	18
60	49
60	90
60	184
61	115
61	1
61	21
61	6
61	187
61	53
62	188
62	1
62	21
62	7
62	20
63	189
63	1
63	21
63	7
63	53
64	190
64	191
64	192
64	22
64	1
64	21
65	197
65	196
65	27
65	54
65	1
65	21
66	195
66	22
66	7
66	187
66	51
66	1
66	21
67	194
67	193
67	53
67	1
67	21
68	23
68	50
68	2
68	198
68	199
69	200
69	36
69	2
69	199
70	24
71	201
72	202
73	154
73	152
73	203
73	27
73	199
74	200
74	50
74	2
74	199
75	155
75	204
75	203
75	27
75	199
76	205
76	153
76	154
76	206
76	2
76	199
77	208
77	5
77	207
78	208
78	5
79	208
80	208
81	208
81	209
81	5
81	46
83	208
83	5
84	208
84	5
84	199
85	210
85	5
85	14
85	2
86	5
86	211
86	212
86	2
87	5
87	11
87	212
87	2
88	5
88	152
88	212
88	2
89	5
89	153
89	212
89	2
90	205
90	213
91	214
91	213
92	26
92	27
92	22
92	213
93	50
93	213
93	27
95	10
95	215
94	10
96	216
96	217
96	218
96	219
97	220
97	221
97	222
97	93
98	216
98	222
98	219
98	93
99	216
99	18
99	93
99	43
99	40
100	221
100	93
100	2
101	224
101	222
101	91
101	1
102	232
102	36
102	200
102	2
103	225
104	226
105	227
106	228
108	230
109	216
110	231
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, name, category_id, price, serving_weight, energy_value) FROM stdin;
1	Caesar	1	229	430	1005
2	Greek	1	205	420	616
3	Tuna salad	1	254	280	751
4	Olivier	1	274	160	954
5	Quinoa Salad	1	241	200	354
6	Nicoise	1	285	250	402
7	Caprese	1	243	150	246
8	Cobb	1	277	270	490
9	Asian Noodle Salad	1	252	240	380
10	Walnut Fusion	1	268	290	530
11	Thai Beef Salad	1	273	220	325
12	Tom Yum	2	175	450	562
13	Mushroom cream soup	2	145	400	438
14	Ramen	2	185	350	521
15	Spicy ramen	2	190	350	529
16	Curry soup	2	210	400	542
17	Minestrone	2	250	450	369
18	Cheese soup	2	260	400	421
19	Pozole soup	2	280	450	395
20	Gazpacho	2	290	400	343
21	Clam chowder	2	270	420	392
22	Tiramisu	3	90	150	320
23	Cheesecake	3	120	160	415
24	Panna cotta	3	115	220	318
25	Napoleon	3	130	250	421
26	Honey cake	3	120	250	452
27	Banana Pie	3	125	240	431
28	Fruit sorbet	3	80	200	368
29	Fruit icecream	3	90	200	368
30	Almond Croissant	3	70	120	326
31	Chocolate Croissant	3	70	120	309
32	Plain Croissant	3	60	100	270
33	Raspberry croissant	3	70	120	312
34	Mushroom and spinach pasta	4	135	300	430
35	Vegetable teriyaki with rice	4	145	300	490
36	Tagliatelle with wild mushrooms	4	140	300	421
37	Potato gratin	4	145	250	342
38	Nutty vegetable rice	4	130	300	419
39	Pad thai	4	160	300	512
40	Curry noodles	4	155	300	474
41	Sesame noodles	4	145	250	349
42	Buckwheat with mushroom sauce	4	125	250	367
44	Tomato bruschetta	5	110	200	202
45	Calamari in Batter	5	190	200	252
46	Cheese Sticks	5	100	150	332
47	Avocado Bruschetta	5	120	200	249
49	Crab jambalaya	5	145	250	343
50	Potato dips	5	80	300	423
51	French fries	5	70	300	412
52	Cheeseburger	6	120	250	421
53	Hamburger	6	110	250	394
54	Guacamole hamburger	6	130	250	459
55	Mushroom and brie hamburger	6	150	250	467
56	Bacon hamburger	6	130	250	424
57	Chickenburger	6	120	250	416
60	Greek chickenburger	6	180	250	486
61	Beef steak	7	380	250	406
62	Pork steak	7	360	250	387
64	Vitello Tonnato steak	7	430	280	398
65	Duck steak with orange sauce	7	450	300	441
66	Salmon steak	7	370	280	266
67	Rabbit steak with jam	7	400	250	292
68	Mojito	9	80	300	143
69	Pina colada	9	90	300	186
70	Fresh orange juice	9	70	250	83
71	Fresh apple juice	9	70	250	71
72	Fresh cherry juice	9	70	250	86
73	Raspberry banana smoothie	9	90	300	144
74	Pineapple mint juice	9	80	250	128
75	Mango papaya smoothie	9	90	300	152
76	Berry iced tea	9	90	300	87
77	Cappuccino	9	50	200	89
78	Flat white	9	60	250	119
79	Espresso	9	40	40	3
80	American coffee	9	50	200	4
81	Mocha	9	70	250	198
82	Latte macchiato	9	80	250	154
83	Latte	9	70	250	126
84	Iced latte	9	75	250	116
85	Cocoa	9	80	250	195
86	Chocolate milkshake	9	110	300	223
87	Vanilla milkshake	9	105	300	216
88	Banana milkshake	9	110	300	263
89	Strawberry milkshake	9	110	300	245
90	Black tea	9	40	200	5
48	Chicken paprikash	5	150	250	329
58	Mushroom brie chickenburger	6	150	250	442
59	Pineapple dorblu chickenburger	6	180	250	469
63	Lamb steak	7	390	250	393
91	Green tea	9	40	200	3
92	Ginger tea	9	50	200	87
93	Mint tea	9	50	200	83
94	Water	9	10	200	0
95	Sparkling water	9	15	200	0
96	Sex on the Beach	8	160	250	298
97	Mai Tai	8	180	250	321
98	Cosmopolitan	8	180	250	349
99	Bloody Mary	8	150	250	302
100	Daiquiri	8	160	250	343
101	Margarita	8	170	250	321
102	Colada	8	180	250	335
103	Roccaperciata Grillo	8	185	150	309
104	Shiraz Malbec Esperado	8	210	150	327
106	Valpolicella Essere	8	210	150	331
107	Shiraz Malbec Esperado	8	210	150	345
108	Vecchia Romagna	8	160	50	290
109	Absolut	8	110	50	299
110	Chivas Regal 12 y.o.	8	270	50	272
43	Mashed Potatoes	4	150	300	392
105	Sogrape Vinhos	8	295	150	330
\.


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_id_seq', 7, true);


--
-- Name: ingredients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ingredients_id_seq', 1, false);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 9, true);


--
-- Name: product_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_category_id_seq', 1, false);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 1, false);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: ingredients ingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingredients
    ADD CONSTRAINT ingredients_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: product_categories product_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_categories
    ADD CONSTRAINT product_categories_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: product_ingredient fk_ingredient; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_ingredient
    ADD CONSTRAINT fk_ingredient FOREIGN KEY (ingredient_id) REFERENCES public.ingredients(id) NOT VALID;


--
-- Name: order_product fk_order; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_product
    ADD CONSTRAINT fk_order FOREIGN KEY (order_id) REFERENCES public.orders(id) NOT VALID;


--
-- Name: orders fk_order_customer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_order_customer FOREIGN KEY (customer_id) REFERENCES public.customers(id) NOT VALID;


--
-- Name: order_product fk_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_product
    ADD CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES public.products(id) NOT VALID;


--
-- Name: product_ingredient fk_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_ingredient
    ADD CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES public.products(id) NOT VALID;


--
-- Name: products fk_product_category; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT fk_product_category FOREIGN KEY (category_id) REFERENCES public.product_categories(id) NOT VALID;


--
-- PostgreSQL database dump complete
--

