--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: bluejayusers; Type: TABLE; Schema: public; Owner: app; Tablespace: 
--

CREATE TABLE bluejayusers (
    "ID" integer NOT NULL,
    name character varying,
    pass character varying
);


ALTER TABLE public.bluejayusers OWNER TO app;

--
-- Name: complementary_remedies; Type: TABLE; Schema: public; Owner: app; Tablespace: 
--

CREATE TABLE complementary_remedies (
    product_id integer DEFAULT 0,
    comp_prod_id integer DEFAULT 0,
    comments text
);


ALTER TABLE public.complementary_remedies OWNER TO app;

--
-- Name: complementary_singles; Type: TABLE; Schema: public; Owner: app; Tablespace: 
--

CREATE TABLE complementary_singles (
    herb_id integer DEFAULT 0,
    product_id integer DEFAULT 0,
    herb_action_number character varying(50)
);


ALTER TABLE public.complementary_singles OWNER TO app;

--
-- Name: contra_indications; Type: TABLE; Schema: public; Owner: app; Tablespace: 
--

CREATE TABLE contra_indications (
    id integer NOT NULL,
    name character varying(50),
    description text
);


ALTER TABLE public.contra_indications OWNER TO app;

--
-- Name: contra_indications_local_id_seq; Type: SEQUENCE; Schema: public; Owner: app
--

CREATE SEQUENCE contra_indications_local_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contra_indications_local_id_seq OWNER TO app;

--
-- Name: contra_indications_local_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app
--

ALTER SEQUENCE contra_indications_local_id_seq OWNED BY contra_indications.id;


--
-- Name: health_category; Type: TABLE; Schema: public; Owner: app; Tablespace: 
--

CREATE TABLE health_category (
    id integer NOT NULL,
    name character varying(50)
);


ALTER TABLE public.health_category OWNER TO app;

--
-- Name: health_category_local_id_seq; Type: SEQUENCE; Schema: public; Owner: app
--

CREATE SEQUENCE health_category_local_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.health_category_local_id_seq OWNER TO app;

--
-- Name: health_category_local_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app
--

ALTER SEQUENCE health_category_local_id_seq OWNED BY health_category.id;


--
-- Name: permission_local_ID_seq; Type: SEQUENCE; Schema: public; Owner: app
--

CREATE SEQUENCE "permission_local_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."permission_local_ID_seq" OWNER TO app;

--
-- Name: permission_local_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app
--

ALTER SEQUENCE "permission_local_ID_seq" OWNED BY bluejayusers."ID";


--
-- Name: product_category; Type: TABLE; Schema: public; Owner: app; Tablespace: 
--

CREATE TABLE product_category (
    category_name character varying(50),
    id integer NOT NULL
);


ALTER TABLE public.product_category OWNER TO app;

--
-- Name: product_category_local_id_seq; Type: SEQUENCE; Schema: public; Owner: app
--

CREATE SEQUENCE product_category_local_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_category_local_id_seq OWNER TO app;

--
-- Name: product_category_local_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app
--

ALTER SEQUENCE product_category_local_id_seq OWNED BY product_category.id;


--
-- Name: product_health_category; Type: TABLE; Schema: public; Owner: app; Tablespace: 
--

CREATE TABLE product_health_category (
    product_id integer DEFAULT 0,
    health_category_id integer DEFAULT 0
);


ALTER TABLE public.product_health_category OWNER TO app;

--
-- Name: product_sample_indications; Type: TABLE; Schema: public; Owner: app; Tablespace: 
--

CREATE TABLE product_sample_indications (
    preferred boolean,
    product_id integer DEFAULT 0,
    sample_indications_id integer DEFAULT 0
);


ALTER TABLE public.product_sample_indications OWNER TO app;

--
-- Name: products; Type: TABLE; Schema: public; Owner: app; Tablespace: 
--

CREATE TABLE products (
    "productID" integer NOT NULL,
    name character varying(50),
    description character varying(50),
    product_category_id integer DEFAULT 2,
    ingredients text,
    western_theraputic_actions text,
    traditional_chinese_medicine text,
    sample_indications text,
    dosage text,
    contra_indications text,
    notations text,
    usage_type character varying(50) DEFAULT '0'::character varying
);


ALTER TABLE public.products OWNER TO app;

--
-- Name: products_local_productID_seq; Type: SEQUENCE; Schema: public; Owner: app
--

CREATE SEQUENCE "products_local_productID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."products_local_productID_seq" OWNER TO app;

--
-- Name: products_local_productID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app
--

ALTER SEQUENCE "products_local_productID_seq" OWNED BY products."productID";


--
-- Name: retail_size_price; Type: TABLE; Schema: public; Owner: app; Tablespace: 
--

CREATE TABLE retail_size_price (
    product_category_id integer DEFAULT 0,
    size character varying(50),
    price numeric(19,4) DEFAULT 0
);


ALTER TABLE public.retail_size_price OWNER TO app;

--
-- Name: sample_indications; Type: TABLE; Schema: public; Owner: app; Tablespace: 
--

CREATE TABLE sample_indications (
    id integer NOT NULL,
    name character varying(50)
);


ALTER TABLE public.sample_indications OWNER TO app;

--
-- Name: sample_indications_local_id_seq; Type: SEQUENCE; Schema: public; Owner: app
--

CREATE SEQUENCE sample_indications_local_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sample_indications_local_id_seq OWNER TO app;

--
-- Name: sample_indications_local_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app
--

ALTER SEQUENCE sample_indications_local_id_seq OWNED BY sample_indications.id;


--
-- Name: side_effects; Type: TABLE; Schema: public; Owner: app; Tablespace: 
--

CREATE TABLE side_effects (
    id integer NOT NULL,
    name character varying(50),
    description text
);


ALTER TABLE public.side_effects OWNER TO app;

--
-- Name: side_effects_local_id_seq; Type: SEQUENCE; Schema: public; Owner: app
--

CREATE SEQUENCE side_effects_local_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.side_effects_local_id_seq OWNER TO app;

--
-- Name: side_effects_local_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app
--

ALTER SEQUENCE side_effects_local_id_seq OWNED BY side_effects.id;


--
-- Name: single_herb_contra_indications; Type: TABLE; Schema: public; Owner: app; Tablespace: 
--

CREATE TABLE single_herb_contra_indications (
    single_herb_id integer DEFAULT 0,
    contra_indications_id integer DEFAULT 0
);


ALTER TABLE public.single_herb_contra_indications OWNER TO app;

--
-- Name: single_herb_sample_indications; Type: TABLE; Schema: public; Owner: app; Tablespace: 
--

CREATE TABLE single_herb_sample_indications (
    preferred boolean,
    single_herb_id integer DEFAULT 0,
    sample_indications_id integer DEFAULT 0
);


ALTER TABLE public.single_herb_sample_indications OWNER TO app;

--
-- Name: single_herb_side_effects; Type: TABLE; Schema: public; Owner: app; Tablespace: 
--

CREATE TABLE single_herb_side_effects (
    single_herb_id integer DEFAULT 0,
    side_effects_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.single_herb_side_effects OWNER TO app;

--
-- Name: single_herbs; Type: TABLE; Schema: public; Owner: app; Tablespace: 
--

CREATE TABLE single_herbs (
    herb_id integer NOT NULL,
    english_name character varying(50),
    latin_name character varying(50),
    pin_yin_name character varying(50),
    action_1 text,
    action_2 text,
    action_3 text,
    action_4 text,
    action_5 text,
    action_6 text,
    action_7 text,
    action_8 text,
    action_9 text,
    action_10 text
);


ALTER TABLE public.single_herbs OWNER TO app;

--
-- Name: single_herbs_local_herb_id_seq; Type: SEQUENCE; Schema: public; Owner: app
--

CREATE SEQUENCE single_herbs_local_herb_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.single_herbs_local_herb_id_seq OWNER TO app;

--
-- Name: single_herbs_local_herb_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app
--

ALTER SEQUENCE single_herbs_local_herb_id_seq OWNED BY single_herbs.herb_id;


--
-- Name: tos_order_items; Type: TABLE; Schema: public; Owner: app; Tablespace: 
--

CREATE TABLE tos_order_items (
    order_number integer DEFAULT 0 NOT NULL,
    product_name character varying(50),
    product_size character varying(50),
    quantity integer DEFAULT 0,
    is_retail boolean
);


ALTER TABLE public.tos_order_items OWNER TO app;

--
-- Name: tos_order_shipping; Type: TABLE; Schema: public; Owner: app; Tablespace: 
--

CREATE TABLE tos_order_shipping (
    order_number integer NOT NULL,
    shipping_first_name character varying(50) NOT NULL,
    shipping_last_name character varying(50) NOT NULL,
    shipping_address_1 character varying(50) NOT NULL,
    shipping_address_2 character varying(50),
    shipping_address_3 character varying(50),
    shipping_city character varying(50) NOT NULL,
    shipping_state_province character varying(50) NOT NULL,
    shipping_country character varying(50) NOT NULL,
    is_shipped boolean DEFAULT false,
    shipping_method character varying(50),
    shpping_date timestamp without time zone
);


ALTER TABLE public.tos_order_shipping OWNER TO app;

--
-- Name: tos_order_shipping_local_order_number_seq; Type: SEQUENCE; Schema: public; Owner: app
--

CREATE SEQUENCE tos_order_shipping_local_order_number_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tos_order_shipping_local_order_number_seq OWNER TO app;

--
-- Name: tos_order_shipping_local_order_number_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app
--

ALTER SEQUENCE tos_order_shipping_local_order_number_seq OWNED BY tos_order_shipping.order_number;


--
-- Name: tos_orders; Type: TABLE; Schema: public; Owner: app; Tablespace: 
--

CREATE TABLE tos_orders (
    order_number integer NOT NULL,
    is_wholesale boolean DEFAULT false,
    order_date timestamp without time zone DEFAULT now(),
    billing_email character varying(50) NOT NULL,
    billing_first_name character varying(50) NOT NULL,
    billing_last_name character varying(50) NOT NULL,
    billing_address_1 character varying(50) NOT NULL,
    billing_address_2 character varying(50),
    billing_address_3 character varying(50),
    billing_city character varying(50) NOT NULL,
    billing_state_province character varying(50) NOT NULL,
    billing_country character varying(50) NOT NULL,
    billing_phone_1 character varying(50) NOT NULL,
    billing_phone_2 character varying(50),
    order_subtotal numeric(19,4) DEFAULT 0,
    order_tax_total numeric(19,4) DEFAULT 0,
    order_total numeric(19,4) DEFAULT 0,
    order_discount numeric(19,4) DEFAULT 0,
    payment_method character varying(50)
);


ALTER TABLE public.tos_orders OWNER TO app;

--
-- Name: tos_orders_local_order_number_seq; Type: SEQUENCE; Schema: public; Owner: app
--

CREATE SEQUENCE tos_orders_local_order_number_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tos_orders_local_order_number_seq OWNER TO app;

--
-- Name: tos_orders_local_order_number_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app
--

ALTER SEQUENCE tos_orders_local_order_number_seq OWNED BY tos_orders.order_number;


--
-- Name: wholesale_size_price; Type: TABLE; Schema: public; Owner: app; Tablespace: 
--

CREATE TABLE wholesale_size_price (
    category_id integer DEFAULT 0,
    size character varying(50),
    price numeric(19,4) DEFAULT 0
);


ALTER TABLE public.wholesale_size_price OWNER TO app;

--
-- Name: ID; Type: DEFAULT; Schema: public; Owner: app
--

ALTER TABLE ONLY bluejayusers ALTER COLUMN "ID" SET DEFAULT nextval('"permission_local_ID_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app
--

ALTER TABLE ONLY contra_indications ALTER COLUMN id SET DEFAULT nextval('contra_indications_local_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app
--

ALTER TABLE ONLY health_category ALTER COLUMN id SET DEFAULT nextval('health_category_local_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app
--

ALTER TABLE ONLY product_category ALTER COLUMN id SET DEFAULT nextval('product_category_local_id_seq'::regclass);


--
-- Name: productID; Type: DEFAULT; Schema: public; Owner: app
--

ALTER TABLE ONLY products ALTER COLUMN "productID" SET DEFAULT nextval('"products_local_productID_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app
--

ALTER TABLE ONLY sample_indications ALTER COLUMN id SET DEFAULT nextval('sample_indications_local_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: app
--

ALTER TABLE ONLY side_effects ALTER COLUMN id SET DEFAULT nextval('side_effects_local_id_seq'::regclass);


--
-- Name: herb_id; Type: DEFAULT; Schema: public; Owner: app
--

ALTER TABLE ONLY single_herbs ALTER COLUMN herb_id SET DEFAULT nextval('single_herbs_local_herb_id_seq'::regclass);


--
-- Name: order_number; Type: DEFAULT; Schema: public; Owner: app
--

ALTER TABLE ONLY tos_order_shipping ALTER COLUMN order_number SET DEFAULT nextval('tos_order_shipping_local_order_number_seq'::regclass);


--
-- Name: order_number; Type: DEFAULT; Schema: public; Owner: app
--

ALTER TABLE ONLY tos_orders ALTER COLUMN order_number SET DEFAULT nextval('tos_orders_local_order_number_seq'::regclass);


--
-- Data for Name: bluejayusers; Type: TABLE DATA; Schema: public; Owner: app
--

COPY bluejayusers ("ID", name, pass) FROM stdin;
1	dksaami@yahoo.com	calendula
2	mantiss@pacbell.net	mantis
\.


--
-- Data for Name: complementary_remedies; Type: TABLE DATA; Schema: public; Owner: app
--

COPY complementary_remedies (product_id, comp_prod_id, comments) FROM stdin;
1	87	for deeper cleansing action
1	157	for oily skin
1	11	for slow healing blemishes and sores
1	12	for wrinkles and aging skin
1	150	for hormonal acne
2	1	for acne, blemishes, pimples
2	7	for eczema, dermatitis, itchy skin
2	62	for oily skin
2	10	for psoriasis, dermatitis, weepy skin
2	11	for pimples, boils, carbuncles
2	12	for dry skin, wrinkles, aging skin
2	150	for hormonal acne
2	5	for irritated, chapped, or itchy skin
1	2	for oily, adolescent, hormonal, and cystic skin conditions
1	5	for red, irritated skin or skin rash
1	165	to help reduce scar tissue from blemishes
2	165	to help reduce scar tissue from blemishes
100	103	for excessive bleeding
100	87	for cleansing the blood
100	82	for slow healing cuts, wounds, or sores
100	96	for viral and bacterial infections
57	68	supports breaking the habit of addictions
57	129	for memory, focus, and concentration
124	126	for lung infections with mucous
124	35	for depletion of energy and weak immunity
124	82	for a weakened immune system and chronic illness
124	71	for emotional difficulty in letting go
124	159	for rebuilding the health of damaged lungs
124	99	for chronic bacterial or viral infection
124	134	for acute asthma attacks
86	103	for excessive bleeding
86	87	for cleansing the blood
86	82	for slow healing cuts, wounds, or sores
86	96	for viral and bacterial infections
86	99	for stubborn and chronic infections
86	101	for cleansing the affected area
100	99	for viral and bacterial infections
100	101	for cleansing the affected area
101	103	for excessive bleeding
101	87	for cleansing of the blood
101	183	for herpes or inflamed sores
101	96	for viral and bacterial infections
102	77	for the healing of ligaments and tendons
102	111	for the healing of bones
102	162	for sprains and tissue trauma
102	121	for pain and assisting the healing process
49	37	to be taken by the mother, if the infant is breast fed
49	47	to be taken by the mother, if the infant is breast fed
49	54	for teething, especially those that become irritable, fractious, and difficult to deal with
49	55	for teething, especially suits those infants who bare their challenges stoically
90	51	for fever due to colds, influenza and infections
90	52	for fever due to colds, influenza and infections
90	89	for earache and build up of fluids in the ear
90	81	for recurring infections
90	96	for initial stages of infection
90	131	for tenacious bronchial or sinus mucous
90	132	for sinus infections and congestion
51	125	for bronchial asthma due to cold
51	126	for bronchitis, respiratory infection, and cough with mucous
51	88	for swollen glands and sore throat
51	127	for dry, croupy cough with no mucous
51	81	for children who are prone to frequent infections
51	96	for lymphatic infections or swollen glands
51	132	for sinus infections and runny nose
52	125	for bronchial asthma due to cold
52	126	for bronchitis, respiratory infection, and cough with mucous
52	88	for swollen glands and sore throat
52	127	for dry, croupy cough with no mucous
52	81	for children who are prone to frequent infections
52	96	for lymphatic infections or swollen glands
52	132	for sinus infections and runny nose
36	35	for postpartum fatigue
58	61	for excessive stress, anxiety, insomnia
58	74	for irritation and agitation
57	59	emotional roller coaster ride
166	16	for renal hypertension
166	168	for urinary difficulties and infections
166	114	for joint pain accompanied by edema
166	157	for chronic edema and weak lower body
20	15	for poor circulation and cold extremities
20	16	for vascular and renal hypertension
20	21	for balancing the cholesterol levels
20	6	for obesity and excess fat
20	156	for supporting the cardiac function and \t\t\tcalming the spirit
36	78	for supplementing the bodies energy
36	65	for spotting, fatigue, and anxiety
36	85	for prolapsed uterus or hemorrhoids
36	152	for regulating the hormones
58	158	a gentle liver cleanser for sensitive constitutions
58	120	for assisting the release of the neck and \t\t\tshoulders
58	138	for restless sleep patterns
58	139	for difficulty falling asleep
103	40	for strengthening the digestive tract and \t\trelieve ulcers or inflammation
103	42	for chronic inflamed digestive tract and \t\t\tintestinal bleeding
17	17	High blood pressure, diabetes, and edema are some conditions that present themselves during the later part of a pregnancy. Consult a qualified health care practitioner before taking any herbal remedies for any of these conditions.
103	79	for retinal bleeding, macular degeneration
103	162	for damaged tissues, sprains, and torn ligaments
87	24	for cancer and deep seated infections
87	168	for urinary tract, bladder, and kidney infections
87	43	for hepatitis and cirrhosis of the liver
87	44	for cleansing of the hepatic system
6	39	for sluggish bowels
87	96	for cleansing of the lymphatic system and all types of infections
87	99	for chronic infections and autoimmune diseases
57	158	for cleansing of the liver
57	137	for calming and rebuilding the nervous system
57	64	for panic attacks and phobias
57	67	for anxiety with depletion of body reserves
68	68	With the appropriate presentation, herbal formulas which address the physiological needs of the patient are an important adjunct to the Flower Remedies. This holistic approach respects the intimate relationship of the body-mind-heart-spirit connection.    Emotional confusion and upset often accompanies physiological problems. By relating an emotion to the Five Phases Theory or the Four Humors, and applying an appropriate herbal formula can be very beneficial during the course of the healing process.     An excess or lack of any emotion can serve as a guide to the systemic imbalance of the patient. The important thing to remember is to adapt and apply these theories in a creative and dynamic way. Rigidity spoils the soup, limits the possibilities, and closes the door to healing.
166	150	for hormonal water retention
166	99	for chronic infections and  a weak immune system
103	65	for menstrual spotting and fatigue
103	18	for bleeding hemorrhoids
103	28	for radiation burns
77	35	for weakness following a illness or surgery
77	60	for poor assimilation of nutrients and \t\t\tweak digestion
77	82	for a compromised immune system
77	84	for weakened adrenal functions and fatigue
77	85	for collapsed organs and emotional   exhaustion
15	20	for enhancing blood circulation
15	59	for surface chills that are relieved when \t\t\twrapped up
15	62	feel chilled to the bone, blankets dont help
15	130	alternating feeling of hot, then cold
15	157	for chronic cold body and weak lower body
15	121	for joint and muscular pain
167	87	for cleansing of the renal system
167	168	for urinary and bladder infections
167	63	for nourishing the kidneys, night sweats
167	80	for dark colored urine, hot hands and feet
167	119	for pain that increases with movement
111	20	enhances blood circulation
111	35	for fortifying the bodies energies
111	114	for joint stiffness and pain
111	118	for pain that lessens with movement
111	119	for pain that increases with movement
111	121	for arthritis, lumbago, and pain
16	166	for water retention, edema
16	20	for arterial plague and clogging of arteries
16	21	for high cholesterol
16	156	for palpitations, a weak heart, and insomnia
16	74	for emotional irritability and agitation
16	66	for tightness in the chest with palpitations when resting
16	67	for palpitations and arrhythmia
129	35	for rejuvenating and strengthening the body
129	61	unable to concentrate, palpitations, insomnia
129	157	for memory loss due to aging, forgetful
129	137	for strengthening the nervous system
129	65	for excessive worry or thought, depleted
129	67	for calming the nervous system
23	87	for deeper cleansing action
23	25	for supporting the white blood cells
23	61	for calming the emotions during high stress
23	96	for detoxification of the lymphatic system
125	124	for chronic lung disorders
125	126	for lung infections with mucous
125	69	for calming during an asthma attack
125	82	for strengthening the immune system
125	132	for allergies, runny nose, and sinusitis
125	133	for sneezing and seasonal allergies
125	134	for acute asthmatic attacks
126	88	for swollen glands and sore throat
126	32	for relieving the aches and pains of the flu
126	96	for detoxification of the lymphatic system
126	131	for tenacious sputum and mucous
126	132	for nasal congestion and running nose
126	99	for infections with weakened immunity
35	77	for enhancing bone marrow production
35	78	for fatigue, long hours, and burn out
35	162	for recovery from injuries or surgery
35	82	for a weakened or compromised immune system
35	83	for fatigue, tired blood, or anemia
35	84	for adrenal fatigue
35	85	for weakness following a febrile disease
35	99	for chronic infections with weak immunity
140	211	for sexual exhaustion, weak libido
140	169	for premature ejaculation
140	145	for enhancing mens fertility
140	149	for impotence or weak libido
140	153	for weak libido due to menopause
140	155	for enhancing womens fertility
141	37	for indigestion following meals, hiatal hernia
141	182	for heartburn and acid reflux
141	39	for sluggish bowels
141	40	for bloating, gas, gastric hyperacidity, ulcers
141	44	for cleansing the liver and stimulating the gall bladder
141	160	for weak appetite, food tastes bland
143	78	for rebuilding the energy
143	61	for relieving stress and calming
143	157	for supplementing the adrenal glands
143	149	for quick libido response
143	84	for supplementing the adrenal glands
105	87	for cleansing of the blood
105	69	for trauma and shock
105	96	for detoxification of the lymph system
105	11	for relieving the swelling
105	98	for relieving the itching
24	23	for solid masses in the chest region
24	25	for enhancing the white blood count
30	31	for diabetes
24	26	for solid masses in the digestive tract
24	69	for stress, trauma, and panic
24	27	for solid masses in the respiratory system
24	29	for high PSA readings, or diseased prostate
45	87	for purification of the blood
45	37	for fatigue after meals
45	60	for compulsive behavior and pensive
45	130	for irritability, anxiety, and stress
45	40	for a weak appetite and loose stool
45	44	for cleansing of the liver
45	154	for vaginal yeast infections and discharge
25	77	enhances blood and bone marrow production
25	35	for building the body energy reserve
25	69	for trauma and panic
25	82	for enhancement of the immune system
25	137	supports the nervous system and calming
25	138	for insomnia and palpitations
25	160	for nausea and weak appetite
78	35	for building endurance
78	137	for nourishing and calming the nervous   system and restorative
78	83	for anemia, dizziness, and fatigue
78	149	for supporting the adrenal glands
78	84	for athletes and professionals who require stamina and endurance
78	67	for building the body reserves and calm the nervous system
21	20	for arterial plaque and poor circulation to   \tthe \theart
21	16	for high blood pressure
21	39	for sluggish bowel movement
21	156	for supporting the cardiac function
21	44	for enhancement of bile production
21	158	for enhancing the liver and gall bladder \t\t\tfunction
59	37	for fatigue after meals and indigestion
59	73	for foggy brain and dreaminess
59	184	for sensitive personalities and unable to \t\t\thandle liver releasing herbs, such as Bupleurum
59	188	for muscular tension in the neck and shoulders
59	30	for low blood sugar or hypoglycemia
88	33	for flu and cold symptoms
88	81	for recurring infections
88	135	for headaches and sinus congestion
88	96	for cleansing of the lymphatic system
88	132	for runny nose and nasal congestion
88	99	for detoxification and immune enhancement
168	166	for diuretic action
168	87	for cleansing of the blood
168	80	for dark colored urine
168	183	for strong cleansing of the urinary system
168	99	for infections and immune system support
26	103	to arrest internal bleeding
26	162	for recovery from surgery
26	39	for chronic constipation
26	82	for immune support
26	47	for healing the tissues of the digestive tract
26	160	for chronic loose stool or weight loss
161	103	for arresting internal bleeding
161	35	for enhancing the bodies energy functions
161	69	for emotional support due to shock, trauma
161	162	supports the recovery process and replenishes the blood and energy
161	121	for pain relief
161	99	for infections and enhancement of the immune system
127	82	for enhancing the immune system
127	81	for recurring infections
127	159	for nourishing and moistening the lungs
127	132	for nasal drip
113	49	for colic, all ages
113	59	for upper body muscular tension and stiffness
113	42	for colic and inflammatory intestinal disorders
113	120	for muscle aches and pains
113	121	for stiffness, limitation of movement,   numbness
113	83	for menstrual pain
113	47	for digestive disturbances and inflammations
113	150	for PMS and menstrual cramps
69	69	With the appropriate presentation, herbal formulas which address the physiological needs of the patient are an important adjunct to the Flower Remedies. This holistic approach respects the intimate relationship of the body-mind-heart-spirit connection.    Emotional confusion and upset often accompanies physiological problems. By relating an emotion to the Five Phases Theory or the Four Humors, and applying an appropriate herbal formula can be very beneficial during the course of the healing process.     An excess or lack of any emotion can serve as a guide to the systemic imbalance of the patient. The important thing to remember is to adapt and apply these theories in a creative and dynamic way. Rigidity spoils the soup, limits the possibilities, and closes the door to healing.
70	70	With the appropriate presentation, herbal formulas which address the physiological needs of the patient are an important adjunct to the Flower Remedies. This holistic approach respects the intimate relationship of the body-mind-heart-spirit connection.    Emotional confusion and upset often accompanies physiological problems. By relating an emotion to the Five Phases Theory or the Four Humors, and applying an appropriate herbal formula can be very beneficial during the course of the healing process.     An excess or lack of any emotion can serve as a guide to the systemic imbalance of the patient. The important thing to remember is to adapt and apply these theories in a creative and dynamic way. Rigidity spoils the soup, limits the possibilities, and closes the door to healing.
147	113	for alleviating pain and discomfort in the abdomen
147	62	for warming the kidneys
147	130	for invigorating the function of the liver
147	152	for harmonizing the menstrual cycle
37	39	for a tendency towards constipation
37	40	for strengthening the digestive process
37	41	for acute constipation
37	42	for inflammatory digestive disorders
37	44	for liver cleansing and bile stimulation
37	47	for healing the tissues of the digestive tract
6	68	for breaking the habit of food addictions
6	166	for water retention
6	112	for fatigue and slow metabolism
6	59	for balancing the functions of the liver and \tspleen
6	4	for reducing the appetite and over-eating
6	40	for reducing bloating and distention
6	30	for low blood sugar and sweet cravings
79	63	moistens the body fluids and kidney tonic
79	80	for excess heat in the upper body and night sweats
79	157	for debility, no motivation, and cold body
79	158	for nourishing and cleansing of the liver
79	189	for loss of vision due to aging
79	97	for red, itchy eyes and inflammation
79	153	for menopause and hormone depletion
89	126	for mucous in the bronchial tubes
89	88	for sore throat and swollen glands
89	81	for chronic, recurring infections in children
89	96	for cleansing the lymphatic system
89	131	for chronic mucous
89	132	for congestion in the nasal cavities
4	166	for water retention
4	6	for supporting weight loss
4	39	for sluggish bowels
4	80	for excess heat in the upper body and   excess thirst
4	30	for sugar sensitivity, hypoglycemic
4	31	for high blood sugar, diabetic
91	88	for strep throat and swollen glands
91	89	for ear infections and earaches
91	92	for the initial stages of the flu
91	33	for influenza, colds, contagious diseases
91	81	for frequent recurring infections
91	96	for swollen lymph, viral or bacterial infections
91	99	for infections with a weak immune system
60	59	for emotional distress, hot and cold temperament
60	130	for constrained emotions
60	156	for nourishing and calming the heart
60	157	where fear is dominating ones life
60	48	for nausea and motion sickness
60	30	for low blood sugar and sugar sensitivities
61	130	for irritability and uptight, anger
61	184	for excess stress and worry
61	156	for nourishing the nervous system
61	80	for night sweats
61	138	for restless sleep
162	103	to arrest bleeding
162	111	for assisting the healing of bones
162	78	for rebuilding the body reserves
162	137	for regeneration of damaged nerves
162	121	for stimulating circulation and pain relief
162	47	for internal bleeding
211	143	for nourishing the nervous system
211	61	for stress relief and calming
211	63	for dry body fluids, including vaginal
211	153	for low libido due to menopause
211	155	for infertility
7	83	for fatigue and weak blood
7	11	for additional blood detoxification
7	12	for chronic dry skin
23	28	for exposure to high levels of radiation
141	47	for inflammation of the digestive tract
45	47	for healing the tissues of the digestive tract
148	113	for abdominal cramps and discomfort
148	96	for enhancing the flow of lymphatic fluids
148	83	for tired blood and weakness
148	150	for PMS and emotional ups and downs
148	152	for irregular menstruation
32	92	for the initial stages of the flu
32	33	for all stages of the flu, aches and pains
32	130	for alternating fever and chills
32	96	for all viral and bacterial infections
32	99	for infections and weak immune system
92	32	for aches and pains, chills and fever during a febrile disease
92	33	for all stages of the flu and febrile diseases
92	130	for alternating fever and chills
92	96	for viral and bacterial infections
33	126	for bronchial infections with moist cough
33	88	for sore throat and swollen glands
33	92	for the initial stages of the flu
33	32	for sweating out the flu
33	130	for alternating fever and chills
33	96	for viral and bacterial infections
33	132	for sinus infections and nasal discharge
62	111	for aging and bone loss
62	129	for enhancing the memory and concentration
62	69	for fear, panic, and shock
62	145	for enhancing the libido and fertilit
62	155	for enhancing the libido and fertility
130	78	for fatigue, weak appetite, and exhaustion
130	113	for menstrual cramps and spasms
130	61	for replacement of prescription tranquilizers \tand sleeping pills
130	83	for anemia, fatigue, and pale skin
130	150	for PMS and emotional highs and lows
182	87	for cleansing the blood
182	37	for upset stomach after eating
182	39	for sluggish bowels and inflammation
182	40	for normalizing the digestive process
182	42	for inflammation of the digestive tract
182	158	for soothing the liver
182	47	for healing tissues of the digestive tract
39	87	for clearing internal heat
39	61	for calming agitation and stress
39	41	for acute constipation (for short term use only)
39	42	for inflammatory intestinal membranes
39	63	for moistening the lower part of the body
39	80	for chronic dark urine and night sweats
39	158	for cleansing the liver and stimulating the gall bladder
40	103	for internal bleeding
40	37	for indigestion following meals
40	182	for heart burn and acid reflux
40	44	for gentle cleansing of the liver and gall bladder
40	47	for chronic digestive tissue irritations
40	48	for nausea and vomiting
41	87	for cleansing of the blood
41	61	for calming and cooling of the emotions
41	130	for a more relaxed and fun approach to life
41	39	for chronic constipation
41	63	for fear that causes panic
41	158	for cleansing of the liver
42	87	for clearing internal body heat
42	37	for aiding digestion after meals
42	6	for better food digestion and elimination
42	61	for itchy skin and insomnia, stress
42	182	for heart burn and acid reflux
42	44	for cleansing the liver
42	98	for itchy skin
73	73	With the appropriate presentation, herbal formulas which address the physiological needs of the patient are an important adjunct to the Flower Remedies. This holistic approach respects the intimate relationship of the body-mind-heart-spirit connection
34	34	Consult a health care practitioner before taking any herbs or herbal formulas during pregnancy.
184	61	difficulty in concentrating and focusing
184	130	for tension, feeling wired, hard to relax
184	64	for a feeling of something stuck in the throat
184	138	difficulty staying asleep
184	139	difficulty in falling asleep
135	63	for headache in the center of the brain
135	44	for liver cleansing and chronic headaches
135	120	for chronic muscle tension and stress
135	188	for muscular tension in the upper body
135	121	anti-inflammatory with pain relief
135	97	for red, irritated eyes
135	48	for nausea and vomiting
156	69	for shock, trauma, and fright
156	137	for rebuilding the nervous system
156	64	for palpitations and arrthymia
156	65	for nourishing and calming the spirit
156	138	for restless, fitful sleep
156	139	for inability to fall asleep
156	66	for palpitations and tightness in the chest
156	67	for weakness, fatigue, and insomnia
169	35	for chronic muscle weakness
169	140	for sexual enhancement
169	63	for painful intercourse and lack of sexual \t\tfluids
169	157	for weakness in the lower body
169	145	for low sperm count
169	149	for lack of libido or impotence
63	58	for relaxing the liver and nourishing the \t\t\theart
63	168	for chronic urinary tract infections
63	61	for hyperthyroid and mouth sores
63	62	when restless fear is accompanied by paralysis of movement
63	80	for excessive night sweats, hot palms and \t\tfeet, hot flashes
38	87	for clearing internal body heat
38	37	for aiding digestion after meals
38	6	for better food digestion and elimination
38	61	for itchy skin and insomnia, stress
38	182	for heart burn and acid reflux
38	44	for cleansing the liver
38	98	for itchy skin
80	79	for dry, tired eyes
80	61	for stress and insomnia
80	169	for urinary incontinence
80	83	for fatigue and tired blood
80	157	for weakness in the lower body
80	31	for high blood sugar
80	153	for alleviating menopausal symptoms
43	87	for cleansing toxic heat
43	77	for anemia and weak blood
43	35	for building the immune system
43	21	for lowering high cholesterol levels
43	37	for sleepiness after meals, heart burn
43	63	for night sweats, thirst, and dry mouth
43	38	for jaundice and stones
43	96	for cleansing the lymphatic system
43	123	for weakness and pain in the lower body
44	87	for cleansing of the blood
44	78	for burn out, fatigue, and lack of energy
44	37	for fatigue after eating
44	39	for chronic constipation
44	41	for acute constipation
44	96	for cleansing of the lymphatic system
44	138	for insomnia and restless sleep patterns
183	87	for all types of herpes outbreaks
183	141	for cleansing the liver and gallbladder
183	168	for urinary tract infections
183	44	for cleansing of the liver
183	97	for inflamed red eyes
183	154	for vaginal discharge
185	87	for deeper cleansing of the blood
185	77	for replenishing the bone marrow
185	35	replenishes the immune system and blood
185	82	for immune system support
185	96	for cleansing the lymphatic system
170	170	With the appropriate presentation, herbal formulas which address the physiological needs of the patient are an important adjunct to the Flower Remedies. This holistic approach respects the intimate relationship of the body-mind-heart-spirit connection.    Emotional confusion and upset often accompanies physiological problems. By relating an emotion to the Five Phases Theory or the Four Humors, and applying an appropriate herbal formula can be very beneficial during the course of the healing process. An excess or lack of any emotion can serve as a guide to the systemic imbalance of the patient. The important thing to remember is to adapt and apply these theories in a creative and dynamic way. Rigidity spoils the soup, limits the possibilities, and closes the door to healing.
82	77	for tired blood and low white blood count
82	35	for recovery from a chronic illness
82	62	for weakness in the lower body
82	81	for recurring infections
82	83	for fatigue, tired blood, and pale skin
82	85	for exhaustion from chronic illness
82	99	for chronic viral and bacterial infections
120	135	for headaches and upper body pain
120	188	for neck and shoulder stiffness
120	121	for pain relief, joint and muscle pain
188	58	for teeth grinding
74	74	With the appropriate presentation, herbal formulas which address the physiological needs of the patient are an important adjunct to the Flower Remedies. This holistic approach respects the intimate relationship of the body-mind-heart-spirit connection.    Emotional confusion and upset often accompanies physiological problems. By relating an emotion to the Five Phases Theory or the Four Humors, and applying an appropriate herbal formula can be very beneficial during the course of the healing process.     An excess or lack of any emotion can serve as a guide to the systemic imbalance of the patient. The important thing to remember is to adapt and apply these theories in a creative and dynamic way. Rigidity spoils the soup, limits the possibilities, and closes the door to healing.
81	77	for chronic blood weakness
81	126	for bronchial infections and wet coughs
81	35	for weakness following a illness
81	78	for fatigue and burn out
81	88	for sore throat and swollen glands
81	89	for ear infections
81	82	for enhancement of the immune system
81	96	for viral and bacterial infections
81	132	for sinus infections and nasal drip
114	115	for low back and knee pain and inflammation
114	188	for upper body pain and muscular distress
114	123	for chronic low back pain and weakness
114	194	for tendonitis, bursitis, carpal tunnel
157	166	for retention of body fluids, edema
157	15	for cold limbs & poor circulation, Reynauds
157	169	for incontinence, spermatorrhea
157	63	for dryness and hot palms and feet
157	144	for support of the prostate gland
157	122	for sciatica, pain running down the leg
157	153	for menopausal symptoms
115	113	for muscular cramps and spasms
115	114	for arthritis, rheumatism, and joint pain
115	157	for strengthening the lower body
115	121	for joint and tendon inflammation and pain
115	122	for sciatica pain or pinched nerve in the \t\t\tlower back
115	123	for chronic low back weakness and pain
71	71	With the appropriate presentation, herbal formulas which address the physiological needs of the patient are an important adjunct to the Flower Remedies. This holistic approach respects the intimate relationship of the body-mind-heart-spirit connection.    Emotional confusion and upset often accompanies physiological problems. By relating an emotion to the Five Phases Theory or the Four Humors, and applying an appropriate herbal formula can be very beneficial during the course of the healing process.     An excess or lack of any emotion can serve as a guide to the systemic imbalance of the patient. The important thing to remember is to adapt and apply these theories in a creative and dynamic way. Rigidity spoils the soup, limits the possibilities, and closes the door to healing
186	186	There are some herbs available to help secure the fetus in cases of habitual or threatened miscarriages.    Consult a health care practitioner before taking any herbal formulas during pregnancy.
158	87	for deeper cleansing action of the blood
158	37	for acid reflux, indigestion after meals
158	182	for heart burn
158	96	for cleansing the lymphatic system
27	87	for deeper cleansing action
27	77	for bone marrow support
27	25	for supporting the white blood cells
27	61	for calming the emotions during high stress
27	82	for rebuilding the immune system
27	159	for rebuilding the function of the lungs
27	96	for detoxification of the lymphatic system
27	28	for support during exposure to high levels of \tradiation
159	124	for chronic lung disorders and breathing \t\t\tdifficulties
159	125	for wheezing, tightness in chest, and asthma
159	126	for bronchitis, moist coughs
159	88	for sore throat and swollen glands
159	127	for dry spasmodic cough
159	80	for facial flushing and night sweats
159	96	for viral and bacterial infections
159	131	for chronic clear mucous
96	126	for phlegmatic coughs and bronchitis
96	88	for sore throat and swollen glands
96	32	when the flu has settled in and the need to sweat it out
96	92	for the initial stages of the flu
96	33	for flu relief, fever, aches and pains
96	132	for nasal and sinus congestion
96	99	for chronic infections with weak immune \t\tsystem
144	87	for deeper cleansing action of the blood
144	168	for urinary tract infection
144	82	for a compromised immune system
144	157	for enhancing the energy of the kidneys
144	96	for cleansing the lymphatic system
144	99	for chronic infections and weak immunity
145	143	for bringing more heart energy into the \t\t\tsexual arena
145	169	for premature ejaculation
145	63	for reducing tension around sexual   performance
145	149	for impotence and weak libido
187	36	for recovery from child birth, prevention of postpartum breakdowns
187	65	for spotting after childbirth
187	83	for blood and qi deficiency after childbirth
46	60	for balancing the liver and spleen
46	40	for watery diarrhea
46	41	for acute constipation
46	42	for inflammatory digestive disorders
46	44	for liver cleansing and bile stimulation
46	47	for healing the tissues of the digestive tract
118	118	Movement Makes Better can be combined with any other herbal formula that is specific to the individuals internal disharmony or disorder, such as Joint Ease for arthritis, Head Ease for headaches, or Muscle Ease for muscular aches and pains.
119	119	Movement Makes Worse can be combined with any other herbal formula that is specific to the individuals internal disharmony or disorder, such as Joint Ease for arthritis, Head Ease for headaches, or Muscle Ease for muscular aches and pains.
120	113	for muscular cramps and spasms
120	130	alternating chills and fever
188	59	for relaxing the muscles and stabilizing
188	113	for muscular cramps and spasms
188	135	for upper body pain and headaches
188	82	for fatigue and weak immunity
188	114	for relief of arthritis and rheumatism
188	121	for pain relief, anti-inflammatory
188	83	for blood deficiency, anemia
136	137	weakness or burn-out of the nervous system
136	135	for nerve inflammation of the upper body \t\tand head
136	122	for sciatic nerve pain
136	99	for viral infection of the nervous system
137	61	for high stress and anxiety, insomnia
137	82	for rebuilding the bodies reserves
137	136	for inflammation of the nerves
137	65	for anxiety and panic from exhaustion and \tdepletion
137	83	for fatigue and rebuilding the blood
137	138	for insomnia due to exhaustion and   depletion
137	139	for an over-excited mind that refuses to \t\t\tstop, insomnia
137	85	when pain causes physical or mental   exhaustion, collapse
107	87	for detoxification of the blood
107	69	for trauma and shock
107	96	for detoxification of the lymph system
107	11	for relieving the swelling
107	98	for relieving the itching
121	135	for additional pain relief in the head region
121	114	for arthritic and rheumatic pain
121	120	for chronic muscular tension
121	188	for neck and shoulder stiffness and pain
121	194	for pain in the arms and wrists
64	69	for trauma, panic, and anxiety
64	60	for strengthening the digestive process
64	65	for panic and anxiety due to exhaustion and \tdepletion
64	131	for chronic mucous and phlegm
65	130	for calming, irritability, and stressed out
65	137	for fortifying the nervous system due to \t\t\texhaustion
65	138	for insomnia and restless sleep due to exhaustion
131	125	for asthmatic breathing
131	35	for fortifying the blood and qi
131	59	for depression and weakness
131	60	for digestive support
131	130	for a hot and cold personality
131	132	for nasal congestion and running nose
131	160	for weak appetite and loose stool
131	99	for infections with weakened immunity
149	143	for bringing relaxation surrounding sexuality
149	169	for premature ejaculation
149	63	for tension and overly self-aware during sex
149	157	for strengthening the kidney yin and the \t\tkidney yang
149	145	for low sperm count or infertility
83	36	for emotional and physical depletion
83	78	for chronic fatigue and depletion of energy
83	60	for strengthening the assimilation of   nutrients
83	130	for liver support and improved digestion
83	65	for anxiety, panic, and spotting
83	150	or PMS and chronic hormonal swings
83	152	for irregular menstruation
19	103	to arrest bleeding
19	39	for chronic constipation
19	41	for acute constipation
19	18	for severe hemorrhoids
19	85	for prolapse of tissues and organs
18	103	to arrest bleeding
18	39	for chronic constipation
18	41	for acute constipation
18	19	for severe hemorrhoids
18	85	for prolapse of tissues
29	25	for support of the immune system during \t\tchemotherapy
29	168	for cleansing of the urogenital system
29	63	brings nourishment to the kidneys
29	144	supports a healthy prostate gland
29	28	for protection of the tissues during radiation therapy
75	75	With the appropriate presentation, herbal formulas which address the physiological needs of the patient are an important adjunct to the Flower Remedies. This holistic approach respects the intimate relationship of the body-mind-heart-spirit connection.    Emotional confusion and upset often accompanies physiological problems. By relating an emotion to the Five Phases Theory or the Four Humors, and applying an appropriate herbal formula can be very beneficial during the course of the healing process.     An excess or lack of any emotion can serve as a guide to the systemic imbalance of the patient. The important thing to remember is to adapt and apply these theories in a creative and dynamic way. Rigidity spoils the soup, limits the possibilities, and closes the door to healing.
10	83	for fatigue, anemia, and weak blood
10	11	for additional blood detoxification
10	12	for chronic dry skin
189	79	for retinal degeneration
189	63	moistens the body fluids and kidney tonic
189	80	for excess heat in the upper body and night sweats
189	157	for debility, no motivation, and cold body
189	158	for nourishing and cleansing of the liver
189	189	for loss of vision due to aging
189	97	for red, itchy eyes and inflammation
164	164	With the appropriate presentation, herbal formulas which address the physiological needs of the patient are an important adjunct to the Flower Remedies. This holistic approach respects the intimate relationship of the body-mind-heart-spirit connection.    Emotional confusion and upset often accompanies physiological problems. By relating an emotion to the Five Phases Theory or the Four Humors, and applying an appropriate herbal formula can be very beneficial during the course of the healing process.     An excess or lack of any emotion can serve as a guide to the systemic imbalance of the patient. The important thing to remember is to adapt and apply these theories in a creative and dynamic way. Rigidity spoils the soup, limits the possibilities, and closes the door to healing.
123	122	for sciatica or pinched nerve in lower back
30	58	for calming, teeth grinder, insomnia
30	59	for emotional highs and lows, mood swings
30	130	for irritability, anxiousness, edgy
30	83	for fatigue and tired blood
76	76	With the appropriate presentation, herbal formulas which address the physiological needs of the patient are an important adjunct to the Flower Remedies. This holistic approach respects the intimate relationship of the body-mind-heart-spirit connection.    Emotional confusion and upset often accompanies physiological problems. By relating an emotion to the Five Phases Theory or the Four Humors, and applying an appropriate herbal formula can be very beneficial during the course of the healing process.     An excess or lack of any emotion can serve as a guide to the systemic imbalance of the patient. The important thing to remember is to adapt and apply these theories in a creative and dynamic way. Rigidity spoils the soup, limits the possibilities, and closes the door to healing.
28	77	for rebuilding the white blood count
28	63	for dry mouth and throat, night sweats
28	82	for rebuilding the immune system
28	76	for emotional protection from radiation
28	11	for clearing radiation burns
97	87	for cleansing the blood
97	79	for macular degeneration, retinitis
97	80	for heat or dryness in the upper body
97	44	for liver and/or gallbladder pain
97	96	for cleansing the lymphatic system
97	189	for blurred vision, corneal ulcers, glaucoma
138	61	for irritability and inability to concentrate
138	130	for edginess, belligerence, and anger
138	65	for excessive thought, worry, and anxiety
138	67	for anxiety with palpitations
122	113	for severe muscular cramps and spasms
122	114	for arthritic aches and pains
122	115	for inflammation of the lower back or knees
122	118	for pain that decreases with movement
122	120	for muscular tension and spasms
122	137	for restoring the nerves
122	121	for arthritic and rheumatic aches and pains
122	123	for chronic weakness in the lower back and\tlower body
132	126	for bronchial and respiratory infections, \t\t\tmoist cough
132	88	for sore throat and strep infections, swollen glands, tonsillitis
132	33	for contagious diseases, colds, flu, fever
132	135	for headache with sinus infection
132	96	for contagious diseases and infections
132	131	for chronic clear mucous
11	87	for deeper cleansing of the blood
11	7	for eczema, contact dermatitis, and skin \t\trashes
11	10	for psoriasis, rashes, weepy, red, itchy skin
11	98	for hives, itchy skin, and allergic skin rashes
11	12	for dry and aging skin
98	87	for deeper cleansing of the blood
98	141	for allergic reactions
98	44	for cleansing of the liver and gall bladder  Irritation Remedy
98	74	for emotional irritability
98	11	for various outbreaks of the skin
12	1	for acne, adolescent acne, chronic skin   problems
12	63	for dry skin, dry mouth and throat
12	83	for building healthier blood
12	11	for occasional skin blemishes and boils
12	150	for hormonal acne
12	153	for menopause and hormone deficiency
139	143	for calming a stressed body and mind
139	61	for irritability and inability to concentrate
139	130	for edginess, belligerence, and anger
139	65	for excessive thought, worry, and anxiety
139	67	for anxiety with palpitations
47	103	for internal bleeding
47	37	for indigestion following meals
47	182	for heart burn and acid reflux
47	40	for stomach or duodenal ulcers
47	42	for colitis or irritable bowels
47	44	for gentle cleansing of the liver and gall \t\t\tbladder
47	46	for vomiting and diarrhea, dysentery
47	48	for nausea and vomiting
133	135	for headaches with sinus congestion
133	44	for supporting the livers production of   antihistamines
133	82	for strengthening the bodys defense
133	81	for chronic infections that effect the sinuses
133	97	for red, itchy eyes with allergies
133	57	for calming and cleansing of the liver
66	57	for calming and cleansing of the liver
66	68	for breaking the emotional links
66	61	for calming an overly excited personality
66	158	for a weaker constitution with emotional \t\twithdrawal
66	65	for calming a more subdued personality
66	138	for restless sleep or surface sleep
66	139	for insomnia with a non-stop mind
160	35	for weakness, loss of weight, poor digestion
160	37	for indigestion after meals, heart burn
160	58	for depression and feel like stuck in a rut
160	130	for negative and aggressive behavior
160	46	for vomiting and diarrhea
160	47	for intestinal inflammation and nutritional impairment, weakness
84	35	for weakness and loss of weight
84	78	for exhaustion, low vitality, and general \t\t\tlassitude
84	62	for lower back pain and weak lower body
84	83	for fatigue and weak blood, dizziness
84	149	for weak libido in men and fatigue after sex
84	211	for weak libido in women, no interest in sex
48	60	for chronic digestive disorders
48	40	for gastric hyperacidity and abdominal pain
48	44	for inconsistent stools and feeling blah
48	46	for vomiting and diarrhea
48	47	for inflammation of the digestive tract
48	160	for diarrhea and lack of appetite
123	113	for muscular cramps and spasms
123	114	for arthritis, rheumatism, and joint pain
123	157	for strengthening the lower body
123	115	for stiffness and swelling in the lower back and knees
123	121	for joint and tendon inflammation and pain
31	6	for obesity, overweight
31	79	for dry eyes, cataracts
31	4	for gnawing hunger and excess appetite
31	80	for night sweats and dry mouth
31	157	for excess urination and weak lower body
31	159	for dry throat and dry cough
31	136	for neuropathy
54	49	for colic and indigestion
54	51	for feverish conditions during teething
54	55	for teething, especially suits those infants \t\twho bare their challenges stoically
55	49	for colic and indigestion
55	51	for feverish conditions during teething
14	87	for cleansing the blood
14	62	for oily hair
14	83	for weakness in the blood
14	11	for scaly scalp conditions
14	12	for dry skin and hair
67	61	unable to concentrate, palpitations, insomnia
67	137	for nourishing the nerves and calming
67	65	for excessive worry or thought, depleted
67	138	for restless and surface sleep
67	139	for inability to fall asleep
193	193	When there is a need to induce vomiting, all other herbal formulas should be suspended until the situation returns to normal.
85	35	for fatigue following an illness
85	78	for stress, burnt out, fatigue
85	60	for weak digestion and anxiety
85	62	for weak lower body with cold extremities
85	18	for hemorrhoids (piles)
85	84	for adrenal exhaustion
99	87	for cleansing of the blood
99	33	for flu like symptoms
99	130	for alternating chills and fevers
99	183	for deep seated viral infections, herpes, \t\t\tshingles
99	82	for a weakened immune system
99	114	for joint aches and pains
99	96	for cleansing of the lymphatic system
22	60	for weak digestion and anxiety
22	19	for hemorrhoids
22	18	for hemorrhoids
22	160	for weak appetite, exhaustion upon exertion
22	85	for fatigue, collapsed organs, sleep curled up in a ball
110	87	for detoxification of the blood
110	69	for trauma and shock
110	44	for cleansing the liver
110	96	for detoxification of the lymph system
110	11	for relieving the swelling
110	98	for relieving the itching
110	99	for detoxification of the body and support the immune system
134	124	for chronic and long-standing lung and \t\t\tbreathing problems
134	125	for asthma (chronic bronchial asthma and \t\tmild asthma)
134	125	for acute and chronic coughs with mucous
134	127	for acute and chronic dry coughs with no \t\tmucous
134	159	for dry chronic cough, cough with scanty \t\tmucous, wheezing
134	131	for coughing with copious sputum, chronic mucous
150	78	for exhaustion, low blood pressure, and \t\t\tgeneral \tlassitude
150	113	for acute and chronic menstrual spasms and \tcramps
150	147	for abdominal masses, fluid cysts, menstrual \tpain
150	148	for lower abdominal masses, uterine fibroids
150	83	for fatigue, tired blood, maintaining smooth \tand pain free periods
154	35	for weakness, loss of weight, poor digestion and assimilation
154	60	for weak digestion and anxiety
154	183	for foul smelling leukorrhea, genital herpes
154	157	for weakness in the lower body
154	160	for tendency to loose stool or diarrhea,   distention, nausea
152	78	for fatigue due to frequent and prolonged \t\tstress
152	119	for pain that worsens with movement
152	65	for early or prolonged menstruations,   anemia, spotting
152	83	for fatigue, tired blood, irregular   menstruation
152	152	for infertility, mild or persistent uterine \t\t\tbleeding
153	168	for frequent bladder infections
153	61	for stress and insomnia
153	211	for a weak libido
153	63	for dry mouth, afternoon fever
153	80	for frequent hot flashes, night sweats
153	183	for vaginal herpes
153	138	for restless and shallow sleep
153	12	for dry, aging skin
153	14	for thinning hair
153	85	for prolapsed organs or depletion
155	143	for nervous exhaustion, stress, insomnia
155	211	for sexual exhaustion, debility, lack of libido
155	63	for dryness of sexual fluids
155	83	for PMS, infertility, habitual miscarriage
155	152	for anemia, fatigue, menstrual irregularity
56	56	To ensure a daily bowel movement, take either GI Movement or GI Corrective.     We recommend that following a successful worming treatment program, a herbal formula be taken to tone the digestive tract, such as:
56	60	for supporting digestion, calming, and   \trelieving stagnation
56	47	for soothing the mucous membranes in the \tdigestive system
56	160	for poor assimilation of food, weak appetite
194	135	for headache and stiff upper back
194	114	for arthritis, rheumatism, stiff and achy \t\t\tjoints
194	119	for pain that worsens with movement
194	120	for chronic muscular tension
194	188	for bursitis, tendonitis, limited mobility in the upper body
194	121	for numbness, neuralgia
103	101	for wounds to the skin
103	180	for bruises and wounds
103	109	for sprains and pulled muscles
180	103	for internal hemorrhaging, black and blue bruises
180	162	for trauma to muscles, tissues, and joints
180	118	for pain that decrease with movement
180	119	for pain that intensifies with movement
180	120	for muscular tension and stiffness
180	136	for inflamed nerve fibers
180	121	for pain relief
180	123	for low back pain
180	101	for cleansing the affected area
104	87	for cleansing the blood
104	69	for emotional trauma and shock
104	82	for supporting the immune system
104	28	for clearing burns and nourishing the blood
104	76	for clearing surface burns
104	12	for supporting healthy skin tissue
104	101	for cleansing the affected area
142	87	for cleansing of the blood
142	105	for insect bites
142	7	for eczema, dermatitis
142	183	for herpes outbreak
142	10	for psoriasis, dermatitis
142	11	for carbuncles, sores, and boils
142	99	for deeper detoxification and immune   support
142	101	for cleansing the affected area
3	87	for cleansing of the blood
3	7	for eczema
3	11	for skin suppurations, pimples, and acne
3	12	for chronic dry skin
3	101	for cleansing the affected area
3	8	for fungal infections, apply prior to Calendula Cream
112	15	for cold limbs and poor circulation
112	113	for muscular cramps and spasms
112	114	for arthritis and joint pain
112	115	for knee and back pain
112	120	for muscular stiffness
112	188	for upper body pain
112	121	for aches and pains of the body
112	123	for weakness in the lower back, lumbago
112	194	for pain in the arms
5	7	for eczema, dermatitis, and rough skin
5	83	for weak blood, pale skin, and fatigue
5	11	for acne and skin outbreaks
5	12	for chronic dry skin
5	152	for balancing a womans hormones
53	49	if colic or any digestive disturbances are \t\tpresent in the baby
53	101	for cleansing the affected area
181	88	for sore throat and swollen glands
181	89	for ear aches and fluid build-up in the ear canals
181	33	for symptom relief from the flu
181	135	for headache and congestion
181	81	for chronic recurring infections
181	96	for bacterial and viral infections
181	131	for excessive mucous
181	132	for nasal discharge and sinus infection
106	87	for cleansing of the blood
106	79	for dry eyes, macular degeneration retinitis
106	135	for headaches and frontal congestion
106	44	for liver cleansing and enhance the production of antihistamines
106	97	for relieving red, itchy eyes
106	132	for acute and chronic sinus infections
106	133	for seasonal allergies and itchy eyes
8	87	for detoxification of the blood
8	91	for internal cleansing and immune enhancement
8	44	for cleansing viruses from the liver
8	11	for skin inflammations
8	101	for cleansing the affected area
93	87	for cleansing the blood from toxins
93	182	for acid reflux and heartburn
93	63	for strengthening the teeth and gums
93	183	for herpes, mouth sores
93	96	for viral and bacterial infections
93	94	for gum disease, gingivitis, and mouth sores
94	87	for cleansing the blood
94	91	for cleansing and immune enhancement
94	63	for mouth sores and teeth problems when accompanied with signs of dryness
94	80	for excess heat in the head and upper body, night sweats, hot palms and feet
94	96	for swollen lymph glands and toothache
94	99	for infections and a weak immune system
94	93	for cleansing the mouth and throat from harmful bacteria
94	182	for heartburn, acid reflux
9	35	for a depleted body and energy system
9	62	for oily hair and skin
9	158	for nourishing the liver and blood
9	83	for fatigue and tired blood
9	11	for scaly skin or dandruff
9	12	for dryness of the skin
9	84	for glandular support
9	14	for thinning or receding hair
9	5	for irritated, chapped, or itchy skin
9	165	to help reduce scar tissue from blemishes
95	103	for arresting bleeding
95	87	for cleansing the blood
95	161	for pain relief and discomfort
95	162	for enhancing the internal healing process
95	96	for viral and bacterial infections
128	57	for rebellious behaviour
128	68	for breaking the link to the addiction
128	125	for asthma and wheezing
128	126	for chronic mucous in the lungs
128	127	for dry cough without mucous
128	44	for detoxification of the liver
128	71	for assistance in the emotional letting go of the habit
128	159	for moistening the lungs and healing the \t\tlung tissues from smoke damage
128	134	for acute asthma attacks and wheezing
116	114	for arthritis and joint pain
116	115	for knee and back pain
116	120	for muscular stiffness
116	188	for upper body pain
116	121	for aches and pains of the body
116	123	for weakness in the lower back, lumbago
116	194	for pain in the arms
117	113	for muscular cramps and spasms
117	114	for arthritis and joint pain
117	115	for knee and back pain
117	120	for muscular stiffness
117	188	for upper body pain
117	121	for aches and pains of the body
117	123	for weakness in the lower back, lumbago
117	194	for pain in the arms
108	103	arrests bleeding and helps tissues to mend
108	87	for cleansing of the blood
108	162	benefits the healing process for all injuries
108	96	for cleansing of the lymphatic system
108	120	for alleviating muscle tension
108	121	for alleviating joint pain
108	11	for boils and carbuncles
108	101	for wounds to the skin
108	180	for bruises and wounds
108	109	for sprains and pulled muscles
165	103	to arrest bleeding and help tissues to heal
165	87	for infections and cleansing of the blood
165	162	for surgery, wounds, broken bones, and \t\t\ttraumatic injuries
165	99	for internal cleansing and immune support
165	101	for cleansing the affected area
109	111	for broken bones, strained or torn ligaments
109	114	for painful joints
109	115	for injury and swelling to the lower back or knee
109	120	for muscular tension and spasms
109	188	for neck tension and shoulder inflammation
109	121	for joint and tendon trauma
109	123	for chronic lower back pain or weakness
109	194	for bursitis, tendonitis, and carpal tunnel
13	87	for cleansing of the blood
13	44	for cleansing of the liver
13	96	for cleansing of the lymphatic system
13	99	for anti-viral activity
13	101	for cleansing the affected area
151	140	for a weak libido
151	143	for opening of the heart
151	211	for sexual exhaustion, debility, lack of libido
151	211	for dryness of sexual fluids
151	80	for hot flashes, night sweats
151	65	for spotting between periods
151	12	for aging, drying skin
151	14	for thin and brittle hair
151	153	for menopausal symptoms
151	155	for mild or persistent uterine bleeding
\.


--
-- Data for Name: complementary_singles; Type: TABLE DATA; Schema: public; Owner: app
--

COPY complementary_singles (herb_id, product_id, herb_action_number) FROM stdin;
97	100	action_1
58	100	action_1
302	1	action_2
312	1	action_2
390	1	action_2
237	1	action_2
399	57	action_2
241	57	action_2
455	57	action_2
58	124	action_2
327	124	action_2
355	124	action_2
266	124	action_2
111	166	action_2
364	166	action_2
156	166	action_2
252	166	action_2
473	166	action_2
495	1	action_2
218	57	action_2
49	20	action_2
305	20	action_2
73	20	action_2
123	20	action_2
191	20	action_2
74	49	action_2
319	49	action_2
101	36	action_2
415	36	action_2
210	36	action_2
227	36	action_2
453	36	action_2
87	58	action_2
137	58	action_2
411	58	action_2
474	58	action_2
477	58	action_2
288	17	action_2
332	17	action_2
359	17	action_2
55	103	action_2
65	103	action_2
156	103	action_3
155	87	action_2
194	87	action_2
198	87	action_2
473	87	action_3
42	77	action_2
495	77	action_3
61	77	action_2
496	77	action_1
489	77	action_2
269	77	action_2
335	15	action_2
110	15	action_2
355	15	action_3
168	15	action_2
474	15	action_3
43	167	action_2
101	167	action_3
139	167	action_2
453	167	action_3
79	111	action_2
90	111	action_2
355	111	action_4
142	111	action_2
446	111	action_2
261	111	action_2
49	16	action_3
365	16	action_2
227	16	action_3
474	16	action_4
48	129	action_2
64	129	action_2
497	129	action_1
365	129	action_2
411	129	action_3
196	129	action_2
147	23	action_2
498	23	action_1
149	23	action_2
239	23	action_2
455	23	action_2
506	87	action_2
264	87	action_2
506	125	action_3
410	125	action_2
206	125	action_2
210	125	action_3
499	125	action_1
343	126	action_2
185	126	action_2
413	126	action_2
242	126	action_2
266	126	action_5
318	35	action_2
154	35	action_2
439	35	action_2
456	35	action_2
105	140	action_2
339	140	action_2
125	140	action_2
417	140	action_2
218	140	action_3
455	140	action_4
494	140	action_2
506	141	action_4
355	141	action_5
149	141	action_3
105	143	action_2
339	143	action_2
125	143	action_2
417	143	action_2
218	143	action_3
455	143	action_4
494	143	action_2
303	24	action_2
441	24	action_2
500	45	action_1
501	45	action_1
417	45	action_3
455	45	action_2
210	25	action_2
253	25	action_2
269	25	action_3
105	78	action_3
364	78	action_3
448	78	action_2
489	78	action_3
49	21	action_2
76	21	action_2
123	21	action_2
146	21	action_2
495	59	action_3
355	59	action_6
417	59	action_4
473	59	action_8
16	88	action_3
82	88	action_2
131	88	action_2
198	88	action_3
101	168	action_2
359	168	action_3
152	168	action_2
156	168	action_2
453	168	action_4
266	168	action_2
495	26	action_2
101	26	action_4
455	26	action_2
502	127	action_1
364	127	action_4
399	127	action_3
185	127	action_2
192	127	action_2
203	127	action_2
326	147	action_2
351	147	action_2
143	147	action_2
231	147	action_2
484	147	action_2
273	37	action_2
296	37	action_2
240	37	action_2
455	37	action_3
145	6	action_2
417	6	action_3
237	6	action_3
473	6	action_4
113	79	action_2
133	79	action_2
145	79	action_3
305	89	action_2
149	89	action_3
455	89	action_2
145	4	action_4
199	4	action_2
234	4	action_2
473	4	action_4
70	91	action_2
131	91	action_3
149	91	action_3
266	91	action_3
143	60	action_3
364	60	action_3
171	60	action_2
210	60	action_4
448	60	action_3
240	60	action_3
253	60	action_2
175	61	action_2
411	61	action_4
218	61	action_4
455	61	action_5
490	61	action_2
474	162	action_5
266	162	action_4
16	211	action_4
277	211	action_2
288	211	action_3
448	211	action_4
494	211	action_3
154	7	action_3
256	7	action_2
336	148	action_2
503	148	action_1
199	148	action_3
221	148	action_2
473	148	action_5
344	32	action_2
353	32	action_2
183	32	action_2
247	32	action_2
484	32	action_2
344	33	action_2
353	33	action_3
183	33	action_2
247	33	action_3
293	62	action_2
504	62	action_1
129	62	action_2
364	62	action_3
223	62	action_2
241	62	action_3
101	130	action_2
140	130	action_2
237	130	action_3
240	130	action_3
465	130	action_2
320	182	action_2
367	182	action_2
163	182	action_2
240	182	action_2
88	39	action_2
359	39	action_4
246	39	action_2
484	39	action_2
59	40	action_2
406	40	action_2
410	40	action_3
505	41	action_1
279	41	action_2
455	41	action_6
491	41	action_2
336	42	action_3
506	42	action_5
273	169	action_3
302	169	action_3
453	169	action_5
43	63	action_3
299	63	action_2
123	63	action_3
199	63	action_2
448	63	action_2
241	63	action_4
62	38	action_2
139	38	action_3
199	38	action_4
237	38	action_4
335	34	action_2
117	34	action_2
417	34	action_4
455	34	action_4
320	184	action_3
167	184	action_2
417	184	action_5
199	184	action_5
218	184	action_5
461	184	action_2
253	184	action_3
82	135	action_3
409	135	action_2
410	135	action_4
506	11	action_8
474	135	action_6
48	156	action_3
365	156	action_3
455	156	action_7
490	156	action_3
128	80	action_2
139	80	action_3
172	80	action_2
404	80	action_2
243	80	action_2
105	43	action_4
110	43	action_3
48	44	action_4
352	44	action_2
355	44	action_7
182	44	action_2
473	44	action_6
312	183	action_2
168	183	action_3
200	183	action_2
474	183	action_7
100	185	action_2
138	185	action_2
285	82	action_2
299	82	action_3
406	82	action_3
417	82	action_6
241	82	action_5
96	81	action_2
506	81	action_6
404	81	action_3
76	114	action_3
86	114	action_2
94	114	action_2
373	114	action_2
415	114	action_3
417	114	action_7
59	157	action_3
299	157	action_2
364	157	action_5
417	157	action_5
450	157	action_2
76	115	action_3
94	115	action_3
415	115	action_3
417	115	action_8
335	186	action_2
105	186	action_5
127	186	action_2
417	186	action_9
455	186	action_8
491	186	action_3
495	158	action_4
97	158	action_2
105	158	action_6
127	158	action_3
163	158	action_2
59	27	action_4
241	27	action_6
16	159	action_5
96	159	action_2
155	159	action_3
187	159	action_2
310	96	action_2
82	96	action_4
189	96	action_2
375	96	action_3
477	96	action_3
293	144	action_3
373	144	action_3
421	144	action_2
112	145	action_2
404	145	action_4
320	187	action_4
111	187	action_3
355	187	action_8
417	187	action_2
281	46	action_2
404	46	action_5
440	46	action_2
376	120	action_2
484	120	action_3
485	120	action_2
94	188	action_2
376	188	action_2
253	188	action_6
485	188	action_2
76	121	action_3
78	121	action_2
406	121	action_4
237	121	action_5
94	64	action_4
335	64	action_3
417	64	action_10
199	64	action_4
240	64	action_2
253	64	action_4
299	65	action_4
320	65	action_5
110	65	action_4
218	65	action_6
241	65	action_4
455	65	action_4
14	131	action_2
344	131	action_3
62	131	action_4
253	131	action_5
320	149	action_7
112	149	action_3
355	149	action_9
412	149	action_2
448	149	action_5
494	149	action_4
289	83	action_2
76	83	action_4
101	83	action_5
415	83	action_4
110	83	action_5
338	18	action_2
359	18	action_4
471	18	action_2
491	18	action_4
59	29	action_5
94	29	action_5
433	29	action_2
237	29	action_5
148	10	action_2
131	10	action_4
191	10	action_3
62	189	action_3
188	189	action_2
15	28	action_2
293	28	action_4
342	28	action_2
506	97	action_7
343	97	action_3
179	97	action_2
227	97	action_4
473	97	action_7
48	138	action_5
411	138	action_5
218	138	action_7
237	138	action_6
165	132	action_3
172	132	action_3
507	132	action_2
244	132	action_2
305	11	action_3
131	11	action_5
157	11	action_2
191	11	action_4
473	11	action_8
506	98	action_9
201	98	action_2
473	98	action_3
264	98	action_3
59	12	action_6
172	12	action_4
242	12	action_3
473	12	action_6
477	12	action_2
346	133	action_2
359	133	action_6
165	133	action_3
172	133	action_3
507	133	action_2
14	66	action_3
304	66	action_2
110	66	action_6
508	66	action_2
214	66	action_2
66	160	action_2
320	160	action_6
86	160	action_3
199	160	action_6
86	84	action_2
117	84	action_3
186	84	action_2
231	84	action_3
163	48	action_2
205	48	action_2
240	48	action_2
376	123	action_2
479	123	action_2
485	123	action_2
495	30	action_3
168	30	action_4
410	30	action_5
216	30	action_2
237	30	action_7
16	31	action_5
154	31	action_4
179	31	action_2
199	31	action_7
102	14	action_2
174	14	action_2
179	14	action_3
48	67	action_6
320	67	action_5
222	67	action_2
474	67	action_8
50	85	action_2
277	85	action_3
100	85	action_3
127	85	action_4
347	85	action_2
342	99	action_3
200	99	action_3
101	150	action_6
335	150	action_4
127	150	action_5
179	150	action_4
269	150	action_2
116	154	action_2
128	154	action_3
176	154	action_2
212	154	action_2
440	154	action_3
129	152	action_3
154	152	action_5
143	152	action_4
355	152	action_4
16	155	action_6
59	155	action_4
110	155	action_7
168	155	action_3
509	56	action_1
376	194	action_2
406	194	action_3
479	194	action_2
485	194	action_2
453	103	action_6
\.


--
-- Data for Name: contra_indications; Type: TABLE DATA; Schema: public; Owner: app
--

COPY contra_indications (id, name, description) FROM stdin;
122	FDA external use	These herbs are recommended for external use only according to FDA Guidelines
123	Cautions	FDA considers these herbs to be used with caution
124	Short Term Use Only	These herbs are for short term use only and/or in minimal dosages in herbal remedies, or used as a homeopathic
125	Use in Minimal Dosages	These herbs are for short term use only and/or in minimal dosages in herbal remedies, or used as a homeopathic
126	Use as a Homeopathic	These herbs are for short term use only and/or in minimal dosages in herbal remedies, or used as a homeopathic
127	Pregnancy or Nursing	Herbs recommended not to be used during pregnancy or nursing
128	Blood Thinning Medication	Herbs recommended not to be used when taking prescription blood thinning medication
129	Chemotherapy or Radiation	Herbs recommended not to be used when undergoing chemotherapy, radiation therapy, or taking MAO inhibitors &leftpar;anti-depressant drugs&rightpar;
130	Blood Pressure Medication	Herbs recommended to avoid with blood pressure medication
131	Anti-Seizure Medication	Herbs recommended to avoid with anti-seizure medication
132	Interferon Treatments	Herbs and herbal formulas recommended to avoid when undergoing interferon treatments or other drug therapies\r\n\n
133	Skin Rash	Possible side effect &leftpar;usually if taken in dosages larger than recommended
134	Weak Digestion, Diarrhea, Nausea, or Inflammatory 	Herbs recommended to be used with caution with weak digestion, diarrhea, nausea, or inflammatory digestive diseases
135	Unsafe as Food	These herbs are considered unsafe as food according to FDA Guidelines 
136	External Use Only	These herbs are recommended for external use only according to FDA Guidelines
137	Broken Skin	Herbs recommended not for use on broken skin
138	Antidepressant Medication	Herbs recommended not for use when taking MAO-inhibitors &leftpar;antidepressant drugs&rightpar;
139	Kidney Disease	Herbs recommended not for use with kidney dysfunction\r\n\n
140	Liver Disease	Herbs recommended not for use with liver dysfunction\r\n\n
141	Hyperthyroid	Herbs recommended not for use with hyperthyroid conditions
142	Anti-Platelet Activity 	Herbs commonly used for their anti-platelet activity \r\n\n&leftpar;prevents strokes and heart attacks&rightpar; \r\n\n
143	Anti-Coagulant Activity 	Herbs commonly used for their anti-coagulant activity \r\n\n&leftpar;prevents blood clotting&rightpar;\r\n\n
144	Pro-Coagulants	Herbs commonly used as pro-coagulants
145	Happy Thoughts!	Herbs commonly used for happy thoughts!
147	Frontal Headache	Possible side effect &leftpar;usually if taken in dosages larger than recommended
148	Stomach Irritation	Possible side effect &leftpar;usually if taken in dosages larger than recommended
150	Nervousness	Possible side effect &leftpar;usually if taken in dosages larger than recommended&rightpar;
151	Depression	Possible side effect &leftpar;long term use&rightpar;
152	Inflammation	Aggravate inflammation  &leftpar;usually if taken in dosages larger than recommended&rightpar;
153	Nausea, Vomiting	Possible side effect &leftpar;usually if taken in dosages larger than recommended&rightpar;
154	Pregnancy &leftpar;Cohosh Herbs&rightpar;	Traditionally, Black Cohosh has not been used during the first seven months of a pregnancy.  Traditionally, Blue Cohosh has been used to strengthen the uterus throughout the entire pregnancy.
155	Drug Interactions	St. Johns Wort is the most frequently named herb for causing drug interactions. It is best not to use this herb if someone is taking prescribed medications or undergoing chemotherapy. Blood thinners, such as Coumadin, are reported to have a greater frequency of interaction with herbs. Blood coagulation tests should be done regularly when combining herbs with blood thinners. 
157	Blood Sugar Drop  &leftpar;Low Blood Sugar&rightpa	Possible side effect &leftpar;usually if taken in dosages larger than recommended&rightpar;
\.


--
-- Name: contra_indications_local_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app
--

SELECT pg_catalog.setval('contra_indications_local_id_seq', 157, true);


--
-- Data for Name: health_category; Type: TABLE DATA; Schema: public; Owner: app
--

COPY health_category (id, name) FROM stdin;
1	Body Care
3	Circulatory Support
5	Digestive Support
6	Emotional Support
7	Restorative
8	First Aid
9	Emotional Support-Flower Remedies
10	Cleansing Support
11	Muscular & Skeletal
12	Nervous System
16	Renal Support
17	Respiratory Support
18	Men's Health
19	Women's Health
20	Child & Natal Care
\.


--
-- Name: health_category_local_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app
--

SELECT pg_catalog.setval('health_category_local_id_seq', 20, true);


--
-- Name: permission_local_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: app
--

SELECT pg_catalog.setval('"permission_local_ID_seq"', 2, true);


--
-- Data for Name: product_category; Type: TABLE DATA; Schema: public; Owner: app
--

COPY product_category (category_name, id) FROM stdin;
External Lotion	1
Herbal Remedy	2
Internal Powder	3
Flower Remedy	4
Ointment	5
Herbal Smoke	6
Internal Drops	7
External Wash	8
External Powder	9
External Drops	10
External Paste	11
Herbal Remedy Special	12
Specialty Tonic	13
Gargle Mouthwash	14
External Cream	15
Gum Lotion	16
Antiseptic Lotion	17
Tonic Spray	18
Spritzers	19
Bath Salts	20
Wart Lotion	21
Hair Lotion	27
herbremedy4oz	28
herbremedy1oz	29
herbremedy8oz	30
internalpowder2.5oz	31
extrnalpowder2.5oz	32
internalpowder.75oz	33
extrnalpowder.75oz	34
burnlotion2oz	35
acnelotion4oz	36
eyewash1oz	37
External Balm	38
External Rub	39
\.


--
-- Name: product_category_local_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app
--

SELECT pg_catalog.setval('product_category_local_id_seq', 39, true);


--
-- Data for Name: product_health_category; Type: TABLE DATA; Schema: public; Owner: app
--

COPY product_health_category (product_id, health_category_id) FROM stdin;
192	19
193	8
194	11
211	19
2	1
3	1
4	1
5	1
6	1
7	1
8	1
9	1
10	1
11	1
12	1
13	1
14	1
15	3
16	3
18	3
19	3
20	3
21	3
22	3
37	5
38	5
39	5
40	5
41	5
42	5
44	5
46	5
47	5
48	5
49	20
51	20
52	20
53	20
54	20
55	20
57	6
58	6
59	6
60	6
61	6
62	6
63	6
64	6
65	6
66	6
68	9
69	9
70	9
71	9
73	9
74	9
75	9
77	7
78	7
79	7
80	7
81	7
82	7
83	7
84	7
85	7
87	10
88	10
89	10
91	10
92	10
93	10
94	10
96	10
97	10
98	10
99	10
100	8
101	8
102	8
103	8
104	8
105	8
106	8
107	8
108	8
109	8
110	8
111	11
112	11
113	11
114	11
115	11
116	11
117	11
118	11
119	11
120	11
121	11
122	11
123	11
124	17
125	17
126	17
127	17
128	17
131	17
132	17
133	17
134	17
136	12
137	12
138	12
139	12
144	18
145	18
147	19
148	19
150	19
151	19
152	19
153	19
154	19
155	19
166	16
167	16
168	16
169	16
170	9
1	1
156	3
95	1
86	8
36	20
17	20
129	12
23	10
35	7
140	18
140	19
141	5
142	1
143	6
24	10
45	10
25	7
26	10
161	11
113	19
90	20
162	7
32	10
33	10
130	6
169	18
34	20
135	11
43	10
157	16
158	5
27	10
159	17
149	18
83	19
80	19
29	10
164	9
76	10
28	7
165	1
160	5
30	7
31	7
67	12
56	5
159	6
157	6
156	6
158	6
160	6
67	6
85	6
56	10
28	10
25	10
180	8
181	8
182	5
183	10
184	6
185	10
185	7
186	20
187	20
188	11
189	7
\.


--
-- Data for Name: product_sample_indications; Type: TABLE DATA; Schema: public; Owner: app
--

COPY product_sample_indications (preferred, product_id, sample_indications_id) FROM stdin;
f	1	5
f	35	19
f	87	175
f	77	175
f	35	175
f	44	175
f	82	175
f	157	175
f	99	175
f	114	176
f	115	176
f	118	176
f	119	176
f	120	176
f	121	176
f	117	176
f	116	176
f	111	177
f	62	177
f	157	177
f	123	177
f	82	20
f	85	20
f	86	20
f	100	20
f	95	20
f	141	178
f	37	178
f	37	21
f	44	22
f	99	22
f	65	23
f	86	23
f	11	25
f	86	25
f	142	25
f	130	179
f	96	179
f	150	179
f	159	27
f	96	27
f	134	27
f	99	27
f	116	27
f	162	28
f	102	28
f	180	28
f	4	180
f	37	180
f	96	29
f	100	29
f	76	30
f	35	30
f	28	30
f	188	181
f	136	181
f	194	181
f	79	182
f	63	182
f	135	182
f	80	182
f	189	182
f	97	182
f	31	182
f	106	182
f	88	33
f	33	33
f	96	33
f	132	33
f	33	36
f	82	36
f	81	36
f	130	183
f	20	184
f	21	184
f	156	184
f	158	184
f	62	58
f	157	58
f	132	58
f	168	185
f	6	185
f	130	185
f	39	185
f	40	185
f	44	185
f	150	185
f	11	2
f	86	2
f	95	2
f	111	3
f	162	3
f	188	3
f	86	3
f	102	3
f	180	3
f	116	3
f	141	4
f	44	4
f	150	5
f	2	5
f	142	5
f	165	5
f	57	6
f	68	6
f	130	6
f	60	6
f	43	6
f	158	6
f	159	6
f	35	7
f	62	7
f	157	7
f	125	177
f	134	9
f	3	9
f	129	186
f	35	186
f	113	186
f	137	186
f	129	10
f	35	10
f	67	10
f	77	187
f	78	187
f	60	187
f	65	187
f	83	187
f	160	187
f	20	188
f	156	188
f	59	189
f	60	189
f	130	189
f	65	189
f	83	189
f	47	189
f	160	189
f	100	190
f	101	190
f	142	190
f	60	191
f	130	191
f	47	191
f	160	191
f	20	192
f	21	192
f	115	15
t	118	15
f	120	15
f	188	15
f	121	15
f	194	15
f	67	193
f	138	193
f	137	193
f	44	18
f	99	18
f	142	18
f	35	194
f	78	194
f	130	194
f	82	194
f	137	194
f	121	194
f	84	194
f	99	194
f	87	195
f	44	195
f	82	195
f	81	195
f	96	195
f	99	195
f	35	196
f	78	196
f	82	196
f	157	196
f	85	196
f	20	37
f	21	37
f	15	38
f	62	38
f	157	38
f	123	38
f	112	38
f	112	37
f	91	39
f	33	39
f	96	39
f	87	42
f	44	42
f	69	44
f	69	45
f	62	45
f	134	45
f	159	45
f	127	45
f	131	45
f	117	45
t	113	46
f	118	46
f	119	46
f	121	46
f	116	46
f	117	46
f	152	46
f	87	48
f	63	48
f	80	48
f	183	48
f	147	197
f	142	198
f	3	198
f	53	198
f	60	53
f	44	53
f	40	53
f	46	53
f	160	53
f	57	63
f	69	63
f	61	63
f	184	63
f	64	63
f	58	63
f	60	63
f	130	63
f	170	63
f	158	63
f	62	63
f	157	63
f	71	63
f	164	63
f	159	63
f	68	63
f	65	63
f	160	63
f	124	199
f	126	199
f	62	199
f	159	199
f	134	199
f	69	64
f	129	64
f	155	66
f	153	66
f	79	68
f	135	68
f	189	68
f	63	68
f	157	68
f	158	68
f	77	69
f	35	69
f	62	69
f	82	69
f	65	69
f	149	69
f	83	69
t	52	70
f	33	70
f	87	200
f	147	200
f	148	200
f	83	200
f	150	200
f	152	200
f	35	201
f	60	201
f	82	201
f	114	201
f	120	201
f	121	201
f	103	202
f	104	202
f	105	202
f	110	202
f	86	202
f	100	202
f	142	202
f	108	202
f	86	71
f	103	71
f	142	71
f	130	72
f	40	72
f	111	203
f	103	203
f	162	203
f	120	203
f	121	203
f	180	203
f	109	203
f	169	204
f	144	204
f	31	204
f	153	204
f	44	75
f	142	75
f	3	75
f	141	76
f	130	76
f	38	76
f	44	76
f	141	205
f	38	205
f	44	205
f	130	79
f	88	79
f	194	80
f	121	80
f	114	80
f	87	80
f	6	206
f	96	206
f	131	206
f	96	207
f	99	207
f	93	207
f	94	207
f	63	82
f	62	82
f	157	82
f	158	82
f	9	82
f	60	208
f	69	84
f	130	84
f	120	84
f	188	84
f	121	84
f	20	85
f	21	85
f	61	85
f	156	85
f	138	85
f	67	85
f	37	85
f	130	85
f	44	85
f	20	86
f	102	86
f	180	86
f	85	88
f	103	87
f	162	87
f	65	87
f	83	87
f	87	89
f	130	89
f	43	89
f	158	89
f	96	89
f	99	89
f	130	209
f	85	209
f	141	90
f	183	90
f	142	90
f	5	90
f	37	210
f	87	211
f	77	211
f	35	211
f	185	211
f	82	211
f	96	211
f	99	211
f	11	212
f	61	212
f	5	212
f	63	213
f	80	213
f	153	213
f	63	214
f	80	214
f	68	92
f	63	92
f	159	92
f	160	92
f	31	92
f	20	93
f	21	93
f	74	93
f	59	94
f	130	94
f	35	215
f	78	215
f	6	215
f	62	215
f	157	215
f	35	95
f	143	96
f	140	96
f	62	96
f	157	96
f	144	96
f	145	96
f	149	96
f	169	97
f	62	97
f	145	97
f	153	97
f	64	99
f	211	99
f	63	99
f	62	99
f	157	99
f	145	99
f	149	99
f	87	101
f	110	101
f	142	101
f	3	101
f	83	103
f	142	103
f	5	103
f	87	104
f	43	104
f	158	104
f	87	106
f	183	106
f	166	105
f	167	105
f	62	106
f	63	106
f	157	106
f	115	106
f	77	219
f	35	219
f	25	219
f	62	219
f	82	219
f	157	219
f	83	219
f	183	220
f	82	220
f	160	220
f	99	220
f	154	220
f	87	221
f	44	221
f	96	221
f	130	221
f	43	221
f	158	221
f	44	108
f	158	108
f	78	222
f	82	222
f	157	222
f	159	223
f	24	109
f	82	109
f	114	109
f	121	109
f	99	109
f	87	224
f	33	224
f	130	224
f	82	224
f	114	224
f	99	224
f	88	110
f	103	225
f	79	225
f	157	225
f	158	225
f	97	225
f	33	111
f	129	112
f	61	112
f	65	112
f	63	113
f	80	113
f	157	113
f	155	113
f	151	113
f	130	114
f	83	114
f	155	114
f	113	114
f	120	114
f	65	114
f	129	115
f	61	115
f	65	115
f	69	116
f	130	116
f	188	116
f	121	116
f	66	116
f	65	117
f	83	117
f	48	118
f	60	119
f	61	226
f	93	226
f	63	226
f	183	226
f	96	226
f	88	121
f	96	121
f	77	227
f	15	227
f	129	227
f	35	227
f	82	227
f	157	227
f	137	227
f	160	227
f	123	227
f	85	227
f	58	228
f	59	228
f	113	228
f	120	228
f	188	228
f	121	228
f	91	229
f	135	229
f	96	229
f	131	229
f	132	229
f	133	229
f	60	122
f	37	122
f	44	122
f	68	124
f	58	230
f	67	230
f	63	231
f	80	231
f	187	232
f	111	233
f	62	233
f	157	233
f	123	233
f	114	125
f	121	125
f	188	125
f	194	125
f	40	125
f	42	125
f	47	125
f	115	125
f	123	125
f	102	125
f	180	125
f	66	234
f	65	234
f	64	234
f	56	234
f	87	235
f	130	235
f	155	235
f	15	126
f	22	126
f	131	236
f	132	236
f	107	127
f	11	127
f	98	127
f	65	128
f	83	128
f	85	128
f	186	238
f	34	238
f	17	238
t	46	122
f	96	127
t	87	2
t	91	2
t	96	2
t	108	2
f	99	2
t	100	1
t	101	1
f	103	1
f	87	1
f	91	1
f	96	1
f	103	3
f	104	3
f	141	3
f	113	3
f	117	3
f	118	3
f	119	3
f	120	3
f	121	3
f	101	5
t	87	5
f	91	5
f	7	5
f	44	5
t	96	5
f	10	5
t	11	5
t	12	5
f	78	6
f	6	6
f	4	6
t	44	6
f	128	6
f	74	6
t	137	6
f	75	6
t	66	6
f	30	6
t	67	6
f	49	4
t	37	4
t	40	4
f	42	4
t	47	4
f	140	7
f	143	7
t	78	7
f	59	7
f	145	7
t	137	7
f	66	7
t	84	7
t	67	7
f	155	7
f	141	8
t	78	8
f	91	8
t	96	8
f	90	9
f	105	9
f	181	9
t	106	9
f	107	9
t	97	9
t	132	9
t	98	9
t	133	9
t	78	10
f	59	10
f	63	10
f	74	10
t	137	10
f	66	10
f	153	11
f	100	12
f	101	12
f	59	13
f	63	13
t	74	13
t	137	13
f	66	13
t	67	13
f	112	15
t	114	15
f	116	15
f	117	15
t	119	15
t	124	16
t	125	16
t	126	16
f	128	16
f	69	16
t	134	16
f	87	17
t	15	17
t	16	17
f	100	18
f	87	18
f	8	18
f	96	18
f	12	18
f	99	18
t	78	19
f	113	19
f	69	19
f	117	19
f	120	19
f	121	19
f	109	19
t	84	19
f	49	21
t	37	21
f	44	21
t	46	21
f	47	21
t	48	21
t	100	20
f	101	20
f	87	20
t	15	20
f	96	20
t	166	22
f	141	22
t	168	22
t	169	22
f	96	22
f	119	22
f	100	23
f	101	23
t	103	23
t	87	24
t	77	24
t	83	24
f	15	24
f	78	24
f	113	24
t	44	24
t	96	24
f	11	24
f	12	24
f	99	24
f	78	26
f	74	26
t	137	26
t	138	26
t	139	26
t	67	26
t	87	25
t	91	25
t	96	25
t	108	25
f	12	25
f	99	25
f	125	27
t	126	27
f	141	27
f	82	27
f	81	27
t	96	27
f	131	27
t	109	28
f	87	29
t	104	29
f	96	29
f	87	30
f	77	30
t	23	30
t	24	30
t	25	30
t	26	30
f	82	30
t	27	30
t	29	30
f	78	30
t	96	30
f	69	30
t	141	31
f	8	31
t	30	31
f	124	32
t	15	32
t	16	32
f	100	34
f	53	34
f	151	34
f	12	34
f	36	35
t	17	35
t	186	35
f	49	36
f	90	36
f	51	36
f	52	36
f	53	36
f	54	36
f	55	36
f	126	33
f	133	33
f	15	37
f	32	37
f	116	37
f	126	39
f	32	39
f	92	39
t	49	40
f	113	40
t	37	40
f	32	40
f	40	40
f	42	40
f	44	40
t	46	40
f	119	40
f	47	40
t	42	41
t	47	41
t	106	42
t	96	42
t	97	42
f	133	42
t	39	43
t	41	43
f	113	44
t	120	44
t	67	44
f	124	45
f	125	45
t	126	45
f	128	45
f	74	45
t	120	46
t	100	47
f	101	47
f	103	47
t	168	48
f	74	48
f	87	49
t	9	49
f	12	49
t	14	49
t	44	50
f	118	50
f	119	50
f	120	50
t	137	50
f	69	50
t	66	50
f	141	51
t	78	51
t	59	51
t	137	51
t	67	51
f	87	52
f	96	52
t	11	52
f	98	52
t	12	52
f	141	53
t	46	53
t	47	53
f	166	54
f	168	54
f	87	55
f	78	55
f	44	55
f	74	55
f	96	55
f	137	55
f	75	55
f	66	55
f	67	55
f	141	56
t	113	56
f	120	56
f	150	56
f	152	56
f	141	57
f	113	57
t	37	57
t	40	57
f	42	57
t	44	57
f	90	59
t	89	59
f	181	59
f	96	59
t	90	60
t	89	60
t	181	60
f	90	58
f	89	58
f	181	58
f	87	61
f	53	61
f	96	61
f	11	61
t	12	61
f	99	61
f	59	76
f	135	76
t	44	76
t	37	77
f	6	77
t	39	77
t	40	77
t	41	77
t	42	77
t	44	77
t	46	77
t	47	77
t	48	77
t	193	77
f	56	77
f	87	78
f	91	78
f	93	78
f	94	78
f	96	78
f	99	78
f	87	79
f	88	79
f	6	79
f	91	79
t	96	79
f	144	79
f	145	79
f	99	79
f	150	79
f	152	79
f	153	79
f	155	79
f	88	100
f	168	100
f	89	100
f	106	100
f	40	100
f	42	100
f	94	100
t	114	100
t	118	100
t	119	100
t	120	100
t	136	100
f	107	100
f	97	100
t	122	100
t	47	100
f	133	100
f	100	101
f	105	101
f	96	101
f	143	102
t	138	102
t	139	102
f	87	103
t	74	103
t	96	103
t	107	103
t	11	103
t	98	103
t	12	103
f	119	103
t	15	103
t	113	103
t	87	127
f	91	127
t	96	127
t	107	127
f	11	127
t	36	128
f	103	128
f	152	128
f	78	129
t	186	129
f	152	129
f	87	130
f	168	130
f	91	130
f	96	130
t	144	130
f	145	130
f	87	131
f	74	131
f	96	131
f	11	131
t	12	131
f	150	132
f	152	132
t	15	133
f	112	133
f	32	133
f	116	133
f	117	133
t	166	80
f	87	80
f	168	80
t	114	80
f	117	80
f	135	81
f	137	81
f	67	81
t	14	82
f	126	83
f	88	83
f	89	83
f	181	83
f	91	83
t	106	83
f	44	83
f	96	83
t	97	83
t	133	83
f	99	83
f	141	84
f	63	84
t	136	84
t	135	84
f	44	84
t	137	84
f	66	84
f	30	84
f	67	84
f	15	85
t	16	85
f	113	85
f	113	86
f	118	86
f	119	86
f	120	86
t	109	86
t	103	87
f	78	87
f	18	87
f	152	87
t	18	88
t	19	88
f	59	89
t	44	89
f	87	90
f	91	90
f	96	90
f	11	90
t	99	90
f	141	91
f	78	91
t	153	91
t	30	92
t	16	93
f	74	93
f	66	93
t	67	93
t	30	94
f	87	95
t	91	95
t	96	95
t	99	95
f	140	96
f	144	96
t	145	96
f	141	97
f	74	97
t	144	97
f	119	97
t	155	97
f	100	98
t	87	98
f	126	98
f	141	98
f	88	98
f	168	98
f	89	98
t	91	98
f	32	98
f	92	98
t	96	98
f	46	98
f	97	98
f	133	98
t	99	98
f	140	99
f	152	99
t	155	99
f	151	103
f	141	104
f	59	104
t	44	104
t	168	105
t	166	106
f	141	106
t	168	106
f	126	107
f	141	107
t	88	107
t	91	107
t	93	107
t	96	107
f	141	108
f	59	108
t	44	108
t	87	109
f	141	109
f	91	109
t	96	109
t	87	110
f	6	110
t	91	110
t	96	110
f	99	110
t	87	111
f	91	111
t	96	111
t	99	111
f	78	112
f	135	112
t	137	112
t	67	112
f	141	113
f	78	113
t	153	113
t	78	115
t	137	115
f	139	115
f	67	115
f	141	114
f	150	114
f	152	114
f	141	116
f	59	116
t	135	116
f	44	116
t	186	117
t	48	118
f	48	119
f	49	122
f	59	122
f	119	122
f	47	122
t	48	122
f	166	123
f	168	123
f	74	124
f	136	124
t	137	124
f	138	124
f	139	124
f	78	124
f	135	124
t	67	124
f	141	125
f	113	125
f	181	125
f	135	125
t	114	125
f	116	125
f	117	125
t	118	125
t	119	125
t	120	125
t	136	125
t	122	125
f	47	125
f	109	125
f	54	125
f	55	125
t	118	126
f	119	126
t	15	126
t	18	126
t	113	126
f	124	134
f	125	134
f	126	134
f	141	134
t	133	134
t	134	134
f	166	135
f	141	135
f	112	135
f	168	135
f	113	135
t	114	135
f	116	135
f	117	135
t	118	135
t	119	135
f	120	135
f	109	135
t	87	136
t	91	136
t	8	136
t	96	136
f	11	136
f	99	136
f	118	137
f	136	137
t	137	137
t	122	137
f	67	137
f	87	138
f	91	138
t	96	138
t	11	138
t	12	138
t	143	139
f	59	139
f	63	139
f	135	139
f	74	139
f	136	139
t	137	139
f	66	139
f	54	139
t	140	140
t	145	140
t	155	140
t	100	141
f	87	141
f	78	141
f	91	141
f	74	141
f	96	141
f	119	141
f	136	141
f	11	141
f	67	141
t	99	141
f	91	142
f	96	142
t	133	142
f	100	143
f	87	143
f	91	143
f	8	143
f	74	143
f	96	143
f	107	143
t	11	143
t	98	143
t	12	143
f	99	143
t	143	144
t	137	144
t	138	144
t	139	144
f	67	144
f	124	145
f	87	145
f	15	145
f	125	145
f	126	145
f	128	145
f	74	145
f	96	145
f	137	145
f	66	145
f	67	145
t	113	146
f	117	146
t	119	146
t	120	146
f	112	147
f	113	147
f	114	147
f	116	147
t	117	147
f	118	147
f	119	147
f	120	147
t	109	147
t	145	148
t	155	148
f	143	150
f	78	150
f	135	150
t	74	150
t	137	150
t	67	150
f	15	151
t	16	151
f	87	152
f	96	152
f	119	152
f	136	152
f	137	152
f	87	153
f	114	153
f	96	153
f	118	153
f	119	153
t	109	153
t	54	154
t	55	154
f	141	155
f	113	155
f	135	155
f	119	155
t	136	155
t	137	155
t	67	155
f	16	156
t	89	156
f	118	156
f	75	156
f	133	156
f	87	157
f	141	157
t	94	157
f	96	157
f	119	157
t	136	157
t	54	157
f	67	157
t	55	157
f	100	158
f	103	158
f	141	158
f	109	158
f	150	197
f	152	197
f	7	49
f	11	49
f	100	159
t	87	159
f	141	159
f	91	159
t	96	159
f	99	159
t	166	160
f	141	160
f	168	160
f	74	160
f	119	160
t	99	160
t	166	161
f	141	161
t	168	161
f	87	162
f	96	162
t	98	162
t	12	162
f	150	163
t	152	163
f	153	163
t	155	163
t	15	164
t	113	164
f	119	164
f	18	164
f	109	164
f	15	165
f	16	165
f	89	165
f	135	165
f	119	165
f	137	165
t	87	166
f	126	166
f	88	166
f	89	166
t	91	166
t	96	166
t	99	166
f	141	168
f	125	168
f	125	168
f	126	168
f	96	168
f	99	168
t	166	62
f	168	62
f	150	62
f	59	63
f	63	63
t	137	63
f	66	63
f	67	63
t	150	63
t	120	64
t	137	64
t	67	64
t	87	65
f	78	65
f	91	65
f	44	65
t	96	65
f	84	65
t	151	66
f	124	67
f	125	67
t	126	67
f	141	67
f	134	67
t	106	68
t	97	68
f	140	69
f	141	69
t	78	69
f	145	69
t	137	69
t	84	69
f	67	69
f	155	69
t	51	70
t	32	70
t	92	70
f	96	70
t	100	71
t	87	71
f	74	71
t	96	71
f	18	71
f	19	71
t	12	71
f	49	72
f	141	72
f	59	72
t	37	72
f	42	72
f	44	72
f	47	72
t	126	73
f	141	73
f	88	73
f	91	73
t	32	73
t	92	73
f	96	73
t	15	74
f	104	74
t	32	74
t	100	75
t	87	75
t	141	75
t	8	75
t	96	75
f	11	75
t	12	75
f	99	75
f	68	50
f	74	50
f	57	50
f	129	50
f	107	202
f	98	212
f	63	105
f	80	105
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: app
--

COPY products ("productID", name, description, product_category_id, ingredients, western_theraputic_actions, traditional_chinese_medicine, sample_indications, dosage, contra_indications, notations, usage_type) FROM stdin;
1	Acne Free		28	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nCoix\t\t\tYi Yi Ren\r\n\nSarsaparilla\t\tSmilax Officinalis\r\n\nStillingia\t\t\tStillingia Sylvatica\r\n\nCoptis\t\t\tHuang Lian\r\n\nPhellodendron\tHuang Bai\r\n\nNeem\t\t\tAzadirachta Indica\r\n\nPrunella\t\t\tXiao Ku Cao\r\n\nBurdock root\t\tArctium Lappa\r\n\nSkullcap\t\t\tScutellaria Lateriflora\r\n\nPeony, red\t\tChi Shao Yao\r\n\nMeadowsweet\tSpiraea Ulmaria\r\n\nUva Ursi\t\t\tArctostaphylos Uva Ursi\r\n\nPoke Root\t\tPhytolacca Spp.\r\n\nYellow Dock\t\tRumex Crispus\r\n\nLicorice\t\t\tGan Cao	Western Therapeutic Actions\r\n\nAlterative, depurative, anti-inflammatory, and restorative	Traditional Chinese Medicine\r\n\nClears damp/heat, relieves toxicity, dissipates nodules, and \r\n\ninvigorates the blood	Sample Indications\r\n\nAcne, adolescent acne, hormonal acne, acne rosacea and acne associated with auto-toxemia, dermatitis, eczema, seborrhea, \tboils, urticaria, and hives	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nContraindicated during pregnancy. If the client is spleen qi deficient &leftpar;weak appetite, bloating with tendency towards loose stool&rightpar;, complement this herbal formula with supportive digestive herbs, such as Fennel or Cardamon.	Notations \r\n\nAcne Free is a blood purifying formula. It is designed to clear heat and toxicity from the liver, lungs, and the blood. In Oriental Medicine, it states that the health of the lungs is revealed through the skin. When the lungs lose their proper function of cleansing and descending the qi, toxic heat builds up in the blood and liver. This can cause skin eruptions, pimples, and acne. After the blood is purified, blood tonics are recommended, especially if there are signs of dryness.\r\n\nCoix is widely used in Japan for skin suppuration and known for its ability to nourish the skin. Burdock root is a blood purifier and liver detoxicant. Sarsaparilla and Peony help to stimulate the circulation of blood and resolve blood stagnation. Coptis, Phellodendron, and Uva Ursi drain damp/heat from the body and direct the qi downward. Neem, an Ayurvedic herb, is a blood purifier, clears heat, relieves toxicity, and is the herb of choice when dealing with skin problems.  Stillingia, also known as Queens Delight, with Prunella, Poke Root, and Yellow Dock clear heat, relieve toxicity, reduce lymph congestion, soften hard carbuncles, and relieve skin inflammations. Skullcap is a nervine with analgesic and astringent properties. Meadowsweet supports Skullcap and balances the pH of the body. Licorice harmonizes the formula and opens all of the energy channels.\r\n\nTo help clear acne, appropriate dietary, exercise, and cleansing routines are adopted. Include plenty of fresh organic fruit and vegetables in the diet and eliminate fatty, fried foods. Drink clean water instead of soda or fructose sweetened drinks. Eliminate white sugar and put the junk food in the trash.	external
2	Acne Lotion		36	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nBenzoin\t\t\t  Styrax Benzoin\r\n\nNeem\t\t          Azadirachta Indica\r\n\nMyrrh\t\t          Commiphora Myrrha\r\n\nLithospermum\t  Zi Cao\r\n\nCamphor\t\t  Cinnamonum Camphora\r\n\nCalendula\t\t  Calendula Officinalis\r\n\nCayenne\t\t\t  Capsicum Annuum\r\n\nLemon\t\t\t  Citrus Limonum\r\n\nPeppermint Oil\t  Mentha Piperita\r\n\nTea Tree Oil\t\t  Melaleuca Alternifolia Witch Hazel\t\t\t\r\n\nWitch Hazel             Hamamelis Virginiana	Western Therapeutic Actions\r\n\nStimulant, antiseptic, anti-bacterial, anti-viral, anti-fungal, \r\n\nastringent, tonic, refrigerant, and antiscorbutic	Traditional Chinese Medicine\r\n\nClears surface heat, invigorates the blood, and dispels blood stasis	Sample Indications\r\n\nOily, adolescent, hormonal, and cystic skin conditions	External Application\r\n\nApply topically onto the affected area, after it has been thoroughly cleansed, 3 times daily	Contraindications and Cautions\r\n\nThere are none known.	Notations \r\n\nAcne Lotion is a natural cleanser and antiseptic that can support the healing process of many types of skin disorders. Acne can be a persistent and troublesome complaint, and is seldom treated effectively with external formulas alone. The root cause of all skin disorders is internal.\r\n\nCleansing herbs are important for acne. Benzoin is an antiseptic and promotes healing of the tissues. Neem is a premier blood purifier and detoxicant. It excels when addressing skin conditions. Myrrh resin, when used externally, has anti-bacterial and anti-fungal actions. When Myrrh resin is used internally, it acts as an anodyne and disperses blood stagnation. Lithospermum clears heat and toxicity, and is especially effective for carbuncles. Camphor resin is an anti-inflammatory, especially effective for the upper body and head region.\r\n\nIt is wise to take a holistic approach, take an overview of the persons lifestyle, and make some appropriate adjustments. Some areas to be considered include: the diet, exercise, stress, and hormones. Each one of these factors may be contributing to the problem. \r\n\nEliminate soda, white sugar, chips, high fructose sugar, and other junk foods from the diet. A diet rich in fresh organic fruits and vegetables is beneficial for cleansing the blood. Filtered drinking water helps to flush toxins from the body. Drink enough water to keep your urine a mellow yellow. Put a de-chlorinator on your shower head. Use oatmeal bar soaps for washing the skin. Use unscented laundry soaps and avoid using bleach. Avoid harsh chemicals for cleaning the house or in your immediate environment. Some people are highly allergic to synthetic clothing. Consider switching to 100% cotton clothing instead of synthetics.	external
3	Calendula Cream	Rough, Dry Skin	15	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nCalendula\tCalendula Officinalis\r\n\nBeeswax\r\n\nOlive oil	Western Therapeutic Actions\r\n\nVulnerary, emollient, anti-inflammatory, antipruritic, and \r\n\nanti-fungal	Traditional Chinese Medicine\r\n\nClears surface heat and cools the blood	Sample Indications\r\n\nIrritated skin, chapped skin, diaper rash, dermatitis, fungus, \r\n\nand other inflammatory conditions of the skin	External Application\r\n\nApply topically onto the affected area, after it has been thoroughly cleansed, 3 times daily	Contraindications and Cautions\r\n\nThere are none known.	Notations \r\n\nThe rich amount of flavonoids and saponins found in the Calendula flowers makes it a good anti-inflammatory and anti-fungal agent. Because it promotes rapid healing of the skin tissues, the affected areas should be kept clean and free of infection. Calendula is often effective in evening out the skin tones, and has been known to help fade dark blemishes.	external
4	Eat Less	Appetite Reduction	29	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nBladderwrack\t\tFucus Vesiculosus\r\n\nChickweed\t\t\tStellaria Media\r\n\nGarcinia\t\t\t\tGarcinia Cambogia\r\n\nPseudostellaria\t\tTai Zi Shen\r\n\nWild Yam\t\t\tDioscorea Villosa\r\n\nDendrobium\t\t\tShi Hu \r\n\nAnemarrhena\t\tZhi Mu\r\n\nOphiopogon\t\t\tMai Men Dong\r\n\nScrophularia\t\t\tXuan Shen\r\n\nLicorice\t\t\t\tGan Cao\r\n\nGolden Rod\t\t\tSolidago Virgaurea	Western Therapeutic Actions\r\n\nAlterative, anti-fat, demulcent, antispasmodic, and stimulant	Traditional Chinese Medicine\r\n\nDrains stomach fire, nourishes the yin, generates fluids, and supports the spleen	Sample Indications\r\n\nExcessive appetite, hungers easily, bulimia nervosa, and overeating due to emotional stress	Suggested Dosage\r\n\n5 - 20 drops, in a small amount of water, \r\n\n3 times daily\r\n\nTake this dosage 1 hour before meals \r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nUse with caution in hyperthyroid conditions. Contraindicated for spleen qi deficiency and internal cold patterns. Contraindicated during pregnancy and while nursing.	Notations \r\n\nExcessive appetite can be affected by a number of things. Diabetes could be the cause. Many patients turn to food when emotionally upset. Food becomes the temporary healing salve, as in obesity; or the imagined problem, as in anorexia; until the emotion passes. Once this habit becomes chronic, a serious eating disorder can develop. \r\n\nEat Less, combines Western herb specifics with a Chinese formula, Bai Hu Tang or Gypsum Combination, which is designed to correct the imbalances of the stomach. Excessive appetite can be linked to the excess heat in the stomach. The excess heat parches the stomach and it becomes dry. This can be a link to diabetes or low blood sugar. Eat Less drains the fire and brings moisture back to the stomach.\r\n\nAnemarrhena and Scrophularia help to quell the fire by draining the excess heat and generate fluids. Chickweed, Dendrobium, and Ophiopogon nourish the yin &leftpar;fluids&rightpar; of the stomach, normalizing the excess appetite. Garcinia, a fruit from India, is an antacid, anti-ulcerogenic, and helps to stabilize the glucose levels. Pseudostellaria and Licorice generate fluids and support the qi of the spleen. Licorice also helps to harmonize the actions of the other herbs in the formula. Wild Yam is a hepatic and antispasmodic. Bladderwrack nourishes the thyroid gland which controls the body metabolism. It is considered a metabolic stimulant and helps to reduce fat. Goldenrod is a hepatic and supports digestion.\r\n\nComplex carbohydrates &leftpar;whole grains&rightpar;, organic vegetables, fruits, nuts and seeds can be eaten in abundance without gaining weight. Reduce calories by eliminating refined sugars &leftpar;found in almost all processed foods, canned sodas, and juices&rightpar;. Drink plenty of clean water. Keep the urine a soft yellow.	external
5	Derma Cream	Itchy,Dry,Flaky Skin	15	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nNeem\t\t\t\t Azadirachta Indica Lithospermum\t\t\r\n\nLithospermum               Zi Cao\r\n\nTang Kuei\t\t\t Dang Gui\r\n\nPhellodendron\t\t Huang Bai\r\n\nAloe Vera\t\t\t Lu Hui\r\n\nMarshmallow\t\t\t Althea Officinalis\r\n\nSlippery Elm\t\t\t Ulmus Fulva\r\n\nCnidium seed\t\t Che Chuang Zi\r\n\nCalendula\t\t\t Calendula Officinalis\r\n\nNettles\t\t\t\t Urtica Spp.\r\n\nChaparral\t\t\t Larrea Mexicana\r\n\nRhubarb\t\t\t\t Da Huang\r\n\nBeeswax\r\n\nOlive Oil	Western Therapeutic Actions\r\n\nVulnerary, anti-inflammatory, antipruritic, demulcent, emollient, alterative, and depurative	Traditional Chinese Medicine\r\n\nClears heat, nourishes and vitalizes the blood, and moistens dryness\r\n\nü	Sample Indications\r\n\nEczema, psoriasis, dermatitis, diaper rash, heat rash, trichomoniasis, and jock itch	External Application\r\n\nApply topically to the affected area, after it has been thoroughly cleansed, 3 times daily\r\n\nü	Contraindications and Cautions\r\n\nThere are none known.	Notations \r\n\nThe skin expresses the quality and purity of the blood, and the health of the lungs. In Oriental Medicine, the skin is the lungs turned inside out. External applications, alone, seldom clear chronic skin conditions. Use an internal herbal formula, such as Exema Clear or Psor Skin, to address the internal imbalances and enhance the healing potential. \r\n\nNeem is a classic Ayurvedic vulnerary and blood purifier. This herb could be used alone in healing a wide variety of skin ailments. Lithospermum cools the blood and helps to vent rashes, especially when the skin is turning dark red or purple. Tang Kuei is a premier blood tonic and is used for many skin conditions. Nettles supports Tang Kuei, as it is also a blood tonic. Aloe Vera drains fire and assists in the healing of the skin tissues. Marshmallow root, Slippery Elm and Calendula are anti-inflammatory and relieve irritated skin tissue. Cnidium seed helps to relieve the itching, and Chaparral, Phellodendron and Rhubarb drain damp/heat and assist in drying wet skin rashes.	external
6	Down Size	Weight Loss	28	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nBladderwrack\tFucus Vesiculosus\r\n\nGarcinia\t\t        Garcinia Cambogia\r\n\nEclipta\t\t\tHan Lian Cao\r\n\nMyrrh\t\t\tCommiphora Molmol\r\n\nBurdock root\t\tArctium Lappa\r\n\nCyperus\t\t\tXiang Fu\r\n\nMagnolia bark\tHou Po\r\n\nHoelen\t\t\tFu Ling\r\n\nTurmeric\t\tCurcuma Longa\r\n\nCorn Silk\t\tYu Mi Xu\r\n\nBoldo\t\t\tPeumus Boldus\r\n\nCrataegus\t\tShan Zha\r\n\nPoke Root\t\tPhytolacca Spp.\r\n\nChih-Ko\t\t\tZhi Ke\r\n\nCayenne\t\t\tCapsicum Annuum	Western Therapeutic Actions\r\n\nAlterative, diuretic, hepatic, digestive stimulant, carminative, deobstruent, and anti-fat	Traditional Chinese Medicine\r\n\nSupplements and promotes the movement of qi, nourishes the liver, drains and resolves dampness, and reduces food stagnation	Sample Indications\r\n\nOverweight and obesity with slow metabolism	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nContraindicated during pregnancy and hyperthyroid conditions.	Notations \r\n\nEvery year there is a new diet regime that is going to solve the obesity problem in America. Dieting has becoming the modern day neurosis. Slim is in , fat free, marketing madness, anorexic models, fat...fat...fat, saturated fats, trans fats, meat fat, carbs are out, protein is in, fake foods, fake fat, fake butter loaded with chemicals, mommys fat, daddys fat, babies fat, fat is the obsession, obesity is the problem. \r\n\nLets look at the causes: Lack of exercise, sedentary lifestyles &leftpar;no more chopping wood or carrying water&rightpar;, eating empty foods &leftpar;highly processed, high in calories, high in chemicals and additives, with no nutritional value&rightpar;. These empty calories do not feed the body, and the body will demand, Feed me more, I am starving, feed me more! The stomach is full, yet the body is starving for nutrition, still hungry! \r\n\nHow is it that our children came to hate the taste of vegetables? \r\n\nTry a diet of fast food from McDonalds and see what happens to your own taste buds and body. Watch your cholesterol soar and exhaustion set in. Dietary adjustments may be in order. There is no quick fix to obesity, but requires a disciplined readjustment towards food and eating habits. Cook wholesome, organic, fresh meals and rekindle those taste buds! Throw out those bags of chips and chew on a carrot. Park the car and start walking. Turn the TV off, light a candle, and eat as a family, sharing the days journey. Begin thinking in terms of wellness, gratitude, and a rich life instead of a rich diet full of refined sugars, preservatives, and saturated fats. \r\n\nDown Size helps to resolve the excess fat, remove the excess water, purify the blood, and eliminate the excess bulk from the overloaded digestive system. The rest is up to you; make healthy choices, eat for wellness, and treat the body as a sacred temple that houses the soul!	external
7	Exema Clear	Excema	28	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nSmilax\t\t\tTu Fu Ling\r\n\nNeem\t\t\tAzadirachta Indica\r\n\nBurdock root\t\tArctium Lappa\r\n\nCoptis\t\t\tHuang Lian\r\n\nSophora\t\t\tKu Shen\r\n\nOats\t\t\tAvena Sativa\r\n\nTang Kuei\t\tDang Gui\r\n\nPhellodendron\tHuang Bai\r\n\nMistletoe\t\tViscum Album\r\n\nMeadowsweet\tFilipendula Ulmaria\r\n\nCicada\t\t\tChan Tui\r\n\nSarsaparilla\t\tSmilax Officinalis\r\n\nOregon Grape\tBerberis Aquafolium\r\n\nUva Ursi\t\t\tArctostaphylos Uva Ursi\r\n\nWahoo\t\t\tEuonymus Atropurpureus\r\n\nLicorice\t\t\tGan Cao	Western Therapeutic Actions\r\n\nNutritive, detoxicant, anti-inflammatory, nerve tonic, alterative, antacid, hepatic, and diuretic	Traditional Chinese Medicine\r\n\nDisperses wind, eliminates dampness, clears heat, cools and nourishes the blood	Sample Indications\r\n\nEczema, contact dermatitis, skin rashes, and weepy, red, itchy skin aggravated by hot weather	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nConsumption of coffee, alcohol, spicy foods, seafood, and smoking should be avoided. Nourish the blood and supplement the qi if the patient is depleted.	Notations \r\n\nExema Clear combines the energetic patterns and herbs used in the Western classics with a Chinese formula, Xiao Feng San, or Eliminate Wind Powder, for healing this aggravating and generational disorder &leftpar;passed down through the family tree&rightpar;. \r\n\nStress is a key factor in skin flare-ups. If the emotions run the patients life, healing the skin can be difficult. Creating a healthier relationship with the self is essential as there might be a hidden battle being fought. The question is, Who is going to surrender, you or the disorder? \r\n\nWind, as it travels through the blood, spreads the pre-existing toxins, and can be one of the issues surrounding chronic skin ailments. The skin eruptions and itchiness are the result of the toxic wind trying to escape from the body. In Oriental Medicine, stagnant qi creates heat and injures or depletes the blood. With the blood weakening, the skin condition and temperament become even more aggravated. \r\n\nWith this scenario, Oriental Medicine states, To treat the wind, first treat the blood; when the blood moves, the wind is naturally extinguished. \r\n\nWhenever serious skin conditions exist, treat them with internal herbal formulas and with an external herbal cream. Dietary habits are extremely beneficial. Organic, big leafy green vegetables eaten daily with plenty of pure water cleanses the liver and blood. Allergies often accompany these types of skin conditions. Identify allergens through a process of elimination.	external
8	Fungal Lotion	Skin And Nail Fungus	1	Ingredients &leftpar;Herbal Extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nMyrrh\t\t\tCommiphora Myrrha\r\n\nBlack Walnut\t\tJuglans Nigra\r\n\nThuja\t\t\tThuja Occidentalis\r\n\nCnidium seed\t\tChe Chuang Zi\r\n\nHarakeke\t\t        Phormium Tenax\r\n\nBenzoin\t\t\tStyrax Benzoin\r\n\nGypsum\t\t        Shi Gao\r\n\nTalc\t\t\t        Hua Shi\r\n\nWild Indigo\t\tQing Dai\r\n\nPhellodendron\t\tHuang Bai	Western Therapeutic Actions\r\n\nAnti-fungal, antiseptic, anti-viral, anti-bacterial, alterative, depurative, and balsamic	Traditional Chinese Medicine\r\n\nDries dampness, clears heat, and alleviates itching	Sample Indications\r\n\nFungal infections &leftpar;toenail and fingernail&rightpar;, skin fungus, jock rot, ringworm, and athlete's foot	External Application\r\n\nApply to the affected area after it has been thoroughly cleansed, 3 times daily	Contraindications and Cautions\r\n\nThere are none known.	Notations \r\n\nFungal problems may be systemic and dietary changes may be appropriate. Sugars, including fruit sugars, must be eliminated from the diet until all signs of fungus are gone. Jocks and Jockeys will love us for this one! No more itch!!! \r\n\nMyrrh and Thuja contain anti-fungal properties. Walnut is an astringent and resolves damp/heat conditions of the skin. Cnidium seed relieves itching. Harakeke, a herb from New Zealand, is used much the same way Aloe Vera is. It is especially healing for all skin conditions. Benzoin is an antiseptic and helps to clear irritable conditions of the skin. Gypsum, Talc, and Wild Indigo help to clear the heat from the skin tissues. Phellodendron drains damp/heat and has drying properties.	external
9	Hair Lotion	Hair And Scalp	27	Ingredients &leftpar;Herbal Extracts&rightpar;\r\n\nListed by common and pin yin or latin names, in sequence from largest to smallest amount by quantity.\r\n\nBurdock root\t\tArctium Lappa\r\n\nNettles\t\t\tUrtica Spp. \r\n\nChamomile, German\tMatricaria Recutita\r\n\nRosemary\t\t        Rosmarinus Officinalis\r\n\nSouthernwood\t\tArtemisia Abrotanum\r\n\nDrynaria\t\t        Gu Sui Bu\r\n\nPsoralea\t\t        Bu Gu Zhi\r\n\nBorax\t\t\tBoron\r\n\nLemon\t\t\tCitrus Limonum\r\n\nCamphor\t\t        Cinnamonum Camphora	Western Therapeutic Actions\r\n\nAlterative, depurative, nutritive, astringent, tonic, and antiscorbutic	Traditional Chinese Medicine\r\n\nStimulates the growth of hair, nourishes the kidneys, and clears toxins	Sample Indications\r\n\nAlopecia &leftpar;hair loss and thinning&rightpar;, dandruff, and scaly scalp	External Application\r\n\nGently, massage a small amount into the scalp 2 times daily. A good time to apply the Hair Lotion is after washing the hair. Do not rinse out this lotion until the hair is washed again the next time.	Contraindications and Cautions\r\n\nThere are none known.	Notations\r\n\nHair thinning is considered a depletion of the energy within the liver and kidney. When using this topical lotion, combine it with either Top Crop, Kidney/Long Life, or Liver/New Life. For scalp problems, the blood needs to be cleaned. Use one of the herbal remedies from the Cleansing section.	external
10	Psor Skin	Psoriasis	28	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nRehmannia, raw\t    Sheng Di Huang\r\n\nCoix\t\t\t    Yi Yi Ren\r\n\nNeem\t\t            Azadirachta Indica\r\n\nMistletoe\t\t    Viscum Album\r\n\nImperata\t\t    Bai Mao Gen\r\n\nBurdock root\t\t    Arctium Lappa\r\n\nTang Kuei\t            Dang Gui\r\n\nCoptis\t\t\t    Huang Lian\r\n\nSchizonepeta\t\t    Jing Jie\r\n\nLonicera\t\t\t    Jin Yin Hua\r\n\nPeony, red\t\t   Chi Shao Yao \r\n\nOregon Grape\t   Berberis Aquafolium\r\n\nCouchgrass\t\t   Agropyron Repens\r\n\nSarsaparilla\t\t   Smilax Officinalis\r\n\nBarberry\t\t\t   Berberis Vulgaris\r\n\nCardamon\t\t   Sha Ren	Western Therapeutic Actions\r\n\nDermatic, nervine, alterative, depurative, hepatic, and diuretic	Traditional Chinese Medicine\r\n\nClears heat, expels wind, drains dampness, and invigorates the blood	Sample Indications\r\n\nPsoriasis &leftpar;weepy and dry&rightpar;, eczema, contact dermatitis, urticaria, skin rashes, and flaky, inflamed, itchy skin	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms\r\n\nExternal Application\r\n\nDilute 1/2 teaspoon of Psor Skin with 4 teaspoons of water. Apply topically on affected areas with sterile cotton gauze, 2 times daily	Contraindications and Cautions\r\n\nConsumption of coffee, alcohol, spicy foods, seafood, and smoking should be avoided while healing this disorder. Supplement the blood and qi if the patient is depleted.	Notations\r\n\nPsor Skin is a modified version of Xiao Feng San or Tang Kuei and Arctium Formula and Shi Wei Bai Du Tang or Bupleurum and Schizonepeta Combination combined with tim proven Western herbs for this disorder.\r\n\nRehmannia clears heat and cools the blood. It also nourishes the yin and generates fluids. Rehmannia would be considered a demulcent in Western terms because of its ability to generate fluids. Couchgrass supports Rehmannia and is a diuretic. Coix, used commonly in Japan for skin conditions, clears heat and expels pus from the inflamed skin. Neem is a vulnerary and blood purifier. Burdock root supports Neem. Mistletoe is a detoxicant, relieves skin inflammations, and a nervine relaxant. Imperata cools the blood and clears heat from the lungs. The lungs and the condition of the skin are related. Chronic cigarette smokers have very dry, wrinkly facial skin due to the excess heat and dryness of the lungs. Tang Kuei is a premier blood tonic. Coptis drains fire and relieves toxicity. Schizonepeta alleviates itching. Lonicera disperses wind/heat. Peony vitalizes the blood. Oregon Grape is used for inflamed, flaky skin disorders. Sarsaparilla is an alterative and depurative. Barberry relieves liver congestion. Cardamon is a digestive aromatic.\r\n\nThe quality of the blood can cause this type of skin disorder and takes patience and perseverance to heal. All foods affect the condition and health of the blood. Large, green, leafy vegetables are excellent blood purifiers and blood builders. Blue green algae is an excellent source for improvement of the quality of the blood. For psoriasis, not only does the blood require cleansing, it requires renewal Blood, being the mother of qi, is feminine. To help heal this disorder, consider the emotional issues surrounding the feminine side; past, present, and future. Explore the possibilities of a link that might need healing.ü	external
11	Skin Clear	Skin Cleansing	29	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nNeem\t\t\t\tAzadirachta Indica\r\n\nLonicera\t\t\t\tJin Yin Hua\r\n\nBurdock seed\t\tNiu Bang Zi\r\n\nPhellodendron\t\tHuang Bai\r\n\nCoptis\t\t\t\tHuang Lian\r\n\nViolet\t\t\t\tZi Hua Di Ding\r\n\nPrunella\t\t\t\tXiao Ku Cao\r\n\nYellow Dock\t\t\tRumex Crispus\r\n\nSalvia\t\t\t\tDan Shen\r\n\nStillingia\t\t\t\tStillingia Sylvatica\r\n\nSarsaparilla\t\t\tSmilax Officinalis\r\n\nOregon Grape\t\tBerberis Aquafolium\r\n\nMistletoe\t\t\tViscum Album	Western Therapeutic Actions\r\n\nAlterative, depurative, detoxicant, dermatic, cholagogue, antiseptic, and nervine	Traditional Chinese Medicine\r\n\nClears damp/heat, relieves toxicity, cools the blood, and reduces swelling	Sample Indications\r\n\nAll types of boils, sores, and carbuncles with localized erythema, accompanied with swelling, pain, and heat	Suggested Dosage\r\n\n10 - 20 drops, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nUse with caution in cases of cold from deficiency.	Notations\r\n\nSkin Clear is an excellent formula for clearing toxicity from the body. In Oriental Medicine boils and carbuncles can arise from an internal system that has become excessively toxic; from an external influence which causes a warm febrile disease; or from an accumulation of toxins in the internal organs. Internal toxicity can also be caused by poor dietary habits or unsanitary conditions. Whatever the cause, the accumulation of toxicity creates excess heat, which produces stagnation of the blood and qi. This is a bad combination because heat causes stagnation and stagnation causes heat. As these two factors feed each other in a vicious circle, the accumulated toxicity can surface and erupt on the skin. Skin inflammations are the bodies natural purification mechanism as it is expelling the toxicity.\r\n\nSkin Clear is a blend of time proven Western herbs and modified version of a Chinese formula called Wu Wei Xiao Du Yin or Clear Heat, Resolve Toxin Compound. One of the lead herbs, Lonicera, is commonly used in Oriental Medicine for clearing heat from the blood and qi, and for relieving fire toxicity. It is used extensively in treating the early stages of warm febrile diseases &leftpar;colds / flu&rightpar;, sores and abscesses, dysentery, and painful urinary dysfunction. \r\n\nNeem is a blood purifier and vulnerary. Burdock seed is usually preferred to Burdock root when there is a skin disorder. Burdock seed is a blood purifier and disperses wind/heat. Phellodendron, Coptis and Violet drain fire and relieve toxicity. Prunella clears heat and dissipates nodules &leftpar;carbuncles&rightpar;. Yellow Dock and Stillingia are alteratives and stimulate the bowels for additional cleansing. Salvia vitalizes the blood. Sarsaparilla is an alterative is usually combined with other blood purifiers such as Burdock. Oregon Grape is a hepatic and alterative. Mistletoe is a detoxicant, softens carbuncles and draws out pus, and calms the nerves.	external
12	Skin Shine	Beatiful Skin	28	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nBurdock root\t\t\tArctium Lappa\r\n\nCoix\t\t\t\tYi Yi Ren\r\n\nMeadowsweet\t\tFilipendula Ulmaria\r\n\nNeem\t\t\t\tAzadirachta Indica\r\n\nHo Shou Wu\t\t\tHe Shou Wu\r\n\nCornus\t\t\t\tShan Zhu Yu\r\n\nSesame seed\t\t\tHei Zi Ma\r\n\nTang Kuei\t\t\tDang Gui\r\n\nPeony, red\t\t\tChi Shao Yao \r\n\nMistletoe\t\t\tViscum Album\r\n\nSarsaparilla\t\t\tSmilax Officinalis\r\n\nGlehnia\t\t\t\tSha Shen\r\n\nAngelica dah.\t\tBai Zhi\r\n\nCouchgrass\t\t\tAgropyron Repens	Western Therapeutic Actions\r\n\nNutritive, alterative, depurative, antacid, nervine, diuretic, demulcent, and anti-inflammatory	Traditional Chinese Medicine\r\n\nNourishes the blood and yin, releases the exterior, and cools the blood	Sample Indications\r\n\nDry skin, aging skin, sallow complexion, blemishes, wrinkles, and clogged skin pores	Suggested Dosage 1/2 - 1 teaspoon, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nContraindicated during pregnancy.	Notations\r\n\nSkin Shine is designed to bring luster back to the skin by using a combination of traditional methods; cleansing the blood of impurities, balancing the pH of the body, nourishing the blood and yin &leftpar;water&rightpar;, and moistening the lungs. The vitality of the skin is directly related to the lungs. The skin, being in direct contact with the air, can be thought of the lungs turned inside out. Many smokers have dry wrinkly skin. This reveals the dryness of the lungs due to the heat from smoke inhalation. \r\n\nCoix has been used extensively in Japan for maintaining lustrous skin and is supported by Couchgrass. Its antiseptic qualities help to keep the skin blemish free. Meadowsweet helps to balance the pH of the blood. Neem is a blood purifier and used specifically for maintaining healthy skin conditions. Ho Shou Wu, Cornus, and Tang Kuei help to eliminate dry skin by nourishing and moistening the blood. Sesame seed nourishes and fortifies the liver and kidneys. Its oils moisten the skin. Peony stimulates the circulation of the blood and helps to break up any toxic stagnation. Mistletoe is a detoxicant, relieves skin inflammations, and calms the nerves. Sarsaparilla is an alterative and depurative. Glehnia moistens the lungs which brings moisture to the skin. Angelica, dah. &leftpar;Bai Zhi&rightpar; maintains clean skin pores by releasing the exterior. \r\n\nMaintaining healthy skin includes a healthy diet rich in organic vegetables, fruits, nuts, seeds, sea weeds, and fish. The Scandinavian people have some of most beautiful skin in the world. This is attributed to not only a diet rich in seafood and clean, cold arctic air, but to their bathhouses. A sauna provides heat and steam to open and clean the pores from toxins; and the cold rinse afterwards, tightens the skin pores backup. Regularly, using the opposing energies of hot steam and cold rinses helps to maintain the firmness and elasticity of the skin which is essential for the prevention of wrinkles and sagging skin.	external
13	Taggy Wart Lotion	Warts, Tags	21	Ingredients &leftpar;Herbal Extracts&rightpar;\r\n\nListed by common and pin yin or latin names, in sequence from largest to smallest amount by quantity.\r\n\nThuja\t\t\tThuja Occidentalis\r\n\nPulsatilla\t         \tBai Tou Weng\r\n\nSassafras\t         \tSassafras Albidum\r\n\nCoix\t\t         \tYi Yi Ren\r\n\nArtemesia\t         \tAi Ye\r\n\nBrucea fruit\t\tYa Dan Zi\r\n\nDrynaria     \t\tGu Sui Bu\r\n\nBloodroot\t         \tSanguinaria Canadensis\r\n\nHarakeke  \t\tPhormium Tenax	Western Therapeutic Actions\r\n\nAlterative, depurative, antiseptic, anti-viral, and anti-bacterial	Traditional Chinese Medicine\r\n\nClears heat and toxicity	Sample Indications\r\n\nWarts, taggy wart, corns, and papillomas	External Application\r\n\nCleanse the area thoroughly before applying this lotion. After cleansing the area, apply lotion to the affected area, 3 times daily	Contraindications and Cautions\r\n\nThere are none known.	Notations\r\n\nTaggy Wart Lotion has been very effective in many situations. Cleansing the liver assists in the ridding of these stubborn, irritating, and ugly little creatures. In the spring time, picking the dandelion stems and sqeezing the white milk onto warts is also very effective.	external
14	Top Crop	Hair Growth	28	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nEclipta\t\t\tHan Lian Cao\r\n\nHo Shou Wu\t\tHe Shou Wu\r\n\nDrynaria\t\t        Gu Sui Bu\r\n\nNeem\t\t\tAzadirachta Indica\r\n\nCnidium\t\t\tChuan Xiong\r\n\nBurdock root\t\tArctium Lappa\r\n\nNettles\t\t\tUrtica Spp.\r\n\nGotu Kola\t\tHydrocotyle Asiatica\r\n\nPsoralea\t\t\tBu Gu Zhi\r\n\nJaborandi\t\tPilocarpus Spp.\r\n\nSophora\t\t\tKu Shen\r\n\nPoke Root\t\tPhytolacca Spp.\r\n\nWahoo\t\t\tEuonymus Atropurpureus	Western Therapeutic Actions\r\n\nRestorative, nutritive, alterative, depurative, and hepatic	Traditional Chinese Medicine\r\n\nNourishes the blood, enriches the yin, benefits the essence, and clears heat	Sample Indications\r\n\nPremature greying of hair, hair thinning and loss, balding, alopecia, dandruff, and itchy scalp	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nThere are none known.	Notations\r\n\nTop Crop falls into the Oriental Medicine categories of blood, yin, and yang tonics. Eclipta is a premier liver tonic and nourishes the liver and kidney. Ho Shou Wu strengthens the liver and kidney, nourishes the blood and augments the essence. Nettles nourishes the liver blood. Kidney/liver tonics in Chinese medicine, are considered the source of nourishment for the entire body. When the body is well nourished, the hair will flourish! When the hair grays prematurely or begins to fall out, then it is believed that the functioning of the liver and kidneys have diminished. Drynaria, a kidney yang tonic, stimulates the growth of hair. Psoralea supports Drynaria as it is a kidney yang tonic and stabilizes the essence. Neem and Burdock root are blood purifiers and help to resolve problematic scalp conditions. Cnidium leads the herbs upward and promotes circulation. Burdock root is the premier blood purifier. Gotu Kola is a restorative and stimulates circulation in the head, and nourishes the brain. Jaborandi and Poke root are stimulants and deobstruent. Sophora clears heat, dries dampness, alleviates itching, and heals skin disorders. Wahoo is a cholagogue and alterative.\r\n\nIn many traditional healing practices, herbal tonics are not enough to counteract this type of deficiency or depleted life force. Exercise, breathing, diet, and a spiritual renewal have to be included in the rebuilding process. \r\n\nConsider a commitment to a one year herbal healing program to help restore and rejuvenate each organ in the body. Consuming an herbal organ system tonic during the season the energy flows through it creates the greatest healing possibilities. In other words; in winter, nourish the kidneys; in spring, nourish the liver; in summer, nourish the heart, in late summer, nourish the spleen; and in fall, nourish the lungs. Using an herbal restorative tonic suitable for that season will provide a wealth of benefits down the road. This is an excellent approach in practicing preventative medicine.	external
15	Blue Limbs	Poor Circulation	28	Ingredients  &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nBayberry\t\t        Myrica Cerifera\r\n\nTang Kuei              Dang Gui\r\n\nHoly Thistle\t\tCnicus Benedictus\r\n\nCinnamon twig\tGui Zhi\r\n\nPeony\t\t\tBai Shao Yao\r\n\nDipsacus\t\tXu Duan\r\n\nGinseng, Chinese\t Ji Lin Ren Shen\r\n\nYarrow\t\t\tAchillea Millefolium\r\n\nPrickly Ash\t\tZanthoxylum Americanum\r\n\nCnidium\t\t\tChuan Xiong\r\n\nSarsaparilla\t\tSmilax Officinalis\r\n\nGinger, dried\t\tGan Jiang\r\n\nLicorice, baked\tZhi Gan Cao\r\n\nCayenne\t\t\tCapsicum Annuum	Western Therapeutic Actions\r\n\nCirculatory stimulant, tonic, alterative, diaphoretic, and cardiac tonic	Traditional Chinese Medicine\r\n\nWarms the channels, disperses cold, nourishes the blood, and vitalizes the blood	Sample Indications\r\n\nPoor circulation, discoloration and coldness of the extremities &leftpar;cold hands and feet&rightpar;, Reynaud's disease, fibromyalgia, sciatica, varicose veins, chilblains, frostbite, and atherosclerosis	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms\r\n\nü	Contraindications and Cautions\r\n\nContraindicated in patients with fire from yin deficiency &leftpar;heat in the feet and palms, afternoon fever, night sweats, thirst&rightpar;. Use with caution during the hot summer months or in warm climates as this formula can injure the fluids.	Notations \r\n\nBlue Limbs follows the pattern of Dang Gui Si Ni Tang or Tang Kuei and Jujube Combination, which addresses the imbalance of internal cold with deficiency and stagnation. Patients with this condition are usually suffering because cold has entered the energy channels due to an underlying blood deficiency. When the blood is full and rich, it is difficult for the cold and also the wind to enter the body and channels. \r\n\nIn Oriental Medicine, a pale tongue is indicative of blood deficiency and a thin white coating reveals the interior cold. The pulse for this type of condition is very thin or frail, almost imperceptible, which confirms the blood deficiency and cold. \r\n\nBlue Limbs is very effective when the patient has suffered from long term cold hands and feet. If the entire limbs are cold, not just the hands and feet, supplement this formula with a kidney yang formula, such as Fortify Will or Kidney Long Life. \r\n\nThe addition of Ginger, Cayenne Pepper and Cinnamon to the diet benefits these complaints. Adding some Cayenne into the shoes help to keep the feet warm. \r\n\nLiving in a warmer environment, daily exercise and saunas help to increase the circulation. Nightly foot soaks with sea salt or Epsom salts enhance the circulation and support the elimination of toxicity. Massage the feet with olive oil after the foot soak and put on a clean pair of cotton socks before going to bed.	external
16	BP Down		28	Ingredients  &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nEucommia\t\tDu Zhong\r\n\nSalvia\t\t\tDan Shen\r\n\nScute\t\t\tHuang Qin\r\n\nRed Clover\t\tTrifolium Pratense\r\n\nAnemarrhena\tZhi Mu\r\n\nHaliotis\t\t\tShi Jue Ming\r\n\nGastrodia\t\tTian Ma\r\n\nRehmannia, prep.\tShu Di Huang\r\n\nYarrow\t\t\tAchillea Millefolium\r\n\nHawthorn berry\tCrataegus Spp. \r\n\nAchyranthes\t\tNiu Xi\r\n\nPrunella\t\t\tXiao Ku Cao\r\n\nMistletoe\t\tViscum Album\r\n\nLime Flower\t\tTilia Europea\r\n\nChamomile, Roman Anthemis Nobilis\r\n\nUva Ursi\t\t\tArctostaphylos Uva Ursi	Western Therapeutic Actions\r\n\nNervine, alterative, general and cardiovascular tonic, diuretic, and antispasmodic	Traditional Chinese Medicine\r\n\nCalms the liver, extinguishes wind, nourishes the kidney, clears liver heat, causes yang to descend, and nourishes the heart	Sample Indications\r\n\nVascular hypertension &leftpar;high blood pressure that lowers itself in a calm setting&rightpar;, renal hypertension, headache, dizziness, vertigo, irritability, and muscular tension	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nContraindicated during pregnancy. Alcohol, caffeine, red meat, and stimulants should be eliminated from the diet. Be sure to have high blood pressure monitored by a qualified physician.	Notations\r\n\nBP Down follows the herbal patterns of Jiang Ya Wan or Decrease Pressure Pills and Tian Ma Gou Teng Yin or Gastrodia & Gambir Combination, two Chinese formulas used for alleviating tension in the muscles, relieving headaches, and essential hypertension. \r\n\nBP Down addresses the ascending liver yang which disturbs the upper part of the body and the heart. In Oriental Medicine, when an excess amount of qi and heat ascend from the liver, this can cause a rise in the blood pressure, dizziness, headaches, or disturbed sleeping patterns. This type of imbalance is usually accompanied by a red tongue and wiry pulse. \r\n\nEucommia strengthens the kidneys and the liver which allows the kidney to anchor the yang. This is similar to the concept of fortifying the root of a tree to stabilize it. Salvia stimulates the flow of blood, cools the blood, and is calming. Prunella, Gastrodia, and Scute calm the liver, drain the excess heat, and extinguish the wind. The Western herbs, Yarrow and Mistletoe &leftpar;European&rightpar; support these Chinese herbs in patterns of liver yang rising. Red Clover clears heat and calms the spirit. Lime Flower, Hawthorn berry, and Chamomile are relaxants. Achyranthes directs the blood downward. \r\n\nHigh blood pressure is a warning sign; the internal geography of the body is talking. Listen. What is it saying? Is a lifestyle change in order? Burning the candle on both ends?. Too much stress? Meditation, yoga, cultivating life enhancing habits, and "thinking the blood pressure down" are allies.	external
17	Big Belly	Meniere's, Tinnitus	28	Ingredients &leftpar;Herbal Extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nRaspberry leaf\tRubus Idaeus\r\n\nOats\t\t\tAvena Sativa\r\n\nPeony\t\t\tBai Shao Yao\r\n\nHoelen\t\t\tFu Ling\r\n\nAtractylodes\t\tBai Zhu\r\n\nAlisma\t\t\tZe Xie\r\n\nTang Kuei\t\tDang Gui\r\n\nCnidium\t\t        Chuan Xiong\r\n\nBlue Cohosh\t\tCaulophyllum Thalictroides\r\n\nSquaw Vine\t\tMitchella Repens\r\n\nGentian\t\t\tGentiana Lutea\r\n\nCramp Bark\t\tViburnum Opulus\r\n\nWild Yam\t\tDioscorea Villosa	Western Therapeutic Actions\r\n\nGeneral uterine and nerve tonic, antispasmodic, parturient, and astringent	Traditional Chinese Medicine\r\n\nWarms the abdomen, supports the spleen, nourishes the liver blood, disperses stagnant liver qi, and resolves dampness	Sample Indications\r\n\nFatigue, anemia, abdominal pain or cramping that is continuous but not severe, urinary difficulty, numbness in the lower body, and slight edema	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, \r\n\n3 times daily. Take during the LAST MONTH of pregnancy\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nIf any health problem persists, seek the advice of a qualified health care practitioner.	Notations \r\n\nBig Belly is made upon request to limit alcohol content. Additional herbs can be requested if labor is delayed or overdue. Big Belly combines herbs from the West with the Chinese formula, Tang Kuei and Peony Formula or Dang Gui Shao Yao San, to provide support during the last part of the pregnancy. Generally, herbs are not used during pregnancy. Tang Kuei and Peony Formula has traditionally been used to treat threatened miscarriages. However, it is commonly used in China and Japan as a daily preventative during pregnancy.\r\n\nDuring pregnancy, the mother should eat high quality foods &leftpar;organic&rightpar;, avoid alcohol, processed sugar and caffeine. Over-consumption of rich foods and raw, cold foods can make labor more difficult as they deplete the spleen qi, cause dampness, and impede the movement of blood and qi. \r\n\nThe fetus or unborn baby can feel all of the different emotions of the mother and the energies surrounding her. The mother and her baby should be protected and kept away from people who are angry or expressing other volatile negative emotions. Happy moms bring happy babies into this world.\r\n\nShiatsu, acupuncture, yoga, breathing exercises, and meditation are excellent natural ways to maintain optimal health during pregnancy and in preparation for labor. Women who have used warm water baths for labor or birth have given some positive feed back. Warm water baths help the body relax and alleviate some of the pain.	external
18	Prep P Relief	Hemmorhoid (Internal)	28	Ingredients &leftpar;Herbal Extracts & Homeopathics&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nTang Kuei\t\tDang Gui\r\n\nBupleurum\t\tChai Hu\r\n\nScute\t\t\tHuang Qin\r\n\nShave Grass\t\tMu Zei\r\n\nCimicifuga\t\tSheng Ma\r\n\nSanguisorba\t\tDi Yu\r\n\nPlantain\t\t\tPlantago Spp.\r\n\nPilewort\t\t\tRanunculus Ficaria \r\n\nStone Root\t\tCollinsonia Canadensis\r\n\nWitch Hazel\t\tHamamelis Virginiana\r\n\nRhubarb\t\t\tDa Huang\r\n\nCascara Sagrada\tRhamnus Purshiana\r\n\nHomeopathics\r\n\nHorse Chestnut\t     Aesculus Hippocastanum\r\n\nBryonia\t\t\t     Bryonia Dioica	Western Therapeutic Actions \r\n\nAstringent, anti-inflammatory, analgesic, antipruritic, venous and capillary tonic, alterative, and specific	Traditional Chinese Medicine\r\n\nRaises and lifts the yang, clears heat, and stops bleeding	Sample Indications\r\n\nHemorrhoids &leftpar;piles&rightpar;, constipation with bleeding, severe local pain, varicose veins, phlebitis, thrombosis, and thrombophlebitis	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, 3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nThere are none known.	Notations\r\n\nA Japanese doctor, Hara Nanyou, from the Tokugawa era, developed a hemorrhoid formula, Yi Zi Tang or Cimicifuga Combination, that proved to be quite successful. Prep P Relief integrates his recommended herbs with those from the Western herbal practices that help heal this aggravating and painful disorder. \r\n\nTang Kuei moistens the intestines and stimulates the bowels. Bupleurum and Cimicifuga raise the yang and are used for prolapse. Scute, Shave Grass, Sanguisorba, and Plantain clear heat and stop bleeding. Pilewort &leftpar;Lesser Celandine&rightpar; is hemorrhoid specific. Stone Root and Witch Hazel are a venous tonic and astringent. Rhubarb and Cascara Sagrada stimulate the bowels. \r\n\nThe homeopathics; Horse Chestnut is an anodyne and hemorrhoid specific while Bryonia is an anti-inflammatory and analgesic.\r\n\nPrep P Powder, when combined with Prep P Relief, provides excellent support for chronic piles. \r\n\nIncorrect dietary patterns, chronic constipation, and lack of exercise often leads to the development of hemorrhoids. If any of these situations exist, it is important to take steps to correct them. Straining during bowel movements is avoided. Sitting on cold stones or cold damp cement is a sure fire way to encourage them. Drinking a glass of warm water with a teaspoon of honey helps to ease constipation.	external
19	Prep P Powder	Hemmorhoid (External)	31	Ingredients &leftpar;Mineral Powders&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nSulfur &leftpar;precipitated&rightpar;\r\n\nCream of Tartar\r\n\nMagnesium Carbonate &leftpar;light&rightpar;\r\n\nCalcium Fluoride	Western Therapeutic Actions\r\n\nVenous tonic, astringent, restorative, and specific	Traditional Chinese Medicine\r\n\nSupports the spleen qi, clears heat, retains the essence, and stops bleeding	Sample Indications\r\n\nHemorrhoids &leftpar;piles&rightpar;, constipation with bleeding, severe local pain, varicose veins, phlebitis, thrombosis, and thrombophlebitis	Suggested Dosage\r\n\n1 large teaspoon in 2 tablespoons of milk or juice, twice daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nThere are none known.	Notations\r\n\nPrep P Powder, when combined with Prep P Relief, provides excellent support for piles. Sulfur, an acid forming mineral, has excellent anti-bacterial, anti-viral, and anti-infective qualities. It supports the structural integrity of the skin and used for problematic skin tissue irritations. Calcium Fluoride helps promote the elasticity of tissues and is useful for piles, varicose veins, circulation problems, and muscle weakness. Magnesium Carbonate is an antacid. Cream of Tartar is a binder or solidifier.\r\n\nIncorrect dietary patterns, chronic constipation, and lack of exercise often leads to the development of hemorrhoids. If any of these situations exist, it is important to take steps to correct them. Straining, during bowel movements, is avoided. Sitting on cold stones or cold damp cement is a sure fire way to encourage them. Drinking a glass of warm water with a teaspoon of honey helps to ease constipation.	external
20	Artery Cleanser	Arterial Plaque	28	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nSalvia                      Dan Shen\r\n\nArjuna\t\t\tTerminalia Arjuna\r\n\nGynostemma\t\tJiao Gu Lan\r\n\nHo Shou Wu\t\tHe Shou Wu\r\n\nPseudoginseng\tTien Qi\r\n\nAstragalus\t\tHuang Qi\r\n\nMyrrh\t\t\tCommiphora Molmol\r\n\nTurmeric\t\tCurcuma Longa\r\n\nRed Clover\t\tTrifolium Pratense\r\n\nTang Kuei\t\tDang Gui\r\n\nHawthorn berry\tCrataegus Spp.\r\n\nYarrow\t\t\tAchillea Millefolium\r\n\nGinkgo leaf\t\tGinkgo Biloba\r\n\nCarthamus\t\tHong Hua\r\n\nBayberry\t\t\tMyrica Cerifera\r\n\nCassia seed\t\tJue Ming Zi	Western Therapeutic Actions\r\n\nNeurocardiac restorative, alterative, tonic, venous astringent, and circulatory stimulant	Traditional Chinese Medicine\r\n\nDisperses blood stasis, vitalizes the blood, enhances circulation, and nourishes the heart blood and qi	Sample Indications\r\n\nCoronary heart disease, poor blood circulation, hardening of the arteries, arterial plaque, atherosclerosis, and hyperlipemia	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nContraindicated during pregnancy.	Notations \r\n\nArtery Cleanser, a heart tonic and circulatory stimulant, uses one of the most relied upon herbs to promote blood circulation, called Salvia &leftpar;Dan Shen&rightpar;. Salvia can be used for long periods of time without having any adverse side effects. Artery Cleanser follows the Oriental Medicine guidelines for resolving blood stagnation. These guidelines state that the correct way to resolve stagnation of the blood &leftpar;plaque and platelet aggregation&rightpar;, the blood must also be nourished and fortified. \r\n\nWhen the arteries become obstructed with plague or lipids, circulation to the heart becomes impaired. The herbs in this formula help clear the excess lipids &leftpar;fats&rightpar; from the blood, enhance blood circulation and nourish the heart. Arjuna, an Ayurvedic herb, is a cardiovascular tonic. It has cholesterol regulating properties and is a blood pressure regulator. Gynostemma is a neurocardiac restorative and alleviates platelet aggregation. Ho Shou Wu and Cassia seed help to reduce the absorption of fats into the blood stream. Pseudoginseng arrests bleeding and vitalizes the blood. Myrrh and Turmeric, used in Oriental and Ayurvedic Medicine, are excellent anti-fat herbs and used for obesity and cholesterol maintenance. Red Clover is a detoxicant, nutritive, and demulcent. Hawthorn berry, a heart tonic, resolves food stagnation and assists in the digestion of fats. The synergy of Astragalus and Tang Kuei nourishes the blood and qi. Yarrow, Ginkgo leaf, and Bayberry are circulatory stimulants. Carthamus enhances circulation and is used for angina.\r\n\nFrom China, a red yeasted rice, Hong Gu, has been used for cholesterol disorders.\r\n\nCleaning up the diet and exercising are important elements in maintaining a healthy heart and circulation. In dealing with heart imbalances it is important to address the client's soul.	external
21	Cholest Balancer	Lower Cholesterol	28	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by ComImon Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nCrataegus\t\t\tShan Zha\r\n\nSalvia\t\t\t\tDan Shen\r\n\nArjuna\t\t\t\tTerminalia Arjuna\r\n\nHo Shou Wu\t\t\tHe Shou Wu\r\n\nRed Clover\t\t\tTrifolium Pratense\r\n\nYarrow\t\t\t\tAchillea Millefolium\r\n\nGinseng, Siberian\t\tCi Wu Jia\r\n\nPseudoginseng\t\tTien Qi\r\n\nGynostemma\t\t\tJiao Gu Lan\r\n\nCassia seed\t\t\tJue Ming Zi \r\n\nGarcinia\t\t\t\tGarcinia Cambogia\r\n\nTurmeric\t\t\tCurcuma Longa\r\n\nCapillaris\t\t\tYin Chen Hao\r\n\nChamomile, Roman\tAnthemis Nobilis\r\n\nBarberry\t\t\t        Berberis Vulgaris	Western Therapeutic Actions\r\n\nNeurocardiac restorative, astringent, tonic, antiseptic, deobstruent, circulatory stimulant, and alterative	Traditional Chinese Medicine\r\n\nDisperses blood stasis, nourishes the heart, enhances circulation, and clears damp/heat	Sample Indications\r\n\nHigh cholesterol, hyperlipemia, poor blood circulation, elevated cholesterol not responding to medication or dietary corrections, and a weak heart	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nContraindicated during pregancy.	Notations \r\n\nCholest Balancer is designed to improve the bodys capacity to digest and eliminate fats &leftpar;lipids&rightpar; and remove excess fats from the blood stream. With these qualities, Cholest Balancer helps to improve the HDL / LDL ratios. \r\n\nCrataegus &leftpar;Hawthorn berry&rightpar; is a neurocardiac restorative and vasodilator, primarily of the coronary blood vessels. It supports the integrity of the blood vessels and assists in the prevention of cholesterol build up in the liver. This last mentioned quality might be why in Oriental Medicine, Crataegus is used for food stagnation. Salvia stimulates blood circulation, particularly of the chest region. Arjuna is a nervine, cardiovascular tonic, and has cholesterol regulating qualities. Ho Shou Wu nourishes the blood and yin, and contains lecithin. Red Clover is an anti-coagulant and detoxicant. Yarrow promotes venous integrity and enhances circulation. Ginseng &leftpar;Siberian&rightpar; with its rich supply of saponins, prevents blood coagulation, and decreases the sugar and cholesterol levels in the blood. Gynostemma and Cassia seed are used for cholesterol abnormalities. Pseudoginseng and Gynostemma are used in China and Japan for maintaining healthy blood pressure and good cholesterol readings. Capillaris clears damp/heat from the liver and is a vasodilator.  Turmeric, from the Ayurvedic tradition, has anti-fat and hepatic cleansing actions. In India, Turmeric and Garcinia, Ayurvedic herbs, have both shown their anti-fat qualities and ability to promote healthy cholesterol levels. Chamomile has mild anti-coagulant qualities and is calming. Barberry disperses stagnation and vitalizes the blood and liver.\r\n\nRemoving saturated fats from the diet, breathing fresh air, having fun with exercise, saunas, and a satisfying life assist the body in maintaining balance and integrity.ü	external
22	Vein Away Powder	Varicose Veins	31	Ingredients &leftpar;Homeopathic Biochemic Tissue Salts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nCalcium Fluoride\r\n\nFerrum Phosphate\r\n\nMagnesium Phosphate\r\n\nCalcium Phosphate	Western Therapeutic Actions\r\n\nVenous tonic, astringent, restorative, and specific	Traditional Chinese Medicine\r\n\nVitalizes the blood and strengthens the spleen qi	Sample Indications\r\n\nVaricose veins, spider veins, swollen veins, and pain due to vascular constriction	Suggested Dosage\r\n\n1/4 teaspoon dissolved directly on the tongue, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nThere are none known.	Notations\r\n\nA German chemist and physicist, Dr. W.H. Schuessler, studied twelve essential cell salts and recorded the effects that the mineral constituents within the cell salts had on supporting the wellness of the body. He identified the specific attributes of each cell salt and they were used accordingly, in the natural healing process from suffering. The cell salts or tissue salts are mineral constituents that are vital for the healthy functioning of our cells and are used extensively by homeopathic doctors. They combine well with herbal formulas in correcting constitutional imbalances. \r\n\nBiochemic Tissue Salts\r\n\nCalcium Fluoride\r\n\n\tThis cell salt helps to retain proper elasticity of tissues and veins. It benefits enlarged varicose veins, hemorrhoids and other conditions caused by over-relaxed fibers of connective tissue. It stimulates blood circulation and strengthens the blood vessels.\r\n\nFerrum Phosphate \r\n\n\tThis cell salt is considered the oxygen carrier because of its ability to oxygenate all the cells of the body, which is then converted into energy.\r\n\nMagnesium Phosphate\r\n\n        This cell salt is an anti-inflammatory agent for the muscular system or nervous system. Cramping or spasmodic pain that \t\t         is stabbing or sharp responds well to this cell salt. \r\n\nCalcium Phosphate\r\n\n\tThis cell salt improves digestion and nutrient assimilation.	external
35	Build Pure Essence	Weak Assimilation, Gain Weight	28	Ingredients&leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nAstragalus\t\t  Huang Qi\r\n\nTang Kuei\t\t  Dang Gui\r\n\nAshwaganda\t\t  Withania Somnifera\r\n\nLigustrum\t\t  Nu Zhen Zi\r\n\nOats\t\t\t  Gou Qi Zi\r\n\nGanoderma\t\t  Jiao Gu Lan\r\n\nGinseng, Chinese\t  Ji Lin Ren Shen\r\n\nSchizandra\t\t Wu Wei Zi\r\n\nSaw Palmetto\t\t Serenoa Serrulata\r\n\nSalvia\t\t\t Dan Shen\r\n\nCitrus\t\t\t Chen Pi\r\n\nGinger, fresh\t         Sheng Jiang	Western Therapeutic Actions\r\n\nAdaptogenic, restorative tonic, and nutritive tonic	Traditional Chinese Medicine\r\n\nSupplements the qi, nourishes the blood, and replenishes the essence	Sample Indications\r\n\nWeakness, loss of weight, poor digestion and assimilation, recovery from illness, AIDS, cancer, adjunct to chemotherapy and radiation therapy	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nContraindicated during pregnancy or when external pathogenic influences have invaded the body &leftpar;fever, influenza, colds, or rashes&rightpar;.	Notations \r\n\nThe Chinese have made an oral liquid similar to this formula and is called Ren Shen Feng Wang Pian. Build Pure Essence is without royal jelly &leftpar;a fluid secreted from the glands of worker bees and fed to bee larvae&rightpar; because of possible allergic reactions, and added Astragalus, Tang Kuei, and Ligustrum in place of it. \r\n\nAstragalus supplements and raises the qi. Tang Kuei nourishes and moves the blood. These two herbs are used together when there is blood and qi deficiency. Ashwaganda is the premier Ayurvedic herb for supplementing the qi. Ligustrum helps to replenish the essence and is a kidney and liver restorative. Oats is the classic Western herb restorative and could be added to any supplementing formula. Lycium fruit, a longevity herb, nourishes the blood and essence, and is a kidney and liver restorative. Ganoderma, a fungus also known as Reishi, has been used as a longevity herb and in cancer therapies. It strengthens the qi, nourishes the heart and lungs, and calms the spirit. Gyno-stemma and Saw Palmetto have been added for an increased adaptogenic effect. Saw Palmetto has been used for wasting diseases. Chinese Ginseng is the unsurpassed, classic Asian restorative. This white root is warming, but not as hot as the red Korean Ginseng. Citrus was added to move the qi in the middle burner &leftpar;digestive system&rightpar; and prevent bloating or distention.\r\n\nThis restorative tonic helps to create more energy in the body, calms the mind, enhances the respiratory system, and improves the digestive functions. Take this formula 30 minutes before mealtime to stimulate the appetite. \r\n\nIf an herbal formula causes stomach upset or is irritating, then take a smaller dosage after meals.	external
38	Green Stone	Gall Stones	28	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nScute\t\t\t\tHuang Qin\r\n\nSaussurea\t\t\tMu Xiang\r\n\nLysimachia\t\t\tJin Qian Cao\r\n\nCapillaris\t\t\tYin Chen Cao\r\n\nCorydalis\t\t\tYan Hu Suo\r\n\nIsatis root\t\t\tBan Lan Gen\r\n\nCelandine, Greater\tChelidonium Majus \r\n\nMarshmallow\t\t\tAlthea Officinalis\r\n\nSkullcap\t\t\t\tScutellaria Lateriflora\r\n\nBupleurum\t\t\tChai Hu\r\n\nWild Yam\t\t\tDioscorea Villosa\r\n\nMeadowsweet\t\tFilipendula Ulmaria\r\n\nStone Root\t\t\tCollinsonia Canadensis\r\n\nGolden Rod\t\t\tSolidago Virgaurea\r\n\nWahoo\t\t\t\tEuonymus Atropurpureus	Western Therapeutic Actions\r\n\nCholagogue, anti-inflammatory, de-obstruent, antilithic, antispasmodic, hepatic, demulcent, and emollient	Traditional Chinese Medicine\r\n\nClears damp/heat in the liver and purges the gallbladder	Sample Indications\r\n\nAcute jaundice, inflammation of the bile ducts, cholelithiasis, gallstones, hepatitis, rashes with itching, and difficulty digesting fats	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nAdditional herbs for the spleen and stomach may be necessary if there is indigestion, weak appetite, or loose stool.	Notations\r\n\nGallbladder inflammation and congestion makes it difficult to digest fats. When phlegm accumulates over time, soft masses and stones can be created. Phlegm accumulation also creates heat. Green Stone addresses this damp/heat condition. The Chinese patent formula, Ludan Pian, combined with the traditional Western specifics creates this new formulation.\r\n\nConsider a rigorous liver detoxification program after the stones have been resolved. This requires a dietary program that includes organic bitter greens, olive oil, apple cider and vegetable juicing. Greasy, fried foods, coffee, alcohol, starchy food &leftpar;soft breads&rightpar;, spicy foods, and unrefined sugars are eliminated from the diet. Saunas and exercise with sweating are very beneficial for cleansing the liver, the lymphatic system, and the blood. For chronic liver sufferers, an annual spring and fall liver cleanse is called for. Consider doing a liver cleanse for two weeks, beginning with the new moon phase. Repeat this on the next new moon phase. \r\n\nLiquid Juice Fast:\r\n\nTo make a good vegetable juice use the following organic foods: carrots, beet, cucumber, garlic, wheat grass, celery, and dandelion greens. Drink three 8 ounce glasses of this juices per day. During the day drink as much water as needed. During the fast, take one tablespoon of cold pressed olive oil, two times daily. This will help to move the stool, cleanse the liver, and cleanse the colon. Apple juice helps to soften the stones, if present.\r\n\nIf blood sugar problems exist, drink organic chicken broth throughout the day to help stabilize the blood sugar. Sugar Blues is an excellent herbal formula for hypoglycemia &leftpar;low blood sugar&rightpar; and Sugar Fire for diabetics &leftpar;high blood sugar&rightpar;.	external
23	Breast C Clear	Breast Cancer	30	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nChih-Ko\t\t\tZhi Ke\r\n\nCurcuma\t\tYu Jin\r\n\nBurdock root\t\tArctium Lappa\r\n\nPrunella\t\t\tXia Ku Cao\r\n\nBlue Citrus\t\tQing Pi\r\n\nTrichosanthes fruit Gua Lou\r\n\nFritillaria\t\tZhe Bei Mu\r\n\nJaborandi\t\tPilocarpus Spp.\r\n\nLonicera\t\t\tJin Yin Hua\r\n\nTurmeric\t\tJiang Huang\r\n\nPoke Root\t\tPhytolacca Spp.\r\n\nFigwort\t\t\tScrophularia Nodosa\r\n\nKohe Kohe\t\tDysoxylum Spectabile\r\n\nThuja\t\t\tThuja Occidentalis	Western Therapeutic Actions\r\n\nAnti-tumor, alterative, depurative, diuretic, anthelmintic, \r\n\nanodyne, astringent, resolvent, and absorbent	Traditional Chinese Medicine\r\n\nTransforms phlegm, vitalizes the blood, resolves masses, and clears heat, and relieves toxicity	Sample Indications\r\n\nBreast cancer, tumors, and solid cysts in the upper body, chronic congestion and swelling in the lymphatic and glandular systems	Suggested Dosage\r\n\n1  2 teaspoons, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nThe herb St. Johns Wort should not be consumed while undergoing chemotherapy or radiation therapy because of potential adverse effects. This formula is not a substitute for qualified medical health care. It is intended as an adjunct therapy.	Notations \r\n\nA gastrointestinal cancer herbal formula, Ping Xiao Dan, developed in China by Dr. Jia Kun in 1958, creates the foundation for Breast C Clear. This formula is primarily a clearing and resolving formula. Herbal formulas that enhance the immune system are beneficial with Breast C Clear. Immune enhancement is critical in dealing with deep seated disorders such as cancer.\r\n\nChih-ko and Curcuma are two of the main herbs taken from his formula. Chih-ko disperses stagnant energy and transforms phlegm; Curcuma invigorates the blood and breaks up stagnation in the chest area. Phlegm is considered one of the main causes of solid masses in the body. Our formula has included herbs commonly used to resolve masses and disperse phlegm in the upper body: Prunella, Blue Citrus, Trichosanthes fruit, Jaborandi, and Fritillaria. Lonicera clears toxic heat. Turmeric assists in resolving phlegm. The Western herbs, Poke root and Figwort, clear toxicity from the blood and lymphatic system and help to resolve swollen glands. Kohe Kohe is a specific for the pectoral region of the body and is an alterative. Thuja is an alterative and helps to resolve phlegm and masses. \r\n\nNutrition is extremely important in this life threatening disorders. All phlegm-producing foods should be eliminated immediately from the diet, including dairy products. Soy products &leftpar;tofu&rightpar; have proven to be beneficial for cancer prevention, along with CoQ10 &leftpar;~400 mg / day&rightpar;. A deep cleansing on all levels is recommended,and the patient requires support by a deeply committed, loving team.	external
24	C Clear	Basic Cancer Cleanser	30	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nOldenlandia\t\tBai Hua She She Cao\r\n\nScutellaria\t\tBan Zhi Lian\r\n\nGynostemma\t\tJiao Gu Lan\r\n\nAstragalus\t\tHuang Qi\r\n\nBurdock root\t\tArctium Lappa\r\n\nGanoderma\t\tLing Chi\r\n\nSheeps Sorrel\tRumex Acetosella\r\n\nParis\t\t\tZao Xiu\r\n\nSlippery Elm \t\tUlmus Fulva\r\n\nSparganium\t\tSan Leng\r\n\nZedoaria\t\t\tE Zhu\r\n\nKohe Kohe\t\tDysoxylum Spectabile\r\n\nThuja\t\t\tThuja Occidentalis\r\n\nJaborandi\t\tPilocarpus Spp.\r\n\nBellis &leftpar;Daisy&rightpar;\t\tBellis Perennis\r\n\nViolet\t\t\tZi Hua Di Ding\r\n\nPoke Root\t\tPhytolacca Spp.	Western Therapeutic Actions\r\n\nAnti-tumor, alterative, depurative, restorative, diuretic, anthelmintic, antiseptic, and absorbent	Traditional Chinese Medicine\r\n\nClears heat, relieves toxicity, supplements the qi, resolves masses, and disperses blood stasis	Sample Indications\r\n\nCancer, tumors, solid masses, lupus, and for cleansing and \r\n\nimmune system support in the treatment of chronic conditions	Suggested Dosage\r\n\n1  2 teaspoons, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms\r\n\nC Clear is used in conjunction with a herbal formula that focuses on the specific type of cancer and imbalance&leftpar;breast, colon, lung, prostate&rightpar;.	Contraindications and Cautions\r\n\nThe herb St. Johns Wort should not be consumed while undergoing chemotherapy or radiation therapy because of potential adverse effects. This formula is not a substitute for qualified medical health care. It is intended as an adjunct therapy.	Notations\r\n\nGenetics and exposure to external environmental toxins &leftpar;carcinogenic chemicals, radiation, pollutants&rightpar; are current medical theories on the possible causes of cancer. Traditional healers also link the emotions as an important contributing factor to imbalances and disorders. \r\n\nAn excessive amount of any emotion, whether it is anger, depression &leftpar;anger turned inward&rightpar;, anxiety, worry, grief, or fear, has a negative impact on the body. Anything in excess, external or internal, disrupts the normal circulatory patterns of the blood and qi. Over time, this leads to stagnation in areas of weakness in the body. Stagnation of blood and qi, when linked with a toxin present in the body, and a compromised immune system, can lead to abnormal cell growth or a tumor. \r\n\nThe Oriental Medicine method of treatment for cancer, developed in the 1960's, is called Fu Zheng Pei Ben. This translates into, "support the normal and strengthen the root". C Clear is formulated to address this concept. Using the model of Fu Zheng Pei Ben, C Clear clears the body of toxicity, resolves stagnation, and supports the weakened immune system. \r\n\nConsider a comprehensive healing program. Some supportive natural therapies include: acupuncture, Shiatsu, ozone treatments, enzyme therapy, castor oil packs, coffee enemas, ginger compresses, albi root plasters, juicing and chelation therapy. A cleansing diet based on organic fruits and vegetables benefits this disorder. This helps to keep the body in an alkaline state, cleanses the body of toxicity, and supports the immune system.	external
25	Chemo Balancer	Builds White Blood	2	Ingredients Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nOats\t\t\tAvena Sativa\r\n\nAstragalus\t\tHuang Qi\r\n\nMillettia\t\t\tJi Xue Teng\r\n\nGynostemma\t\tJiao Gu Lan\r\n\nBurdock root\t\tArctium Lappa\r\n\nAshwaganda\t\tWithania Somnifera\r\n\nGanoderma\t\tLing Chi\r\n\nAtractylodes\t\tBai Zhu\r\n\nSalvia\t\t\tDan Shen\r\n\nGuduchi\t\t\tTinospora Cordifolia\r\n\nCuscuta\t\t\tTu Si Zi\r\n\nMorus fruit\t\tSang Shen\r\n\nGentian\t\t\tGentiana Lutea\r\n\nCitrus\t\t\tChen Pi\r\n\nGinger, fresh\t\tSheng Jiang\r\n\nLicorice, baked\tZhi Gan Cao	Western Therapeutic Actions\r\n\nRestorative, nutritive, digestive, nerve tonic, and alterative	Traditional Chinese Medicine\r\n\nNourishes the blood and supplements the qi, enriches the yin and yang, supports the spleen, and regulates the qi	Sample Indications\r\n\nAdjunct to chemotherapy, nausea, leukopenia, weakness, \r\n\ndizziness, and loss of appetite	Suggested Dosage\r\n\n1 - 2 teaspoons, in a small amount of water, \r\n\n3 times daily\r\n\nChemo Balancer can be used in conjunction with C Clear, which addresses the elimination of toxins &leftpar;toxic heat&rightpar; in the body, while supporting the vital energy, and protecting the immune system.\r\n\nVariation is according to individual symptoms\r\n\nü	Contraindications and Cautions\r\n\nSt. Johns Wort is the only herb known to inhibit the actions of chemotherapy. High doses of Vitamin C, exceeding 1.5 grams/day, has been questioned &leftpar;it is absorbed by the cancer cells&rightpar;, but these studies are not definitive.	Notations \r\n\nChemotherapy is directed at destroying cancer cells, but also adversely affects the entire body; loss of hair, diarrhea, low white blood count, weakness, and emotional distress. Protection of the non-targeted normal cells &leftpar;white blood cells, bone marrow cells&rightpar; becomes critical for the survival and recovery of a patient. If the white blood count gets too low, chemotherapy is halted until the patients immune system builds back up. Chemo Balancer counters the possible negative impact drug therapy has on the body. \r\n\nSupplements and antioxidants may protect the body from the undesirable side effects of chemotherapy without adversely limiting the drug therapy. This includes neuropathy and cardiac damage. \r\n\nOats &leftpar;wild&rightpar; is a restorative, providing nourishment to the endocrine, nervous, and immune systems. Astragalus, Millettia, and Salvia are used together for treating bone marrow suppression. Astragalus replenishes the qi and blood; Millettia nourishes and promotes the movement of blood; and Salvia disperses blood stagnation, particularly in the chest area and calms the spirit. Gynostemma and Ashwaganda are adaptogenic herbs and antioxidants, fortifying the body when undergoing high levels of stress and illness. Gynostemma is used to nourish the heart and disperse platelet aggregation &leftpar;clotting and plaque&rightpar;. Burdock root is a detoxicant, eliminating toxins from the tissues and bloodstream. Ashwaganda and Cuscuta nourish the kidney yang &leftpar;fire&rightpar; and counteract the depletion caused by the toxic chemicals. Guduchi restores the immune system and is an excellent purifier. Morus fruit nourishes the blood and moistens. Atractylodes, Citrus, Ginger, and Licorice support the spleen and enhance digestion.	external
26	Colon C Clear	Colon Cancer	30	Ingredients  &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nPau Darco\t\t\tTabebuia Avellanedae\r\n\nChih-Ko\t\t\t\tZhi Ke\r\n\nCurcuma\t\t\tYu Jin\r\n\nAgrimony\t\t\tXian He Cao\r\n\nPatrinia\t\t\t\tBai Jiang Cao\r\n\nCoix\t\t\t\tYi Yi Ren\r\n\nImperata\t\t\tBai Mao Gen\r\n\nZedoaria\t\t\t\tE Zhu\r\n\nSparganium\t\t\tSan Leng\r\n\nOldenlandia\t\t\tBai Hua She She Cao\r\n\nBurdock root\t\t\tArctium Lappa\r\n\nPeony, red\t\t\tChi Shao Yao\r\n\nDandelion\t\t\tPu Gong Ying\r\n\nSkullcap\t\t\t\tScutellaria Lateriflora\r\n\nSaussurea\t\t\tMu Xiang	Wesern Therapeutic Actions\r\n\nAnti-tumor, alterative, depurative, nervine, and cholagogue	Traditional Chinese Medicine\r\n\nVitalizes the blood and moves the qi, resolves masses, clears heat, relieves toxicity, and transforms phlegm	Sample Indications\r\n\nGastrointestinal cancer, tumors, and solid masses in the \r\n\ndigestive tract	Suggested Dosage\r\n\n1  2 teaspoons, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms\r\n\nColon C Clear can be used in conjunction with \r\n\nC Clear, which addresses the elimination of \r\n\ntoxins &leftpar;toxic heat&rightpar; in the body, supports the vital energy, and protects the immune system.	Contraindications and Cautions\r\n\nThe herb St. Johns Wort should not be consumed while undergoing chemotherapy or radiation therapy because of potential adverse effects. This formula is not a substitute for qualified medical health care. It is intended as an adjunct therapy.	Notations \r\n\nColon C Clear uses a gastrointestinal cancer herbal formula, Ping Xiao Dan, developed in China by Dr. Jia Kun in 1958, as its foundation. In designing herbal formulas for cancer, the current Chinese model recommends this strategy: support the vital qi and immune system, expel the toxins with herbs that have shown themselves to inhibit tumors, vitalize the blood and qi &leftpar;create movement&rightpar;, and disperse the phlegm &leftpar;some believe that tumors are congealed masses of phlegm&rightpar;.\r\n\nPau Darco is the inner bark of the Taheebo tree from South America. It has anti-viral and anti-fungal properties and multiplies the red corpuscles, the oxygen carrying blood cells. Pau Darco is widely used in South America as a detoxifying tea in treating cancerous disorders, especially colon cancer. Chih-Ko is cool in nature and helps to regulate the qi in the middle burner &leftpar;digestive tract&rightpar;. Curcuma helps to invigorate the blood and break up stagnation. Agrimony is anti-inflammatory, a hemostatic, and anti-viral. Patrinia and Oldenlandia relieve toxicity and internal toxic sores and swellings. Coix has shown in studies to inhibit carcinoma. Zedoaria and Sparganium strongly activate circulation and resolve abdominal masses. Red Peony promotes the circulation of blood and qi. Burdock root and Dandelion are blood purifiers.\r\n\nDuring chemotherapy or radiation therapy, Chemo Balancer and Radiation Support support the immune system and help minimize the adverse side effects of these types of therapies. Immune support is a critical issue during these stages of therapy.\r\n\nConsider adapting to a cleansing diet of organic raw foods. The elimination of red meats, fried foods, and dairy is recommended. Daily juicing of organic raw vegetable assist the cleansing process. Chew well, eat slowly, and relax.	external
31	Sugar Fire	High Blood Sugar	28	Ingredients&leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nGymnema\t\t       Gymnema Sylvestre\r\n\nTrichosanthes root     Tian Hua Fen \r\n\nRehmannia, raw\t       Sheng Di Huang\r\n\nOats\t\t\t       Avena Sativa\r\n\nBitter Melon\t\t       Momordica Charantia\r\n\nOphiopogon\t\t       Mai Men Dong\r\n\nPeriwinkle\t\t       Vinca Minor\r\n\nRhodiola\t\t\t       Hong Jing Tian\r\n\nShilajit\t\t\t       Asphaltum\r\n\nDioscorea\t\t       Shan Yao\r\n\nSalvia\t\t\t       Dan Shen\r\n\nBugleweed\t\t       Lycopus Virgininicus \r\n\nPolygonatum, sib.       Huang Jing\r\n\nPolygonatum, odor.    Yu Zhu\r\n\nMeadowsweet\t       Filipendula Ulmaria\r\n\nCranesbill, American  Geranium Maculatum\r\n\nCoptis\t\t\t       Huang Lian\r\n\nJambul\t\t\t       Eugenia Jambolana	Western Therapeutic Actions\r\n\nRestorative, nutritive, demulcent, nerve tonic, astringent, antacid, and diuretic	Traditional Chinese Medicine\r\n\nNourishes the yin, supplements the qi, vitalizes the blood, and clears heat	Sample Indications\r\n\nDiabetes &leftpar;type 2, non-insulin dependent&rightpar;, hyperglycemia, excessive thirst, excessive hunger, excessive urination, chronic kidney disease, tuberculosis, and dry cough	Suggested Dosage\r\n\n1 -2 teaspoons, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nThere are none known.	Notations\r\n\nSugar Fire is designed to treat the initial stages of diabetes and non-insulin dependent glucose imbalances. If diabetes is chronic and deeply rooted &leftpar;insulin dependent&rightpar;, then herbal formulas that nourish the kidney yang &leftpar;fire&rightpar; are to be considered, such as Fortify Will or Kidney Long Life. Sugar Fire, is a modified version of two Chinese formulas; Mai Men Dong Yin Zi or Ophiopogon and Trichosanthes Combination and Yu Quan Pian or Jade Screen Tablet combined with Western proven specifics. \r\n\nSugar Fire enhances the bodies ability to utilize the insulin being produced in the spleen &leftpar;islets of langerhans&rightpar;, encourages insulin production, and supports the livers ability to store glycogen. The Ayurvedic herbs, Gymnema, Bitter Melon, Shilajit, and Jambul, are used in India for regulating sugar metabolism. \r\n\nDiet is a major factor in diabetes. Refined sugars, simple carbohydrates, raw milk, and fried foods should be eliminated from the diet. A more traditional diet based on ones ancestral heritage could be of benefit. Obesity is another major problem because of the bodies inability to produce enough extra insulin to support the excess weight. Exercise promotes better circulation, and will oxygenate the cells so they can burn off excess calories. \r\n\nAn excess amount of emotional stress and tension can cause an internal disharmony between the liver and spleen, triggering glucose imbalances. Stress reduction is the key.\r\n\nThe Native American population has the highest incidence of diabetes in the Americas. White sugar and white flour given them by the government replaced the wild berries and wild meat. Reservations, reformatories, and missionaries created emotional scars that even the healthiest of livers and spleens would be pressed to thrive, let alone survive, and echoed around the world by many indigenous peoples!\r\n\nü	external
27	Lung C Clear	Lung Cancer	30	Ingredients  &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nHouttuynia\t\t\tYu Xing Cao\r\n\nOldenlandia\t\t\tBai Hua She She Cao\r\n\nGynostemma\t\t\tJiao Gu Lan\r\n\nScutellaria\t\t\tBan Zhi Lian\r\n\nMarshmallow\t\t\tAlthea Officinalis\r\n\nSlippery Elm \t\t\tUlmus Fulva\r\n\nLungwort\t\t\tPulmonaria Officinalis\r\n\nPhragmites\t\t\tLu Gen\r\n\nPlatycodon\t\t\tJie Geng\r\n\nOphiopogon\t\t\tMai Men Dong\r\n\nKumarahoe\t\t\tPomaderris Kum\r\n\nFritillaria\t\t\tZhe Bei Mu\r\n\nKohe Kohe\t\t\tDysoxylum Spectabile\r\n\nHoropito\t\t\tPseudowintera Colorata\r\n\nFenugreek\t\t\tTrigonella Foenum-Graecum\r\n\nLicorice\t\t\t\tGan Cao\r\n\nBellis &leftpar;Daisy&rightpar;\t\t\tBellis Perennis	Wesern Therapeutic Actions\r\n\nAnti-tumor, absorbent, alterative, depurative, demulcent, and emollient	Traditional Chinese Medicine\r\n\nClears heat, relieves toxicity, nourishes the yin, moistens the lung,  vitalizes the blood, and resolves masses	Sample Indications\r\n\nLung cancer, tumors, and solid masses in the chest and upper body	Suggested Dosage\r\n\n1  2 teaspoons, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms\r\n\nLung C Clear can be used in conjunction with \r\n\nC Clear, which addresses the elimination of \r\n\ntoxins &leftpar;toxic heat&rightpar; in the body, supports the vital energy, and protects the immune system.	Contraindications and Cautions\r\n\nThe herb St. Johns Wort should not be consumed while undergoing chemotherapy or radiation therapy because of a potential adverse effect. This formula is not a substitute for qualified medical health care. It is intended as an adjunct therapy.	Notations\r\n\nLung C Clear brings moisture back to the lungs and clears the toxic/heat and phlegm build-up. Oldenlandia and Scutellaria are used in Oriental Medicine in cancer therapy and are used extensively in our herbal cancer formulas. They are known for their potent ability to cleanse toxins from the body. \r\n\nHouttuynia clears toxic/heat, is excellent for lung abscesses, and reduces swellings. Gynostemma has adaptogenic and antioxidant properties, strengthens the immune system, promotes healthy cholesterol levels, and increases stamina. Marshmallow and Slippery Elm soothe the mucous membranes of the lungs and are anti-inflammatory. Lungwort, as it name implies, is pectoral specific, and helps to alleviate the dryness of the lungs, similar to the Chinese herb, Ophiopogon. Phragmites clears lung heat and generates fluids which helps the actions of Fritillaria to expel the toxic mucous from the lungs. Platycodon is a brilliant herb that opens the lungs and helps in expectorating mucous, hot or cold. It is an excellent herb for many lung disorders. Kumarahoe and Kohe Kohe, Maori herbs, are pectorals with clearing and anti-inflammatory actions. Horopito, another Maori herb, is an excellent alterative and depurative. Fenugreek and Licorice support the digestion. Bellis supports the healing of tissues.\r\n\nThis formula deals directly with the lungs and should be supported by other herbal formulas to address any other imbalances the patient is experiencing. Cancer is the result of a long-term imbalance in the body network of systems. Consider a comprehensive healing program using the traditional concept practiced by most traditional cultures; the poetic interplay and dance of the of the body-mind-heart-spirit.	external
28	Radiation Support	Cleanses, Supports recovery from Radiation Therapy	30	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nOldenlandia\t\t     Bai Hua She She Cao\r\n\nSalvia\t\t\t     Dan Shen\r\n\nAshwaganda\t\t     Withania Somnifera\r\n\nGuduchi\t\t\t     Tinospora cordifolia\r\n\nOphiopogon\t\t     Mai Men Dong\r\n\nAstragalus\t\t     Huang Qi\r\n\nBushy Knotweed\t     Hu Zhang\r\n\nRehmannia, raw\t     Sheng Di Huang\r\n\nAnemarrhena\t     Zhi Mu\r\n\nPseudostellaria\t     Tai Zi Shen\r\n\nImperata\t\t     Bai Mao Gen\r\n\nPolygonatum, sib.     Huang Jing\r\n\nAtractylodes\t\t     Bai Zhu\r\n\nScrophularia\t\t     Xuan Shen\r\n\nMoutan\t\t\t     Mu Dan Pi\r\n\nCardamon\t\t     Sha Ren	Western Therapeutic Actions\r\n\nDemulcent, nutritive, restorative, alterative, and emollient	Traditional Chinese Medicine\r\n\nClears heat, vitalizes the blood, nourishes the liver and kidney yin, replenishes the essence, and supports the spleen	Sample Indications\r\n\nSupports the internal organs, body fluids, and vital energy during radiation therapy for cancer	Suggested Dosage\r\n\n1 - 2 teaspoons, in a small amount of water, \r\n\n3 times daily\r\n\nRadiation Support can be used in conjunction with C Clear, which addresses the elimination of toxins &leftpar;toxic heat&rightpar; in the body, while supporting the vital energy, and protecting the immune system.\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nSt. Johns Wort is the only herb known to inhibit the actions of chemotherapy. High doses of Vitamin C, exceeding 1.5 grams/day, has been questioned &leftpar;it is absorbed by the cancer cells&rightpar;, but not definitive.	Notations\r\n\nRadiation Support addresses the damaging heat that radiation therapy causes. In Oriental Medicine, an excess amount of heat can create a yin &leftpar;water&rightpar; deficiency as the excess heat consumes the body fluids. Excess heat can also damage the mucous membranes causing sores, inflammation, and ulcers. Dr. Pan Mingji has done extensive cancer research using Traditional Chinese Medicine in China. He created a formula, Fuzhen Shengjin Decoction, in support of the bodies internal response to radiation. Radiation Support uses the energetic patterns and herbal guidelines he developed. \r\n\nOldenlandia is a strong detoxicant, clears heat, and relieves toxicity. It can be used both externally and internally. Salvia clears heat, calms irritability, and is effective when the damaging heat reaches the nutritive level of the body. Salvia is an effective herb in all yin deficient conditions. Ashwaganda is an adaptogenic and antioxidant, fortifying the body during high levels of stress. Guduchi is a blood purifier and restorative. Astragalus strengthens the qi and blood and augments the protective qi. Astragalus is also used for skin ulcerations that do not heal. Bushy Knotweed invigorates the blood, drains heat downward, and relieves toxicity. Imperata cools the blood. Ophiopogon, Rehmannia, Anemarrhena, and Scrophularia nourish the fluids. Pseudostellaria and Polygonatum were added because of their ability to nourish the spleen &leftpar;nutritive assimilation&rightpar; without damaging the yin. Moutan cools the blood and calms the irritability and edginess caused by the excess heat. Cardamon is an aromatic digestive aid, especially useful when strong clearing action is the focus of an herbal formula.\r\n\nMinimizing the adverse side effects of allopathic medicine without suppressing their actions is a healthy approach to consider.	external
29	Prostate C Clear	Prostate Cancer	30	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nCoix\t\t\tYi Yi Ren\r\n\nCapillaris\t\tYin Chen Hao\r\n\nSaw Palmetto\t\tSerenoa Serrulata\r\n\nBurdock root\t\tArctium Lappa\r\n\nSarsaparilla\t\tSmilax Officinalis\r\n\nPseudostellaria\tTai Zi Shen\r\n\nPlantago seed\tChe Qian Zi\r\n\nGardenia\t\tZhi Zi\r\n\nLygodium spore\tHai Jin Sha\r\n\nAchyranthes\t\tNiu Xi\r\n\nSalvia\t\t\tDan Shen\r\n\nPersica\t\t\tTao Ren\r\n\nAtractylodes\t\tBai Zhu\r\n\nPolyporous\t\tZhu Ling\r\n\nPeony, red\t\tChi Shao Yao	Western Therapeutic Actions\r\n\nAnti-tumor, alterative, depurative, detoxicant, absorbent, deobstruent, tonic, and diuretic	Traditional Chinese Medicine\r\n\nDries dampness and drains damp/heat, supplements the qi, resolves masses, and disperses blood stasis	Sample Indications\r\n\nCancer and tumors of the prostate, prostatitis, benign prostatic hyperplasia	Suggested Dosage\r\n\n1  2 teaspoons, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms\r\n\nProstate C Clear can be used in conjunction with \r\n\nC Clear, which addresses the elimination of \r\n\ntoxins &leftpar;toxic heat&rightpar; in the body, supports the vital energy, and protects the immune system.	Contraindications and Cautions\r\n\nThe herb St. Johns Wort should not be consumed while undergoing chemotherapy or radiation therapy because potential adverse effects. This formula is not a substitute for qualified medical health care. It is intended as an adjunct therapy. Attention must be given to the intricate web of the body-mind-heart-spirit connections.	Notations\r\n\nFu Zheng Pei Ben, support the normal and strengthen the root, is the energetic and herbal strategy used in Prostate C Clear. When the kidneys lose their vitality, various systemic changes can take place. One of these changes is the healthy functioning of the prostate gland. The kidneys, from a traditional perspective, control the bladder, prostate gland, and adrenal glands. As the energy of the kidneys weakens, their ability to discharge waste from the body diminishes. The accumulated waste turns into damp/heat and accumulates in the prostate gland. Over time, this damp/heat, if not treated correctly, causes a disruption in urinary and erectile functions, and eventually can turn into tumors and cancer.	external
133	Sneeze Ease	Natural Anti-histamine, itchy eyes, sneezing	29	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nAstragalus\t\t\t\tHuang Qi\r\n\nAngelica dah.\t\t\tBai Zhi\r\n\nNettles\t\t\t\t\tUrtica spp.\r\n\nMagnolia flower\t      Xin Yi Hua\r\n\nScute\t\t\t      Huang Qin\r\n\nXanthium\t\t      Cang Er Zi\r\n\nCentipeda\t\t      E Bu Shi Cao\r\n\nMullein\t\t\t      Verbascum Thapsus\r\n\nSchizonepeta\t\t      Jing Jie\r\n\nCassia seed\t\t      Jue Ming Zi\r\n\nSiler\t\t\t\t      Fang Feng\r\n\nPlatycodon\t\t      Jie Geng\r\n\nAgastache\t\t      Huo Xiang	Western Therapeutic Actions\r\n\nAntihistaminic, decongestant, alterative, depurative, and astringent	Traditional Chinese Medicine\r\n\nSupplements the protective qi, dispels wind, opens the nasal passages, clears heat, and resolves dampness	Sample Indications\r\n\nSeasonal allergies, sneezing, itchy eyes, runny discharge, and headache	Suggested Dosage\r\n\n10 - 20 drops, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nContraindicated during pregnancy.	Notations\r\n\nSneeze Ease is similar to Sinus Clear as both treat sinus conditions. The difference is that the former treats seasonal allergies without any signs of infection, while the later treats allergies and infections of the sinus cavity. Sneeze Ease also uses Astragalus to strengthen the protective qi so that the individual is more immune to seasonal pollens. This formula is patterned after the Chinese patent formula, Bi Yan Pian or Nose Inflammation Pills. \r\n\nAngelica dah., Magnolia flower, Xanthium, Centipeda, and Schizonepeta expel wind and open the nasal passages. Nettles is a liver blood tonic rich in chlorophyll, has pectoral qualities and relieves allergies. Scute sedates the liver yang alleviating headaches and inflamed eyes. Mullein is an astringent and pectoral. Cassia seed expels wind/heat and clears the liver and the vision. Siler releases the exterior and expels wind. It also supports the spleen. Platycodon opens the lungs and directs the other herbs to the upper body. Agastache, an aromatic herb, releases the exterior and harmonizes the middle burner.\r\n\nIf an individual suffers from chronic allergies, consider alleviating liver congestion and toxicity. Enhancing the normal functions of the liver is beneficial as it produces natural antihistamines.\r\n\nAlso consider using herbal formulas to build up their immunity prior to allergy seasons. \r\n\nEat fresh juicy pineapple. It provides mouth watering allergy relief! You can tell when a pineapple is ripe by pulling on one of its center leaves. If it pulls out easily, its time to eat!\r\n\nü	external
30	Sugar Blues	Low Blood Sugar	28	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nOats\t\t\t\tAvena Sativa\r\n\nPeony\t\t\t\tBai Shao Yao\r\n\nCodonopsis\t\t\tDang Shen\r\n\nPolygonatum, sib.\tHuang Jing\r\n\nSkullcap\t\t\t\tScutellaria Lateriflora\r\n\nBitter Melon\t\t\tMomordica Charantia\r\n\nOphiopogon\t\t\tMai Men Dong\r\n\nDendrobium\t\t\tShi Hu\r\n\nPolygonum vine\t\tYe Jiao Teng\r\n\nCinnamon twig\t\tGui Zhi\r\n\nDioscorea\t\t\tShan Yao\r\n\nCyperus\t\t\t\tXiang Fu\r\n\nDandelion\t\t\tPu Gong Ying\r\n\nSaussurea\t\t\tMu Xiang\r\n\nLicorice, baked\t\tZhi Gan Cao	Western Therapeutic Actions\r\n\nRestorative, nutritive, hepatic, demulcent, nerve tonic, and nervine,	Traditional Chinese Medicine\r\n\nWarms and strengthens the middle burner, harmonizes the protective and nutritive qi, and nourishes the yin	Sample Indications \r\n\nHypoglycemia, low blood sugar, sudden onset of hunger, dizziness, shaky, sweaty, light headed, difficult to concentrate, cold extremities, feverish from unknown causes, edgy and irritable, fatigue, craves protein, and intermittent abdominal pain	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nContraindicated for heat from yin deficiency.	Notations\r\n\nSugar Blues is a modified version of two Chinese formulas, Xiao Jian Zhong Tang or Minor Cinnamon and Peony Combination, and  Gui Zhi Jia Shao Yao Tang or Cinnamon and Peony Combination. \r\n\nPeony calms the liver, preserves the yin, and harmonizes the functioning of the liver and spleen. This helps to contain and stabilize the nutritive qi &leftpar;regulation of the production of insulin by the spleen and the storage of glycogen in the liver&rightpar;. Oats, Codonopsis, Polygonatum, and Licorice strengthen the spleen. This helps to raise the glucose levels. Ophiopogon, and Dendrobium moisten the yin of the stomach and lung. Cyperus, Skullcap, and Saussurea help to regulate the middle burner and vitalize the liver qi. Bitter Melon is a blood sugar stabilizer. Cinnamon twig combines with Peony in harmonizing the protective qi and nutritive qi. Dioscorea benefits the spleen, lung, and kidney. Dandelion is a detoxicant and cleanses the liver.\r\n\nLow blood sugar can be caused by a number of factors: chronic stress adversely affecting the liver &leftpar;constrained liver qi&rightpar;, which then energetically invades the stomach &leftpar;excess heat, depletes the yin&rightpar;; poor dietary habits with an over-consumption of refined sugars and processed carbohydrates &leftpar;depletes the spleen qi&rightpar;; irregular eating habits &leftpar;creates stomach yin deficiency and inability of the spleen to transform fluids&rightpar;. The sleeper in this disorder is chronic anxiety which exhausts the adrenal glands. Anxiety over stimulates the adrenal glands which produces epinephrine &leftpar;a nervous stimulant&rightpar; and initiates the breakdown of glycogen into glucose. With the liver storing a limited amount of glycogen, anxiety depletes the reserves, we run out of gas, and we meet the villain, low blood sugar, the sugar blues!	external
37	Digest Ease	Heart Burn, Digestive Aid	29	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nGallus\t\t\t\tJi Nei Jin\r\n\nMarshmallow\t\t\tAlthea Officinalis\r\n\nMeadowsweet\t\tFilipendula Ulmaria\r\n\nRaphanus\t\t\tLai Fu Zi\r\n\nCrataegus\t\t\tShan Zha\r\n\nChamomile, Roman\tAnthemis Nobilis\r\n\nChih-Shih\t\t\tZhi Shi\r\n\nCuttlebone\t\t\tHai Piao Xiao\r\n\nWild Yam\t\t\tDioscorea Villosa\r\n\nFennel\t\t\t\tFoeniculum Vulgare\r\n\nGentian\t\t\t\tGentiana Lutea\r\n\nGinger, fresh\t\t\tSheng Jiang\r\n\nAsafoetida\t\t\tFerula Asafoetida	Western Therapeutic Actions\r\n\nAntispasmodic, warming, carminative, anti-nauseant, digestive, aromatic, and antacid	Traditional Chinese Medicine\r\n\nReduces food stagnation, transforms accumulation, controls acidity, and regulates the qi	Sample Indications\r\n\nIndigestion, belching, acid regurgitation, nausea, hiatal hernia, flatulence, dyspepsia, and colic	Suggested Dosage\r\n\n5 - 20 drops, in a small amount of water, \r\n\n3 times daily\r\n\nTake this formula after each meal for digestive support\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nThere are none known.	Notations\r\n\nDigest Ease improves the digestibility of foods and enhances the movement of food through the digestive tract, eliminating the stuffed sensation after eating. This helps to eliminate belching and acid regurgitation.\r\n\nGallus, Raphanus &leftpar;radish seed&rightpar;, and Crataegus eliminate food stagnation and accumulation, abdominal fullness and distention &leftpar;bloating&rightpar;. Gallus is highly effective for improving the health of undernourished children &leftpar;nutritional impairment&rightpar; or for children with poor eating habits &leftpar;junk food junkies&rightpar;. Marshmallow root soothes the mucous membranes. Meadowsweet balances the pH of the body and can be used as tea for childrens diarrhea. Cuttlebone, containing calcium carbonate, helps to control acidity, sour belching, and acid regurgitation. Wild Yam, different than the Chinese Wild Yam &leftpar;Dioscorea&rightpar;, is anti-bilious and antispasmodic. It is an excellent herb for colic. Fennel is a stomachic and carminative. Ginger is a warm digestive. Asafoetida, a gum resin from Afghanistan, is a specific remedy for hiatal hernia. It is also used for food stagnation, weak digestion, bowel disorders connected to the emotions &leftpar;such as Irritable Bowel Syndrome&rightpar;, intestinal worms, and parasites. Asafoetida is warm in nature, bitter, and pungent. Because of its potency, a little goes a long ways.\r\n\nDietary adjustments are often suggested with this complaint. An overindulgence of meats, starchy foods, dairy, or alcohol can lead to food stagnation. Eat three regular meals &leftpar;calmly sitting at a table and chewing well&rightpar;, organic fruits and vegetables, organic grains, and pure water help the digestive system to function properly. Take time to chew your food, not gulp, and allow adequate time for a relaxed meal. For better digestion, drink after a meal instead of during. Papaya is loaded with digestive enzymes. Eat a small serving of papaya after the main meal for one week to enhance the digestive enzymes.	external
32	Fire Water	Diabetes, Excess Appetite	28	Ingredients  &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nYarrow\t\t\tAchillea Millefolium\r\n\nElder Flowers\t\tSambucus Nigra\r\n\nCinnamon twig\tGui Zhi\r\n\nPeony\t\t\tBai Shao Yao\r\n\nBayberry\t\t\tMyrica Cerifera\r\n\nOak Bark\t\tQuercus Spp.\r\n\nGinger, dried\t\tGan Jiang\r\n\nLicorice, baked\tZhi Gan Cao\r\n\nJujube\t\t\tDa Zao\r\n\nOrange\t\t\tCitrus Sinensis\r\n\nPeppermint\t\tMentha Piperita\r\n\nCayenne\t\t\tCapsicum Annuum	Western Therapeutic Actions\r\n\nAnti-pyretic, anti-inflammatory, circulatory stimulant, warming, astringent, tonic, antiseptic, carminative, expectorant, and diaphoretic	Traditional Chinese Medicine\r\n\nReleases pathogenic influences from the muscle layer and regulates the nutritive and protective qi	Sample Indications\r\n\nFevers and chills unrelieved by sweating, influenza, aches and pains, headache, aversion to wind, stiff neck, and stuffy nose	Suggested Dosage\r\n\n1 teaspoon in HOT water to induce sweating. If the first cup is successful, do not repeat the dosage. If there is little sweating, repeat the dosage until sweating occurs. \r\n\nUsually the dosage does not need to be repeated more than 2 - 3 times. The patient should bundle up in a warm blanket, rest, and allow the sweating to happen. Once sweating starts, stop administering Fire Water.	Contraindications and Cautions\r\n\nDiscontinue the consumption of raw, cold, spicy, or greasy foods, coffee, and alcohol while taking this formula.	Notations \r\n\nMa Huang, in Oriental Medicine, is used to induce sweating. However, it was excluded from this formula because patients with weaker constitutions cannot tolerate it. Fire Water was designed to induce sweating without having to use this herb. \r\n\nThe nutritive qi and protective qi normally regulate each other. The protective qi guards the body from external influences &leftpar;virus, bacteria&rightpar; while the nutritive qi nourishes and stabilizes the interior. When the protective qi rises to fend off the attack, fever and chills are the results of this battle. The body is unable to protect the nutritive qi as it is using its energy fighting the external influence. As a consequence the nutritive qi becomes unstable and is unable to contain the fluids in the body. The slight sweating that is experienced is not strong enough to expel the external influences, so the condition does not improve. \r\n\nThis syndrome is considered wind/cold invading the body because there is usually no thirst. This pattern can also be experienced without an invasion of wind/cold, such as after a serious illness, childbirth, or a patient who has a constitutional weakness. \r\n\nThe predominant symptoms include a fever, aversion to the wind, and some sweating. The Chinese formula used for this syndrome is widely is called Gui Zhi Tang or Cinnamon Combination.	external
33	Flu Shield	Diabetes Excess Urination	28	Ingredients  &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nIsatis leaf\t\t\tDa Qing Ye\r\n\nLonicera\t\t\t\tJin Yin Hua\r\n\nForsythia\t\t\tLian Qiao\r\n\nOsha\t\t\t\tLigusticum Porteri\r\n\nPlatycodon\t\t\tJie Geng\r\n\nBurdock seed\t\tNiu Bang Zi\r\n\nSchizonepeta\t\t\tJing Jie\r\n\nEchinacea\t\t\tEchinacea Angustifolia\r\n\nPhragmites\t\t\tLu Gen\r\n\nWild Indigo\t\t\tQing Dai\r\n\nPoke Root\t\t\tPhytolacca Spp.\r\n\nGoldenseal\t\t\tHydrastis Canadensis\r\n\nLicorice\t\t\t\tGan Cao\r\n\nPeppermint\t\t\tBo He	Western Therapeutic Actions\r\n\nAnti-inflammatory, analgesic, diaphoretic, anti-pyretic, alterative, anti-viral, anti-bacterial, depurative, and antiseptic	Traditional Chinese Medicine\r\n\nDisperses wind/heat, clears heat, and relieves toxicity	Sample Indications\r\n\nProphylactic, early stages of influenza, colds, contagious diseases, viral or bacterial infections, sore throats, aches and pains, earaches, and swollen glands	Suggested Dosage\r\n\n1/2  1 teaspoon, in a small amount of water, \r\n\n3 times daily\r\n\nTake 1/2 teaspoon twice daily as a preventative\r\n\nVariation is according to individual symptoms\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nUse with caution during pregnancy.	Notations \r\n\nFlu Shield is a modified version of the Chinese classic, Yin Qiao San. Its effectiveness has proven itself for hundreds of years in eradicating common colds, flu and upper respiratory infections. It can be used at a low dosage for preventative measures.\r\n\nLonicera and Forsythia are two commonly used herbs in Oriental Medicine for treating contagious diseases, or what they term early-stage warm-febrile disease. A few years ago, China was experiencing a flu epidemic. During this time, Lonicera was almost impossible to purchase in America as the demand for it in China exhausted the supply. Native Americans chew on the roots of Osha and Echinacea during the onset of any contagious disease. In the West, Goldenseal has been revered as one of natures premier anti-infective herbs. In the East, Isatis holds that reverent position. Isatis root and Isatis leaf clear toxic/heat and cool the blood. Isatis root drains the heat. This makes it beneficial for damp/heat conditions such as jaundice. Burdock seed is a detoxicant and especially effective in treating the throat. Its actions of expelling wind/heat are supported by Peppermint. Schizonepeta expels wind/heat or wind/cold and its actions are enhanced by the other wind expelling herbs. Licorice, in combination with Platycodon, helps to relieve inflammations of the throat. Phragmites clears heat from the lungs, generates fluids, and is especially effective during the initial stages of a contagious disease. Wild Indigo and Poke root assist in detoxification and cleansing of the blood and lymph &leftpar;relieves fire toxicity and cools the blood&rightpar;.\r\n\nA soup made with chicken, onion, garlic, parsley, cayenne, and ginger is the home favorite during the flu season. Drink a bowl regularly for prevention and protect the neck from the winters wind. Increasing the intake of Vitamin C and other antioxidants is a wise decision during the flu season.	external
34	Growing Belly	Diabetes Excess Thirst	28	Ingredients  &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nRaspberry leaf\tRubus Idaeus\r\n\nPeony\t\t\tBai Shao Yao\r\n\nMotherwort\t\tLeonurus Cardiaca\r\n\nEucommia\t\tDu Zhong\r\n\nNettles\t\t\tUrtica Spp.\r\n\nChamomile, Roman\tAnthemis Nobilis\r\n\nAtractylodes\t\tBai Zhu\r\n\nCuscuta\t\t\tTu Si Zi\r\n\nScute\t\t\tHuang Qin\r\n\nBlack Haw\t\tViburnum Prunifolium\r\n\nGentian\t\t\tGentiana Lutea	Western Therapeutic Actions\r\n\nNutrient and nerve tonic, astringent, and antispasmodic	Traditional Chinese Medicine\r\n\nNourishes the blood, supports the spleen, clears heat, and calms a restless fetus	Sample Indications\r\n\nA mild acting tonic with nutritive qualities, specifically for the first and second trimester of pregnancy	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, \r\n\n3 times daily. \r\n\nTake during the first and second trimester of pregnancy\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nBleeding and spotting during pregnancy can be life threatening. If any health problems persist, seek the advice of a qualified health care practitioner.	Notations \r\n\nGrowing Belly is made upon request, to limit alcohol content. This formula is a mild tonic supporting the first and second trimester of a pregnancy. Women who experience miscarriages could benefit from this formula.\r\n\nRaspberry leaf is an astringent and uterine and reproductive restorative. It is one of the few botanicals that can be used during the entire length of a pregnancy. The two herbs, Raspberry leaf and Black Haw, work together to help prevent miscarriages. Motherwort is an anti-spasmodic and nervine. It has a calming effect on the spirit, similar to Roman Chamomile. Nettles is a blood tonic and support the nutritive Chinese herbs in this formula. The combination of the Chinese herbs, Peony, Eucommia, Atractylodes, Cuscuta, and Scute help to relax the liver, support the kidney and spleen, and secure the fetus. Gentian is a bitter tonic, supports the blood, and helps to alleviate fatigue. \r\n\nIt is important to remind the pregnant mother that her body has the higher intelligence and capacity to care for the unborn child in a good way. Taking a high quality multiple vitamin is recommended along with a highly nutritious diet. Equally important, the pregnant mother should avoid alcohol, tobacco, caffeine, and food preservatives to protect the unborn child from these harsh and toxic foods and chemicals. Prescription drugs can be harmful. \r\n\nHerbs should only be taken when under the supervision of a qualified health care practitioner. If a pregnant mother has any health concerns about a supplement or drug she has been prescribed, she should contact her health care provider immediately.	external
161	Comfort Remedy	Inflammation, Bruising, Pain	4	Ingredients  &leftpar;Homeopathic&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nSt. Johns Wort\t\tHypericum Perforatum\r\n\nArnica\t\t\t\tArnica Montana\r\n\nComfrey root\t\tSymphytum Officinale\r\n\nBryonia\t\t\t\tBryonia Dioica\r\n\nAconite\t\t\t\tAcontium Napellus\r\n\nGelsemium\t\t\tGelsemium Sempervirens\r\n\nStaphisagria\t\t\tDelphinium Staphisagria	Western Therapeutic Actions\r\n\nAnti-inflammatory, analgesic, anodyne, and antispasmodic	Traditional Chinese Medicine\r\n\nClears heat, disperses blood stasis, and alleviates pain	Sample Indications\r\n\nPain, inflammation, and general discomfort following surgery or traumatic injury	Suggested Dosage\r\n\n5 - 20 drops every 2 hours\r\n\nReduce dosage as the symptoms subside\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nThere are none known.	Notations \r\n\nComfort Remedy is a homeopathic remedy. Many people feel lousy after an operation because the anesthesia and surgery disrupted the energy flow patterns of the body. Acupuncture, Shiatsu, Tai Ji, and comprehensive herbal therapy assist in reestablishing the normal and healthy flow of blood and qi &leftpar;energy&rightpar; throughout the entire body. Comfort Remedy is beneficial following any injury or surgery as it supports the healing of the nerves and tissues, and is an anti-inflammatory. It shortens the recovery time and assists in the healing process.\r\n\nHomeopathic Properties\r\n\nSt. Johns Wort\tfor nerve injury and pain relief\r\n\nArnica\t\tafter all types of traumatic injury, falls, blows \r\n\nComfrey root\tknown as Knit Bone, stimulates the growth of \t\t\tbone, tissues and ulcerated surfaces\r\n\nBryonia\t\tmuscle aches and pains, stitching pain, worse \t\t\twith movement, better with rest\r\n\nAconite\t\tphysical and mental anxiety and fear, acute and \t\t\tsudden, does not want to be touched, inflamed\r\n\nGelsemium\tdesire to be quiet, left alone, restores the nerves\r\n\nStaphisagria \theals the pain from surgery or bodily insult\r\n\nHomeopathic remedies are extreme dilutions of different agents, some being herbs. The homeopathic properties are somewhat different than the properties of the full strength herbs. Because of their extremely diluted state, toxic herbs can be found and used in homeopathic pharmacies without any actual toxic effects and are completely safe.	external
36	Belly Be Gone	Chrons Disease	28	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nOats\t\t\tAvena Sativa\r\n\nRaspberry leaf\tRubus Idaeus\r\n\nTang Kuei\t\tDang Gui\r\n\nLeonurus\t\tYi Mu Cao\r\n\nAtractylodes\t\tBai Zhu\r\n\nSkullcap\t\t\tScutellaria Lateriflora\r\n\nRehmannia, prep.\tShu Di Huang\r\n\nHoelen\t\t\tFu Ling\r\n\nLindera\t\t\tWu Yao\r\n\nLadys Mantle\t\tAlchemilla Vulgaris\r\n\nFalse Unicorn\tChamaelirium Luteum\r\n\nGentian\t\t\tGentiana Lutea \r\n\nCitrus\t\t\tChen Pi\r\n\nLicorice, baked\tZhi Gan Cao	Western Therapeutic Actions\r\n\nPostpartum tonic, astringent, hormonal balancing, nerve tonic, antispasmodic, styptic, and general tonic	Traditional Chinese Medicine\r\n\nSupplements the qi, nourishes the blood, enriches the yin and yang, regulates the qi, and vitalizes the blood	Sample Indications\r\n\nTones the uterine muscles, fallen or collapsed uterus, postpartum exhaustion, depression, weak nutritional assimilation, and weak digestion	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nPostpartum difficulties are very common. Women who are depleted are very susceptible to physical and mental breakdowns. It is important to seek qualified help if any signs of difficulty arise.	Notations \r\n\nBelly Be Gone is made upon request to limit alcohol content. Cnidium and Rehmannia Combination, or Xiong Gui Tiao Xue Yin, was created during the Ming Dynasty, and sets the energetic tone and herbal pattern for our tailored formula. Belly Be Gone is a specific postpartum tonic as it restores balance to the hormones, brings health and vigor back to the mother, and helps prevent postpartum hemorrhaging. In some Chinese hospitals, women are given an herb tea made from Leonurus &leftpar;Yi Mu Cao&rightpar; following childbirth to help the uterus contract and to stop excess bleeding. Leonurus is an important addition to this formula because of this time proven practice.\r\n\nOats is a total body restorative as it nourishes and fortifies the blood and qi. Raspberry leaf is an astringent, arrests bleeding, and a reproductive restorative that benefits the uterus.  Ladys Mantle supports Leonurus with its styptic qualities.  Tang Kuei and Rehmannia nourish the blood. Atractylodes, Hoelen, Ginger, and Licorice supplement the spleen and stomach. Skullcap relieves liver stagnation, spasms, insomnia, and agitation. \r\n\nA pregnant woman is nourishing two humans, herself and the fetus. This extra demand on the mothers body can make her blood weak and her qi depleted. Postpartum difficulties may arise because the mother can not hold it together anymore due to her exhaustion. Replenishing that which has been given away is critical at this time in order to prevent any further deterioration of her physical and mental health. It is wise to heed to the old adage, an ounce of prevention is worth a ton of salt.	external
39	GI Corrective	Bloating Constipation	28	Ingredients  &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nMarshmallow\t\t    Althea Officinalis\r\n\nCannabis seed\t    Huo Ma Ren\r\n\nHo Shou Wu\t\t    He Shou Wu\r\n\nMagnolia bark\t    Hou Po\r\n\nYellow Dock\t\t    Rumex Crispus\r\n\nApricot seed\t\t    Xing Ren\r\n\nPeony\t\t\t    Bai Shao Yao\r\n\nChih-Shih\t\t    Zhi Shi\r\n\nSkullcap\t\t\t    Scutellaria Lateriflora\r\n\nRhubarb\t\t\t    Da Huang\r\n\nCascara Sagrada\t    Rhamnus Purshiana\r\n\nDandelion\t\t    Pu Gong Ying\r\n\nAloe Vera\t\t    Lu Hui	Western Therapeutic Actions\r\n\nHepatic, cholagogue, demulcent, emollient, nervine, detergent, and aperient	Traditional Chinese Medicine\r\n\nMoistens the intestines, drains heat, promotes the movement of qi &leftpar;unblocks the bowels&rightpar;,  and nourishes the yin	Sample Indications\r\n\nSluggish bowel function, habitual constipation, dry stool, and irregular bowel movements	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nContraindicated during pregnancy. GI Corrective is draining and purging in nature, so use with caution for patients who are weak or depleted.	Notations\r\n\nGI Corrective utilizes Western herbs with the Chinese formula, Ma Zi Ren Wan or Hemp Seed Pill. GI Corrective is a mild laxative and can be used safely by the young or the old. Constipation can be caused by a number of different factors. GI Corrective focuses on heat-induced dryness in the stomach and the intestines. In Oriental Medicine, when the stomach becomes overly heated for extended periods of time, the heat disrupts the ability of the spleen to disperse the fluids properly. This disruption in the movement of fluids leads to dry intestines and constipation. \r\n\nMarshmallow root contains a large amount of mucilage so it is able to moisten the digestive tissues  and reduce gastric hyperacidity &leftpar;clears stomach fire&rightpar;. Heat-treated Cannabis seed is excellent for moistening the intestines and unblocking the bowels. Ho Shou Wu and Peony moisten and nourish the blood. Rhubarb, Chih-shih, and Magnolia bark are commonly used together for purging the intestines. Yellow Dock is a bitter digestive stimulant that relieves stagnation and promotes elimination. Apricot seed is rich in oils and moistens the intestines. Skullcap is a relaxant and relieves constrained liver qi.\r\n\nThe way in which herbs are prepared can significantly change their actions. Aloe Vera, when used in an extraction, is a strong purgative. Aloe Vera, when used as a raw gel, soothes inflammations and clears surface heat. \r\n\nDrinking a glass of warm honey water every morning upon rising is an excellent home remedy. Honey redirects the energy downwards. This is why it is used for coughs. It is important to support the client with herbal formulas that address blood and yin deficiency as a follow-up to using GI Corrective.\r\n\nü	external
40	GI Mend	Stomach Ulcer	28	Ingredients  &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nMarshmallow\t\t\tAlthea Officinalis\r\n\nAtractylodes\t\t\tBai Zhu\r\n\nSlippery Elm \t\t\tUlmus Fulva\r\n\nGinseng, Chinese\t\tJi Lin Ren Shen\r\n\nSkullcap\t\t\t\tScutellaria Lateriflora\r\n\nEchinacea\t\t\tEchinacea Angustifolia\r\n\nDioscorea\t\t\tShan Yao\r\n\nLotus Seed\t\t\tLian Zi\r\n\nDolichos\t\t\t\tBai Bian Dou\r\n\nPlatycodon\t\t\tJie Geng\r\n\nGoldenseal\t\t\tHydrastis Canadensis\r\n\nPoke Root\t\t\tPhytolacca Spp.\r\n\nCranesbill, American\tGeranium Maculatum\r\n\nLicorice, baked\t\tZhi Gan Cao\r\n\nGinger, fresh\t\t\tSheng Jiang	Western Therapeutic Actions\r\n\nSoothing, demulcent, anti-bacterial, anti-viral, astringent, emollient, alterative, antiseptic, and styptic	Traditional Chinese Medicine\r\n\nSupports the spleen and stomach qi, supplements the qi, and dries dampness	Sample Indications\r\n\nStomach and duodenal ulcers, chronic gastritis, chronic colitis, diarrhea with watery stool, gastric hyperacidity, nausea and vomiting, lack of appetite, and abdominal pain	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nContraindicated during pregnancy and in cases of high fever, heat from deficiency, or a combination of heat, thirst, and irritability. Absence of thirst is a clear marker for interior cold.	Notations\r\n\nIn combination with traditional Western specifics and the adapted Chinese formula, Li Zhong Wan or Regulate the Middle Pill, GI Mend  addresses the digestive disturbances caused by a chronic cold interior condition. In Oriental Medicine, when cold attacks the middle burner &leftpar;stomach and spleen&rightpar;, digestive problems will follow. If the middle burner is not warmed up, this cold will congeal, much like water, and turn into ice. As a consequence, the normal movement of the fluids, which is regulated by the spleen, will be disrupted. Overtime, cold creates stagnation and turns into its opposite, heat. Similar to going outside in the winter when it is freezing cold out and at first you are shivering to the bone. Then, out of nowhere, you become warm. This is the same principle applied to the heat that now occupies the stomach: anything when taken to its extreme &leftpar;cold&rightpar; will convert into its opposite &leftpar;heat&rightpar;. \r\n\nMarshmallow and Slippery Elm coat the stomach lining with mucilage, relieving it from dryness and gastric ulceration. Skullcap stimulates digestion, relieves liver and stomach stagnation, and calms the nerves. Ginseng, Atractylodes, Dioscorea, Ginger, and Licorice warm and nourish the middle burner. Poke Root reduces gastric hyperacidity and clears heat. Goldenseal, containing the powerful alkaloid, berberine, is a premier decongestant. This means that it can vitalize the circulation and resolve chronic stagnation, whether it is vascular or digestive. Goldenseal, Poke root, and Echinacea combine to strengthen the cellular tissues that line the mucous membranes. Cranesbill, classified as an astringent with mucostatic and hemostatic properties, benefits damp/cold conditions of the digestive system with symptoms such as diarrhea, peptic and bleeding ulcers, gastric hyperacidity, and hemorrhoids.	external
41	GI Movement	Acute Constipation	29	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nMarshmallow\t\t\tAlthea Officinalis\r\n\nMagnolia bark\t\tHou Po\r\n\nChih-Shih\t\t\tZhi Shi\r\n\nHo Shou Wu\t\t\tHe Shou Wu\r\n\nRhubarb\t\t\t\tDa Huang\r\n\nCascara Sagrada\t\tRhamnus Purshiana\r\n\nAloe Vera\t\t\tLu Hui\r\n\nSenna\t\t\t\tSenna Angustifolia\r\n\nDandelion\t\t\tPu Gong Ying\r\n\nMandrake, American\tPodophyllum Peltatum	Western Therapeutic Actions\r\n\nQuick acting purgative, aperient, cholagogue, demulcent, and emollient	Traditional Chinese Medicine\r\n\nPurges heat accumulation, drains qi downward, and promotes the movement of qi	Sample Indications\r\n\nSevere constipation and flatulence, abdominal fullness, and abdominal pain with pressure	Suggested Dosage\r\n\n10 - 30 drops, in a small of water, \r\n\n1 - 3 times daily\r\n\nDiscontinue use once the stools have been eliminated.\r\n\nAddressing the underlying cause for constipation should follow this short term treatment. Consider herbal formulas that are moistening in nature, nourishing to the blood and yin, and supplement the spleen qi.\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nContraindicated during pregnancy. For weak patients, use with caution and then with additional tonic herbs.\r\n\nThis remedy is for short term use only.	Notations\r\n\nGI Movement treats heat that has accumulated in the center and injured the fluids of the digestive tract. The excess heat creates a dry stool. There are four types of abdominal disharmony in Oriental Medicine: focal distention &leftpar;sensation of obstruction&rightpar;, fullness &leftpar;visible distention&rightpar;, dryness &leftpar;dry stool causing abdominal tenseness&rightpar;, and hardness &leftpar;abdominal pain that increases with pressure&rightpar;. \r\n\nThe Oriental Medicine theory is to treat the internal excess with purging actions, and the excess heat with cooling actions. GI Movement utilizes traditional Western specifics along with a Chinese formula called, Hou Po San Wu Tang or Three Substance Decoction with Magnolia Bark, to harmonize these energetic imbalances.\r\n\nMarshmallow root  moistens and soothes the mucous membranes, and relieves digestive inflammations. Magnolia bark, and Chih-Shih resolve the qi stagnation and moves the qi downward. Ho Shou Wu, a blood tonic, moistens the intestines and helps to move the bowels. Rhubarb, a bitter and cooling herb, drains heat and purges accumulations. Cascara Sagrada and Aloe Vera, considered by some herbalists to be a bit milder in action than Rhubarb and Senna, help to drain accumulation and are considered laxatives. Dandelion promotes the flow of bile and is a digestive stimulant. American Mandrake is a purgative, anti-bilious, and helps to relieve liver stagnation.	external
42	GI Soothe	Bowel Irregularity	28	Ingredients Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nAtractylodes\t\t\tBai Zhu\r\n\nGinseng, Chinese\t\tJi Lin Ren Shen\r\n\nHoelen\t\t\t\tFu Ling\r\n\nMarshmallow\t\t\tAlthea Officinalis\r\n\nPeony\t\t\t\tBai Shao Yao\r\n\nSkullcap\t\t\t\tScutellaria Lateriflora\r\n\nMeadowsweet\t\tFilipendula Ulmaria\r\n\nSlippery Elm \t\t\tUlmus Fulva\r\n\nCorydalis\t\t\tYan Hu Suo\r\n\nMume\t\t\t\tWu Mei\r\n\nSaussurea\t\t\tMu Xiang\r\n\nPseudoginseng\t\tTien Chi\r\n\nLicorice, baked\t\tZhi Gan Cao\r\n\nGinger, dried\t\t\tGan Jiang\r\n\nGoldenseal\t\t\tHydrastis Canadensis\r\n\nBryonia\t\t\t\tBryonia Dioica	Western Therapeutic Actions\r\n\nAntispasmodic, demulcent, anti-inflammatory, anodyne, nervine, emollient, antiseptic, astringent, and antacid	Traditional Chinese Medicine\r\n\nSupplements the qi of the middle burner, binds up the intestines and stops diarrhea, drains dampness, absorbs seepage, and promotes the movement of qi	Sample Indications\r\n\nUlcerative colitis, irritable bowel syndrome, leaky gut syndrome, Crohns disease, chronic inflammatory intestinal disorders, and colic	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms\r\n\nü	Contraindications and Cautions\r\n\nContraindicated for fever, heat from deficiency, or a combination of heat, thirst, and irritability.	Notations\r\n\nGI Soothe combines Western specifics with a Chinese clinical formula, Jian Pi Ling or Strengthen the Spleen Remedy, which is derived from a classic formula, Bu Zhong Yi Qi Wan. Disorders such as ulcerative colitis and irritable bowel syndrome are experienced when there has been chronic weakness in the digestive system. There are many possible causes: inherited weaknesses, chronic bacterial infections, autoimmune diseases, poor eating habits and food choices, or chronic stress and worry warts. \r\n\nIn Oriental Medicine the spleen controls the digestive system, holds things in their proper place, and assists nutritional assimilation. The spleen influences the stomach, and the large and small intestines. The Earth, in the Five Phases Theory, is represented by the spleen and stomach and their meridian channels. This element assists transitions, whether they be internal or external, such as the transition from night into day, spring into summer, or life style changes. People who have difficulty making transitions in life or digesting life can benefit from herbal formulas like the Eight Wise Ones or Spleen Abundant Life. These formulas have the ability to strengthen the spleen and stomach. \r\n\nHealing our digestive system requires a gentle process filled with kindness, acknowledgment, and encouragement. Good nutritional and eating habits, a healthy emotional state of mind, and living with a spiritual practice, assist in maintaining the inner health of the body. \r\n\nHealing touch with body work reaps great rewards, and is a healthy way to release lifes tensions and help open the opportunities to experience the sweetness of life.	external
43	Hep C Clear	Hepatitis C	30	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nOldenlandia\t\t\tBai Hua She She Cao\r\n\nCapillaris\t\t\tYin Chen Hao\r\n\nSalvia\t\t\t\tDan Shen\r\n\nEclipta\t\t\t\tHan Lian Cao\r\n\nGuduchi\t\t\t\tTinospora Cordifolia\r\n\nAstragalus\t\t\tHuang Qi\r\n\nPeony, red\t\t\tChi Shao Yao\r\n\nParis\t\t\t\tZao Xiu\r\n\nTurmeric\t\t\tCurcuma Longa\r\n\nAtractylodes\t\t\tBai Zhu\r\n\nGinseng, Siberian\t\tCi Wu Jia\r\n\nMilk Thistle\t\t\tSilybum Marianum\r\n\nLigustrum\t\t\tNu Zhen Zi\r\n\nSchizandra\t\t\tWu Wei Zi\r\n\nPeach Leaf\t\t\tPrunus Persica \r\n\nFringe Tree Bark\t\tCheonanthus Virginicus\r\n\nLicorice, baked\t\tZhi Gan Cao	Western Therapeutic Actions\r\n\nDetoxicant, decongestant, demulcent, restorative, anti-viral, cholagogue, and hepatic tonic	Traditional Chinese Medicine\r\n\nClears damp/heat, clears heat, relieves toxicity, breaks up the stagnant qi and disperses blood stasis, supports the spleen, supplements the qi, and nourishes the liver and kidney yin	Sample Indications\r\n\nHepatitis C, chronic viral infections, liver diseases, and cirrhosis of the liver	Suggested Dosage\r\n\n1  2 teaspoons, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nConsult a qualified health care practitioner for all serious liver disorders. If a patient is receiving interferon treatments for Hepatitis C, relying upon multiple drug therapies, or has a low platelet count, Hep C Clear and Hepato Clear should not be used because of the possibility of contracting interstitial pneumonia. The reason for this is still unknown.	Notations\r\n\nThe Institute of Traditional Medicine published a report on some of the herbal formulas being used in China to treat this disorder. The formula that was reported to be most effective is called Qing Tui Fang. Hep C Clear is a modified version of the original formula. Capillaris, similar to Bupleurum, is less drying and gentler on the liver. Eclipta and Ligustrum combine well together to nourish the liver. Oldenlandia and Paris are strong anti-viral agents. Guduchi and Turmeric, Ayurvedic herbs, are well known for their ability to clear liver toxicity. Salvia and Red Peony invigorate the blood and alleviate blood stasis. Milk Thistle, Peach leaf, and Fringe Tree Bark are blood and liver purifiers. Astragalus, Atractylodes, Ginseng, and Licorice support the spleen and supplement the qi. \r\n\nA holistic approach supports the healing of liver disorders. This includes dietary guidelines, emotional balancing, and encouragement to develop a spiritual practice. Acupuncture and Shiatsu support the healing process. When all the different modalities are integrated into a persons wellness program, the opportunity for healing is greatly enhanced. It is recommended that all herbal therapies be stopped during interferon treatments. Antioxidants, B complex, Vitamin E, and a cleansing diet support the body during interferon treatments. \r\n\nJuicing is highly recommended. A good combination includes carrots, beets, cucumber, celery, garlic, and barley grass. Adding some olive oil is very healing to the liver, as is fish oil.	external
44	Hepato Clear	Liver Cleanser	28	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nCodonopsis\t\t\tDang Shen\r\n\nBupleurum\t\t\tChai Hu \r\n\nPeony\t\t\t\tBai Shao Yao\r\n\nCyperus\t\t\t\tXiang Fu\r\n\nScute\t\t\t\tHuang Qin\r\n\nPinellia\t\t\t\tBan Xia\r\n\nLicorice, baked\t\tZhi Gan Cao\r\n\nGinger, fresh\t\t\tSheng Jiang \r\n\nMilk Thistle\t\t\tSilybum Marianum\r\n\nWild Yam\t\t\tDioscorea Villosa\r\n\nPeach Leaf\t\t\tPrunus Persica \r\n\nFennel\t\t\t\tFoeniculum Vulgare\r\n\nCelandine, Greater\tChelidonium Majus \r\n\nWahoo\t\t\t\tEuonymus Atropurpureus	Western Therapeutic Actions\r\n\nCholalogogue, hepatic, digestive, antispasmodic, carminative, aromatic, and alterative	Traditional Chinese Medicine\r\n\nRegulates the liver qi, harmonizes the liver and spleen, releases lesser yang-stage disorders, and promotes the smooth flow of qi	Sample Indications\r\n\nDigestive disturbances, liver and/or gallbladder pain, sour stomach, gallstones, jaundice, acute viral hepatitis, cirrhosis, common cold with lingering fever, cholesterol, and headaches	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nCleansing the liver, may in some cases, cause temporary nausea, irritability and alternating fever and chills. If this occurs, the dosage may be reduced. If a patient is receiving interferon treatments for Hepatitis C, relying upon multiple drug therapies, or has a low platelet count, Hepato Clear should not be used.	Notations\r\n\nHepato Clear is a liver and gall bladder tonic with a broad range of healing possibilities. It promotes the opening of the liver and the flow of bile via the gall bladder ducts and relaxes the muscle and tissue membranes, which alleviates painful spasms. Hepato Clear can help heal toxic liver damage and protect against toxic liver agents. The Chinese herbs used in this formula have been used as folk medicine for generations and is known as Xiao Chai Hu Tang or Minor Bupleurum Decoction. Chinese physicians used this formula extensively for treating lesser yang stage disorders. Lesser yang stage disorders are thought to be half-exterior and half-interior. Classical symptoms include one of the following: alternating fever and chills, bitter or sour taste in the mouth, dry throat, or a sensation of fullness in the chest &leftpar;difficult to take a full breath&rightpar;. The gall bladder can be affected by this disorder and can include one of the following symptoms: nausea, vomiting, heartburn, and reduced appetite. \r\n\nCodonopsis is a gentle qi tonic and supports the spleen. Bupleurum releases the qi constrained in the liver and helps to harmonize the liver and spleen when used with the appropriate herbs as in this formula, specifically; Peony, Cyperus, Scute, Pinellia, Licorice, and Ginger. Milk Thistle protects the cells of the liver, a liver decongestant, and is an important herb for liver disorders. Wild Yam relieves constrained qi in the liver, reduces spasmodic cramping, and harmonizes the liver and spleen. Peach leaf and Wahoo are liver decongestants. Fennel supports digestion. Celandine promotes bile production, the detoxification of the liver, and clears the gallbladder.	external
45	Candida Clear	Irritable Bowel Syndrome	28	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nPhellodendron\tHuang Bai\r\n\nPulsatilla\t\tBai Tou Weng\r\n\nMarshmallow\t\tAlthea Officinalis\r\n\nCnidium seed\tChe Chuang Zi\r\n\nHouttuynia\t\tYu Xing Cao\r\n\nCodonopsis\t\tDang Shen\r\n\nMeadowsweet\tFilipendula Ulmaria\r\n\nAtractylodes, red\tCang Zhu\r\n\nCalendula\t\tCalendula Officinalis\r\n\nHoropito\t\tPseudowintera Colorata\r\n\nHoelen\t\t\tFu Ling\r\n\nEuryales\t\t\tQian Shi\r\n\nGoldenseal\t\tHydrastis Canadensis\r\n\nSaussurea\t\tMu Xiang\r\n\nLicorice, baked\tZhi Gan Cao\r\n\nAsafoetida\t\tFerula Asafoetida	Western Therapeutic Actions\r\n\nDemulcent, emollient, alterative, detergent, and anti-fungal\r\n\n l	Traditional Chinese Medicine\r\n\nSupports the spleen, supplements the qi, clears heat, and dries dampness	Sample Indications\r\n\nCandida, yeast / fungal outbreak of the digestive tract &leftpar;can include fatigue, headaches, foggy brain, and muscular aches and pains&rightpar;, thrush, leaky gut syndrome, and food allergies	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, \r\n\n3 times daily	Contraindications and Cautions\r\n\nContraindicated during pregnancy.	Notations \r\n\nA weak digestive system can lead to many types of disorders and inflammations. Candida is an overgrowth of yeast, Candida Albicans, usually due to a weakened immune system, excessive use of antibiotics, or lack of beneficial bacteria in the gut. The overgrowth of yeast can travel to other parts of the body including the esophagus, the mouth, and the genital tract. \r\n\nYeast requires moisture and heat to thrive. Oriental Medicine considers candida a damp/heat syndrome. Herbs that treat damp/heat lay the foundation for Candida Clear. An herb that is of particular value in this formula is Horopito. The Maori have used this herb extensively for yeast and fungal infections, whether they be internal or external. Phellodendron drains damp/heat and Pulsatilla clears heat and toxicity. Marshmallow protects the mucous membranes of the digestive tract and helps to relieve the inflammation. Cnidium seed dries the excess dampness. Meadowsweet is an ideal herb for balancing the pH of the body. Asafoetida, from India, relieves food stagnation, bloating, and has anti-spasmodic qualities. It is used as a digestive stimulant, for people who have food allergies, and candida. Goldenseal is and anti-inflammatory and clears damp/heat from the digestive tract.\r\n\nYeast feeds off sugar. All types of sugars, including fruit sugars should be eliminated from the diet. Yeast breads and all other yeast products should be temporarily eliminated from the diet. Dairy products, unless organic, feed yeast growth. Probiotics is a beneficial supplement. Lactobacillus Acidophilus rebuilds healthy flora and enhances the immune system. Alkalizing the ph of the body is beneficial and can be done by eating bitter greens daily, seaweed, and miso soup. Add some Oregano to some prepared dishes throughout the week. It has anti-fungal qualities.\r\n\nWith perseverance, this debilitating disorder can be healed.	external
46	Montezuma Match	Vomiting And Diarrhea	29	Ingredients&leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nBlackberry root\t   Rubus Villosus \r\n\nPurslane\t\t\t   Ma Qi Xian\r\n\nMeadowsweet\t   Filipendula Ulmaria\r\n\nCoptis\t\t\t   Huang Lian\r\n\nScute\t\t           Huang Qin\r\n\nSaussurea\t\t   Mu Xiang\r\n\nEchinacea\t\t   Echinacea Angustifolia\r\n\nKoromiko\t\t   Hebe Salicifolia\r\n\nWild Indigo\t\t   Qing Dai\r\n\nWild Yam\t\t   Dioscorea Villosa\r\n\nIpecacuanha\t\t   Cephaelis Ipecacuanha	Western Therapeutic Actions\r\n\nAnti-viral, anti-bacterial, anti-amoebic, anti-inflammatory, antispasmodic, astringent, antacid, alterative, and carminative	Traditional Chinese Medicine\r\n\nClears heat, relieves fire toxicity, cools the blood, and drains damp/heat	Sample Indications\r\n\nDiarrhea and vomiting, and all types of dysentery	Suggested Dosage\r\n\n10 - 20 drops, in a small amount of water, \r\n\n3 times daily \r\n\nRepeat every 1 - 2 hours if needed\r\n\nVariation is according to individual symptoms	Contraindication and Cautions\r\n\nContraindicated during pregnancy. Use with caution in cases of cold/deficient spleen and stomach.	Notations\r\n\nBlackberry root is a premier astringent, especially useful when diarrhea is present. Purslane relieves fire toxicity found in dysenteric disorders, especially when due to bacterial infestations. Meadowsweet supports Blackberry root with its astringent qualities and is a digestive aromatic. Coptis and Scute support Purslane by clearing additional damp/heat. Saussurea supports the normalization of the digestive functions. Echinacea counters the bacterial infection, if any. Koromiko, a Maori herb, is a blood purifier, promotes bile production, and is an astringent. Wild Indigo clears heat and relieves toxicity and is supportive of Echinacea. Wild Yam helps to alleviate cramps and intestinal spasms. Ipecacuanha, in minute dosages, is an anti-emetic.  \r\n\nMovement Makes Worse can be beneficial if the diarrhea or vomiting is persistent and stubborn. If the digestive tract and bowels continue to be irritable following an infection, GI Soothe or Slippery Elm Food help to normalize the stool. After this type of infection it may be useful to follow-up with a general tonic if there is any weakness or fatigue, along with a probiotic; Chi Rebound, Spleen Abundant Life, or Immuno Rebound could be considered\r\n\nMontezuma Match may be taken as a preventative when traveling to foreign countries where the water and food could be contaminated. As a preventative, take 10 drops, 3 times daily. Drink bottled water. Wash all fruits and vegetables in a bowl of bottled water and a pinch of vinegar. This eliminates any bacterial contamination on the produce.	external
47	Slippery Elm Food	Heals Digestive Tissues, Ulcers	31	Ingredients&leftpar;Herbal powders&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nSlippery Elm\t\tUlmus Fulva\r\n\nArrowroot\t\tMaranta Arundinacea	Western Therapeutic Actions\r\n\nInflammation of the digestive tract, duodenal and stomach \r\n\nulcers, colitis, and ulcerative colitis	Traditional Chinese Medicine\r\n\nNourishes the stomach yin, clears heat, and generates fluids	Sample Indications\r\n\nInflammation of the digestive tract, duodenal and stomach \r\n\nulcers, colitis, and ulcerative colitis	Suggested Dosage\r\n\n1/2 - 1 teaspoon, mixed in a small amount of water, 3 times daily\r\n\nVariation is according to individual symptoms\r\n\nü	Contraindications and Cautions\r\n\nIf the individual is sensitive to lactose, Slippery Elm Soy Powder is the appropriate alternative.	Notations\r\n\nSlippery Elm Powder soothes and promotes healing to the internal mucous membranes that it comes into contact with. It is easily digested by even the weakest of digestive systems, the frail, and the malnourished. Slippery Elm will improve nourishment and impart strength to anyone who ingests it. \r\n\nSlippery Elm makes one of the finest poultices of all the botanicals. It treats inflamed tissues, ulcers, wounds, burns, boils, and all skin disorders. Slippery Elm soothes the tissues, reduces the inflammation, and promotes healing of the mucous membranes. \r\n\nNutritionally, Slippery Elm is equal to oatmeal and can be used for sickly infants, the nutritionally impaired, and those suffering from weight loss due to illness. It is a demulcent, emollient, diuretic, and pectoral. Because of its moistening qualities and soothing effect on inflamed digestive tissues, Slippery Elm functions in a similar manner to the Chinese herb, Dendrobium &leftpar;Shi Hu&rightpar;. Arrowroot is a nutritive and demulcent, supporting Slippery Elm in this formula.	external
187	Milk Drops	\N	7	Ingredients &leftpar;Herbal Extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nHoly Thistle\t  Cnicus Benedictus\r\n\nSkullcap\t\t  Scutellaria Lateriflora\r\n\nShatavari\t  Asparagus racemosa\r\n\nAstragalus\t  Huang Qi\r\n\nTang Kuei\t  Dang Gui\r\n\nSesame seed\t  Hei Zhi Ma\r\n\nGoats Rue\t  Galega Officinalis\r\n\nFennel\t\t  Foeniculum Vulgare\r\n\nGinger, fresh\t  Sheng Jiang	Western Therapeutic Actions\r\n\nGalactagogue &leftpar;milk promoting&rightpar;, nervine, carminative, and stomachic	Traditional Chinese Medicine\r\n\nPromotes lactation and unblocks the blood vessels, nourishes the blood, and supplements the qi	Sample Indications\r\n\nLack of milk production following childbirth	Suggested Dosage\r\n\n5 - 20 drops, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nThere are none known.	Notations \r\n\nMilk Drops benefit Mothers who are having a difficult time producing enough milk for their newborn infant. Holy Thistle, Goats Rue, and Fennel are time proven galactagogues. Skullcap, a relaxant, relieves qi congestion in the chest area. Shatavari is a female hormone balancer and stabilizer. Astragalus and Tang Kuei combine together to promote the production of fluids. Sesame seed nourishes the liver and kidneys and promotes lactation. Fennel and Ginger, warm in nature, promote the smooth functioning of the stomach.\r\n\nFor breast congestion and pain, a *Chamomile fomentation may be applied to the affected area, as well as taken as a tea. \r\n\nChamomile Fomentation: Infuse 1 oz of Chamomile flowers in a pint of boiling water; wet small cloth, and apply as hot as can be tolerated onto the breast, cover with a dry towel, repeat as needed. \r\n\nTaken internally as a tea: \r\n\n1 tablespoonful per teapot, drink a cupful 3 - 5 times daily.\r\n\n*Chamomile fomentation: See External Applications	internal
48	Stomach Ease	Nausea Motion Sickness	29	Ingredients&leftpar;Homeopathic&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nIpecacuanha\t\tCephaelis Ipecacuanha	Western Therapeutic Actions\r\n\nAnti-nauseant and specific		Sample Indications\r\n\nNausea, vomiting, motion sickness, morning sickness, dyspepsia, and colic	Suggested Dosage\r\n\n5 -15 drops, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms\r\n\nü	Contraindications and Cautions\r\n\nThere are none known.	Notations\r\n\nStomach Ease is a homeopathic remedy. \r\n\nThere are two types of Ipecac preparations:\r\n\nStandard: The Portuguese, who had invaded South America, were shown the medicinal value of this herb by the friendly indigenous peoples who had inhabited that territory for generations. The Portuguese saw how it would make people vomit and named it Caephalis Ipecacuanha, meaning sick-making plant. Ipecacuanha is made into a syrup and used in allopathic medical practice to induce vomiting in case of accidental poisoning. The substance in Ipecac, called cephaeline, irritates the stomach and causes vomiting. Syrup of Ipecac is considered a safe drug to treat poisoning and is often very effective.\r\n\nHomeopathic remedy: Ipecacuanha is a homeopathic remedy made from Ipecac by a process of dilution and succussion &leftpar;shaking&rightpar;. In contrast to syrup of Ipecac, it is given to relieve vomiting. In a homeopathic preparation, Ipecac works in just the opposite direction as the standardized preparation.\r\n\nNausea can be caused by a cold condition of the stomach. Ginger, Cardamon, or Fennel tea can be helpful as they are warming to the digestive system. Avoiding raw or fried foods, cold liquids and sweets will help the stomach. Rebuild the strength of the stomach by eating a warm breakfast, such as cooked cereal, cooked apples, or miso soup. For an acidic stomach, lemon juice has an alkalizing effect on the pH of the body. Eating small regular meals in a calm setting and chewing the food well is helpful to those who suffer from a weak digestive system.	external
49	Baby Belly	Baby Colic	29	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nFennel\t\t\tFoeniculum Vulgare\r\n\nMeadowsweet\tFilipendula Ulmaria\r\n\nWild Yam\t\tDioscorea Villosa	Western Therapeutic Actions\r\n\nCarminative, antispasmodic, anti-bilious, and digestive	Traditional Chinese Medicine\r\n\nSupplements the stomach qi and regulates the middle burner	Sample Indications\r\n\nAcute baby colic and tummy upset	Suggested Dosage\r\n\n5 - 15 Drops, in a small amount of water, \r\n\n3 times daily \r\n\nThis formula can be administered in a baby's formula bottle or on its own.\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nThere are none known. Baby Belly can be used by all ages.	Notations \r\n\nBaby Belly is made upon request, with no alcohol. Baby Belly has been used as a curative and as a preventative to help maintain healthy digestion in infants. If the infant is breast fed, the mother should avoid heavy rich foods, spices, and foods that may cause gas &leftpar;cabbage family or beans&rightpar;. The mother should eat in a calm setting and reduce her own stress level.  A gentle massage along both sides of the spine of the baby &leftpar;bladder meridian&rightpar; and down the stomach meridian has cured many difficult cases.\r\n\nFennel has a broad range of functions and is supportive to the digestive, respiratory, and renal systems. Fennel is a warm digestive and carminative and its gentle nature makes it suitable for children. Meadowsweet, well-suited for the young, elderly, and those with sensitive stomachs, counteracts gastric acidity and soothes any inflammation of the digestive tract. Wild Yam harmonizes the middle burner &leftpar;liver/spleen&rightpar; and is a digestive relaxant. It benefits digestive disturbances such as colic, irritable bowel syndrome, stomach cramps and spasms.\r\n\nMeal time is prayer time, a time to give thanks, gratitude, and appreciation for everyone who prepared the meal. A teaching given from the Oneida Tradition states that when we pray before our meals and offer food to the ancestors, our children and the future generations will never go hungry.	external
51	Baby Fire Drops	Baby / Child Fever	29	Ingredients &leftpar;Homeopathic&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nAconite\t\t\tAcontium Napellus\r\n\nBryonia\t\t\tBryonia Dioica\r\n\nGelsemium\t\tGelsemium Sempervirens\r\n\nBelladonna\t\tAtropa Belladonna	Western Therapeutic Actions\r\n\nAntipyretic, anti-inflammatory, and analgesic	Traditional Chinese Medicine\r\n\nClears heat, relieves toxicity, and dispels wind	Sample Indications\r\n\nFever and feverish conditions from any cause &leftpar;such as coughs, colds, flu, teething, or earache&rightpar;	Suggested Dosage\r\n\n5 - 20 drops, in a small amount of water, every 30 minutes\r\n\nReduce frequency of dose as the fever subsides and a normal temperature is restored.\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nBaby Fire Drops is intended for short term use only. Fever may be a sign of a serious illness, if symptoms persist seek professional medical advice.	Notations \r\n\nBaby Fire Drops is a homeopathic remedy and is made upon request, with no alcohol. Use Jade Screen Defense after the fever/infection has cleared or for recurring colds/infections.\r\n\nHomeopathic Properties\r\n\nAconite\t\tanti-inflammatory, symptoms that have sudden \t\t\tonset with fever, anguish of body and mind\r\n\nBryonia\t\taches and pains in various muscles, irritable\r\n\nGelsemium\tsymptoms that have hot, flushed face, desires to \t\tbe left alone, sore throat, tonsillitis\r\n\nBelladonna\tsymptoms that have hot, red skin, flushed face, \t\t\tthrobbing and burning\r\n\nA *Tofu Plaster applied to the forehead is an excellent home remedy in bringing down fevers. Give the baby plenty of fluids during feverish conditions.\r\n\n*Tofu Plaster: See External Applications	external
52	Baby Fire Powder	Baby / Child Fever	33	Ingredients \r\n\n&leftpar;Homeopathic Biochemic Tissue Salts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nFerrum Phosphate\r\n\nMagnesium Phosphate\r\n\nCalcium Phosphate\r\n\nPotassium Chloride	Western Therapeutic Actions\r\n\nAntipyretic, nutritive, antispasmodic, decongestant and analgesic	Traditional Chinese Medicine\r\n\nClears heat, relieves toxicity, and dispels wind	Sample Indications\r\n\nFever and feverish conditions from any cause &leftpar;such as coughs, colds, flu, teething, or earache&rightpar;	Suggested Dosage\r\n\nDissolve 1/4 teaspoon of powder, directly on the tongue, every 30 minutes \r\n\nReduce the frequency of dose as the fever subsides and a normal temperature is restored.	Contraindications and Cautions\r\n\nBaby Fire Powder is intended for short term use only. Fever may be a sign of a serious illness, if symptoms persist seek professional medical advice.	Notations \r\n\nBaby Fire Powder is made from Biochemic Tissue Salts. It may help reduce the pain and discomfort of most common childhood ailments. This formula is often equally effective for adults. Use Jade Screen Defense after the fever/infection has cleared or for recurring colds/infections.\r\n\nBiochemic Tissue Salts\r\n\nFerrum Phosphate\r\n\n\tUsed for inflammation on the skin, fevers, sore throat, \t\tcoughs, chills, and colds \r\n\nMagnesium Phosphate\r\n\n\tUsed to relieve pain, acute spasms, hiccups, and colic\r\n\nCalcium Phosphate\r\n\n\tUse for poor circulation, chilblains, indigestion, anemia, \t\tconvalescence, and teeth problems\r\n\nPotassium Chloride\r\n\n\tUsed for respiratory ailments such as asthma, bronchi\t\ttis, catarrh, colds, tonsillitis, and sore throat\r\n\nA *Tofu Plaster applied to the forehead is an excellent remedy in bringing down fevers. Give the baby plenty of fluids during feverish conditions.\r\n\n*Tofu plaster: See External Applications	external
77	Blood Rebound	Anemia, Tire Easily, Chemotherapy	28	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nNettles\t\t\tUrtica Spp.\r\n\nMillettia\t\t\tJi Xue Teng\r\n\nSalvia\t\t\tDan Shen\r\n\nAstragalus\t\tHuang Qi\r\n\nTang Kuei\t\tDang Gui\r\n\nRehmannia, prep.\tShu Di Huang\r\n\nDeer Antler\t\tLu Rong\r\n\nGynostemma\t\tJiao Gu Lan\r\n\nComfrey root\tSymphytum Officinale\r\n\nCnidium\t\t\tChuan Xiong\r\n\nSaussurea\t\tMu Xiang\r\n\nGentian\t\t\tGentiana Lutea	Western Therapeutic Actions\r\n\nBlood tonic, nutritive tonic, and astringent	Traditional Chinese Medicine\r\n\nNourishes the blood, supplements the qi, vitalizes the blood, and promotes the movement of qi	Sample Indications\r\n\nAnemia, iron deficiency, bone marrow suppression, leukopenia, fatigue, and chronic pain from internal injury	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nContraindicated during the acute stages of any illness such as colds and influenza &leftpar;external pathogenic influence&rightpar;. If the patient has a constitutional spleen qi deficiency &leftpar;weak appetite, bloating, tendency towards loose stool&rightpar;, Blood Rebound requires the support of herbs that nurture the middle burner.	Notations\r\n\nThe nourishment of every cell in the body depends on the quality and vitality of the blood. Blood Rebound is a useful supplement for general vitamin and mineral depletion, and provide vitality to the whole system. Blood Rebound follows the pattern of Dang Gui Ji Xue Teng Tang or Tang Kuei and Millettia Combination, which addresses blood and qi deficiency accompanied by blood stagnation. This Chinese formula was developed for treating injuries, and more recently, has been adapted to help support the production of blood cells and strengthen the bone marrow. Replenishment is critical when undergoing the various depleting cancer therapies.\r\n\nOriental Medicine states, for exhaustion of blood, supplement the qi. Astragalus, Deer Antler, and Gynostemma have been added to this formula to supplement the qi. Nettles nourishes the liver and blood, and is classified as a blood restorative and nutritive. Millettia is considered a blood tonic and in combination with Salvia, vitalizes the blood. Millettia, Salvia, Astragalus, and Tang Kuei are being used for bone marrow suppression and leukopenia, which is often experienced during cancer therapies. Because of the blood vitalizing aspect of Blood Rebound, numbness and pain can be alleviated. \r\n\nChlorophyll, found in all green vegetables, is essential for healthy blood building. Wheat grass, barley green, spirulina, and blue green algae are widely used for maintaining vital, healthy blood. Mineral deficiency often accompanies blood deficiency. Seaweed is unsurpassed in mineral content and is an important dietary supplement.	external
53	Diaper Rash Cream	Diaaper Rash	15	Ingredients &leftpar;Herbal Extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nCalendula\t\t        Calendula Officinalis\r\n\nChickweed\t\tStellaria Media\r\n\nLithospernum\t\tZi Cao\r\n\nTang Kuei\t\t        Dang Gui\r\n\nMarshmallow\t\tAlthea Officinalis\r\n\nBeeswax\r\n\nOlive Oil	Western Therapeutic Actions\r\n\nAntipruritic, antiseptic, anti-fungal, anti-inflammatory, demulcent, and emollient	Traditional Chinese Medicine\r\n\nClears heat and nourishes the blood	Sample Indications\r\n\nDiaper rash, dermatitis, chapped skin, and general skin irritations	External Application\r\n\nApply liberally to the affected areas, after each change of diaper. \r\n\nChange the diaper frequently whenever there is any sign of skin irritation due to dampness.	Contraindications and Cautions\r\n\nThere are none known. Change diapers more frequently and let the baby air out occasionally. If washable cotton diapers are being used, be sure to use a laundry soap that is free of scents.	Notations \r\n\nDietary changes by the nursing mother may be required if the problem persists. Alkalize the blood by eating fewer acidic foods and fruit juices. Twig tea &leftpar;bancha or kukicha&rightpar; and miso soup help to alkalize the bodies pH, along with chewing your food better. Refer to the *Acid  Alkaline Food Chart for a list of foods.\r\n\nCalendula is an anti-inflammatory and antiseptic. It is a wonderful herb for healing chapped or burned skin. Chickweed, that abundant garden weed, is a demulcent and refrigerant and helps to heal chapped skin, skin ulcers, and other skin afflictions. Lithospernum clears heat and cools the blood. Tang Kuei nourishes the skin and Marshmallow root promotes tissue repair.\r\n\n*Acid  Alkaline Food Chart: See Appendix	external
54	Teething Drops	Teething	7	Ingredients &leftpar;Homeopathic&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nChamomile\t\tMatricaria Recutita	Western Therapeutic Actions\r\n\nAnti-inflammatory, soothing, antispasmodic, carminative, gentle sedative, and specific	Traditional Chinese Medicine\r\n\nClears heat, dispels wind, and calms the spirit	Sample Indications\r\n\nFor teething babies, especially those that become irritable, fractious, and difficult to deal with when they are in pain. These infants often display one reddened cheek.	Suggested Dosage5 - 20 Drops, in a small amount of water, \r\n\n3 - 5 times daily \r\n\nThis remedy can be administered in a baby's formula bottle or on its own.\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nTeething Powder differs from Teething Drops in that the former treats the infant that is more at ease with teething and its discomfort. Both remedies may be combined.	Notations\r\n\nTeething Drops is a homeopathic remedy.\r\n\nIn homeopathy, the remedy Chamomilla is prepared from German Chamomile, and is used mainly for pain relief to teething babies.\r\n\nThis remedy is made upon request, with no alcohol. \r\n\nA *Tofu Plaster applied to the forehead is an excellent remedy in bringing down fevers. Give the baby plenty of fluids during feverish conditions.\r\n\n*Tofu plaster: See External Applications	external
55	Teething Powder	Teething	33	Ingredients &leftpar;Homeopathic Biochemic Tissue Salts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nCalcium Fluoride\r\n\nMagnesium Phosphate\r\n\nCalcium Phosphate\r\n\nFerrum Phosphate\r\n\nSilica	Western Therapeutic Actions\r\n\nAntispasmodic, anti-inflammatory, anodyne, and analgesic	Traditional Chinese Medicine\r\n\nClears toxic heat and dispels wind	Sample Indications\r\n\nFor teething infants, with inflamed, red sore gums. It especially suits those infants who bare their challenge stoically and do not complain or get irritable with the pain.	Suggested Dosage\r\n\nDissolve 1/4 teaspoon of powder, directly on the tongue, every 30 minutes \r\n\nReduce the frequency of dose as the fever subsides and a normal temperature is restored.	Contraindications and Cautions\r\n\nTeething Powder differs from Teething Drops in that it treats the infant that is more at ease with teething and its discomfort. Both remedies may be combined.	Notations\r\n\nTeething Powder is made from Biochemic Tissue Salts.\r\n\nCalcium Fluoride\r\n\n\tHelps to promote elasticity of the tissues\r\n\nMagnesium Phosphate\r\n\n\tNerve and muscle fiber nutrient and relieves pain\r\n\nCalcium Phosphate\r\n\n\tStrengthens bones and teeth and enhances circulation\r\n\nFerrum Phosphate\r\n\n\tHelps to oxygenate the body and anti-inflammatory\r\n\nSilica\r\n\n\tDetoxicant and blood purifier\r\n\nA *Tofu Plaster applied to the forehead is an excellent remedy in bringing down fevers. Give the baby plenty of fluids during feverish conditions.\r\n\n*Tofu plaster: See External Applications	external
56	Worming Drops	Intestinal Parasite	7	Ingredients &leftpar;Herbal Extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nBlack Walnut\t\t\tJuglans Nigra\r\n\nTorryea seed\t\t\tFei Zi\r\n\nTansy \t\t\t\tTanacetum Vulgare\r\n\nWormwood\t\t\tArtemisia Absinthium\r\n\nWild Carrot \t\t\tDaucus Carota\r\n\nPolygonum\t\t\tBian Xu\r\n\nStemona\t\t\t\tBai Bu\r\n\nWormseed\t\t\tChenopodium Ambrosiodes\r\n\nCloves\t\t\t\tDing Xiang	Western Therapeutic Actions\r\n\nVermifuge, anthelmintic, and vermicide specific	Traditional Chinese Medicine\r\n\nKills parasites	Sample Indications\r\n\nKills parasites &leftpar;pinworms, roundworms, hook worms and tapeworms&rightpar;	Suggested Dosage\r\n\n5 - 20 drops, in a small amount of water, before going to bed. \r\n\nIt is recommended that this treatment be continued for at least 2 weeks &leftpar; 10 - 14 days being the life-cycle of most intestinal worms&rightpar;. \r\n\nIt is important, to ensure efficacy of this formula, that the patient has a bowel movement the morning after taking the dosage.\r\n\nVariation is according to individual symptoms\r\n\nü	Contraindications and Cautions\r\n\nContraindicated during pregnancy. This formula is non-toxic, slightly laxative, and will not harm the stomach qi.	Notations\r\n\nWorming Drops are designed to clear intestinal infestations and are effective with most types of worms. Chewing raw pumpkin seeds daily will help to clear infestation. Avoid sugars, alcohol, caffeine, and fried foods during a worming program. Wash hands thoroughly and change underwear daily. A glass of warm water with a teaspoon of sesame oil in the morning will help the bowels to move.\r\n\nBlack Walnut promotes bowel movement and detoxification. It is a detergent with anti-parasitic actions. Torryea seed kills a broad spectrum of parasites, has a laxative effect, and non-toxic. Tansy is an excellent vermifuge, alleviates cramps and spasms, and combines well with Black Walnut in expelling parasites. Wormwood, as its name refers, expels worms. It is a vermifuge, restorative and a bitter digestive with cooling and draining qualities. Wild Carrot is a deobstruent, opens the natural passages of the body. Polygonum is draining, kills parasites, and alleviates troublesome itching. Stemona, an expectorant, has the ability to expel parasites. Wormseed is a vermifuge and expels intestinal worms. Cloves direct the qi downward, alleviates abdominal pain, and stops vomiting.\r\n\nA daily diet that contains organic grated carrots and/or grated garlic assists in expelling worms and parasites. \r\n\nPumpkin seeds contain an amino acid,cucurbitin, which kills worms and parasites. Pumpkin seeds have been traditionally used in Mexico to kill tapeworms. Eat three to four tablespoons a day and chew them really well.\r\n\nWe recommend that you rebuild the healthy intestinal bacteria flora by taking a probiotic, such as yogurt or acidophilus, for one month following this cleansing formula.	external
71	Letting Go Remedy	Hanging On	4	Ingredients &leftpar;Flower Essences&rightpar;\r\n\nHoneysuckle\r\n\nWalnut\r\n\nHolly\r\n\nChicory\r\n\nMimulus	Western Therapeutic Actions\r\n\nAssists in the letting go process from an event in the past, whether it is physical or emotional		Sample Indications\r\n\nStruggling with letting go of an emotional tie, and knowing it is holding you back	Suggested Dosage\r\n\n5 drops, directly onto the tongue, 3 times daily, or more frequently if needed\r\n\nLetting Go Remedy can be repeated every 30 minutes during times of stress and repetitive thought patterns.\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nContact a licensed psychiatrist if extreme emotional conditions persist.	Notations\r\n\nLetting Go Remedy addresses the emotional and psychological aspects of clutching onto something, whether it is a thing, person, or event. It reveals our inability to surrender and our attachment to our thoughts. We have over-identified with the events of our life. This creates anxiety, stress, and turmoil. Letting go means surrender to this present moment and bring your awareness to the now. Take a deep breath and say yes to it all!\r\n\n                                                       Flower Essences\r\n\n                                                            Key words\r\n\nHoneysuckle\r\n\n\tDwells on the past, nostalgic, homesick\r\n\nWalnut\r\n\n\tOversensitive to others and ideas, link-breaker\r\n\nHolly\r\n\n\tHatred, jealousy, envy, suspicious	external
57	Addict Free	Calms Cravings	28	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nOats\t\t\tAvena Sativa\r\n\nCinnamon twig\tGui Zhi\r\n\nPeony\t\t\tBai Shao Yao\r\n\nBacopa\t\t\tBacopa Monnieri\r\n\nAlbizzia bark\t\tHe Huan Pi\r\n\nBiota\t\t\tBai Zi Ren\r\n\nDragon bone\t\tLong Gu\r\n\nOyster shell\t\tMu Li\r\n\nTang Kuei\t\tDang Gui\r\n\nGinseng, Siberian\tCi Wu Jia\r\n\nLotus seed\t\tLian Zi\r\n\nMistletoe\t\tViscum Album\r\n\nMilk Thistle\t\tSilybum Marianum\r\n\nMotherwort\t\tLeonurus Cardiaca\r\n\nLicorice\t\t\tGan Cao	Western Therapeutic Actions\r\n\nRestorative, nutritive, nervous sedative, and liver decongestant	Traditional Chinese Medicine\r\n\nRestrains the essence, suppresses rebellion, regulates and \r\n\nharmonizes the yin and yang, and quells reckless fire	Sample Indications\r\n\n\tPsychological\r\n\nAlcoholism, drug and narcotic addictions, workaholic, sex addict, chronically constrained, compulsive, and neurotic\r\n\n\tPhysical\r\n\nIntolerant to temperature changes, day or night sweats, insomnia with dream disturbed sleep, dizziness, palpitations, cold and constrained lower abdomen, weak lower body, and loss of hair	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, \r\n\n3 times daily. Higher dosages may be required at the beginning stages of withdrawal.\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nContact a licensed psychiatrist if extreme emotional conditions persist. Addict Free is most suited for a patient who is blood and qi deficient, yin deficient, unstable yang, and internal cold.	Notations \r\n\nAddict Free, similar to the Chinese formula, Gui Zhi Jia Long Ju Mu Li Tang or Cinnamon and Dragon Bone Combination, addresses the depletion of essence, the disruption of the yin and yang balance, and an agitated heart. In Oriental Medicine, addictions, or any negative behavior that exhibits itself excessively over time, destroy the intimate relationship and balance of yin &leftpar;water&rightpar; and yang &leftpar;fire&rightpar;. When the communication between the heart &leftpar;fire&rightpar; and kidney &leftpar;water&rightpar; is lost, our behavior can become rebellious, as if the water is drowning the fire, or the fire is vaporizing the water. In other words, they are inadvertently destroying each other, much the same way addictions destroy our lives. Addict Free assists in the healing process and helps resolve the inner conflicts and battles. \r\n\nOats &leftpar;wild&rightpar;, a premier nutritive and restorative, has proven to facilitate the withdrawal from addictive substances, such as tobacco and opiates. Cinnamon twig and Peony are used to restore the communication between the heart and kidneys. Bacopa, a nervine, improves concentration and memory. Albizzia, Biota, Lotus seed, and Motherwort combine to calm the spirit. Dragon bone and Oyster shell help to anchor the spirit, which keeps anxiety and panic from welling up. Siberian Ginseng is an adaptogenic and helps to restore the inner core. Tang Kuei nourishes the blood and calms as it enters the heart channel. Mistletoe is a nervine and helps to relieve stress. Milk Thistle is a hepatic and detoxicant. Licorice harmonizes the formula.	external
58	Bend Like Bamboo	Edgy, Rigidity	28	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nBupleurum\t\t    Chai Hu\r\n\nTang Kuei\t\t    Dang Gui\r\n\nPeony\t\t    \t    Bai Shao Yao\r\n\nCodonopsis\t\t    Dang Shen\r\n\nGardenia\t\t    Zhi Zi\r\n\nSalvia\t\t\t    Dan Shen\r\n\nAlbizzia bark\t\t    He Huan Pi\r\n\nCyperus\t\t\t    Xiang Fu\r\n\nMoutan\t\t\t    Mu Dan Pi\r\n\nLicorice, baked\t    Zhi Gan Cao\r\n\nGinger, fresh\t\t    Sheng Jiang\r\n\nPeppermint\t\t    Bo He	Western Therapeutic Actions\r\n\nMediates the liver and spleen, digestive, nervine, and calming	Traditional Chinese Medicine\r\n\nRegulates the liver qi, supports the spleen, clears heat, and calms the spirit	Sample Indications\r\n\nPsychological\r\n\nRigidity &leftpar;stubborn&rightpar;, narrow-minded, stuck in a rut, depressed, and agitated\r\n\n\tPhysical\r\n\nMuscular tension, teeth grinder, insomnia, and dream disturbed sleep patterns	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nUse with caution for patients with a constitutional qi and yang deficiency &leftpar;exhaustion, cold, and a weak lower body&rightpar;.	Notations \r\n\nBend Like Bamboo follows the pattern of many of the herbal formulas that address the disruption of the flow of qi through the liver which can cause digestive disturbances, emotional instability, and sleeping disorders. Bend Like Bamboo calms, relaxes, and allows for greater flexibility on lifes journey. \r\n\nIn Oriental Medicine, chronic stress and worry disables the liver, exhausts the spleen qi, excites the heart and eventually weakens the kidney/liver yin. Bupleurum and Peppermint are frequently used together in dealing with emotional depression. Bupleurum releases constrained liver qi. Peppermint supports Bupleurum as it releases the excess heat. Peony and Tang Kuei help to soften the persons temperament. Codonopsis and Licorice supplements the qi. Gardenia gently drains heat trapped from a congested liver. Albizzia bark nourishes the heart and calm the spirit. Salvia calms the spirit and enhances circulation. Ho Shou Wu nourishes the blood and essence. Cyperus is used when dealing with constrained and suppressed emotions.\r\n\nLifestyle changes may be appropriate. Meditation, counseling, and physical exercise help to release the emotional tension. Learning to surrender to the life and go with the flow might be the lessons with this syndrome. \r\n\nFor patients who have sensitive constitutions, begin taking this formula at a lower dosage and gradually increase it if necessary. Consider combining Bend Like Bamboo with a kidney tonic such as Fortify Will, Kidney Long Life, or Strong Back if the patient is very depleted, cold, and has no will power.	external
59	Cinnamon Harmony	Anti-Depressant, Prozac Alternative	28	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nTang Kuei\t\t\tDang Gui\r\n\nGinseng, Siberian\t\tCi Wu Jia\r\n\nCinnamon twig\t\tGui Zhi\r\n\nPeony\t\t\t\tBai Shao Yao\r\n\nCyperus\t\t\t\tXiang Fu\r\n\nAlbizzia bark\t\t\tHe Huan Pi\r\n\nPinellia\t\t\t\tBan Xia\r\n\nScute\t\t\t\tHuang Qin\r\n\nBurdock root\t\t\tArctium Lappa\r\n\nSkullcap\t\t\t\tScutellaria Lateriflora\r\n\nBupleurum\t\t\tChai Hu\r\n\nBarberry\t\t\t\tBerberis Vulgaris\r\n\nGinger, dried\t\t\tGan Jiang\r\n\nLicorice, baked\t\tZhi Gan Cao	Western Therapeutic Actions\r\n\nAdaptogenic, nutritive, nervine, hepatic, alterative, and digestive	Traditional Chinese Medicine\r\n\nHarmonizes the nutritive and protective qi, relieves the liver, \r\n\nand supports the spleen	Sample Indications\r\n\nEmotions fluctuate between highs and lows, hypersensitive, anxiety with depression, and calm facade with inner turmoil, especially anger\r\n\n\tPhysical\r\n\nChronic muscular tension, joint or body ache, body temperature fluctuates between hot and cold, and digestive disorders	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms.	Contraindications and Cautions\r\n\nContraindicated for high blood pressure, warm febrile diseases, and pregnancy.	Notations \r\n\nCinnamon Harmony, is based on a Chinese formula, Chai Hu Gui Zhi Tang or Bupleurum and Cinnamon Combination, which promotes harmony and balance. Patients who have chronic stress, work too much, and suffer from burn-out &leftpar;including in bed&rightpar;, usually fit this pattern well. \r\n\nAnger or depression, excessive worry, and a turbid life feed this disharmony. There is too much of something or too little of something else, with the inability to break the pattern. A turbulent roller coaster ride becomes the life style. \r\n\nOriental Medicine calls this condition, half-exterior and half-interior. Emotionally speaking, this can be interpreted as someone with a calm facade and inner turbulence, or true disharmony. They appear warm one minute and cold the next.\r\n\nBupleurum is commonly used in liver disorders. It is used for restoring the normal function of the liver and gallbladder, and to clear interior heat. It has a drying nature so it should be used with some caution with yin deficient &leftpar;dry&rightpar; clients. When combined with Cyperus, the constrained energy is released creating a more calm feeling. Cinnamon twig and Peony combine to harmonize the exterior with the interior. Albizzia bark is calming and excellent for pent up emotions. Barberry, somewhat similar to the Chinese herbs Coptis and Phellodendron, helps to relieve the stagnant energy and drain the damp/heat caused by an uptight liver that is emotionally under duress.  Pinellia resolves phlegm and strengthens the function of the spleen. It is assisted by Siberian Ginseng, Ginger, and Licorice.	external
60	Eight Wise Ones	Focus, Perseverance	28	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nOats\t\t\t\tAvena Sativa\r\n\nAtractylodes\t\t\tBai Zhu\r\n\nSkullcap\t\t\t\tScutellaria Lateriflora\r\n\nHoelen\t\t\t\tFu Ling\r\n\nGinseng, Chinese\t\tJi Lin Ren Shen\r\n\nGentian\t\t\t\tGentiana Lutea\r\n\nChamomile, Roman\tAnthemis Nobilis\r\n\nLicorice, baked\t\tZhi Gan Cao	Western Therapeutic Actions\r\n\nRestorative, nutritive, digestive, and nervine	Traditional Chinese Medicine\r\n\nSupplements the qi, supports the spleen, breaks up stagnant qi, and calms the spirit	Sample Indications\r\n\nPsychological\r\n\nOverly self-conscious, compulsive, overworked, stressed, and burdened by the demands of life\r\n\n\tPhysical\r\n\nIndigestion, chronic digestive disorders, fatigue, lethargy, and nervous exhaustion	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, \r\n\n3 times daily. \r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nModify this formula if the patient has a high fever, heat from deficiency, or a combination of heat, thirst, and irritability.	Notations \r\n\nThe herbal combination of Atractylodes, Hoelen, Ginseng, and Licorice &leftpar;baked&rightpar; was created by Master Chen Shi-wen, called Si Jun Zi Tang, or Soup of the Four Gentlemen in ancient China, around 1150 A.D.. It was subsequently expanded about 100 years later to Soup of the Six Gentlemen during the Xue Ji Ming Dynasty. The two herbs added to the original four are Citrus &leftpar;Chen Pi&rightpar; and Pinellia &leftpar;Ban Xia&rightpar;. This addition made the formula more phlegm resolving than the original formula. \r\n\nEight Wise Ones focuses on supporting the middle burner &leftpar;stomach and spleen&rightpar;, improving nutritional assimilation, and calming the spirit. Modern times has created an enormous amount of stress, with peoples nerves on edge. Due to this fact, this formula utilizes the ancient concept, health begins with a well functioning digestive system, and complements the classic formula with nervines and calming herbs. \r\n\nOats and Skullcap are excellent nutritive tonics and nervines. Skullcap also relieves constrained qi due to stress. Atractylodes, Ginseng, and Licorice strengthen the spleen and build the qi. Hoelen supports the spleen and calms the spirit. Gentian is a bitter tonic and is called upon when there is weakness and debility due to stress. Roman Chamomile harmonizes the digestion and is calming.\r\n\nThe Soup of the Four Gentlemen serves as a foundation formula for many herbal formulas used today in dealing with the wide variety of digestive disorders. Shiatsu Master, Toru Namikoshi said that the way to keep your digestive system healthy is to smile and laugh a lot! .	external
61	Emperors Heaven	Anxious, Over Stimulated, Brain Won't Stop	28	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nRehmannia, raw\t\tSheng Di Huang\r\n\nAsparagus\t\t\tTian Men Dong\r\n\nOphiopogon\t\t\tMai Men Dong\r\n\nTang Kuei\t\t\tDang Gui\r\n\nSchizandra\t\t\tWu Wei Zi\r\n\nBiota\t\t\t\tBai Zi Ren\r\n\nZizyphus\t\t\tSuan Zao Ren\r\n\nGinseng, American      Xi Yang Shen\r\n\nSalvia\t\t\t       Dan Shen\r\n\nScrophularia\t\t       Xuan Shen\r\n\nHoelen\t\t\t       Fu Shen\r\n\nPolygala\t\t\t       Yuan Shi\r\n\nDragon bone\t\t       Long Gu\r\n\nPlatycodon\t\t       Jie Geng\r\n\nCardamon\t\t      Sha Ren	Western Therapeutic Actions\r\n\nNervous sedative, nutritive, demulcent, and cardiac tonic	Traditional Chinese Medicine\r\n\nEnriches the yin of the heart and kidney, nourishes the blood, and calms the spirit	Sample Indications\r\n\nPsychological\r\n\nIrritable and unable to concentrate, moves from one thing to another, excessive thinking, forgetful, erratic emotions\r\n\n\tPhysical\r\n\nInsomnia with restless sleep, palpitations, anxiety, sores in the mouth, dry stool, menopausal symptoms, chronic urticaria, and heart disease	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, \r\n\n3 times daily. \r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nThere are none known. The patient fitting this profile will have a red tongue with little coating and a thin, rapid pulse. A dry stool may also be present. These signs are classic markers for yin and blood deficiency.	Notations \r\n\nDisturbances of the spirit are treated with herbs that nourish the heart and blood. When these aspects of the body become depleted or disrupted, the body becomes imbalanced and emotional disorders surface. Sleep disturbances are one of the key indicators for a heart imbalance. From many traditions, sleep is the time when our ancestral spirits come to visit us. If our sleep patterns are disrupted, some traditional healers consider this a spirit disorder and encourage tending to the ancestral spirits.\r\n\nIn Oriental Medicine, heart disorders are revealed in the tongue. A red tipped tongue reveals the excess heat in the heart &leftpar;caused by depletion&rightpar; and contributes to palpitations, restless sleep, and anxiety. The pulse will usually be rapid and thin. A knotted, hurried, or intermittent pulse points to heart irregularities. \r\n\nEmperors Heaven follow the principles of a Chinese formula, Tian Wang Bu Xin Wan or Ginseng and Zizyphus Combination, and is effective for patients who are excessive thinkers and deliberators, living in their head. Emperors Heaven is suited also for patients who are fretful, stressed out, and have difficulty getting a restful sleep. Patients who are finding sleeping pills no longer effective will find this stress reducing formula very beneficial.\r\n\nEmperors Heaven is different from the Pathfinder formula, in that the later deals more with blood and qi deficiency, which includes weak appetite, loose stool, and a pale tongue.	external
62	Fortify Will	Courage, Motivation	28	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nRehmannia, prep.\t\tShu Di Huang\r\n\nEucommia\t\t\tDu Zhong\r\n\nBorage\t\t\t\tBorago Officinalis\r\n\nMorinda\t\t\t\tBa Ji Tian\r\n\nCornus\t\t\t\tShan Zhu Yu\r\n\nLycium fruit\t\t\tGou Qi Zi\r\n\nCuscuta\t\t\t\tTu Si Zi\r\n\nRed Clover\t\t\tTrifolium Pratense\r\n\nDioscorea\t\t\tShan Yao\r\n\nGinseng, Chinese\t\tJi Lin Ren Shen\r\n\nDeer Antler\t\t\tLu Rong\r\n\nCinnamon bark\t\tRou Gui\r\n\nGinger, dried\t\t\tGan Jiang\r\n\nLicorice, baked\t\tZhi Gan Cao	Western Therapeutic Actions\r\n\nRestorative and nutritive tonic, adaptogenic tonic, stimulant, and alterative	Traditional Chinese Medicine\r\n\nWarms and fortifies the kidney yang, replenishes the essence, nourishes the blood and supports the spleen	Sample Indications\r\n\nPsychological\r\n\nFear causing paralysis, no backbone or will, psychic tiredness as if there is nothing left to give, and difficult to express what one feels for fear of the consequence\r\n\n\tPhysical\r\n\nLower back pain, weak lower body, cold extremities, low libido, infertility, hypothyroid, aversion to cold, exhaustion from chronic illness, incontinence, and undigested food in the stool	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nContraindicated in cases with yin deficiency &leftpar;dry mouth, red tongue with no coating, hot hands and feet&rightpar;.	Notations \r\n\nFortify Will restores the essence of our being. The Chinese call it the gate of vitality, the kidney yang. Herbal remedies that treat the kidney yang are the most potent of all the remedies. The teachings tell us that the kidney yang &leftpar;fire&rightpar; controls the kidney yin &leftpar;water&rightpar;. Because of this, patients with kidney yang deficiency will have water metabolism disorders; such as edema, incontinence or difficulty in urinating, unusual sweating, spermatorrhea, and oily skin. \r\n\nThe kidneys are considered the root of the tree. When the root is unable to grasp the air, it has a difficult time thriving &leftpar;asthma or wheezing&rightpar;. It is also said "the yang lives within the yin". For this reason the blood and yin tonics, Lycium fruit and Tang Kuei, are added to support this kidney yang remedy. Patterned after You Gui Wan, this remedy provides excellent results when used appropriately.\r\n\nTrauma can be a cause for this depletion because of its ability to paralyze an individual in fear. Post traumatic stress disorder &leftpar;PTSD&rightpar; operates in a veil of fear. The trauma has the ability to exhaust the kidney fire and freeze and individual on their lifes journey, freezing them in a space of time. Fortify Will can help thaw the frozen bones and reclaim the will that was lost in the shadows of a distant cave.	external
63	Graceful Movement	Restlessness, No Roots, Unsettled	28	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nRehmannia, prep.\t\tShu Di Huang\r\n\nCornus\t\t\t\tShan Zhu Yu\r\n\nDioscorea\t\t\tShan Yao\r\n\nHoelen\t\t\t\tFu Ling\r\n\nPseudostellaria\t\tTai Zi Shen\r\n\nLycium fruit\t\t\tGou Qi Zi\r\n\nMoutan\t\t\t\tMu Dan Pi\r\n\nOphiopogon\t\t\tMai Men Dong\r\n\nAlisma\t\t\t\tZe Xie\r\n\nMistletoe\t\t\tViscum Album \r\n\nMotherwort\t\t\tLeonurus Cardiaca\r\n\nCardamon\t\t\tSha Ren	Western Therapeutic Actions\r\n\nDemulcent, nervine, antispasmodic, diuretic, and nutritive tonic	Traditional Chinese Medicine\r\n\nNourishes the yin, enriches the kidney and liver blood, and supports the spleen	Sample Indications\r\n\nPsychological\r\n\nFear causing the desire to run away or withdraw, unsettled, restless, always searching, and feels shaky inside when under stress\r\n\n\tPhysical\r\n\nWeakness and soreness of the lower body, diminished hearing, ringing in the ears, night sweats, dry mouth and throat, dryness of sexual fluids, and spontaneous nocturnal emissions	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, \r\n\n3 times daily. \r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nAdditional herbs for the spleen and stomach may be necessary if there is indigestion, weak appetite or loose stool.	Notations \r\n\nGraceful Movement is patterned after one of the most relied upon formulas in the Chinese Materia Medica, Six Flavor Rehmannia Pill or Liu Wei Di Huang Wan, created by Qian Yi in 1114 A.D. The kidneys in Oriental Medicine are considered to be the Mansion of Fire and Water and the root of the body functions. With this in mind we can see the importance of preserving, maintaining, and fortifying the kidney energy, whether it be the yin &leftpar;water&rightpar; or the yang &leftpar;fire&rightpar;. \r\n\nGraceful Movement is a modified version of Zuo Gui Yin, which in turn is a modified formula of the Six Flavor Rehmannia Pill. The emphasis of this formula is on nurturing the kidney yin and supporting the liver and spleen. This modification in Graceful Movement was made because of the support that the kidney yin gives to the liver, and how the disruption of fluids adversely affects the spleen. \r\n\nPrepared Rehmannia nourishes the blood and yin. Cornus nourishes the liver and stabilizes the kidneys. Lycium fruit nourishes the kidneys, liver, and the blood. Cornus and Lycium fruit have been called longevity herbs because of their ability to fortify the body. Pseudostellaria &leftpar;Tai Zi Shen&rightpar; has a wonderful ability to nourish the spleen qi without damaging the yin. Cardamon strengthens the stomach and promotes the movement of qi. If there is a strong heat presentation &leftpar;dryness&rightpar;, complement this formula accordingly. \r\n\nThe demands of todays world makes this a brilliant preventative and remedial tonic for men and women for burn out.	external
64	Panic Free	Anxiety Attacks	28	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nSkullcap\t\t\t\tScutellaria Lateriflora\r\n\nPinellia\t\t\t\tBan Xia\r\n\nHoelen\t\t\t\tFu Shen\r\n\nMagnolia bark\t\tHou Po\r\n\nCyperus\t\t\t\tXiang Fu\r\n\nGinseng, Siberian\t\tCi Wu Jia\r\n\nPerilla leaf\t\t\tZi Su Ye\r\n\nBlue Citrus\t\t\tQing Pi\r\n\nSalvia\t\t\t\tDan Shen\r\n\nTrichosanthes fruit\tGua Lou\r\n\nCurcuma\t\t        Yu Jin\r\n\nChih-Shih\t\t        Zhi Shi\r\n\nBupleurum\t\t        Chai Hu\r\n\nCitrus\t\t\t        Chen Pi\r\n\nGinger, fresh\t\t        Sheng Jiang	Western Therapeutic Actions\r\n\nExpectorant, digestive stimulant, nervine, and relaxant	Traditional Chinese Medicine\r\n\nPromotes the smooth movement of qi, transforms phlegm, and directs rebellious qi downward\r\n\nü	Sample Indications\r\n\nPsychological\r\n\nPhobic, panic attacks, sensation of being choked or being constricted around the neck, feels as if something is stuck in the throat, sensation that death is looming, emotionally unstable, nervousness, and fearfulness\r\n\n\tPhysical\r\n\nPain, discomfort, or tightness in the chest or upper back, phlegmatic, coughing, nausea or vomiting, fatigue, disruptive sleep, and palpitations	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nThis formula is drying and dispersing in nature, and should be discontinued once the symptoms subside. In Oriental Medicine, the tongue will be moist or greasy with a white coating. The pulse will be wiry, feeling like a tight guitar string. Contraindicated with patients who exhibit a red tongue with no coating, red flushed face, and a bitter taste in the mouth.	Notations\r\n\nPanic Free is derived from the Chinese formula, Ban Xia Hou Po Tang or Pinellia and Magnolia Combination, and falls into the category of stagnant qi and constrained liver qi with phlegm. In Oriental Medicine, qi can stagnate at the beginning of a disorder or from an emotional trauma. It can also develop from erratic eating habits or long-term deficiencies. Constrained liver qi can develop from emotional disturbances. Phlegm is produced from a weakened spleen. \r\n\nEmotionally, we could ask, Is the patient unable to swallow something in life or accept? Identifying what that something is creates the opportunity to move forward in life and accept lifes mysterious unfolding with openness and surrender. With the appropriate match, Panic Free has resolved some of the most stubborn phobias.\r\n\nSkullcap, Cyperus, Blue Citrus, Perilla leaf, Trichosanthes fruit, and Bupleurum help to release the constrained liver qi and expand the chest. Pinellia, Hoelen, Magnolia bark, Citrus, and Ginger assist the spleen and transform dampness. Ginseng is an adaptogenic and strengthens the qi. Salvia vitalizes the blood and calms the spirit. Curcuma transforms phlegm and calming. Chih-Shih directs the qi downward and breaks up stagnant qi.	external
65	Pathfinder	Scattered, Drained Energy	28	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nOats\t\t\t\tAvena Sativa\r\n\nAstragalus\t\t\tHuang Qi\r\n\nAtractylodes\t\t\tBai Zhu\r\n\nZizyphus\t\t\tSuan Zao Ren\r\n\nHoelen\t\t\t\tFu Shen\r\n\nTang Kuei\t\t\tDang Gui\r\n\nGinseng, Chinese\t\tJi Lin Ren Shen\r\n\nLongan\t\t\t\tLong Yan Rou\r\n\nPolygala\t\t\t\tYuan Shi\r\n\nSaussurea\t\t\tMu Xiang \r\n\nMotherwort\t\t\tLeonurus Cardiaca\r\n\nLicorice, baked\t\tZhi Gan Cao\r\n\nGinger, fresh\t\t\tSheng Jiang\r\n\nJujube\t\t\t\tDa Zao	Western Therapeutic Actions\r\n\nRestorative, nutritive, nerve tonic, cardiac tonic, and relaxant	Traditional Chinese Medicine\r\n\nSupplements the qi, supports the spleen, nourishes the blood, and calms the spirit	Sample Indications\r\n\nPsychological\r\n\nExcessive thought, worry and anxiety, lacks self esteem, difficult to concentrate, imagines the worse case scenario, overly cautious with too many possibilities, withdraws, phobias, and insecure\r\n\n\tPhysical\r\n\nInsomnia, dream disturbed sleep, palpitations, shortness of breath, feverish, bleeding disorders, early or prolonged menstruations, anemia, and myasthenia gravis &leftpar;chronic muscle weakness&rightpar;	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nPathfinder is suited for a patient who has a pale, swollen tongue with a thin white coating. The complexion will be pale and the pulse will be deficient, feeling thin and frail.	Notations\r\n\nPathfinder, designed after the Chinese formula, Gui Pi Tang or Ginseng and Longan Combination, finds its place for those suffering from anxiety due to exhaustion. Not only does this formula replenish, it brings back the ability to focus and concentrate. Pathfinder fills the heart with blood, allowing the spirit to be at ease with a sense of abundance. In Oriental Medicine, obsessive behavior or excessive thinking can injure the qi of the spleen. When the spleen is weak it can no longer generate blood. The blood, then, lacks the ability to nourish the heart. With a depleted heart, the spirit has no home, and the thoughts wander from one thing to another, not knowing which way to turn or which path to follow. \r\n\nPathfinder to the rescue, a brilliant formula that will restore the pulse of life, as the restless spirit is quieted , and the body regains its ability to control the blood.\r\n\nOats has been added to replenish the nervous system and rejuvenate the body. Astragalus and Tang Kuei exhibit a great synergy for building the blood and qi. Ginseng and Atractylodes supplement the qi and strengthen the spleen. Hoelen, Licorice, Ginger, and Jujube support the spleen. Zizyphus, Longan, Polygala, and Motherwort nourish and calm the heart. Saussurea assists in the regulation of the movement of the digestive qi.	external
78	Chi Rebound	Energy Builder	28	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nOats\t\t         \tAvena Sativa\r\n\nGinseng, American\tXi Yang Shen\r\n\nAstragalus\t\tHuang Qi\r\n\nRhodiola\t         \tHong Jing Tian\r\n\nTang Kuei\t         \tDang Gui\r\n\nGynostemma\t\tJiao Gu Lan\r\n\nCodonopsis\t\tDang Shen\r\n\nLongan\t\t\tLong Yan Rou\r\n\nDamiana\t         \tTurnera Diffusa\r\n\nMistletoe\t         \tViscum Album\r\n\nKola Vera\t         \tKola Vera\r\n\nGentian\t\t\tGentiana Lutea\r\n\nLicorice, baked\t\tZhi Gan Cao	Western Therapeutic Actions\r\n\nAdaptogenic, nutritive tonic, restorative and nerve tonic, digestive, and cardiac tonic	Traditional Chinese Medicine\r\n\nNourishes the blood, strengthens the chi, and augments the essence	Sample Indications\r\n\nExhaustion, low vitality, and general lassitude due to frequent and prolonged stress &leftpar;physical or mental&rightpar;	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, 3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nUse caution with high blood pressure. Modify this remedy if the patient has a high fever, heat from deficiency, or a combination of heat, thirst, and irritability.	Notations \r\n\nChi Rebound is an all around balanced supplement that enhances mental and physical well-being. This remedy has shown itself to be very effective when used as an adjunct therapy when treating any chronic disease, especially if fatigue, general debility, low blood pressure, or a feeble heart presents themselves as part of the symptoms. Well-balanced restorative tonics, such as Chi Rebound, will combine herbs that stimulate and calm the body concurrently. This is because anxiety and depression sit side by side and are common companions. People with sensitive blood sugar levels can take this tonic without adverse affects.\r\n\nOats &leftpar;wild&rightpar; is considered the perfect food, both as a nutritive and restorative tonic. It is one of the few grains that is warm in nature, very grounding, and supportive of the thyroid, pancreas, and testis. American Ginseng, considered a yin tonic in Chinese medicine because it is cooler in nature than the Asian ginseng, is adaptogenic and restorative. It excels in its ability to restore the body and calm the mind. Astragalus strengthens the chi of the spleen and lungs, raises the chi upward, and stabilizes the protective chi. It is an excellent herb that can be used for most deficient conditions. If a client has blood or chi stagnation, especially in the middle burner, Astragalus can cause neck and shoulder tension because of its ability to raise the chi. Rhodiola, known as the golden root, is found in the arctic regions of Siberia and has been highly regarded for centuries. The Scandinavians used it to enhance their physical strength and endurance. In Russia it is used for nervous disorders, depression, and alleviating depletion from various stress factors. Longan nourishes the blood and calms the heart. It is frequently used in restorative formulas because of its calming effect. Mistletoe &leftpar;European&rightpar; supports Longan as a nervous relaxant. Damiana and Kola Vera are used for nervous debility, depression, and fatigue.	external
66	Soothe The Dragon	Anger, Rage	28	Ingredients Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nBupleurum\t\t\t Chai Hu\r\n\nValerian\t\t\t\t Valeriana Officinalis\r\n\nPinellia\t\t\t\t Ban Xia\r\n\nHoelen\t\t\t\t Fu Shen\r\n\nZizyphus\t\t\t Suan Zao Ren\r\n\nPolygonum vine\t\t Ye Jiao Teng\r\n\nDragon bone\t\t\t Long Gu\r\n\nOyster shell\t\t\t Mu Li\r\n\nScute\t\t\t\t Huang Qin\r\n\nCyperus\t\t\t\t Xiang Fu\r\n\nGinseng, Chinese\t\t Ji Lin Ren Shen\r\n\nCinnamon twig\t        Gui Zhi\r\n\nChih-Shih\t\t        Zhi Shi\r\n\nSkullcap\t\t\t        Scutellaria Lateriflora\r\n\nGinger, fresh\t\t   Sheng Jiang	Western Therapeutic Actions\r\n\nNervous sedative, adaptogenic, alterative, depurative, and digestive	Traditional Chinese Medicine\r\n\nSedates and calms the spirit, harmonizes the liver and spleen, clears heat, and transforms phlegm	Sample Indications\r\n\nPsychological\r\n\nDrug withdrawal, irritable, angry, chronic depression, PTSD, frightens easily, "wound up tighter than a knot", nervous twitching, neurotic, and schizophrenia\r\n\n\tPhysical\r\n\nTightness in the chest, occasional palpitations when resting, a sense of heaviness in the body, epilepsy, Menieres disease, hyperthyroid, and post-concussion syndrome	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions \r\n\nThis formula is suited for a patient who has a red tongue with a wiry, rapid pulse &leftpar;excess&rightpar;.	Notations\r\n\nSoothe the Dragon, is a modified version of the Chinese formula, Chai Hu Jia Long Gu Mu Li Tang or Bupleurum and Dragon Bone Combination. In Oriental Medicine, when the qi of the body gets trapped internally for an excessive amount of time, the liver and the heart can become imbalanced and accumulate an excess amount of heat. Soothe the Dragon will help to open and purge what has been trapped. \r\n\nChronic emotional withholding leads to many imbalances. The withheld emotions contain energy. There comes a time, when the cup can not hold anymore water. When this moment is reached, explosive reactions can show themselves. Road rage, hidden rage, everything rocks the boat; even in the absence of a storm. Soothe the Dragon relieves some of the inner turmoil, and calms the body down. Many herbs in this formula bring the qi down, not to depress the qi, but to calm and balance.\r\n\nBupleurum helps to crack open the constrained liver qi. Valerian is a strong nervine with anodyne and antispasmodic qualities. It promotes sleep, alleviates nervous debility, irritation and anger. Pinellia transforms phlegm and causes the qi to descend.  Hoelen, Ginseng, and Ginger support the spleen. Zizyphus and Polygonum vine calm the spirit. Dragon bone and Oyster shell anchor and calm the spirit. Scute sedates liver yang and clears heat. Skullcap and Cyperus release constrained liver qi. Cinnamon twig warms and promotes the movement of qi in the chest. Chih-Shih breaks up stagnant qi and directs the qi downward.	external
67	Tranquillo	Calms, Fortifies, Peaceful	28	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nOats\t\t\t\tAvena Sativa\r\n\nCodonopsis\t\t\tDang Shen\r\n\nRehmannia, raw\t\tSheng Di Huang\r\n\nArjuna\t\t\t\tTerminalia Arjuna\r\n\nSalvia\t\t\t\tDan Shen\r\n\nZizyphus\t\t\tSuan Zao Ren\r\n\nBiota\t\t\t\tBai Zi Ren\r\n\nMistletoe\t\t\tViscum Album\r\n\nVervain\t\t\t\tVerbena Officinalis\r\n\nLicorice, baked\t\tZhi Gan Cao\r\n\nOphiopogon\t\t\tMai Men Dong\r\n\nLily\t\t\t\t\tBai He\r\n\nCinnamon twig\t\tGui Zhi\r\n\nSkullcap\t\t\t\tScutellaria Lateriflora\r\n\nCardamon\t\t\tSha Ren	Western Therapeutic Actions\r\n\nRestorative, nutritive, nerve tonic, nervine, demulcent, and \r\n\nrelaxant	Traditional Chinese Medicine\r\n\nSupplements the qi, nourishes the blood, nourishes the yin, and restores the pulses	Sample Indications\r\n\nPsychological\r\n\nAnxiety with palpitations, panic with fear, irritable and restless, and strong judgement about oneself as being inconsistent or unacceptable\r\n\n\tPhysical\r\n\nInsomnia, palpitations, arrhythmia &leftpar;irregular or intermittent pulses&rightpar;, shortness of breath, constipation, emaciation, and \r\n\nmitral valve disorders,	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nThis remedy is suited for a patient who has a pale, shiny tongue, dry mouth and throat, with a pulse that is consistently irregular, intermittent, or thin and forceless.	Notations\r\n\nTranquillo falls into the Oriental Medicine categories of qi and blood tonics. Tranquillo differs from the Pathfinder formula, in that the former is stronger in nourishing the blood, and addresses irregular pulses. Tranquillo is a modified version of the Chinese formula, Zhi Gan Cao Tang or Baked Licorice Combination and combined with Western nervines. Tranquillo regenerates the heart blood and restores the qi, so that the pulses will be full of vitality, lose their irregularity, and the spirit can feel at ease. When the heart has lost its vital energy, a person can experience palpitations, agitation, anxiety, and insomnia. \r\n\nLicorice, in larger amounts, is a heart tonic; and in combination with Oats and Codonopsis, supplement the spleen qi. When the spleen qi is strengthened, it is more able to generate blood. Arjuna, an Ayurvedic herb, is a cardiac tonic, regulates blood pressure, a relaxant, and possesses cholesterol regulating properties. Mistletoe is a cardiac circulatory stimulant, relaxant, and nervine. Vervain is a nervine and anti-depressant. Rehmannia, Ophiopogon, Ho Shou Wu, and Lily nourish the the yin and heart blood. Cinnamon twig and Salvia open the heart channels and stimulate circulation in the chest region. Zizyphus and Biota nourish the heart and calm the spirit. Skullcap relieves tightness in the chest, breaks up stagnant qi, and is calming. Cardamon is an aromatic digestive and balances the actions of this formula.\r\n\nü	external
68	Addiction Remedy	Dependencies	4	Ingredients &leftpar;Flower Essences&rightpar;\r\n\nAgrimony\r\n\nChestnut Bud\r\n\nCherry Plum\r\n\nImpatiens\r\n\nWalnut\r\n\nWhite Chestnut	Western Therapeutic Actions\r\n\nSupports the healing of all types of substance abuse, and helps break the links to destructive emotional  patterns		Sample Indications\r\n\nAssists the emotional healing process of letting go of addictions: food, drug, tobacco, and behavioral	Suggested Dosage\r\n\n5 drops, directly onto the tongue, 3 times daily, or more frequently if needed\r\n\nAddiction Remedy can be repeated every 30 minutes during times of stress, or when the addiction is most difficult to control.\r\n\nVariation is according to individual symptoms\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nContact a licensed psychiatrist if extreme emotional conditions persist. Addict Free can be considered for additional support.	Notations \r\n\nAddiction Remedy addresses the emotional and psychological aspects of addictions. It may be necessary with certain addictions to use detoxifying formulas to help clear the physical body. Addiction Remedy helps to break the unwanted links of negative repetitive behavioral patterns. Lifestyle changes, counseling, and treatment guidance is highly recommended when dealing with addictions. Body therapy and acupuncture have proven to be highly effective during the healing process. Saunas are an excellent way to cleanse the body of impurities, bring clarity to the mind, and calm the spirit.\r\n\nFlower Essences\r\n\nKey words\r\n\nAgrimony\r\n\n\tMental torture, worry, concealed from others\r\n\nChestnut Bud\r\n\n\tFailure to learn by experience, lack of observation in the \t\tlessons of life and the need for repetition\r\n\nCherry Plum\r\n\n\tDesperation, fear of losing control of the mind, dread of \t\tdoing some frightful thing\r\n\nImpatiens\r\n\n\tImpatience, irritability and extreme mental tension\r\n\nWalnut\r\n\n\tOversensitive to ideas and influences, the link-breaker\r\n\nWhite Chestnut\r\n\n\tPersistent unwanted thoughts, mental arguments and \t\tconversations	external
69	Crisis Remedy	Trauma	4	Ingredients &leftpar;Flower Essences&rightpar;\r\n\nStar of Bethlehem\r\n\nRock Rose\r\n\nImpatiens\r\n\nClematis\r\n\nCherry Plum	Western Therapeutic Actions\r\n\nHeals the emotional wounds of trauma, shock, grief, and sustained stress		Sample Indications\r\n\nTrauma, shock, panic, grief, anxiety, and fright	Suggested Dosage\r\n\n5 drops, directly onto the tongue, 3 times daily, or more frequently if needed\r\n\nCrisis Remedy can be repeated every 30 minutes during times of stress.\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nContact a licensed psychiatrist or a mental health clinic if extreme emotional conditions persist.	Notations\r\n\nThis is the same remedy as the Bach Flower Rescue Remedy. Crisis Remedy addresses the emotional states brought on by trauma and allows the patient to stay calm, focused, and functional during and after a traumatic experience.\r\n\nFlower Essences\r\n\nKey words\r\n\nStar of Bethlehem\r\n\n\tMental or physical shock or trauma\r\n\nRock Rose\r\n\n\tTerror, panic, extreme fright\r\n\nImpatiens\r\n\n\tImpatience, irritability and extreme mental tension\r\n\nClematis\r\n\n\tIndifferent, dreaminess, unconscious\r\n\nCherry Plum\r\n\n\tDesperation, fear of losing control of the mind, dread of doing some frightful thing	external
70	Crossroads Remedy	Clarity	4	Ingredients &leftpar;Flower Essences&rightpar;\r\n\nWild Oat\r\n\nWalnut\r\n\nHoneysuckle\r\n\nChestnut Bud\r\n\nWhite Chestnut\r\n\nMimulus	Western Therapeutic Actions\r\n\nPromotes emotional and mental clarity in discovering one's direction in life		Sample Indications\r\n\nFear and lack of direction, at a crossroads in life, and confusion about lifes purpose	Suggested Dosage\r\n\n5 drops, directly onto the tongue, 3 times daily, or more frequently if needed\r\n\nCrossroads Remedy can be repeated every 30 minutes during times of stress.\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nContact a licensed psychiatrist if extreme emotional conditions persist.	Notations \r\n\nCrossroads Remedy suits those who are in a transitional time in their life. The possibilities are limitless and time is running out. Alas, what to do? This remedy enables you to focus your energies, and give room or make space for the sacred. Give room means to quiet the self, find some moments of stillness, breathe, and allow this present awareness lead you. Allow yourself to be led. Feel from the belly. If you stay in your head, try to think your way through this decisive time, you fail miserably. Your thoughts and emotions are not in alignment with the natural rhythm of life. When you quiet your mind, by surrendering to everything just as it is, a peacefulness shortly arrives and you become empowered and have clarity. \r\n\nFlower Essences\r\n\nKey words\r\n\nWild Oat\r\n\n\tUncertainty, despondent, dissatisfied\r\n\nWalnut\r\n\n\tOversensitive to ideas and influences, the link-breaker\r\n\nHoneysuckle\r\n\n\tDwells upon the past, nostalgic, homesick\r\n\nChestnut Bud\r\n\n\tFailure to learn by experience, lack of observation in the lessons of life and the need for repetition\r\n\nWhite Chestnut\r\n\n\tPersistent unwanted thoughts, mental arguments and conversations\r\n\nMimulus\r\n\n\tFear or anxiety of known origin	external
73	Grounding Remedy	Staying Present	4	Ingredients &leftpar;Flower Essences&rightpar;\r\n\nClematis\r\n\nStar of Bethlehem\r\n\nRock Rose\r\n\nAspen\r\n\nCherry Plum	Western Therapeutic Actions\r\n\nHeals the emotional foggy brain, vagueness, and out of body reality, brings the energy back down to earth		Sample Indications\r\n\nPeople who have lost direction, struggle living in this reality, spend their time talking to God, and have gone\r\n\n"away with the fairies"	Suggested Dosage\r\n\n5 drops, directly onto the tongue, 3 times daily, or more frequently if needed\r\n\nGrounding Remedy can be repeated every 30 minutes during times of stress.\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nContact a licensed psychiatrist or a mental health clinic if extreme emotional conditions persist.	Notations\r\n\nEmotional confusion and upset often accompanies physiological problems. By relating an emotion to the Five Phases Theory or the Four Humors, and applying an appropriate herbal formula can be very beneficial during the course of the healing process. \r\n\nAn excess or lack of any emotion can serve as a guide to the systemic imbalance of the patient. The important thing to remember is to adapt and apply these theories in a creative and dynamic way. Rigidity spoils the soup, limits the possibilities, and closes the door to healing.\r\n\n                                 Flower Essences\r\n\n                                       Key words\r\n\nClematis\r\n\n\tIndifferent, dreaminess, preoccupied, unconscious\r\n\nStar of Bethlehem\r\n\n\tShock, trauma, mental or physical\r\n\nRock Rose\r\n\n\tTerror, panic, extreme fright\r\n\nAspen\r\n\n\tVague fears of unknown origin, anxiety, apprehension\r\n\nCherry Plum\r\n\n\tDesperation, fear of losing control of the mind, dread of doing some frightful thing	external
74	Irritation Remedy	Irritability	4	Ingredients&leftpar;Flower Essences&rightpar;\r\n\nImpatiens\r\n\nClematis\r\n\nCherry Plum	Western Therapeutic Actions\r\n\nAssists in the emotional control of irritation and lashing out, regardless of the cause		Sample Indications\r\n\nFor emotional or physical irritation and impatience l	Suggested Dosage\r\n\n5 drops, directly onto the tongue, 3 times daily, or more frequently if needed\r\n\nIrritation Remedy can be repeated every 30 minutes during times of stress.\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nContact a licensed psychiatrist if extreme emotional conditions persist.	Notations\r\n\nThis flower remedy is designed for those times in life when circumstances has stretched a person too thin and frustration has settled into the psyche. Agitation clouds everything and you are unable to smell the roses and sense the beauty of life. Meditation is calling and setting priorities is essential. Remember your purpose in life is first to become aware of who you are. You bring this presence to all that you do. It is not in the doing, but in the being, you will find what you are looking for. Combining it will some of the hepatic formulas creates good results\r\n\n                                                          Flower Essences\r\n\n                                                               Key words\r\n\nClematis\r\n\n\tIndifferent, dreaminess, lack of attention, unconscious\r\n\nImpatiens\r\n\n\tImpatience, irritability, extreme mental tension\r\n\nCherry Plum\r\n\n\tDesperation, fear of losing control of the mind, dread of doing some frightful thing	external
75	Protection Remedy	Builds Shields	4	Ingredients  &leftpar;Flower Essences&rightpar;\r\n\nWalnut\r\n\nWhite Chestnut\r\n\nStar of Bethlehem	Western Therapeutic Actions\r\n\nHelps clear unwanted and unnecessary influences in ones life. It enables one to see more clearly where, what, and how these influences approach and affect wellness, therefore allowing the opportunity to make better choices and avoid them in the future.		Sample Indications\r\n\nExternal energies or keep interfering with the movement forward in life or when one feels bombarded or attacked by unwanted energies and someone elses emotional baggage	Suggested Dosage\r\n\n5 drops, directly onto the tongue, 3 times daily, or more frequently if needed\r\n\nProtection Remedy can be repeated every 30 minutes during times of stress and repetitive thought patterns.\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nContact a licensed psychiatrist if extreme emotional conditions persist.	Notations\r\n\nWhen the body is depleted, it is difficult to protect itself from external influences. To replenish the body, it is necessary to take blood and qi tonics. Also, when a person has a deep understanding of who they are, external influences pass through them and are emotionally unaffected.\r\n\n                                                  Flower Essences\r\n\n                                                       Key words\r\n\nWalnut\r\n\n\tOversensitive to ideas and influences, the link-breaker\r\n\nWhite Chestnut\r\n\n\tPersistent unwanted thoughts, mental arguments and conversations\r\n\nStar of Bethlehem\r\n\n\tShock or trauma, mental or physical	external
76	Radiation Remedy	Radiation Protection	4	Ingredients &leftpar;Flower essences&rightpar;\r\n\nAspen\r\n\nCherry Plum\r\n\nCrab Apple\r\n\nOlive\r\n\nWalnut\r\n\nWater Violet	Western Therapeutic Actions\r\n\nThis flower essence remedy helps release toxic emotions due to exposure to radiation		Sample Indications\r\n\nExposure to toxic levels of radiation	Suggested Dosage\r\n\n5 drops, directly onto the tongue, 3 times daily, or more frequently if needed\r\n\nRadiaion Remedy can be repeated every 30 minutes during times of stress.\r\n\nVariation is according to individual symptoms	Contraindications and Cautions \r\n\nUse Radiation Support to alleviate any injury to the body from radiation exposure.	Notations\r\n\nRadiation creates an excess acidic condition in the body. Miso soup, fermented foods, and the herb, Meadowsweet, help to balance the pH of the body. The other techniques that have been used from different traditions to alkalize the body are deep breathing, meditation, eating and chewing in a calm quiet setting, and saunas. Saunas are one of the few purification techniques that can remove heavy metals and deep seated chemicals from the body.\r\n\n                                                            Flower Essences\r\n\n                                                                 Key words\r\n\nAspen\r\n\n\tVague fears of unknown origin, anxiety, apprehension\r\n\nCherry Plum\r\n\n\tDesperation, fear of losing control of the mind, dread of \t\tdoing some frightful thing\r\n\nCrab Apple\r\n\n\tFeelings of uncleanness, despondent, despair\r\n\nOlive\r\n\n\tComplete exhaustion, mental fatigue\r\n\nWalnut\r\n\n\tOversensitive to ideas and influences, the link-breaker\r\n\nWater Violet\r\n\n\tPride, aloof, bear their grief in silence	external
104	Burn Lotion	Heals Burns	35	Ingredients&leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nAloe Vera\t\t\tLu Hui\r\n\nNettles\t\t\t\tUrtica Spp.\r\n\nLithospermum\t\tZi Cao Gen\r\n\nSanguisorba\t\t\tDi Yu\r\n\nSt. Johns Wort\t\tHypericum Perforatum\r\n\nPhellodendron\t\tHuang Bai	Western Therapeutic Actions\r\n\nVulnerary, antiseptic, anti-inflammatory, analgesic, antipruritic, emollient, and anodyne	Traditional Chinese Medicine\r\n\nClears heat and generates flesh	Sample Indications\r\n\nThe skin or other epithelial tissues are burned &leftpar;thermal and sun burns, radiation burns and chemical burns&rightpar;	External Application\r\n\nTopically, apply onto the cleansed area. Pour directly onto the affected area or use sterile gauze, reapply 3 times daily.\r\n\nIf gauze sticks onto the affected area, moisten before attempting to remove.	Contraindications and Cautions\r\n\nIf the burn is severe, seek qualified medical help immediately. If the gauze sticks to the burned area, moisten with warm water before trying to remove.	Notations \r\n\nBurn Lotion can be applied directly onto the cleansed burned area or diluted with purified water and used in the same way. \r\n\nNettles nourish the blood and supports connective tissue repair. Lithospernum and St. Johns Wort have anti-inflammatory actions and have qualities which clear damp/heat from the skin tissues. Sanguisorba clears heat from the skin and promotes the generation of new flesh. Phellodendron supports the other herbs in this formula with its strong actions of clearing damp/heat. Aloe Vera could stand on its own when healing skin tissue damage from burns because of its ability to clear heat and promote new flesh \r\n\nAfter the burn has healed, Calendula Cream or Silk Pond Cream may be used to help reduce scarring.\r\n\nThe Aloe Vera plant, similar to some other botanicals, requires age to develop its medicine. The plant is mature when it is seven years old. The Ginseng root also requires a minimum of seven years of growth before it is mature and harvested. \r\n\nIf someone uses a immature Aloe Vera plant for healing, some benefit can be experienced. However, the healing capacity of a mature plant is unsurpassed and excels when dealing with damaged skin and tissue damage. It heals both external and internal tissue inflammation. \r\n\nUse a fresh liquid gel for internal use. Take a shot glass of Aloe Vera gel, two times daily for internal inflammations. Because of its cold nature, someone who is suffering from a cold stomach or damp spleen should exercise caution when using this powerful tissue healer. Consider taking the dosage after a meal.	external
79	Dry Eyes	Moistens Eyes	28	Ingredients  &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nRehmannia, raw\t        Sheng Di Huang\r\n\nChrysanthemum\t        Ju Hua\r\n\nLycium fruit\t\t       Gou Qi Zi\r\n\nCornus\t\t\t       Shan Zhu Yu\r\n\nMarshmallow\t\t       Althea Officinalis\r\n\nEucommia\t\t       Du Zhong\r\n\nBilberry\t\t\t       Vaccinium Myrtillus\r\n\nSalvia\t\t\t       Dan Shen\r\n\nAnemarrhena\t       Zhi Mu\r\n\nEclipta\t\t\t       Han Lian Cao\r\n\nMoutan\t\t\t       Mu Dan Pi\r\n\nCuscuta\t\t\tTu Si Zi\r\n\nEyebright\t\tEuphrasia Officinalis\r\n\nPseudoginseng\tTien Chi\r\n\nPulsatilla\t\tBai Tou Weng\r\n\nCardamon\t\tSha Ren	Western Therapeutic Actions\r\n\nAlterative, depurative, demulcent, hepatic nutritive, tonic, \r\n\ncirculatory, and emollient	Traditional Chinese Medicine\r\n\nClears heat, nourishes the liver yin, fortifies the kidney yang, vitalizes the blood, and stops bleeding	Sample Indications\r\n\nDry eyes, eyestrain, macular degeneration, retinal degeneration, retinitis, and failing eyesight	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nUse with caution in cases that exhibit indigestion or spleen qi deficiency &leftpar;diarrhea, or a white coated, greasy tongue&rightpar;.	Notations \r\n\nIn Oriental Medicine the organs of the body are revealed on the face. This diagnostic tool allows the healer to see the tendency of the body functions and the internal organs prior to a sickness or illness. Prevention is one of the virtues of traditional medicines. Wisdom is in the gift of maintaining our health.\r\n\nThe health of the liver is revealed through the eyes and supported by the kidneys. From diverse herbal teachings, herbs that nourish the liver and enhance the kidneys are used for eye disorders. Dry Eyes is an adaptation from the Chinese formula, Qi Ju Di Huang Wan and Liu Wei Di Huang Wan.\r\n\nRaw Rehmannia is used instead of Prepared Rehmannia because the former clears heat and cools the blood in addition to nourishing the kidneys. Anemarrhena supports the actions of Rehmannia. Chrysanthemum expels wind/heat and soothes red, irritated eyes. Lycium fruit nourishes the essence. Cornus, Eclipta, and Cuscuta nourish the liver and kidneys and are wonderful tonics for all deep rooted liver and kidney weaknesses. Marshmallow root, a demulcent, brings moisture to the dry tissues. Eucommia fortifies the kidney yin and yang. Bilberry is cooling and nourishes the eyes. Eyebrights name speaks for itself. Culpeper wrote, If the herb was but as much used as it is neglected, it would spoil the spectacle makers trade. Salvia and Moutan stimulate the circulation of blood. Pseudoginseng  arrests internal hemorrhaging. Pulsatilla is a nervine and an alterative. Cardamon supports the digestion and balances the cooling effect of raw Rehmannia.\r\n\nRefer to the Facial Diagnosis chart on page 20.	external
80	Heat Wave	Overheating, Night Sweats	28	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nRehmannia, prep.\t\tShu Di Huang\r\n\nOats\t\t\t\tAvena Sativa\r\n\nAnemarrhena\t\tZhi Mu\r\n\nPhellodendron\t\tHuang Bai\r\n\nCornus\t\t\t\tShan Zhu Yu\r\n\nDioscorea\t\t\tShan Yao\r\n\nLycium fruit\t\t\tGou Qi Zi\r\n\nMoutan\t\t\t\tMu Dan Pi\r\n\nHoelen\t\t\t\tFu Ling\r\n\nShatavari\t\t\tAsparagus racemosa\r\n\nAlisma\t\t\t\tZe Xie\r\n\nGotu Kola\t\t\tHydrocotyle Asiatica\r\n\nBladderwrack\t\tFucus Vesiculosus\r\n\nBlack Cohosh\t\tCimicufuga Racemosa	Western Therapeutic Actions\r\n\nDemulcent, nutritive, restorative, nerve tonic, diuretic, alterative, and astringent	Traditional Chinese Medicine\r\n\nEnriches the yin, nourishes the kidney and yin, clears heat, and binds up the essence	Sample Indications\r\n\nHeat or dryness in the upper body, dark urine, hot flashes, night sweats, sore lower back, autoimmune diseases, chronic inflammations, and insomnia	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms\r\n\nü	Contraindications and Cautions\r\n\nUse supportive herbs for the spleen and stomach if the patient has weak appetite, loose stool, or nausea.	Notations\r\n\nHeat Wave is designed after the Chinese classic, Zhi Bai Di Huang or Anemarrhena, Phellodendron and Rehmannia Formula. Heat Wave differs from Graceful Movement because of the additional herbs included to clear additional internal heat, nourish the yin, and replenish the depletion. They both use the basic six herbs found in Liu Wei Di Huang Wan: Rehmannia, Cornus, Dioscorea, Moutan, Hoelen, and Alisma. The herbs, Anemarrhena and Philodendron have been added to Heat Wave because they are the key herbs for clearing heat in the upper part of the body and draining the excess fire, the classic hot flash syndrome. \r\n\nIn Oriental Medicine, excess heat of any type causes agitation of the spirit. Moutan helps to alleviate this excess heat build-up and is calming. Alisma helps to direct the qi back down towards the kidneys and is a diuretic. Cornus and Lycium fruit support the liver and kidneys and enhance the essence. Oats is included in this formula because of its wonderful ability to nourish the body and calm the nerves. Shatavari, an Ayurvedic herb, nourishes the yin and is cool in nature. It is one of the premier herbs used in India for menopausal symptoms and hormonal imbalances. Gotu Kola is a tonic and assists with mental and physical fatigue. Bladderwrack nourishes the thyroid, which governs body metabolism. Black Cohosh is an astringent and menopause specific.\r\n\nMenopausal hot flashes, afternoon feverishness, and excessive perspiration are symptoms that benefit greatly from this formula. In treating the whole spectrum of menopause, herbs that fortify the kidney yang &leftpar;fire&rightpar; are usually combined with these kidney yin &leftpar;water&rightpar; nurturing herbs.	external
81	Jade Screen Defense	Frquent Illness	28	Ingredients  &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nAstragalus\t\t\tHuang Qi\r\n\nGynostemma\t\t\tJiao Gu Lan\r\n\nGinseng, Siberian\t\tCi Wu Jia\r\n\nSiler\t\t\t\t\tFang Feng\r\n\nGuduchi\t\t\t\tTinospora Cordifolia\r\n\nHorehound\t\t\tMarrubium Vulgare\r\n\nDioscorea\t\t\tShan Yao\r\n\nHoly Basil\t\t\tOcimum Tenuiflorum\r\n\nPeony\t\t\t\tBai Shao Yao\r\n\nCinnamon twig\t\tGui Zhi\r\n\nOsha\t\t\t\tLigusticum Porteri\r\n\nLicorice, baked\t\tZhi Gan Cao\r\n\nGinger, fresh\t\t\tSheng Jiang	Western Therapeutic Actions\r\n\nRestorative, tonic, antihistaminic, alterative, anti-inflammatory, astringent, expectorant, and digestive	Traditional Chinese Medicine\r\n\nAugments, releases, and stabilizes the exterior, supplements the qi, supports the spleen, and clears heat	Sample Indications\r\n\nChronic and recurring infections, such as frequent colds and flu, upper respiratory infection, recurring infections in children or the elderly	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nThere are none known.	Notations\r\n\nJade Screen Defense is a cold and flu preventative, or can be used for recurring infections, seen in many school age children. It can be taken regularly during the fall and winter seasons, when contagious diseases are most prevalent. Patterned after a well known Chinese formula, Yu Ping Feng San or Jade Windscreen Powder, and supported by some time proven Western herbs, this formula is an excellent preventative from those nasty bugs. \r\n\nJade Screen Defense is specially designed for children and the elderly who find themselves very vulnerable during the cold winter months, and for those who have a compromised immune system. It can be used as a prophylactic during the flu season. When taken as a prophylactic, the lower dosages are recommended unless a patient is suffering from extreme depletion.\r\n\nAstragalus, Gynostemma, and Siberian Ginseng combine well together to build and strengthen the bodys immunity. Siler helps to release surface toxins and supports the spleen. Guduchi is anti-viral and anti-bacterial, plus enhances the immune system. Horehound clears heat, benefits the throat, and stimulates the digestion. Holy Basil is an expectorant, anti-viral, anti-bacterial, and promotes a healthy respiratory system. Peony, Cinnamon, Licorice, and Ginger combine together as in the Chinese formula Gui Zhi Tang. These herbs are used in a small quantity but an important addition to this formula, as they protect the exterior from invasion and help to nourish and stabilize the interior. Dioscorea has been included because of its ability to nourish the spleen and supplement the lung qi. Osha supports the protective nature of Cinnamon twig which releases external wind/cold.	external
82	Immuno Rebound	Compromised Immunity	28	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nGanoderma\t\t\tLing Zhi\r\n\nAstragalus\t\t\tHuang Qi\r\n\nRhodiola\t\t\t\tHong Jing Tian\r\n\nAshwaganda\t\t\tWithania Somnifera\r\n\nBurdock root\t\t\tArctium Lappa\r\n\nEchinacea\t\t\tEchinacea Angustifolia\r\n\nGuduchi\t\t\t\tTinospora Cordifolia\r\n\nTang Kuei\t\t\tDang Gui\r\n\nAtractylodes\t\t\tBai Zhu\r\n\nLycium fruit\t\t\tGou Qi Zi \r\n\nGentian\t\t\t\tGentiana Lutea\r\n\nUva Ursi\t\t\t\tArctostaphylos Uva Ursi\r\n\nLicorice, baked\t\tZhi Gan Cao\r\n\nGinger, dried\t\t\tGan Jiang\r\n\nWild Yam\t\t\tDioscorea Villosa	Western Therapeutic Actions\r\n\nRestorative, nutritive, digestive tonic, alterative, depurative, \r\n\nantispasmodic, and antiseptic	Traditional Chinese Medicine\r\n\nSupplements the qi, supports the spleen, nourishes the blood, relieves toxicity, and replenishes the essence	Sample Indications\r\n\nWeak or compromised immune system, low resistance to "bugs", easily fatigued, palpitations with anxiety, weak appetite, slow healing sores, and continuous spotting from uterine bleeding	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nThere are none known. Use with caution during pregnancy.	Notations\r\n\nImmuno Rebound is a gentle building tonic that restores the blood and qi that can be depleted from various chronic causes, emotional or physical. This internal imbalance is accompanied by a pale tongue with white coating and possible indentations on the sides. The complexion will be pallid &leftpar;pale&rightpar; or sallow &leftpar;yellowish&rightpar;, and the eyes will lack spirit or intensity. Because of the deficiency, the patient speaks with very few words, not wanting to exert the effort when there is so little energy left. Immuno Rebound, combining qi and blood tonics, is energetically patterned after Ba Zhen Tang or Tang Kuei and Ginseng Eight Combination, in combination with traditional Western herb specifics. It can be used prior to and throughout the cold/flu season as a protective agent against infection. This is especially important for the young and old, or those suffering from a compromised immune system. \r\n\nGanoderma is a fungi that supports the immune and endocrine systems. Reishi is another name for this mushroom and it has been used by AIDS patients. Ganoderma has added value because of its ability to detoxify the liver and eliminate toxic free radicals. Cancer patients use it to reduce the side effects of chemotherapy and radiation. In order to stimulate the immune system, the spleen and the blood have to be supplemented and nourished. Astragalus, Atractylodes, Hoelen, Licorice, Citrus, and Ginger support the spleen while Tang Kuei, Lycium fruit, and Gentian nourish the blood. Guduchi and Wild Yam support Ganoderma in the detoxification of the liver. Uva Ursi helps to flush the toxicity through the kidneys. When detoxification of the body is being done with herbal medicine it is a good practice to add a small amount of diuretics in the formula so that the toxins get flushed out of the kidneys.	external
83	Precious Blood	Blood Builder	28	Ingredients&leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nTang Kuei\t\t     Dang Gui\r\n\nRehmannia, prep.\t     Shu Di Huang\r\n\nPeony\t\t\t     Bai Shao Yao\r\n\nLeonurus\t\t     Yi Mu Cao\r\n\nHo Shou Wu\t\t     He Shou Wu\r\n\nAtractylodes\t\t     Bai Zhu\r\n\nHoelen\t\t\t     Fu Ling\r\n\nGinseng, Chinese\t     Ji Lin Ren Shen\r\n\nCnidium\t\t\t    Chuan Xiong\r\n\nGentian\t\t\t    Gentiana Lutea\r\n\nSaussurea\t\t    Mu Xiang\r\n\nMotherwort\t\t    Leonurus Cardiaca\r\n\nLicorice, baked\t    Zhi Gan Cao	Western Therapeutic Actions\r\n\nNutritive, emmenagogue, restorative, digestive tonic, and \r\n\nrelaxant	Traditional Chinese Medicine\r\n\nNourishes the blood, supplements the qi, invigorates the blood, and adjusts the menses	Sample Indications\r\n\nFatigue, tired blood, irregular menstruation &leftpar;amenorhea, dysmenorrhea, menorrhagia, and scanty menstruation, PMS, infertility, habitual miscarriage, and postpartum recovery	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nThere are none known.	Notations\r\n\nOriental Medicine states that blood is the mother of qi, and qi is the commander of blood. This reveals the intimate relationship between fire &leftpar;qi&rightpar; and water &leftpar;blood&rightpar; and the necessity to nurture them together when dealing with deficient syndromes. Precious Blood combines the Chinese classic blood tonic, Si Wu Tang or Tang Kuei Combination, with the classic qi tonic, Si Jun Zi Tang or Four Gentlemen Decoction, to create a formula that addresses a wide variety of gynecological disorders. A similar Chinese formula, Ba Zhen Yi Mu Wan or Eight Treasure Pill to Benefit Mothers, is a very popular patent formula in China.\r\n\nFrom another perspective, the oceans waters are controlled by the moon and in the Oneida teachings, the moon is called our ancient grandmother. This reveals the great powers of the moon and her deep connection with all women and all of life. A healthy womans menstruation will cycle rhythmically, as the moon, every 28 days. When a womans menstrual cycle &leftpar;some Native Americans call it the womans moon&rightpar; ends with the new moon and then ovulates close to the full moon, she is in harmony with nature and there will be fewer problems with improved fertility. \r\n\nBlood, like water, nourishes life. Seeds sprout, grow, mature, and bear fruit when given water. Blood creates the possibility for building future generations by bringing nourishment to our bones, which hold the ancient memory of who we are. Blood &leftpar;water&rightpar; feeds the dream and qi &leftpar;fire&rightpar; activates its desire. For this reason, a womens fertility is dependent upon the abundance of blood and the movement of qi. \r\n\nHo Shou Wu and Gentian have been added to enhance the blood and qi. Saussurea helps resolve lower abdominal distention and pain. Motherwort helps to calm the spirit and with Cnidium invigorates the blood and moves the qi.	external
84	Stamina Plus	Quick Energy, Adrenals	29	Ingredients&leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nAshwaganda\t\t\tWithania Somnifera\r\n\nGinseng, Siberian\t\tCi Wu Jia\r\n\nOats\t\t\t\tAvena Sativa\r\n\nAstragalus\t\t\tHuang Qi\r\n\nRhodiola\t\t\t\tHong Jing Tian\r\n\nDamiana\t\t\t\tTurnera Diffusa\r\n\nSarsaparilla\t\t\tSmilax Officinalis\r\n\nGentian\t\t\t\tGentiana Lutea\r\n\nSaw Palmetto\t\t\tSerenoa Serrulata\r\n\nLycium fruit\t\t\tGou Qi Zi \r\n\nCornus\t\t\t\tShan Zhu Yu\r\n\nLicorice, baked\t\tZhi Gan Cao	Western Therapeutic Actions Restorative, nutritive, stimulant, and nerve tonic	Traditional Chinese Medicine\r\n\nSupplements the qi, nourishes the blood, fortifies the kidneys, and replenishes the essence	Sample Indications\r\n\nFatigue, muscular burn out, stress, adrenal exhaustion, lack of zip in your step, tired body and tired brain	Suggested Dosage\r\n\n10 - 20 drops, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions \r\n\nContraindicated during acute febrile diseases. Use with caution in cases of yin deficiency with heat &leftpar;hot hands and feet, dry mouth with thirst for cold beverages, and night sweats&rightpar;.	Notations\r\n\nStamina Plus is used as an aid for optimal performance in any high stress busy environment, and as an energy boost in daily situations. This formula is also beneficial for athletic training and competition, for men and women athletes. \r\n\nAdaptogenic herbs exert a normalizing influence on the body, neither over-stimulating, nor inhibiting normal body functions. This quality enhances the bodies ability to cope with stress, whether it is physical or emotional. The adrenal glands are the beneficiaries of these adaptogenic qualities and are fueled by these herbs. Dopamine, norepinephrine &leftpar;known as noradrenaline outside the USA&rightpar;, and epinephrine are synthesized and stored in the adrenal glands. These compounds are responsible for maintaining the body in a homeostatic state during stressful situations. When these compounds are depleted from constant stress, the bodies ability to perform at a high level is diminished. Stamina Plus is a well-designed herbal formula for anyone who is requiring additional adrenal support during stressful or physically demanding situations.\r\n\nAshwaganda, Siberian Ginseng, and Rhodiola are known for their adaptogenic qualities. Oats is a premier nervine and restorative. Astragalus supplements the qi and blood, and supports the lung. Damiana is a kidney restorative and nervine. Sarsaparilla and Saw Palmetto enhance the circulation and fortify the kidney yang. Gentian is a highly regarded bitter tonic and has restorative qualities for the body. Lycium fruit nourishes the liver and kidney, and replenishes the essence. Cornus stabilizes and assists the kidney yang, nourishes the liver, and enriches the essence. Licorice supports the spleen and opens the channels.	external
90	Baby Ear Oil	Earache	10	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nAloe Vera\t\t\tLu Hui\r\n\nMullein\t\t\t\tVerbascum Thapsus\r\n\nCamphor\t\t\tCinnamonum Camphora\r\n\nEchinacea\t\t\tEchinacea Angustifolia\r\n\nGentiana\t\t\tLong Dan Cao\r\n\nGoldenseal\t\t\tHydrastis Canadensis\r\n\nScute\t\t\t\tHuang Qin\r\n\nGardenia\t\t\tZhi Zi\r\n\nSt. Johns Wort\t\tHypericum Perforatum\r\n\nPulsatilla\t\t\tBai Tou Weng\r\n\nAsafoetida\t\t\tFerula Asafoetida\r\n\nWormseed\t\t\tChenopodium Ambrosiodes\r\n\nWintergreen\t\t\tGaultheria Promcumbens\r\n\nBasil\t\t\t\tOcimum Basilicum\r\n\nSpearmint\t\t\tMentha Spicata\r\n\nLeptotaenia\t\t\tLomatium dissecutim	Western Therapeutic Actions\r\n\nAnodyne, analgesic, anti-inflammatory, alterative, antiseptic, and depurative	Traditional Chinese Medicine\r\n\nClears heat, relieves toxicity, drains liver fire, and resolves phlegm	Sample Indications\r\n\nEarache, ear infections, congestion, and inflammation of the ear canal	External Application\r\n\nMassage a small amount of Baby Ear Oil around the base and back of the ear, 3 times daily\r\n\nPlace some Baby Ear Oil on a sterile cotton ball and place gently into the ear, 3 times daily	Contraindications and Cautions\r\n\nThere are none known. Ear infections can be a serious condition. Consult a qualified health care practitioner if the condition persists.	Notations \r\n\nBaby Ear Oil loosens and clears wax build-up from the ear. The formula is gently absorbed through the tissues of the ear. In cases of ear pain and infections, it is important to protect the ears, head and neck from draughts and wind. \r\n\nMullein flower, the lead herb in this formula, excels in the treatment of ear aches with its astringent and pectoral qualities. In the summer, collect the yellow flowers just as they begin to open, or you can use the whole spike. Cover them immediately with olive oil and in three months you will have one of the best ear oils available. The Mullein leaf is preferred to the flower when treating respiratory complaints.\r\n\nBreast-feeding is the optimal way to support the babys immune system. If the baby is drinking cows milk, this might cause an excess amount of mucous and congestion in the ear canals. Organic cows milk has shown to be less mucous producing. Check to make sure the baby is not allergic to dairy products. If in doubt, use goat milk, soy milk, or rice milk. Many African, Native American, and Scandinavian people are unable to digest the proteins in cow milk. The milk from the smaller animals; goat, sheep, reindeer, contain different enzymes and are easily assimilate by most folks. Fermented dairy products also are easily assimilated, such as yogurt, kefir, or cottage cheese.\r\n\nA *Tofu Plaster placed on the forehead of the baby is a home remedy for lowering fevers. A warm *Salt Pack can be applied to the ear to alleviate some of the pain and inflammation.\r\n\n*Tofu Plaster: See External Applications\r\n\n*Salt Pack: \t See External Applications	external
85	Uplift the Chi	Hernia Prolapse	28	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nAstragalus\t\t\tHuang Qi\r\n\nRhodiola\t\t\t\tHong Jing Tian\r\n\nAtractylodes\t\t\tBai Zhu\r\n\nTang Kuei\t\t\tDang Gui\r\n\nLycium fruit\t\t\tGou Qi Zi\r\n\nAgrimony\t\t\tAgrimonia Eupatoria\r\n\nRaspberry leaf\t\tRubus Idaeus\r\n\nGinseng, Chinese\t\tJi Lin Ren Shen\r\n\nBupleurum\t\t\tChai Hu\r\n\nCimicifuga\t\t\tSheng Ma\r\n\nBlack Cohosh\t\tCimicufuga Racemosa\r\n\nSaussurea\t\t\tMu Xiang\r\n\nLicorice, baked\t\tZhi Gan Cao\r\n\nWitch Hazel\t\t\tHamamelis Virginiana	Western Therapeutic Actions\r\n\nRestorative, nutritive, astringent, digestive tonic, and \r\n\ndeobstruent	Traditional Chinese Medicine\r\n\nSupplements the qi, supports the spleen qi, nourishes the blood, and raises the yang	Sample Indications\r\n\nPsychological\r\n\nOn again  off again, wishy washy, difficult to follow through to the end, unable to control oneself, poor listener, excessive deliberation, emotionally drained, depression, and lacks clarity\r\n\n\tPhysical\r\n\nFatigue, sleep curled up, prolapse of organs, hemorrhoids, frequent miscarriage, weakness following a febrile disease, symptoms are intensified upon exertion, feverish with unknown origin, spontaneous sweating, postpartum disorders, incontinence, and menstrual spotting	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nAccording to Oriental Medicine, Uplift the Chi would be suited for a patient who has a pale, swollen tongue with a thin white coating. They will have thirst, except it will be for warm liquids. This is in contrast to yin deficiency thirst, in which cold liquids are preferred.	Notations\r\n\nUplift the Chi is a modified version of a highly used Chinese formulas, Bu Zhong Yi Qi Wan or Ginseng and Astragalus Combination. It is the foundation for many other formulas. In Oriental Medicine, when the middle burner &leftpar;spleen and stomach&rightpar; loses its strength, it no longer is able to restrain or hold things in their proper place. This is manifested on a physical level &leftpar;organ prolapse, incontinence, and bleeding disorders&rightpar;, and on an emotional level &leftpar;goes back and forth, constantly breaks commitments, and deliberates excessively&rightpar;. When using herbs on the physical level, we take higher dosages; and for the psychic or emotional level, we take the lower dosages. The lower dosage works like a homeopathic remedy and what they call in homeopathy, vibrational medicine. \r\n\nThe energy of the Earth plays a key role in this paradigm. To heal this collapsed condition it might be helpful if the patient reconnects with the Earth and allow themselves to be nourished back to vitality. A concept passed down to us states that our purpose in Life is to serve, to give; and be humble enough to receive. Our bodies can collapse if we give it all away and have not allowed ourselves to be nourished; a balanced life or body is not something we seek, but something we allow.	external
86	Antiseptic Drawing Ointment	Dependencies	5	Ingredients&leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nMarshmallow\t\t\tAlthea Officinalis\r\n\nLithospermum\t\tZi Cao\r\n\nPlantain\t\t\t\tPlantago Spp.\r\n\nSlippery Elm \t\t\tUlmus Fulva\r\n\nEchinacea\t\t\tEchinacea Angustifolia\r\n\nGoldenseal\t\t\tHydrastis Canadensis\r\n\nPhellodendron\t\tHuang Bai\r\n\nComfrey leaf\t\t\tSymphytum Officinale\r\n\nCalendula\t\t\tCalendula Officinalis\r\n\nBeeswax\r\n\nOlive Oil	Western Therapeutic Actions\r\n\nVulnerary, demulcent, absorbent, antiseptic, anti-inflammatory, alterative, and depurative	Traditional Chinese Medicine\r\n\nClears heat and toxicity	Sample Indications\r\n\nTopically, where impurities need to be drawn out from the epithelial tissues, infected wounds	External Application\r\n\nCleanse wounded area thoroughly before applying this ointment. After cleansing the wound, apply ointment to the affected area, or smear a small amount of ointment onto a sterile gauze and tape to area, 3 times daily\r\n\nü	Contraindications and Cautions\r\n\nIf the gauze sticks to the wound, moisten with warm water before trying to remove. Contact a physician immediately if the infected area begins to have hot, red streaks.	Notations \r\n\nInfections, swelling, and boils often indicate an impure blood stream. Care should be taken to keep the wound or broken skin area clean and away from possible sources of blood infections. It would be wise to stay out of public pools, away from dirt and chemicals until the wound has healed. Soaking the infected area in hot salty water, or applying hot, salty sterile cotton swabs to the infected area, three times daily, will assist the healing process. \r\n\nMarshmallow root is used internally and externally. Its moist, cool nature helps to soften boils and draw out pus. Lithospermum clears heat and toxicity and an excellent vulnerary. Plantain is an alterative and when applied topically, cleanses and promotes tissue repair. It is an excellent first aid herb. Pick a few leaves and apply topically to the tissue trauma, infected area or skin ulcer. Comfrey leaf , traditionally known as Knit Bone, is one of the premier botanicals for tissue healing. Its name means, to grow together. The old bone-setters would make a plaster with this botanical knowing of its ability to heal tissue and bones. Slippery Elm makes an excellent poultice by itself. Echinacea is a purifier. Phellodendron drains fire, relieves toxicity, and heals damp lesions. Calendula is an antiseptic, anti-fungal, and mends tissues.\r\n\nIf the skin tissue is broken, Comfrey leaf or root needs to be combined with blood purifiers and detoxicants as the wound heals rapidly. This is why cleansing herbs are an integral part of this ointment.	external
87	Blood Clear	Blood / Liver Cleanser	29	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nBurdock root\t\tArctium Lappa\r\n\nGardenia\t\tZhi Zi\r\n\nPeony, red\t\tChi Shao Yao\r\n\nLonicera\t\t\tJin Yin Hua\r\n\nBupleurum\t\tChai Hu\r\n\nNettles\t\t\tUrtica Spp.\r\n\nRehmannia, raw\tSheng Di Huang\r\n\nRed Clover\t\tTrifolium Pratense\r\n\nYellow Dock\t\tRumex Crispus\r\n\nYarrow\t\t\tAchillea Millefolium\r\n\nPrickly Ash\t\tZanthoxylum Americanum\r\n\nPlantain\t\t\tPlantago Spp.\r\n\nCleavers\t\t\tGalium Aparine\r\n\nLicorice\t\t\tGan Cao	Western Therapeutic Actions\r\n\nAlterative, depurative, and diuretic	Traditional Chinese Medicine\r\n\nClears heat, relieves toxicity, drains fire, cools and vitalizes the blood	Sample Indications\r\n\nAll infections &leftpar;internal & external&rightpar;, skin disorders, boils, constipation, herpes, hepatitis, rheumatoid arthritis, and swollen lymph glands	Suggested Dosage\r\n\n5 - 20 drops, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nUse with caution in pregnancy and high blood pressure. Use with caution in cases of cold from deficiency.	Notations\r\n\nBlood Clear acts through the blood, lymphatic and glandular systems, the mucous membranes, and kidneys. The primary actions of this formula is to breakdown and eliminate metabolic wastes by clearing the excess heat and toxins from the qi and blood. Once the blood is cleansed, there is better assimilation and absorption of nutrients. This facilitates the regeneration of healthy new tissues and blood cells throughout the body. \r\n\nInternal toxicity or chronic infections are not always accompanied by a fever. It reveals itself in different ways. Chronic toxicity or chronic viral infections cause internal inflammations, skin inflammations, joint inflammations, digestive disturbances, irritability, disturbed sleep, lethargy, and chronic fatigue. The immune system becomes compromised when it has to constantly combat a chronic internal infection or internal toxic heat. When the immune system becomes compromised, the body no longer has the power to generate a fever. In these situations, restorative herbs have to be added to correct this imbalance.\r\n\nGardenia clears heat and damp/heat from the interior level of the body, in particular the qi level. Burdock root cleanses the lymphatic system and supports Gardenia. Dandelion clears heat and toxicity from the liver. Bupleurum releases heat from the exterior level and activates the liver. Peony clears heat from the blood and activates the blood. \r\n\nIf the tongue is pale and swollen, add restorative herbal tonics, such as Immuno Rebound, Build Pure Essence, or Chi Rebound. If the tongue is red or red raised papillae, clear the toxic heat &leftpar;inflammation&rightpar; before adding restorative herbal tonics. Remember the herbal rule of thumb; clear heat before restoring!	external
88	Clear Throat	Sore Throat, Strep	29	Ingredients  &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nScrophularia\t\t\tXuan Shen\r\n\nIsatis leaf\t\t\tDa Qing Ye\r\n\nEchinacea\t\t\tEchinacea Angustifolia \r\n\nLonicera\t\t\t\tJin Yin Hua\r\n\nRehmannia, raw\t\tSheng Di Huang\r\n\nOsha\t\t\t\tLigusticum Porteri\r\n\nPlatycodon\t\t\tJie Geng\t\t\r\n\nLicorice\t\t\t\tGan Cao \r\n\nGoldenseal\t\t\tHydrastis Canadensis\r\n\nPoke Root\t\t\tPhytolacca Spp.\r\n\nMarshmallow\t\t\tAlthea Officinalis\r\n\nRaspberry leaf\t\tRubus Idaeus\r\n\nSage\t\t\t\tSalvia Officinalis\r\n\nBayberry\t\t\t\tMyrica Cerifera\r\n\nPeppermint\t\t\tBo He	Western Therapeutic Actions\r\n\nAnti-viral, anti-bacterial, demulcent, astringent, alterative, \r\n\nantiseptic, emollient, and aromatic	Traditional Chinese Medicine\r\n\nClears heat, relieves fire toxicity, cools the blood, and dissipates nodules	Sample Indications\r\n\nSore throat, fever, tonsillitis, mumps, and swollen lymph glands	Suggested Dosage\r\n\n10 - 40 drops, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindication and Cautions\r\n\nContraindicated during pregnancy. Clear Throat expels externally-contracted wind/heat disorders &leftpar;fever, slight chills, sore throat, swollen glands, and headache&rightpar;.	Notations \r\n\nClear Throat addresses febrile contagious diseases and is suited for most constitutional types, the young and the old. For maximum results, hold each dosage of Clear Throat in the back of the throat for a minute, and allow the extract to absorb into the lymph tissues. This allows for some local soothing action.\r\n\nScrophularia leads this formula because of its ability to clear toxic heat &leftpar;febrile diseases&rightpar; in the upper body, cool the blood, and dissipate nodules in the neck and throat &leftpar;swellings&rightpar;. Rehmannia supports the actions of Scrophularia with its clearing and cool nature. Isatis leaf clears toxic heat and is used for contagious febrile diseases, regardless of ones constitution. Lonicera is a Chinese classic for acute febrile diseases and can be used for exterior &leftpar;warm febrile diseases&rightpar; or interior heat &leftpar;chronic viral or bacterial infections&rightpar;. Osha, Apache bear root, is anti-viral and anti-bacterial. Echinacea is used because of its ability to reduce infections, fevers, inflammation, suppuration, and nasal discharge. Licorice &leftpar;raw&rightpar; clears fire toxicity from the throat and combines well with Platycodon. They are a classic combination for sore throats. When Licorice is honey baked, it strengthens the spleen, alleviates spasms, smoothes the pulses, and arrests palpitations. Poke root resolves swollen lymph nodes. Marshmallow root soothes inflamed mucous membranes. Sage is an astringent and excellent cleanser for the throat. Bayberry is an deobstruent and cleanser.\r\n\nMake a tea from green scallions. Bring two cups of water to a boil and remove from the heat. Add six chopped green onions &leftpar;include the white rootlets&rightpar;. Let steep for twenty minutes. Drink 1/2 cup of green onion tea every two hours for excellent results. Avoid dairy products, red meat, caffeine, and refined sugar during the acute stages of this disorder.	external
89	Ear Clear	Ear Infection	28	Ingredients  &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nMullein\t\t\tVerbascum Thapsus\r\n\nColtsfoot\t\tTussilago Farfara\r\n\nForsythia\t\tLian Qiao\r\n\nLonicera\t\t        Jin Yin Hua\r\n\nIsatis root\t\tBan Lan Gen\r\n\nEchinacea\t\tEchinacea Angustifolia\r\n\nChrysanthemum\tJu Hua\r\n\nCnidium\t\t\tChuan Xiong\r\n\nBalm Of Gilead\tPopulus Balsamifera\r\n\nMagnolia flower\tXin Yi Hua\r\n\nSiler\t\t\t\tFang Feng\r\n\nWild Indigo\t\tQing Dai\r\n\nGoldenseal\t\tHydrastis Canadensis\r\n\nPulsatilla\t\tBai Tou Weng	Western Therapeutic Actions\r\n\nAlterative, anti-viral, anti-bacterial, decongestant, nervine, \r\n\ndemulcent, astringent, tonic, detergent, and antiseptic	Traditional Chinese Medicine\r\n\nClears heat, relieves toxicity, releases the exterior, and resolves dampness	Sample Indications\r\n\nEar infections, ear congestion, otalgia, ear inflammation, build-up of ear wax, otitis media, and swimmers ear	Suggested Dosage\r\n\n1  2 teaspoons, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nContraindicated during pregnancy. Ear pain might indicate a serious infection and could result in damaging the ear membrane or ear drum. If the condition persists, seek professional medical advise.	Notations \r\n\nEar Clear is a wonderful example where Oriental and Galenic Medicine meld in herbal formulations. Mullein, the lead herb in this formula, is widely used in respiratory and ear formulas. The anti-inflammatory, resolvent, and resorbent qualities of Mullein make it a perfect herb for all ear canal inflammations. By adding the fresh Mullein flower to olive oil, one can make a wonderful ear drop remedy for all ages. \r\n\nColtsfoot, known as Kuan Dong Hua in Oriental medicine, is an excellent expectorant and helps to resolve phlegm. Forsythia, Lonicera, Isatis root, and Echinacea help to relieve inflammation and clear heat. Chrysanthemum clears wind/heat. Cnidium expels wind and alleviates pain. Balm of Gilead, Magnolia flower and Siler are commonly used in resolving phlegmatic conditions of the sinuses and ear canals. Wild Indigo is an antiseptic and can be used externally on skin ulcers. Goldenseal, imbued with the two alkaloids, hydrastine and berberine, is a bitter tonic and helps to heal debilitated mucous membranes. Pulsatilla relieves fire toxicity.\r\n\nWhenever there is an ear infection, mucous forming foods should be eliminated from the diet, especially dairy.\r\n\nThe following recipe creates an excellent home remedy for earaches: \r\n\nGrate 1/4 tsp. of ginger root and add to 1/4 tsp. of sesame oil. Warm slightly. Put two drops of this warm solution onto a sterile cotton ball and place in the ear. Reapply with a fresh cotton ball and two drops of the warm solution, three times daily.\r\n\n*Salt pack - earache: See External Application	external
91	Echinacea Plus	Infection Immunity	29	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nEchinacea\t\tEchinacea Angustifolia\r\n\nLonicera\t\t\tJin Yin Hua\r\n\nAstragalus\t\tHuang Qi\r\n\nOregon Grape\tBerberis Aquafolium\r\n\nIsatis leaf\t\tDa Qing Ye\r\n\nOsha\t\t\tLigusticum Porteri\r\n\nGoldenseal\t\tHydrastis Canadensis\r\n\nSt. Johns Wort\tHypericum Perforatum\r\n\nPropolis\t\t\tResina Propoli\r\n\nBarberry\t\t\tBerberis Vulgaris\r\n\nLicorice\t\t\tGan Cao\r\n\nFennel\t\t\tFoeniculum Vulgare	Western Therapeutic Actions\r\n\nAnti-viral, anti-bacterial, carminative, alterative, analgesic, tonic, cholagogue, diuretic, and digestive	Traditional Chinese Medicine\r\n\nCClears heat, relieves toxicity, supplements the qi, and harmonizes the stomach	Sample Indications\r\n\nAcute febrile diseases, colds, flu, fevers, earaches, and bacterial or viral infections	Suggested Dosage\r\n\n5 - 20 drops, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nContraindicated in cases of yin deficiency with heat, or reckless movement of blood. Use with caution during pregnancy. Patients who are undergoing chemotherapy should not use this formula as it contains St. Johns Wort.	Notations \r\n\nEchinacea Plus is designed to treat the early stages of warm febrile and contagious diseases. This formula can be used at a lower dosage for preventative measures. This is especially important for the elderly, the young, or those suffering from a compromised immune system. \r\n\nEchinacea Angustifolia is the most medicinal of the Echinacea family. Mass marketed, overused, and now on the endangered species list, Echinacea Angustifolia has long been used throughout Europe and by the Plains Indians. After the summer harvest, the Fort Peck region of Montana looks like a waste land of turf balls due to all of the digging. This speaks to the importance of extracts versus tablets or capsules. When herbs are extracted, a minimum of ten times the amount of medicinal compounds from that herb can be obtained compared to using the dried form.\r\n\nLonicera is widely used for contagious diseases as it contains anti-viral and anti-bacterial qualities. Astragalus is a premier immune system stimulant and can be found in a wide variety of formulas. Oregon Grape root contains berberine, which is also found in Barberry, Coptis, Phellodendron and Goldenseal. Berberine treats damp/heat disorders and is an antiseptic. Isatis leaf has anti-viral and anti-bacterial actions, and in Oriental Medicine, this action is called, clearing toxic heat. Osha, or Bear root, is a strong anti-viral and anti-bacterial herb, especially for the respiratory system. In small dosages, it is used for protection and the release of negative energies. Fennel and Licorice protect the stomach from the other cooling herbs, which makes this formula effective for long-term use.	external
92	FLS  (flu like symptoms)	Flu Like Symptoms	29	Ingredients&leftpar;Homeopathic&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nCrawley Root\t\t\tCorallorhiza Odontorhiza\r\n\nBoneset\t\t\t\tEupatorium Perfoliatum\r\n\nPhosphoric Acid\t\tPhosphoric Acid\r\n\nAconite\t\t\t\tAcontium Napellus\r\n\nBryonia\t\t\t\tBryonia Dioica	Western Therapeutic Actions\r\n\nAnti-inflammatory, analgesic, antipyretic, diaphoretic, sedative, and febrifuge	Traditional Chinese Medicine\r\n\nReleases pathogenic influences from the exterior	Sample Indications\r\n\nEarly stages &leftpar;first or second day only&rightpar; of fever from influenza, colds, with aches and pains	Suggested Dosage\r\n\n5 - 20 drops, every 2 hours\r\n\nReduce dosage as symptoms subside\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nDiscontinue the consumption of raw, cold, spicy, or greasy foods, coffee, and alcohol while taking this homeopathic remedy.	Notations\r\n\nFLS &leftpar;flu like symptoms&rightpar; is a homeopathic remedy is often fast acting, and clears most fevers. If feverish conditions reoccur frequently, check for the cause, seat of toxicity, or deficiency. \r\n\nRemember that a fever is an attempt by the body to burn off toxic states. Rest and drink plenty of fluids.\r\n\nHomeopathic Properties\r\n\nCrawley Root\t                 quick acting and powerful diaphoretic, muscular pain\r\n\nBoneset\t\t                 slow and persistent febrifuge and \r\n\n\t\t\t                diaphoretic, bone pain\r\n\nPhosphoric Acid\t        debility and acute diseases, listless\r\n\nAconite\t\t\t       syndromes that come on suddenly, \r\n\n\t\t\t              out of the blue, anti-inflammatory\r\n\nBryonia\t\t\t      relieves fevers and colds with a bronchial\r\n\n                                      nature, pain aggravated by motion\r\n\n A *Tofu Plaster applied to the forehead is an excellent home remedy in bringing down fevers. Drink plenty of fluids during feverish conditions, get rest, and sip on some homemade broth.\r\n\n*Tofu Plaster: See External Applications	external
93	Gargle Mouthwash	Mouth Gargle	14	Ingredients &leftpar;Herbal Extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nMarshmallow\t\tAlthea Officinalis\r\n\nMyrrh\t\t\tMo Yao\r\n\nPrickly Ash\t\tZanthoxylum Americanum\r\n\nBistort\t\t\tPolygonurn Bistorta\r\n\nChaparral\t\t        Larrea Mexicana\r\n\nTang Kuei\t\t        Dang Gui\r\n\nRehmannia, raw\tSheng Di Huang\r\n\nRed Sage\t\t        Salvia Colorata\r\n\nRaspberry leaf\t\tRubus Idaeus\r\n\nMoutan\t\t\tMu Dan Pi\r\n\nRhatany Root\t\tKrameria Triandra\r\n\nCimicifuga\t\tSheng Ma\r\n\nCoptis\t\t\tHuang Lian\r\n\nGoldenseal\t\tHydrastis Canadensis\r\n\nPeppermint\t\tBo He	Western Therapeutic Action\r\n\nAntiseptic, anti-inflammatory, anti-bacterial, anti-viral, astringent, styptic, alterative, depurative, and demulcent	Traditional Chinese Medicine\r\n\nDrains stomach fire, cools the blood, and nourishes the yin	Sample Indications\r\n\nBad breath, gingivitis, toothache, bleeding and sores of the gums, and frontal headache	External Application\r\n\nPlace one capful of Gargle Mouthwash in a small amount of cold water. Gargle for thirty seconds and expectorate the herbal liquid into the sink.\r\n\nRepeat this 2 times daily for healthy gums and \r\n\n3 times daily for diseased gums or toothache.	Contraindications and Cautions\r\n\nExternally, when used as a mouthwash, there are none known. If taken internally, this remedy is contraindicated for cases with a wind/cold condition &leftpar;pale tongue with thin white coating&rightpar;, or gum and teeth problems due to kidney deficiency &leftpar;pale, swollen tongue&rightpar; and during pregnancy.	Notations \r\n\nThe stomach energy channel supplies the gums and teeth with blood and chi. When the stomach overheats, the smooth flow of chi becomes obstructed and gives rise to rebellious fire. The mouth cavity is adversely affected. Bleeding gums, mouth sores, toothache, and bad breath are some of the results of this injurious fire. This remedy can also be taken internally for severe conditions. Take 1/2 teaspoon, 3 times a day until the symptoms have decreased. Avoid heavy, rich foods &leftpar;creates heat&rightpar; or cold foods &leftpar;obstructs the movement of chi and transforms into fire&rightpar;. \r\n\nMarshmallow root, the lead herb in this remedy, is a demulcent, clears heat, and nourishes the yin. It soothes inflamed tissue membranes, moisturizes, and is used internally and externally. Myrrh is an antiseptic, cooling, and promotes tissue repair. Prickly Ash is an anti-infective and relieves toothaches. Bistort \r\n\nacts as an astringent, promotes tissue repair from gum diseases, and firms loose teeth. Chaparral is an anti-infective and antiseptic with qualities that help to clear fire toxicity. The aromatic Red Sage benefits the gum tissues and throat with its astringent and antiseptic properties. Rhatany Root is an astringent, promotes tissue repair, and benefits soft spongy gums.\r\n\nThe Chinese herbs used in this remedy are patterned after Qing Wei San. The Chinese herb, Coptis, is similar in action to Goldenseal, and is unsurpassed in its ability to drain fire. Raw Rehmannia and Moutan assist by cooling the blood. Tang Kuei promotes the movement of blood and the creation of new flesh.	external
94	Gum Lotion	Gum Disease	16	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nMyrrh\t\t\tMo Yao\r\n\nRhatany Root\t\tKrameria Triandra\r\n\nTang Kuei\t\t        Dang Gui\r\n\nPrickly Ash\t\tZanthoxylum Americanum\r\n\nRehmannia, raw\tSheng Di Huang\r\n\nScute\t\t\tHuang Qin\r\n\nGoldenseal\t\tHydrastis Canadensis\r\n\nMoutan\t\t\tMu Dan Pi\r\n\nCimicifuga\t\tSheng Ma\r\n\nCoptis\t\t\tHuang Lian\r\n\nPropolis\t\t\tResina Propoli\r\n\nWitch Hazel\t\tHamamelis Virginiana	Western Therapeutic Actions\r\n\nVulnerary, antiseptic, astringent, anti-bacterial, anti-viral, and alterative	Traditional Chinese Medicine\r\n\nClears heat, reduces swelling, and generates flesh	Sample Indications\r\n\nMouth sores, pyorrhea, gum disease, bleeding gums, and gingivitis	External Application\r\n\nBrush the teeth and gargle with Gargle Mouthwash. \r\n\nGently massage Gum Lotion onto the gums for one minute, 3 times daily\r\n\nMouth Sores:\r\n\nApply Gum Lotion directly onto mouth sores, 3 times daily	Contraindications and Cautions\r\n\nContraindicated during pregnancy.	Notations \r\n\nOral hygiene is essential to combat gum disease. Consult with a dentist who practices preventative dentistry to establish a healing program. Gum disease and teeth problems can be due to an imbalanced digestive system, toxic heat in the blood, and/or depleted energy in the kidneys. If there are signs of deficiency, support the cleansing action of this remedy with restorative herbal remedies.\r\n\nGum Lotion and Gargle Mouthwash utilize the healing action of many of the same herbs as they are dealing with infection, tissue degeneration, and teeth problems. \r\n\nPropolis is a vulnerary with cleansing actions and Witch Hazel is an astringent.	external
95	Harmony Lotion	Abcesses, Bed Sores	1	Ingredients &leftpar;Herbal Extracts&rightpar;\r\n\nListed by common and pin yin or latin names, in sequence from largest to smallest amount by quantity.\r\n\nPlantain\t\t        Plantago Spp.\r\n\nComfrey leaf\t\tSymphytum Officinalis\r\n\nEchinacea\t\t        Echinacea Angustifolia\r\n\nGoldenseal\t\tHydrastis Canadensis\r\n\nSt. Johns Wort\t\tHypericum Perforatum\r\n\nDragons Blood\t\tXue Jie\r\n\nTypha\t\t\tPu Huang\r\n\nCalendula\t\t        Calendula Officinalis\r\n\nWitch Hazel\t\tHamamelis Virginiana	Western Therapeutic Actions\r\n\nVulnerary, alterative, depurative, antiseptic, anodyne, analgesic, and astringent	Traditional Chinese Medicine\r\n\nClears toxins, dispels blood stasis, alleviates pain, and generates flesh	Sample Indications\r\n\nWounds, injuries, surgery, sprains, fractures, and physical traumas	External Application\r\n\nApply topically to the affected area, 3 times daily	Contraindications and Cautions\r\n\nThere are none known.	Notations\r\n\nThis topical lotion restores balance to the tissues and eases discomfort. It is specifically useful in the healing of wounds where the flesh has been injured or cut.	external
96	Lymph Clear	Lymph Cleanser	29	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nBurdock root\t\t\tArctium Lappa\r\n\nEchinacea\t\t\tEchinacea Angustifolia\r\n\nScrophularia\t\t\tXuan Shen\r\n\nForsythia\t\t\tLian Qiao\r\n\nLonicera\t\t\t\tJin Yin Hua\r\n\nSarsaparilla\t\t\tSmilax Officinalis\r\n\nBladderwrack\t\tFucus Vesiculosus\r\n\nPrunella\t\t\t\tXiao Ku Cao\r\n\nPoke Root\t\t\tPhytolacca Spp.\r\n\nUva Ursi\t\t\t\tArctostaphylos Uva Ursi\r\n\nGoldenseal\t\t\tHydrastis Canadensis\r\n\nGoldenrod\t\t\tSolidago Virgaurea\r\n\nNeem\t\t\t\tAzadirachta Indica	Western Therapeutic Actions\r\n\nAlterative, depurient, absorbent, diuretic, and antiseptic	Traditional Chinese Medicine\r\n\nDisperses wind/heat, clears heat, and relieves toxicity	Sample Indications\r\n\nInitial stages of infectious and contagious diseases, colds, flu, upper respiratory tract infection, acute bronchitis, swollen lymph nodes, and measles	Suggested Dosage\r\n\n5 - 20 drops, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nContraindicated during pregnancy.	Notations\r\n\nLymph Clear is highly beneficial when taken at the first signs of an infectious or contagious disease, and prevents the infection from descending deeper into the lower respiratory tract. Lymph Clear is also very effective for cleansing of the lymphatic system in the absence of an infectious or contagious disease. Difficult glandular blockages have responded well to Lymph Clear, including small breast lumps that occur during menstruation. \r\n\nA synergy of time proven Western herbs and two Chinese formulas, Jie Geng Tang or Platycodon Decoction and Yin Qiao San or Lonicera and Forsythia Formula creates Lymph Clear. One of the functions underlying this herbal formula, according to Oriental Medicine, is to expel the external pathogenic influence &leftpar;febrile disease/viral or bacterial&rightpar; before it penetrates deeper into the body. \r\n\nBurdock root treats a broad range of disharmonies. One of its functions is purification, and has the ability to cleanse the lymph system. Burdock seed is used primarily for treating the throat and resolving skin blemishes. Sarsaparilla supports Burdock root with its eliminative, diaphoretic, and detoxicant actions. Forsythia and Lonicera are a classic combination when treating infectious and contagious diseases in their early stages. Bladderwrack, Scrophularia, and Prunella help to resolve enlarged lymph nodes. Poke Root is a strong detoxicant and clears lymph and liver congestion. Uva Ursi, with its diuretic actions and with support from Goldenrod, expels the toxins via the kidneys. Goldenseal drains the damp/heat and heals the mucous membranes. Neem, an Ayurvedic herb, supports the actions of this formula with its anti-viral, anti-bacterial, and cleansing actions.\r\n\nAvoid drafts, eat plenty of homemade soups, eat some garlic, drink peppermint tea, and rest. Hot spicy foods, dairy, seafood, alcohol, and caffeine should be avoided during any infectious disease. Let your body rest and heal.	external
97	Red Eye	Eye Inflammation	29	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nChrysanthemum\t     Ju Hua\r\n\nMorus leaf\t\t     Sang Ye\r\n\nFraxinus\t\t\t    Qin Pi\r\n\nLophatherum\t    Dan Zhu Ye\r\n\nCassia seed\t\t    Jue Ming Zi\r\n\nNettles\t\t\t    Urtica Spp.\r\n\nMarshmallow\t\t    Althea Officinalis\r\n\nBuddleia\t\t\t    Mi Meng Hua\r\n\nTribulus\t\t\t    Bai Ji Li\r\n\nRaspberry leaf\t    Rubus Idaeus\r\n\nBilberry\t\t\t    Vaccinium Myrtillus\r\n\nEyebright\t\t    Euphrasia Officinalis\r\n\nBayberry\t\t\t    Myrica Cerifera\r\n\nGoldenseal\t\t    Hydrastis Canadensis	Western Therapeutic Actions\r\n\nAntiseptic, detoxicant, astringent, anti-inflammatory, demulcent, and emollient	Traditional Chinese Medicine\r\n\nDrains liver fire, benefits the eye, and dispels wind/heat	Sample Indications\r\n\nConjunctivitis, styes, allergies, itchy eyes, excessive tearing, blood shot eyes, and as an adjunct therapy for failing vision, cataracts, glaucoma, and retinal displacement	Suggested Dosage\r\n\n5 - 20 drops, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nContraindicated during pregnancy.	Notations\r\n\nRed Eye is a modified version of Sang Ju Yin or Morus and Chrysanthemum Combination, and reflects the Oriental and Galenictraditional concepts that the health of the eye is connected to the functioning of the liver. In Oriental Medicine, the herbs used in this formula are noted for their ability to clear the excess heat from the liver and expel the wind/heat which can cause various types of inflammations. \r\n\nChrysanthemum, Morus leaf, and Cassia seed clear the liver, benefit the eye, and expel wind/heat. Fraxinus, Lophatherum, and Goldenseal alleviate styes, and red inflamed eyes. Nettles is a detoxicant and blood builder. Marshmallow soothes irritated mucous membranes. Buddleia expels wind and soothes inflamed eyes with excessive tearing. Tribulus calms the liver and anchors the yang, which benefits the eye. Raspberry leaf is an anti-inflammatory, astringent, and promotes tissue repair. Bilberry and Eyebright are detoxicants and restore the vision. Bayberry is an astringent and circulatory stimulant.\r\n\nAfter the acute symptoms have been alleviated, herbal formulas that nourish the blood and yin of the liver and kidney could be considered.\r\n\nDietary recommendations include the removal of alcohol, fried foods, caffeine and red meat during the healing process. A diet rich in dark green vegetables, fruits, olive oil, nuts and seeds, fish, and rice will benefit the healing of the liver. \r\n\nChronic frustration, irritability, anger, and the inability to express deep seated emotions are healed by deep compassion. A fiery eye holds contempt and blurred vision is the resistance to look clearly at the reality of this world and our predicament.	external
98	Skin Fire	Hives	29	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nShave Grass\t\t\tMu Zei\r\n\nNeem\t\t\t\tAzadirachta Indica\r\n\nBurdock root\t\t\tArctium Lappa\r\n\nBurdock seed\t\tNiu Bang Zi\r\n\nTribulus\t\t\t\tBai Ji Li\r\n\nMeadowsweet\t\tFilipendula Ulmaria\r\n\nRed Clover\t\t\tTrifolium Pratense\r\n\nSchizonepeta\t\t\tJing Jie\r\n\nCicada\t\t\t\tChan Tui\r\n\nMistletoe\t\t\tViscum Album\r\n\nCouchgrass\t\t\tAgropyron Repens\r\n\nGoldenseal\t\t\tHydrastis Canadensis\r\n\nWahoo\t\t\t\tEuonymus Atropurpureus\r\n\nMezereum\t\t\tDaphne Mezereum	Western Therapeutic Actions\r\n\nAntihistaminic, antipyretic, alterative, depurative, antacid, diuretic, demulcent, and anti-inflammatory	Traditional Chinese Medicine\r\n\nRReleases the exterior, clears heat, and relieves toxicity	Sample Indications\r\n\nHives, allergic skin rashes, red and itchy skin, and eczema	Suggested Dosage\r\n\n10 - 40 drops, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nContraindicated during pregnancy.	Notations\r\n\nSkin Fire infuses the herbal wisdom of the Orient and the West in dealing with hives. Shave Grass combines with Tribulus to disperse wind/heat and calm the liver. Neem is an analgesic and antipyretic. Meadowsweet is an analgesic, antipyretic, and anti-inflammatory. Red Clover is a detoxicant with cooling actions and a relaxant. Schizonepeta and Cicada vent rashes and alleviate itching. Mistletoe is a nervine and relaxant. Couchgrass, somewhat similar to the Chinese Coix &leftpar;Yi Yi Ren&rightpar;, is a diuretic and soften skin masses and draws out pus. Couchgrass is also a strong detoxicant or purifier. Goldenseal is an alterative and detergent. Wahoo is an alterative and cholagogue. Mezereum is an anti-inflammatory used for eczema and skin disorders.\r\n\nBurdock root helps to clear toxicity through the kidneys while Burdock seed helps to release surface heat and relieve toxicity by venting. This is an interesting combination of two different parts of an herb. Western herbalists rely upon the root and Oriental herbalists rely upon the seed. When used together, they create a wonderful synergy in supporting the actions of this herbal formula. \r\n\nIf the skin reaction is an allergic reaction to food, Ginger tea or Licorice tea will help to eliminate the allergen. Ginger tea will also relieve a toxic reaction to an herb. Avoid hot spicy foods during an outbreak of the hives!\r\n\nHives might have a strong repugnant or repulsive emotional component linked to an outbreak. In dealing with this type of reaction, a safe environment is provided for, and the patient encouraged to express what it is that they find so repugnant. It is important to welcome these feelings without any desire to fix or change them. Emotions are an integral part of our inner life. In the acknowledgment of our feelings, we become less reactive and less compulsive in our behavior.	external
114	Joint Ease	Arthritis, Joint Pain	28	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nBurdock root\t\t   Arctium Lappa\r\n\nMeadowsweet\t   Filipendula Ulmaria\r\n\nBoswellia\t\t   Boswellia Serrata\r\n\nCouchgrass\t\t   Agropyron Repens\r\n\nGentiana, macro.\t   Qin Jiao\r\n\nTurmeric\t\t   Curcuma Longa\r\n\nDu Huo\t\t\t   Tu Huo\r\n\nPrickly Ash\t\t   Zanthoxylum Americanum\r\n\nTang Kuei\t\t   Dang Gui\r\n\nMorus twig\t\t   Sang Zhi\r\n\nWintergreen\t\t   Gaultheria Promcumbens\r\n\nWhite Willow bark\t   Salix Alba\r\n\nUva Ursi\t\t\t   Arctostaphylos Uva Ursi\r\n\nGuaiacum\t\t   Guaiacum Officinale \r\n\nGinger, dried\t\t   Gan Jiang	Western Therapeutic Actions\r\n\nAnti-inflammatory, analgesic, diuretic, alterative, depurative, and antacid	Traditional Chinese Medicine\r\n\nDispels wind/dampness, and disperses painful obstruction	Sample Indications\r\n\nArthritis, rheumatism, bursitis, stiff and achy joints, lumbago, and osteoarthritis	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nThere are none known.	Notations\r\n\nJoint Ease helps to clear acid deposits in the joints and the surrounding tissues, relieves pain, and supports joint lubrication and mobility. There are a number of causes for joint pain: hereditary, environmental, dietary, work-related, and emotional. The more difficult cases lie in the hereditary factor. The imbalance has been carried for many generations and the underlying disorder has never been corrected. The immobility of the joints or lack of freedom of movement seems to hold the patient back in life. Generational disorders take patience to heal and for many people, the results of the work and effort done in this lifetime may not be completely experienced, but the benefits, as the essence is replenished, will be seen in the future generations. \r\n\nThis applies to many things in our lives; our commitment and effort to heal ourselves, secure our families, or revitalize our communities. The results we are hoping for may not happen in our lifetime, but will be healed one generation at a time. Moving forward means that we must first, take care of the past, in order to be present, so that we can dream the future. This is life, living! Movement is life as it continues to unveil its beauty. On an emotional level, allow it and let go of any resistance.\r\n\nBurdock root will be found in many formulas when dealing with joint problems. Over a period of time, toxic build up in the blood can eventually end up in the joints. The outcome is joint pain and a body that has become too acidic. Burdock root is a premier herb when there is a calling for blood purification. The herb is easy to grow. The seeds can be collected and used for skin disorders, and the root can be dug, washed, and used in a variety of vegetable dishes. The Macrobiotic diet uses this herb extensively in its powerful healing programs.  \r\n\nSee Muscular & Skeletal External Formulas for additional support	external
99	VBX	Chronic Bacterial And Viral Infection	28	Ingredients  &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nOats\t\t\t\tAvena Sativa\r\n\nGynostemma\t\t\tJiao Gu Lan\r\n\nAstragalus\t\t\tHuang Qi\r\n\nSkullcap\t\t\t\tScutellaria Lateriflora\r\n\nBurdock root\t\t\tArctium Lappa\r\n\nEchinacea\t\t\tEchinacea Angustifolia\r\n\nWild Indigo\t\t\tBaptisia Tinctoria\r\n\nSarsaparilla\t\t\tSmilax Officinalis\r\n\nOldenlandia\t\t\tBai Hua She She Cao\r\n\nForsythia\t\t\tLian Qiao\r\n\nMeadowsweet\t\tFilipendula Ulmaria\r\n\nPoke Root\t\t\tPhytolacca Spp.\r\n\nGoldenseal\t\t\tHydrastis Canadensis\r\n\nSt. Johns Wort\t\tHypericum Perforatum\r\n\nUva Ursi\t\t\t\tArctostaphylos Uva Ursi\r\n\nGoldenrod\t\t\tSolidago Virgaurea	Western Therapeutic Actions\r\n\nAnti-bacterial, anti-viral, alterative, depurative, nerve tonic, nervine, antacid, antiseptic, and diuretic	Traditional Chinese Medicine\r\n\nSupplements the protective qi, clears heat, relieves toxicity, and cools the blood, and vitalizes the blood	Sample Indications\r\n\nChronic infections, viral and bacterial infections, chronic fatigue syndrome, Epstein-Barr virus, Lyme disease, and lupus	Suggested Dosage\r\n\n1/2  1 teaspoon, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions \r\n\nContraindicated during pregnancy.	Notations\r\n\nVBX is carefully designed to treat chronic fatigue, inflammation, and infection. The strategy is two-fold; to clear the toxicity and to strengthen the immune system. A well-balanced herbal formula addresses these two energetic opposites without compounding the problem. \r\n\nOats, Gynostemma, and Astragalus are nutritive and immune system enhancers, while Burdock root, Wild Indigo, and Oldenlandia are excellent purifiers and detoxicants. Skullcap is a nervine, an antispasmodic, and an analgesic, which helps to relieve pain. Echinacea is an antiseptic and alterative, useful for all situations due to impurities of the blood. Wild Indigo is an antiseptic and purgative. Sarsaparilla is an alterative and used traditionally for syphilis. Forsythia clears heat and relieves toxicity. Meadowsweet and Goldenrod have diuretic actions helping to eliminate toxins through the kidneys. Poke root is an alterative and depurative, and helps to resolve lymphatic congestion. Goldenseal is a bitter tonic and resolves inflammation of the mucous membranes. St. Johns Wort with its diuretic and anti-inflammatory action, assists in the cleansing of the body from unwanted toxicity. Uva Ursi further drains the toxins through the kidneys as they are being released by the blood purifying herbs. \r\n\nA diet rich in green vegetables and fruit helps to cool and thin the blood. Saunas support the purification process; sweating out toxicity, stimulating the circulation, and strengthening the immune system. \r\n\nUnloading the emotional back-pack creates space and lightens the load for a healthier immune system to operate from. Chronic imbalances, suffering, and pain are debilitating, and requires a committed team of caring individuals to support someone through the healing process.	external
100	Antiseptic Healing Ointment	Cleanses Heals Wounds	5	Ingredients  &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nGoldenseal\t\t\tHydrastis Canadensis\r\n\nEchinacea\t\t\tEchinacea Angustifolia\r\n\nLithospermum\t\tZi Cao\r\n\nTang Kuei\t\t\tDang Gui\r\n\nCalendula\t\t\tCalendula Officinalis\r\n\nPlantain\t\t\t\tPlantago Spp.\r\n\nAngelica dah.\t\tBai Zhi\r\n\nBeeswax\r\n\nOlive Oi	Western Therapeutic Action\r\n\nVulnerary, antiseptic, anti-inflammatory, astringent, anti-fungal, alterative, and depurative	Traditional Chinese Medicine\r\n\nClears heat, clears toxicity, and invigorates the blood	Sample Indications\r\n\nThe skin or epithelial tissues are wounded, irritated or inflamed; cuts, abrasions, ulcers, wounds, chapped skin and lips, cracked nipples, fissures, bedsores, and chilblains	External Application\r\n\nCleanse wounded area thoroughly before applying this ointment. After cleansing the wound, apply ointment to the affected area, or smear a small amount of ointment onto a sterile gauze and tape to area, 3 times daily	Contraindications and Cautions\r\n\nIf the gauze sticks to the wound, moisten with warm water before trying to remove. Contact a physician immediately if the infected area begins to have hot, red streaks.	Notations \r\n\nThis salve stimulates the regeneration of damaged tissues and their blood vessels. Care should be taken to keep the wound or broken skin area clean, and away from possible sources of blood infections; stay out of public pools, away from dirt, and avoid contact with chemicals. \r\n\nGoldenseal is an anti-infective and detergent. It is very similar to the Chinese herb, Coptis, as they are both rich with the alkaloid, berberine. Echinacea is a detoxicant with anti-viral and anti-bacterial qualities, and is very effective for tissue trauma.\r\n\nLithospernum supports Echinacea, as it is a detoxicant, clears heat, cools the blood and relieves fire toxicity. Tang Kuei helps to heal tissue trauma and promotes the formation of new skin tissue. Angelica dah. is an analgesic and has anti-bacterial qualities. It will assist in the dispelling of any pus from a sore or cut.\r\n\nCalendula is an anti-fungal and helps to heal injured tissues. Plantain assists in healing tissue wounds.	external
101	Antiseptic Lotion	Cuts, Wounds	17	Ingredients &leftpar;Herbal Extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nGoldenseal\t\tHydrastis Canadensis\r\n\nLithospernum\t\tZi Cao\r\n\nDragons Blood\t\tXue Jie\r\n\nMyrrh\t\t\tCommiphora Myrrha\r\n\nEchinacea\t         \tEchinacea Angustifolia\r\n\nCalendula\t         \tCalendula Officinalis\r\n\nAloe Juice\t         \tLu Hui\r\n\nWitch Hazel\t\tHamamelis Virginiana	Western Therapeutic Action\r\n\nVulnerary, antiseptic, anti-inflammatory, anti-bacterial, anti-viral, anti-fungal, analgesic, emollient, and astringent	Traditional Chinese Medicine\r\n\nClears heat, clears toxicity, vitalizes the blood, and stops pain	Sample Indications\r\n\nThe skin or epithelial tissues are wounded; cuts, abrasions, \r\n\nulcers, wounds, bed sores, herpes simplex, chilblains, and \r\n\nfissures	External Application\r\n\nCleanse wounded area thoroughly before applying this lotion. Apply directly with a sterile cotton swab, or dilute a small quantity in clean warm water before applying to affected area, \r\n\n3 times daily	Contraindications and Cautions\r\n\nConsult a qualified health care practitioner if the wound becomes infected and fails to heal.	Notations \r\n\nThis is an effective topical cleanser and helps to clear and prevent surface tissue infections. After the use of Antiseptic Lotion, keep the affected area clean and free from dirt and other sources of infection, until healing is complete. \r\n\nAloe Vera, as a vulnerary, cools and cleanses the blood, and supports tissue repair. Witch Hazel is an astringent, which assists in the binding of tissues together. Dragon's Blood stimulates blood circulation, generates flesh, reduces swelling, and stops bleeding. It acts as an anodyne, similar to Myrrh resin, and has antiseptic properties. When combined with Lithospermum, they provide strong antiseptic properties. Echinacea is an alterative, antiseptic, and is useful for all infections and impurities in the blood. Calendula is beneficial for ulceration of the skin, promotes tissue repair, and is an anti-inflammatory.	external
102	Arnica Cream	Bruises With No Broken Skin	15	Ingredients  &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nArnica\t\t  Arnica Montana\r\n\nBeeswax\r\n\nOlive Oil	Western Therapeutic Actions\r\n\nAnti-inflammatory, anti-traumatic, anodyne, and analgesic	Traditional Chinese Medicine\r\n\nClears heat, moves the blood, and alleviates pain	Sample Indications\r\n\nBruises, contusions, and inflamed muscles where there is no evidence of broken skin tissue	External Application\r\n\nApply ointment liberally onto the affected area only if the skin tissue is NOT BROKEN, \r\n\n3 times daily	Contraindications and Cautions\r\n\nDo not apply to areas that have broken skin as this could cause inflammation.	Notations \r\n\nFollowing trauma, the body will often need more rest than usual. It is best to comply. Alternating between hot and cold compresses at the onset of an injury provides circulatory and anti-inflammatory benefits. After 48 hours, a hot compress, without a cold compress, is the common procedure. Applying too much cold or ice can injure the tissues and cause blood stagnation.\r\n\nArnica flower is an excellent anti-inflammatory. This formula, if used immediately following any trauma to the muscular or skeletal system can provide immediate relief. It is an anodyne, reduces swelling, and promotes tissue repair. Beware of any broken skin. If the skin tissue is broken, Arnica can not be applied or used as it may cause inflammation.	external
103	Bleeding Powder	Stops Bleeding	33	Ingredients&leftpar;Herbal powders&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nPseudoginseng\t\tTien Chi\r\n\nSlippery Elm\t\t\tUlmus Fulva	Western Therapeutic Actions\r\n\nStyptic, antihemorrhagic, hemostatic, emollient, and demulcent	Traditional Chinese Medicine\r\n\nArrests bleeding and disperses stagnant blood	Sample Indications\r\n\nInternal\r\n\nActive or passive internal hemorrhaging; internal injuries, \r\n\nulcerative colitis, uterine fibroids, strained or torn ligaments, \r\n\ncardiovascular disorders, and angina\r\n\n\t\tExternal\r\n\nBleeding cuts, wounds, and abrasions	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms\r\n\nExternal Application\r\n\nTopically, apply the powder directly to the \r\n\naffected area after cleansing. Use in a generous manner and cover with a sterile gauze.\r\n\nü	Contraindications and Cautions\r\n\nContraindicated during pregnancy. With all cases of bleeding, it is critical that the root cause of the bleeding disorder be treated.	Notations \r\n\nTien Chi &leftpar;Pseudoginseng&rightpar;, a rare and legendary herb, is widely used in the Orient. It has the remarkable ability to arrest bleeding without causing blood stasis. A Chinese patent formula, Yunnan Pai Yao, is one of the most commonly used formulas in treating injuries, of which Tien Chi is the main ingredient. Currently in China, Tien Chi is being used during cancer therapy, as it has been claimed to help tumors reduce in size more rapidly, and help reduce the damage to healthy tissues during radiation treatments. \r\n\nTien Chi is also used in a cooked form. When used cooked, it has the ability to tone the blood and qi, but loses some of its blood regulation qualities.\r\n\nSlippery Elm is a nutritive demulcent &leftpar;soothes the mucous membranes&rightpar;, emollient &leftpar;soothes the skin&rightpar;, and reduces inflammation. \r\n\nThis styptic formula is an excellent addition to any First Aid Kit. \r\n\nBleeding Powder can be ordered in larger sizes when being used as an adjunct therapy to radiation treatments.	external
105	Bzzz Bite	Bee Sting	29	Ingredients\r\n\n&leftpar;Herbal Extracts and Homeopathic&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nLobelia\t\tBan Bian Lian\r\n\nNeem\t\tAzadirachta Indica\r\n\nDandelion\tPu Gong Ying\r\n\nHomeopathic\r\n\nApis Mel	Western Therapeutic Actions\r\n\nCounter-irritant, anti-inflammatory, and specific	Traditional Chinese Medicine\r\n\nCools the blood and relieves fire toxicity\r\n\nü	Sample Indications\r\n\nBee stings, wasp stings, insect bites	Suggested Dosage\r\n\n5 - 20 drops every 30 minutes\r\n\nGradually reduce the dose and frequency as the swelling and discomfort reduces\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nFor some people, bee or insect stings can cause severe and sometimes fatal allergic reactions; if a person is known to be allergic to bee stings, seek immediate qualified medical assistance.	Notations \r\n\nA paste made from baking soda and water, applied to the area of the sting, helps clear the heat, pain, and residual itching. If you have a yellow onion, slice it and apply directly to the bee sting. Wrap a bandage around the area to hold the onion firmly in place on top of the bee sting. This helps detoxify the poison, relieve the swelling, and alleviate itch.\r\n\nLobelia is a detoxicant and relieves fire toxicity. It can be used internally or externally for bee, wasp, or snake bites. Neem, an Ayurvedic herb, is used for poisonous insect bites and is a premier cleanser and purifier of the blood. Dandelion relieves fire toxicity and helps to dissipate hard swollen nodules such as swellings from insect stings.\r\n\nHomeopathic Properties\r\n\nApis Mel &leftpar;Honey Bee&rightpar;\r\n\n\tfor puffing or swelling of sting, pain, irritated by touch, \t\tred and inflamed	external
106	Eye Wash	Eye Irritation	37	Ingredients &leftpar;Herbal Extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nPulsatilla\t         \tBai Tou Weng\r\n\nCoptis\t\t\tHuang Lian\r\n\nEyebright\t         \tEuphrasia Officinalis\r\n\nMarshmallow\t\tAlthea Officinalis\r\n\nRaspberry leaf\t\tRubus Idaeus\r\n\nSassafras\t         \tSassafras Albidum\r\n\nGoldenseal\t\tHydrastis Canadensis	Western Therapeutic Actions\r\n\nSoothing, cleansing, astringent, demulcent, and antiseptic	Traditional Chinese Medicine\r\n\nClears heat and toxicity	Sample Indications\r\n\nConjunctivitis, pink eye, itchy allergy eyes, tired eyes, bloodshot eyes, keratitis, cataracts, glaucoma, and retinal displacement	External Application\r\n\nPlace 3 - 5 drops in a sterile eye cup, filled with room-temperature, sterile water. Mix well. Wash eye with this mixture, 3 times daily, using a separate mixture for each eye.  Keep eye wide open while washing. Sterilize eye cup before each use.	Contraindications and Cautions\r\n\nThe amount of drops used may vary with each individual. If it seems too strong, lower the number of drops. Take care not to contaminate the dropper, bottle, or eye cup. Sterilize the eye cup before each use &leftpar;boil for 5 minutes&rightpar;.  \r\n\nDiscontinue use of this remedy if it creates redness or irritation. If symptoms persists for more than a few days, seek the advise of a qualified health care practitiioner.	Notations \r\n\nPulsatilla, the lead herb, is also known as Pasque flower. It is used similarly in the East-West traditions. In Eye Wash, the heat clearing, antiseptic, anti-infective, and diaphoretic qualities of Pulsatilla are relied upon. This is supported with Coptis and Goldenseal. The herb, Eyebright, with it's cooling, antiseptic, astringent, and anti-inflammatory actions, relieves eye irritation and pain, removes surface obstructions from the eyes &leftpar;corneal macula and nebula, cataracts&rightpar;, and helps to restore the vision. Being able to cleanse and restore simultaneously, makes Eyebright a treasured flower. Marshmallow is used externally as a wash, when redness, irritation, and pain are present. Raspberry leaf is used externally when inflammation, swelling, and discharge are present.\r\n\nEye and vision problems often relate to liver imbalances. Eliminate spicy foods, alcohol, caffeine and egg products from the diet until the symptoms have cleared. Drink Chrysanthemum tea and eat plenty of dark green vegetables daily. Wear sunglasses to protect the eye when outdoors. As with all external applications, it is wise to include an internal herbal remedy to address the imbalance being presented.	external
107	Oak Bite	Poisin Oak	29	Ingredients &leftpar;Herbal Extracts and Homeopathic&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nBurdock seed\t     Niu Bang Zi\r\n\nNeem\t\t\t     Azadirachta Indica\r\n\nChrysanthemum\t     Ju Hua\r\n\nCicada\t\t\t    Chan Tui\r\n\nPeppermint\t\t    Bo He\r\n\nHomeopathic\r\n\nPoison ivy\t\t    Rhus Toxicodendron	Western Therapeutic Actions\r\n\nAnti-allergenic, anti-inflammatory, and specific	Traditional Chinese Medicine\r\n\nClears wind/heat and vents rashes	Sample Indications\r\n\nSpecific for contact dermatitis associated with Poison Oak and Poison Ivy	Suggested Dosage\r\n\n5 - 20 drops every 2 hours\r\n\nGradually reduce the dose and frequency as the itching and discomfort subsides\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nThere are none known.	Notations\r\n\nOak Bite helps to relieve itching, prevent blisters, and eliminate the toxins from the body. Oak Bite combines herbal extracts with the homeopathic remedy, Rhus Tox., a specific for contact with poison ivy or poison oak.\r\n\nBurdock seed, Cicada, Chrysanthemum, and Peppermint combine well together in venting rashes and dispersing wind/heat. Neem, an Ayurvedic herb, is a blood purifier and detoxicant. It is used for a variety of inflammatory skin conditions. This herb can be used externally as a poultice.\r\n\nTaking a cool bath, twice daily, in baking soda or oatmeal is beneficial and will help to allay the itch. Aloe Vera, applied topically, can soothe the skin. Small drinks of Nettle tea may also be beneficial. Nettle tea can be applied externally for sting-like burns.\r\n\nAn *alkaline diet will offset the acidic condition brought on by this rash.\r\n\n*Acid / Alkaline Chart: See page 47	external
108	Poultice Powder	Sprains Strains	32	Ingredients &leftpar;Herbal powders&rightpar;\r\n\nListed by common and pin yin or latin names, in sequence from largest to smallest amount by quantity.\r\n\nSlippery Elm \t\tUlmus Fulva\r\n\nArrowroot\t         \tMaranta Arundinacea\r\n\nComfrey root\t\tSymphytum Officinale	Western Therapeutic Actions\r\n\nAntiseptic, anti-inflammatory, absorbent, and demulcent	Traditional Chinese Medicine\r\n\nClears toxic heat	Sample Indications\r\n\nBleeding cuts, wounds, boils, ulcers, and abrasions that require cleansing before new skin tissue forms	External Application\r\n\nTake a small amount of powder, mix to a paste in a little hot water. Apply hot to boils and ulcers; allow to cool before applying to wounds. Cover with sterile gauze to hold in place. Repeat application 3 times daily, until area is c	Contraindications and Cautions\r\n\nThere are none known.	Notations\r\n\nPoultice Powder is an excellent external cleanser and healing agent. Whenever dealing with infections, combine this remedy with an internal herbal cleansing remedy. Apply a poultice of grated raw potato if the wound does not respond to a warm poultice. Reapply a cold fresh poultice, twice daily or every 2-4 hours for severe cases.	external
109	Sprain Bruise Lotion	Pain Relief	1	Ingredients &leftpar;Herbal Extracts&rightpar;\r\n\nListed by common and pin yin or latin names, in sequence from largest to smallest amount by quantity.\r\n\nComfrey leaf\t\tSymphytum Officinale\r\n\nCarthamus\t\tHong Hua\r\n\nFrankincense\t\tRu Xiang\r\n\nMyrrh\t\t\tMo Yao\r\n\nMoutan\t\t\tMu Dan Pi\r\n\nPersica\t\t\tTao Ren\r\n\nCalendula\t         \tCalendula Officinalis	Western Therapeutic Action\r\n\nVulnerary, soothing, analgesic, anti-inflammatory, anodyne, demulcent, and astringent	Traditional Chinese Medicine\r\n\nInvigorates the blood, resolves blood stasis, and relieves pain	Sample Indications\r\n\nInjuries, strains, and inflammations of the muscles, ligaments, tendons and joints	External Application\r\n\nApply liberally to the affected or traumatized area, 3 times daily	Contraindications and Cautions\r\n\nThere are none known.	Notations\r\n\nUse a complementary internal remedy with all external applications. This will support the healing process and strenghten the injured area.	external
110	Venom Bite	Snake, Spider Bite	29	Ingredients&leftpar;Herbal Extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nNeem\t\t\t\t  Azadirachta Indica\r\n\nBurdock root\t\t\t  Arctium Lappa\r\n\nOldenlandia\t\t\t  Bai Hua She She Cao\r\n\nViolet\t\t\t\t  Zi Hua Di Ding\r\n\nSwallowwort root\t\t  Bai Wei\r\n\nFigwort\t\t\t\t  Scrophularia Nodosa\r\n\nWild Indigo\t\t\t  Baptisia Tinctoria\r\n\nPoke Root\t\t\t  Phytolacca Spp.\r\n\nLonicera\t\t\t\t  Jin Yin Hua\r\n\nChrysanthemum, wild\t  Ye Ju Hua	Western Therapeutic Actions\r\n\nDetoxicant, anti-inflammatory, anodyne, analgesic, alterative, diaphoretic, diuretic, and absorbent	Traditional Chinese Medicine\r\n\nClears heat, strongly relieves fire toxicity, and reduces swelling\r\n\nü	Sample Indications\r\n\nSnake bites and insect bites	Suggested Dosage\r\n\n20 - 40 drops every 2 hours\r\n\nGradually reduce the dose and frequency as the symptoms subside\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nSnake bites and insect bites may be life threatening. It is advisable to seek medical care as quickly as is possible. Panic will increase the flow of toxins in the body by increasing the heart rate. Stay calm! Focus on your breath. Inhale....Exhale. Slow everything down!	Notations\r\n\nVenom Bite is a specific formula for toxic snake and insect bites. It will help purify the blood and lymph from the venom, and ease the swelling and discomfort. Venom Bite is also applied externally as a poultice on the area that was bitten. The most effective treatment is when Venom Bite is used simultaneously, externally and internally.\r\n\nNeem, an Ayurvedic herb and an excellent blood purifier, has traditionally been used for poisonous insect and snake bites. Burdock root, the premier Western blood purifier, supports Neem. Oldenlandia, Violet, Swallowwort root, and Lonicera clear heat and strongly relieve toxicity. Figwort purifies the blood and lymphatic systems. Wild Indigo is an antiseptic. Poke root is an alterative and depurative and cleanses the lymph system. Chrysanthemum &leftpar;wild&rightpar; drains fire and relieves toxicity.	external
111	Bone Save	Osteoporosis	28	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nDipsacus\t\t Xu Duan\r\n\nRehmannia, prep.\t Shu Di Huang\r\n\nDrynaria\t\t\tGu Sui Bu\r\n\nEucommia\t\tDu Zhong\r\n\nBoswellia\t\tBoswellia Serrata\r\n\nLoranthus\t\tSang Ji Sheng\r\n\nDeer Antler\t\tLu Rong\r\n\nTang Kuei\t\tDang Gui\r\n\nMillettia\t\t\tJi Xue Teng\r\n\nDu Huo\t\t\tTu Huo\r\n\nComfrey root\tSymphytum Officinale\r\n\nCyathula\t\t\tChuan Niu Xi\r\n\nCinnamon bark\tRou Gui\r\n\nLicorice, baked\tZhi Gan Cao	Western Therapeutic Actions\r\n\nTonic, restorative, and regenerative	Traditional Chinese Medicine\r\n\nFortifies the kidney yang, nourishes the blood, ligaments and tendons, and vitalizes the blood	Sample Indications\r\n\nOsteoporosis, weaknesses of the skeletal system, bone loss, \r\n\nosteoarthritis, fractures or broken bones, chronic low back pain, and cold lower body	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nContraindicated in patients with heat from yin deficiency, blood heat, lung heat, or warm febrile diseases.	Notations \r\n\nBone Save is called upon when the kidney yang is waning and the blood is in need of nourishment and vitalization. Bone Save, addresses the natural aging process, when the bones have become more porous, fragile, or have difficulty in mending. Herbal formulas that rectify kidney yang deficiency and liver blood deficiency enhance the healing process of all types of fractures or broken bones.\r\n\nIn Oriental Medicine, the kidneys are responsible for the strength of the bones, while the liver nourishes the tendons and ligaments. When treating this disorder, these two organs systems benefit by being flooded with nourishment with herbal formulas patterned like Bone Save.\r\n\nIf signs of heat are evident in the patient, herbs to address the internal heat must be given first, before the kidney yang is augmented. A dry mouth, with thirst and desire for cold beverages, and with the presence of a red tongue characterizes internal heat. The rule of thumb in herbal medicine is to clear heat before tonification. If signs of deficiency are accompanied with signs of heat, consider some restorative herbs or formulas. Keep the dosage of restorative herbs lower until the heat signs have been ameliorated.\r\n\nDietary changes are often recommended with conditions of weak bones. An increase in organic vegetables, seaweed, and fish is recommended along with the following supplements; Vitamin A, Vitamin C, Vitamin D, Cod Liver Oil, and the minerals Calcium, Magnesium, and Zinc. Remember to always take Calcium and Magnesium together for better absorption.\r\n\nSee Muscular & Skeletal External Formulas for additional support	external
123	Strong Back	Low Back Pain	28	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nDipsacus\t\t\tXu Duan\r\n\nBoswellia\t\t\tBoswellia Serrata\r\n\nEucommia\t\t\tDu Zhong\r\n\nRehmannia, prep.\t\tShu Di Huang\r\n\nDu Huo\t\t\t\tTu Huo\r\n\nGentiana, macro.\t\tQin Jiao\r\n\nClematis\t\t\t\tWei Ling Xian\r\n\nChaenomeles \t\tMu Gua\r\n\nAtractylodes, red\t\tCang Zhu\r\n\nTang Kuei\t\t\tDang Gui\r\n\nSarsaparilla\t\t\tSmilax Officinalis\r\n\nLigusticum\t\t\tGao Ben\r\n\nCyathula\t\t\t\tChuan Niu Xi\r\n\nCinnamon bark\t\tRou Gui	Western Therapeutic Actions\r\n\nRestorative, nutritive, anodyne, anti-inflammatory, antispasmodic, analgesic, and nerve tonic	Traditional Chinese Medicine\r\n\nFortifies the kidney yang, nourishes the liver and the blood, dispels wind/dampness, and alleviates painful obstructions	Sample Indications\r\n\nLumbago, sciatica, pain in the lower body, stiffness and weakness in the lower back and knees, osteoarthritis, and rheumatoid arthritis	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nContraindicated during pregnancy.	Notations\r\n\nStrong Back and Pain Be Gone share a similar herbal foundation based on the Chinese classic, Du Huo Ji Sheng Tang or Tu Huo and Loranthus Combination. Strong Back, a modified version of San Bi Tang or Tu Huo and Gentian Combination, differs from the original formula in that it focuses primarily on strengthening the bones and sinews of the lower body &leftpar;kidney and liver function&rightpar;, and secondarily, on expelling the wind/damp condition in order to alleviate the obstruction and the pain. This illustrates the importance of being able to distinguish the patterns a patient is presenting and addressing the primary disorder. In Oriental Medicine, Strong Back suits someone who is kidney yang deficient which manifests as exhaustion, tends to be cold or an aversion to cold, lethargic, burnt-out, and over-extended. This type of cold can be alleviated by warm clothing, whereas an exterior cold condition &leftpar;i.e., chills during the flu&rightpar; cannot be eliminated by warm clothing or warm blankets. \r\n\nDipsacus, the lead herb, strengthens the tendons and bones, vitalizes the blood, and alleviates pain. Bone, joint, and tendon problems are considered a bi syndrome or obstruction in Oriental Medicine. This disorder is caused by the poor circulation of the blood and qi which is characterized by pain, numbness, stiffness, and swelling in a joint. Wind, cold, and dampness are the three things considered to be responsible for this type of disruption of the flow of blood and qi. There are four herbs that are included in Strong Back, that are commonly used to address a wind/damp/cold condition in the lower body: Du Huo, which dispels wind/damp/cold from the lower body; Clematis, which unblocks the channels and alleviates pain; Atractylodes &leftpar;Cang Zhu&rightpar;, which expels wind/dampness and alleviates pain; and Gentiana &leftpar;Qin Jiao&rightpar;, which dispels wind/dampness and relaxes the tendons.	external
112	Chillie Paste	Hot Pain Balm	11	Ingredients&leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nCayenne\t\t\t   Capsicum Annuum\r\n\nPine Node\t\t   Song Jie\r\n\nDragons Blood\t   Xue Jie\r\n\nCinnamon twig\t   Gui Zhi\r\n\nArtemisia\t\t   Ai Ye \r\n\nBeeswax\r\n\nOlive Oil	Western Therapeutic Actions\r\n\nVulnerary, circulatory stimulant, anodyne, and counterirritant	Traditional Chinese Medicine\r\n\nWarms the channels, invigorates the blood, and promotes the movement of qi	Sample Indications\r\n\nPain and stiffness in the joints and muscles, arthritis, rheumatism, lumbago , cold hands and feet or unbroken chilblains	External Application\r\n\nApply topically onto the affected area, \r\n\n3 times daily	Contraindications and Cautions\r\n\nWash your hands after applying. Do not take internally. \r\n\nKeep out of children's reach.\r\n\nAvoid getting Chillie Paste into broken skin, mucous membranes or the eyes. If the treated area becomes excessively hot, reddened, irritated, or a rash appears, discontinue use. Wash area with warm soapy water to remove any remaining ointment. If it gets into the eyes, flush with liberal amounts of cool clean water.	Notations \r\n\nExternally, Cayenne is a counterirritant. A counterirritant causes irritation to the surface tissue, distracting the nerves from the original irritation or pain. Pine Node is used for pain in the joints and traumatic injury. Dragons Blood is beneficial for joint and tissue injury as it activates the blood and relieves pain. Cinnamon twig and Artemisia warm the energy channels and disperse cold.\r\n\nInternally, the hot Cayenne fruit has been used for centuries as a circulatory stimulant. The warm nature of Cayenne will stimulate digestion, alleviate nausea, and help to resolve bloating.\r\n\nPain that requires heat often responds well to being wrapped in red-flannel cloth.	external
113	Cramp Powder	Muscular Spasm	33	Ingredients &leftpar;Homeopathic Biochemic Tissue Salts&rightpar;\r\n\nMagnesium Phosphate\r\n\nFerrum Phosphate	Western Therapeutic Actions\r\n\nAntispasmodic and nutritive	Traditional Chinese Medicine\r\n\nBreaks up stagnant qi and vitalizes the blood	Sample Indications\r\n\nAcute and chronic muscular spasms and cramps, menstrual cramps, and digestive colic	Suggested Dosage\r\n\n1/4 teaspoon dissolved on the tongue\r\n\nTake every 20 minutes in acute cases\r\n\nFor chronic treatment, take 2 - 4 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nThere are none known.	Notations\r\n\nThis is a mineral biochemic cell salt supplement that is rapidly assimilated into the body. Cramp Powder may also help in cases of iron deficient anemia. A German chemist and physicist, Dr. W.H. Schussler, studied twelve essential cell salts and recorded the effects that the mineral constituents within the cell salts had on supporting the wellness of the body. He identified the specific attributes of each cell salt and they were used accordingly, in the natural healing process from disease. The cell salts or tissue salts are mineral constituents that are vital for the healthy functioning of our cells and are used extensively by homeopaths. \r\n\nCramp Powder combines well with herbal formulas in correcting constitutional weaknesses.\r\n\nBiochemic Tissue Salts\r\n\nMagnesium Phosphate, also known as Mag. Phos.\r\n\n\tThis cell salt is an anti-inflammatory agent for the \r\n\n\tmuscular system or nervous system. Cramping or \r\n\n\tspasmodic pain that is stabbing or sharp responds well \t\tto this cell salt. \r\n\nFerrum Phosphate, also known as Ferr. Phos.\r\n\n\t This cell salt is considered the oxygen carrier because of its ability to oxygenate all the cells of the body, which is then converted into energy.	external
115	Knee Back Pain	Anti - Inflammatory	28	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nAtractylodes, red\t\tCang Zhu\r\n\nMeadowsweet\t\tFilipendula Ulmaria\r\n\nEucommia\t\t\tDu Zhong\r\n\nLigusticum\t\t\tGao Ben\r\n\nBoswellia\t\t\tBoswellia Serrata\r\n\nBurdock root\t\t\tArctium Lappa\r\n\nSiler\t\t\t\t\tFang Feng\r\n\nAcanthopanax\t\tWu Jia Pi\r\n\nGentiana, macro.\t\tQin Jiao\r\n\nTang Kuei\t\t\tDang Gui\r\n\nCyathula\t\t\t\tChuan Niu Xi \r\n\nWintergreen\t\t\tGaultheria Promcumbens\r\n\nCouchgrass\t\t\tAgropyron Repens\r\n\nHydrangea\t\t\tHydrangea Arborescens\r\n\nCinnamon bark\t\tRou Gui	Western Therapeutic Actions\r\n\nAnti-inflammatory, analgesic, alterative, antacid, demulcent, and diuretic	Traditional Chinese Medicine\r\n\nDispels wind/cold/dampness, spreads the flow of qi, vitalizes the blood, and nourishes the liver and kidney	Sample Indications\r\n\nStiffness and swelling in the knees, stiffness in the lower back, lower body arthritis, and paralysis of the lower limbs	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nThere are none known.	Notations\r\n\nKnee Back Pain, designed from a Chinese classic called Da Fang Feng Tang or Major Siler Combination, treats imbalances from the invasion of wind/dampness, which adversely affects the muscles, bones, joints, sinews, and tendons. \r\n\nIn Oriental Medicine, when wind/dampness enters the energy channels, it can create migratory pain &leftpar;wind&rightpar;, fixed stabbing pain &leftpar;blood stagnation&rightpar;, swelling and numbness &leftpar;dampness&rightpar;. The main herbs in this formula expel wind/dampness with assisting herbs to improve the circulation, and nurture the liver and kidney &leftpar;strengthens the sinews and tendons&rightpar;. When the energy channels are rich in blood and qi, then the wind and dampness cannot lodge into the joints and create havoc. Degeneration of the bones and joints is treated differently and is a kidney and liver deficiency, with disorders such as osteoarthritis, degenerative bone disorder, and osteoporosis. \r\n\nRed Atractylodes is strongly drying in nature and expels wind/dampness. This is an excellent herb for swollen and arthritic knees. Meadowsweet and Wintergreen support Atractylodes in dispelling wind/dampness and clearing toxicity. Eucommia strengthens the lower body and kidneys. Ligusticum is an anodyne and treats headache and tailbone pain. Boswellia is a much used anti-inflammatory for the joints and the bowels in India. Siler, Acanthopanax, and Gentiana &leftpar;Qin Jiao&rightpar; expel wind/dampness and support the main actions of this formula. Tang Kuei was added to replenish the blood, and Cinnamon bark to warm the kidneys and activate circulation. Burdock root helps with the purification of the blood. Cyathula activates the circulation. Couchgrass and Hydrangea are diuretics, reduce fluid build-up in the knees, and anti-inflammatory. \r\n\nSee Muscular & Skeletal External Formulas for additional support	external
116	Liniment Balm	Muscle And Joint Balm	5	Ingredients &leftpar;Herbal Extracts&rightpar;\r\n\nListed by common and pin yin or latin names, in sequence from largest to smallest amount by quantity.\r\n\nCajeput Oil\t\tMelaleuca Cajeputii\r\n\nWintergreen Oil\t\tGaultheria Promcumbens\r\n\nCarthamus\t\tHong Hua\r\n\nCayenne\t         \tCapsicum Annuum\r\n\nPeppermint\t\tBo He\r\n\nCinnamon twig\t\tGui Zhi\r\n\nCamphor\t         \tCinnamonum Camphora\r\n\nBeeswax\r\n\nOlive Oil	Western Therapeutic Actions\r\n\nVulnerary, circulatory stimulant, antispasmodic, anodyne, and analgesic	Traditional Chinese Medicine\r\n\nDispels wind/damp/cold and invigorates the blood	Sample Indications\r\n\nGeneral pain and stiffness in the joints and muscles, arthritis, rheumatism, sprained joints and strained tendons, and ligaments	External Application\r\n\nTopically, apply ointment generously onto the affected area, 3 times daily	Contraindications and Cautions\r\n\nThere may be some sensitivity to this balm if it is applied to the mucous membrane or broken skin. Wash area  thoroughly with cool water if irritation occurs. If there are signs of heat and inflammation, wait until these symptoms subside before using this warming balm.	Notations\r\n\nUse complementary internal remedies to support  the healing action of this balm.	external
117	Liniment Rub	Joint Muscle Relief	1	Ingredients &leftpar;Herbal Extracts&rightpar;\r\n\nListed by common and pin yin or latin names, in sequence from largest to smallest amount by quantity.\r\n\nPeppermint\t\tBo He\r\n\nCayenne\t         \tCapsicum Frutes\r\n\nDragons Blood\t\tXue Jie\r\n\nCarthamus\t\tHong Hua \r\n\nCajeput\t\t\tMelaleuca Leucadendron \r\n\nMyrrh\t\t\tMo Yao\r\n\nFrankincense\t\tRu Xiang\r\n\nAtractylodes, red\tCang Zhu\r\n\nPine Node\t         \tSong Jie\r\n\nCorydalis\t         \tYan Hu Suo\r\n\nCalendula\t         \tCalendula Officinalis	Western Therapeutic Actions\r\n\nVulnerary, circulatory stimulant, antispasmodic, anodyne, and analgesic	Traditional Chinese Medicine\r\n\nDispels wind/damp/cold, invigorates the blood, and alleviates pain	Sample Indications\r\n\nStiff and painful muscles and joints, rheumatism, arthritis, cold limbs, sprained and strained joints, ligaments and tendons, heavy legs and tired feet, and overworked muscles and joints	External Application\r\n\nTopically, apply the liquid with sterile gauze to the affected area, 3 times daily	Contraindications and Cautions\r\n\nThere may be some sensitivity to Liniment Rub if it is applied to the mucous membrane or broken skin. Wash area  thoroughly with cool water if irritation occurs. If there are signs of heat and inflammation, wait until these symptoms subside before using this warming liquid.	Notations\r\n\nUse complementary internal remedies to support the healing action of this embrocation.	external
118	Movement Makes Better	Pain That Gets Better With Movement	29	Ingredients  &leftpar;Homeopathic&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nArnica\t\t\t\tArnica Montana\r\n\nAconite\t\t\t\tAcontium Napellus\r\n\nPoison Ivy\t\t\tRhus Toxicodendron\r\n\nSt. Johns Wort\t\tHypericum Perforatum	Western Therapeutic Actions\r\n\nAnti-inflammatory, analgesic, and anodyne	Traditional Chinese Medicine\r\n\nDispels wind and alleviates obstruction	Sample Indications\r\n\nSpecific for the treatment of pain and conditions that improve with the movement of the body. The pain can be of any origin; arthritis, rheumatism, trauma, accidents, sprains, strained ligaments and tendons, and impaired nerve impulses	Suggested Dosage\r\n\n5 - 20 drops, in a small amount of water,\r\n\n3 times daily, or every hour if needed\r\n\nReduce dosage as symptoms subside\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nThere are none known.	Notations\r\n\nThis is a homeopathic remedy that has shown to be effective when addressing trauma to the muscular/skeletal system. This remedy is used specifically when muscular/skeletal pain is alleviated by movement, such as stretching or walking. \r\n\n                                                    Homeopathic Properties\r\n\nArnica\t\tmuscle strain, pain, and bruises\r\n\nAconite\t\tanti-inflammatory, symptoms that have sudden onset, numbness and tingling\r\n\nPoison Ivy\tpain and stiffness, motion alleviates discomfort\r\n\nSt. Johns Wort\tfor excessive pain, antispasmodic\r\n\nPain is nature's warning that something is wrong. The excessive use of pain-killing drugs does not remove the cause, but may add to it. It is most important to discover and treat the cause of the pain or syndrome. *Bran poultices or *Chamomile fomentations often give some relief. \r\n\n*Bran poultices: See external applications\r\n\n*Chamomile fomentations: See external applications\r\n\nSee Muscular & Skeletal External Formulas for additional support	external
119	Movement Makes Worse	Pain That Worsens With Movement	29	Ingredients  &leftpar;Homeopathic&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nArnica\t\t\tArnica Montana\r\n\nAconite\t\t\tAcontium Napellus\r\n\nBryonia\t\t\tBryonia Dioica\r\n\nSt. Johns Wort\tHypericum Perforatum	Western Therapeutic Actions\r\n\nAnti-inflammatory, analgesic, and anodyne	Traditional Chinese Medicine\r\n\nExpels wind and alleviates obstruction	Sample Indications\r\n\nSpecific for the treatment of pain and conditions that worsen with the movement of the body. The pain can be of any origin; arthritis, rheumatism, trauma, accidents, sprains, strained ligaments and tendons, and impaired nerve impulses	Suggested Dosage\r\n\n5 - 20 drops, in a small amount of water,\r\n\n3 times daily, or every hour if needed\r\n\nReduce dosage as symptoms subside\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nThere are none known.	Notations\r\n\nThis is a homeopathic remedy that has shown to be effective when addressing trauma to the muscular/skeletal system. This remedy is used specifically when muscular/skeletal pain is aggravated by movement, such as stretching or walking. \r\n\n                                                        Homeopathic Properties\r\n\nArnica\t\tfor muscle strain, pain, and bruises\r\n\nAconite\t\tanti-inflammatory, symptoms that have sudden onset, numbness and tingling\r\n\nBryonia\t\tfor acute pain, aggravation from any motion\r\n\nSt. Johns Wort\tfor excessive pain, antispasmodic\r\n\nPain is nature's warning that something is wrong. The excessive use of pain-killing drugs does not remove the cause, but may add to it. It is most important to discover and treat the cause of the pain or syndrome. *Bran poultices or *Chamomile fomentations often give some relief. \r\n\n*Bran poultices: See external applications\r\n\n*Chamomile fomentations: See external applications\r\n\nSee Muscular & Skeletal External Formulas for additional support	external
120	Muscle Ease	Muscular Stiffness, Pain	28	Ingredients &leftpar;Herbal Extracts&rightpar;\r\n\nListed by common and pin yin or latin names, in sequence from largest to smallest amount by quantity.\r\n\nPueraria     \t\tGe Gen\r\n\nOats\t\t         \tAvena Sativa\r\n\nSkullcap\t         \tScutellaria Lateriflora\r\n\nCinnamon twig\t\tGui Zhi\r\n\nPeony\t\t\tBai Shao Yao\r\n\nSiler\t\t         \tFang Feng\r\n\nGentiana, macro.\tQin Jiao\r\n\nVitex\t\t         \tMan Jing Zi\r\n\nCnidium\t         \tChuan Xiong\r\n\nMistletoe\t         \tViscum Album\r\n\nMeadowsweet\t\tFilipendula Ulmaria\r\n\nLicorice, baked\t\tZhi Gan Cao\r\n\nGinger, fresh\t\tSheng Jiang\r\n\nChamomile, Roman\tAnthemis Nobilis\r\n\nMotherwort\t\tLeonurus Cardiaca\r\n\nPassion Flower\t\tPassiflora Incarnata\r\n\nCramp Bark\t\tViburnum Opulus\r\n\nJujube\t\t\tDa Zao	Western Therapeutic Actions\r\n\nAnodyne, anti-inflammatory, antispasmodic, alterative, depurative, nerve tonic, nervine, nutritive tonic, and calming	Traditional Chinese Medicine\r\n\nHarmonizes the nutritive and protective chi, releases the muscle layer, disperses wind, and calms the spirit	Sample Indications\r\n\nMuscle aches and pains, joint pain, neck and shoulder tension, cramps, and headaches	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, 3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nThis remedy is drying in nature, so use with caution with cases that are yin deficient with heat signs &leftpar;dry mouth and thirst for cold drinks, night sweats, heat in the hands and feet&rightpar;, or modify with cases that exhibit blood and chi defeciencies.	Notations\r\n\nMuscle Ease, designed after one of the most studied herbal remedies in China, Gui Zhi Tang, was initially used for treating patients with a weaker constitution who were suffering from the early stages of a febrile disease in which sweating did not improve the condition. Its use has greatly expanded over the centuries. The main focus of this formula is on disruptions of the flow of chi. Stagnant chi will produce pain that moves from one area to another &leftpar;muscles or joints&rightpar;. Stagnant blood will produce pain that stays in one location. With the appropriate use of other herbs, the base formula &leftpar;Cinnamon twig, Peony, Ginger, Licorice, and Jujube&rightpar;, can be modified very effectively. Pueraria, called Kudzu in Japan and is used extensively as an anti-inflammatory, has been added to this remedy because of its ability to release the neck and shoulder muscles. Herbs to calm the spirit, Chamomile, Motherwort, and Passion flower, have been included because of their ability to calm the spirit. Muscular tension is caused by emotional upsets in many instances, reminding us, once again, of the dance between the psychic realm and the physical realm.	external
121	Pain Be Gone	Pain Relief	28	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nBoswellia\t\t\tBoswellia Serrata\r\n\nLoranthus\t\t\tSang Ji Sheng \r\n\nDu Huo\t\t\t\tTu Huo\r\n\nTurmeric\t\t\tCurcuma Longa\r\n\nJamaica Dogwood\t        Piscidia Piscipula\r\n\nSkullcap\t\t\t\tScutellaria Lateriflora\r\n\nGentiana, macro.\t\tQin Jiao\r\n\nEucommia\t\t\tDu Zhong\r\n\nCyathula\t\t\t\tChuan Niu Xi \r\n\nMillettia\t\t\t\tJi Xue Teng\r\n\nTang Kuei\t\t\tDang Gui\r\n\nValerian\t\t\t\tValeriana Officinalis\r\n\nPassion Flower\t\tPassiflora Incarnata\r\n\nWild Lettuce\t\t\tLactuca Virosa\r\n\nCinnamon bark\t\tRou Gui\r\n\nGinger, dried\t\t\tGan Jiang	Western Therapeutic Actions\r\n\nAnti-inflammatory, analgesic, anodyne, sedative, nervine, antispasmodic, restorative, and nutritive	Traditional Chinese Medicine\r\n\nDispels wind/cold/dampness, alleviates pain, and nourishes the deficiencies of the blood, kidneys, and liver	Sample Indications\r\n\nAches and pains, stiffness, limitation of movement, numbness, neuralgia, arthritis, post-operative pain, lumbago, sciatica, cramps and spasms, and pain from auto-immune diseases	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nContraindicated during pregnancy.	Notations \r\n\nIn Oriental Medicine, pain can be caused by an obstruction, either physical or emotional, restricting the smooth flow of blood and qi. The physical obstruction can be caused by an invasion of an external influence, such as wind, cold, or dampness, or a combination of them. These external influences can accentuate pre-existing excesses or deficiencies if the body does not have the capacity to expel them or adjust to their influence. A nice saying that could be applied here is, If the cup is empty it will be filled. \r\n\nPain Be Gone follows the energetic patterns used in a time honored Chinese formula, Du Huo Ji Sheng Tang or Tu Huo and Loranthus Combination along with proven Western specifics. The delicate balance of expelling the external influence and nourishing the blood and qi simultaneously gives this formula a special place in the classics of herbal medicine. Underlying most chronic disorders is a depletion or deficiency within the body. Pain can be exhausting. If only the invading influence is treated, the imbalance is difficult to heal.\r\n\nThe possibility of an emotional obstruction also can be addressed. Does the pain represent a conflict between the body and the psyche? What parts of the psyche are resistant to the flow of life? Do I hang onto emotional pain? \r\n\nWhat is my relationship to pain? Do I fight it? If we go to battle with the obstruction &leftpar;pain&rightpar;, it will resist and intensify. When we allow ourselves to breathe into the varying degrees of intensity of the obstruction or pain, the bodies energies can more easily flow, and the possibility of releasing any obstruction is enhanced.\r\n\nSee Muscular & Skeletal External Formulas for additional support	external
122	Sciatigone	Sciatica Pain	29	Ingredients  &leftpar;Homeopathic&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nRosemary\t\tRosmarinus Officinalis\r\n\nArnica\t\t\tArnica Montana\r\n\nPoison Ivy\t\tRhus Toxicodendron\r\n\nAconite\t\t\tAcontium Napellus	Western Therapeutic Actions \r\n\nAnti-inflammatory, analgesic, and anodyne	Traditional Chinese Medicine\r\n\nExpels wind and alleviates obstruction	Sample Indications\r\n\nSpecific for the treatment of sciatica pain; inflammation and general discomfort of the sciatic nerve	Suggested Dosage\r\n\n5 - 20 drops, in a small amount of water,\r\n\n3 times daily, or every 2 hour if needed\r\n\nReduce dosage as symptoms subside\r\n\nVariation is according to individual symptom	Contraindications and Cautions\r\n\nThere are none known.	Notations\r\n\nSciatigone is a homeopathic remedy that has shown to be effective when addressing sciatic nerve pain. The symptoms for sciatica can include: pain in the buttocks or leg that becomes worse when sitting; burning or tingling sensation that runs down the side or back of the leg; weakness or numbness in the leg; and a constant throbbing pain on either side of the buttocks. \r\n\nStanding up for long periods may be difficult or impossible. The pain felt in the leg or legs is much stronger than in the lower back and may make it impossible to walk any distance comfortably.\r\n\n                                     Homeopathic Properties\r\n\nRosemary\ta nervine and alleviates nerve pain\r\n\nArnica\t\ta stimulant that heals tissue damage\r\n\nPoison Ivy, commonly called Rhus Tox\t\t\r\n\n\t\tan anodyne and very effective in dealing with sciatic nerve disorders\r\n\nAconite \tan anti-inflammatory, analgesic, and relaxant\r\n\nShiatsu, Acupuncture, Yoga, Tai Ji, Qi Gong, and other stretching exercises are a great benefit for sciatica. The lower back is the foundation of the body, so easy does it and find some firmer ground to stand on.\r\n\nSee Muscular & Skeletal External Formulas for additional support	external
124	Air Flow	Dependencies	28	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nAstragalus\t\t\tHuang Qi\r\n\nRehmannia, prep.\t\tShu Di Huang\r\n\nCordyceps\t\t\tDong Chong Xia Cao\r\n\nHoly Basil\t\t\tOcimum Tenuiflorum\r\n\nMorus bark\t\t\tSang Bai Pi\r\n\nLungwort\t\t\tPulmonaria Officinalis\r\n\nApricot seed\t\t\tXing Ren\r\n\nFritillaria\t\t\tChuan Bei Mu\r\n\nAnemarrhena\t\tZhi Mu\r\n\nSchizandra\t\t\tWu Wei Zi\r\n\nBugleweed\t\t\tLycopus Virgininicus \r\n\nElecampane\t\t\tInula Helenium\r\n\nMarshmallow\t\t\tAlthea Officinalis\r\n\nEchinacea\t\t\tEchinacea Angustifolia\r\n\nHawthorn berry\t\tCrataegus Spp.	Western Therapeutic Actions\r\n\nExpectorant, demulcent, emollient, sedative, and cardiac tonic	Traditional Chinese Medicine\r\n\nSupplements the lung qi, clears lung heat, transforms phlegm, stops coughing, and arrests wheezing	Sample Indications\r\n\nChronic and long-standing lung and breathing problems, emphysema, asthma, and cystic fibrosis	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nContraindicated during the acute stages of any illness, such as colds and influenza &leftpar;external pathogenic influence&rightpar;.	Notations \r\n\nAir Flow, similar to an ancient Chinese formula, Ren Shen Ge Jie San or Ginseng and Gecko Powder, addresses lung qi deficiency &leftpar;wheezing&rightpar; accompanied by heated phlegm &leftpar;mucous&rightpar;. This is a common imbalance when treating long-standing lung disorders. The two prominent emotions, grief and fear, tie into the complexity of this disorder. Patients with chronic lung conditions can be emotionally constrained or hold onto old issues very tightly as if they live only in the past. They struggle with letting go. It is important to address the possibility of any deep held grief or trauma, "the tears not yet shed", so that the Mother-Child relationship &leftpar;lung - kidney&rightpar; can be supported in this energy pattern. \r\n\nRestoratives are key to this formula. Astragalus supplements the qi and blood. Rehmannia nourishes the yin and the blood. Cordyceps nourishes the lung and augments the kidneys, and excels in lung-kidney imbalances. Holy Basil clears heat and supplements the lung qi. Schizandra nourishes the kidney yin and stabilizes the lungs.\r\n\nIf the lung problem is a consequence of exposure to a toxic environment, it is advised that steps be taken to identify and correct those issues. Mold and toxic household cleansers should also be eliminated. There are many non-toxic cleaning products available which are also earth friendly.\r\n\nAn alkaline diet that includes miso soup, organic fruit and vegetables is recommended. The elimination of dairy products helps resolve phlegmatic conditions A hot *Ginger Compress, applied twice daily to the chest and kidney areas, is very healing and beneficial for acute and chronic breathing difficulties.\r\n\n*Ginger Compress: See External Applications	external
125	Breathe Ease	Bronchial Asthma	28	Ingredients&leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nOats\t\t\tAvena Sativa\r\n\nMarshmallow\t\tAlthea Officinalis\r\n\nCordyceps\t\tDong Chong Xia Cao\r\n\nApricot seed\t\tXing Ren\r\n\nMorus bark\t\tSang Bai Pi\r\n\nHorehound\t\tMarrubium Vulgare\r\n\nGrindelia\t\tGrindelia Robusta\r\n\nCynanchum\t\tBai Qian\r\n\nStemona\t\t\tBai Bu\r\n\nPerilla seed\t\tZi Su Zi\r\n\nGlehnia\t\t\tSha Shen\r\n\nSchizandra\t\tWu Wei Zi\r\n\nFritillaria\t\tChuan Bei Mu\r\n\nEuphorbia\t\tEuphorbia Pilulifera	Western Therapeutic Actions\r\n\nNerve and restorative tonic, demulcent, emollient, anti-\r\n\nasthmatic, expectorant, and pectoral	Traditional Chinese Medicine\r\n\nRedirects the qi downward, arrests coughing and wheezing, expels phlegm, nourishes the kidneys, and nourishes the lung yin	Sample Indications\r\n\nAsthma &leftpar;chronic bronchial asthma and mild asthma&rightpar;, whooping cough, and spasmodic croup	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindication and Cautions\r\n\nAsthma is a serious condition, and may be life-threatening. Seek qualified medical advice. During an acute febrile disease &leftpar;fever, influenza, cold&rightpar;, use supportive heat clearing herbs or formulas.	Notations \r\n\nAsthma is a condition that can be cleared, with patience and perseverance. It is usually born of exhaustion, with emotional undertones. Food additives, preservatives, and dyes are often causative factors and should be removed from the diet. Breathe Ease can moderate or eliminate chronic symptoms &leftpar;shortness of breath and wheezing&rightpar;. It may lessen the frequency, duration and intensity of asthma attacks. Breathe Ease relieves muscular and visceral tension in the lungs, while replenishing the nervous energy reserves, and protects the body against further infections. \r\n\nThe Chinese herbs used in this formula are patterned after Ding Chuan Tang and the Chinese patent formula called Ping Chuan Pian. Oats are a restorative and Marshmallow relieves coughing and clears damp/heat. Marshmallow has been used for whooping cough and pleurisy due to this function. Horehound is an expectorant, tonic, and alleviates cough. Grindelia is an anti-asthmatic and supports the functioning of the spleen. Apricot seed, Morus bark, and Perilla seed alleviate coughs and are anti-asthmatics. Some patients do not tolerate Ma Huang. The herb Cynanchum &leftpar;Bai Qian&rightpar; is used as an effective substitute and does not create the jitters. Cynanchum addresses difficult to expectorate mucous and wheezing and is supported by Fritillaria. Wild Cherry bark and Euphorbia are pectoral specific, anti-asthmatics, and alleviate coughing. Schizandra contains the qi of the lung, supports the kidneys, and is an anti-asthmatic.\r\n\nA hot *Ginger Compress, applied twice daily to the chest and kidney areas, is also very beneficial for breathing difficulties.\r\n\n*Ginger Compress: See External Applications	external
126	Bronchol Ease	Moist Cough	28	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nElecampane\t\t   Inula Helenium\r\n\nColtsfoot\t          Tussilago Farfara\r\n\nMarshmallow\t\t  Althea Officinalis\r\n\nHorehound\t\t  Marrubium Vulgare\r\n\nEchinacea\t\t  Echinacea Angustifolia\r\n\nPleurisy root\t\t  Asclepias Tuberosa\r\n\nPlatycodon\t\t  Jie Geng\r\n\nPinellia\t\t\t  Ban Xia\r\n\nFritillaria\t\t Zhe Bei Mu\r\n\nHouttuynia\t\t Yu Xing Cao\r\n\nHoelen\t\t\t Fu Ling\r\n\nChih-Shih\t\t Zhi Shi\r\n\nHoelen\t\t\t Fu Ling\r\n\nCitrus\t\t\t Chen Pi\r\n\nCayenne\t\t\t Capsicum Annuum\r\n\nPeppermint\t         Mentha Piperita	Western Therapeutic Actions\r\n\nExpectorant, demulcent, circulatory, anti-bacterial, anti-viral, circulatory, alterative, antiseptic, carminative, and antispasmodic	Traditional Chinese Medicine\r\n\nExpels phlegm, clears heat, relieves toxicity, stops coughing, and redirects the qi downward	Sample Indications\r\n\nAcute and chronic coughs with mucous, lower respiratory infections, bronchitis, pleurisy, pneumonia, whooping cough, croup, and asthma	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of hot \r\n\nwater, 3 times daily, or more frequently for \r\n\nacute conditions\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nUse with caution during pregnancy.	Notations \r\n\nBronchol Ease was designed to treat acute and chronic respiratory infections for all ages. It is an excellent formula for children and the elderly who are prone to respiratory infections throughout the winter. Use Jade Screen Defense or Flu Shield prior to the cold/flu season and throughout the winter as a preventative measure. \r\n\nBronchol Ease is best suited for respiratory disorders with a moist cough. Use Cough Stop for dry spasmodic coughs with little or no sputum.\r\n\nThe foundation for this formula was created in the 1900s by Desmond Eggleton, a masterful Medical Herbalist and Healer from New Zealand. His original formula was comprised of Elecampane, Coltsfoot, Marshmallow, Horehound, Echinacea, Pleurisy root, Cayenne, and Peppermint. These herbs can stand on their own in treating respiratory infections. With the combining of the herbs and energetic patterns from a Chinese classic, Qing Qi Hua Tan Wan, the newly tailored Bronchol Ease has cured even the most stubborn cases.\r\n\nA hot *Ginger Compress applied to the chest and upper back, two times daily is especially effective. With all phlegmatic conditions it is wise to eliminate all dairy from the diet. A pot of chicken soup with the addition of garlic, onion, ginger, and a dash of cayenne is a time-honored cure. Cook the whole chicken with the skin and fat. Keep the upper body protected and avoid the wind! Place a vaporizer with some Eucalyptus oil in the room at night for a more restful sleep. \r\n\n*Ginger Compress: See External Applications	external
132	Sinus Clear	Runny Nose, Allergies, Sinusitis	29	IngredientsIngredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nMullein\t\t\t\tVerbascum Thapsus\r\n\nBalm of Gilead\t\tPopulus Balsamifera\r\n\nEchinacea\t\t\tEchinacea Angustifolia\r\n\nXanthium\t\t\tCang Er Zi\r\n\nColtsfoot\t\t\tTussilago Farfara\r\n\nAngelica, dah.\t\tBai Zhi\r\n\nMagnolia flower\t\tXin Yi Hua\r\n\nGoldenseal\t\t\tHydrastis Canadensis\r\n\nWild Indigo\t\t\tQing Dai\r\n\nSiler\t\t\t\t\tFang Feng\r\n\nEyebright\t\t\tEuphrasia Officinalis\r\n\nWahoo\t\t\t\tEuonymus Atropurpureus\r\n\nPeppermint\t\t\tBo He	Western Therapeutic Actions \r\n\nAntihistaminic, anti-inflammatory, decongestant, alterative, antiseptic, hepatic, and astringent	Traditional Chinese Medicine\r\n\nDispels wind, clears heat, opens the nasal passages, and alleviates head pain	Sample Indications \r\n\nAcute and chronic sinus infections, acute or chronic rhinitis, allergies, and runny nose	Suggested Dosage\r\n\n10 - 20 drops, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nContraindicated during pregnancy.	Notations\r\n\nThe Western herbs in Sinus Clear have a long history of use for sinus disorders. The Chinese herbs in Sinus Clear follow a time tested formula used extensively today, Cang Er Zi San or Xanthium Formula. Together, they create a synergy that has resolved even the most difficult cases.\r\n\nThe head and neck are the most vulnerable parts of the body to the external influences. In Oriental Medicine, there are six external influences that have an adverse affect on the body. They are: Wind, Cold, Wetness, Heat, Summer Heat, and Dryness. When the body is invaded by an external factor, one of the six influences are involved. Wind with its light nature rises or ascends and affects the upper body &leftpar;head, neck and lungs, shoulders, and the skin&rightpar;. Sinusitis, headaches, colds and flu are the common disorders from a wind activated influence.\r\n\nAromatic herbs that contain volatile oils has been used since ancient times to open the nasal passages and resolve mucous discharge. Angelica &leftpar;Bai Zhi&rightpar;, Balm of Gilead, and Magnolia flower are very aromatic and help release the exterior wind. Mullein is a demulcent, anti-inflammatory, and anti-bacterial. It is an excellent herb for clearing the sinus and ear canals. Echinacea is an alterative and and antiseptic. Xanthium opens the nasal passages, resolves discharge, and alleviates headaches. Wild Indigo is an antiseptic. Siler disperses wind from the head and face. Coltsfoot resolves phlegm, clears heat, and reduces infections. It also protects the lungs with its ability to promote expectoration should the wind penetrate lower into the respiratory tract. Wahoo is an alterative and cholagogue. Peppermint disperses wind/heat and relieves headache, fever, and cough.\r\n\nWrapping your neck with a scarf during cold and windy weather makes some sense, now doesnt it!	external
127	Cough Stop	Dry Spasmodic Cough	28	Ingredients &leftpar;Herbal Extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nElecampane\t\tInula Helenium\r\n\nMarshmallow\t\tAlthea Officinalis\r\n\nAster\t\t         \tZi Wan\r\n\nStemona\t         \tBai Bu\r\n\nVervain\t\t\tVerbena Officinalis\r\n\nYerba Santa\t\tEriodictyon Californicum\r\n\nGrindelia\t         \tGrindelia Robusta\r\n\nFritillaria\t         \tChuan Bei Mu\r\n\nTrichosanthes fruit\tGua Lou\r\n\nWild Cherry bark\tPrunus Serotina\r\n\nCynanchum\t\tBai Qian\r\n\nOphiopogon\t\tMai Men Dong\r\n\nRed Clover\t\tTrifolium Pratense\r\n\nPlatycodon\t\tJie Geng\r\n\nAnemarrhena\t\tZhi Mu\r\n\nHoelen\t\t\tFu Ling\r\n\nBiota\t\t          \tBai Zi Ren\r\n\nLicorice\t\t\tGan Cao\r\n\nButterbur\t         \tPetasites Officinalis	Western Therapeutic Actions\r\n\nAntitussive, antispasmodic, anti-inflammatory, and expectorant	Traditional Chinese Medicine\r\n\nStops coughing, transforms phlegm, clears heat, moistens the lungs, and regulates the chi	Sample Indications\r\n\nDry, spasmodic, and irritable cough, itchy throat, sequel to a febrile disease, bronchitis, pertussis, and early stages of viral pneumonia	Suggested Dosage\r\n\n1/2 - 1 teaspoon in a small amount of hot water, 3 times daily, or more frequently in acute conditions \r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nContraindicated during pregnancy.	Notations \r\n\nCough Stop, patterned after two Chinese formulas, Zhi Sou San and Bei Mu Gua Lou San, is effective when there is a lingering cough following a febrile disease with or without phlegm &leftpar;thick, sticky mucous that is difficult to expectorate&rightpar; and a harsh, raspy voice. Often, after a febrile disease, the lungs natural moisture is weakened and a dry cough develops. This remedy clears any remaining toxic heat while restoring the lungs back to health. Taking this remedy with hot water enhances the ability of the herbs to be absorbed rapidly into the blood, bronchial, and lymphatic systems. \r\n\nElecampane is a restorative to the lung chi and is used for chronic bronchial infections. Marshmallow root is a demulcent. Aster relieves coughs and wheezing. Stemona supports Elecampane in arresting coughs and bringing moisture to the lungs. Vervain helps to clear wind/heat and releases tightness in the chest. Yerba Santa serves as a bronchial expectorant. Grindelia, also known as Gumweed flower, relieves wheezing by circulating the lung chi and opening the chest area. Fritillaria and Tricosanthes fruit resolve thick, sticky phlegm and clear lung heat. Wild Cherry bark is a bronchial dilator and useful for spasmodic cough and asthma. Cynanchum redirects the chi downward, similar to honey, and supports Fritillaria. Ophiopogon moistens the lungs. Red Clover is an alterative and sedative. Platycodon is a pectoral and leads the herbs to the upper body. Hoelen and Licorice &leftpar;spleen tonics&rightpar; have been added in support of the mother-child relationship &leftpar;spleen-lung&rightpar; according to the Chinese Five Phases theory. Biota and Butterbur help to calm the spirit.\r\n\nA hot *Ginger Compress, applied twice daily to the chest and kidney areas, is also very beneficial for breathing difficulties.\r\n\n*Ginger Compress: See External Applications	external
128	Herbal Smoke	Lung Tonic, Tobacco Substitute	6	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by common and pin yin or latin names, in sequence from largest to smallest amount by quantity.\r\n\nRaspberry leaf\t\tRubus Idaeus\r\n\nColtsfoot\t          \tTussilago Farfara\r\n\nMullein\t\t\tVerbascum Thapsus\r\n\nHorehound\t\tMarrubium Vulgare\r\n\nMugwort\t          \tArtemisia Vulgaris\r\n\nLobelia\t\t\tLobelia Inflata\r\n\nWood Betony\t\tBetonica Officinalis\r\n\nLavender\t         \tLavendula Officinale\r\n\nChamomile, German\tMatricaria Recutita	Western Therapeutic Actions\r\n\nDecongestant, relaxant, antispasmodic, and antitussive	Traditional Chinese Medicine\r\n\nFacilitates the movement of lung chi, redirects the chi downward, alleviates coughing, and calming	Sample Indications\r\n\nThis smoking mix may be used in asthma to help reduce tightness in the chest, and as an alternative to tobacco to help clear the lungs and reduce dependency.	Suggested Use\r\n\nRoll and smoke as needed	Contraindication and Cautions\r\n\nThere are none known.	Notations\r\n\nExcessive inhalation of any substance is not recommended	external
141	Bush Bitters	Cure All	29	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nHarakeke\t\tPhormium Tenax\r\n\nKumarahoe\t\tPomaderris Kum\r\n\nKawa Kawa\t\tPiper Methysticum \r\n\nPukatea\t\t\tLaurelia Novae-\r\n\nHoropito\t\tPseudowintera Colorata\r\n\nKoromiko\t\tHebe Salicifolia\r\n\nKohe Kohe\t\tDysoxylum Spectabile\r\n\nPuriri\t\t\tVitex Lucens\r\n\nKaramu\t\t\tCoprosma Robusta\r\n\nKowhai\t\t\tSophora Microphylla\r\n\nKareao\t\t\tRipogonum Scandens \r\n\nBeeswax\r\n\nOlive Oil	Western Therapeutic Actions\r\n\nVulnerary, antiseptic, anti-inflammatory, analgesic, and \r\n\nantipruritic	Traditional Chinese Medicine\r\n\nClears heat, alleviates pain, and disperses blood stasis\r\n\nü	Sample Indications\r\n\nPain relief, cold sores, genital herpes, boils, diaper rash, \r\n\npsoriasis, sun spots, tinea, eczema, and itchy bites	Suggested Dosage\r\n\nApply onto the affected area, after it has been thoroughly cleansed, 3 times daily	Contraindications and Cautions\r\n\nThere are none known.	Notations \r\n\nBush Bitters Cream is known to be successful when all else has failed. It promotes the healing of most skin conditions. This formula is made exclusively with herbs from the Maori tradition.\r\n\nHarakeke is considered the Aloe Vera of New Zealand. Kumarahoe is a pectoral, blood purifier, and kidney tonic. Kawa Kawa is a blood purifier and tonic. Pukatea is a powerful anodyne, quite similar to the Chinese herb, Corydalis, Yan Hu Suo. \r\n\nKoromiko treats damp/heat of the digestive tract and excellent for dysentery like symptoms. Kohe Kohe is a bitter tonic, stomachic, and blood purifier. Puriri has anti-bacterial qualities. Karamu clears damp/heat from the kidneys and bladder and soothes the stomach. Kowhai is a restorative with analgesic and anti-fungal qualities. Kareao is an alterative and depurative.\r\n\n Horopito is the Bushmans Pain Killer, and an excellent anti-fungal. It is has been used quite successfully for clearing candida like disorders.	external
129	Brain Food	Nasal Polyps	28	Ingredients  &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nBacopa\t\t\tBacopa Monniera\r\n\nOats\t\t\tAvena Sativa\r\n\nGinkgo leaf\t\tGinkgo Biloba\r\n\nAshwaganda\t\tWithania Somnifera\r\n\nSchizandra\t\tWu Wei Zi\r\n\nRhodiola\t\t\tHong Jing Tian\r\n\nPolygala\t\t\tYuan Zhi\r\n\nSalvia\t\t\tDan Shen \r\n\nSkullcap\t\t\tScutellaria Lateriflora\r\n\nGotu Kola\t\tHydrocotyle Asiatica\r\n\nLycium fruit\t\tGou Qi Zi\r\n\nCurcuma\t\tYu Jin\r\n\nAcorus\t\t\tShi Chang Pu\r\n\nLicorice\t\t        Gan Cao	Western Therapeutic Actions\r\n\nRestorative tonic, nerve tonic, and circulatory stimulant	Traditional Chinese Medicine\r\n\nNourishes the heart blood, replenishes the essence, calms the spirit, vitalizes the blood, resolves turbidity, and opens the heart orifices	Sample Indications\r\n\nMemory loss, difficult to concentrate and focus, stressed out, forgetful, Alzheimers, and depression	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nContraindicated during pregnancy and during breast feeding. \r\n\nContraindicated in a patient if an exterior conditions exists &leftpar;such as influenza, fever, colds, rash&rightpar; or when there is an excess of interior heat. Clear the exterior condition or interior heat before taking this formula.	Notations\r\n\nThe Chinese patent formula, Bu Nao Wan or Cerebral Tonic Pills, uses Schizandra, which enters the heart, kidney, and lung channels, as one of the primary herbs in that formula. Schizandra helps maintain the healthy functioning of the brain. Bacopa, an Ayurvedic herb, is the lead herb in Brain Food. It enhances mental acuity, improves short and long term memory, and increases the intellect. Oats is one of the Western premier nerve restoratives. Rhodiola, from Siberia, has adaptogenic qualities, enhances intelligence, and relieves mental fatigue. Ashwaganda, an adaptogenic, is used for mental distress. Ginkgo leaf is a circulatory stimulant and improves cerebral function. Polygala, supported by Curcuma and Acorus, calms the spirit and clears the orifices of the heart. Obstruction of the orifices of the heart causes mental and emotional disturbances. Gotu Kola is a restorative and enhances brain functioning.\r\n\nThe Medical Classic of the Yellow Emperor &leftpar;Huang Di Nei Jing&rightpar;, refers to the heart as the ruler of the human body and the seat of consciousness and intelligence. It rules the kidney simply because it is the general master of all organ networks. The function of memory &leftpar;who we are and where we came from&rightpar; is associated with the kidney &leftpar;root&rightpar;. The heart &leftpar;houses our spirit&rightpar; processes all incoming sensory experiences, and controls and regulates the body/mind reaction to these sensations.	external
130	Free Spirited	Chronic Sinusitits	28	Ingredients  &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nTang Kuei\t\t\tDang Gui\r\n\nOats\t\t\t\tAvena Sativa\r\n\nPeony\t\t\t\tBai Shao Yao\r\n\nAtractylodes\t\t\tBai Zhu\r\n\nHoelen\t\t\t\tFu Ling\r\n\nBupleurum\t\t\tChai Hu\r\n\nSkullcap\t\t\t\tScutellaria Lateriflora\r\n\nPolygonum vine\t\tYe Jiao Teng \r\n\nCyperus\t\t\t\tXiang Fu\r\n\nValerian\t\t\t\tValeriana Officinalis\r\n\nMoutan\t\t\t\tMu Dan Pi\r\n\nGardenia\t\t\tZhi Zi\r\n\nLicorice, baked\t\tZhi Gan Cao\r\n\nGinger, fresh\t\t\tSheng Jiang\r\n\nPeppermint\t\t\tBo He	Western Therapeutic Actions\r\n\nMediates the liver and spleen, restorative, nutritive, nervine, anodyne, and antispasmodic	Traditional Chinese Medicine\r\n\nHarmonizes and smoothes the liver qi, supports the spleen, and nourishes the blood	Sample Indications\r\n\nPsychological\r\n\nEdginess, belligerent, angry, feeling as if one does not belong, negative, and aggressive\r\n\n\tPhysical\r\n\nDigestive irregularities, headache, fatigue, irregular menstruation, breast distention, alternating fever and chills, desire to sleep, and PMS	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nThere are none known.	Notations \r\n\nThe energetic function of Free Spirited, patterned after the ancient Chinese formula, Xiao Yao Wan, is to relieve constrained chi within the liver and strengthen the digestive functions of the spleen and stomach. \r\n\nEmotionally, when the energy gets constrained, rigidity ensues. We have been taught that life is a teacher and there are lessons to be learned. Rigidity reveals itself when we keep bumping into the same old wall time after time. Which comes first, the chicken or the egg? Instead of trying to resolve that riddle, we can begin to take responsibility for our lives, learn our lessons, and move forward with grace, wisdom, and serenity. Free Spirited creates a more relaxed attitude and allows movement forward.\r\n\nWhen the liver is flowing smoothly, we walk in a more gentle way with life, humbly acknowledging the ebb and flow, without getting tied up in it. Free Spirited relaxes the liver and nourishes us so that we are able to live in a good way during our short visit here. Remember that the body and mind are one.\r\n\nFree Spirited is an important herbal remedy for womens menstruation as it allows for a rhythmic flow with fewer obstructions.\r\n\nThe herbs in this remedy that support the liver are Tang Kuei, Bupleurum, Peony, Skullcap, Cyperus, Moutan, Gardenia, and Peppermint. Together, they clear heat, open and stimulate the flow of chi and blood through the liver, and are soothing.	external
131	Phlegm Be Gone	Excess Mucous, Clear Phlegm	28	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nPinellia\t\t          Ban Xia\r\n\nPlatycodon\t\t  Jie Geng\r\n\nCordyceps \t\t  Dong Chong Xia Cao\r\n\nFritillaria\t\t  Chuan Bei Mu\r\n\nAster\t\t\t  Zi Wan\r\n\nHoelen\t\t\t  Fu Ling\r\n\nMagnolia bark\t  Hou Po\r\n\nTangerine peel\t  Ju Hong\r\n\nBayberry\t\t\t  Myrica Cerifera\r\n\nAtractylodes\t\t  Bai Zhu\r\n\nColtsfoot\t\t  Tussilago Farfara\r\n\nSchizandra\t\t  Wu Wei Zi\r\n\nCitrus\t\t\t  Chen Pi\r\n\nGinger, fresh\t          Sheng Jiang	Western Therapeutic Actions\r\n\nExpectorant, restorative, digestive tonic, antitussive, and demulcent	Traditional Chinese Medicine\r\n\nResolves dampness &leftpar;congested fluids&rightpar;, warms and transforms phlegm, supports the middle burner, and redirects the qi downward	Sample Indications\r\n\nCoughing with copious sputum, chronic mucous, cold hands and feet, nausea, dizziness, attacks of qi rushing upward &leftpar;panic attack&rightpar;, tired after meals, occasional feverish and flushed face	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of hot \r\n\nwater, 3 times daily, or more frequently for \r\n\nacute conditions\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nUse with caution during pregnancy.	Notations\r\n\nPhlegm Be Gone is a modified version of two Chinese formulas, Er Chen Tang or Citrus and Pinellia Combination, and Ling Gui Zhu Gan Tang or Hoelen and Atractylodes Combination. This formula resolves acute and chronic phlegmatic conditions in the absence of a febrile disease or the aftermath of a febrile disease. \r\n\nIn Oriental Medicine, chronic mucous in the upper respiratory tract &leftpar;sinus, throat, and bronchial tubes&rightpar; involves two main organs, the lung and the spleen; and in this situation, the kidneys. The spleen, when abundant, transforms the turbid fluid into a pure mist and moistens the lungs. When the spleen is deficient, phlegm &leftpar;turbid fluid&rightpar; clogs the lung. Coughing is a natural response from the lungs in their effort to clear the turbidity. The lungs, weakened by the turbidity, are unable to disseminate the fluids and can not direct the renewed qi down to the kidneys. The fire in the kidney wanes and is not able to provide the spleen with the heat necessary to transform fluids. \r\n\nThis repetitive cycle causes a heaviness in the person. They are slow to respond as if bogged down. Depression, walking around in a haze, and unable to assert or engage themselves, physically and emotionally, becomes their pattern. Phlegm Be Gone is a great assistant for unlocking this pattern and clearing the way for a more engaged and vibrant life.\r\n\nEliminate dairy from the diet. Eat plenty of oats, roots, and cooked vegetables. Seafood puts some fire back into the kidneys. Hearty soups perks up the appetite and Motherwort tea lifts the spirits	external
134	Wheezz Drops	Acute Asthmal Attack	7	Ingredients Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nLobelia\t\tLobelia Inflata	Western Therapeutic Actions\r\n\nAntispasmodic, expectorant, and specific	Traditional Chinese Medicine\r\n\nFacilitates the movement of lung qi and controls wheezing	Sample Indications\r\n\nAcute asthma attacks and emphysema	Suggested Dosage\r\n\n5 drops placed under the tongue &leftpar;sub-lingually&rightpar;\r\n\nAfter waiting 2 minutes, repeat the dosage of 5 drops placed under the tongue only if needed\r\n\nAfter waiting another 2 minutes, repeat the dosage of 5 drops placed under the tongue only if needed\r\n\nAfter waiting 1 hour, repeat the dosage of 5 drops placed under the tongue, again only if needed\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nAsthma can be serious and life threatening. Consult a qualified health care practitioner if the asthma persists or the individual is having a difficult time breathing. \r\n\nWhen taking prescription drugs, never stop the usage of them immediately and substitute an herbal formula or remedy in their place. Easy does it! This type of approach may send the body into shock and have serious life threatening consequences.	Notations\r\n\nWheezz Drops help relax the muscular spasms in the chest and lungs. Asthma can be triggered by many things, especially allergies and febrile diseases. Explore any emotional links that the asthma might represent. In many cases, emotional stress is the trigger point for an asthma attack. A comprehensive healing program designed to include the body-mind-heart-spirit relationships could reveal some unidentified disorders or unresolved issues. Herbal formulas can support the harmonizing of the internal organs, clearing out any excesses, nourishing any weaknesses, and invigorating the circulation. \r\n\nThe use of inhalers can be minimized this way and the side-effects of the steroids reduced. Steroids have a negative impact on the body functions and organs. Long term use can be debilitating.\r\n\nLobelia is an expectorant, emetic, diaphoretic, anti-asthmatic, and stimulant. For bronchial afflictions, its actions are rapidly beneficial. Lobelia has traditionally been used for croup, whooping cough, and asthma. If an infant is suffering from bronchial distress and seemingly suffocated by their phlegm, Lobelia assists in alleviating the obstruction.	external
135	Head Ease	Headache, Migraines	28	Ingredients  &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nAngelica dah.\t      Bai Zhi\r\n\nCnidium\t\t\t      Chuan Xiong\r\n\nCorydalis\t\t      Yan Hu Suo \r\n\nLigusticum\t\t      Gao Ben\r\n\nSkullcap\t\t\t      Scutellaria Lateriflora\r\n\nSiler\t\t\t\t      Fang Feng\r\n\nChiang Huo\t\t      Qiang Huo\r\n\nWhite Willow bark\t      Salix Alba\r\n\nMeadowsweet\t      Filipendula Ulmaria\r\n\nBlue Flag\t\t      Iris Versicolor\r\n\nAngelica\t\t\t     Angelica Archangelica \r\n\nFeverfew\t\t\t     Tanacetum Parthenium\r\n\nLadys Slipper\t     Cypripedium Pubescens\r\n\nWahoo\t\t\t     Euonymus Atropurpureus	Western Therapeutic Actions\r\n\nAnti-inflammatory, decongestant, analgesic, nervine, alterative, and carminative	Traditional Chinese Medicine\r\n\nDisperses wind and alleviates pain	Sample Indications\r\n\nAll types of headaches &leftpar;tension, migraine, acute and chronic&rightpar;, TMJ, trigeminal neuralgia, upper body tension and pain, fevers and chills, and sinus congestion	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a cup of green tea, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nHead Ease is drying in nature. Use with caution in cases that are yin deficient with heat signs &leftpar;dry mouth, night sweats, heat in the hands and feet&rightpar;, or blood and qi deficiencies.	Notations \r\n\nHead Ease combines time proven Western herbs with a Chinese formula for the treatment of headaches and upper body pain, Chuan Xiong Cha Tiao San or Cnidium and Tea Formula. Head Ease is specifically designed for upper body pain and headaches. \r\n\nIn Oriental Medicine, when wind penetrates the body &leftpar;exterior&rightpar;, imbalances such as stagnation can occur. Stagnation causes the muscles and blood vessels to contract, which produces pain. For patients who experience chronic headaches, it is important to enrich the blood. When the blood is full, the wind has difficultly entering the bodies energy system. \r\n\nHead Ease is for short term use. If used for long term, herbal formulas that address the other imbalances in the body are added to the healing program. In many instances, the liver and stomach are involved with chronic headache sufferers. \r\n\nWahoo is a wonderful Native American herb used for clearing liver congestion. Angelica &leftpar;Bai Zhi&rightpar;, Cnidium, Ligusticum, Siler, and Chiang Huo are commonly used in releasing pain from the upper body by dispersing the wind. Corydalis is an excellent anodyne. Skullcap is a relaxant and nerve restorative. White Willow bark is an excellent anodyne and analgesic. Meadowsweet, which contains salicylic acid &leftpar;aspirin&rightpar;, disperses wind and is an analgesic. Blue Flag is a detoxicant and used for bilious headaches. Angelica is a warming relaxant. Feverfew is a nervous relaxant and migraine specific. Ladys Slipper is an antispasmodic.\r\n\nTraditionally, this formula was drunk with green tea to enhance its clearing actions.	external
136	Nerve Fire	Neuralgia And Shingles Pain	29	Ingredients &leftpar;Homeopathic&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nGelsemium\t\t\tGelsemium Sempervirens\r\n\nAconite\t\t\t\tAcontium Napellus\r\n\nBryonia\t\t\t\tBryonia Dioica\r\n\nSt. Johns Wort\t\tHypericum Perforatum	Western Therapeutic Actions\r\n\nAnti-inflammatory, analgesic, anodyne, and specific for the nerve fibers	Traditional Chinese Medicine\r\n\nClears heat and alleviates obstruction	Sample Indications\r\n\nNerve pain, neuropathy, trigeminal nerve pain, neuralgia, myalgia, shingles, headache, toothache, and tail-bone injury	Suggested Dosage\r\n\n5 - 20 drops, in a small amount of water, \r\n\nevery 2 hours, or as needed\r\n\nReduce dosage as symptoms subside\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nThere are none known.	Notations\r\n\nNerve Fire is a homeopathic remedy that addresses all types of nerve inflammations. Nerve Fire has supported many clients who suffer from neuropathy due to diabetes or chemotherapy.\r\n\n                                                 Homeopathic Properties\r\n\nGelsemium \talleviates nerve pain and motor paralysis, \r\n\n\t\tantispasmodic\r\n\nAconite\t\tanti-inflammatory, symptoms that have sudden onset, numbness and tingling\r\n\nBryonia\t\tfor acute pain, aggravation from any motion\r\n\nSt. Johns Wort alleviates nerve pain, antispasmodic\r\n\nUsing a poultice or fomentation helps to alleviate some of the pain from inflamed nerves.\r\n\n*Bran Poultice: See External Applications\r\n\n*Chamomile Fomentation: See External Applications	external
137	Nerve Food	Nourishes Nerves, Calms Anxiety	31	Ingredients &leftpar;Herbal Powders &\r\n\nHomeopathic Biochemic Tissue Salts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nSlippery Elm \t\t\tUlmus Fulva\r\n\nArrowroot\t\t\tMaranta Arundinacea\r\n\nAshwaganda\t\t\tWithania Somnifera \r\n\nKapikachu\t\t\tMucuna Pruriens\r\n\nCalcium Phosphate\r\n\nKali &leftpar;Potassium&rightpar; Phosphate	Western Therapeutic Actions\r\n\nRestorative, nervine, and nutritive	Traditional Chinese Medicine\r\n\nSupplements the qi, clears heat, and nourishes the heart	Sample Indications\r\n\nShattered nerves, nervous exhaustion, sleeplessness, poor digestion, hysteria, nervous headache, depression, neuralgia, shingles, and neuritis	Suggested Dosage\r\n\n1/2 - 1 teaspoon, mixed with a small amount of warm water, 3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nIf the individual is sensitive to lactose, Soy Nerve Food is the appropriate alternative.	Notations\r\n\nThis is an herbal powder and homeopathic biochemic tissue salt remedy. Slippery Elm is a premier nutritive tonic and restorative. \r\n\nArrowroot supports Slippery Elm with its nutritive and demulcent qualities. Ashwaganda is an adaptogenic herb and excels during times of stress, whether it be physical or emotional. In Ayurvedic medicine, it is considered a restorative. Kapikachu, another Ayurvedic herb, is an excellent nervine and assists in supporting the healthy functioning of the nerve cells.\r\n\n                                                                           Biochemic Tissue Salts\r\n\nCalcium Phosphate\t\r\n\n\tHelps build new blood cells, strengthens bones and teeth \tand aids digestion. Used for poor circulation, chilblains, \t\tindigestion, anemia, convalescence, teeth problems.\r\n\nKali Phosphate\t\t\r\n\n\tA nerve soother and nutrient, and enhances brain \r\n\n\tfunctions. Used for tension, headaches, indigestion, \r\n\n\tdepression, loss of sleep and irritability.\r\n\nNerve Food soothes, calms, and strengthens the nervous system. With any debility it is essential to treat or remove the cause of exhaustion. Breathing exercises, gentle physical exercise, friction baths, massage, and rest are beneficial tools.	external
138	Rock A Bye	Restless Sleep	29	Ingredients&leftpar;Herbal Extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nZizyphus\t\tSuan Zao Ren\r\n\nPolygala\t\t\tYuan Shi\r\n\nBiota\t\t\tBai Zi Ren\r\n\nHoelen\t\t\tFu Shen\r\n\nSchizandra\t\tWu Wei Zi\r\n\nPeony\t\t\tBai Shao Yao\r\n\nDragon bone\t\tLong Gu\r\n\nJuncus\t\t\tDeng Xin Cao\r\n\nHops\t\t\tHumulus Lupulus\r\n\nGardenia\t\tZhi Zi\r\n\nLemon Balm\t\tMelissa Officinalis\r\n\nPassion Flower\tPassiflora Incarnata\r\n\nCowslip\t\t\tPrimula Veris	Western Therapeutic Actions\r\n\nSedative, antispasmodic, nervine, carminative, anodyne, and tonic	Traditional Chinese Medicine\r\n\nNourishes the heart blood and yin, calms the spirit, and clears excessive heart fire	Sample Indications\r\n\nInsomnia, restless sleep, dream disturbed sleep, and palpitations with anxiety	Suggested Dosage\r\n\n10 - 20 drops, in a small amount of water, 1 hour before bedtime for insomnia\r\n\n10 - 20 drops, in a small amount of water, 3 times daily, for palpitations with anxiety\r\n\nVariation is according to individual symptoms	Contraindication and Cautions\r\n\nThere are none known.	Notations\r\n\nRock A Bye follows the traditional concept of many cultures that believe the spirit resides within the heart. When the heart is nourished and well-cared for, the spirit is at ease and rests comfortably. Excessive emotion agitates the heart and the spirit becomes unsettled, restless. An agitated heart creates insomnia. \r\n\nIn the Dagara teachings, the ancestors visit us in our dreams. When the spirit is agitated, communication with the spirit world is disrupted. If we do not sleep, we do not dream. In the absence of dreams, the messages of the ancestors get lost. Sometimes they are difficult to understand and we need to consult with a healer who is a dream keeper. This way we will know how to act upon the dream. Dreams are considered transmissions that sometimes require action. Spirit, life, and ancestors are not considered to be nouns, but verbs. They hint action!\r\n\nRock A Bye brings nourishment to the heart, clears out any excessive heat &leftpar;agitation&rightpar;, calms the liver, and brings calmness to the spirit. This formula does not have any lingering side effects such as daytime drowsiness. It will bring a more calm feeling and the opportunity to wake up rested, refreshed.\r\n\nZizyphus, Polygala, and Biota nourish the heart and calm the spirit. Hoelen supports the spleen and quiets the heart. Schizandra stabilizes the spirit, when the fluids of the heart and kidney are depleted. Peony softens and relaxes the liver. Dragon bone settles the spirit and calms the liver. Juncus clears heat from heart and supports communication between the kidneys and heart. Hops and Passion Flower are nervous sedatives, calm the spirit, and relieve anxiety. Gardenia clears heat and relieves irritability. Lemon Balm is a sedative and carminative. Cowslip is a nervous restorative and sedative.	external
139	Sleepy Drops	Busy Mind	7	Ingredients &leftpar;Homeopathic&rightpar;\r\n\nAconite\t\tAcontium Napellus	Western Therapeutic Actions\r\n\nNervous sedative and specific	Traditional Chinese Medicine\r\n\nCalms the spirit	Sample Indications\r\n\nInsomnia that is caused through over-activity of the brain, when worry and thoughts interrupt the normal pattern of sleep	Suggested Dosage\r\n\n5 - 20 drops before going to bed\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nThere are none known.	Notations\r\n\nThe key symptom for this homeopathic remedy is when the mind will not stop thinking or worrying about things that are happening. A person lies down to go to sleep and the mind refuses to stop. Counting sheep does not even help nor does a warm glass of milk! Alas! What to do? Sleepy Drops, and sleep, sleep, sleep!	external
140	Bush Aphrodisiac	Sexual Tonic	29	&leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nKawa Kawa\t\tPiper Methysticum\r\n\nMatai\t\t\tPrumnopitys Traxilohia\r\n\nManawa \t\t\tTradescan Tia Fluminensis\r\n\nPuka\t\t\tMeryta Sinclairii\r\n\nKauri\t\t\tAgathis Vitiensis\r\n\nTawa\t\t\tBeilschmiedia Tawa\r\n\nTaraire\t\t\tBeilschmedia Taraire\r\n\nTarata\t\t\tPittosporum Eugenioides\r\n\nTanekaha\t        Phyllocladus Trichomanoides	Western Therapeutic Actions\r\n\nRestorative tonic, nerve tonic, hepatic, aphrodisiac, and adrenal tonic	Traditional Chinese Medicine\r\n\nEnhances the reproductive qi, calms the spirit, and soothes the liver	Sample Indications\r\n\nWeak sexual drive, sexual exhaustion, insomnia, nervous \r\n\nexhaustion, and tension	Suggested Dosage\r\n\n5 - 20 drops, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nSexual dysfunction may indicate more serious medical problems Seek the cause, low libido may be due to physical or emotional problems. If trouble persists seek a diagnosis and treatment from a qualified medical practitioner.	Notations \r\n\nThese Maori herbs &leftpar;New Zealand&rightpar; have been used medicinally for centuries. They are used in many of our herbal remedies. Bush Aphrodisiac was developed by Angela Chadwick, Medical Herbalist of Self Heal, in New Zealand. \r\n\nBush Aphrodisiac is a unique formulation in that it enhances the libido &leftpar;kidney restorative&rightpar; while calming the heart. Her idea was to include a loving open heart into the sexual realm as a means to enhance the libido. Bush Relaxant is the same formulation with different herb quantities to encourage a calm and serene attitude.\r\n\nKawa Kawa is a blood purifier, aphrodisiac, and kidney tonic. Matai, Tarata,  and Tawa are digestive and lung tonics. Manawa is a relaxant. Puka is a restorative, regulates the menstruation, and aids digestion. Kauri is a restorative to the body and mind. Taraire is a hormone balancer and calms the mind. Tanekaha is a premier liver purifier.	external
142	Bush Bitters Cream	Cure All, Herpes, Fever Blisters	15	Ingredients &leftpar;Herbal Extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nHarakeke\t        Phormium Tenax\r\n\nKumarahoe\tPomaderris Kum\r\n\nKawa Kawa\tPiper Methysticum \r\n\nPukatea\t        Laurelia Novae-\r\n\nHoropito\t        Pseudowintera Colorata\r\n\nKoromiko\t        Hebe Salicifolia\r\n\nKohe Kohe\tDysoxylum Spectabile\r\n\nPuriri\t\tVitex Lucens\r\n\nKaramu\t\tCoprosma Robusta\r\n\nKowhai\t\tSophora Microphylla\r\n\nKareao\t\tRipogonum Scandens \r\n\nBeeswax\r\n\nOlive Oil	Western Therapeutic Actions\r\n\nVulnerary, antiseptic, anti-inflammatory, analgesic, and antipruritic	Traditional Chinese Medicine\r\n\nClears heat, alleviates pain, and disperses blood stasis	Sample Indications\r\n\nPain relief, cold sores, genital herpes, boils, diaper rash, psoriasis, sun spots, tinea, eczema, and itchy bites	External Application\r\n\nApply topically to the affected area, 3 times daily	Contraindications and Cautions\r\n\nThere are none known.	Notations\r\n\nBush Bitters Cream is known to be successful when all else has failed. It promotes the healing of any skin condition. This remedy is made exclusively with herbs from the Maori tradition.	external
143	Bush Relaxant	Stress	29	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nKawa Kawa\t\tPiper Methysticum\r\n\nMatai\t\t\tPrumnopitys Traxilohia\r\n\nManawa \t\t\tTradescan Tia Fluminensis\r\n\nPuka\t\t\tMeryta Sinclairii\r\n\nKauri\t\t\tAgathis Vitiensis\r\n\nTawa\t\t\tBeilschmiedia Tawa\r\n\nTaraire\t\t\tBeilschmedia Taraire\r\n\nTarata\t\t\tPittosporum Eugenioides\r\n\nTanekaha\t\tPhyllocladus Trichomanoides	Western Therapeutic Actions\r\n\nRestorative, nerve tonic, hepatic, aphrodisiac, and adrenal tonic	Traditional Chinese Medicine\r\n\nEnhances the reproductive qi, calms the spirit, and soothes the liver	Sample Indications\r\n\nNervous exhaustion, stress, insomnia, weak libido, and tension	Suggested Dosage\r\n\n5 - 20 drops, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nSexual dysfunction may indicate more serious medical problems Seek the cause, low libido may be due to physical or emotional problems. If trouble persists seek a diagnosis and treatment from a qualified medical practitioner.	Notations \r\n\nThese Maori herbs &leftpar;New Zealand&rightpar; have been used medicinally for centuries. They are used in many of our herbal remedies. Bush Relaxant was developed by Angela Chadwick, Medical Herbalist of Self Heal, in New Zealand. \r\n\nBush Relaxant is a unique formulation in that it enhances the libido &leftpar;kidney restorative&rightpar; while calming the heart. Her idea was to include a loving open heart into the sexual realm as a means to enhance the libido. Bush Aphrodisiac is the same formulation with different herb quantities to encourage the libido.\r\n\nKawa Kawa is a blood purifier, aphrodisiac, and kidney tonic. Matai, Tarata,  and Tawa are digestive and lung tonics. Manawa is a relaxant. Puka is a restorative, regulates the menstruation, and aids digestion. Kauri is a restorative to the body and mind. Taraire is a hormone balancer and calms the mind. Tanekaha is a premier liver purifier.	external
144	Man's Path	Enlarged Prostate	28	Ingredients Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nSaw Palmetto\t\t\tSerenoa Serrulata\r\n\nPlantago seed\t\tChe Qian Zi\r\n\nVaccaria\t\t\t\tWang Bu Liu Xing \r\n\nAstragalus\t\t\tHuang Qi\r\n\nMarshmallow\t\t\tAlthea Officinalis\r\n\nCorn Silk\t\t\tYu Mi Xu\r\n\nPatrinia\t\t\t\tBai Jiang Cao\r\n\nEchinacea\t\t\tEchinacea Angustifolia\r\n\nSarsaparilla\t\t\tSmilax Officinalis\r\n\nSkullcap\t\t\t\tScutellaria Lateriflora\r\n\nAchyranthes\t\t\tNiu Xi\r\n\nSaussurea\t\t\tMu Xiang\r\n\nGoldenseal\t\t\tHydrastis Canadensis\r\n\nKava Kava\t\t\tPiper Methysticum	Western Therapeutic Actions\r\n\nAntiseptic, detoxicant, diuretic, demulcent, emollient, alterative, depurative, and tonic	Traditional Chinese Medicine\r\n\nClears damp/heat, supplements the qi, vitalizes the blood, invigorates the channels, relieves toxicity, and promotes urination	Sample Indications\r\n\nReconditioning of the prostate gland, prostatitis, benign prostatic hyperplasia, sedimentation, painful or difficult urination, frequent urination, difficulty in maintaining an erection, painful ejaculation, blood in the urine or semen, and pain or stiffness in the lower back	Suggested Dosage\r\n\n1  2 teaspoons, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nUse with caution with cases of exhausted yang. Mans Path works well with other formulas that nurture the kidneys.	Notations\r\n\nMans Path is designed to cleanse the prostate gland and and restore it to healthier functioning. The Chinese herbs used in this formula are patterned after a very effective Chinese patent formula called Kai Kit Wan. \r\n\nSaw Palmetto is long established as a specific for the prostate gland in men, and a reproductive enhancing herb as it strengthens the kidney yang. Echinacea supports Saw Palmetto with its cleansing actions. Plantago seed clears damp/heat from the lower body. Vaccaria activates the blood and relieves pain in the lower abdomen. Astragalus and Corn Silk promote the movement of fluids. Patrinia relieves toxicity and toxic swellings. Sarsaparilla is a testosterone hormone enhancer and an alterative. Skullcap helps to relieve the constrained liver qi. Achyranthes directs the action of this formula downwards through the kidneys and reproductive organs. Saussurea regulates the middle burner and activates the circulation of qi. Goldenseal helps to heal the mucous membranes and reproductive tissues. Kava Kava is a restorative and diuretic.\r\n\nPumpkin seeds and pomegranates are an excellent addition to the diet. If inflammation, pain, and frequent urination are present, a *Bran Poultice may be placed on the lower abdomen. Hold the poultice in place with a large bandage or towel and leave on overnight. Repeat as needed.\r\n\nA PSA test and DRE is recommended for prostate cancer screening if urinary or erectile dysfunction persist.\r\n\n*Bran Poultice: See External Applications	external
145	Men Only	Enhances Fertility	28	Ingredients &leftpar;Herbal Extracts&rightpar;\r\n\nListed by common and pin yin or latin names, in sequence from largest to smallest amount by quantity.\r\n\nRehmannia, prepared\tShu Di Huang\r\n\nDamiana\t                 \tTurnera Diffusa\r\n\nSarsaparilla\t         \tSmilax Officinalis\r\n\nAtractylodes\t         \tBai Zhu\r\n\nTang Kuei\t                 \tDang Gui\r\n\nLycium fruit\t         \tGou Qi Zi\r\n\nSaw Palmetto\t         \tSerenoa Serrulata\r\n\nMuira Puama\t         \tLiriosma Ovata\r\n\nYohimbe\t                 \tPausinystalia Yohimbe\r\n\nCurculigo\t                 \tXian Mao\r\n\nGinseng, Chinese      \tJi Lin Ren Shen\r\n\nMorinda\t                 \tBa Ji Tian\r\n\nCistanche          \t        Rou Cong Rong\r\n\nCornus\t\t\tShan Zhu Yu\r\n\nEucommia\t\tDu Zhong\r\n\nEpimedium\t\tYin Yang Huo\r\n\nGentian\t\t\tGentiana Lutea\r\n\nCinnamon bark\t\tRou Gui\r\n\nCnidium seed\t\tChe Chuang Zi	Western Therapeutic Actions\r\n\nStimulant, reproductive restorative, alterative, nutritive tonic, diuretic, aphrodisiac	Traditional Chinese Medicine\r\n\nStrengthens the kidney yang, warms the lower body, nourishes the yin and replenishes the essence	Sample Indications\r\n\nInfertility, low sperm count, impotence, weakness in the lower body, exhaustion after sex, and loss of passion	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, 3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nThere are none known.	Notations\r\n\nMen Only, patterned after a Chinese formula, Zan Yu Dan, feeds the fire at Gate of Vitality. When the fire declines in the well of the kidney, sexual dysfunctions arise. This remedy, in alignment with ancient knowledge, follows the principle that when the kidny yang &leftpar;fire&rightpar; is fortified, the kidney yin &leftpar;water&rightpar; must also be nourished. This prevents the overheating of the kidney yang and helps to augment the essence. When a man has cold sperm, they are unable to swim that extra mile and the ones that do make it, lack the power to penetrate the egg. Alas men, keep those kidneys warm, eat those shrimp and oysters, and babies will abound! Premature ejaculation is more of a kidney yin deficiency, as the water is unable to constrain the fire.	external
147	Cysts Clear	Uterine Cysts	28	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nLindera\t\t\t\tWu Yao\r\n\nTang Kuei\t\t\tDang Gui\r\n\nCodonopsis\t\t\tDang Shen\r\n\nCarthamus\t\t\tHong Hua\r\n\nPersica\t\t\t\tTao Ren\r\n\nBurdock root\t\t\tArctium Lappa\r\n\nCorydalis\t\t\tYan Hu Suo\r\n\nCyperus\t\t\t\tXiang Fu\r\n\nPoke Root\t\t\tPhytolacca Spp.\r\n\nEchinacea\t\t\tEchinacea Angustifolia\r\n\nMoutan\t\t\t\tMu Dan Pi\r\n\nWild Indigo\t\t\tQing Dai\r\n\nJaborandi\t\t\tPilocarpus Spp.\r\n\nGoldenseal\t\t\tHydrastis Canadensis\r\n\nCinnamon bark\t\tRou Gui	Western Therapeutic Actions\r\n\nDecongestant, detoxicant, alterative, depurient, deobstruent, and relaxant	Traditional Chinese Medicine\r\n\nVitalizes the blood, promotes the movement of qi, supplements the qi, spreads constrained liver qi, warms the kidneys, and \r\n\nalleviates pain	Sample Indications\r\n\nAbdominal masses, fluid cysts, menstrual pain, and fixed lower abdominal pain &leftpar;including hernia&rightpar;	Suggested Dosage\r\n\n1  2 teaspoons, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nContraindicated during pregnancy. Discontinue the use of this formula during the menstrual cycle.	Notations \r\n\nIn Oriental Medicine, when coldness in the lower body goes untreated, blood loses its free flowing movement, stagnation occurs, and the fluid in the body forms soft masses. Cysts Clear is effective when there are additional cold symptoms &leftpar;cold abdomen or feet&rightpar;. Fluid cysts can be rapidly resolved when blood-invigorating herbs are combined with warming herbs. Cysts Clear is a modified version of Ge Xia Zhu Yu Tang or Drive Out Blood Stasis Below the Diaphragm Decoction, and should subsequently be followed up with formulas that address the systemic cause of the disorder.\r\n\nLindera promotes the smooth movement of qi, disperses internal cold, and alleviates pain. Tang Kuei nourishes the blood and Codonopsis supplements the qi. Carthamus with Persica invigorates the blood and disperses blood stasis. Poke root is an excellent alterative and commonly used for swollen lymph nodes. Burdock root is a premier blood purifier and is supported by Echinacea and Wild Indigo. Moutan cools the blood and balances Cinnamon barks warming actions. Cyperus helps to move the qi and breaks up stagnation. Corydalis disperses blood stagnation and alleviates abdominal pain. Jaborandi, an excellent herb for diabetes, is also a deobstruent and clears the lymphatic system. Goldenseal helps the tissue membranes to heal and also balances the warm nature of Cinnamon bark. Cinnamon bark warms the kidneys, disperses internal cold, warms and unblocks the channels, and alleviates pain.\r\n\nRemember that chronic fear, worry, and stress deplete the essence of the kidney and could be a causative factor.	external
148	Fibroid Clear	Uterine Fibroids	28	Ingredients  &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nRhodiola\t\t\tHong Jing Tian\r\n\nZedoaria\t\t\tE Zhu\r\n\nSparganium\t\tSan Leng\r\n\nBurdock root\t\tArctium Lappa\r\n\nFalse Unicorn\tChamaelirium Luteum\r\n\nTang Kuei\t\tDang Gui\r\n\nCinnamon twig\tGui Zhi\r\n\nPeony, red\t\tChi Shao Yao\r\n\nCorydalis\t\tYan Hu Suo\r\n\nHoelen\t\t\tFu Ling\r\n\nPersica\t\t\tTao Ren\r\n\nMoutan\t\t\tMu Dan Pi\r\n\nPoke Root\t\tPhytolacca Spp.\r\n\nLadys Mantle\tAlchemilla Vulgaris\r\n\nGoldenseal\t\tHydrastis Canadensis	Western Therapeutic Actions\r\n\nAlterative, depurative, deobstruent, astringent, styptic, and tonic	Traditional Chinese Medicine\r\n\nBreaks up blood stasis, promotes the movement of qi, nourishes the blood, supplements the qi, reduces fixed abdominal masses, and alleviates pain	Sample Indications\r\n\nLower abdominal masses, uterine fibroids, uterine cysts, pelvic inflammatory disease, dysmenorrhea, and endometriosis	Suggested Dosage\r\n\n1  2 teaspoons, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nContraindicated during pregnancy or postpartum. Discontinue the use of this formula during the menstrual cycle.	Notations \r\n\nFibroid Clear is designed to be taken for several months. In order to arrest the bleeding from fibroids, they must be reduced in size and the blood stagnation dispersed. Originally, Gui Zhi Fu Ling Wan or Cinnamon and Hoelen Formula, was given to pregnant woman suffering from abdominal pain with uterine bleeding. The herbs in the original formula are Cinnamon twig, Hoelen, Peony, Moutan, and Persica.\r\n\nBy modifying Gui Zhi Fu Ling Wan with the addition of Zedoaria and Sparganium, two strong vitalizing blood herbs, the actions of Fibroid Clear are enhanced. Rhodiola was added to this formula as a restorative to help address the underlying deficiency of this imbalance. Rhodiola has excellent adaptogenic, anti-stress, and anti-oxidant qualities. Red Peony was substituted for White Peony because of its greater ability to break up blood stagnation. In Oriental Medicine, fixed abdominal masses are thought of as qi and blood that is constrained or tied up. Constrained qi or blood can cause, over time, the formation of masses and heat. Moutan and Persica cool the blood and disperse accumulation. Ladys Mantle cools the blood and has astringent qualities. With these two qualities, it is used specifically for excessive female bleeding. False Unicorn is a premier uterine restorative with astringent actions and combines well with Tang Kuei, a blood restorative. Poke root is a blood and lymph cleanser. Cyperus breaks up constrained liver qi and relieves stress. Corydalis relieves lower abdominal pain. \r\n\nRestorative herbal tonics should be administered to the patient after the fibroids have been cleared. Usually, a cold lower abdomen that is constrained, is linked to an underlying deficient condition.	external
149	Phoenix Rising	Sexual Stimulant	28	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nEpimedium\t\t  Yin Yang Huo\r\n\nKapikachu\t\t  Mucuna Pruriens\r\n\nAshwaganda\t\t  Withania Somnifera\r\n\nRehmannia, prep.   Shu Di Huang\r\n\nMaca\t\t\t  Lepidium Meyenii\r\n\nTribulus\t\t\t  Bai Ji Li\r\n\nCornus\t\t\t  Shan Zhu Yu\r\n\nCatuaba\t\t\t  Erythroxylum Catuaba\r\n\nClavo Huasco\t  Tynanthus Panurensis\r\n\nDamiana\t\t\t  Turnera Diffusa\r\n\nShilajit\t\t\t  Asphaltum\r\n\nLindera\t\t\t  Wu Yao\r\n\nBayberry\t\t\t  Myrica Cerifera\r\n\nMotherwort\t\t  Leonurus Cardiaca	Western Therapeutic Actions\r\n\nAphrodisiac, restorative, nerve tonic, nutritive tonic, circulatory stimulant, and relaxant	Traditional Chinese Medicine\r\n\nFortifies the kidney yang and replenishes the essence, warms the lower body, and nourishes the yin	Sample Indications\r\n\nWeak libido, sexual impotence, frigidity, erectile dysfunction, spermatorrhea, and infertility	Suggested Dosage\r\n\n1  2 teaspoons, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nContraindicated during a warm/febrile disease, or if yin deficient with fire &leftpar;thirst, night sweats, hot feet and hands, and a red tongue&rightpar;.	Notations\r\n\nPhoenix Rising was designed with sexual stimulant herbs from time proven herbs from around the world. In Oriental Medicine the kidney yang &leftpar;fire&rightpar; has to be plentiful for a robust libido. Because of the strength, of Phoenix Rising, it activates ones sexuality quite immediately. Taking a dosage one hour before bedtime has proven very effective. Herbs for the heart have been included in this formula, acknowledging that sexuality is intimately connected to our heart, and our ability to be compassionate and open.\r\n\nEpimedium is a kidney yang tonic. It is used for weak libido, incontinence, forgetfulness, withdrawal, and cold lower body. Kapikachu and Ashwaganda, Ayurvedic herbs, are restoratives and support the nervous system. Rehmannia nourishes the kidney yin and balances the warm nature of this formula. Maca and Clavo Huasco, Peruvian herbs, have been used traditionally as aphrodisiacs and to enhance fertility. Catuaba, a Brazilian herb, is used to fortify the nervous system and as an aphrodisiac. Tribulus anchors the kidney yang and enhances testosterone levels. Cornus nourishes the kidney and liver and augments the essence. Damiana is the Western counterpart to Epimedium. Shilajit, another Ayurvedic herb, is considered an anti-aging herb and fertility enhancer. Lindera and Bayberry enhance the circulation in the lower body. Motherwort nourishes the heart and calms the nerves.	external
150	Woman's Blues	Mood Swings, Supports Hormones	28	Ingredients &leftpar;&leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nTang Kuei\t\t        Dang Gui\r\n\nSkullcap\t\t\t        Scutellaria Lateriflora\r\n\nCyperus\t\t\t        Xiang Fu\r\n\nLindera\t\t\t        Wu Yao\r\n\nRehmannia, prep.\t\tShu Di Huang\r\n\nShatavari\t\t\tAsparagus racemosa\r\n\nPeony, red\t\t\tChi Shao Yao\r\n\nBlue Citrus\t\t\tQing Pi\r\n\nCarthamus\t\t\tHong Hua\r\n\nCnidium\t\t\t\tChuan Xiong\r\n\nUva Ursi\t\t\t\tArctostaphylos Uva Ursi\r\n\nMotherwort\t\t\tLeonurus Cardiaca\r\n\nMoutan\t\t\t\tMu Dan Pi\r\n\nCinnamon bark\t\tRou Gui	Western Therapeutic Actions\r\n\nEmmenagogue, nutritive, decongestant, analgesic, antispasmodic, nervine, diuretic, and relaxant	Traditional Chinese Medicine\r\n\nVitalizes the blood, transforms blood stasis, nourishes the blood, regulates the qi, and alleviates menstrual distress\r\n\nü	Sample Indications\r\n\nPMS &leftpar;emotional outbreaks, sugar cravings, tender or swollen breasts, and water retention&rightpar;, irregular menstruation, and abdominal discomfort prior to menstruation	Suggested Dosage\r\n\n1  2 teaspoons, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nThere are none known.	Notations\r\n\nWomans Blues is a hormone balancer for women of all ages up to menopause. When the blood becomes stagnant and loses its free flowing nature, the psyche responds inappropriately and the emotions spill over onto others. In Oriental Medicine, heat accompanies stagnation. Irritation or anger might take the front stage as things begin to heat up. \r\n\nWomans Blues is a modified version of a formula created by Dr. Zhang Jie-bin, called Tong Yu Jian, or Penetrate Congealed Blood Decoction, and the Chinese classic, Si Wu Tang or Tang Kuei Four Combination. The Chinese herbs are supported by Western proven specifics.\r\n\nTang Kuei is the premier blood tonic. It nourishes the blood and regulates the menstruation. Its warm nature disperses cold and alleviates pain. Tang Kuei also moistens the bowels and alleviates constipation. Skullcap is a nervine and antispasmodic. Cyperus regulates the menstruation, alleviates pain, and moves the liver qi. Lindera warms the lower abdomen, promotes the movement of qi, and alleviates pain. Rehmannia nourishes the liver and kidney yin. Shatavari, an Ayurvedic herb, balances the female hormonal system. Peony, Carthamus, and Cnidium vitalize the blood. Blue Citrus supports Cyperus and helps to spread the liver qi. Moutan and Motherwort &leftpar;Leonurus Cardiaca&rightpar; help to calm the emotional outbursts and agitation. Uva Ursi is a gentle diuretic and will resolve any excess water retention that women experience during their cycle. Because of its draining nature, Uva Ursi directs the actions of the other herbs towards the lower abdomen. Cinnamon bark disperses the deep internal cold and unblocks the channels. It leads the fire back to its source.	external
151	Woman's Cream	Tones Female Tissue	15	Ingredients &leftpar;Herbal Extracts&rightpar;\r\n\nListed by common and pin yin or latin names, in sequence from largest to smallest amount by quantity.\r\n\nBlack Cohosh\t\tCimicufuga Racemosa\r\n\nTang Kuei  \t\tDang Gui\r\n\nGoldenseal\t\tHydrastis Canadensis\r\n\nMarshmallow\t\tAlthea Officinalis\r\n\nWild Yam   \t\tDioscorea Villosa\r\n\nBeeswax\r\n\nOlive Oil	Western Therapeutic Action\r\n\nRestorative, nutritive, tonic, demulcent, emollient, and antispasmodic	Traditional Chinese Medicine\r\n\nNourishes the blood and kidney, promotes the circulation of blood, and heals skin tissues	Sample Indications\r\n\nDry or thinning vaginal tissues, female hypogonadism, and chronic estrogen deficiency	External Application\r\n\nApply cream to the vaginal tissues, 2 times daily or as needed	Contraindications and Cautions\r\n\nContraindicated during pregnancy.	Notations\r\n\nWomans Cream is led by the herb, Black Cohosh, which contains phytoestrogens &leftpar;estrogen-like&rightpar; compounds, and mimics  the chemistry of estrogen. This cream is a supportive therapy for estrogen deficiency and women have enjoyed the benefits it has given them during and following menopause.	external
188	Neck Shoulder Pain	\N	28	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nCorydalis\t\t\tYan Hu Suo\r\n\nChiang Huo\t\t\tQiang Huo\r\n\nTurmeric\t\t\tCurcuma Longa\r\n\nDu Huo\t\t\t\tTu Huo\r\n\nClematis\t\t\t\tWei Ling Xian\r\n\nPueraria\t\t\t\tGe Gen \r\n\nGentiana, macro.\t\tQin Jiao\r\n\nPeony\t\t\t\tBai Shao Yao\r\n\nMorus twig\t\t\tSang Zhi \r\n\nBlack Cohosh\t\tCimicufuga Racemosa\r\n\nMistletoe\t\t\tViscum Album\r\n\nCramp Bark\t\t\tViburnum Opulus\r\n\nCinnamon twig\t\tGui Zhi\r\n\nGinger, dried\t\t\tGan Jiang	Western Therapeutic Actions\r\n\nAnodyne, anti-inflammatory, analgesic, nutritive, alterative, and antispasmodic	Traditional Chinese Medicine\r\n\nDispels wind/dampness, harmonizes the protective and nutritive qi, vitalizes the blood, and breaks up stagnant qi	Sample Indications\r\n\nNeck and shoulder pain, upper body muscular spasms, rotator cuff injury, bursitis, tendonitis, limited mobility in the upper body, and numbness in the arms	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nContraindicated during pregnancy.	Notations \r\n\nNeck Shoulder Pain, uses two Chinese formulas, Gui Zhi Jia Ge Gen Tang or Cinnamon and Pueraria Combination, and Juan Bi Tang or Chiang Huo and Turmeric Combination, to address acute and chronic disorders involving the neck and shoulder. \r\n\nCorydalis is a specific for pain relief, regardless of location, as it follows the direction of the herbs in the formula. Chiang Huo and Clematis dispel wind/damp and alleviate pain in the upper body. Three specific herbs for treating neck and shoulder problems, Pueraria, Morus twig, and Gentiana &leftpar;Qin Jiao&rightpar; have also been included in this formula. They are commonly used together for resolving wind/dampness, alleviating pain, and unblocking the channels. Turmeric expels wind, vitalizes the blood, and moves the qi. It is used for upper and mid-body pain. Du Huo, commonly used in resolving muscular/skeletal imbalances of the lower body, is led by Chiang Huo for alleviation of upper body pain. Black Cohosh relieves trapezius pain. Mistletoe and Cramp Bark combine well for the relief of muscular spasms. Peony and Cinnamon twig are paired because of their ability to release muscular tension and harmonize the protective and nutritive qi. Ginger warms the limbs and supports the stomach.\r\n\nReplenishment or tonification of the body is important to consider as it follows the Oriental Medicine belief that, if one desires to unblock, then one must first fill. Herbal therapies that vitalize the blood, move the qi, or open the channels, also take into consideration any depletion or deficiency of the client. Otherwise the symptoms temporarily subside, only to return later, sometimes with greater vigor and fire power.\r\n\nSee Muscular & Skeletal External Formulas for additional support	internal
152	Woman's Moon	Menstrual Regulator	28	Ingredients&leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nTang Kuei\t\t\tDang Gui\r\n\nRaspberry leaf\t\tRubus Idaeus\r\n\nSkullcap\t\t\t\tScutellaria Lateriflora\r\n\nRehmannia, prep.\t\tShu Di Huang\r\n\nShatavari\t\t\tAsparagus racemosa\r\n\nCodonopsis\t\t\tDang Shen\r\n\nPeony\t\t\t\tBai Shao Yao\r\n\nCnidium\t\t\t\tChuan Xiong\r\n\nHoelen\t\t\t\tFu Ling\r\n\nLadys Mantle\t\tAlchemilla Vulgaris\r\n\nFalse Unicorn\t\tChamaelirium Luteum\r\n\nUva Ursi\t\t\t\tArctostaphylos Uva Ursi\r\n\nLicorice, baked\t\tZhi Gan Cao\r\n\nWild Yam\t\t\tDioscorea Villosa\r\n\nCramp Bark\t\t\tViburnum Opulus\r\n\nCinnamon bark\t\tRou Gui	Western Therapeutic Actions\r\n\nEmmenagogue, nutritive, calming, decongestant, astringent, diuretic, and antispasmodic	Traditional Chinese Medicine\r\n\nNourishes the liver blood, spreads the liver qi, strengthens the spleen, resolves dampness, and warms the kidneys	Sample Indications\r\n\nAnemia, fatigue, menstrual irregularity and discomfort, warmth relieves abdominal pain, neck and shoulder stiffness, flushed face &leftpar;feverish&rightpar;, cold extremities &leftpar;especially the feet&rightpar;, vertigo or dizziness	Suggested Dosage\r\n\n1  2 teaspoons, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms\r\n\nü	Contraindications and Cautions \r\n\nContraindicated during pregnancy.	Notations\r\n\nWomans Moon is designed to create a smooth rhythmic menstrual cycle. Dang Gui Shao Yao San or Tang Kuei and Peony Formula provides the foundation for many womens formulas in Oriental Medicine. It was expanded to include three additional herbs; Codonopsis, Licorice, and Cinnamon and named, Jen Sheng Tang Shao San or Ginseng and Tang Kuei Formula. \r\n\nWith the addition of Raspberry leaf and Ladys Mantle, Womens Moon corrects the imbalance of a cold uterus. Tang Kuei excels in all gynecological syndromes as it nourishes and moves the blood. Skullcap is a nervine and antispasmodic. Rehmannia nourishes the blood, kidney yin, and essence. Shatavari is a female hormone balancer. False Unicorn supports the production of estrogen, harmonizes menstruation, and enhances fertility. Uva Ursi, also called Bearberry, nourishes the kidneys and directs the herbs downward. Wild Yam is a uterine relaxant, enhances progesterone production, circulates the qi in the uterus, Cinnamon bark fortifies the kidney yang. Cramp bark vitalizes the blood, moves the qi, and harmonizes the menstrual cycle.\r\n\nIn Oriental Medicine, illusionary heat and true cold or heat above/cold below mark this formula. The deficiency &leftpar;blood and qi&rightpar; is unable to hold the yang &leftpar;fire&rightpar; down in its proper place, called the dan-tien, located four inches below the navel. When the yang floats upward &leftpar;heat rising&rightpar;, facial flushing, feverish feeling, acne, hot eyes, headache, palpitations, anxiousness, or rashes are noticed. As the heat floats upward, what is left below suffers from cold. The abdomen and feet feel chilled and are relieved by warmth.	external
169	Golden Lock	Urinary Incontinence, Premature Ejaculation	28	Ingredients  &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nAstragalus seed\t\tSha Yuan Zi\r\n\nLotus seed\t\t\tLian Zi\r\n\nEuryales\t\t\t\tQian Shi\r\n\nCuscuta\t\t\t\tTu Si Zi\r\n\nCornus\t\t\t\tShan Zhu Yu\r\n\nLotus stamen\t\tLian Xu\r\n\nAgrimony\t\t\tAgrimonia Eupatoria\r\n\nPsoralea\t\t\t\tBu Gu Zhi\r\n\nRose Hip\t\t\tJin Ying Zi\r\n\nSchizandra\t\t\tWu Wei Zi\r\n\nCynomorium\t\t\tSuo Yang\r\n\nOyster shell\t\t\tMu Li\r\n\nDragon bone\t\t\tLong Gu	Western Therapeutic Actions\r\n\nAstringent, tonic, and diuretic	Traditional Chinese Medicine\r\n\nStabilizes the kidneys, astringes the essence, and binds up the semen	Sample Indications\r\n\nIncontinence, premature ejaculation, neurasthenia &leftpar;mental and physical fatigue and depression&rightpar;, impotence, and myasthenia gravis &leftpar;chronic muscle weakness&rightpar;	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nContraindicated in cases of damp/heat in the lower burner &leftpar;bladder or vaginal infections&rightpar;.	Notations \r\n\nGolden Lock follows the pattern of Jin Suo Gu Jing Wan or Golden Lock Tea. This formula has a nurturing effect on the kidney essence. In Oriental Medicine, the kidneys &leftpar;yin/water and yang/fire&rightpar; store the essence &leftpar;sperm&rightpar; and control the bladder. If the kidneys are weakened from chronic stress or illness, poor nutrition or an excessive amount of fear, they loose the ability to function properly and spermatorrhea or incontinence can occur. \r\n\nThis type of disorder usually requires taking a herbal formula for a number of months so that the body is given the time it requires to rebuild and regenerate the damaged tissues or rectify the disharmony. It requires time to rebuild the essence, much the same as rebuilding the roots of an old oak tree. If the roots become damaged, it will take a minimum of one year for the roots of the mighty oak to regain their strength. Be patient and stay committed. Clear any excessive internal heat or purge the liver when taking this formula for long periods of time. \r\n\nAstragalus seed has a different function than Astragalus root. The seed fortifies the kidney fire &leftpar;yang&rightpar;. When the kidney yang is weak symptoms such as as lower back pain, impotence, frequent urination, vaginal discharge, or premature ejaculation are experienced. Astragalus seed is also used for improving the vision which is believed to be controlled by the health of the liver and kidneys. Cuscuta fortifies the kidney fire plus it augments the kidney water &leftpar;yin&rightpar;. Lotus seed, Euryales, Cornus, and Rose hip help to stabilize and bind the energy in the kidneys &leftpar;stops leakage&rightpar;. Schizandra strengthens the lungs and kidneys, prevents leakage and calms the spirit. Oyster shell and Dragon Bone calm the spirit and are astringents.	external
153	Woman's Twilight	Hormone Balancer, Hormone Replacement	28	Ingredients&leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nOats\t\t\t\tAvena Sativa\r\n\nCurculigo\t\t\tXian Mao\r\n\nEpimedium\t\t\tYin Yang Huo\t\r\n\nRehmannia, prep.\t\tShu Di Huang\r\n\nShatavari\t\t\tAsparagus racemosa\r\n\nMorinda\t\t\t\tBa Ji Tian\r\n\nTang Kuei\t\t\tDang Gui\r\n\nAnemarrhena\t\tZhi Mu\r\n\nPhellodendron\t\tHuang Bai \r\n\nMistletoe\t\t\tViscum Album\r\n\nChamomile, Roman\tAnthemis Nobilis\r\n\nUva Ursi\t\t\t\tArctostaphylos Uva Ursi\r\n\nBeth root\t\t\tTrillium Erectum\r\n\nBlack Cohosh\t\tCimicufuga Racemosa\r\n\nSarsaparilla\t\t\tSmilax Officinalis\r\n\nGoldenseal\t\t\tHydrastis Canadensis\r\n\nWild Yam\t\t\tDioscorea Villosa\r\n\nChaste Tree berry\t\tVitex Agnus Castus	Western Therapeutic Actions\r\n\nRestorative, nutritive, nerve tonic, nervine, diuretic, astringent, alterative, and antiseptic	Traditional Chinese Medicine\r\n\nNourishes the kidneys &leftpar;yin and yang&rightpar;, drains fire, nourishes the blood, and regulates the penetrating and conception channels or vessels	Sample Indications\r\n\nMenopausal symptoms which can include hot flashes, irritability, insomnia, palpitations, sweating, depression, dysmenorrhea, amenorrhea, hypertension, and frequent urination	Suggested Dosage\r\n\n1  2 teaspoons, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nThere are none known.	Notations\r\n\nWomans Twilight is a combination of the Western time proven specifics with the Chinese formula, Er Xian Tang or Two Immortals Decoction. In Oriental Medicine, menopause is affected by the penetrating and the conception channels, which have a direct impact on fertility, reproduction, and the menstrual cycle. \r\n\nCurculigo and Epimedium, kidney yang tonics, were considered by some as herbs for immortality. They are supported by the nervine and restorative herb, Wild Oats. Morinda and Sarsaparilla are kidney yang tonics. Rehmannia nourishes the blood, the kidney yin, and the essence. Shatavari is an excellent hormone balancer. Anemarrhena and Phellodendron drain the fire and alleviate hot flashes. Tang Kuei, helps to regulate these two channels, enhancing the blood, fertility, and reproduction. The three organs which benefit from Tang Kuei, a warming mother herb are: the heart &leftpar;home of the spirit&rightpar;, liver &leftpar;regulator of movement&rightpar;, and spleen &leftpar;directs transitions&rightpar;. Tang Kuei and its affect on the estrogen levels, in standard dosages, is unsubstantial. Mistletoe and Chamomile are relaxants. Uva Ursi, a diuretic, directs the herbs downward. Beth root is an astringent, arrests excessive bleeding, and strengthens the uterus. Black Cohosh alleviates hot flashes and is an astringent. Goldenseal, a cool bitter tonic, restores health to the mucous membranes. Wild Yam is an antispasmodic. Chaste Tree berry nourishes the kidneys, balances the hormones, and circulates the uterine qi.  \r\n\nHerbs used for hormonal balancing allow the body to establish its natural balance point. Aging depletes the essence, the fluids dry, and the fire wanes, the bones soften, our minds loose crispness, teeth fallout, sex becomes a foreign word, things sag, and the hair withers. Laugh a lot, enjoy being the elder.	external
154	Woman's Candida	Vaginal Discharge, Leucorreah	28	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nBurdock root\t\t\tArctium Lappa\r\n\nPhellodendron\t\tHuang Bai \r\n\nMarshmallow\t\t\tAlthea Officinalis\r\n\nWild Indigo\t\t\tBaptisia Tinctoria\r\n\nTang Kuei\t\t\tDang Gui\r\n\nAtractylodes\t\t\tBai Zhu\r\n\nCuttlebone\t\t\tHai Piao Xiao\r\n\nCuscuta\t\t\t\tTu Si Zi\r\n\nMeadowsweet\t\tFilipendula Ulmaria\r\n\nEchinacea\t\t\tEchinacea Angustifolia\r\n\nCalendula\t\t\tCalendula Officinalis\r\n\nPoke Root\t\t\tPhytolacca Spp.\r\n\nHoropito\t\t\tPseudowintera Colorata\r\n\nBlack Walnut\t\t\tJuglans Nigra\r\n\nGoldenseal\t\t\tHydrastis Canadensis	Western Therapeutic Actions\r\n\nAnti-fungal, astringent, antiseptic, alterative, demulcent, emollient, depurative, antacid, and detergent	Traditional Chinese Medicine\r\n\nDrains damp/heat, supports the spleen qi, nourishes the blood, and retains the essence	Sample Indications\r\n\nVaginal candidiasis &leftpar;thrush&rightpar;, leukorrhea, white vaginal discharge with irritation and itching, and bacterial or viral infections of the vagina	Suggested Dosage\r\n\n1  2 teaspoons, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nContraindicated during pregnancy.	Notations\r\n\nWomans Candida is a modified version of a relied upon Chinese patent formula called Chien Chin Chih Tai Wan or Thousand Pieces of Gold Stop Leukorrhea Pill. \r\n\nAn excellent anti-fungal herb used by the Maoris, Horopito, is included in Womans Candida. Externally or internally, Horopito is one of the premier anti-fungal herbs from around the world. Fungus thrives in a damp heat environment in the natural world and inside of us. In Oriental Medicine, dampness is resolved by using herbs to dry and strengthen the spleen. Excess heat is cleared by herbs that cool and drain the fire.\r\n\nBurdock root is a blood purifier and cleanses the body via the kidneys. Phellodendron drains damp/heat, particularly from the lower body, and is effective for yellow vaginal discharge. Atractylodes is specific for drying and strengthening the spleen. Tang Kuei is a blood tonic, and with Marshmallow and Calendula nourish, cleanses, and heal the skin tissues and is anti-fungal. Impurities in the blood are cleared by Wild Indigo, Echinacea, and Poke root. Cuscuta strengthens the kidney and secures the essence. Goldenseal is a detergent and tones the mucous membranes. The astringent properties of Cuttlebone and Meadowsweet bind and contract the tissues. Black Walnut is an alterative and detergent.	external
155	Women Only	Enhances Fertility	28	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nRaspberry leaf\t\tRubus Idaeus\r\n\nDamiana\t\t\t\tTurnera Diffusa\r\n\nTang Kuei\t\t\tDang Gui\r\n\nMorinda\t\t\t\tBa Ji Tian\r\n\nCistanche\t\t\tRou Cong Rong\r\n\nRehmannia, prep.\t\tShu Di Huang\r\n\nCornus\t\t\t\tShan Zhu Yu\r\n\nShatavari\t\t\tAsparagus racemosa\r\n\nMuira Puama\t\t\tLiriosma Ovata\r\n\nCurculigo\t\t\tXian Mao\r\n\nMotherwort\t\t\tLeonurus Cardiaca\r\n\nSarsaparilla\t\t\tSmilax Officinalis\r\n\nFalse Unicorn\t\tChamaelirium Luteum\r\n\nCinnamon twig\t\tGui Zhi	Western Therapeutic Actions\r\n\nRestorative, adaptogenic tonic, astringent, aphrodisiac, nerve tonic, and relaxant	Traditional Chinese Medicine\r\n\nWarms and harmonizes the penetrating and conception channels, dispels cold, fortifies the kidneys, nourishes the blood, and disperses blood stagnation	Sample Indications\r\n\nInfertility, mild or persistent uterine bleeding, irregular menstruation, pelvic inflammatory disease, menopause and dysmennorhea	Suggested Dosage\r\n\n1  2 teaspoons, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions Contraindicated in cases with yin deficiency &leftpar;dry mouth and throat, afternoon fever&rightpar; and abdominal masses due to blood stagnation from excess &leftpar;heat&rightpar;.	Notations\r\n\nIn Oriental Medicine, two primary issues are taken into consideration when fertility becomes the topic of discussion. They are the uterus, which requires warmth, and the second is the blood. The blood requires abundance, richness, and movement. With these qualities it is able to supply the uterus with a continual flow of fresh blood and qi. The warmth allows the blood and qi to flow freely, without obstruction. When the uterus becomes cold, stagnation manifests and hinders the movement of blood and qi. \r\n\nWomen Only is designed to warm the uterus and stimulate the flow of internal blood and qi. The Chinese herbs are a modified version of the formula called, Wen Jing Tang or Tang Kuei and Evodia Combination. \r\n\nThe Western herbs, Raspberry leaf and Damiana are used extensively in womens gynecology. Raspberry leaf is one of the few herbs that can be used during all stages of pregnancy. It enhances fertility, and stimulates milk production, making it a remarkable female tonic. Damiana is somewhat similar to the Chinese herb, Morinda. The former fortifies the kidney yang, enhances fertility, harmonizes the penetrating and conception vessels, strengthens the nerves, and calms the spirit. Rehmannia nourishes the blood, yin, and essence. Cornus retains the essence and is used to enhance the libido and fertility. Shatavari, the Ayurvedic female herb, balances the hormones. Muira Puama, Curculigo, Sarsaparilla, and False Unicorn bring warmth to the kidneys and circulate the blood and qi. Motherwort circulates the uterine qi and calms the spirit. Cinnamon twig is warming and opens the channels.	external
156	Heart Soulful Life	Heart Rebuilder	2	Ingredients  &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nOats\t\t\t      Avena Sativa\r\n\nTang Kuei\t\t      Dang Gui\r\n\nSalvia\t\t\t      Dan Shen\r\n\nHawthorn berry\t      Crataegus Spp.\r\n\nArjuna\t\t\t      Terminalia Arjuna\r\n\nMotherwort\t\t      Leonurus Cardiaca\r\n\nZizyphus\t\t      Suan Zao Ren\r\n\nPolygala\t\t\t      Yuan Zhi\r\n\nGinseng, Siberian\t      Ci Wu Jia\r\n\nHoelen\t\t\t      Fu Shen\r\n\nMistletoe\t\t      Viscum Album\r\n\nOphiopogon\t\t      Mai Men Dong\r\n\nDragon bone\t\t      Long Gu\r\n\nChamomile, Roman   Anthemis Nobilis\r\n\nLicorice\t\t\t      Gan Cao	Western Therapeutic Actions\r\n\nCardiac tonic, nerve restorative, nervine, and nutritive tonic	Traditional Chinese Medicine\r\n\nSupplements the heart qi, nourishes the heart blood, calms the spirit, nourishes the yin, and vitalizes the blood	Sample Indications\r\n\nPsychological\r\n\nLack of joy in life, lacks clarity, anxiety, inappropriate crying or laughing, forgetfulness, apprehension, easily frightened, and obsessive-compulsive disorders\r\n\n\tPhysical\r\n\nPalpitations, weakened heart, insomnia, restless sleep, and wake-up early	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nThere are none known. Consult a qualified health care practitioner for any extreme emotional disorders.	Notations \r\n\nHeart Soulful Life is patterned after a Chinese patent formula, Ding Zhi Wan or Settle the Emotion Pill and is supported by Western specifics. Psychological patterns and spiritual awareness plays a very important role in our well being. Because of their complexities and unique expressions, it is important to understand the many different elements &leftpar;such as fire, water, stagnation, wind, phlegm, excess or deficiency&rightpar; that can be contributing factors and treat them appropriately. The goal is to have harmony and balance with our emotions, in order for our wisdom and intelligence to be expressed here in this world. We have a natural yearning to be comfortable in our bodies.\r\n\nFrom the Oneida tradition, our spirit, called the sacred fire, resides within the heart; Oriental Medicine says that the heart is the ruler and master of all the organs, and governs all of our actions. When we do not feed the sacred fire &leftpar;nurture our heart&rightpar;, we lose our passion and gratitude for life. When we allow the emotions to control our actions, the heart can become obstructed; we lose clarity, thinking is muddled, and the inner wisdom and intelligence becomes lost in some dark forest. \r\n\nThe emotions; joy, worry, grief, fear, and anger, are passengers on the train of life. They come to us as experiences, coming and going as travelers. Whenever the heart longs to be nurtured back to health, address all of the emotions, and the organs and networks that they affect. This way the train can get back on track and head towards its destination - the journey towards the true self!	external
157	Kidney Long Life	Kidney Rebuilder	28	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nRehmannia, prep.\t\tShu Di Huang\r\n\nAshwaganda\t\t\tWithania Somnifera\r\n\nDioscorea\t\t\tShan Yao\r\n\nCornus\t\t\t\tShan Zhu Yu\r\n\nMorinda\t\t\t\tBa Ji Tian\r\n\nEucommia\t\t\tDu Zhong\r\n\nLycium fruit\t\t\tGou Qi Zi\r\n\nCuscuta\t\t\t\tTu Si Zi\r\n\nAchyranthes\t\t\tNiu Xi\r\n\nHoelen\t\t\t\tFu Ling\r\n\nMotherwort\t\t\tLeonurus Cardiaca\r\n\nDeer Antler\t\t\tLu Rong\r\n\nChamomile, Roman\tAnthemis Nobilis\r\n\nCinnamon bark\t\tRou Gui\r\n\nSaussurea\t\t\tMu Xiang	Western Therapeutic Actions\r\n\nRestorative tonic, nutritive tonic, cardiac tonic, and diuretic	Traditional Chinese Medicine\r\n\nFortifies the kidney yang, nourishes the kidney yin, and replenishes the essence	Sample Indications\r\n\nPsychological\r\n\nLacks motivation or courage, dominated by fear, finds it difficult to stand up for oneself, and burnt out from burning the candle on both ends\r\n\n\tPhysical\r\n\nWeakness or soreness in the lower body, impotence, infertility, incontinence or difficult urination, water retention in the lower body, coolness in the lower body, and tires easily when standing	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nContraindicated for cases with kidney yin deficiency &leftpar;dry mouth, red tongue, and hot palms and feet&rightpar;.	Notations\r\n\nKidney Long Life is patterned after the traditional Chinese formula, Jin Gui Shen Qi Wan or Rehmannia Eight Formula. The body has a seasonal clock just as we find in nature. In Oriental Medicine, there are the Five Seasons: Spring &leftpar;Liver&rightpar;, Summer &leftpar;Heart&rightpar;, Late Summer &leftpar;Spleen&rightpar;, Fall &leftpar;Lung&rightpar;, and Winter &leftpar;Kidney&rightpar;. Some say that Late Summer &leftpar;Spleen&rightpar; is not a season but resides in the center of this circular pattern of events.\r\n\nOne of the ways to optimize your health or practice preventative medicine, is to take an organ herbal tonic during the season you are currently in. Kidney Long Life can be used during the winter, as a tonic to nourish the kidneys. This formula warms and strengthens the lower part of the body and puts the desire and drive back into an empty cup.\r\n\nSomeone who burns the candle at both ends, will over-time, deplete the energy of their bodies, the kidneys, and their essence. The nervous system will become exhausted which can open the door for emotional problems. When spring arrives, if we did not allow ourselves to rest and replenish our qi, we might struggle and feel poorly instead of spading the spring garden! \r\n\nFrom the Sámi tradition, there is wisdom in the medicine of the Bear. Sleep in winter and when spring comes rolling around, get up and go find the honey! On a daily preventative level; slow it down, do not spend all that you have, and take a deep breath!	external
158	Liver New Life	Liver Rebuilder	28	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by common and pin yin or latin names, in sequence from largest to smallest amount by quantity.\r\n\nRehmannia, prepared\tShu Di Huang\r\n\nRehmannia, raw        \tSheng Di Huang\r\n\nSkullcap\t                 \tScutellaria Lateriflora\r\n\nBladderwrack\t         \tFucus Vesiculosus\r\n\nLycium fruit\t         \tGou Qi Zi\r\n\nGlehnia\t\t         \tSha Shen\r\n\nOphiopogon\t         \tMai Men Dong\r\n\nLigustrum\t                 \tNu Zhen Zi\r\n\nEclipta\t\t         \tHan Lian Cao\r\n\nSchizandra\t         \tWu Wei Zi\r\n\nTang Kuei\t                 \tDang Gui\r\n\nPeony\t\t         \tBai Shao Yao\r\n\nGardenia\t                 \tZhi Zi\r\n\nMoutan\t\t         \tMu Dan Pi\r\n\nChamomile, Roman\t        Anthemis Nobilis\r\n\nCyperus\t                 \tXiang Fu\r\n\nDamiana\t                \t        Turnera Diffusa\r\n\nRhubarb\t                 \tDa Huang\r\n\nWahoo\t\t         \tEuonymus Atropurpureus	Western Therapeutic Actions\r\n\nHepatic tonic, nervine, alterative, anti-fat, digestive tonic, and demulcent	Traditional Chinese Medicine\r\n\nNourishes the liver and kidney yin, disperses stagnant liver chi, clears heat, and cools the blood	Sample Indications\r\n\nPsychological\r\n\nTalks with a edge, irritable, anger, long-term frustration and stuck in a rut, bitter about life, and rigid\r\n\nPhysical\r\n\nDiscomfort or pain in the liver region &leftpar;hypochondrium&rightpar;, chest tightness or discomfort, chronic cirrhosis or hepatitis, fatty liver, wake-up between the hours of 1-3 AM, and elevated liver enzymes	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, 3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nContraindicated for damp/phlegm disorders &leftpar;coughing with copious white mucous, and swollen tongue with white, thick coating&rightpar;.	Notations\r\n\nLiver New Life, patterned after Yi Guan Jian, is an excellent tonic for patients who suffer from liver discomfort or ailments. When the liver suffers &leftpar;from viral infection, environmental contaminants, drug abuse, long term emotional distress, or poor nutritional habits&rightpar;, its natural ability to store the blood and move the chi becomes impaired. The liver also drains the chi, or moves the chi downward. When this function is weakened, then hypochondriac and chest pain is felt with belching or acid regurgitation. Heat, caused by trapped energy inside the liver, adversely affects the stomach and further injures the fluids in the body, creating a dry mouth and red tongue. Moutan and Gardenia were added to help drain some of the fire, cool the blood and emotionally, take the edge off of life. Liver/New Life moistens the dryness, enriches the blood, and relaxes the liver which enhances the normal movement and flow of chi.	external
159	Lung Flow of Life	Lung Rebuilder	28	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nGinseng, American\tXi Yang Shen\r\n\nRehmannia, raw\t\tSheng Di Huang\r\n\nPseudostellaria\t\tTai Zi Shen\r\n\nElecampane\t\t\tInula Helenium\r\n\nOphiopogon\t\t\tMai Men Dong\r\n\nGlehnia\t\t\t\tSha Shen\r\n\nPlatycodon\t\t\tJie Geng\r\n\nFritillaria\t\t\tChuan Bei Mu\r\n\nLungwort\t\t\tPulmonaria Officinalis\r\n\nLily\t\t\t\t\tBai He\r\n\nPolygonatum, sib.\tHuang Jing\r\n\nLicorice\t\t\t\tGan Cao\r\n\nGinkgo\t\t\t\tGinkgo Biloba\r\n\nPleurisy root\t\t\tAsclepias Tuberosa	Western Therapeutic Actions\r\n\nDemulcent, restorative, expectorant, mucilaginous, pectoral, and astringent	Traditional Chinese Medicine\r\n\nMoistens the lung, nourishes the lung yin, transforms phlegm, and stops coughing	Sample Indications\r\n\nPsychological\r\n\nGrief, suffering a loss, inability to grieve, holding on, withdrawn and burned out from giving\r\n\n\tPhysical\r\n\nDry chronic cough, cough with scanty mucous, wheezing, lung damage, dry sore throat and mouth, chronic sore throat, and laryngitis	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nContraindicated during the acute stages of any illness such as colds and influenzas &leftpar;external pathogenic influences&rightpar;. Use supportive herbs with patients who are spleen chi deficient &leftpar;weak appetite, bloating, loose stools&rightpar;.	Notations Lung Flow of Life is a modified version of a Chinese classic, Bai He Gu Jin Tang or Lily Combination. This formula addresses internal dryness of the stomach and lung characterized by the dry mouth and throat, hot feet and hands, tendency to constipation, night sweats, and thirst. In Oriental Medicine, a Sea of Qi accumulates in the chest. We breathe freely when our lungs maintain their moisture and are filled with vitality &leftpar;qi&rightpar;. There are many causes which can create this internal dryness of the lungs; environmental, febrile disease, smoking, deep emotional grief from loss or the inability to grieve &leftpar;holding on&rightpar;, always extending without replenishing, and chronic internal illness. \r\n\nThe breath; rhythmic, with an inhale, a pause, and an exhale, serves as a model on how to live in life. Generous giving and extending a helpful hand is the breath out, the exhale. The pause, the still moment, is the transformation of the formless into form. The breath in, the inhale, is the humble expression of receiving. People who have a difficult time slowing down and taking some time off to smell the roses would benefit from this wonderful soothing and moistening tonic. If a patient is suffering from an acute respiratory infection, viral or bacterial, consider a formula in the Cleansing section. *Ginger compresses are helpful for lung disorders.\r\n\n*Ginger Compress: See External Applications	external
160	Spleen Abundant Life	Spleen & Stomach Rebuilder	28	Ingredients&leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nAstragalus\t\t\t  Huang Qi\r\n\nAtractylodes\t\t\t  Bai Zhu\r\n\nHoelen\t\t\t\t  Fu Ling\r\n\nGinseng, Chinese\t\t  Ji Lin Ren Shen\r\n\nBayberry\t\t\t\t Myrica Cerifera\r\n\nDioscorea\t\t\t Shan Yao\r\n\nLotus seed\t\t\t Lian Zi\r\n\nGrindelia\t\t\t Grindelia Robusta\r\n\nCoix\t\t\t\t Yi Yi Ren\r\n\nDolichos\t\t\t\t Bai Bian Dou\r\n\nPlatycodon\t\t\t Jie Geng\r\n\nCitrus\t\t\t        Chen Pi\r\n\nLicorice, baked\t        Zhi Gan Cao \r\n\nGinger, dried\t\t        Gan Jiang	Western Therapeutic Actions\r\n\nRestorative, nutritive, tonic, and digestive stimulant	Traditional Chinese Medicine\r\n\nSupplements the spleen qi, eliminates dampness, and breaks up stagnant qi in the middle burner	Sample Indications\r\n\nPsychological\r\n\nLife feels bland, pensive, ruminates over the many possibilities, worry wart, and spaced out\r\n\n\tPhysical\r\n\nWeak appetite and digestion, gastritis, peptic ulcer, tendency to loose stool or diarrhea, distention, nausea, weak muscles and limbs, exhaustion upon exertion, and craves sweets	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindictions and Cautions\r\n\nUse with caution during pregnancy. This formula should not be used with high fever, heat with deficiency, thirst &leftpar;dryness&rightpar;, or constipation.	Notations\r\n\nIn the African medicine wheel of the Dagara tribe, the center represents Earth and the color is yellow. They teach that people who belong to the Earth Clan bring the gift of nurturing to this world. Likewise, in Oriental Medicine, they have the Five Phases, and some place the Earth element in its center; the color is yellow; represents the stomach, the sea of grain and water; and the spleen, which transforms the turbid into qi and blood. \r\n\nWhenever a patient is unable to care for themselves &leftpar;deficiency&rightpar;, or on the flip-side, is overly self concerned &leftpar;excess&rightpar;, the spleen and stomach require balancing. The Chinese formula, Liu Jun Zi Tang or Six Gentlemen Decoction, is the foundation for Spleen Abundant Life. The original formula is consistently used and modified. Shen Ling Bai Zhu San or Ginseng and Atractylodes Formula, is an example of the expansion of the original formula and is integrated into Spleen Abundant Life.\r\n\nThe dynamic laws of nature govern our internal natural world in a very poetic fashion. With the stomach and spleen energy network situated in the center of our being, we can see the importance of nutrition and to allow ourselves to be nurtured. Fire and water play an important role in the balancing of the Earth element. For example, if there is too much fire, the stomach will become scorched and the spleen too dry. Patients will hunger easily, or have dry lips and throat. If there is too much water, the spleen will get water logged and collapse. Patients will be phlegmatic, cold, with no desire to drink. Spleen Abundant Life creates a strong center and promotes vitality.	external
162	Enhance	Heals Internal Tissue	28	Ingredients  &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nOats\t\t\tAvena Sativa\r\n\nPseudoginseng\tTien Qi\r\n\nDipsacus\t\tXu Duan\r\n\nDrynaria\t\t\tGu Sui Bu\r\n\nDragons Blood\tXue Jie\r\n\nCarthamus\t\tHong Hua\r\n\nEchinacea\t\tEchinacea Angustifolia\r\n\nMyrrh\t\t\tCommiphora Molmol\r\n\nFrankincense\t\tRu Xiang\r\n\nAstragalus\t\tHuang Qi\r\n\nTang Kuei\t\tDang Gui\r\n\nSkullcap\t\t\tScutellaria Lateriflora\r\n\nBurdock root\t\tArctium Lappa\r\n\nGentian\t\t\tGentiana Lutea\r\n\nGoldenseal\t\tHydrastis Canadensis\r\n\nWild Yam\t\tDioscorea Villosa	Western Therapeutic Actions\r\n\nNerve tonic, alterative, antiseptic, stimulant, nutritive tonic, and antispasmodic	Traditional Chinese Medicine\r\n\nNurtures and vitalizes the blood, disperses blood stasis, supplements the qi, promotes the movement of qi, reduces swelling, alleviates pain and bleeding	Sample Indications\r\n\nSurgery, wounds, broken bones, and traumatic injuries	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nContraindicated during pregnancy and in cases presenting yin deficiency with heat.	Notations \r\n\nEnhance is a trauma formula that does not have to be restricted to only postoperative situations. Swelling and pain that accompanies traumatic injuries or surgery indicates blood stagnation. Hemorrhaging is the result of damaged and broken blood vessels which creates swelling, black and blue bruises, and pain. Enhance follows the principles of a Chinese formula, Qi Li San or Musk and Catechu Formula, which helps to restore the normal flow of qi, blood, and lymphatic fluids; and rejuvenates the vital body functions following a trauma or injury.\r\n\nOats, a premier restorative, helps circulate the qi and relieve cramps or spasms. Astragalus and Tang Kuei combine synergistically to provide excellent qi and blood restoration. Dragons Blood, combines well with Myrrh and Frankincense, and helps to break up blood stasis and alleviate pain. Carthamus is also a blood vitalizer and is used to alleviate pain from wounds. Pseudoginseng arrests any hemorrhaging without causing any further blood stagnation. This herb is used alone for internal injuries because of its remarkable ability to arrest bleeding without causing blood stagnation. Goldenseal helps to prevent any infections. Burdock root, a blood purifier, helps to prevent any infection and assists in the healing process. Skullcap and Wild Yam are antispasmodics, which assist the muscles from tightening up following a trauma.\r\n\nThere are two excellent formulas that complement Enhance:\r\n\nComfort Remedy \r\n\n\trelieves inflammation and pain of the nerves and tissues following a trauma or injury. \r\n\nRadiance Remedy \r\n\n\tpromotes emotional balance and facilitates moving through transitions with ease.	external
164	Radiance Remedy	Trauma, Fear, Transitions	4	Ingredients &leftpar;Flower Essences&rightpar;\r\n\nStar of Bethlehem\r\n\nWalnut\r\n\nImpatiens\r\n\nMimulus\r\n\nMustard	Western Therapeutic Actions\r\n\nPromotes emotional balance and facilitates moving from one circumstance or situation into the next with more ease		Sample Indications\r\n\nPersonal transitions are being encountered with fear, depression, or impatience	Suggested Dosage\r\n\n5 drops, directly onto the tongue, 3 times daily, or more frequently if needed\r\n\nRadiance Remedy can be repeated every 30 minutes during times of stress.\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nContact a licensed psychiatrist if extreme emotional conditions persist.	Notations\r\n\nRadiance Remedy can be enhanced by using herbal formulas. In Oriental Medicine, the internal organs that support transitions are the spleen and stomach. When they are supplemented and strengthened, the digestive system is enhanced. This enhancement allows the individual to move from one circumstance and into another with greater ease. Oatmeal, a wonder food, brings nourishment to the nervous system and is an excellent spleen tonic.\r\n\n                                                                  Flower Essences\r\n\n                                                                       Key words\r\n\nStar of Bethlehem\r\n\n\tShock or trauma, mental or physical\r\n\nWalnut\r\n\n\tOversensitive to ideas and influences, the link-breaker\r\n\nImpatiens\r\n\n\tImpatience, irritable, extreme mental tension\r\n\nMimulus\r\n\n\tFear or anxiety of a known origin\r\n\nMustard\r\n\n\tDeep black depression, melancholy, gloom	external
165	Silk Pond Cream	Skin Scarring	15	Ingredients &leftpar;Herbal Extracts&rightpar;\r\n\nListed by common and pin yin or latin names, in sequence from largest to smallest amount by quantity.\r\n\nComfrey root\t\tSymphytum Officinale\r\n\nComfrey leaf\t\tSymphytum Officinale\r\n\nPlantain\t         \tPlantago Spp.\r\n\nCalendula\t         \tCalendula Officinalis\r\n\nGoldenseal\t\tHydrastis Canadensis\r\n\nTang Kuei\t         \tDang Gui\r\n\nAngelica dah.\t\tBai Zhi\r\n\nVitamin E oil\r\n\nBeeswax\r\n\nOlive oil	Western Therapeutic Action\r\n\nVulnerary, anti-inflammatory, antiseptic, and analgesic	Traditional Chinese Medicine\r\n\nCools the blood, creates new tissue, and invigorates the blood	Sample Indications\r\n\nTraumatized skin tissue, scars, abrasions, burns, cuts, and post-surgery	External Application\r\n\nMassage a small amount of cream onto the affected skin area, or apply onto a sterile gauze and tape to area. \r\n\n3 times daily\r\n\nAll wounds should be well cleansed before applying any salve. Burns and sun burn should be cooled with co	Contraindications and Cautions\r\n\nCare needs to be taken that the wound is not infected or septic &leftpar;filled with pus&rightpar; as Silk Pond Cream acts rapidly in closing wounds. If the gauze sticks to the wound, moisten with warm water before trying to remove.	Notations\r\n\nSilk Pond promotes regeneration of the damaged tissues and associated blood vessels and helps minimize scarring. Use with a complementary internal herbal remedy to faciiitate the healing process. Comfrey is recognized as the premier herb for promoting the healing of tissue, bones, and ligaments. Applying comfrey to a wound will leave the affected area scarless. Plantain is used for all topically tissue traumas. It not only supports the healing of tissues but serve as an antiseptic &leftpar;clears toxic heat&rightpar;. Calendula, also known as Marigold flower, is an excellent skin detoxicant and heals traumatized tissues and burns. Internally, it acts much the same as the Chinese Lonicera &leftpar;Jin Yin Hua&rightpar; and Forsythia &leftpar;Lian Qiao&rightpar;.	external
166	Alisma Waterflow	Diuretic Edema	28	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nAlisma\t\t\tZe Xie\r\n\nMarshmallow\t\tAlthea Officinalis\r\n\nHoelen\t\t\tFu Ling\r\n\nPolyporous\t\tZhu Ling\r\n\nAtractylodes\t\tBai Zhu\r\n\nSiler\t\t\t\tFang Feng\r\n\nAstragalus\t\tHuang Qi\r\n\nCinnamon twig  \tGui Zhi\r\n\nMorus bark\t\tSang Bai Pi\r\n\nAchyranthes\t\tNiu Xi\r\n\nHorsetail\t\tEquisetum Arvense\r\n\nCorn Silk\t\tYu Mi Xu\r\n\nJuniper berry\t\tJuniperus Communis\r\n\nGoldenrod\t\tSolidago Virgaurea\r\n\nCleavers\t\t\tGalium Aparine	Western Therapeutic Actions\r\n\nDiuretic, antiseptic, emollient, demulcent, relieves edema, and \r\n\nrestorative	Traditional Chinese Medicine\r\n\nPromotes urination, drains dampness, dispels wind/damp, warms the yang, and supports the spleen	Sample Indications\r\n\nFluid retention in the body tissues &leftpar;lower body&rightpar;, renal suppression, cystic catarrh, renal congestion and obstruction, enuresis, and the inability to urinate freely	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nContraindicated during pregnancy. For patients with spleen qi deficiency &leftpar;weak appetite, loose stool&rightpar;, this herbal formula should be used at a low dosage and for a shorter duration, or combine with supportive herbs.	Notations \r\n\nAlisma Waterflow is similar to Wu Ling San or Hoelen Five Formula, a Chinese diuretic and renal formula; Alisma Waterflow addresses edema, urinary difficulty and painful urinary dysfunction due to dampness &leftpar;spleen qi deficient&rightpar; and depleted kidney fire. Alisma Waterflow is a restorative to the urinary system, aids in the removal of catabolic wastes from the tissues, and helps in elimination via the renal system. It is effective for lower body edema. \r\n\nAlisma, Hoelen, and Polyporous have a synergistic affect and are the primary herbs for resolving edema and urinary difficulties. Cinnamon twig warms the kidneys and assists the bladder in draining the excess fluids. Atractylodes, Siler, and Astragalus have been added to nourish and protect the qi and the spleen from the draining aspect of the other herbs in this formula. Marshmallow root clears damp/heat, relieves irritation, and soothes the urinary tract. Achyranthes drains damp/heat and directs the energy downward. Morus bark, Horsetail, Corn Silk, and Juniper berry are natural diuretics and promote urination.\r\n\nDietary habits may be contributing to the cause of fluid retention. Excessive salt, sugars, sodas, and alcohol may add to the problem. Watermelon, shiitake mushrooms, and azuki beans are a excellent addition to the diet because they are excellent kidney tonics and natural diuretics. A hot *Ginger Compress applied to the kidney area is very beneficial in relaxing the kidney area and promoting the flow of fluids.\r\n\n*Ginger Compress: See External Applications	external
167	Blue Stone	Kidney Stones	28	Ingredients Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nMarshmallow\t\tAlthea Officinalis\r\n\nLysimachia\t\tJin Qian Cao\r\n\nLygodium spore\tHai Jin Sha\r\n\nGallus\t\t\tJi Nei Jin\r\n\nPyrrosia\t\t\tShi Wei\r\n\nDianthus\t\tQu Mai\r\n\nSkullcap\t\t\tScutellaria Lateriflora\r\n\nAbutilon\t\t\tDong Kui Zi\r\n\nAchyranthes\t\tNiu Xi\r\n\nParsley Piert\t\tAlchemilla Arvensis\r\n\nMeadowsweet\tFilipendula Ulmaria\r\n\nUva Ursi\t\t\tArctostaphylos Uva Ursi\r\n\nCorn Silk\t\tYu Mi Xu\r\n\nStone Root\t\tCollinsonia Canadensis\r\n\nHydrangea\t\tHydrangea Arborescens\r\n\nValerian\t\t\tValeriana Officinalis	Western Therapeutic Actions\r\n\nDemulcent, emollient, diuretic, nervine, anodyne, antispasmodic, and antilithic	Traditional Chinese Medicine\r\n\nClears damp/heat in the lower burner, promotes urination, and unblocks painful urinary dysfunction	Sample Indications\r\n\nKidney stones and gravel &leftpar;urinary tract calculi located in the kidney, bladder or ureter&rightpar;; urgent, burning, and painful urination, low back or flank pain, and pain in the kidney area	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nContraindicated during pregnancy. Advise the patient to avoid caffeine, alcohol, and hot spicy foods during renal dysfunction.	Notations \r\n\nBlue Stone gradually excoriates and dissolves the calculi, so they may be passed in the urine. It also acts as a prophylactic therapy to prevent the formation of new stones. The leading Chinese herbs used in this formula are based on a formula called San Jin Tang or Three Gold Decoction, and the supportive herbs help to facilitate the removal of the stones in as comfortable a manner as possible. \r\n\nParsley Piert, a Western herb, assists in the dissolving of the calculi and is an anodyne. Marshmallow root is a sweet demulcent, which means it moistens and relieves dryness making it an ideal herb for treating stones by soothing the membranes of the kidney ducts and the urethra. Lysimachia, Lygodium spore, and Gallus work synergistically to resolve all types of stone formations. Pyrrosia and Dianthus are beneficial herbs for renal disorders as they help to clear damp/heat from the urinary system while promoting urination. The Western herbs, Parsley Piert, Stone Root and Hydrangea, combine well with the above Chinese herbs in resolving kidney stones or gravel. Meadowsweet balances the pH of the body, assists in the dissolving the obstruction, relieves pain, and clears toxins. Abutilon, Uva Ursi, Corn Silk, and Horsetail unblock painful urinary channels and promote urination. Skullcap and Valerian are relaxants and antispasmodics. Achyranthes drains damp/heat and direct the actions of the other herbs downward.\r\n\nA *Ginger Compress, applied to the kidney area two times daily, enhances the circulation, eases the pain and discomfort, and stimulates the flow of urine.	external
168	Clear Waterflow	Bladder Infection	28	Ingredients&leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nMarshmallow\t\t\tAlthea Officinalis\r\n\nDianthus\t\t\tQu Mai\r\n\nPolygonum\t\t\tBian Xu\r\n\nPlantago seed\t\tChe Qian Zi\r\n\nLygodium spore\t\tHai Jin Sha\r\n\nEchinacea\t\t\tEchinacea Angustifolia\r\n\nAchyranthes\t\t\tNiu Xi\r\n\nCorn Silk \t\t\tYu Mi Xu\r\n\nUva Ursi\t\t\t\tArctostaphylos Uva Ursi\r\n\nPolyporous\t\t\tZhu Ling\r\n\nJuncus\t\t\t\tDeng Xin Cao\r\n\nMeadowsweet\t\tFilipendula Ulmaria\r\n\nMistletoe\t\t\tViscum Album\r\n\nGardenia\t\t\tZhi Zi\r\n\nBuchu\t\t\t\tBarosma Betulina	Western Therapeutic Actions\r\n\nDiuretic, antiseptic, demulcent, emollient, alterative, and \r\n\nrelaxant	Traditional Chinese Medicine\r\n\nClears heat from the lower burner, relieves toxicity, drains dampness, and unblocks painful urinary dysfunction	Sample Indications\r\n\nUrinary tract infections, irritable bladder, painful or difficult urination, cystitis, kidney infection, prostatitis, pelvic inflammatory disease &leftpar;PID&rightpar;, and renal obstructions &leftpar;kidney and bladder gravel or stones&rightpar;	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nContraindicated during pregnancy. Use with caution in patients who are yin deficient &leftpar;thirst, dryness, afternoon fever, hot palms and feet, night sweats&rightpar;.	Notations \r\n\nClearwater Flow is designed to gently stimulate renal excretions, disinfect the urinary tract, and soothe irritated urinary membranes. Clear Waterflow combines ancient Western renowned herbs with the Chinese classic, Ba Zheng San or Dianthus Formula in correcting this imbalance. \r\n\nMarshmallow, the leading herb in this formula, is a demulcent, rich in mucilage and cool in nature. It is used whenever the internal tissues require soothing and moistening. This sweet demulcent reduces inflammation and clear damp/heat syndromes from the bladder. Lygodium spore and Achyranthes  combine well together in draining damp/heat and removing obstructions from the urinary tract. Dianthus, Polygonum, Plantago seed, Uva Ursi, and Corn Silk promote urination and are used for all types of painful urinary dysfunction. Meadowsweet is an analgesic, rich in salicylic acid, commonly known as aspirin. Mistletoe is a nervine and antispasmodic. Gardenia clears heat and calms the spirit. Buchu is anti-inflammatory and a kidney and bladder tonic. Juncus clears heat and promotes urination.\r\n\nFood as Medicine:\r\n\nSoak 1/2 cup of barley in a quart of water overnight. Drink 1/2 cup of barley water 3 times a day. Azuki beans &leftpar;small red Japanese bean&rightpar; are an excellent dietary supplement for the kidneys and bladder. Mix 1/2 cup of azuki beans with 2 cups of rice. Add a pinch of salt and cook until the beans are tender. Eat a small bowl of beans and rice for dinner until the symptoms are alleviated or mix the beans and broth with some miso. \r\n\nBeware: Being chronically pissed off can inflame the bladder!	external
170	Hopeful Remedy	Depression	4	Ingredients &leftpar;Flower Essences&rightpar;\r\n\nClematis\r\n\nGorse\r\n\nMimulus\r\n\nMustard\r\n\nStar of Bethlehem	Western Therapeutic Actions\r\n\nHelps to heal an emotional state of hopelessness, and when the reason for trying further is considered futile		Sample Indications\r\n\nNegative emotions causing a sense of hopelessness, fear, depression, and inability to see a clear future	Suggested Dosage\r\n\n5 drops, directly onto the tongue, 3 times daily, or more frequently if needed\r\n\nHopeful Remedy can be repeated every 30 minutes during times of stress.\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nContact a licensed psychiatrist if extreme emotional conditions persist.	Notations\r\n\nLife reflects back to us our present state of awareness, nothing more and nothing less. Hope lives in the present moment. If we continually identify with the past, depression takes over. If we continually think about the future, anxiety and worry takes over. What a hopeless scenario. Enough of this nonsense. By practicing presence, hope will naturally flow out of you as a gift you give to others. It will come in small things. Maybe opening a door for someone, maybe a smile at the check out counter. Maybe a loaf of bread to that hungry beggar you see on the corner every morning. Hope is not something you receive, it is something you give away.\r\n\n                                                        Flower Essences\r\n\n                                                              Key words\r\n\nClematis\r\n\n\tIndifferent, dreaminess, lack of attention, unconscious\r\n\nGorse\r\n\n\tHopeless, despair\r\n\nMimulus\r\n\n\tFear of anxiety of a known origin\r\n\nMustard\r\n\n\tDeep, black depression; melancholy, gloom\r\n\nStar of Bethlehem\r\n\n\tShock or trauma, mental or physical	external
180	Bruise Cream	\N	15	Ingredients &leftpar;Herbal Extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nComfrey root\t\tSymphytum Officinale \r\n\nComfrey leaf\t\tSymphytum Officinale\r\n\nDragons Blood\t\tXue Jie\r\n\nMyrrh\t\t\tMo Yao\r\n\nFrankincense\t\tRu Xiang\r\n\nCarthamus\t\tHong Hua\r\n\nCalendula \t\tCalendula Officinalis \r\n\nBeeswax\r\n\nOlive oil	Western Therapeutic Actions\r\n\nVulnerary, anti-inflammatory, analgesic, demulcent, astringent, antiseptic, and anodyne	Traditional Chinese Medicine\r\n\nDisperses blood stasis, promotes the movement of chi, and alleviates pain	Sample Indications\r\n\nInjuries, bruises, sprains, contusions, strains, hematomas, and inflammations	External Application\r\n\nMassage a small amount of cream onto the affected skin area, or apply onto sterile gauze and tape to area, 3 times daily	Contraindications and Cautions\r\n\nThere are none known. Discontinue use if skin irritation appears.	Notations\r\n\nBruise Cream stimulates the regeneration of damaged tissues and their blood vessels, reduces swelling, and speeds up the recovery from injuries or wounds. \r\n\nComfrey promotes tissue, bone, and tendon repair. All tissue trauma will benefit from this herb. Dragons Blood stimulates blood circulation, generates flesh, reduces swelling, and stops bleeding. Myrrh and Frankincense invigorate the blood, reduce swelling, and alleviate pain, especially useful for traumatic pain. Carthamus vitalizes the blood and alleviates pain caused by wounds.\r\n\nIf bruises or black and blue spots occur for no apparent reason, it may be an indication of a deeper imbalance; seek the cause, it may be as simple as adding more vitamin C to your diet or supporting the chi of the spleen.	external
181	Earache Drops	\N	10	Ingredients &leftpar;Herbal oils and extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nMullein Oil\t\tVerbascum Thapsus\r\n\nCamphor\t         \tCinnamonum Camphor\r\n\nWormseed Oil\t\tChenopodium Ambrosiodes\r\n\nWintergreen Oil\t\tGaultheria Promcumbens\r\n\nBasil Oil\t         \tOcimum Basilicum\r\n\nSpearmint Oil\t\tMentha Spicata\r\n\nLeptotaenia Oil\t\tLomatium Dissecutim\r\n\nEchinacea\t         \tEchinacea Angustifolia\r\n\nGentiana\t         \tLong Dan Cao\r\n\nGoldenseal\t\tHydrastis Canadensis\r\n\nScute\t\t\tHuang Qin\r\n\nGardenia\t         \tZhi Zi\r\n\nSt. Johns Wort\t\tHypericum Perforatum\r\n\nPulsatilla\t         \tBai Tou Weng\r\n\nAsafoetida\t\tFerula Asafoetida\r\n\nAloe Vera\t\t\tLu Hui	Western Therapeutic Actions\r\n\nAnti-inflammatory, antipruritic, analgesic, anti-bacterial, anti-fungal, antiseptic, alterative, depurative, and emollient	Traditional Chinese Medicine\r\n\nClears toxic heat and resolves dampness	Sample Indications\r\n\nEar infections, ear congestion, ear inflammation, and otitis \r\n\nmedia	External Application\r\n\nMassage a small amount of oil around the external ear, 3 times daily\r\n\nPlace a few drops of oil onto a sterile cotton ball and place in the ear, 2 times daily	Contraindications and Cautions\r\n\nFor external use only. Ear pain might indicate a serious infection and could result in damaging the ear membrane or ear drum. If the condition persists, seek professional advise.	Notations\r\n\nEarache Drops loosens and clears wax build-up from the ear. The remedy is gently absorbed through the tissues of the ear. In cases of ear pain and infections, it is important to protect the ears, head, and neck from draughts and wind. \r\n\nMullein flower, the lead herb in this remedy, excels in the treatment of earaches with its astringent and pectoral qualities. In the summer, collect the yellow flowers just as they begin to open, or you can use the whole spike. Cover them immediately with olive oil and in three months you will have one of the best ear oils available. \r\n\nRemember to put down a small offering to the plant medicine before harvesting. Women, during their monthly cycle &leftpar;menstruating&rightpar;, should not do any harvesting because their energy is so powerful it will overtake the plants medicine. \r\n\nThe Mullein leaf is preferred when treating respiratory complaints.\r\n\nBreast-feeding is the best way to support the baby's immune system. If the baby is drinking cow milk, this might cause an excess of mucous and congestion in the ear canals. Organic cows milk has shown to be less mucous producing. Check to make sure the baby is not allergic to dairy products. Use soy or rice substitutes.\r\n\nA *Tofu Plaster placed on the forehead of the baby is an excellent home remedy for lowering fevers.\r\n\n*Tofu Plaster: See External Applications	external
182	GI Burn	\N	29	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nCoptis\t\t\tHuang Lian\r\n\nMeadowsweet\tFilipendula Ulmaria\r\n\nEvodia\t\t\tWu Zhu Yu\r\n\nMarshmallow\t\tAlthea Officinalis\r\n\nPeony\t\t\tBai Shao Yao\r\n\nScute\t\t\tHuang Qin\r\n\nPueraria\t\t\tGe Gen\r\n\nCuttlebone\t\tHai Piao Xiao\r\n\nAsafoetida\t\tFerula Asafoetida	Western Therapeutic Actions\r\n\nDemulcent, cooling digestive, emollient, antispasmodic, anti-nauseant, antacid, aromatic, and astringent	Traditional Chinese Medicine\r\n\nClears liver heat, drains fire, redirects rebellious qi downwards, and stops vomiting	Sample Indications\r\n\nAcid reflux, heart burn, esophageal reflux, gnawing hunger, acid regurgitation, vomiting, belching, bitter taste in the mouth, and peptic ulcers	Suggested Dosage\r\n\n10 - 30 drops, in a small amount of water, \r\n\n3 times daily\r\n\nTake this formula after each meal for digestive support. Discontinue use once the digestive system has returned to normal.\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nContraindicated in cases with acid regurgitation from stomach cold with deficiency &leftpar;weak appetite, stomach likes warm objects placed on it, like a hot water bottle&rightpar;.	Notations\r\n\nThis simple formula is very effective and quick acting, perfect for those who love that hot spicy food but do not have the stomach for it! GI Burn is patterned after the Chinese formula, Zuo Jin Wan, or Left Metal Pill.\r\n\nIn Oriental Medicine, the tongue, in cases of excess heat, will be red with a yellow coating, and the pulse will be wiry and rapid. When the liver creates excess heat, the heat invades the stomach and moves upwards, into the heart. The stomach, unable to handle all this heat &leftpar;too much heat in the kitchen&rightpar; turns the excess fire into a rebellion, or rebellious qi &leftpar;acid reflux, heartburn&rightpar;. The normal flow of the energy of the stomach is downward, but during a rebellion it goes in the opposite direction, and blows the roof off of the kitchen. \r\n\nCoptis is known for its ability to drain excess heat or fire, stabilizes the function of the stomach and calms the heart. The Oriental Five Phases Theory is applied in this formula. It states that in cases of excess, then drain the child. Coptis drains the excess heat from the heart, it being the child of the liver according to the Five Phases Theory. Evodia helps to redirect the rebellious qi downwards and direct the fire downwards. These two herbs work wonderfully together in dealing with heart burn. Meadowsweet, Cuttlebone, and Pueraria balance the pH of the body and alleviate acid conditions. Marshmallow is a soothing demulcent and alleviates inflammation of the digestive membranes. Peony is cooling and softens the liver. Scute supports Coptis and clears liver heat. Asafoetida is an Ayurvedic herb that is excellent for hiatal hernia and acid reflux while promoting a healthy digestive system.	internal
183	Herpe X	\N	28	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nRehmannia, raw\t\tSheng Di Huang\r\n\nScute\t\t\t\tHuang Qin\r\n\nPlantago seed\t\tChe Qian Zi\r\n\nCoptis\t\t\t\tHuang Lian\r\n\nSarsaparilla\t\t\tSmilax Officinalis\r\n\nEchinacea\t\t\tEchinacea Angustifolia\r\n\nGentiana, scabra\t\tLong Dan Cao\r\n\nPhellodendron\t\tHuang Bai \r\n\nTang Kuei\t\t\tDang Gui\r\n\nPoke Root\t\t\tPhytolacca Spp.\r\n\nCoix\t\t\t\tYi Yi Ren\r\n\nGardenia\t\t\tZhi Zi\r\n\nLicorice\t\t\t\tGan Cao\r\n\nSt. Johns Wort\t\tHypericum Perforatum\r\n\nCardamon\t\t\tSha Ren	Western Therapeutic Actions\r\n\nAntipyretic, anti-inflammatory, hepatic, analgesic, anti-viral, alterative, and depurative	Traditional Chinese Medicine\r\n\nDrains excess fire from the liver and gallbladder, and drains damp/heat from the lower burner	Sample Indications\r\n\nHerpes zoster, herpes simplex, pelvic inflammatory disease, acute glaucoma, corneal ulcers, conjunctivitis, intercostal neuralgia, migraine headaches, and leukorrhea	Suggested Dosage\r\n\n1/2  1 teaspoon, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nHerpe X can injure the spleen. Short term use is recommended. Support the spleen qi with herbal formulas following the course of this treatment if necessary.	Notations \r\n\nHerpe X can treat a wide range of disorders, as can many of the liver formulas. It is important to distinguish between them. Herpe X addresses excess liver heat. According to Oriental Medicine, look for these indications: wiry, rapid, forceful pulse; red tongue &leftpar;with yellow coating&rightpar; or small red like dots on the side edges of the tongue; and dark urine or painful urination. These are all markers that will distinguish it from the other liver formulas. \r\n\nThe eye is the sensory organ for the liver. When the liver is inflamed, it is revealed in the eyes. Long Dan Xie Gan Tang or Gentian Combination, the Chinese formula that creates the foundation for Herpe X, is used for inflammatory eye disorders. \r\n\nGentiana, with its cold and bitter qualities, drains excess heat from the liver and gall bladder. Scute, Coptis, and Phellodendron clear heat and drain dampness in support of Gentiana. Plantago seed drains damp/heat, especially from the lower body. Sarsaparilla has the ability to clear toxicity and enhance the immune system. Echinacea is used for sores, boils, pus, and tissue trauma. Rehmannia clears heat and cools the blood. Poke root is a detoxicant for the lymphatic system. Coix drains damp/heat, clears heat, and expels pus. Gardenia cools the blood and drains damp/heat. Tang Kuei, Licorice, and Cardamon help to protect the body from the strong purging and heat clearing actions.\r\n\nHerpe X can be taken at the higher dosage for a short duration of time, then reduced to the lower dosage. If the condition being treated is chronic, take a milder formula for an extended amount of time &leftpar;2-3 months&rightpar;, such as VBX.	internal
184	Happy Thoughts	\N	28	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nAlbizzia, bark\t    He Huan Pi\r\n\nAlbizzia, flower\t    He Huan Hua\r\n\nOphiopogon\t\t    Mai Men Dong\r\n\nAsparagus\t\t    Tian Men Dong\r\n\nSalvia\t\t\t    Dan Shen\r\n\nPolygala\t\t\t    Yuan Shi\r\n\nHoelen\t\t\t    Fu Shen\r\n\nOyster Shell\t\t    Mu Li\r\n\nDragon Bone\t\t    Long Gu\r\n\nAnemarrhena\t    Zhi Mu\r\n\nValerian\t\t\t    Valeriana Officinalis\r\n\nMotherwort\t\tLeonurus Cardiaca\r\n\nCurcuma\t\tYu Jin\r\n\nAcorus\t\t\tShi Chang Pu	Western Therapeutic Actions\r\n\nSedative, nervine, demulcent, nutritive, and antispasmodic	Traditional Chinese Medicine\r\n\nSedates the heart, eliminates phlegm, nourishes the yin, and calms the spirit	Sample Indications\r\n\n\tPsychological\r\n\nChronic anxiety with worry, restlessness with irritability, manic/depressive, shouting and yelling at people, and explosive \r\n\nbehavior\r\n\n\tPhysical\r\n\nDisturbed sleep, dry mouth, constant moving of the limbs, severe or throbbing headaches, and fidgety	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms\r\n\nü	Contraindications and Cautions\r\n\nHappy Thoughts is suited for a patient who has a red tongue with yellow coating &leftpar;excess&rightpar;. The pulse will tend to be rapid and wiry. Contraindicated in cases with a pale, swollen tongue and slow, faint pulse &leftpar;deficient&rightpar;. It is important to be able to distinguish between these two patterns.	Notations \r\n\nHappy Thoughts fits someone, who has over a period of time, kept their anxiety and worry to themselves. In Oriental Medicine, pent up emotions constrain the liver and deplete the qi of the spleen. With a weakened spleen, fluids transform into phlegm. Congealed phlegm eventually turns into heat. The excess liver erupts and releases the hot phlegm. As heat rises, the hot phlegm clogs the orifices of the heart. When the heart channels are not clear, the spirit is not at ease, and emotional instability takes place. \r\n\nHappy Thoughts resolves this conflict by clearing out the hot phlegm of the the heart channels, which calms the spirit. The elimination of phlegm, allows the spleen to transform the fluids more efficiently and prevent phlegm accumulation. Based on Sheng Tie Luo Yin or Iron Fillings Decoction, this formula will help the patient regain some composure and stability. \r\n\nThis imbalance can reoccur if the patient does not take charge of their emotions and find the courage to be able to express themselves. Many times we will not want to share some deep feelings because we are not willing to bear the consequences that they might bring. As long as we maintain this attitude, it is difficult to experience our free flowing energy and be open to the all of life.\r\n\nHappy Thoughts works well for patients who have difficulty tolerating herbal formulas that open or release the liver.ü	internal
185	HIV Support	\N	30	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nAstragalus\t\t\tHuang Qi\r\n\nOats\t\t\t\tAvena Sativa\r\n\nLigustrum\t\t\tNu Zhen Zi \r\n\nBurdock root\t\t\tArctium Lappa\r\n\nSaw Palmetto\t\t\tSerenoa Serrulata\r\n\nSkullcap\t\t\t\tScutellaria Lateriflora\r\n\nMeadowsweet\t\tFilipendula Ulmaria\r\n\nDeer Antler\t\t\tLu Rong\r\n\nIsatis leaf\t\t\tDa Qing Ye\r\n\nKohe Kohe\t\t\tDysoxylum Spectabile\r\n\nSarsaparilla\t\t\tSmilax Officinalis\r\n\nRed Clover\t\t\tTrifolium Pratense\r\n\nSalvia\t\t\t\tDan Shen\r\n\nGinseng, Chinese\t\tJi Lin Ren Shen\r\n\nLycium fruit\t\t\tGou Qi Zi\r\n\nJaborandi\t\t\tPilocarpus Spp.\r\n\nPoke root\t\t\tPhytolacca Spp.\r\n\nGoldenseal\t\t\tHydrastis Canadensis\r\n\nGinger, fresh\t\t\tSheng Jiang	Western Therapeutic Actions\r\n\nRestorative, nutritive, alterative, depurative, anti-viral, astringent, and antiseptic	Traditional Chinese Medicine\r\n\nSupplements the qi and replenishes the essence, vitalizes the blood, and clears heat, and relieves toxicity	Sample Indications\r\n\nHIV &leftpar;human immunodeficiency virus&rightpar;, ARC &leftpar;AIDS related complex&rightpar;, AIDS &leftpar;acquired immune deficiency syndrome&rightpar;, and autoimmune disorders	Suggested Dosage\r\n\n1  2 teaspoons, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nAddress the individual imbalances and use additional herbal formulas that are called for. Each individual shows unique strengths and weaknesses and may require custom made formulations. The dosages may have to be increased depending on the degree of deficiency or excess.	Notations \r\n\nHIV Support is designed similarly to the C Clear formula. It follows the Chinese medical herbal strategy developed during the 1960s, called Fu Zheng Pei Ben, "support the normal and strengthen the root". The concept of support the normal means to rectify any depletion of the bodys energy, fluids, and blood. Strengthen the root means to restore, augment, and nourish the yin and yang, and includes the essence. Using herbs that strengthen the root augment the immune system.\r\n\nSubhuti Dharmananda and Reece Smith were two of the first Western trained Chinese herbalists that addressed this disorder using herbs. Subhuti Dharmananda, through his company, Seven Forests, has developed many brilliant Chinese herbal formulas that address the imbalances found in patients who have acquired the syndrome called AIDS. Once this disorder was discovered to be transmitted by a virus, herbal formulations emerged to deal with the deeper complexity of this imbalance.\r\n\nAIDS is much like a febrile disease accompanied by an extreme depletion of the body. HIV SUPPORT is a restorative to the immune system, purifies the blood, and invigorates the circulation. Resolving stagnation is important because this allows for deeper cleansing actions. Additional yin and yang tonics may be required to accompany HIV SUPPORT. Modern drugs, such as AZT, are toxic, very debilitating to the immune system, and disrupt the normal functioning of the body. This makes herbal formulas critical to support the normal and strengthen the root.	internal
186	Little Belly	\N	28	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nRaspberry leaf\t\tRubus Idaeus\r\n\nCodonopsis\t\t\tDang Shen\r\n\nMotherwort\t\t\tLeonurus Cardiaca\r\n\nNettles\t\t\t\tUrtica Spp.\r\n\nChamomile, Roman\tAnthemis Nobilis\r\n\nGinger, dried\t\t        Gan Jiang\r\n\nCitrus\t\t\t        Chen Pi\r\n\nBlack Haw\t\t        Viburnum Prunifolium\r\n\nGentian\t\t\t        Gentiana Lutea\r\n\nAgastache\t\t        Huo Xiang\r\n\nCardamon\t\t        Sha Ren	Western Therapeutic Actions\r\n\nNervine, nutritive tonic, astringent, restorative, and antispasmodic	Traditional Chinese Medicine\r\n\nWarms the stomach and middle burner, directs rebellious stomach qi downwards, and stops vomiting	Sample Indications\r\n\nMorning sickness, nausea or vomiting during early pregnancy, \r\n\na mild acting tonic with nutritive qualities specifically for the first trimester of pregnancy	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, \r\n\n3 times daily. \r\n\nTake during the first and second trimester of pregnancy\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nBleeding and spotting during pregnancy can be life threatening. If any health problems persist, seek the advice of a qualified health care practitioner.	Notations \r\n\nLittle Belly is made upon request, to limit alcohol content. This formula is a mild tonic supporting the first trimester of a pregnancy. \r\n\nThe combination of Pinellia, Codonopsis, Ginger, and Citrus warm the stomach, resolve dampness, and alleviate morning sickness. Raspberry leaf is an astringent and uterine and reproductive restorative. It is one of the few botanicals that can be used during the entire length of a pregnancy. The two herbs, Raspberry leaf and Black Haw, work together to help prevent miscarriages. Motherwort is an anti-spasmodic and nervine. It has a calming effect on the spirit, similar to Roman Chamomile. Nettles is a blood tonic and supports the nutritive Chinese herbs in this formula. Codonopsis strengthens the spleen and along with Ginger and Citrus help to alleviate nausea and calm the stomach. Cardamon and Agastache harmonize the middle burner and alleviate nausea and vomiting. Gentian is a bitter tonic and supports the blood and help to alleviate fatigue.	internal
189	Pure Vision	\N	28	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nBilberry\t\t\t\tVaccinium Myrtillus\r\n\nLycium fruit\t\t\tGou Qi Zi \r\n\nChrysanthemum\t\tJu Hua\r\n\nBuddleia\t\t\t\tMi Meng Hua\r\n\nRehmannia, prep.\t\tShu Di Huang\r\n\nCornus\t\t\t\tShan Zhu Yu \r\n\nDioscorea\t\t\tShan Yao\r\n\nTribulus\t\t\t\tBai Ji Li\r\n\nHaliotis\t\t\t\tShi Jue Ming\r\n\nTang Kuei\t\t\tDang Gui\r\n\nEyebright\t\t\tEuphrasia Officinalis\r\n\nVitex\t\t\t\tMan Jing Zi\r\n\nCuscuta\t\t\t\tTu Si Zi\r\n\nCassia Seed\t\t\tJue Ming Zi	Western Therapeutic Actions\r\n\nDemulcent, restorative, hepatic and renal nutritive, hemogenic, alterative, and emollient	Traditional Chinese Medicine\r\n\nDispels wind/heat, nourishes the liver and kidney yin, nourishes the blood, and anchors the yang	Sample Indications \r\n\nPoor vision due to aging, reduced vision acuity, blurred vision, corneal ulcers, glaucoma, myopia, night blindness, and cataracts	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nAvoid eating turnips when taking this formula.	Notations \r\n\nThis Oriental Medicine approach for the treatment of eye disorders involves replenishment of a yin deficiency. Pure Vision will cool, moisten, and soothe the body, calm or relax a restless person, and promote the healing of the eyes, the skin, and other organs. The yin is considered to affect the soft muscles and tissues. The aging process naturally depletes the yin of the body. Pure Vision is a modified version of the ancient Chinese classic formula, Liu Wei Di Huang or Rehmannia Six Formula and a subsequent formula, called Ming Mu Di Huang or Rehmannia Tea. \r\n\nDue to the aging process, or when the heat from an imbalanced liver rises and dries the upper part of the body, especially the eyes, moistening formulas help rectify the imbalance. Chrysanthemum, Lycium fruit, Eyebright, and Cassia seed soothe the liver, improve the vision, and brighten the eyes. Bilberry is an antioxidant and strengthens the capillaries surrounding the retina. Buddleia and Cuscuta combine well for restoring visual acuity. Rehmannia, Cornus, and Dioscorea, taken from the classic Chinese formula, Liu Wei Di Huang, nourish the kidney yin and the liver yin &leftpar;yin meaning moisture or fluids&rightpar;. Haliotis and Tribulus settle the raising yang &leftpar;fire&rightpar; which allows it to be more anchored in its rightful place, the kidneys. They also clear heat &leftpar;dryness and redness&rightpar; from the eyes, and are used to benefit the vision. Tang Kuei nourishes the blood. Vitex disperses wind/heat and clears the eyes. \r\n\n*Facial Diagnosis &leftpar;Oriental Medicine&rightpar;\r\n\nLiver / Gallbladder\t\tEyes / Space between the eye brows\r\n\nHeart / Small Intestine\tNose and Tongue\r\n\nSpleen / Stomach\t\t\tMouth / Lips\r\n\nLungs / Large Intestine\tCheeks / Forehead\r\n\nKidneys / Bladder\t\t\tEars / Skin below the eye\r\n\n*See page 20 for an overview of Facial Diagnosis	internal
192	Woman's Douche	\N	8	\N	\N	\N	\N	\N	\N	\N	external
193	Up Chuck	\N	29	Ingredients \r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nIpecacuanha\t\tCephaelis Ipecacuanha	Western Therapeutic Actions\r\n\nEmetic &leftpar;when used in sufficient dosage&rightpar;, expectorant, and \r\n\nspecific		Sample Indications \r\n\nUse only when there is a need to induce vomiting, or experiencing persistent nausea that is not relieved by vomiting, and sudden onset of asthma and cough with the inability to bring up any mucous	Suggested Dosage\r\n\n1 teaspoon to induce vomiting\r\n\n5 drops, 3 times daily for gasping cough and unable to bring up any mucous\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nThis remedy is for emergency situations only. Seek medical advise for all types of ingested poisoning and asthmatic conditions. Contraindicated during pregnancy.	Notations \r\n\nTo induce vomiting, it is necessary to use larger dosages of Up Chuck to be effective. Ipecacuanha or Ipecac &leftpar;Ipecac Root&rightpar; is helpful as an emetic and for persistent nausea that is not relieved by vomiting. There will be profuse clear salivation or vomiting of sticky white mucous. \r\n\nWhen used as an expectorant, the asthma or cough will come on suddenly and the chest will feel constricted as if someone was sitting on the chest. The need to sit up to breathe will be present and a violent gasping with every breath.	internal
194	Wrist Elbow Pain	\N	28	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nCorydalis\t\t\tYan Hu Suo\r\n\nBoswellia\t\t\tBoswellia Serrata\r\n\nTurmeric\t\t\tCurcuma Longa\r\n\nPueraria\t\t\t\tGe Gen\r\n\nArisaema\t\t\tTian Nan Xing\r\n\nGastrodia\t\t\tTian Ma\r\n\nGentiana, macro.\t\tQin Jiao\r\n\nClematis\t\t\t\tWei Ling Xian\r\n\nChiang Huo\t\t\tQiang Huo\r\n\nPinellia\t\t\t\tBan Xia\r\n\nHoelen\t\t\t\tFu Ling\r\n\nCinnamon twig\t\tGui Zhi\r\n\nCitrus\t\t\t\tChen Pi\r\n\nGinger, fresh\t\t\tSheng Jiang	Western Therapeutic Actions\r\n\nAnodyne, anti-inflammatory, analgesic, nutritive, and antispasmodic	Traditional Chinese Medicine\r\n\nDispels wind/damp, transforms phlegm, dries dampness, unblocks the channels, alleviates pain, and supports the spleen	Sample Indications\r\n\nCarpal tunnel syndrome, forearm neuralgia, bursitis, and lymphedema	Suggested Dosage\r\n\n1/2 - 1 teaspoon, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nContraindicated during pregnancy.	Notations \r\n\nWrist Elbow Pain is a modified version of a Japanese formula developed by Dr. Otsuka Keisetsu called Er Zhu Tang, or Atractylodes and Arisaema Combination. According to Oriental Medicine, this formula addresses damp/phlegm accumulation in the energy channels. Phlegm obstructs the movement of qi. When the qi stagnates, circulation is impaired. This creates muscular tension and spasms which can inflame the nerves and cause other inflammatory conditions. The pain experienced is the result of the muscular tension squeezing the nerve. \r\n\nCorydalis is a strong anodyne and activates circulation. Boswellia, Chinese Frankincense, supports Corydalis. It a very useful Ayurvedic herb for all types of arthritis, bursitis, and other chronic inflammatory disorders. Turmeric, Chinese Jiang Huang, resolves congealed phlegm conditions, particularly in the shoulder region. Pueraria is an anti-inflammatory and helps muscles to soften and relax. Arisaema &leftpar;treated&rightpar; has strong phlegm resolving qualities. Gastrodia expels wind, alleviates pain, relieves spasms, and controls tremors. Gentiana, macro., Clematis, and Chiang Huo dispel wind/damp, alleviate obstructions and pain, particularly in the upper body. Pinellia combines with Hoelen, Citrus, and Ginger in resolving phlegm and strengthening the spleen. Cinnamon twig warms and opens the channels.\r\n\nThe computer and the pesky little mouse is one of the main culprits in this repetitive stress disorder. Technology has its place in our society but not to the point of disability. Egronomics, fitting the workplace for the worker, is something to consider if someone spends a lot of time at the computer.\r\n\nSee Muscular & Skeletal External Formulas for additional support	internal
208	Skin Boils	\N	13	\N	\N	\N	\N	\N	\N	\N	internal
211	Eve's Delight	\N	28	Ingredients &leftpar;Herbal extracts&rightpar;\r\n\nListed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.\r\n\nDamiana\t\t\t\tTurnera Diffusa\r\n\nMarshmallow\t\t\tAlthea Officinalis\r\n\nMuira Puama\t\t\tLiriosma Ovata\r\n\nRaspberry leaf\t\tRubus Idaeus\r\n\nMorinda\t\t\t\tBa Ji Tian\r\n\nCistanche\t\t\tRou Cong Rong\r\n\nTang Kuei\t\t\tDang Gui \r\n\nRehmannia, prep.\t\tShu Di Huang\r\n\nShatavari\t\t\tAsparagus racemosa\r\n\nCornus\t\t\t\tShan Zhu Yu\r\n\nFalse Unicorn\t\tChamaelirium Luteum\r\n\nDioscorea\t\t\tShan Yao\r\n\nLicorice, baked\t\tZhi Gan Cao	Western Therapeutic Actions\r\n\nRestorative, adaptogenic tonic, aphrodisiac, nerve tonic, demulcent, and emollient	Traditional Chinese Medicine\r\n\nNourishes the yin, nourishes the blood, fortifies the kidneys, supports the spleen, and directs the qi downward	Sample Indications\r\n\nSexual exhaustion, debility, lack of libido, and weak lower back	Suggested Dosage\r\n\n1  2 teaspoons, in a small amount of water, \r\n\n3 times daily\r\n\nVariation is according to individual symptoms	Contraindications and Cautions\r\n\nContraindicated during pregnancy. Discontinue the use of this formula during the menstrual cycle.	Notations \r\n\nIn Oriental Medicine, as a woman ages, the water aspect of the kidney &leftpar;yin&rightpar; diminishes. With the loss of yin energy &leftpar;feminine&rightpar; in the kidney, the libido goes down the tank. Eves Delight reinforces the kidney yin and yang energy. The yang energy puts some fire back into the tank. Eves Delight also addresses the bodys exhaustion from an overactive sexual life. The Chinese herbs used here are patterned after an old classic, Zuo Gui Yin, or Restore the Left &leftpar;Kidney&rightpar; Decoction. The ancient Chinese classics considered the left kidney housing the True Yin and the right kidney housing the Gate of Vitality. Whenever herbs nourish and fortify the kidneys, the sexual functions and libido are enhanced. \r\n\nDamiana enhances the reproductive qi, fortifies the kidney yang, and has hormone-regulating qualities. It is an excellent nerve tonic and helps lift the spirits. Marshmallow enriches the kidney yin and helps generate fluids. Tang Kuei builds the blood and enhances circulation. Muira Puama is an aphrodisiac and with Rehmannia, strengthens the kidneys. Raspberry leaf is a premier uterine tonic. False Unicorn is a female reproductive restorative. Cistanche and Morinda are added to replenish the kidney yang and rekindle the fire. Cornus, a liver and kidney tonic, is used as a sexual stimulant and known to benefit the skin. Dioscorea and Licorice support the spleen qi. Shatavari is the premier female tonic in Ayurvedic medicine as it nourishes the hormones and the kidney yin. \r\n\nIt is important to remember that the most frequent cause of lost libido is stress and a failing relationship. \r\n\nFor those skeptics, oysters and shrimp are strong aphrodisiacs because of their ability to enrich the kidneys. Try some and see!	internal
\.


--
-- Name: products_local_productID_seq; Type: SEQUENCE SET; Schema: public; Owner: app
--

SELECT pg_catalog.setval('"products_local_productID_seq"', 211, true);


--
-- Data for Name: retail_size_price; Type: TABLE DATA; Schema: public; Owner: app
--

COPY retail_size_price (product_category_id, size, price) FROM stdin;
1	2 oz	8.9500
8	1 oz	7.7500
6	1 oz	7.7500
3	2.5 oz	11.7500
2	1 oz	10.7000
4	1 oz	8.9500
3	.75 oz	7.7500
9	2.5 oz	11.7500
2	4 oz	21.5000
2	8 oz	41.3000
5	1 oz	7.7500
7	1 oz	7.7500
10	1 oz	7.7500
11	1 oz	7.7500
12	1 oz	10.7000
12	4 oz	21.5000
13	4 oz	21.5000
14	8 oz	11.9500
15	1 oz	7.7500
16	1 oz	7.7500
17	8 oz	11.9500
18	4 oz	10.7000
19	4 oz	7.1000
20	12 oz	10.7000
21	2 oz	8.5500
8	8 oz	11.7500
27	4 oz	10.7500
12	8 oz	41.3000
9	.75 oz	7.7500
28	4 oz	21.5000
29	1 oz	10.7000
30	8 oz	41.3000
32	2.5 oz	11.7500
31	2.5 oz	11.7500
33	.75 oz	7.7500
34	.75 oz	7.7500
36	4 oz	10.7500
35	2 oz	8.9500
37	1 oz	7.7500
38	1 oz	7.7500
39	2 oz	8.9500
\.


--
-- Data for Name: sample_indications; Type: TABLE DATA; Schema: public; Owner: app
--

COPY sample_indications (id, name) FROM stdin;
1	Abrasions
2	Abscess
3	Accidents
4	Acidity
5	Acne
6	Addictions
7	Adrenal Glands
8	AIDS / HIV
9	Allergies
10	Alzheimers
11	Amenorrhea
12	Antiseptic
13	Anxiety
15	Arthritis
16	Asthma
17	Atherosclerosis
18	Athletes Foot
19	Athletic Training
20	Bed Sores
21	Biliousness
22	Bladder
23	Bleeding
24	Blood Conditions
25	Boils
26	Brain
27	Bronchitis
28	Bruises
29	Burns
30	Cancer
31	Candidiasis
32	Cardiovascular
33	Catarrh
34	Chapped Skin
35	Childbirth
36	Children
37	Circulation
38	Cold Feet
39	Colds
40	Colic
41	Colitis
42	Conjunctivitis
43	Constipation
44	Convulsions
45	Coughs
46	Cramps
47	Cuts
48	Cystitis
49	Dandruff
50	Delirium Trem
51	Depression
52	Dermatitis
53	Diarrhea
54	Diuretic
55	Drug Withdrawal
56	Dysmenorrhea
57	Dyspepsia
58	Ear  Wax
59	Ear Infection
60	Earache
61	Eczema
62	Edema
63	Emotional
64	Epilepsy
65	Epstein-Barr
66	Estrogen
67	Expectorant
68	Eyes
69	Fatigue
70	Fever
71	Fissure
72	Flatulence
73	Flu
74	Frostbite
75	Fungal
76	Gall bladder
77	Gastro-intestinal
78	Gingivitis
79	Glands
80	Gout
81	Grief
82	Hair
83	Hay fever
84	Headache
85	Heart
86	Hematoma
87	Hemorrhage
88	Hemorrhoids
89	Hepatitis
90	Herpes
91	Hot Flushes
92	Hyperglycemia
93	Hypertension
94	Hypoglycemia
95	Immune
96	Impotence
97	Incontinence
98	Infections
99	Infertility
100	Inflammation
101	Insect Bites
102	Insomnia
103	Itch
104	Jaundice
105	Kidney Stones
106	Kidneys
107	Laryngitis
108	Liver
109	Lupus
110	Lymph
111	Measles
112	Memory
113	Menopause
114	Menstrual
115	Mental Fatigue
116	Migraine
117	Miscarriage
118	Morning Sickness
119	Motion Sickness
120	Mucous Membranes
121	Mumps
122	Nausea
123	Nephritis
124	Nervous System
125	Pain
126	Phlebitis
127	Poison Oak
128	Postpartum
129	Prenatal
130	Prostate
131	Psoriasis
132	Puberty
133	Raynauds
134	Respiratory
135	Rheumatism
136	Ringworm
137	Sciatica
138	Seborrhea
139	Sedative
140	Sexual Tonic
141	Shingles
142	Sinusitis
143	Skin
144	Sleep
145	Smoking
146	Spasms
147	Sprains
148	Steroids
149	Strains
150	Stress
151	Stroke
152	Surgery
153	Swelling
154	Teething
155	Tic-doulour
156	Tinnitis
157	Toothache
193	Arrhythmia
158	Trauma
159	Ulcers
160	Urethritis
161	Urinary Tract*
162	Urticaria
163	Uterus
164	Varicose
165	Vertigo
166	Viral Infections
167	Warts
168	Whooping Cough
175	Autoimmune Diseases
176	Back Pain (Lower)
177	Back (Weak)
178	Belching
179	Breast Distention
180	Bulimia
181	Carpal Tunnel Syndrome
182	Cataracts
183	Chills and Fever (Alternating)
184	Cholesterol
185	Abdominal Distention
186	ALS 
187	Anemia
188	Angina
189	Anorexia
190	Anti-bacterial
191	Appetite
192	Arteriosclerosis
194	Chronic Fatigue Syndrome
195	Chronic Infections
196	Chronic Muscle Weakness
197	Cysts
198	Diaper Rash
199	Emphysema
200	Fibroids
201	Fibromyalgia
202	First Aid
203	Fractures
204	Frequent Urination
205	Gallstones
206	Goiter
207	Gum Disease
208	Hangover
209	Hernia
210	Hiccups
211	HIV
212	Hives
213	Hot Flashes
214	Hot Palms and Feet
215	Hypothyroid
216	Indigestion
217	Indigestion
219	Leukopenia
220	Leukorrhea
221	Liver Detoxification
222	Low Blood Pressure
223	Lung Support
224	Lyme Disease
225	Macular Degeneration
226	Mouth Sores
227	Multiple Sclerosis
228	Muscular Tension
229	Nasal Congestion
230	Nightmares
231	Night Sweats
232	Nursing
233	Osteoporosis
234	Palpitations
235	Pelvic Inflammatory Disease
236	Phlegm, Excess
238	Pneumonia
239	Premature Ejaculation
\.


--
-- Name: sample_indications_local_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app
--

SELECT pg_catalog.setval('sample_indications_local_id_seq', 239, true);


--
-- Data for Name: side_effects; Type: TABLE DATA; Schema: public; Owner: app
--

COPY side_effects (id, name, description) FROM stdin;
\.


--
-- Name: side_effects_local_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app
--

SELECT pg_catalog.setval('side_effects_local_id_seq', 1, false);


--
-- Data for Name: single_herb_contra_indications; Type: TABLE DATA; Schema: public; Owner: app
--

COPY single_herb_contra_indications (single_herb_id, contra_indications_id) FROM stdin;
274	133
295	147
270	124
270	127
15	124
273	127
273	128
274	124
277	127
279	127
280	127
288	127
296	124
298	124
299	136
299	127
301	124
303	124
304	124
304	127
308	124
61	124
310	127
312	124
312	127
314	127
313	127
316	127
317	127
321	127
321	136
321	124
322	127
323	127
329	127
329	124
329	136
330	136
330	127
330	124
99	127
337	124
339	124
111	127
341	124
344	136
344	127
346	127
349	127
350	127
353	127
353	128
354	124
356	128
356	129
359	136
359	127
360	127
364	127
367	127
370	124
372	127
373	124
374	124
376	124
378	124
378	127
383	124
383	127
384	124
384	127
392	127
395	124
170	136
170	124
170	127
401	127
408	124
410	124
413	127
415	127
496	127
418	127
419	127
426	124
201	127
428	124
431	136
429	127
431	127
431	124
432	124
433	136
433	124
433	127
273	123
274	123
277	123
279	123
286	123
288	123
289	123
290	123
290	124
290	127
291	124
293	123
294	136
294	123
294	127
295	123
295	127
297	123
299	123
302	123
304	123
308	123
310	123
312	123
314	123
316	123
317	123
321	123
322	123
329	123
330	123
99	123
339	123
111	123
344	123
350	123
353	123
356	123
358	123
359	123
360	123
361	123
364	123
367	123
370	123
378	123
383	123
384	123
392	123
394	123
170	123
406	123
411	123
496	123
419	123
420	123
426	123
428	123
429	123
430	123
431	123
433	123
434	123
440	123
227	124
439	124
441	123
441	128
441	127
443	124
443	127
445	127
445	124
446	136
446	123
446	127
446	124
447	127
447	124
449	123
449	124
450	127
451	123
451	124
451	127
452	123
453	123
453	127
455	127
456	127
460	136
460	123
460	127
460	124
460	129
460	128
461	124
463	124
465	124
470	127
470	124
473	123
473	127
473	124
474	123
474	127
475	136
475	123
475	127
475	124
266	124
484	123
484	127
487	127
489	123
489	127
489	124
490	123
490	127
490	124
491	123
494	123
494	124
494	129
13	127
13	123
43	127
44	124
14	124
46	123
47	123
47	127
272	127
272	123
16	123
53	123
54	127
56	123
58	124
63	127
67	136
67	127
67	123
67	124
69	123
71	127
72	123
73	123
76	127
77	123
78	123
79	123
81	127
82	123
85	127
86	123
86	127
86	124
92	123
95	127
97	124
97	127
101	127
103	123
104	124
104	127
112	123
113	123
114	127
115	136
115	123
119	127
124	123
124	124
132	127
141	127
141	123
146	123
154	123
125	124
129	124
129	123
143	127
162	123
162	128
162	127
163	124
163	127
169	136
169	124
169	123
399	124
173	127
181	124
182	127
183	123
191	127
193	127
194	127
198	123
202	127
207	123
210	123
212	127
217	123
219	124
221	127
224	127
231	123
232	127
232	123
234	123
234	127
234	124
235	123
237	128
244	123
245	127
245	123
249	127
252	136
252	127
252	123
252	124
253	127
253	128
256	124
262	127
263	127
267	123
268	127
\.


--
-- Data for Name: single_herb_sample_indications; Type: TABLE DATA; Schema: public; Owner: app
--

COPY single_herb_sample_indications (preferred, single_herb_id, sample_indications_id) FROM stdin;
\.


--
-- Data for Name: single_herb_side_effects; Type: TABLE DATA; Schema: public; Owner: app
--

COPY single_herb_side_effects (single_herb_id, side_effects_id) FROM stdin;
\.


--
-- Data for Name: single_herbs; Type: TABLE DATA; Schema: public; Owner: app
--

COPY single_herbs (herb_id, english_name, latin_name, pin_yin_name, action_1, action_2, action_3, action_4, action_5, action_6, action_7, action_8, action_9, action_10) FROM stdin;
44	Aconite	Aconitum Carmichaeli Radix &leftpar;treated&rightp	Chuan Wu Tou	Expels Wind/Dampness, Warms the body, Expels Cold, Relieves Pain, Rheumatism, Paralysis, Spasms									
45	Agastache	Agastache Rugosa Seu Pogostemi Herba	Huo Xiang	Transforms Dampness, Harmonizes the Middle Burner, Relieves Nausea and Vomiting									
46	Agrimony	Agrimonia Pilosa Herba	Xian He Cao	Constricts and Arrests Bleeding, Avoid with Constipation									
47	Akebia	Akebia Trifoliata Caulis	Mu Tong	Promotes Urination, Drains Heat from Heart, Edema, Painful Urinary Dysfunction, Promotes Lactation									
48	Albizzia bark	Albizzia Julibrissin Cortex	He Huan Pi	Calms the Spirit, Depression, Constrained Emotions, Bad Temper	For poor memory with constrained emotions	For pent up emotions, constrained	For pent up emotions, calming	For depression and a bad temper	For constrained emotions and depression				
49	Alisma	Alismatis Orientalis Rhizoma	Ze Xie	Promotes Urination, Drains Kidney Fire, Damp/Heat in the Lower Body, Edema, Urinary Dysfunction	For edema or water retention	For water retention and edema, combine with Buchu &leftpar;Barosma Betulina&rightpar;							
50	Alpinia	Alpinia Oxyphylla Fructus	Yi Zhi Ren	Warms the Kidneys and Spleen, Urinary Incontinence, Diarrhea	For incontinence or frequent urination								
51	Albizzia flower	Albizzia Julibrissin Flos	He Huan Hua	Insomnia, Pent Up Emotions, Calms the Spirit, Tightness in the Chest, Irritable									
52	Angelica dah.	Angelica Dahurica Radix	Bai Zhi	Expels Wind, Induces Perspiration, Alleviates Pain in Head Region, Opens the Nasal Passages									
53	Apricot seed	Prunus Armeniaca Semen	Xing Ren	Relieves Dry Cough, Expels Sputum, Relieves Asthma, Moistens the Tissues									
54	Arisaema	Arisaematis Rhizoma Praeparatum	Tian Nan Xing	Resolves Cold Phlegm, Disperses Wind/Phlegm in the Channels									
55	Artemisia	Artemisine Argyi Folium	Ai Ye	Stops Bleeding, Warms the Womb, Calms the Fetus	Arrests uterine bleeding								
56	Asarum	Asarum Sieboldii Herba cum Radix	Xi Xin	Expels Cold, Disperses Wind, Warms the Lungs, Nasal Congestion, Body Pain and Headache due to Catarrh									
57	Asparagus	Asparagus Cochinchinensis Tuber	Tian Men Dong	Nourishes the Yin, Moistens the Lungs, Clears Lung Heat									
58	Aster	Astens Tataiici Radix	Zi Wan	Warms the Lungs, Relieves All Coughs, Expels Sputum, Asthma, Arrests Bleeding	For chronic cough and bronchial constriction								
59	Astragalus	Astragalus Membranaceus Radix	Huang Qi	Strengthens the Spleen and Lung, Augments the Qi, Stabilizes the Exterior, Raises the Yang Qi	For fatigue and anemia, combine with Tang Kuei &leftpar;Dang Gui&rightpar;	For fatigue and a feeling of depletion	For shortness of breath and fatigue	For strengthening the immune system	For chronic, non-healing sores and lesions				
60	Astragalus seed	Astragalus Complanatus Semen	Sha Yuan Zi	Fortifies the Yang, Nourishes the Liver and Kidneys									
61	Calamus	Acorus Calamus		Aromatic, Carminative, Dyspepsia, Colic, Intestinal Gas	Improves digestive assimilation and liver functions								
62	Atractylodes, red	Atractylodes Lancea Rhizoma	Cang Zhu	Dries Dampness, Expels Wind, Improves Vision, Night Blindness, Relieves Pain in Lower Body, Rheumatism	Resolves dampness and fluid retention	For additional support for night blindness	For vomiting up phlegm						
63	Belamcanda	Belamcanda Chinensis Rhizoma	She Gan	Clears Toxicity and Heat, Sore and Swollen Throat, Transforms Phlegm, Clears the Lungs, Influenza									
13	Abutilon	Malva Verticillata Semen	Dong Kui Zi	Promotes Urination, Edema, Promotes Lactation, Moistens the Intestines, Relieves Constipation									
14	Acorus	Acorus Gramineus Rhizoma	Shi Chang Pu	Opens the Orifices, Transforms Dampness, Calms the Spirit	For insomnia and an agitated spirit	To open the channels to the heart							
15	Aloe Vera	Aloe Vera Herba	Lu Hui	Drains Fire, Clears Liver Fire, Kills Parasites and Roundworms	Protects the internal body from excess heat								
16	Anemarrhena	Anemarrhena Asphodeloidis Rhizoma	Zhi Mu	Clears Heat, Drains Fire, Nourishes the Yin, Moistens	For dry mouth and night sweats, combine with Phellodendron &leftpar;Huang Bai&rightpar;	For fevers, combine with Gypsum &leftpar;Shi Gao&rightpar;	For hot flashes and dryness	For fever and facial flushing	For  facial flushing, dry mouth				
41	Acacia	Acacia Catechu	Er Chu	Drains Dampness, Non-Healing Sores, Transforms Phlegm									
42	Acanthopanax	Acanthopanax Gracilistylus Cortex Radix	Wu Jia Pi	Dispels Wind/Damp, Nourishes the Liver and Kidneys, Strengthens the Bones and Tendons, Leukopenia	For leukopenia								
43	Achyranthes	Achyranthes Bidentata Radix	Niu Xi	Activates the Blood, Dysmenorrhea, Strengthens the Tendons, Abdominal and Bone Pain, Hypertension	For stony, painful urination	For a hot head with cold feet &leftpar;physical and emotional levels&rightpar;							
64	Biota	Biotae Orientalis Semen	Bai Zi Ren	Nourishes the Heart, Calms the Spirit, Moistens the Intestines, Stops Excessive Sweating	For irritability and forgetfulness								
65	Bletilla	Bletillae Striatae Rhizoma	Bai Ji	Stops Bleeding, Reduces Swelling, Generates Flesh	Gastric and duodenal ulcers, vomiting or coughing blood								
66	Blue Citrus	Citrus Reticulata Viride Pericarpium	Qing Pi	Regulates the Chi, Spreads Liver Chi, Dissipates Lumps, Dries Dampness, Transforms Phlegm	For chest tightness and abdominal fullness, use with Bupleurum &leftpar;Chai Hu&rightpar;								
67	Brucea fruit	Brucea Javanica Semen	Ya Dan Zi	Topically for Warts and Corns, Parasites, Dysentery									
68	Buddleia	Buddleia Officinalis FIos	Mi Meng Hua	Expels Wind, Cools the Blood, Benefits the Vision, Excessive Tearing and Redness of the Eyes									
69	Bupleurum	Bupleurum Chinense Radix	Chai Hu	Disperses and Releases Exterior/Heat, Disperses Liver Chi, Raises the Yang, Chest Pain, Dysmenorrhea									
70	Burdock seed	Arctium Lappa Fructus	Niu Bang Zi	Releases Exterior/Heat, Clears Toxic/Heat, Vents Rashes	Clears toxicity from the blood								
71	Bushy Knotweed	Polygonum Cuspidatum Rhizoma	Hu Zhang	Activates the Blood, Resolves Stagnation, Clears Heat, Amenorrhea, Relieves Pain, Injury									
72	Cannabis seed &leftpar;treated&rightpar;	Cannabis Sativa Semen	Huo Ma Ren	Moistens the Intestines, Dry Constipation									
73	Capillaris	Artemisia Capillaris Herba	Yin Chen Hao	Clears Damp/Heat from the Liver and Gallbladder, Jaundice, Hepatitis, Protects Bile Production	For hepatitis and jaundice								
74	Cardamon	Amomum Villosum Fructus seu Semen	Sha Ren	Strengthens the Stomach, Promotes the Movement of Chi, Transforms Dampness, Stops Vomiting	Calms the digestive tract								
75	Cardamon, white	Amomi Cardomomum Fructus	Bai Dou Kou	Transforms Dampness and Stagnation, Warms the Middle Burner									
76	Carthamus	Carthamus Tinctorius Flos	Hong Hua	Activates the Blood, Disperses Blood Stagnation, Alleviates Abdominal Pain, Vents Rashes, Angina	For angina and to enhance blood circulation	For severe pain	abdominal cramping clots and scanty flow, combine with Persica &leftpar;Tao Ren&rightpar;						
77	Cassia seed	Cassia Tora Semen	Jue Ming Zi	Expels Wind/Heat, Benefits the Eyes, Clears the Liver, Moistens the Bowels, Lowers Cholesterol									
78	Chaenomeles &leftpar;Quince fruit&rightpar;	Chaenomelis Lagenaria Fructus	Mu Gua	Relaxes the Tendons, Unblocks the Channels, Pain and Cramping in the Lower Body	For lower body pain								
79	Chiang Huo	Notopterguim Incisum Rhizoma et Radix	Qiang Huo	Releases the Exterior, Expels Wind and Dampness, Alleviates Pain, Headaches, Relieves Hot Sensations	For pain in the upper body, combine with Clematis &leftpar;Wei Ling Xian&rightpar;								
80	Chih-ko	Citrus Aurantium seu Poncirus Fructus mature	Zhi Ke	Breaks Up Stagnant Chi, Abdominal Fullness, Better for Weak, Deficient Conditions than Chi-Shih									
81	Chih-shih	Citrus Aurantium seu Poncirus Fructus immature	Zhi Shi	Breaks Up Stagnant Chi, Unblocks the Bowels, Directs the Chi Downward, Transforms Phlegm									
82	Chrysanthemum	Chrysanthemum Morifolium Flos	Ju Hua	Expels Wind/Heat, Benefits the Eyes, Clears the Liver, Excessive Tearing, Earache, Headaches	For feverish, red, and painful eyes	For red eyes and eye pain	To clear redness and pain from the eyes and ears						
83	Chrysanthemum, wild	Chrysanthemum Indium Flos	Ye Ju Hua	Drains Fire, Relieves Toxicity, Sores, Boils, Swollen Throat, Hypertension									
84	Cibotium	Cibotium Barometz Rhizoma	Gou Ji	Nourishes the Liver and Kidneys, Strengthens the Tendons, Expels Wind/Damp, Lumbago, Enuresis									
85	Cicada	Cicada Atrata Periostracum	Chan Tui	Disperses Wind, Clears Heat, Vents Rashes, Red and Painful Eyes, Spasms, Convulsions									
86	Cinnamon bark	Cinnamomum Cassia Cortex	Rou Gui	Warms the Kidneys, Fortifies the Yang, Expels Inner Chills &leftpar;Cold to the Bone&rightpar;, Returns Fire to its Source	For cold extremities	For a cold abdomen and cold extremities							
87	Cinnamon twig	Cinnamom Cassia Ramulus	Gui Zhi	Adjusts the Nutritive and Protective Qi, Warms the Channels and Expels Cold, Moves the Yang Qi	Relieves muscular tension, combine with Pueraria &leftpar;Ge Gen&rightpar;								
88	Cistanche	Cistanches Deserticola Herba	Rou Cong Rong	Strengthens the Kidney Yang, Moistens the Intestines, Infertility Due to Cold Womb	For stimulating peristalsis of intestines								
89	Citrus	Citrus Reticulata Pericarpium	Chen Pi	Regulates and Promotes the Movement of Chi Downward, Dries Dampness, Transforms Phlegm									
90	Clematis	Clematis Chinensis Radix	Wei Ling Xian	Dispels Wind/Dampness, Unblocks the Channels, Alleviates Muscular and Joint Pain, Rheumatism	For pain in the lower body								
91	Cloves	Eugenia Catyophyllata Flos	Ding Xiang	Directs Chi Downward, Warms the Spleen and Kidneys, Relieves Pain, Digestive Aid									
92	Cnidium	Ligusticum Wallichii Radix	Chuan Xiong	Invigorates the Blood and Moves the Chi, Gynecological Problems, Expels Wind, Alleviates Pain									
93	Cnidium seed	Cnidium Monnieri Semen	She Chuang Zi	Kills Parasites, Dries Dampness, Itchy Genitals, Warms the Kidneys, Fortifies the Yang, Impotence									
113	Dendrobium	Dendrobium Nobile Herba	Shi Hu	Nourishes the Yin, Clears Heat, Produces Fluids, Nourishes the Stomach, Benefits the Vision	Moistens the body fluids, enhances the vision								
114	Dianthus	Dianthus Superbus Herba	Qu Mai	Clears Damp/Heat, Promotes Urination, Painful Uri-nary Dysfunction, Activates the Blood, Constipation									
115	Dictamnus	Dictamnus Dasycarpus Radicis cortex	Bai Xian Pi	Clears Heat and Toxicity, Expels Wind, Dries Dampness, Sores, Carbuncles, Rashes									
116	Dioscorea	Dioscorca Opposita Radix	Shan Yao	Strengthens Spleen and Stomach, Nourishes Lungs and Kidneys, Diarrhea, Diabetes, Vaginal Discharge	For weak appetite and sweating								
117	Dipsacus	Dipsacus Asper Radix	Xu Duan	Strengthens the Kidneys and Liver, Strengthens the Bones and Tendons, Lumbago, Fractures	For sore lower back	For stiffness in the joints							
118	Dolichos	Dolichoris Lablab Semen	Bai Bian Dou	Strengthens the Spleen, Clears Summerheat, Chronic Diarrhea, Vomiting, Loud Stomach Growling									
119	Dragons Blood	Daemonorops Draconis Sanguis	Xue Jie	Activates the Blood, Relieves Pain, Stops Bleeding, Generates Flesh, Heals Fractures, Sprains, Injury									
120	Dragon bone	Draconis Os	Long Gu	Calms the Spirit, Calms the Liver, Stops Seepage of Fluids, Emotional Distress, Insomnia, Anxiety									
121	Drynaria	Drynaria Fortunei Rhizoma	Gu Sui Bu	Strengthens the Kidneys, Connects Tendons and Bones, Activates the Blood, Relieves Pain, Fractures									
122	Du Huo	Angelica Root, Pubescent	Tu Huo	Dispels Wind/Damp, Releases the Exterior, Relieves Pain, Low Body Pain, Lumbago, Headaches									
123	Eclipta	Eclipta Prostrata Herba	Han Lian Cao	Nourishes the Liver and Kidneys, Cools the blood, Stops Bleeding, Dizziness, Blurred Vision, Vertigo	For liver disorders, combine with Ligustrum &leftpar;Nu Zhen Zi&rightpar;	For dizziness and blurred vision							
124	Ephedra	Ephedra Herba	Ma Huang	Induces Perspiration, Asthma, Do not use if Sweating Profusely during a Febrile Disease									
125	Epimedium	Epimedium Grandiflorum Herba	Yin Yang Huo	Strengthens the Kidneys, Fortifies the Yang, Impotence, Rheumatism, Hypertension	A sexual stimulant								
126	Eriobotrya  &leftpar;Loquat Leaf&rightpar;	Eriobotrya Japonica Folium	Pi Pa Ye	Transforms Phlegm, Clears Lung Heat, Directs Lung Chi Downward, Harmonizes the Stomach									
127	Eucommia	Eucommia Ulmoides Cortex	Du Zhong	Strengthens the Kidneys and Liver, Strengthens Tendons, Secures Fetus, Lumbago, Hypertension	For securing a fetus, combine with Scute &leftpar;Huang Qin&rightpar; and Dipsacus &leftpar;Xu Duan&rightpar;	For hypertension, combine with Loranthus &leftpar;Sang Ji Sheng&rightpar;	For recurring miscarriages	For soreness in the lower back					
128	Euryales	Euryale Ferox Semen	Qian Shi	Strengthens the Spleen and Kidneys, Diarrhea, Restrains Seminal Emissions, Avoid with Constipation	For loose stool or urinary incontinence	For loose stools and poor assimilation							
129	Evodia	Evodia Rutaecarpa Fructus	Wu Zhu Yu	Warms the middle burner, Disperses Cold, Relieves vomiting and abdominal pain	For abdominal cramping and pain	For abdominal pain with vomiting and phlegm							
130	Fennel	Foeniculum Vulgare Fructus	Xiao Hui Xiang	Promotes Movement of Chi, Disperses Stagnation, Warms Internal Organs, Low Abdominal Pain, Hernia									
145	Ginseng &leftpar;American&rightpar;	Panax Quinqueforium	Xi Yang Shen	Nourishes the Yin of the Lung and Stomach, Produces Fluids, Clears Heat	To rebuild the energy reserves	Helps to produce fluids	Supplements the bodies energy and fluids						
131	Forsythia	Forsythia Suspensa Fructus	Lian Qiao	Clears Heat and Toxicity, Expels Wind/Heat, Sore Throat, Fever, Influenza, Carbuncles, Scrofula	For fever/chills, swollen glands	For fever	For severe skin flare ups	For fever combine with Coptis  &leftpar;Huang Lian&rightpar;					
94	Codonopsis	Codonopsis Pilosula Radix	Dang Shen	Strengthens the Middle Burner and Qi, Nourishes the Lungs and Fluids	Strengthens the qi or energy	Strengthens the bodies energy	Strengthens the spleen and enhances energy	For fatigue and weak digestion					
95	Coix	Coix Lachryma Jobi Semen	Yi Yi Ren	Promotes Urination/Drains Dampness, Strengthens the Spleen, Clears Carbuncles and Abscesses									
96	Coltsfoot	Tussilago Farfara Flos	Kuan Dong Hua	Redirects the Chi Downward, Stops Coughing and Wheezing	For cough and mucous build-up								
97	Coptis	Coptis Chinensis Rhizoma	Huang Lian	Drains Fire, Relieves Toxicity, Clears Heat and Drains Dampness, Drains Stomach Fire, Stops Bleeding	For a bitter dry mouth								
98	Cordyceps	Cordyceps Sinensis	Dong Chong Xia Cao	Warms the Kidneys, Fortifies the Yang, Nourishes the Lungs, Nourishes the Yin									
99	Corn Silk	Zea Mays stylus	Yu Mi Xu	Promotes Urination, Urinary Infections, Supports the Gall Bladder, Jaundice, Diabetes									
100	Cornus	Cornus Officinalis Fructus	Shan Zhu Yu	Stabilizes the Kidneys, Nourishes the Liver, Retains the Essence, Stops Excessive Bleeding and Sweating,	For excessive sweating	For hearing loss, tinnitus, or dizziness							
101	Corydalis	Corydalis Yanhusuo Rhizoma	Yan Hu Suo	Invigorates the Blood, Alleviates Pain, Moves the Qi, Injury, Abdominal and Gynecological Pain	Alleviates abdominal pain and discomfort	For pain, spasms, and discomfort, combine with Wild Yam &leftpar;Dioscorea Villosa&rightpar;	For abdominal pain, combine with Myrrh &leftpar;Mo Yao&rightpar;	For dysmenorrhea, combine with Cyperus &leftpar;Xiang Fu&rightpar;	For chronic abdominal pain				
102	Crataegus	Crataegus Pinnatifida Fructus	Shan Zha	Reduces Food Stagnation and Accumulation, Disperses Blood Stagnation, Cholesterol, Hypertension	For food stagnation and excess fat								
103	Curculigo	Curculigo Orchioidis Rhizoma	Xian Mao	Strengthens the Kidneys, Fortifies the Yang, Infertility in Men and Women, Weak Lower Body, Back Pain									
104	Curcuma	Curcuma Longa Tuber	Yu Jin	Invigorates the Blood, Moves the Chi, Clears the Heart, Cools the Blood, Supports the Gall Bladder									
105	Cuscuta	Cuscuta Chinensis Semen	Tu Si Zi	Nourishes the Kidneys and Liver, Secures the Essence, Strengthens the Yang, Low Body Weakness, Impotence, Calms the Fetus, Diarrhea, Enuresis	For premature ejaculation	For diarrhea, use with Dioscorea &leftpar;Shan Yao&rightpar; and Hoelen &leftpar;Fu Ling&rightpar;	For dizziness or blurred vision and urinary dysfunction	For calming a restless fetus	For weakened vision, combine with Lycium fruit &leftpar;Gou Qi Zi&rightpar;				
106	Cuttlebone	Sepia Esculenta Os	Hai Piao Xiao	Controls Acidity, Stops Diarrhea, Stops Bleeding and Vaginal Discharge, Retains the Essence									
107	Cyathula	Cyathula Officinalis Radix	Chuan Niu Xi	Expels Wind, Drains Dampness, Low Back Pain									
108	Cynanchum	Cynanchi Baiqian Radix	Bai Qian	Redirects the Chi Downward, Expels Phlegm, Wheezing, Coughing, Substitute for Ma Huang									
109	Cynomorium	Cynomorium Songaricum Herba	Suo Yang	Strengthens the Kidneys, Fortifies the Yang, Strengthens Lower Back and Tendons, Impotence, Moistens the Intestines, Unblocks the Bowels									
110	Cyperus	Cyperus Rotundus Rhizoma	Xiang Fu	Spreads Constrained Liver Qi, Regulates the Menstruation, Harmonizes the Liver and Spleen	For cold abdominal pain during menstruation	For hypochondriac pain and abdominal bloating	For painful menstruation combine with curcuma &leftpar;Yu Jin&rightpar;	harmonizes emotional mood swings and tightness in the chest	For depression and tightness in the chest	For emotional agitation and tension			
111	Dandelion	Taraxacuni Mongolicum Herba cum	Pu Gong Ying	Clears Heat and Toxicity, Reduces Swelling, Clears Boils and Carbuncles, Mastitis, Bacterial Infections	When Potassium has been depleted from the use of diuretics	For 'milk fever', painful breasts, and mastitis							
112	Deer Antler	Cervi Comu	Lu Rong	Strengthens the Kidneys, Fortifies the Yang, Strengthens the Tendons and Bones, Infertility	For enhancing fertility	Enhances fertility and libido							
132	Frankincense	Olibanum Gummi	Ru Xiang	Activates the Blood, Moves the Chi, Reduces Swelling, Relieves Pain, Generates Flesh, Spasms, Injury									
133	Fraxinus &leftpar;Korean Ash&rightpar;	Fraxinus Rhynchophylla Cortex	Qin Pi	Drains Damp/Heat and Liver Fire, Dispels Wind/Damp, Benefits Vision,  Relieves Pain	For clearing the liver and benefits the eyes								
134	Fritillaria	Fritillaria Cirrhosa Bulbus	Chuan Bei Mu	Clears Heat, Transforms Phlegm, Dissipates Nodules, Chronic Cough, Tight Chest, Lung or Breast Masses									
135	Fritillaria bulb	Fritillaria Verticillata Bulbus	Zhe Bei Mu	Clears Heat, Transforms Hot Phlelgm, Dissipate Nodules, Lung Abscesses, Breast Masses									
136	Gallus	Cornium Gigeria Gallum Endothelium	Ji Nei Jin	Reduces Food Accumulation, Augments the Spleen, Enuresis, Poor Childhood Development									
137	Gambir	Uncaria Rhynchophylla Ramulus et Uncus	Gou Teng	Dispels Wind, Alleviates Spasms, Drains Liver Fire, Headache, Dizziness, Anxiety, Spasms, Hypertension	For short tempered and road rage								
138	Ganoderma &leftpar;Reishi Mushroom&rightpar;	Ganodenna Lucidum	Ling Zhi	Benefits the Chi, Protects the Spirit, Benefits the Joints, Tendons, and Bones, Heart and Lung Tonic	For immune enhancement								
139	Gardenia	Gardenia Jasminoidis Fructus	Zhi Zi	Clears Heat, Calms Irritability, Drains Damp/Heat, Cools the Blood, Fever, Bladder Infection, Jaundice	For dark colored urine	For clearing heat and dampness	Clears heat and dries dampness						
140	Gastrodia	Gastrodia Elata Rhizoma	Tian Ma	Soothes the Liver, Dispels Wind, Pain Relief, Spasms, Headache, Dizziness, Numbness, Migraines	For headaches and dizziness								
141	Gentiana, scabra	Gentiana Scabra Radix	Long Dan Cao	Drains Damp/Heat and Liver Fire, Eye Infections, Jaundice, Swollen Genitals, Hot Vaginal Discharge									
142	Gentiana, macro.	Gentiana Macrophylla Radix	Qin Jiao	Dispels Wind/Dampness, Relieves Pain, Spasms, Clears Heat, Moistens the Intestines, Jaundice	Relaxes the tendons and ligaments								
143	Ginger, dried	Zingiber Officinalis Rhizoma	Gan Jiang	Expels Interior Cold, Augments the Yang, Warms the Spleen and Stomach, Cold Limbs, Weak Digestion	For a cold abdomen	For nausea and stomach uneasiness	For nausea with regurgitation of sour fluids						
144	Ginger, fresh	Zingiberis Officinalis Rhizoma	Sheng Jiang	Induces Sweating, Disperses Exterior Cold, Warms the Spleen and Stomach, Vomiting, Poisoning									
301	Bryonia &leftpar;Homeopathic&rightpar;	Bryonia Dioica		Anti-inflammatory, Analgesic, Anodyne									
146	Ginseng &leftpar;Chinese&rightpar;	Panax Ginseng	Ji Lin Ren Shen	Strengthens the Spleen and Lung Qi, Calms the Spirit, Produces Fluids, Weakness, Heart Tonic, Lowers Blood Sugar and Blood Fat	For a weakened heart condition								
147	Ginseng &leftpar;Siberian&rightpar;	Eleutherococcus Senticosus Radix	Ci Wu Jia	Augments the Qi, Strengthens the Spleen and Kidneys, Normalizes Body Functions	Adaptogenic agent, prevents depletion								
148	Glehnia	Glehnia Radix	Sha Shen	Moistens the Lungs, Stomach and Skin, Produces Fluids, Clears Heat, For Dry Cough, Mouth and Throat	For itchy skin, aggravated by dry cold weather, use with Ophiopogon &leftpar;Mai Men Dong&rightpar;  and Polygonatum &leftpar;Yu Zhu&rightpar;								
149	Gynostemma	Gynostemma Pentaphyllum Radix	Jiao Gu Lan	Strengthens the Qi and Body Functions, Clears Heat and Toxicity, Produces Fluids, Transforms Phlegm	Supports the bone marrow	For augmenting the immune system, an adaptogenic							
150	Gypsum	Gypsum	Shi Gao	Clears Heat from Lung and Stomach, Drains Fire, Fever, Febrile Diseases, Thick Hot Phlegm									
151	Haliotis &leftpar;Abalone shell&rightpar;	Haliotidis Diversicolor Concha	Shi Jue Ming	Drains Fire, Directs Yang Downward, Benefits Vision, Eye Diseases, Dizziness, Headache									
152	Hoelen	Poria Cocus Scierotium	Fu Ling	Promotes Urination, Strengthens the Spleen, Transforms Phlegm, Edema, Diarrhea, Weak Appetite	For water retention and digestive support								
153	Hoelen &leftpar;Fu Shen&rightpar;	Poria Cocus Pararadicis Scierotium	Fu Shen	Similar to Hoelen &leftpar;Fu Ling&rightpar;, Better for Calming the Spirit, Insomnia, Forgetfulness									
154	Ho Shou Wu	Polygonum Multiflorum Radix	He Shou Wu	Nourishes the Kidneys and Liver, Benefits the Semen and Blood, Grey Hair, Lumbago, Reduces Blood Fat	For building stronger blood	For wind rash	For neuropathy	For dry skin or loss of hair					
155	Houttuynia	Houttuynia Cordata Herba cum Radix	Yu Xing Cao	Clears Heat and Toxicity, Reduces Swellings, Lung Abscesses, Hot Phlegm, Urinary Dysfunctions	For abscesses of the lung	For hot yellow sputum and abscesses							
156	Imperata	Imperata Cylindrica Rhizoma	Bai Mao Gen	Cools the Blood, Clears Heat, Stops Bleeding, Warm Febrile Diseases, Hot Urinary Dysfunctions, Edema	For bloody, painful urination	Arrests nose-bleeding							
157	Isatis leaf &leftpar;Wild Indigo&rightpar;	Isatis Tinctoria Folium	Da Qing Ye	Clears Heat and Toxicity, Cools the Blood, Warm Febrile Diseases, Sore Throat, Skin Eruptions	For septicemia, combine with Scutellaria								
158	Isatis root	Isatidis Tinctoria Radix	Ban Lan Gen	Drains Heat, Relieves Fire/Toxicity, Cools the Blood, Viral Infections, Warm Febrile Diseases									
159	Jujube	Ziziphus Jujuba Fructus	Da Zao	Augments the Spleen and Chi, Nourishes the Blood, Calms the Spirit, Moderates Harsh Herbs									
160	Juncus	Juncus Effusus Medulla	Deng Xin Cao	Promotes Urination, Clears Heat from the Heart, Sleep Disorders, Insomnia									
161	Laminaria	Laminaria Japonica Algae Thallus	Kun Bu	Resolves Phlegm, Dissipates Nodules in Neck, Reduces Swelling, Promotes Urination									
162	Leonurus &leftpar;Motherwort&rightpar;	Leonuri Heterophylli Herba	Yi Mu Cao	Invigorates the Blood, Regulates the Menstruation, Induces Labor, Abdominal Pain									
163	Licorice	Glycyrrhizae Uralensis Radix	Gan Cao	Strengthens the Spleen and Qi, Produces Fluids, Clears Toxicity, Sore Throat, Boils, Poisoning	For abdominal pain and spasms								
164	Licorice, baked	Glycyrrhizae Uralensis Radix	Zhi Gan Cao	Strengthens the Spleen and Stomach, Produces Fluids, Spasms									
165	Ligusticum	Ligusticum Sinensis Rhizome et Radix	Gao Ben	Expels Wind, Relieves Pain, Headache at the Crown of the Head down to Cheeks	For headache relief	For headache in the occipital region							
166	Ligustrum	Ligustrum Lucidum Fructus	Nu Zhen Zi	Nourishes the Yin, Tones the Liver and Kidneys, Dizziness, Palpitations, Benefits Vision, Tinnitus									
167	Lilly	Lilium Brownii Bulbus	Bai He	Moistens the Lungs, Clears Heat, Dry Cough, Calms the Heart, Insomnia, Restlessness, Irritable	Calms the spirit and stops palpitations								
168	Lindera	Lindera Stiycbnifolia Radix	Wu Yao	Moves the Qi, Relieves Pain in Chest and Lower Abdomen, Warms the Kidneys, Urinary Incontinence	For hernial disorder	For lower abdominal discomfort	For abdominal cramping and pain						
169	Lithospernum	Lithosperm Erythrorhizon seu Arnebia Inflorescens	Zi Cao	Clears Heat and Toxicity, Cools the Blood, Vents Rashes, Carbuncles, Moistens the Intestines									
170	Lobelia	Lobelia Chinenis, Herba cum Radice	Ban Bian Lian	Promotes Urination, Edema, Cools the Blood, Clears Toxicity, Insect and Snake Bites									
171	Longan	Euphoria Longana Arillus	Long Yan Rou	Augments the Heart and Spleen, Calms the Spirit, Insomnia, Forgetfullness, Pensive, Stress	For nourishing and calming the spirit								
172	Lonicera &leftpar;Honeysuckle&rightpar;	Lonicera Japonica Flos	Jin Yin Hua	Clears Heat, Clears Toxicity, Cools the Blood, Disperses Wind/Heat, Anti-viral, Anti-bacterial	For inflammation of the throat	For yellow nasal discharge and sinus infection	To reduce swelling of carbuncles, combine with Prunella  &leftpar;Xiao Cu Kao&rightpar;						
173	Lophatherum	Lophatherum Gracile Herba	Dan Zhu Ye	Clears Heat, Irritability, Mouth Sores, Thirst, Promotes Urination, Clears Damp/Heat									
174	Loranthus	Viscum Coloratum seu Loranthi Ramus	Sang Ji Sheng	Nourishes the Blood, Expels Wind, Strengthens the Tendons and Bones, Lumbago, Rheumatism, Secure Fetus, Hypertension	For weakness in the joints and tendons								
175	Lotus plumule	Nelumbinis Nucifera Plumula	Lian Zi Xin	Drains Heart Fire, Warm Febrile Disease causing Mental Confusion and Delirium, Insomnia, Irritability	For mouth sores								
176	Lotus seed	Nelumbinis Nucifera Semen	Lian Zi	Strengthens the Spleen and Kidneys, Diarrhea, Spermatorrhea, Calms the Spirit, Anxiety, Insomnia	For anxiety and insomnia								
177	Lotus stamen	Nelumbinis Nucifera Stamen	Lian Xu	Stabilizes the Kidneys, Binds Up the Essence, Clears the Heart, Spermatorrhea, Enuresis, Incontinence									
178	Lycium bark	Lycium Chinense Cortex Radicis	Di Gu Pi	Clears Heat, Cools the Blood, Drains Fire, Chronic Low Grade Fever, Night Sweats, Cough, Bleeding									
179	Lycium fruit	Lycium Barbarum Fructus	Gou Qi Zi	Nourishes the Kidneys, Liver, and Blood, Benefits the Eyes, Lumbago, Diabetes, Seminal Emmisions	For weakening vision	For dryness of the eyes, combine with Chrysanthemum  &leftpar;Ju Hua&rightpar;	For low grade abdominal pain and brightens the eyes						
180	Lygodium spore	Lygodium Japonicum	Hai Jin Sha	Clears Heat and Toxicity, Promotes Urination, Hot Painful Urination, Stones									
181	Lysimachia	Lysimachia Christina Herba	Jin Qian Cao	Promotes Urination, Hot Painful Urination, Stones, Clears Damp/Heat, Jaundice									
182	Magnolia bark	Magnolia Officinalis Cortex	Hou Po	Moves the Chi, Transforms Phlegm, Resolves Stag-nation, Abdominal Fullness, Directs Chi Downward	Belching, fullness and abdominal distention, combine with Citrus &leftpar;Chen Pi&rightpar;								
183	Magnolia flower	Magnolia Liliflora Flos	Xin Yi Hua	Expels Wind, Disperses Cold, Opens the Nasal Passages, Headache, Sinusitis	For nasal congestion and sinus discharge								
184	Millettia	Spatholobus suberectus radix et caulis	Ji Xue Teng	Moves and Nourishes the Blood, Gynecology, Relieves Pain, Numbness, Paralysis, Leukopenia	For bone marrow suppression and leukopenia								
185	Momordica fruit	Momordica Grosvenor Fructus	Luo Han Guo	Clears Lung Heat, Moistens the Intestines, Coughing With Mucous, Whooping Cough, Dry Constipation	For whooping cough								
186	Morinda	Morinda Officinalis Radix	Ba Ji Tian	Warms the Kidneys, Strengthens the Yang, Tendons and Ligaments, Impotence, Dizziness, Tinnitus	For strengthening the bones and tendons								
187	Morus bark	Morus Alba Cortex Radix	Sang Bai Pi	Stops Cough, Drains Lung Heat, Wheezing, Promotes Urination, Edema in the Upper Body and Extremeities	For copious sputum, combine with Trichosanthes Seed&leftpar;Gua Lou Ren&rightpar;								
188	Morus fruit	Morus Alba Fructus	Sang Shen	Nourishes the Blood and Yin, Dizziness, Tinnitus, Insomnia, Greying of Hair, Constipation	For dizziness and tinnitus, combine with vitex &leftpar;Man Jing Zi&rightpar;								
189	Morus leaf	Morus Alba Folium	Sang Ye	Expels Wind, Clears Lung Heat, Warm Febrile Diseases, Clears Liver, Benefits the Eyes	To clear infections from the lungs								
190	Morus twig	Morus Alba Ramulus	Sang Zhi	Expels Wind, Unblocks the Channels, Relieves Joint Pain in the Upper Body,									
191	Moutan	Moutan Cortex Radix	Mu Dan Pi	Clears Heat, Cools the Blood, Activates the Blood, Clears Fire from Deficiency, Injury, Gynecology	For clearing heat from the blood and enhancing circulation, combine with Peony, red &leftpar;Chi Shao Yao&rightpar;	For toxic blood and irritability	For dark red sores, combine with Peony						
192	Mume	Prunus Mume Fructus	Wu Mei	Seepage of Lung Qi, Stops Cough, Binds the Intestines, Diarrhea, Expels Roundworms	For chronic cough								
193	Myrrh	Myrrha	Mo Yao	Activates the Blood, Dispels Blood Stagnation, Relieves Painful Obstructions, Promotes Healing									
194	Oldenlandia	Heydyotidis Diffusa Herba	Bai Hua She She Cao	Clears Heat and Fire Toxicity, Abscesses, Internal Toxic Sores and Swellings, Cancer	For difficult, chronic infections								
195	Ophiopogon	Ophiopogonis Japonicum Tuber	Mai Men Dong	Moistens the Lungs, Stops Dry Cough, Moistens the Stomach, Clears Heat, Moistens the Intestines									
196	Oyster shell	Ostrea Concha	Mu Li	Calms the Spirit, Anchors the Yang, Insomnia, Anxiety, Prevents Sweating, Dissipates Nodules	For night sweats, combine with Astragalus &leftpar;Huang Qi&rightpar;								
197	Paris	Paris Rhizoma	Zao Xiu	Clears Toxic Heat, Dissipates Nodules, Chronic Viral Diseases, Hepatitis, Cancer, Tonsillitis, Mastitis									
198	Patrinia	Herba cum Radice Patrinia Scabiosaefolia	Bai Jiang Cao	Clears Heat, Relieves Toxicity, Abscesses, Toxic Sores and Swellings, Pain in the Chest and Abdomen	For abscesses of the intestinal tract	For the mumps							
199	Peony	Paeoniae Lactiflorae Radix	Bai Shao Yao	Nourishes the Blood, Gynecology, Calms the Liver, Spasms, Adjusts the Nutritive and Protective Chi	For frequent hunger that is not satisfied	For muscle spasms and cramps, combine with Licorice &leftpar;Gan Cao&rightpar;	Relaxes and softens the liver	Relaxes the liver and relieves irritability	For calming and softening rigidity	For gnawing hunger			
200	Peony, red	Paeoneae Rubrae Radix	Chi Shao Yao	Activates Menstruation due to Blood Stagnation, Relieves Pain, Cools the Blood, Reduces Swelling	For painful localized inflammation	For abdominal pain and tension							
201	Peppermint	Mentha Haplocalyx Herba	Bo He	Disperses Wind/Heat, Clears the Head, Eyes and Throat, Vents Rashes, Activates the Liver Chi	For venting of rashes								
202	Persica &leftpar;Peach Kernel&rightpar;	Prunus Persica Semen	Tao Ren	Breaks Up Blood Stagnation, Relieves Localized Pain, Moistens the Intestines, Dry Constipation									
203	Perilla seed	Perilla Fruitescens Fructus	Zi Su Zi	Stops Moist Cough and Wheezing, Transforms Phlegm, Difficult Exhalation, Moistens the Intestines	For chronic cough with wheezing								
205	Perilla leaf	Perilla Fruitescens Folium	Zi Su Ye	Releases the Exterior/Cold, Promotes the Movement of Chi, Calms Restless Fetus, Morning Sickness	For nausea, vomiting, and poor appetite, combine with Agastache &leftpar;Huo Xiang&rightpar;								
206	Peucedanum	Peucedanum Praeruptorum Radix	Qian Hu	Directs the Qi Downward, Expels Phlegm, Cough and Wheezing due to Phlegm,	For thick, yellow sputum								
207	Phellodendron	Phellodendri Cortex	Huang Bai	Drains Damp/Heat from the Lower Body, Drains Kidney Fire, Vaginal Discharge, Night Sweats									
208	Phragmites	Phragmitis communis Rhizoma	Lu Gen	Clears Heat, Produces Fluids, Promotes Urination, Dry Cough, Lung Diseases, Alleviates Thirst									
209	Picrorrhiza	Picrorhiza Scrophulariaeflora Rhizoma	Hu Huang Lian	Drains Damp/Heat, Clears Heat, Yin Deficiency with Heat Signs, Chronic Diarrhea, Dysentery									
210	Pinellia	Pinellia Ternata Rhizoma	Ban Xia	Dries Dampness, Transforms Phlegm, Directs Chi Downward, Relieves Vomiting, Cough, Asthma	For nausea or vomiting	For chronic excessive phlegm and mucous	Resolves phlegm and stops vomiting, combine with Citrus &leftpar;Chen Pi&rightpar; and Ginger, fresh &leftpar;Sheng Jiang&rightpar;						
211	Pine node	Pinus Tabulaeformis Lignum Nodi	Song Jie	Dispels Wind, Dries Dampness, Relieves Pain in Joints, Injury, Arthritis									
212	Plantago seed	Plantago Asiatica Semen	Che Qian Zi	Clears Heat, Drains Dampness, Promotes Urination, Edema, Jaundice, Relieves Cough, Expels Sputum	For colored vaginal discharge								
213	Platycodon	Platycodon Grandiflorum Radix	Jie Geng	Supplements the Lung Chi, Expels Sputum, Cough, Sore Throat, Lung Abscess, Pneumonia									
214	Polygala	Polygala Tenuifolia Radix	Yuan Shi	Calms the Spirit, Transforms Phlegm, Forgetfulness, Insomnia, Palpitations, Cough with Mucous	For insomnia forgetfulness, and palpitations								
215	Polygonatum, sib.	Polygonatum Sibiricum Rhizoma	Huang Jing	Nourishes the Yin, Heart, and Lungs, Strengthens the Middle Burner and Chi, Benefits the Marrow									
216	Polygonatum, odor.	Polygonatum Odoratum Rhizoma	Yu Zhu	Nourishes the Yin, Produces Fluids, Extinguishes Wind, Dry Mouth, Thirst, Gnawing Hunger	For intense hunger, thirst, and constipation								
217	Polygonum	Polygonum Aviculare Herba	Bian Xu	Clears Damp/Heat from the Bladder, Painful Urinary Dysfunction, Stones, Parasites, Stops Itching									
304	Bugleweed	Lycopus Virginicus		BSedative, Astringent, Emphysema, Cough	Specific for hyperthyroid								
218	Polygonum vine	Polygonum Multiflori Caulis	Ye Jiao Teng	Nourishes the Heart and Blood, Calms the Spirit, Dream Disturbed Sleep, Pain, Soreness, Numbness	For constrained emotions, irritability	For releasing pent up emotions	For insomnia, dream disturbed sleep	For constriction in the chest and insomnia	For generalized weakness soreness and numbness of the muscles	For nightmares and dream disturbed sleep			
219	Polyporous	Polyporum Umbellatum Sclerotium	Zhu Ling	Promotes Urination, Seeps Dampness, Edema, Vaginal Discharge, Scanty Urine									
220	Prunella &leftpar;Self-Heal&rightpar;	Prunella Vulgaris Spica	Xiao Cu Kao	Calms the Liver, Clears Heat, Dissipates Nodules, Disperses Congestion, Scrofula, Headache, Boils									
221	Pseudoginseng	Panax Notoginseng Radix	Tien Chi	Arrest Bleeding, Promote Blood Circulation, Swelling, Pain, Injuries	To arrest bleeding, combine with Slippery Elm &leftpar;Ulmus Fulva&rightpar;								
222	Pseudostellaria	Pseudostellaria Heterophylla Radix	Tai Zi Shen	Strengthens the Chi, Spleen, and Lungs, Produces Fluids, Fatigue, Shortness of Breath, Cough, Asthma	For thirst and strengthening the digestion								
223	Psoralea	Psoralea Corylifolia Fructus	Bu Gu Zhi	Strengthens the Kidneys, Fortifies the Yang, Impotence, Lumbago, Enuresis, Grasps the Qi, Asthma	For spermatorrhea, pasty stool								
224	Pteropus	Trogopteri seu Pteromi Excrementum	Wu Ling Zi	Activates the Blood, Relieves Pain, Gynecology, Stops Bleeding									
227	Pulsatilla	Pulsatillae Chinensis Radix	Bai Tou Weng	Clears Heat and Toxicity, Cools the Blood, Relieves Dysentery, Stops Diarrhea	For tears of exhaustion and depression	Emotionally, when tears are associated with stress	For watery eyes and allergies						
228	Purslane	Portulaca Oleracea Herba	Ma Chi Xian	Cools the blood, Clears Damp/Heat, Dysentery, Boils									
229	Pyrrosia	Pyrrosia Lingua Folium	Shi Wei	Clears Damp/Heat, Hot, Painful, Stony and Bloody Urinary Dysfunction, Stops Bleeding									
230	Raphanus &leftpar;Radish seed&rightpar;	Raphanus Sativus Semen	Lai Fu Zi	Reduces Food Accumulation, Directs Chi Downward, Belching, Acid Regurgitation, Foul Breath									
231	Rehmannia, prepared	Rehmannia Glutinosa Radix	Shu Di Huang	Nourishes the Yin and Blood, Anemia, Night Sweats, Diabetes, Seminal Emission, Grey Hair	For weakness in the lower body and kidneys	For strengthening the kidneys and nourishes the blood							
232	Rehmannia, raw	Rehmannia Glutinosa Radix	Sheng Di Huang	Nourishes the Yin, Drains Fire, Cools the Blood, Moistens the Intestines, Tidal Fever, Bleeding									
233	Rhodiola	Rhodiola Rosea	Hong Jing Tian	Supplements the Chi, Activates the Blood, Clears Heat, Dry Dampness, Stops Bleeding									
234	Rhubarb	Rheum Palmatum &leftpar;or Rhei&rightpar; Rhizoma	Da Huang	Moves Accumulation, Clears Stomach and Intestine Fire, Constipation, Benefits Gall Bladder, Bleeding	For clearing of the bowels								
235	Rose Hip	Rosa Laevigata Fructus	Jin Ying Zi	Stabilizes the Kidneys, Binds Up the Essence and Intestines, Spermatorrhea, Incontinence, Prolapse									
236	Rubus &leftpar;Raspberry fruit&rightpar;	Rubus Chingii Fructus	Fu Pen Zi	Augments and Stabilizes the Kidneys, Enuresis, Wet Dreams, Benefits the Vision, Impotence, Lumbago									
237	Salvia	Salvia Miltiorrhiza Radix	Dan Shen	Activates the Blood, Regulates the Menstruation, Clears Heat, Cools the Blood, Insomnia	Enhances the circulation of blood, calms the nerves, and cools the blood	For stimulating circulation and relieving agitation	Invigorates and resolves poor blood circulation	promotes circulation and calms the spirit	For tightness in the chest and irratability	For calming the spirit and improving circulation			
238	Sanguisorba	Sanguisorba Officinalis Radix	Di Yu	Cools the Blood, Stops Bleeding in Lower Body, Clears Heat, Generates Flesh									
239	Sargassum	Sargassum Pallidum Herba	Hai Zao	Clears Heat and Reduces Phlegm Nodules, Goiter, Promotes Urination, Edema, Pain from Hernia	Resolves phlegm, softens masses								
240	Saussurea	Aucklandia Lappa or Saussurea Lappa Radix	Mu Xiang	Promotes Circulation of Qi, Disperses Accumulation, Abdominal Distention and Pain, Diarrhea	For abdominal distention and bloating	For fullness after eating very little							
241	Schizandra	Schisandra Chinensis Fructus	Wu Wei Zi	Nourishes Kidney Yin, Inhibits Leakage of Lung Qi, Produces Fluids, Calms the Spirit, Excess Sweating, Asthma, Diarrhea, Liver Disease	Quiets the spirit and calms the heart	For early morning diarrhea	For night sweats or spontaneous sweating	For shortness of breath and night sweats	For wheezing and calming				
508	Lady's Slipper	Cypripedium Pubescens		Antispasmodic, Nervine, Tonic, Headache, Neuralgia	For post-concussion syndrome								
242	Schizonepeta	Schizonepeta Tenuifolia Herba seu Flos	Jing Jie	Releases the Exterior, Expels Wind, Vents Rashes, Alleviates Itching, Carbuncles, Boils	For obstructed phlegm with cough	For itchy, dry skin							
243	Scrophularia	Scrophularia Ningpoensis Radix	Xuan Shen	Clears Heat, Nourishes the Yin, Drains Fire, Clears Toxicity, Swollen Glands, Sore Throat, Carbuncles	For fever and swollen glands								
244	Scute	Scutelaria Baicalensis Radix	Huang Qin	Clears Heat and Drains Fire, Clears Damp/Heat in Stomach or Intestines, Bleeding, Calms the Fetus	For cough with yellow mucous								
245	Scutellaria	Scutellaria Barbata Herba	Ban Zhi Lian	Clears Heat, Relieves Toxicity, Activates the Blood, Reduces Swellings, Hepatitis, Cancer									
246	Sesame seed, black	Sesamum Indicum Semen	Hei Zhi Ma	Nourishes the Liver and Kidneys, Moistens the Body Tissues, Constipation, Promotes Lactation	For lubricating the intestines, combine with Ophiopogon &leftpar;Mai Men Dong&rightpar;								
247	Siler	Ledebouriella Sesloides Radix	Fang Feng	Expels Wind/Dampness, Releases the Exterior, Relieves Pain, Headaches, Rheumatism	For joint pain and fatigue	For joint aches and pain during a febrile disease							
248	Sophora	Sophora Flavescentis Radix	Ku Shen	Clears Heat, Dries Dampness, Nourishes the Yin, Urination Difficulty, Use Caution with Weak Persons									
249	Sparganium	Sparganium Stoloniferum Rhizoma	San Leng	Strongly Activates the Blood, Moves the Chi, Masses, Gynecology, Severe Abdominal Pain									
250	Stemona	Stemona Sessilifolia Radix	Bai Bu	Moistens the Lungs, Suppresses Cough, Chronic Bronchitis, Tuberculosis, Whooping Cough, Lice									
251	Swallowwort root	Cynanchum Atratum Radix	Bai Wei	Relieves Toxicity, Clears Heat, Cools the Blood, Toxic Sores, Snake Bites,									
252	Talc	Talcum	Hua Shi	Promotes Urination, Drains Heat from the Bladder, Hot Painful Urinary Dysfunction	Drains vigorous heat and alleviates burning urination								
302	Buchu	Barosma Betulina		Diuretic, Bladder and Kidney Tonic, Inflammation	Releases toxins via the kidneys and bladder	For additional tonic effect on the bladder and kidneys							
303	Buckthorn bark	Rhamnus Frangula		Laxative, Cathartic, Tonic	For additional cleansing activity								
253	Tang Kuei	Angelica Sinensis, Corpus Radix	Dang Gui	Nourishes the Blood, Invigorates the Blood, Regulates the Menstruation, Abdominal Pain, Gynecology	For weak and tired blood, fatigue	Nourishes the blood and calms the heart	For fatigue and weak blood, and calms the heart	For blood deficiency and coughing at night	For replenishing the blood				
254	Tangerine peel	Citrus Reticulata Pericarpium Rubrum	Ju Hong Pi	Redirects the Chi Downward, Transforms Phlegm, Dries Dampness, Vomiting, Belching, Wet Coughs									
255	Torryea seed	Torreya Grandis Semen	Fei Zi	Kills Parasites									
256	Tribulus	Tribuli Terrestris Fructus	Bai Ji Li	Calms the Liver, Anchors the Yang, Benefits the Eyes, Dispels Wind, Promotes Lactation, Stops Itching	To alleviate itching								
257	Trichosanthes fruit	Trichosanthes Kirilowii Fructus	Gua Lou	Clears Lung Heat, Transforms Hot Phlegm, Dissipates Nodules, Cough with Thick Sputum, Abscesses									
258	Trichosanthes peel	Trichosanthes Kirilowii Fructus Pericarpium	Gua Lou Pi	Clears Lungs, Transforms Phlegm, Regulates the Chi, Dry Cough and Throat, Very Sticky Sputum									
259	Trichosanthes root	Trichosanthes Kirilowii Radix	Tian Hua Fen	Clears and Drains Lung and Stomach Heat, Abscesses									
260	Trichosanthes seed	Trichosanthes Kirilowii Semen	Gua Lou Ren	Clears Lungs and Transforms Hot Phlegm, Cools and Moistens the Lungs and Intestines, Dry Constipation									
261	Turmeric	Curcuma Longa Rhizoma	Jiang Huang	Activates the Blood, Gynecology, Relieves Pain, Injury, Moves the Qi, Expels Wind, for Shoulders	For pain in the shoulders and upper body								
262	Typha &leftpar;Cattail pollen&rightpar;	Typha Angustifolia & Latifolia Pollen	Pu Huang	Arrests Bleeding, Activates the Blood, Dysmenorrhea, Relieves Pain in the Lower Abdomen, Dizziness									
263	Vaccaria	Vaccaria Segetalis Semen	Wang Bu Liu Xing	Activates the Blood, Promotes Lactation, Unblocks Menstruation, Painful Breasts and Testicles									
264	Violet &leftpar;Viola&rightpar;	Viola Yedoensis Herba Cum Radix	Zi Hua Di Ding	Clears Heat, Relieves Fire Toxicity, Scrofula, Swollen Eyes, Mumps, Sore Throat, Earache, Abscesses	For boils and inflamed skin pores	For boils and hard carbuncles							
265	Vitex	Viticum Fructus	Man Jing Zi	Disperse Wind/Heat, Headache, Eye Pain, Excessive Tearing, Swollen Eyes									
266	Wild Indigo &leftpar;Baptisia&rightpar;	Indigo Pulverata Levis	Qing Dai	Clears Heat, Relieves Toxicity, Cools the Blood, Disperses Swellings, Sore Throat, Mumps	For chronic infections, clears toxic heat	Clears toxicity from the blood and disperses swelling	If indications of infection are present	For stubborn infections					
267	Xanthium	Xanthii Caulis et Folium	Cang Er Zi	Disperses Wind, Dispels Dampness, Opens the Nasal Passages, Headache back of Neck, Sinusitis									
268	Zedoaria	Curcuma Zedoaria Rhizoma	E Zhu	Breaks Up Blood Stagnation, Moves the Chi, Gynecology, Abdominal Masses, Relieves Pain									
269	Zizyphus	Zizyphus Spinosa Semen	Suan Zao Ren	Nourishes the Heart and Liver Blood, Calms the Spirit, Insomnia, Palpitations, Excess Sweating	For palpitations and insomnia	For insomnia, anxiousness, combines well with Hoelen &leftpar;Fu Shen&rightpar;							
270	Aconite &leftpar;Homeopathic&rightpar;	Acontium Napellus		Anti-inflammatory, Analgesic, Relaxant									
271	Agrimony, Western	Agrimonia Eupatoria		Tonifies Digestive Tract, Clears Heat and Mucous									
272	Aloe Vera, Western	Aloe Vera Herba		Purgative, Anthelmintic, Lower Bowel									
273	Angelica	Angelica Archangelica		Aromatic, Carminative, Restoring, Warming, Relaxant	Digestive support for the weak or elderly	For additional warming of the the kidneys and digestive system							
274	Arnica	Arnica Montana		Vulnerary, Stimulant, Bruising &leftpar;NOT ON BROKEN SKIN&rightpar;									
275	Arrowroot	Maranta Arundinacea		Demulcent, Nutritive, Vulnerary									
276	Asafoetida	Ferula Asafoetida		Antispasmodic, Calms Gastric Irritation									
277	Ashwaganda	Withania Somnifera		Adaptogenic Tonic, Nervine, Aphrodisiac	For stress, fatigue, and burn out	For exhaustion due to continued stress							
278	Balm of Gilead	Populus Balsamifera		Clears Mucous, Respiratory Affections									
279	Barberry	Berberis Vulgaris		Tonic, Antiseptic, Clears Liver, Mild Purgative	For additional clearing of the liver and stimulating the bowels								
280	Basil	Ocimum Basilicum		Aromatic, Carminative, Cooling, Nervine, Vermifuge									
281	Bayberry	Myrica Cerifera		Astringent, Tonic, Circulatory Tonic, Digestive Aid	Astringent tonic effect on the GI tract and improved blood circulation								
283	Bellis &leftpar;Daisy&rightpar;	Bellis Perennis		Vulnerary, Clears Eyes, Heals Wounds, Conjunctivitis									
284	Benzoin	Styrax Benzoin		Healing, Cleansing to Wounds, Sores									
285	Beth Root	Trillium Erectum		Astringent Tonic, Female Prolonged Bleeding	Specific for continuous uterine spotting								
286	Bilberry	Vaccinium Myrtillus		Astringent, Cooling, Strengthens Eyes									
287	Bistort	Polygonurn Bistorta		Astringent For Hemorrhage, Loose Teeth, Gum Disease									
288	Black Cohosh	Cimicufuga Racemosa		Menopause, Hot Flashes, Astringent, Trapezius Pain	Promotes labor, use only if labor is overdue	For hot flashes, sore muscles							
289	Black Haw	Viburnum Prunifolium		Antispasmodic, Prevents Miscarriage	specific for habitual miscarriage								
290	Black Walnut	Juglans Nigra		Alterative, Detergent, Vermifuge, Depurative									
291	Black Willow	Salyx Nigra		Sexual Sedative, Spermatorrhea									
292	Blackberry root	Rubus Villosus		Astringent, Tonic, Diarrhoea, Dysentery									
293	Bladderwrack	Fucus Vesiculosus		Clears Lymph, Tones Thyroid, Obesity, Hypothyroidism	Specific for hypothyroid	For clearing action and tonic	Protects the thyroid from radiation						
294	Bloodroot	Sanguinaria Canadensis		Stimulant, Tonic, Expectorant									
295	Blue Cohosh	Caulophyllum Thalictroides		Promotes Partuition, Birthing Aid									
296	Blue Flag	Iris Versicolor		Alterative, Diuretic, Carminative, Bilious Headache	For digestive headaches								
297	Boldo	Peumus Boldus		Clears Liver and Gallbladder, Useful for Obesity									
298	Boneset	Eupatorium Perfoliatum		Diaphoretic, Febrifuge, Fevers and Influenza, Body Aches									
299	Borage	Borago Officinalis		Lifts the Spirit, Supports Adrenals and Heart, Allays Fears	For enhancing the will power, courage	For strengthening the kidneys and adrenal glands	To help promote inner courage and strengthen the adrenal cortex						
300	Borax	Boron		Decongestant, Throat mucous, Promotes Hair growth									
305	Burdock root	Arctium Lappa		Aterative, Diuretic, Blood Purifier	For blood purification	For cleansing of the blood							
306	Butcher's Broom	Butchers Broom		Deobstruent, Aperient, Diuretic, Diaphoretic, Obesity									
307	Butterbur	Petasites Japonica		Cardiac Tonic, Diuretic, Stimulant									
308	Cactus Grandiflorus	Cereus Grandiflorus		Cardiac Tonic, Angina, Palpitation, Neuralgia of the Heart									
309	Cajeput	Melaleuca Cajeputii		Stimulant, Antispasmodic, Diaphoretic, Analgesic									
310	Calendula	Calendula Officinalis		Vulnerary, Anti-fungal, Healing Wounds and Ulcers	Specific for measles								
311	Camphor	Cinnamonum Camphora		Sedative, Anodyne, Anthelmintic, Antispasmodic									
312	Cascara Sagrada	Rhamnus Purshiana		Laxative, Tonic, Constipation, Dyspepsia	For sluggish bowels and constipation &leftpar;use for short term only&rightpar;	For sluggish bowels &leftpar;use for short term&rightpar;							
313	Cats Claw	Uncaria Tomentosa		Alterative, Deobstruent, Depurative, Anti-arthritic									
314	Catnip	Nepata Cataria		Carminative, Tonic, Diaphoretic, Refrigerant									
315	Catuaba	Erythroxylum Catuaba		Nervine, Tonic, Sedative, Mental Stimulant, Aphrodisiac									
316	Cayenne	Capsicum Frutes		Heating, Stimulant, Equalizes Circulation									
317	Celandine, Greater	Chelidonium Majus		Alterative, Clears Liver and Gallbladder, Gallstones									
318	Centuary	Centaurium Erythraea		Aromatic, Nutritive, Tonic, Digestive Support	A digestive stimulant, promotes bile function								
319	Chamomile, German	Matricaria Recutita		Sedative, Tonic, Fractious Irritability, Teething Babies	Soothes and calms the baby								
320	Chamomile, Roman	Anthemis Nobilis		Harmonizes Digestion, Relaxant, Tonic, Nervine	For a nervous stomach and poor digestion	Calms the nerves, quiets the stomach	For 'milk fever', painful breasts and mastitis	For general tonic qualities and nerve strengthening	For calming and upset stomach	Digestive aid and calming			
321	Chaparral	Larrea Mexicana		Anti-inflammatory, Anodyne, Cleansing									
322	Chaste Tree Berry	Vitex Agnus-Castus		Restorative, Female Hormonal Balancer									
323	Chickweed	Stellaria Media		Demulcent, Vulnerary, Reduces Appetite, Heals Wounds									
324	Cinchona	Cinchona Calisaya		General Tonic in Debility, Intermittant Fevers, Malaria									
325	Clavo Huasco	Tynanthus Panurensis		Aphrodisiac, Tonic, Nervine									
326	Cleavers	Galium Aparine		Diuretic, Tonic, Clearing to Kidneys, Blood and Lymph	For diuretic and lymphatic cleansing								
327	Coltsfoot, Western	Tussilago Farfara		Expectorant, Demulcent, Clears Cough and Mucous	For chronic cough								
329	Comfrey leaf	Symphytum Officinale		Vulnerary, Styptic, Heals Wounds and Bones, Bruises									
330	Comfrey root	Symphytum Officinale		Vulnerary, Demulcent, Astringent, Nutritive									
331	Corn Silk, Western	Zea Mays		Demulcent, Diuretic, Bladder Affections, Cystitis									
332	Cotton Root	Gossypium Herbaceum		Emmenagogue, Parturient, Oxytocic	Promotes labor, use only if labor is overdue								
333	Couch Grass	Agropyron Repens		Diuretic, Demulcent, Cystitis, Arthritis and Rheumatism									
334	Cowslip	Primula Veris		Sedative, Antispasmodic, Insomnia, Restlessness									
335	Cramp Bark	Viburnum Opulus		Antispasmodic, Nervine, Cramps, Convulsions, Spasms	For spasms and muscular cramps	For spasms in throat or muscles	For abdominal cramps, combine with Wild Yam &leftpar;Dioscorea Villosa&rightpar;						
336	Cranesbill, American	Geranium Maculatum		Styptic, Astringent, Tonic, Diarrhea, Bleeding	Astringent, stops excess bleeding	For additional astringent and toning actions							
337	Crawley Root	Corallorhiza Odontorhiza		Diaphoretic, Sedative, Febrifuge, Fevers, Influenza									
338	Culver	Leptandra Virginica		Hepatic, Antiseptic, Aperient, Clears Liver and Bowel	For gentle clearing action of liver and bowel								
339	Damiana	Turnera Diffusa		Aphrodisiac, Diuretic, Nervine, Tonic	A nerve tonic with aphrodisiac qualities								
340	Dandelion, Western	Taraxacum Officinale		Diuretic, Aperient, Clears Liver, Kidneys and Bowel									
341	Devils Claw	Harpagophytum Procumbens		Osteoarthritis, Anti-inflammatory, Digestive, Vulnerary									
342	Millettia	Spatholobus suberectus radix et caulis	Ji Xue Teng	Moves and Nourishes the Blood, Gynecology, Relieves Pain, Numbness, Paralysis, Leukopenia	For bone marrow suppression and leukopenia	For soreness in the joints							
343	Elder Flowers	Sambucus Nigra		Alterative, Diuretic, Diaphoretic, Colds, Influenza, Fevers	If fever is present, take as a hot infusion	For eye inflammation with sinusitis							
344	Elecampane	Inula Helenium		Expectorant, Diaphoretic, Clears Mucous, Cough, Colds	For lung infections and mucous congestion	For deep seated mucous							
345	Euphorbia	Euphorbia Pilulifera		Anti-asthmatic, Pectoral, Cough, Asthma									
346	Eyebright	Euphrasia Officinalis		Tonic, Astringent, Hayfever, Eye Affections	For watery eyes								
347	False Unicorn	Chamaelirium Luteum		Tonic, Diuretic, Restorative, Female Reproductive Tonic	For prolapsed uterus and bladder in women								
348	Fennel, Western	Foeniculum Vulgare		Carminative, Stomachic, Digestive Aid, Intestinal Gas									
349	Fenugreek	Trigonella Foenum-Graecum		Carminative, Aromatic, Digestive Aid, Clears Mucous									
350	Feverfew	Tanacetum Parthenium		Carminative, Digestive Aid, Headache, Migraine									
351	Figwort	Scrophularia Nodosa		Depurative, Anodyne, Clears Blood and Lymph	For blood and lymph cleansing, resolves lumps								
352	Fringe Tree Bark	Cheonanthus Virginicus		Alterative, Diuretic, Clears Liver, Kidneys and Blood	For additional cleansing of the liver								
353	Garlic	Allium Sativum		Antiseptic, Expectorant, Diaphoretic, Coughs, Colds	To clear toxic/heat	Prophylactic for flu and contagious diseases							
354	Gelsemium	Gelsemium Sempervirens		Antispasmodic, Anodyne, Sedative, Nerve Pain									
355	Gentian, Western	Gentiana Lutea		Tonic, Bitter, Restorative, Weakness, Debility, Anemia	For debility, weakness, poor nutrient assimilation	For poor circulation due to inadequate diet or impaired nutritional assimilation	For improved nutritional assimilation and anemia	For additional digestive and assimilation qualities	A digestive and liver tonic	Boosts the energy and cleanses the liver	To help nursing mother's nutritional absorption and blood quality	General body tonic and improves digestion	
356	Ginkgo leaf	Ginkgo Biloba		Circulatory, Pulmonary, Cough, Mucous, Tinnitus, Memory									
357	Goat's Rue	Galega Officinalis		Galactagogue, Vermifuge, Promotes Milk, Clears Worms									
358	Golden Rod	Solidago Virgaurea		Aromatic, Carminative, Digestive Aid, Hepatic									
359	Goldenseal	Hydrastis Canadensis		Tonic, Detergent, Restorative to Immune System, Cleanser	Promotes labor, use only if labor is overdue	For immune support and nourishment of the mucous membranes	For toning of the intestinal mucous membranes	To tone the internal tissues	For irritated mucous membranes				
360	Gotu Kola	Hydrocotyle Asiatica		Tonic, Mental and Physical Fatigue, Aids Brain Function									
361	Grindelia	Grindelia Robusta		Anti-asthmatic Tonic, Whooping-Cough, Asthma, Spleen Support									
362	Guaiacum	Guaiacum Officinale		Alterative, Arthritis Specific, Clears Blood									
363	Harakeke	Phormium Tenax		Vulnerary, Astringent, Emmenagogue, Anti-fungal									
364	Hawthorn berry	Crataegus Spp.		Cardiac, Tonic, High Blood Pressure, Heart Conditions	For edema due to a weakened heart	For debility and weakness due to a weak heart	For cough and a weakened heart condition	Nurtures the physical and spiritual heart					
365	Heartsease	Viola Tricolor		Diaphoretic, Diuretic, Palpitations, Clears Mucous	For heart palpitations	For palpitations and emotional agitation							
366	Holy Thistle	Cnicus Benedictus		Tonic, Galactagogue, Promotes Milk Supply, Digestive									
367	Hops	Humulus Lupulus		Sedative, Tonic, Anodyne, Indigestion, Insomnia, Debility	For nervous dyspepsia								
368	Horehound	Marrubium Vulgare		Tonic, Expectorant, Coughs, Colds, Loss of Appetite									
369	Horopito	Pseudowintera Colorata		Anodyne, Anti-fungal, Analgesic, Alterative, Depurative									
370	Horse Chestnut	Aesculus Hippocastanum		Tonic, Astringent, Anodyne, Painful Hemorrhoids, Specific									
371	Horseradish	Cochlearia Armoracia		Stimulant, Diaphoretic, Diuretic, Digestive Aid, Sinusitis									
372	Horsetail	Equisetum Arvense		Diuretic, Astringent, Heals Wounds, Stops Bleeding									
373	Hydrangea	Hydrangea Arborescens		HDiuretic, Nephritic, Removes Stone and Gravel	For painful swollen joints, especially knees	For clearing action and diuretic							
374	Ipecacuanha	Cephaelis Ipecacuanha		Emetic, Expectorant, &leftpar;Homeopathic  Anti-Emetic&rightpar;									
375	Jaborandi	Pilocarpus Spp.		Stimulant, Deobstruent, Asthma, Diabetes, Clears Lymph	For the mumps	For chronic lymph swelling and mumps							
376	Jamaica Dogwood	Piscidia Piscipula		Anodyne, Sedative, Eases Pains, Promotes Sleep	For additional pain relief in all conditions; combine with White Willow Bark &leftpar;Salix Alba&rightpar;								
377	Jambul	Eugenia Jambolana		JaAstringent, Diuretic, Diabetes, Specific Reduces Sugar									
378	Juniper Berry	Juniperus Communis		Diuretic, , Stimulant, Carminative, Kidney Complaints									
379	Kapikachu	Mucuna Pruriens		Aphrodisiac, Nervine, Tonic, Anthelmintic, Sexual Aid									
380	Karamu	Coprosma Robusta		Diuretic, Anti-inflammatory, Febrifuge, Antibilious									
381	Kareao	Ripogonum Scandens		Diuretic, Alterative, Depurative, Vulnerary									
382	Kauri	Agathis Vitiensis		Tonic, Relaxant, Strengthens Body and Mind									
383	Kava Kava &leftpar;Fiji&rightpar;	Piper Methysticum		Tonic, Diuretic, Nocturnal Incontinence, Muscular Tonic									
384	Kawa Kawa &leftpar;New Zealand&rightpar;	Piper Methysticum		Aphrodisiac, Alterative, Tonic, Depurative									
385	Kohe Kohe	Dysoxylum Spectabile		Pectoral, Tonic, Alterative, Astringent, Fevers, Clearing									
386	Kola Vera	Kola Vera		Nerve Stimulant, Cardiac Tonic, Low Blood Pressure									
387	Koromiko	Hebe Salicifolia		Astringent, Tonic, Diarrhoea, Dysentry									
388	Kowhai	Sophora Microphylla		Tonic, Alterative, Vulnerary, Analgesic, Anti-fungal									
389	Kumarahoe	Pomaderris Kum		Alterative, Pectoral, Asthma, Bronchitis, Tuberculosis									
390	Lady's Mantle	Alchemilla Vulgaris		Astringent, Styptic, Reduces Excessive Female Bleeding	Helps to balance the female hormones and regulates menstruation								
391	Lady	Cypripedium Pubescens		Antispasmodic, Nervine, Tonic, Headache, Neuralgia	For post-concussion syndrome								
392	Lavender	Lavendula Officinale		Stimulant, Carminative, Aromatic									
393	Lemon	Citrus Limonum		Tonic, Refrigerant, Antiscorbutic, Antibilious, Fevers									
394	Lemon Balm	Melissa Officinalis		Carminative, Diaphoretic, Sedative, Insomnia, Fevers									
395	Leptotaenia	Lomatium dissecutim		Anti-viral, Pneumonia, Flu, Colds, Bronchitis, Herpes									
396	Life Root	Senecio Aureus		Emmenagogue, Diuretic, Tonic, Suppressed Menstruation									
397	Lilly-of-the-Valley	Convallaria Majalis		Cardiac Tonic, Diuretic, Valvular Heart Disease									
398	Lime Flower	Tilia Europea		Nervine, Relaxant, Headache, High Blood Pressure									
399	Lobelia, Western	Lobelia Inflata		Anti-asthmatic, Expectorant, Emetic, Spasmodic Cough	Specific for tobacco addiction	Use sub-lingually, for spasmodic cough							
400	Lungwort	Pulmonaria Officinalis		Astringent, Mucilaginous, Pectoral, Cough, Heals Lungs									
401	Maca	Lepidium Meyenii		Aphrodisiac, Tonic, Steroidal, Nutritive									
402	Manawa	Tradescan Tia Fluminensis		Relaxant, Tonic, Promotes sense of wellbeing &leftpar;Homepathic&rightpar;									
403	Mandrake, American	Podophyllum Peltatum		Purgative, Antibilious, Liver Dysfunction, Constipation									
404	Marshmallow	Althea Officinalis		Demulcent, Emollient, Anti-inflammatory, Soothing	Softens and moistens the inner tissues	Brings relief to the bronchial tubes and irritated mucous membranes	For lubrication of the mucous membranes	Soothes and balances he mucous membranes of the GI tract					
405	Matai	Prumnopitys Traxilohia		Antiseptic, Pulmonary, Anodyne, Stomachic									
406	Meadowsweet	Filipendula Ulmaria		Astringent, Diuretic, Aromatic, Balances Acidic Levels	For associated over-acidic conditions	For balancing the pH of the body	For pain and is an antacid						
407	Melilot	Melilotus Officinalis		Venous Tonic, Varicose Veins, Raynauds, Digestive									
408	Mezereum &leftpar;Homeopathic&rightpar;	Daphne Mezereum		Anti-inflammatory, Arthritis, Eczema, Skin Ulcers									
409	Milk Thistle	Silybum Marianum		Hepatic, Tonic, Restorative, Clears and Restores Liver	For liver cleansing and restorative								
410	Mistletoe &leftpar;European&rightpar;	Viscum Album		Nerve Tonic, Antispasmodic, Stress, Epilepsy	Alleviates stress, a factor in asthma attacks	For nourishing the nervous system, especially those who eat their stress	For emotions that are stored, held-in	For anxiety and stress					
411	Motherwort, Western	Leonurus Cardiaca		Antispasmodic, Tonic, Nervine, Clears Melancholy	Emotionally, softens a hardened heart	Relaxes tension from stress, calming	For melancholy and sadness	For a calm spirit and happy thoughts					
412	Muira Puama	Liriosma Ovata		Aphrodisiac, Nerve Stimulant	For weak libido and strengthens the nerves								
413	Mullein	Verbascum Thapsus		Demulcent, Astringent, Pectoral, Sinusitis, Earache	Clears mucous from the head region								
414	Myrrh, Western	Commiphora Myrrha		Healing Agent, Antiseptic, Mouth Ulcers, Sore Throat									
415	Nettles	Urtica Spp.		Diuretic, Astringent, Blood Tonic, Anaemia, Poor Apetite	For anemia and a weak appetite	For blood cleansing, burning pains, and inflammation	For weak blood, anemia						
416	Oak Bark	Quercus Spp.		Strong Astringent, Mild Tonic, Dysentry, Alcohol Abuse									
417	Oats, wild	Avena Sativa		Nerve Tonic, Restorative, Exhaustion, Antispasmodic	A nerve tonic and supplements the energy	For support of the nervous system	For nervous system support and physical exhaustion	Restorative, fortifies the nerves	Helps restore the body and nervous system	To support the nervous system, when exhausted from pain	To support the nervous system, when exhausted from dealing with pain	For exhaustion and general fatigue	For nervous exhaustion
418	Orange	Citrus Sinensis		Aromatic, Carminative, Tonic, Stomachic									
419	Oregon Grape	Mahonia Aquifolium		Alterative, Tonic, Hepatic, Scaly Skin Disorders									
420	Osha &leftpar;Bear root&rightpar;	Ligusticum Porteri		Alterative, Diaphoretic, Respiratory Affections, Protection									
421	Parsley Piert	Alchemilla Arvensis		Demulcent, Diuretic, Kidney Pain, Gravel and Stone	For assistance with gravel or stones								
422	Parsley Piert	Alchemilla Arvensis		Demulcent, Diuretic, Kidney Pain, Gravel and Stone									
423	Passion Flower	Passiflora Incarnata		Antispasmodic, Sedative, Insomnia, Anxiety									
424	Pau D'arco	Tabebuia Avellanedae		Alterative, Depurative, Anti-Inflammatory, Astringent									
425	Peach Leaf	Prunus Persica		Clears Congestion, Hepatic, Diuretic, Expectorant									
426	Pennyroyal	Mentha Puligeum		Insecticide, Emenagogue, Carminative, Diaphoretic									
427	Peppermint, Western	Mentha Piperita		Promotes Sweating, Aids Digestion, Clears Colds									
428	Periwinkle	Vinca Minor		Astringent, Tonic, Vulnerary, Anti-hemorrhagic, Diabetes									
429	Pilewort &leftpar;Celandine, Lesser&rightpar;	Ranunculus Ficaria		Piles, Astringent									
430	Plantain	Plantago Spp.		Alterative, Diuretic, Vulnerary, Cooling, Healing Agent									
431	Pleurisy Root	Asclepias Tuberosa		Antispasmodic, Diaphoretic, Expectorant, Bronchitis									
432	Poison Ivy or Oak &leftpar;Homeopathic&rightpar;	Rhus Toxicodendron		Backache, Sciatica, Restless Leg Syndrome, Gout, Carpal Tunnel Syndrome									
433	Poke Root	Phytolacca Spp.		Alterative, Depurative, Deobstruent, Swollen Lymph Node	For cleansing the blood and lymph								
434	Prickly Ash	Zanthoxylum Americanum		Alterative, Stimulant, Diaphoretic, Arthritis, Rheumatism									
435	Propolis	Resina Propoli		Protective, Vulnerary, Cleansing Agent									
436	Puka	Meryta Sinclairii		Tonic, Emmenagogue, Hormonal Balancer									
437	Pukatea	Laurelia Novae-		Anodyne, Analgesic, Alterative, Toothache, Ulcers									
438	Puriri	Vitex Lucens		Vulnerary, Germicide, Sore Throat, Sprains, Backache									
439	Quassia	Quassia Amara		Anthelmintic, Tonic, Bitter, Anemia, Anorexia	Assimilation and appetite enhancement								
440	Raspberry Leaf	Rubus Idaeus		Astringent, Stimulant, Tonic, Incontinence,	Astringent and tonic, strengthens the abdominal muscles	For harmone balancing and astringent							
441	Red Clover	Trifolium Pratense		Alterative, Sedative, Bronchial Cough, Clearing	For blood cleansing and anti-tumor activity								
442	Red Root	Ceanothus Fendeleri		Astringent, Expectorant, Antispasmodic, Mouthwash									
443	Red Sage	Salvia Colorata		Astringent, Aromatic, Gargle,  Laryngitis, Tonsilitis									
444	Rhatany Root	Krameria Triandra		Astringent, Tonic, Spongy Bleeding Gums, Mucous									
445	Rosemary	Rosmarinus Officinalis		Nervine, Astringent, Diaphoretic, Stomachic, Nerve Pain									
446	Rue	Ruta Graveolens		Stimulant, Antispasmodic, Emmenagogue, Bone Pain	Homeopathic: Specific for bone pain and bruising								
447	Sage	Salvia Officinalis		Aromatic, Stimulant, Gargle for Sore Throat, Laryngitis									
448	Sarsaparilla	Smilax Officinalis		Tonic, Alterative, Depurative, Anti-viral, Anti-bacterial	For muscle enhancement and blood cleansing	For building muscle tissue	For increase of energy	For cleansing and testosterone support					
449	Sassafras	Sassafras Albidum		Stimulant, Diaphoretic, Diuretic, Skin Eruptions									
450	Saw Palmetto	Serenoa Serrulata		Nutritive Tonic, Diuretic, Sedative, Builds Muscle Tissue	For muscular strength and increased vitality								
451	Senna	Senna Angustifolia		Laxative, Cathartic, Constipation									
452	Sheep's Sorrel	Rumex Acetosella		Refrigerant, Diuretic, Diaphoretic, Cools Fevers									
453	Shepherd's Purse	Capsella Bursa-Pastoris		Stimulant, Diuretic, Astringent, Diarrhea, Heavy Menses	For excessive or extended bleeding	For bleeding with the passing of the stone	For bloody and dreggy urine	For kidney support with cleansing and astringent qualities	Arrests bleeding				
454	Shilajit	Asphaltum		Alterative, Diuretic, Antiseptic, Rejuvenative, Aphrodisiac									
455	Skullcap	Scutellaria Lateriflora		Tonic, Nervine, Antispasmodic, Astringent, Analgesic	For nervous tension and pain relief	For a nervous stomach	Calms, benefits stress and nervous tension	Calming to the nervous system, especially if \tfear is a factor	If emotional stress is a contributing factor for constipation	Nervous restorative, for a fearful personality	Helps to relieve anxiety and stress		
456	Slippery Elm	Ulmus Fulva		Demulcent, Emollient, Vulnerary, Nutritive, Pectoral	For inflammation of the tissues in the digestive tract								
457	Southernwood	Artemisia Abrotanum		Stimulant, Emmenagogue, Antiseptic, Detergent									
458	Spearmint	Mentha Spicata		Stimulant, Carninative, Antispasmodic									
459	Squaw Vine	Mitchella Repens		Parturient, Diuretic, Astringent, Uterine Tonic									
460	St. John's Wort	Hypericum Perforatum		Nerve Anodyne, Anti-Depressant, Astringent, Diuretic									
461	Staphisagria	Delphinium Staphisagria		Vermifuge, Parasiticide, Insecticide, Destroys Lice	For anxiety with marked irritability								
462	Stillingia &leftpar;Queen's Delight&rightpar;	Stillingia Sylvatica		Alterative, Tonic, Diuretic, Aperient, Acne, Clears Toxins									
463	Stone Root	Collinsonia Canadensis		Diuretic, Tonic, Stomachic, Kidney Stone and Gravel									
464	Tanekaha	Phyllocladus Trichomanoides		Hepatic, Tonic, Astringent, Gastritis, Dysentery									
465	Tansy	Tanacetum Vulgare		Anthelmintic, Tonic, Emmenagogue, Irregular Menses	Specific for menstrual irregularity								
466	Taraire	Beilschmedia Taraire		Antispasmodic, Sedative, Quietens Dreams &leftpar;Homepathic&rightpar;									
467	Tarata	Pittosporum Eugenioides		Pectoral, Antispasmodic, Expectorant, Asthma, Bronchitis									
468	Tawa	Beilschmiedia Tawa		Tonic, Pectoral, Carminative, Tonic, Stomach Pains									
469	Tea Tree	Melaleuca Alternifolia		Anti-fungal, Anti-bacterial									
470	Thuja	Thuja Occidentalis		Alterative, Anthelmintic, Expectorant, Anti-viral									
471	Tormentilla	Potentilla Tormentilla		Infections, Anodyne, Healing Wounds, Burns	To alleviate bleeding								
472	True Unicorn Root	Alteris Farinosa		Tonic, Stomachic, Debility, Female Infertility									
473	Uva Ursi	Arctostaphylos Uva Ursi		Mucilagenous, Astringent, Diuretic, Antiseptic	For increased diuretic and antiseptic actions	For flushing out toxicity via the kidneys	For fluid retention and edema	For cleansing the kidneys and pelvic area	Assists the kidneys in clearing toxins	For glaucoma	For clearing of body toxins, via the kidneys		
474	Valerian	Valeriana Officinalis		Anodyne, Antispasmodic, Nervine, Irritability, Temper	For tension and stress that expresses itself as anger	For circulation that is impeded by stiff, unbending moods and a bad temper	For a bad temper, anger, and stress	If associated pain causes loss of temper and irritability	For emotional help with temper, stress, and \t\tpain	For help with hot temper, stress, and pain	For anger and agitation		
475	Vervain	Verbena Officinalis		Nervine, Tonic, Sudorific, Antidepressive, Colds, Fevers									
476	Violet, Western	Viola Odorata		Antiseptic, Expectorant, Alerative, Depurative									
477	Wahoo	Euonymus Atropurpureus		Tonic, Alterative, Cholagogue, Aperient, Liver Disorders	For additional liver cleansing	For clearing toxins through the liver							
478	White Pond Lily	Nymphaea Odorata		Antiseptic, Astringent, Demulcent, Diarrhea									
479	White Willow Bark	Salis Alba		Anodyne, Analgesic, Tonic, Antiperiodic, Astringent	For additional pain relief, all types								
480	Wild Carrot	Daucus Carota		Diuretic, Deobstruent, Stimulant, Fluid Retention									
481	Wild Cherry Bark	Prunus Serotina		Astringent, Tonic, Pectoral, Sedative, Dry Cough									
482	Wild Indigo &leftpar;Baptisia&rightpar;, Western	Baptisia Tinctoria		Antiseptic, Stimulant, Alterative, Emmenagogue	For stubborn infections	For immune support and chronic infections							
483	Wild Lettuce	Lactuca Virosa		Anodyne, Sedative, Expectorant, Reduces Pain and Cough									
484	Wild Yam	Dioscorea Villosa		Antibilious, Antispasmodic, Diaphoretic, Hepatic	For abdominal cramps and spasms	For antispasmodic action and pain relief, especially menstrual							
485	Wintergreen	Gaultheria Promcumbens		Aromatic, Astringent, Stimulant, Anti-Arthritic	For pain relief specific to rheumatic and arthritic conditions								
486	Witch Hazel	Hamamelis Virginiana		Astringent, Tonic, Sedative, Hemorrhoids, Varicose Veins									
487	Wood Betony	Betonica Officinalis		Alterative, Astringent, Aromatic, Rheumatism, Dyspepsia									
488	Wormseed	Chenopodium Ambrosiodes		Vermifuge, Anthelmintic, Clears Intestinal Worms									
489	Wormwood	Artemisia Absinthium		Tonic, Stomachic, Febrifuge, Anthelmintic, Debility	Nutritive tonic, especially for underweight people	For debility, weight loss, and poor digestion							
490	Yarrow	Achillea Millefolium		Diaphoretic, Stimulant, Tonic, Calming, Warming	Supports the circulation	Promotes circulation, clearing of toxins, and supplements the body reserves							
491	Yellow Dock	Rumex Crispus		Alterative, Depurative, Tonic, Aperient, Clears Boils	For additional clearing of the blood and stimulating the bowels	For sluggish stools	For purifying the blood and moving the bowels						
492	Yerba Mate	Ilex Paraguaiensis		Alterative, Aperient, Astringent, Antidepressive									
493	Yerba Santa	Eriodyction glutinosum		Aromatic, Tonic, Expectorant, Bronchitis, Asthma									
494	Yohimbe	Pausinystalia Yohimbe		Aphrodisiac, Stimulant	Circulatory stimulant with aphrodisiac qualities	Enhances circulation to the sexual glands	For weak libido						
495	Atractylodes	Atractylodis Macrocephalae Rhizoma	Bai Zhu	Strengthens the Spleen, Augments the Qi, Dries Dampness, Weak Appetite, Edema, Excess Sweating	For weak digestion, loose stool	For a weak appetite and loose stool	For a loose stool and weak appetite combine with Dioscorea &leftpar;Shan Yao&rightpar;	For vomiting up phlegm					
496	Olive &leftpar;Flower Remedy&rightpar;			For emotional exhaustion									
497	Clematis &leftpar;Flower Remedy&rightpar;			To help keep the mind in the present									
498	Gorse &leftpar;Flower Remedy&rightpar;			To keep hope alive and not get lost in the negative									
499	Rock Rose &leftpar;Flower Remedy&rightpar;			For panic and anxiety									
500	Crab Apple &leftpar;Flower Remedy&rightpar;			For feelings of uncleanliness									
501	Hornbeam &leftpar;Flower Remedy&rightpar;			For lethargy, exhaustion, and weariness									
502	Chestnut	Aesculus hippocastanum		For whooping cough			Calms, benefits stress and nervous tension						
503	Fraxinus &leftpar;Homeopathic&rightpar;			For a bearing down sensation									
504	Centuary &leftpar;Flower Remedy&rightpar;			Gives too much away, cant say no!									
505	Agrimony &leftpar;Flower Remedy&rightpar;			For holding on, unable to talk things out									
506	Echinacea	Echinacea Angustifolia		Alternative, Antiseptic, Clears Blood, Infections, and Boils	For conditions with pus or other secretions	For infection or when thick mucous is present	For immune support and protection from infections	For additional cleansing and antibacterial actions	For clearing infections and building up resistance to illnesses	For clearing of eye infections	For pus-like boils	For skin lesions with pus or other secretions	
507	Pueraria		Ge Gen	Induces Perspiration, Clears Heat, Vents Rashes, Neck Stiffness, Relaxes the Muscles	For headache in the frontal region of the head								
509	Male Fern	Dryopteris filix-mas		specific for tapeworms									
510	Aquilaria		Chen Xiang	Moves Qi and Alleviates pain &leftpar;for Xu Cold or Blood Stasis patterns&rightpar;,Descends Qi and Regulates the Middle, and Aids Kidneys in Grasping Qi.	For low abdominal pain, use with Lindera &leftpar;Wu Yao&rightpar;		For abdominal cramps, combine with Wild Yam &leftpar;Dioscorea Villosa&rightpar;						
\.


--
-- Name: single_herbs_local_herb_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app
--

SELECT pg_catalog.setval('single_herbs_local_herb_id_seq', 510, true);


--
-- Data for Name: tos_order_items; Type: TABLE DATA; Schema: public; Owner: app
--

COPY tos_order_items (order_number, product_name, product_size, quantity, is_retail) FROM stdin;
\.


--
-- Data for Name: tos_order_shipping; Type: TABLE DATA; Schema: public; Owner: app
--

COPY tos_order_shipping (order_number, shipping_first_name, shipping_last_name, shipping_address_1, shipping_address_2, shipping_address_3, shipping_city, shipping_state_province, shipping_country, is_shipped, shipping_method, shpping_date) FROM stdin;
\.


--
-- Name: tos_order_shipping_local_order_number_seq; Type: SEQUENCE SET; Schema: public; Owner: app
--

SELECT pg_catalog.setval('tos_order_shipping_local_order_number_seq', 1, false);


--
-- Data for Name: tos_orders; Type: TABLE DATA; Schema: public; Owner: app
--

COPY tos_orders (order_number, is_wholesale, order_date, billing_email, billing_first_name, billing_last_name, billing_address_1, billing_address_2, billing_address_3, billing_city, billing_state_province, billing_country, billing_phone_1, billing_phone_2, order_subtotal, order_tax_total, order_total, order_discount, payment_method) FROM stdin;
\.


--
-- Name: tos_orders_local_order_number_seq; Type: SEQUENCE SET; Schema: public; Owner: app
--

SELECT pg_catalog.setval('tos_orders_local_order_number_seq', 1, false);


--
-- Data for Name: wholesale_size_price; Type: TABLE DATA; Schema: public; Owner: app
--

COPY wholesale_size_price (category_id, size, price) FROM stdin;
1	2 oz	4.9500
8	1 oz	4.4500
6	1 oz	4.4500
3	2.5 oz	6.5500
2	1 oz	5.9500
4	1 oz	4.9500
3	.75 oz	4.4500
9	2.5 oz	6.5500
2	4 oz	11.9500
2	8 oz	22.9500
5	1 oz	4.4500
8	8 oz	6.5500
7	1 oz	4.4500
10	1 oz	4.4500
12	4 oz	11.9500
12	8 oz	22.9500
12	1 oz	5.9500
11	1 oz	4.4500
13	4 oz	11.9500
14	8 oz	6.9500
15	1 oz	4.4500
16	1 oz	4.4500
17	8 oz	6.9500
18	4 oz	5.9500
19	4 oz	3.9500
20	12 oz	5.9500
21	2 oz	4.7500
27	4 oz	5.9500
9	.75 oz	4.4500
28	4 oz	11.9500
29	1 oz	5.9500
30	8 oz	22.9500
32	2.5 oz	6.5500
31	2.5 oz	6.5500
33	.75 oz	4.4500
34	.75 oz	4.4500
34	.75 oz	4.4500
36	4 oz	5.9500
35	2 oz	4.9500
37	1 oz	4.4500
38	1 oz	4.4500
39	2 oz	4.9500
\.


--
-- Name: contra_indications_local_pkey; Type: CONSTRAINT; Schema: public; Owner: app; Tablespace: 
--

ALTER TABLE ONLY contra_indications
    ADD CONSTRAINT contra_indications_local_pkey PRIMARY KEY (id);


--
-- Name: health_category_local_pkey; Type: CONSTRAINT; Schema: public; Owner: app; Tablespace: 
--

ALTER TABLE ONLY health_category
    ADD CONSTRAINT health_category_local_pkey PRIMARY KEY (id);


--
-- Name: permission_local_pkey; Type: CONSTRAINT; Schema: public; Owner: app; Tablespace: 
--

ALTER TABLE ONLY bluejayusers
    ADD CONSTRAINT permission_local_pkey PRIMARY KEY ("ID");


--
-- Name: primary-key; Type: CONSTRAINT; Schema: public; Owner: app; Tablespace: 
--

ALTER TABLE ONLY single_herb_side_effects
    ADD CONSTRAINT "primary-key" PRIMARY KEY (side_effects_id);


--
-- Name: product_category_local_pkey; Type: CONSTRAINT; Schema: public; Owner: app; Tablespace: 
--

ALTER TABLE ONLY product_category
    ADD CONSTRAINT product_category_local_pkey PRIMARY KEY (id);


--
-- Name: products_local_pkey; Type: CONSTRAINT; Schema: public; Owner: app; Tablespace: 
--

ALTER TABLE ONLY products
    ADD CONSTRAINT products_local_pkey PRIMARY KEY ("productID");


--
-- Name: sample_indications_local_pkey; Type: CONSTRAINT; Schema: public; Owner: app; Tablespace: 
--

ALTER TABLE ONLY sample_indications
    ADD CONSTRAINT sample_indications_local_pkey PRIMARY KEY (id);


--
-- Name: side_effects_local_pkey; Type: CONSTRAINT; Schema: public; Owner: app; Tablespace: 
--

ALTER TABLE ONLY side_effects
    ADD CONSTRAINT side_effects_local_pkey PRIMARY KEY (id);


--
-- Name: single_herbs_local_pkey; Type: CONSTRAINT; Schema: public; Owner: app; Tablespace: 
--

ALTER TABLE ONLY single_herbs
    ADD CONSTRAINT single_herbs_local_pkey PRIMARY KEY (herb_id);


--
-- Name: tos_order_items_local_pkey; Type: CONSTRAINT; Schema: public; Owner: app; Tablespace: 
--

ALTER TABLE ONLY tos_order_items
    ADD CONSTRAINT tos_order_items_local_pkey PRIMARY KEY (order_number);


--
-- Name: tos_order_shipping_local_pkey; Type: CONSTRAINT; Schema: public; Owner: app; Tablespace: 
--

ALTER TABLE ONLY tos_order_shipping
    ADD CONSTRAINT tos_order_shipping_local_pkey PRIMARY KEY (order_number);


--
-- Name: tos_orders_local_pkey; Type: CONSTRAINT; Schema: public; Owner: app; Tablespace: 
--

ALTER TABLE ONLY tos_orders
    ADD CONSTRAINT tos_orders_local_pkey PRIMARY KEY (order_number);


--
-- Name: complementary_remedies_local_complementary_prod_id; Type: INDEX; Schema: public; Owner: app; Tablespace: 
--

CREATE INDEX complementary_remedies_local_complementary_prod_id ON complementary_remedies USING btree (comp_prod_id);


--
-- Name: complementary_remedies_local_product_id; Type: INDEX; Schema: public; Owner: app; Tablespace: 
--

CREATE INDEX complementary_remedies_local_product_id ON complementary_remedies USING btree (product_id);


--
-- Name: complementary_singles_local_herb_id; Type: INDEX; Schema: public; Owner: app; Tablespace: 
--

CREATE INDEX complementary_singles_local_herb_id ON complementary_singles USING btree (herb_id);


--
-- Name: complementary_singles_local_product_id; Type: INDEX; Schema: public; Owner: app; Tablespace: 
--

CREATE INDEX complementary_singles_local_product_id ON complementary_singles USING btree (product_id);


--
-- Name: contra_indications_local_id; Type: INDEX; Schema: public; Owner: app; Tablespace: 
--

CREATE INDEX contra_indications_local_id ON contra_indications USING btree (id);


--
-- Name: health_category_local_id; Type: INDEX; Schema: public; Owner: app; Tablespace: 
--

CREATE INDEX health_category_local_id ON health_category USING btree (id);


--
-- Name: product_health_category_local_health_category_id; Type: INDEX; Schema: public; Owner: app; Tablespace: 
--

CREATE INDEX product_health_category_local_health_category_id ON product_health_category USING btree (health_category_id);


--
-- Name: product_health_category_local_product_id; Type: INDEX; Schema: public; Owner: app; Tablespace: 
--

CREATE INDEX product_health_category_local_product_id ON product_health_category USING btree (product_id);


--
-- Name: product_sample_indications_local_product_id; Type: INDEX; Schema: public; Owner: app; Tablespace: 
--

CREATE INDEX product_sample_indications_local_product_id ON product_sample_indications USING btree (product_id);


--
-- Name: product_sample_indications_local_sample_indications_id; Type: INDEX; Schema: public; Owner: app; Tablespace: 
--

CREATE INDEX product_sample_indications_local_sample_indications_id ON product_sample_indications USING btree (sample_indications_id);


--
-- Name: products_local_product_category_id; Type: INDEX; Schema: public; Owner: app; Tablespace: 
--

CREATE INDEX products_local_product_category_id ON products USING btree (product_category_id);


--
-- Name: retail_size_price_local_category_id; Type: INDEX; Schema: public; Owner: app; Tablespace: 
--

CREATE INDEX retail_size_price_local_category_id ON retail_size_price USING btree (product_category_id);


--
-- Name: side_effects_local_id; Type: INDEX; Schema: public; Owner: app; Tablespace: 
--

CREATE INDEX side_effects_local_id ON side_effects USING btree (id);


--
-- Name: single_herb_contra_indications_local_contra_indications_id; Type: INDEX; Schema: public; Owner: app; Tablespace: 
--

CREATE INDEX single_herb_contra_indications_local_contra_indications_id ON single_herb_contra_indications USING btree (contra_indications_id);


--
-- Name: single_herb_contra_indications_local_single_herb_id; Type: INDEX; Schema: public; Owner: app; Tablespace: 
--

CREATE INDEX single_herb_contra_indications_local_single_herb_id ON single_herb_contra_indications USING btree (single_herb_id);


--
-- Name: single_herb_sample_indications_local_product_id; Type: INDEX; Schema: public; Owner: app; Tablespace: 
--

CREATE INDEX single_herb_sample_indications_local_product_id ON single_herb_sample_indications USING btree (single_herb_id);


--
-- Name: single_herb_sample_indications_local_sample_indications_id; Type: INDEX; Schema: public; Owner: app; Tablespace: 
--

CREATE INDEX single_herb_sample_indications_local_sample_indications_id ON single_herb_sample_indications USING btree (sample_indications_id);


--
-- Name: single_herb_side_effects_local_contra_indications_id; Type: INDEX; Schema: public; Owner: app; Tablespace: 
--

CREATE INDEX single_herb_side_effects_local_contra_indications_id ON single_herb_side_effects USING btree (side_effects_id);


--
-- Name: single_herb_side_effects_local_single_herb_id; Type: INDEX; Schema: public; Owner: app; Tablespace: 
--

CREATE INDEX single_herb_side_effects_local_single_herb_id ON single_herb_side_effects USING btree (single_herb_id);


--
-- Name: single_herbs_local_herb_id; Type: INDEX; Schema: public; Owner: app; Tablespace: 
--

CREATE INDEX single_herbs_local_herb_id ON single_herbs USING btree (herb_id);


--
-- Name: wholesale_size_price_local_category_id; Type: INDEX; Schema: public; Owner: app; Tablespace: 
--

CREATE INDEX wholesale_size_price_local_category_id ON wholesale_size_price USING btree (category_id);


--
-- Name: complementary-product-id-foreign-key; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY complementary_remedies
    ADD CONSTRAINT "complementary-product-id-foreign-key" FOREIGN KEY (comp_prod_id) REFERENCES products("productID") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: contra-indications-id-foreign-key; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY single_herb_contra_indications
    ADD CONSTRAINT "contra-indications-id-foreign-key" FOREIGN KEY (contra_indications_id) REFERENCES contra_indications(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: health-category-id-foreign-key; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY product_health_category
    ADD CONSTRAINT "health-category-id-foreign-key" FOREIGN KEY (health_category_id) REFERENCES health_category(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: product-category-foreign-key; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY products
    ADD CONSTRAINT "product-category-foreign-key" FOREIGN KEY (product_category_id) REFERENCES product_category(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: product-category-id-foreign-key; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY retail_size_price
    ADD CONSTRAINT "product-category-id-foreign-key" FOREIGN KEY (product_category_id) REFERENCES product_category(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: product-id-foreign-key; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY product_health_category
    ADD CONSTRAINT "product-id-foreign-key" FOREIGN KEY (product_id) REFERENCES products("productID") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: product-id-foreign-key; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY product_sample_indications
    ADD CONSTRAINT "product-id-foreign-key" FOREIGN KEY (product_id) REFERENCES products("productID") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: product-id-foreign-key; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY complementary_remedies
    ADD CONSTRAINT "product-id-foreign-key" FOREIGN KEY (product_id) REFERENCES products("productID") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: sample-indications-id-foreign-key; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY product_sample_indications
    ADD CONSTRAINT "sample-indications-id-foreign-key" FOREIGN KEY (sample_indications_id) REFERENCES sample_indications(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: sample-indications-id-foreign-key; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY single_herb_sample_indications
    ADD CONSTRAINT "sample-indications-id-foreign-key" FOREIGN KEY (sample_indications_id) REFERENCES sample_indications(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: single-herb-id-foreign-key; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY single_herb_contra_indications
    ADD CONSTRAINT "single-herb-id-foreign-key" FOREIGN KEY (single_herb_id) REFERENCES single_herbs(herb_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: single-herb-id-foreign-key; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY single_herb_sample_indications
    ADD CONSTRAINT "single-herb-id-foreign-key" FOREIGN KEY (single_herb_id) REFERENCES single_herbs(herb_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: single_herb_side_effects_single_herb_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY single_herb_side_effects
    ADD CONSTRAINT single_herb_side_effects_single_herb_id_fkey FOREIGN KEY (single_herb_id) REFERENCES single_herbs(herb_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

