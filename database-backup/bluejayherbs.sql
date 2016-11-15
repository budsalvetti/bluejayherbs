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

INSERT INTO bluejayusers VALUES (1, 'dksaami@yahoo.com', 'calendula');
INSERT INTO bluejayusers VALUES (2, 'mantiss@pacbell.net', 'mantis');


--
-- Data for Name: complementary_remedies; Type: TABLE DATA; Schema: public; Owner: app
--

INSERT INTO complementary_remedies VALUES (1, 87, 'for deeper cleansing action');
INSERT INTO complementary_remedies VALUES (1, 157, 'for oily skin');
INSERT INTO complementary_remedies VALUES (1, 11, 'for slow healing blemishes and sores');
INSERT INTO complementary_remedies VALUES (1, 12, 'for wrinkles and aging skin');
INSERT INTO complementary_remedies VALUES (1, 150, 'for hormonal acne');
INSERT INTO complementary_remedies VALUES (2, 1, 'for acne, blemishes, pimples');
INSERT INTO complementary_remedies VALUES (2, 7, 'for eczema, dermatitis, itchy skin');
INSERT INTO complementary_remedies VALUES (2, 62, 'for oily skin');
INSERT INTO complementary_remedies VALUES (2, 10, 'for psoriasis, dermatitis, weepy skin');
INSERT INTO complementary_remedies VALUES (2, 11, 'for pimples, boils, carbuncles');
INSERT INTO complementary_remedies VALUES (2, 12, 'for dry skin, wrinkles, aging skin');
INSERT INTO complementary_remedies VALUES (2, 150, 'for hormonal acne');
INSERT INTO complementary_remedies VALUES (2, 5, 'for irritated, chapped, or itchy skin');
INSERT INTO complementary_remedies VALUES (1, 2, 'for oily, adolescent, hormonal, and cystic skin conditions');
INSERT INTO complementary_remedies VALUES (1, 5, 'for red, irritated skin or skin rash');
INSERT INTO complementary_remedies VALUES (1, 165, 'to help reduce scar tissue from blemishes');
INSERT INTO complementary_remedies VALUES (2, 165, 'to help reduce scar tissue from blemishes');
INSERT INTO complementary_remedies VALUES (100, 103, 'for excessive bleeding');
INSERT INTO complementary_remedies VALUES (100, 87, 'for cleansing the blood');
INSERT INTO complementary_remedies VALUES (100, 82, 'for slow healing cuts, wounds, or sores');
INSERT INTO complementary_remedies VALUES (100, 96, 'for viral and bacterial infections');
INSERT INTO complementary_remedies VALUES (57, 68, 'supports breaking the habit of addictions');
INSERT INTO complementary_remedies VALUES (57, 129, 'for memory, focus, and concentration');
INSERT INTO complementary_remedies VALUES (124, 126, 'for lung infections with mucous');
INSERT INTO complementary_remedies VALUES (124, 35, 'for depletion of energy and weak immunity');
INSERT INTO complementary_remedies VALUES (124, 82, 'for a weakened immune system and chronic illness');
INSERT INTO complementary_remedies VALUES (124, 71, 'for emotional difficulty in letting go');
INSERT INTO complementary_remedies VALUES (124, 159, 'for rebuilding the health of damaged lungs');
INSERT INTO complementary_remedies VALUES (124, 99, 'for chronic bacterial or viral infection');
INSERT INTO complementary_remedies VALUES (124, 134, 'for acute asthma attacks');
INSERT INTO complementary_remedies VALUES (86, 103, 'for excessive bleeding');
INSERT INTO complementary_remedies VALUES (86, 87, 'for cleansing the blood');
INSERT INTO complementary_remedies VALUES (86, 82, 'for slow healing cuts, wounds, or sores');
INSERT INTO complementary_remedies VALUES (86, 96, 'for viral and bacterial infections');
INSERT INTO complementary_remedies VALUES (86, 99, 'for stubborn and chronic infections');
INSERT INTO complementary_remedies VALUES (86, 101, 'for cleansing the affected area');
INSERT INTO complementary_remedies VALUES (100, 99, 'for viral and bacterial infections');
INSERT INTO complementary_remedies VALUES (100, 101, 'for cleansing the affected area');
INSERT INTO complementary_remedies VALUES (101, 103, 'for excessive bleeding');
INSERT INTO complementary_remedies VALUES (101, 87, 'for cleansing of the blood');
INSERT INTO complementary_remedies VALUES (101, 183, 'for herpes or inflamed sores');
INSERT INTO complementary_remedies VALUES (101, 96, 'for viral and bacterial infections');
INSERT INTO complementary_remedies VALUES (102, 77, 'for the healing of ligaments and tendons');
INSERT INTO complementary_remedies VALUES (102, 111, 'for the healing of bones');
INSERT INTO complementary_remedies VALUES (102, 162, 'for sprains and tissue trauma');
INSERT INTO complementary_remedies VALUES (102, 121, 'for pain and assisting the healing process');
INSERT INTO complementary_remedies VALUES (49, 37, 'to be taken by the mother, if the infant is breast fed');
INSERT INTO complementary_remedies VALUES (49, 47, 'to be taken by the mother, if the infant is breast fed');
INSERT INTO complementary_remedies VALUES (49, 54, 'for teething, especially those that become irritable, fractious, and difficult to deal with');
INSERT INTO complementary_remedies VALUES (49, 55, 'for teething, especially suits those infants who bare their challenges stoically');
INSERT INTO complementary_remedies VALUES (90, 51, 'for fever due to colds, influenza and infections');
INSERT INTO complementary_remedies VALUES (90, 52, 'for fever due to colds, influenza and infections');
INSERT INTO complementary_remedies VALUES (90, 89, 'for earache and build up of fluids in the ear');
INSERT INTO complementary_remedies VALUES (90, 81, 'for recurring infections');
INSERT INTO complementary_remedies VALUES (90, 96, 'for initial stages of infection');
INSERT INTO complementary_remedies VALUES (90, 131, 'for tenacious bronchial or sinus mucous');
INSERT INTO complementary_remedies VALUES (90, 132, 'for sinus infections and congestion');
INSERT INTO complementary_remedies VALUES (51, 125, 'for bronchial asthma due to cold');
INSERT INTO complementary_remedies VALUES (51, 126, 'for bronchitis, respiratory infection, and cough with mucous');
INSERT INTO complementary_remedies VALUES (51, 88, 'for swollen glands and sore throat');
INSERT INTO complementary_remedies VALUES (51, 127, 'for dry, croupy cough with no mucous');
INSERT INTO complementary_remedies VALUES (51, 81, 'for children who are prone to frequent infections');
INSERT INTO complementary_remedies VALUES (51, 96, 'for lymphatic infections or swollen glands');
INSERT INTO complementary_remedies VALUES (51, 132, 'for sinus infections and runny nose');
INSERT INTO complementary_remedies VALUES (52, 125, 'for bronchial asthma due to cold');
INSERT INTO complementary_remedies VALUES (52, 126, 'for bronchitis, respiratory infection, and cough with mucous');
INSERT INTO complementary_remedies VALUES (52, 88, 'for swollen glands and sore throat');
INSERT INTO complementary_remedies VALUES (52, 127, 'for dry, croupy cough with no mucous');
INSERT INTO complementary_remedies VALUES (52, 81, 'for children who are prone to frequent infections');
INSERT INTO complementary_remedies VALUES (52, 96, 'for lymphatic infections or swollen glands');
INSERT INTO complementary_remedies VALUES (52, 132, 'for sinus infections and runny nose');
INSERT INTO complementary_remedies VALUES (36, 35, 'for postpartum fatigue');
INSERT INTO complementary_remedies VALUES (58, 61, 'for excessive stress, anxiety, insomnia');
INSERT INTO complementary_remedies VALUES (58, 74, 'for irritation and agitation');
INSERT INTO complementary_remedies VALUES (57, 59, 'emotional roller coaster ride');
INSERT INTO complementary_remedies VALUES (166, 16, 'for renal hypertension');
INSERT INTO complementary_remedies VALUES (166, 168, 'for urinary difficulties and infections');
INSERT INTO complementary_remedies VALUES (166, 114, 'for joint pain accompanied by edema');
INSERT INTO complementary_remedies VALUES (166, 157, 'for chronic edema and weak lower body');
INSERT INTO complementary_remedies VALUES (20, 15, 'for poor circulation and cold extremities');
INSERT INTO complementary_remedies VALUES (20, 16, 'for vascular and renal hypertension');
INSERT INTO complementary_remedies VALUES (20, 21, 'for balancing the cholesterol levels');
INSERT INTO complementary_remedies VALUES (20, 6, 'for obesity and excess fat');
INSERT INTO complementary_remedies VALUES (20, 156, 'for supporting the cardiac function and 			calming the spirit');
INSERT INTO complementary_remedies VALUES (36, 78, 'for supplementing the bodies energy');
INSERT INTO complementary_remedies VALUES (36, 65, 'for spotting, fatigue, and anxiety');
INSERT INTO complementary_remedies VALUES (36, 85, 'for prolapsed uterus or hemorrhoids');
INSERT INTO complementary_remedies VALUES (36, 152, 'for regulating the hormones');
INSERT INTO complementary_remedies VALUES (58, 158, 'a gentle liver cleanser for sensitive constitutions');
INSERT INTO complementary_remedies VALUES (58, 120, 'for assisting the release of the neck and 			shoulders');
INSERT INTO complementary_remedies VALUES (58, 138, 'for restless sleep patterns');
INSERT INTO complementary_remedies VALUES (58, 139, 'for difficulty falling asleep');
INSERT INTO complementary_remedies VALUES (103, 40, 'for strengthening the digestive tract and 		relieve ulcers or inflammation');
INSERT INTO complementary_remedies VALUES (103, 42, 'for chronic inflamed digestive tract and 			intestinal bleeding');
INSERT INTO complementary_remedies VALUES (17, 17, 'High blood pressure, diabetes, and edema are some conditions that present themselves during the later part of a pregnancy. Consult a qualified health care practitioner before taking any herbal remedies for any of these conditions.');
INSERT INTO complementary_remedies VALUES (103, 79, 'for retinal bleeding, macular degeneration');
INSERT INTO complementary_remedies VALUES (103, 162, 'for damaged tissues, sprains, and torn ligaments');
INSERT INTO complementary_remedies VALUES (87, 24, 'for cancer and deep seated infections');
INSERT INTO complementary_remedies VALUES (87, 168, 'for urinary tract, bladder, and kidney infections');
INSERT INTO complementary_remedies VALUES (87, 43, 'for hepatitis and cirrhosis of the liver');
INSERT INTO complementary_remedies VALUES (87, 44, 'for cleansing of the hepatic system');
INSERT INTO complementary_remedies VALUES (6, 39, 'for sluggish bowels');
INSERT INTO complementary_remedies VALUES (87, 96, 'for cleansing of the lymphatic system and all types of infections');
INSERT INTO complementary_remedies VALUES (87, 99, 'for chronic infections and autoimmune diseases');
INSERT INTO complementary_remedies VALUES (57, 158, 'for cleansing of the liver');
INSERT INTO complementary_remedies VALUES (57, 137, 'for calming and rebuilding the nervous system');
INSERT INTO complementary_remedies VALUES (57, 64, 'for panic attacks and phobias');
INSERT INTO complementary_remedies VALUES (57, 67, 'for anxiety with depletion of body reserves');
INSERT INTO complementary_remedies VALUES (68, 68, 'With the appropriate presentation, herbal formulas which address the physiological needs of the patient are an important adjunct to the Flower Remedies. This holistic approach respects the intimate relationship of the body-mind-heart-spirit connection.    Emotional confusion and upset often accompanies physiological problems. By relating an emotion to the Five Phases Theory or the Four Humors, and applying an appropriate herbal formula can be very beneficial during the course of the healing process.     An excess or lack of any emotion can serve as a guide to the systemic imbalance of the patient. The important thing to remember is to adapt and apply these theories in a creative and dynamic way. Rigidity spoils the soup, limits the possibilities, and closes the door to healing.');
INSERT INTO complementary_remedies VALUES (166, 150, 'for hormonal water retention');
INSERT INTO complementary_remedies VALUES (166, 99, 'for chronic infections and  a weak immune system');
INSERT INTO complementary_remedies VALUES (103, 65, 'for menstrual spotting and fatigue');
INSERT INTO complementary_remedies VALUES (103, 18, 'for bleeding hemorrhoids');
INSERT INTO complementary_remedies VALUES (103, 28, 'for radiation burns');
INSERT INTO complementary_remedies VALUES (77, 35, 'for weakness following a illness or surgery');
INSERT INTO complementary_remedies VALUES (77, 60, 'for poor assimilation of nutrients and 			weak digestion');
INSERT INTO complementary_remedies VALUES (77, 82, 'for a compromised immune system');
INSERT INTO complementary_remedies VALUES (77, 84, 'for weakened adrenal functions and fatigue');
INSERT INTO complementary_remedies VALUES (77, 85, 'for collapsed organs and emotional   exhaustion');
INSERT INTO complementary_remedies VALUES (15, 20, 'for enhancing blood circulation');
INSERT INTO complementary_remedies VALUES (15, 59, 'for surface chills that are relieved when 			wrapped up');
INSERT INTO complementary_remedies VALUES (15, 62, 'feel chilled to the bone, blankets dont help');
INSERT INTO complementary_remedies VALUES (15, 130, 'alternating feeling of hot, then cold');
INSERT INTO complementary_remedies VALUES (15, 157, 'for chronic cold body and weak lower body');
INSERT INTO complementary_remedies VALUES (15, 121, 'for joint and muscular pain');
INSERT INTO complementary_remedies VALUES (167, 87, 'for cleansing of the renal system');
INSERT INTO complementary_remedies VALUES (167, 168, 'for urinary and bladder infections');
INSERT INTO complementary_remedies VALUES (167, 63, 'for nourishing the kidneys, night sweats');
INSERT INTO complementary_remedies VALUES (167, 80, 'for dark colored urine, hot hands and feet');
INSERT INTO complementary_remedies VALUES (167, 119, 'for pain that increases with movement');
INSERT INTO complementary_remedies VALUES (111, 20, 'enhances blood circulation');
INSERT INTO complementary_remedies VALUES (111, 35, 'for fortifying the bodies energies');
INSERT INTO complementary_remedies VALUES (111, 114, 'for joint stiffness and pain');
INSERT INTO complementary_remedies VALUES (111, 118, 'for pain that lessens with movement');
INSERT INTO complementary_remedies VALUES (111, 119, 'for pain that increases with movement');
INSERT INTO complementary_remedies VALUES (111, 121, 'for arthritis, lumbago, and pain');
INSERT INTO complementary_remedies VALUES (16, 166, 'for water retention, edema');
INSERT INTO complementary_remedies VALUES (16, 20, 'for arterial plague and clogging of arteries');
INSERT INTO complementary_remedies VALUES (16, 21, 'for high cholesterol');
INSERT INTO complementary_remedies VALUES (16, 156, 'for palpitations, a weak heart, and insomnia');
INSERT INTO complementary_remedies VALUES (16, 74, 'for emotional irritability and agitation');
INSERT INTO complementary_remedies VALUES (16, 66, 'for tightness in the chest with palpitations when resting');
INSERT INTO complementary_remedies VALUES (16, 67, 'for palpitations and arrhythmia');
INSERT INTO complementary_remedies VALUES (129, 35, 'for rejuvenating and strengthening the body');
INSERT INTO complementary_remedies VALUES (129, 61, 'unable to concentrate, palpitations, insomnia');
INSERT INTO complementary_remedies VALUES (129, 157, 'for memory loss due to aging, forgetful');
INSERT INTO complementary_remedies VALUES (129, 137, 'for strengthening the nervous system');
INSERT INTO complementary_remedies VALUES (129, 65, 'for excessive worry or thought, depleted');
INSERT INTO complementary_remedies VALUES (129, 67, 'for calming the nervous system');
INSERT INTO complementary_remedies VALUES (23, 87, 'for deeper cleansing action');
INSERT INTO complementary_remedies VALUES (23, 25, 'for supporting the white blood cells');
INSERT INTO complementary_remedies VALUES (23, 61, 'for calming the emotions during high stress');
INSERT INTO complementary_remedies VALUES (23, 96, 'for detoxification of the lymphatic system');
INSERT INTO complementary_remedies VALUES (125, 124, 'for chronic lung disorders');
INSERT INTO complementary_remedies VALUES (125, 126, 'for lung infections with mucous');
INSERT INTO complementary_remedies VALUES (125, 69, 'for calming during an asthma attack');
INSERT INTO complementary_remedies VALUES (125, 82, 'for strengthening the immune system');
INSERT INTO complementary_remedies VALUES (125, 132, 'for allergies, runny nose, and sinusitis');
INSERT INTO complementary_remedies VALUES (125, 133, 'for sneezing and seasonal allergies');
INSERT INTO complementary_remedies VALUES (125, 134, 'for acute asthmatic attacks');
INSERT INTO complementary_remedies VALUES (126, 88, 'for swollen glands and sore throat');
INSERT INTO complementary_remedies VALUES (126, 32, 'for relieving the aches and pains of the flu');
INSERT INTO complementary_remedies VALUES (126, 96, 'for detoxification of the lymphatic system');
INSERT INTO complementary_remedies VALUES (126, 131, 'for tenacious sputum and mucous');
INSERT INTO complementary_remedies VALUES (126, 132, 'for nasal congestion and running nose');
INSERT INTO complementary_remedies VALUES (126, 99, 'for infections with weakened immunity');
INSERT INTO complementary_remedies VALUES (35, 77, 'for enhancing bone marrow production');
INSERT INTO complementary_remedies VALUES (35, 78, 'for fatigue, long hours, and burn out');
INSERT INTO complementary_remedies VALUES (35, 162, 'for recovery from injuries or surgery');
INSERT INTO complementary_remedies VALUES (35, 82, 'for a weakened or compromised immune system');
INSERT INTO complementary_remedies VALUES (35, 83, 'for fatigue, tired blood, or anemia');
INSERT INTO complementary_remedies VALUES (35, 84, 'for adrenal fatigue');
INSERT INTO complementary_remedies VALUES (35, 85, 'for weakness following a febrile disease');
INSERT INTO complementary_remedies VALUES (35, 99, 'for chronic infections with weak immunity');
INSERT INTO complementary_remedies VALUES (140, 211, 'for sexual exhaustion, weak libido');
INSERT INTO complementary_remedies VALUES (140, 169, 'for premature ejaculation');
INSERT INTO complementary_remedies VALUES (140, 145, 'for enhancing mens fertility');
INSERT INTO complementary_remedies VALUES (140, 149, 'for impotence or weak libido');
INSERT INTO complementary_remedies VALUES (140, 153, 'for weak libido due to menopause');
INSERT INTO complementary_remedies VALUES (140, 155, 'for enhancing womens fertility');
INSERT INTO complementary_remedies VALUES (141, 37, 'for indigestion following meals, hiatal hernia');
INSERT INTO complementary_remedies VALUES (141, 182, 'for heartburn and acid reflux');
INSERT INTO complementary_remedies VALUES (141, 39, 'for sluggish bowels');
INSERT INTO complementary_remedies VALUES (141, 40, 'for bloating, gas, gastric hyperacidity, ulcers');
INSERT INTO complementary_remedies VALUES (141, 44, 'for cleansing the liver and stimulating the gall bladder');
INSERT INTO complementary_remedies VALUES (141, 160, 'for weak appetite, food tastes bland');
INSERT INTO complementary_remedies VALUES (143, 78, 'for rebuilding the energy');
INSERT INTO complementary_remedies VALUES (143, 61, 'for relieving stress and calming');
INSERT INTO complementary_remedies VALUES (143, 157, 'for supplementing the adrenal glands');
INSERT INTO complementary_remedies VALUES (143, 149, 'for quick libido response');
INSERT INTO complementary_remedies VALUES (143, 84, 'for supplementing the adrenal glands');
INSERT INTO complementary_remedies VALUES (105, 87, 'for cleansing of the blood');
INSERT INTO complementary_remedies VALUES (105, 69, 'for trauma and shock');
INSERT INTO complementary_remedies VALUES (105, 96, 'for detoxification of the lymph system');
INSERT INTO complementary_remedies VALUES (105, 11, 'for relieving the swelling');
INSERT INTO complementary_remedies VALUES (105, 98, 'for relieving the itching');
INSERT INTO complementary_remedies VALUES (24, 23, 'for solid masses in the chest region');
INSERT INTO complementary_remedies VALUES (24, 25, 'for enhancing the white blood count');
INSERT INTO complementary_remedies VALUES (30, 31, 'for diabetes');
INSERT INTO complementary_remedies VALUES (24, 26, 'for solid masses in the digestive tract');
INSERT INTO complementary_remedies VALUES (24, 69, 'for stress, trauma, and panic');
INSERT INTO complementary_remedies VALUES (24, 27, 'for solid masses in the respiratory system');
INSERT INTO complementary_remedies VALUES (24, 29, 'for high PSA readings, or diseased prostate');
INSERT INTO complementary_remedies VALUES (45, 87, 'for purification of the blood');
INSERT INTO complementary_remedies VALUES (45, 37, 'for fatigue after meals');
INSERT INTO complementary_remedies VALUES (45, 60, 'for compulsive behavior and pensive');
INSERT INTO complementary_remedies VALUES (45, 130, 'for irritability, anxiety, and stress');
INSERT INTO complementary_remedies VALUES (45, 40, 'for a weak appetite and loose stool');
INSERT INTO complementary_remedies VALUES (45, 44, 'for cleansing of the liver');
INSERT INTO complementary_remedies VALUES (45, 154, 'for vaginal yeast infections and discharge');
INSERT INTO complementary_remedies VALUES (25, 77, 'enhances blood and bone marrow production');
INSERT INTO complementary_remedies VALUES (25, 35, 'for building the body energy reserve');
INSERT INTO complementary_remedies VALUES (25, 69, 'for trauma and panic');
INSERT INTO complementary_remedies VALUES (25, 82, 'for enhancement of the immune system');
INSERT INTO complementary_remedies VALUES (25, 137, 'supports the nervous system and calming');
INSERT INTO complementary_remedies VALUES (25, 138, 'for insomnia and palpitations');
INSERT INTO complementary_remedies VALUES (25, 160, 'for nausea and weak appetite');
INSERT INTO complementary_remedies VALUES (78, 35, 'for building endurance');
INSERT INTO complementary_remedies VALUES (78, 137, 'for nourishing and calming the nervous   system and restorative');
INSERT INTO complementary_remedies VALUES (78, 83, 'for anemia, dizziness, and fatigue');
INSERT INTO complementary_remedies VALUES (78, 149, 'for supporting the adrenal glands');
INSERT INTO complementary_remedies VALUES (78, 84, 'for athletes and professionals who require stamina and endurance');
INSERT INTO complementary_remedies VALUES (78, 67, 'for building the body reserves and calm the nervous system');
INSERT INTO complementary_remedies VALUES (21, 20, 'for arterial plaque and poor circulation to   	the 	heart');
INSERT INTO complementary_remedies VALUES (21, 16, 'for high blood pressure');
INSERT INTO complementary_remedies VALUES (21, 39, 'for sluggish bowel movement');
INSERT INTO complementary_remedies VALUES (21, 156, 'for supporting the cardiac function');
INSERT INTO complementary_remedies VALUES (21, 44, 'for enhancement of bile production');
INSERT INTO complementary_remedies VALUES (21, 158, 'for enhancing the liver and gall bladder 			function');
INSERT INTO complementary_remedies VALUES (59, 37, 'for fatigue after meals and indigestion');
INSERT INTO complementary_remedies VALUES (59, 73, 'for foggy brain and dreaminess');
INSERT INTO complementary_remedies VALUES (59, 184, 'for sensitive personalities and unable to 			handle liver releasing herbs, such as Bupleurum');
INSERT INTO complementary_remedies VALUES (59, 188, 'for muscular tension in the neck and shoulders');
INSERT INTO complementary_remedies VALUES (59, 30, 'for low blood sugar or hypoglycemia');
INSERT INTO complementary_remedies VALUES (88, 33, 'for flu and cold symptoms');
INSERT INTO complementary_remedies VALUES (88, 81, 'for recurring infections');
INSERT INTO complementary_remedies VALUES (88, 135, 'for headaches and sinus congestion');
INSERT INTO complementary_remedies VALUES (88, 96, 'for cleansing of the lymphatic system');
INSERT INTO complementary_remedies VALUES (88, 132, 'for runny nose and nasal congestion');
INSERT INTO complementary_remedies VALUES (88, 99, 'for detoxification and immune enhancement');
INSERT INTO complementary_remedies VALUES (168, 166, 'for diuretic action');
INSERT INTO complementary_remedies VALUES (168, 87, 'for cleansing of the blood');
INSERT INTO complementary_remedies VALUES (168, 80, 'for dark colored urine');
INSERT INTO complementary_remedies VALUES (168, 183, 'for strong cleansing of the urinary system');
INSERT INTO complementary_remedies VALUES (168, 99, 'for infections and immune system support');
INSERT INTO complementary_remedies VALUES (26, 103, 'to arrest internal bleeding');
INSERT INTO complementary_remedies VALUES (26, 162, 'for recovery from surgery');
INSERT INTO complementary_remedies VALUES (26, 39, 'for chronic constipation');
INSERT INTO complementary_remedies VALUES (26, 82, 'for immune support');
INSERT INTO complementary_remedies VALUES (26, 47, 'for healing the tissues of the digestive tract');
INSERT INTO complementary_remedies VALUES (26, 160, 'for chronic loose stool or weight loss');
INSERT INTO complementary_remedies VALUES (161, 103, 'for arresting internal bleeding');
INSERT INTO complementary_remedies VALUES (161, 35, 'for enhancing the bodies energy functions');
INSERT INTO complementary_remedies VALUES (161, 69, 'for emotional support due to shock, trauma');
INSERT INTO complementary_remedies VALUES (161, 162, 'supports the recovery process and replenishes the blood and energy');
INSERT INTO complementary_remedies VALUES (161, 121, 'for pain relief');
INSERT INTO complementary_remedies VALUES (161, 99, 'for infections and enhancement of the immune system');
INSERT INTO complementary_remedies VALUES (127, 82, 'for enhancing the immune system');
INSERT INTO complementary_remedies VALUES (127, 81, 'for recurring infections');
INSERT INTO complementary_remedies VALUES (127, 159, 'for nourishing and moistening the lungs');
INSERT INTO complementary_remedies VALUES (127, 132, 'for nasal drip');
INSERT INTO complementary_remedies VALUES (113, 49, 'for colic, all ages');
INSERT INTO complementary_remedies VALUES (113, 59, 'for upper body muscular tension and stiffness');
INSERT INTO complementary_remedies VALUES (113, 42, 'for colic and inflammatory intestinal disorders');
INSERT INTO complementary_remedies VALUES (113, 120, 'for muscle aches and pains');
INSERT INTO complementary_remedies VALUES (113, 121, 'for stiffness, limitation of movement,   numbness');
INSERT INTO complementary_remedies VALUES (113, 83, 'for menstrual pain');
INSERT INTO complementary_remedies VALUES (113, 47, 'for digestive disturbances and inflammations');
INSERT INTO complementary_remedies VALUES (113, 150, 'for PMS and menstrual cramps');
INSERT INTO complementary_remedies VALUES (69, 69, 'With the appropriate presentation, herbal formulas which address the physiological needs of the patient are an important adjunct to the Flower Remedies. This holistic approach respects the intimate relationship of the body-mind-heart-spirit connection.    Emotional confusion and upset often accompanies physiological problems. By relating an emotion to the Five Phases Theory or the Four Humors, and applying an appropriate herbal formula can be very beneficial during the course of the healing process.     An excess or lack of any emotion can serve as a guide to the systemic imbalance of the patient. The important thing to remember is to adapt and apply these theories in a creative and dynamic way. Rigidity spoils the soup, limits the possibilities, and closes the door to healing.');
INSERT INTO complementary_remedies VALUES (70, 70, 'With the appropriate presentation, herbal formulas which address the physiological needs of the patient are an important adjunct to the Flower Remedies. This holistic approach respects the intimate relationship of the body-mind-heart-spirit connection.    Emotional confusion and upset often accompanies physiological problems. By relating an emotion to the Five Phases Theory or the Four Humors, and applying an appropriate herbal formula can be very beneficial during the course of the healing process.     An excess or lack of any emotion can serve as a guide to the systemic imbalance of the patient. The important thing to remember is to adapt and apply these theories in a creative and dynamic way. Rigidity spoils the soup, limits the possibilities, and closes the door to healing.');
INSERT INTO complementary_remedies VALUES (147, 113, 'for alleviating pain and discomfort in the abdomen');
INSERT INTO complementary_remedies VALUES (147, 62, 'for warming the kidneys');
INSERT INTO complementary_remedies VALUES (147, 130, 'for invigorating the function of the liver');
INSERT INTO complementary_remedies VALUES (147, 152, 'for harmonizing the menstrual cycle');
INSERT INTO complementary_remedies VALUES (37, 39, 'for a tendency towards constipation');
INSERT INTO complementary_remedies VALUES (37, 40, 'for strengthening the digestive process');
INSERT INTO complementary_remedies VALUES (37, 41, 'for acute constipation');
INSERT INTO complementary_remedies VALUES (37, 42, 'for inflammatory digestive disorders');
INSERT INTO complementary_remedies VALUES (37, 44, 'for liver cleansing and bile stimulation');
INSERT INTO complementary_remedies VALUES (37, 47, 'for healing the tissues of the digestive tract');
INSERT INTO complementary_remedies VALUES (6, 68, 'for breaking the habit of food addictions');
INSERT INTO complementary_remedies VALUES (6, 166, 'for water retention');
INSERT INTO complementary_remedies VALUES (6, 112, 'for fatigue and slow metabolism');
INSERT INTO complementary_remedies VALUES (6, 59, 'for balancing the functions of the liver and 	spleen');
INSERT INTO complementary_remedies VALUES (6, 4, 'for reducing the appetite and over-eating');
INSERT INTO complementary_remedies VALUES (6, 40, 'for reducing bloating and distention');
INSERT INTO complementary_remedies VALUES (6, 30, 'for low blood sugar and sweet cravings');
INSERT INTO complementary_remedies VALUES (79, 63, 'moistens the body fluids and kidney tonic');
INSERT INTO complementary_remedies VALUES (79, 80, 'for excess heat in the upper body and night sweats');
INSERT INTO complementary_remedies VALUES (79, 157, 'for debility, no motivation, and cold body');
INSERT INTO complementary_remedies VALUES (79, 158, 'for nourishing and cleansing of the liver');
INSERT INTO complementary_remedies VALUES (79, 189, 'for loss of vision due to aging');
INSERT INTO complementary_remedies VALUES (79, 97, 'for red, itchy eyes and inflammation');
INSERT INTO complementary_remedies VALUES (79, 153, 'for menopause and hormone depletion');
INSERT INTO complementary_remedies VALUES (89, 126, 'for mucous in the bronchial tubes');
INSERT INTO complementary_remedies VALUES (89, 88, 'for sore throat and swollen glands');
INSERT INTO complementary_remedies VALUES (89, 81, 'for chronic, recurring infections in children');
INSERT INTO complementary_remedies VALUES (89, 96, 'for cleansing the lymphatic system');
INSERT INTO complementary_remedies VALUES (89, 131, 'for chronic mucous');
INSERT INTO complementary_remedies VALUES (89, 132, 'for congestion in the nasal cavities');
INSERT INTO complementary_remedies VALUES (4, 166, 'for water retention');
INSERT INTO complementary_remedies VALUES (4, 6, 'for supporting weight loss');
INSERT INTO complementary_remedies VALUES (4, 39, 'for sluggish bowels');
INSERT INTO complementary_remedies VALUES (4, 80, 'for excess heat in the upper body and   excess thirst');
INSERT INTO complementary_remedies VALUES (4, 30, 'for sugar sensitivity, hypoglycemic');
INSERT INTO complementary_remedies VALUES (4, 31, 'for high blood sugar, diabetic');
INSERT INTO complementary_remedies VALUES (91, 88, 'for strep throat and swollen glands');
INSERT INTO complementary_remedies VALUES (91, 89, 'for ear infections and earaches');
INSERT INTO complementary_remedies VALUES (91, 92, 'for the initial stages of the flu');
INSERT INTO complementary_remedies VALUES (91, 33, 'for influenza, colds, contagious diseases');
INSERT INTO complementary_remedies VALUES (91, 81, 'for frequent recurring infections');
INSERT INTO complementary_remedies VALUES (91, 96, 'for swollen lymph, viral or bacterial infections');
INSERT INTO complementary_remedies VALUES (91, 99, 'for infections with a weak immune system');
INSERT INTO complementary_remedies VALUES (60, 59, 'for emotional distress, hot and cold temperament');
INSERT INTO complementary_remedies VALUES (60, 130, 'for constrained emotions');
INSERT INTO complementary_remedies VALUES (60, 156, 'for nourishing and calming the heart');
INSERT INTO complementary_remedies VALUES (60, 157, 'where fear is dominating ones life');
INSERT INTO complementary_remedies VALUES (60, 48, 'for nausea and motion sickness');
INSERT INTO complementary_remedies VALUES (60, 30, 'for low blood sugar and sugar sensitivities');
INSERT INTO complementary_remedies VALUES (61, 130, 'for irritability and uptight, anger');
INSERT INTO complementary_remedies VALUES (61, 184, 'for excess stress and worry');
INSERT INTO complementary_remedies VALUES (61, 156, 'for nourishing the nervous system');
INSERT INTO complementary_remedies VALUES (61, 80, 'for night sweats');
INSERT INTO complementary_remedies VALUES (61, 138, 'for restless sleep');
INSERT INTO complementary_remedies VALUES (162, 103, 'to arrest bleeding');
INSERT INTO complementary_remedies VALUES (162, 111, 'for assisting the healing of bones');
INSERT INTO complementary_remedies VALUES (162, 78, 'for rebuilding the body reserves');
INSERT INTO complementary_remedies VALUES (162, 137, 'for regeneration of damaged nerves');
INSERT INTO complementary_remedies VALUES (162, 121, 'for stimulating circulation and pain relief');
INSERT INTO complementary_remedies VALUES (162, 47, 'for internal bleeding');
INSERT INTO complementary_remedies VALUES (211, 143, 'for nourishing the nervous system');
INSERT INTO complementary_remedies VALUES (211, 61, 'for stress relief and calming');
INSERT INTO complementary_remedies VALUES (211, 63, 'for dry body fluids, including vaginal');
INSERT INTO complementary_remedies VALUES (211, 153, 'for low libido due to menopause');
INSERT INTO complementary_remedies VALUES (211, 155, 'for infertility');
INSERT INTO complementary_remedies VALUES (7, 83, 'for fatigue and weak blood');
INSERT INTO complementary_remedies VALUES (7, 11, 'for additional blood detoxification');
INSERT INTO complementary_remedies VALUES (7, 12, 'for chronic dry skin');
INSERT INTO complementary_remedies VALUES (23, 28, 'for exposure to high levels of radiation');
INSERT INTO complementary_remedies VALUES (141, 47, 'for inflammation of the digestive tract');
INSERT INTO complementary_remedies VALUES (45, 47, 'for healing the tissues of the digestive tract');
INSERT INTO complementary_remedies VALUES (148, 113, 'for abdominal cramps and discomfort');
INSERT INTO complementary_remedies VALUES (148, 96, 'for enhancing the flow of lymphatic fluids');
INSERT INTO complementary_remedies VALUES (148, 83, 'for tired blood and weakness');
INSERT INTO complementary_remedies VALUES (148, 150, 'for PMS and emotional ups and downs');
INSERT INTO complementary_remedies VALUES (148, 152, 'for irregular menstruation');
INSERT INTO complementary_remedies VALUES (32, 92, 'for the initial stages of the flu');
INSERT INTO complementary_remedies VALUES (32, 33, 'for all stages of the flu, aches and pains');
INSERT INTO complementary_remedies VALUES (32, 130, 'for alternating fever and chills');
INSERT INTO complementary_remedies VALUES (32, 96, 'for all viral and bacterial infections');
INSERT INTO complementary_remedies VALUES (32, 99, 'for infections and weak immune system');
INSERT INTO complementary_remedies VALUES (92, 32, 'for aches and pains, chills and fever during a febrile disease');
INSERT INTO complementary_remedies VALUES (92, 33, 'for all stages of the flu and febrile diseases');
INSERT INTO complementary_remedies VALUES (92, 130, 'for alternating fever and chills');
INSERT INTO complementary_remedies VALUES (92, 96, 'for viral and bacterial infections');
INSERT INTO complementary_remedies VALUES (33, 126, 'for bronchial infections with moist cough');
INSERT INTO complementary_remedies VALUES (33, 88, 'for sore throat and swollen glands');
INSERT INTO complementary_remedies VALUES (33, 92, 'for the initial stages of the flu');
INSERT INTO complementary_remedies VALUES (33, 32, 'for sweating out the flu');
INSERT INTO complementary_remedies VALUES (33, 130, 'for alternating fever and chills');
INSERT INTO complementary_remedies VALUES (33, 96, 'for viral and bacterial infections');
INSERT INTO complementary_remedies VALUES (33, 132, 'for sinus infections and nasal discharge');
INSERT INTO complementary_remedies VALUES (62, 111, 'for aging and bone loss');
INSERT INTO complementary_remedies VALUES (62, 129, 'for enhancing the memory and concentration');
INSERT INTO complementary_remedies VALUES (62, 69, 'for fear, panic, and shock');
INSERT INTO complementary_remedies VALUES (62, 145, 'for enhancing the libido and fertilit');
INSERT INTO complementary_remedies VALUES (62, 155, 'for enhancing the libido and fertility');
INSERT INTO complementary_remedies VALUES (130, 78, 'for fatigue, weak appetite, and exhaustion');
INSERT INTO complementary_remedies VALUES (130, 113, 'for menstrual cramps and spasms');
INSERT INTO complementary_remedies VALUES (130, 61, 'for replacement of prescription tranquilizers 	and sleeping pills');
INSERT INTO complementary_remedies VALUES (130, 83, 'for anemia, fatigue, and pale skin');
INSERT INTO complementary_remedies VALUES (130, 150, 'for PMS and emotional highs and lows');
INSERT INTO complementary_remedies VALUES (182, 87, 'for cleansing the blood');
INSERT INTO complementary_remedies VALUES (182, 37, 'for upset stomach after eating');
INSERT INTO complementary_remedies VALUES (182, 39, 'for sluggish bowels and inflammation');
INSERT INTO complementary_remedies VALUES (182, 40, 'for normalizing the digestive process');
INSERT INTO complementary_remedies VALUES (182, 42, 'for inflammation of the digestive tract');
INSERT INTO complementary_remedies VALUES (182, 158, 'for soothing the liver');
INSERT INTO complementary_remedies VALUES (182, 47, 'for healing tissues of the digestive tract');
INSERT INTO complementary_remedies VALUES (39, 87, 'for clearing internal heat');
INSERT INTO complementary_remedies VALUES (39, 61, 'for calming agitation and stress');
INSERT INTO complementary_remedies VALUES (39, 41, 'for acute constipation (for short term use only)');
INSERT INTO complementary_remedies VALUES (39, 42, 'for inflammatory intestinal membranes');
INSERT INTO complementary_remedies VALUES (39, 63, 'for moistening the lower part of the body');
INSERT INTO complementary_remedies VALUES (39, 80, 'for chronic dark urine and night sweats');
INSERT INTO complementary_remedies VALUES (39, 158, 'for cleansing the liver and stimulating the gall bladder');
INSERT INTO complementary_remedies VALUES (40, 103, 'for internal bleeding');
INSERT INTO complementary_remedies VALUES (40, 37, 'for indigestion following meals');
INSERT INTO complementary_remedies VALUES (40, 182, 'for heart burn and acid reflux');
INSERT INTO complementary_remedies VALUES (40, 44, 'for gentle cleansing of the liver and gall bladder');
INSERT INTO complementary_remedies VALUES (40, 47, 'for chronic digestive tissue irritations');
INSERT INTO complementary_remedies VALUES (40, 48, 'for nausea and vomiting');
INSERT INTO complementary_remedies VALUES (41, 87, 'for cleansing of the blood');
INSERT INTO complementary_remedies VALUES (41, 61, 'for calming and cooling of the emotions');
INSERT INTO complementary_remedies VALUES (41, 130, 'for a more relaxed and fun approach to life');
INSERT INTO complementary_remedies VALUES (41, 39, 'for chronic constipation');
INSERT INTO complementary_remedies VALUES (41, 63, 'for fear that causes panic');
INSERT INTO complementary_remedies VALUES (41, 158, 'for cleansing of the liver');
INSERT INTO complementary_remedies VALUES (42, 87, 'for clearing internal body heat');
INSERT INTO complementary_remedies VALUES (42, 37, 'for aiding digestion after meals');
INSERT INTO complementary_remedies VALUES (42, 6, 'for better food digestion and elimination');
INSERT INTO complementary_remedies VALUES (42, 61, 'for itchy skin and insomnia, stress');
INSERT INTO complementary_remedies VALUES (42, 182, 'for heart burn and acid reflux');
INSERT INTO complementary_remedies VALUES (42, 44, 'for cleansing the liver');
INSERT INTO complementary_remedies VALUES (42, 98, 'for itchy skin');
INSERT INTO complementary_remedies VALUES (73, 73, 'With the appropriate presentation, herbal formulas which address the physiological needs of the patient are an important adjunct to the Flower Remedies. This holistic approach respects the intimate relationship of the body-mind-heart-spirit connection');
INSERT INTO complementary_remedies VALUES (34, 34, 'Consult a health care practitioner before taking any herbs or herbal formulas during pregnancy.');
INSERT INTO complementary_remedies VALUES (184, 61, 'difficulty in concentrating and focusing');
INSERT INTO complementary_remedies VALUES (184, 130, 'for tension, feeling wired, hard to relax');
INSERT INTO complementary_remedies VALUES (184, 64, 'for a feeling of something stuck in the throat');
INSERT INTO complementary_remedies VALUES (184, 138, 'difficulty staying asleep');
INSERT INTO complementary_remedies VALUES (184, 139, 'difficulty in falling asleep');
INSERT INTO complementary_remedies VALUES (135, 63, 'for headache in the center of the brain');
INSERT INTO complementary_remedies VALUES (135, 44, 'for liver cleansing and chronic headaches');
INSERT INTO complementary_remedies VALUES (135, 120, 'for chronic muscle tension and stress');
INSERT INTO complementary_remedies VALUES (135, 188, 'for muscular tension in the upper body');
INSERT INTO complementary_remedies VALUES (135, 121, 'anti-inflammatory with pain relief');
INSERT INTO complementary_remedies VALUES (135, 97, 'for red, irritated eyes');
INSERT INTO complementary_remedies VALUES (135, 48, 'for nausea and vomiting');
INSERT INTO complementary_remedies VALUES (156, 69, 'for shock, trauma, and fright');
INSERT INTO complementary_remedies VALUES (156, 137, 'for rebuilding the nervous system');
INSERT INTO complementary_remedies VALUES (156, 64, 'for palpitations and arrthymia');
INSERT INTO complementary_remedies VALUES (156, 65, 'for nourishing and calming the spirit');
INSERT INTO complementary_remedies VALUES (156, 138, 'for restless, fitful sleep');
INSERT INTO complementary_remedies VALUES (156, 139, 'for inability to fall asleep');
INSERT INTO complementary_remedies VALUES (156, 66, 'for palpitations and tightness in the chest');
INSERT INTO complementary_remedies VALUES (156, 67, 'for weakness, fatigue, and insomnia');
INSERT INTO complementary_remedies VALUES (169, 35, 'for chronic muscle weakness');
INSERT INTO complementary_remedies VALUES (169, 140, 'for sexual enhancement');
INSERT INTO complementary_remedies VALUES (169, 63, 'for painful intercourse and lack of sexual 		fluids');
INSERT INTO complementary_remedies VALUES (169, 157, 'for weakness in the lower body');
INSERT INTO complementary_remedies VALUES (169, 145, 'for low sperm count');
INSERT INTO complementary_remedies VALUES (169, 149, 'for lack of libido or impotence');
INSERT INTO complementary_remedies VALUES (63, 58, 'for relaxing the liver and nourishing the 			heart');
INSERT INTO complementary_remedies VALUES (63, 168, 'for chronic urinary tract infections');
INSERT INTO complementary_remedies VALUES (63, 61, 'for hyperthyroid and mouth sores');
INSERT INTO complementary_remedies VALUES (63, 62, 'when restless fear is accompanied by paralysis of movement');
INSERT INTO complementary_remedies VALUES (63, 80, 'for excessive night sweats, hot palms and 		feet, hot flashes');
INSERT INTO complementary_remedies VALUES (38, 87, 'for clearing internal body heat');
INSERT INTO complementary_remedies VALUES (38, 37, 'for aiding digestion after meals');
INSERT INTO complementary_remedies VALUES (38, 6, 'for better food digestion and elimination');
INSERT INTO complementary_remedies VALUES (38, 61, 'for itchy skin and insomnia, stress');
INSERT INTO complementary_remedies VALUES (38, 182, 'for heart burn and acid reflux');
INSERT INTO complementary_remedies VALUES (38, 44, 'for cleansing the liver');
INSERT INTO complementary_remedies VALUES (38, 98, 'for itchy skin');
INSERT INTO complementary_remedies VALUES (80, 79, 'for dry, tired eyes');
INSERT INTO complementary_remedies VALUES (80, 61, 'for stress and insomnia');
INSERT INTO complementary_remedies VALUES (80, 169, 'for urinary incontinence');
INSERT INTO complementary_remedies VALUES (80, 83, 'for fatigue and tired blood');
INSERT INTO complementary_remedies VALUES (80, 157, 'for weakness in the lower body');
INSERT INTO complementary_remedies VALUES (80, 31, 'for high blood sugar');
INSERT INTO complementary_remedies VALUES (80, 153, 'for alleviating menopausal symptoms');
INSERT INTO complementary_remedies VALUES (43, 87, 'for cleansing toxic heat');
INSERT INTO complementary_remedies VALUES (43, 77, 'for anemia and weak blood');
INSERT INTO complementary_remedies VALUES (43, 35, 'for building the immune system');
INSERT INTO complementary_remedies VALUES (43, 21, 'for lowering high cholesterol levels');
INSERT INTO complementary_remedies VALUES (43, 37, 'for sleepiness after meals, heart burn');
INSERT INTO complementary_remedies VALUES (43, 63, 'for night sweats, thirst, and dry mouth');
INSERT INTO complementary_remedies VALUES (43, 38, 'for jaundice and stones');
INSERT INTO complementary_remedies VALUES (43, 96, 'for cleansing the lymphatic system');
INSERT INTO complementary_remedies VALUES (43, 123, 'for weakness and pain in the lower body');
INSERT INTO complementary_remedies VALUES (44, 87, 'for cleansing of the blood');
INSERT INTO complementary_remedies VALUES (44, 78, 'for burn out, fatigue, and lack of energy');
INSERT INTO complementary_remedies VALUES (44, 37, 'for fatigue after eating');
INSERT INTO complementary_remedies VALUES (44, 39, 'for chronic constipation');
INSERT INTO complementary_remedies VALUES (44, 41, 'for acute constipation');
INSERT INTO complementary_remedies VALUES (44, 96, 'for cleansing of the lymphatic system');
INSERT INTO complementary_remedies VALUES (44, 138, 'for insomnia and restless sleep patterns');
INSERT INTO complementary_remedies VALUES (183, 87, 'for all types of herpes outbreaks');
INSERT INTO complementary_remedies VALUES (183, 141, 'for cleansing the liver and gallbladder');
INSERT INTO complementary_remedies VALUES (183, 168, 'for urinary tract infections');
INSERT INTO complementary_remedies VALUES (183, 44, 'for cleansing of the liver');
INSERT INTO complementary_remedies VALUES (183, 97, 'for inflamed red eyes');
INSERT INTO complementary_remedies VALUES (183, 154, 'for vaginal discharge');
INSERT INTO complementary_remedies VALUES (185, 87, 'for deeper cleansing of the blood');
INSERT INTO complementary_remedies VALUES (185, 77, 'for replenishing the bone marrow');
INSERT INTO complementary_remedies VALUES (185, 35, 'replenishes the immune system and blood');
INSERT INTO complementary_remedies VALUES (185, 82, 'for immune system support');
INSERT INTO complementary_remedies VALUES (185, 96, 'for cleansing the lymphatic system');
INSERT INTO complementary_remedies VALUES (170, 170, 'With the appropriate presentation, herbal formulas which address the physiological needs of the patient are an important adjunct to the Flower Remedies. This holistic approach respects the intimate relationship of the body-mind-heart-spirit connection.    Emotional confusion and upset often accompanies physiological problems. By relating an emotion to the Five Phases Theory or the Four Humors, and applying an appropriate herbal formula can be very beneficial during the course of the healing process. An excess or lack of any emotion can serve as a guide to the systemic imbalance of the patient. The important thing to remember is to adapt and apply these theories in a creative and dynamic way. Rigidity spoils the soup, limits the possibilities, and closes the door to healing.');
INSERT INTO complementary_remedies VALUES (82, 77, 'for tired blood and low white blood count');
INSERT INTO complementary_remedies VALUES (82, 35, 'for recovery from a chronic illness');
INSERT INTO complementary_remedies VALUES (82, 62, 'for weakness in the lower body');
INSERT INTO complementary_remedies VALUES (82, 81, 'for recurring infections');
INSERT INTO complementary_remedies VALUES (82, 83, 'for fatigue, tired blood, and pale skin');
INSERT INTO complementary_remedies VALUES (82, 85, 'for exhaustion from chronic illness');
INSERT INTO complementary_remedies VALUES (82, 99, 'for chronic viral and bacterial infections');
INSERT INTO complementary_remedies VALUES (120, 135, 'for headaches and upper body pain');
INSERT INTO complementary_remedies VALUES (120, 188, 'for neck and shoulder stiffness');
INSERT INTO complementary_remedies VALUES (120, 121, 'for pain relief, joint and muscle pain');
INSERT INTO complementary_remedies VALUES (188, 58, 'for teeth grinding');
INSERT INTO complementary_remedies VALUES (74, 74, 'With the appropriate presentation, herbal formulas which address the physiological needs of the patient are an important adjunct to the Flower Remedies. This holistic approach respects the intimate relationship of the body-mind-heart-spirit connection.    Emotional confusion and upset often accompanies physiological problems. By relating an emotion to the Five Phases Theory or the Four Humors, and applying an appropriate herbal formula can be very beneficial during the course of the healing process.     An excess or lack of any emotion can serve as a guide to the systemic imbalance of the patient. The important thing to remember is to adapt and apply these theories in a creative and dynamic way. Rigidity spoils the soup, limits the possibilities, and closes the door to healing.');
INSERT INTO complementary_remedies VALUES (81, 77, 'for chronic blood weakness');
INSERT INTO complementary_remedies VALUES (81, 126, 'for bronchial infections and wet coughs');
INSERT INTO complementary_remedies VALUES (81, 35, 'for weakness following a illness');
INSERT INTO complementary_remedies VALUES (81, 78, 'for fatigue and burn out');
INSERT INTO complementary_remedies VALUES (81, 88, 'for sore throat and swollen glands');
INSERT INTO complementary_remedies VALUES (81, 89, 'for ear infections');
INSERT INTO complementary_remedies VALUES (81, 82, 'for enhancement of the immune system');
INSERT INTO complementary_remedies VALUES (81, 96, 'for viral and bacterial infections');
INSERT INTO complementary_remedies VALUES (81, 132, 'for sinus infections and nasal drip');
INSERT INTO complementary_remedies VALUES (114, 115, 'for low back and knee pain and inflammation');
INSERT INTO complementary_remedies VALUES (114, 188, 'for upper body pain and muscular distress');
INSERT INTO complementary_remedies VALUES (114, 123, 'for chronic low back pain and weakness');
INSERT INTO complementary_remedies VALUES (114, 194, 'for tendonitis, bursitis, carpal tunnel');
INSERT INTO complementary_remedies VALUES (157, 166, 'for retention of body fluids, edema');
INSERT INTO complementary_remedies VALUES (157, 15, 'for cold limbs & poor circulation, Reynauds');
INSERT INTO complementary_remedies VALUES (157, 169, 'for incontinence, spermatorrhea');
INSERT INTO complementary_remedies VALUES (157, 63, 'for dryness and hot palms and feet');
INSERT INTO complementary_remedies VALUES (157, 144, 'for support of the prostate gland');
INSERT INTO complementary_remedies VALUES (157, 122, 'for sciatica, pain running down the leg');
INSERT INTO complementary_remedies VALUES (157, 153, 'for menopausal symptoms');
INSERT INTO complementary_remedies VALUES (115, 113, 'for muscular cramps and spasms');
INSERT INTO complementary_remedies VALUES (115, 114, 'for arthritis, rheumatism, and joint pain');
INSERT INTO complementary_remedies VALUES (115, 157, 'for strengthening the lower body');
INSERT INTO complementary_remedies VALUES (115, 121, 'for joint and tendon inflammation and pain');
INSERT INTO complementary_remedies VALUES (115, 122, 'for sciatica pain or pinched nerve in the 			lower back');
INSERT INTO complementary_remedies VALUES (115, 123, 'for chronic low back weakness and pain');
INSERT INTO complementary_remedies VALUES (71, 71, 'With the appropriate presentation, herbal formulas which address the physiological needs of the patient are an important adjunct to the Flower Remedies. This holistic approach respects the intimate relationship of the body-mind-heart-spirit connection.    Emotional confusion and upset often accompanies physiological problems. By relating an emotion to the Five Phases Theory or the Four Humors, and applying an appropriate herbal formula can be very beneficial during the course of the healing process.     An excess or lack of any emotion can serve as a guide to the systemic imbalance of the patient. The important thing to remember is to adapt and apply these theories in a creative and dynamic way. Rigidity spoils the soup, limits the possibilities, and closes the door to healing');
INSERT INTO complementary_remedies VALUES (186, 186, 'There are some herbs available to help secure the fetus in cases of habitual or threatened miscarriages.    Consult a health care practitioner before taking any herbal formulas during pregnancy.');
INSERT INTO complementary_remedies VALUES (158, 87, 'for deeper cleansing action of the blood');
INSERT INTO complementary_remedies VALUES (158, 37, 'for acid reflux, indigestion after meals');
INSERT INTO complementary_remedies VALUES (158, 182, 'for heart burn');
INSERT INTO complementary_remedies VALUES (158, 96, 'for cleansing the lymphatic system');
INSERT INTO complementary_remedies VALUES (27, 87, 'for deeper cleansing action');
INSERT INTO complementary_remedies VALUES (27, 77, 'for bone marrow support');
INSERT INTO complementary_remedies VALUES (27, 25, 'for supporting the white blood cells');
INSERT INTO complementary_remedies VALUES (27, 61, 'for calming the emotions during high stress');
INSERT INTO complementary_remedies VALUES (27, 82, 'for rebuilding the immune system');
INSERT INTO complementary_remedies VALUES (27, 159, 'for rebuilding the function of the lungs');
INSERT INTO complementary_remedies VALUES (27, 96, 'for detoxification of the lymphatic system');
INSERT INTO complementary_remedies VALUES (27, 28, 'for support during exposure to high levels of 	radiation');
INSERT INTO complementary_remedies VALUES (159, 124, 'for chronic lung disorders and breathing 			difficulties');
INSERT INTO complementary_remedies VALUES (159, 125, 'for wheezing, tightness in chest, and asthma');
INSERT INTO complementary_remedies VALUES (159, 126, 'for bronchitis, moist coughs');
INSERT INTO complementary_remedies VALUES (159, 88, 'for sore throat and swollen glands');
INSERT INTO complementary_remedies VALUES (159, 127, 'for dry spasmodic cough');
INSERT INTO complementary_remedies VALUES (159, 80, 'for facial flushing and night sweats');
INSERT INTO complementary_remedies VALUES (159, 96, 'for viral and bacterial infections');
INSERT INTO complementary_remedies VALUES (159, 131, 'for chronic clear mucous');
INSERT INTO complementary_remedies VALUES (96, 126, 'for phlegmatic coughs and bronchitis');
INSERT INTO complementary_remedies VALUES (96, 88, 'for sore throat and swollen glands');
INSERT INTO complementary_remedies VALUES (96, 32, 'when the flu has settled in and the need to sweat it out');
INSERT INTO complementary_remedies VALUES (96, 92, 'for the initial stages of the flu');
INSERT INTO complementary_remedies VALUES (96, 33, 'for flu relief, fever, aches and pains');
INSERT INTO complementary_remedies VALUES (96, 132, 'for nasal and sinus congestion');
INSERT INTO complementary_remedies VALUES (96, 99, 'for chronic infections with weak immune 		system');
INSERT INTO complementary_remedies VALUES (144, 87, 'for deeper cleansing action of the blood');
INSERT INTO complementary_remedies VALUES (144, 168, 'for urinary tract infection');
INSERT INTO complementary_remedies VALUES (144, 82, 'for a compromised immune system');
INSERT INTO complementary_remedies VALUES (144, 157, 'for enhancing the energy of the kidneys');
INSERT INTO complementary_remedies VALUES (144, 96, 'for cleansing the lymphatic system');
INSERT INTO complementary_remedies VALUES (144, 99, 'for chronic infections and weak immunity');
INSERT INTO complementary_remedies VALUES (145, 143, 'for bringing more heart energy into the 			sexual arena');
INSERT INTO complementary_remedies VALUES (145, 169, 'for premature ejaculation');
INSERT INTO complementary_remedies VALUES (145, 63, 'for reducing tension around sexual   performance');
INSERT INTO complementary_remedies VALUES (145, 149, 'for impotence and weak libido');
INSERT INTO complementary_remedies VALUES (187, 36, 'for recovery from child birth, prevention of postpartum breakdowns');
INSERT INTO complementary_remedies VALUES (187, 65, 'for spotting after childbirth');
INSERT INTO complementary_remedies VALUES (187, 83, 'for blood and qi deficiency after childbirth');
INSERT INTO complementary_remedies VALUES (46, 60, 'for balancing the liver and spleen');
INSERT INTO complementary_remedies VALUES (46, 40, 'for watery diarrhea');
INSERT INTO complementary_remedies VALUES (46, 41, 'for acute constipation');
INSERT INTO complementary_remedies VALUES (46, 42, 'for inflammatory digestive disorders');
INSERT INTO complementary_remedies VALUES (46, 44, 'for liver cleansing and bile stimulation');
INSERT INTO complementary_remedies VALUES (46, 47, 'for healing the tissues of the digestive tract');
INSERT INTO complementary_remedies VALUES (118, 118, 'Movement Makes Better can be combined with any other herbal formula that is specific to the individuals internal disharmony or disorder, such as Joint Ease for arthritis, Head Ease for headaches, or Muscle Ease for muscular aches and pains.');
INSERT INTO complementary_remedies VALUES (119, 119, 'Movement Makes Worse can be combined with any other herbal formula that is specific to the individuals internal disharmony or disorder, such as Joint Ease for arthritis, Head Ease for headaches, or Muscle Ease for muscular aches and pains.');
INSERT INTO complementary_remedies VALUES (120, 113, 'for muscular cramps and spasms');
INSERT INTO complementary_remedies VALUES (120, 130, 'alternating chills and fever');
INSERT INTO complementary_remedies VALUES (188, 59, 'for relaxing the muscles and stabilizing');
INSERT INTO complementary_remedies VALUES (188, 113, 'for muscular cramps and spasms');
INSERT INTO complementary_remedies VALUES (188, 135, 'for upper body pain and headaches');
INSERT INTO complementary_remedies VALUES (188, 82, 'for fatigue and weak immunity');
INSERT INTO complementary_remedies VALUES (188, 114, 'for relief of arthritis and rheumatism');
INSERT INTO complementary_remedies VALUES (188, 121, 'for pain relief, anti-inflammatory');
INSERT INTO complementary_remedies VALUES (188, 83, 'for blood deficiency, anemia');
INSERT INTO complementary_remedies VALUES (136, 137, 'weakness or burn-out of the nervous system');
INSERT INTO complementary_remedies VALUES (136, 135, 'for nerve inflammation of the upper body 		and head');
INSERT INTO complementary_remedies VALUES (136, 122, 'for sciatic nerve pain');
INSERT INTO complementary_remedies VALUES (136, 99, 'for viral infection of the nervous system');
INSERT INTO complementary_remedies VALUES (137, 61, 'for high stress and anxiety, insomnia');
INSERT INTO complementary_remedies VALUES (137, 82, 'for rebuilding the bodies reserves');
INSERT INTO complementary_remedies VALUES (137, 136, 'for inflammation of the nerves');
INSERT INTO complementary_remedies VALUES (137, 65, 'for anxiety and panic from exhaustion and 	depletion');
INSERT INTO complementary_remedies VALUES (137, 83, 'for fatigue and rebuilding the blood');
INSERT INTO complementary_remedies VALUES (137, 138, 'for insomnia due to exhaustion and   depletion');
INSERT INTO complementary_remedies VALUES (137, 139, 'for an over-excited mind that refuses to 			stop, insomnia');
INSERT INTO complementary_remedies VALUES (137, 85, 'when pain causes physical or mental   exhaustion, collapse');
INSERT INTO complementary_remedies VALUES (107, 87, 'for detoxification of the blood');
INSERT INTO complementary_remedies VALUES (107, 69, 'for trauma and shock');
INSERT INTO complementary_remedies VALUES (107, 96, 'for detoxification of the lymph system');
INSERT INTO complementary_remedies VALUES (107, 11, 'for relieving the swelling');
INSERT INTO complementary_remedies VALUES (107, 98, 'for relieving the itching');
INSERT INTO complementary_remedies VALUES (121, 135, 'for additional pain relief in the head region');
INSERT INTO complementary_remedies VALUES (121, 114, 'for arthritic and rheumatic pain');
INSERT INTO complementary_remedies VALUES (121, 120, 'for chronic muscular tension');
INSERT INTO complementary_remedies VALUES (121, 188, 'for neck and shoulder stiffness and pain');
INSERT INTO complementary_remedies VALUES (121, 194, 'for pain in the arms and wrists');
INSERT INTO complementary_remedies VALUES (64, 69, 'for trauma, panic, and anxiety');
INSERT INTO complementary_remedies VALUES (64, 60, 'for strengthening the digestive process');
INSERT INTO complementary_remedies VALUES (64, 65, 'for panic and anxiety due to exhaustion and 	depletion');
INSERT INTO complementary_remedies VALUES (64, 131, 'for chronic mucous and phlegm');
INSERT INTO complementary_remedies VALUES (65, 130, 'for calming, irritability, and stressed out');
INSERT INTO complementary_remedies VALUES (65, 137, 'for fortifying the nervous system due to 			exhaustion');
INSERT INTO complementary_remedies VALUES (65, 138, 'for insomnia and restless sleep due to exhaustion');
INSERT INTO complementary_remedies VALUES (131, 125, 'for asthmatic breathing');
INSERT INTO complementary_remedies VALUES (131, 35, 'for fortifying the blood and qi');
INSERT INTO complementary_remedies VALUES (131, 59, 'for depression and weakness');
INSERT INTO complementary_remedies VALUES (131, 60, 'for digestive support');
INSERT INTO complementary_remedies VALUES (131, 130, 'for a hot and cold personality');
INSERT INTO complementary_remedies VALUES (131, 132, 'for nasal congestion and running nose');
INSERT INTO complementary_remedies VALUES (131, 160, 'for weak appetite and loose stool');
INSERT INTO complementary_remedies VALUES (131, 99, 'for infections with weakened immunity');
INSERT INTO complementary_remedies VALUES (149, 143, 'for bringing relaxation surrounding sexuality');
INSERT INTO complementary_remedies VALUES (149, 169, 'for premature ejaculation');
INSERT INTO complementary_remedies VALUES (149, 63, 'for tension and overly self-aware during sex');
INSERT INTO complementary_remedies VALUES (149, 157, 'for strengthening the kidney yin and the 		kidney yang');
INSERT INTO complementary_remedies VALUES (149, 145, 'for low sperm count or infertility');
INSERT INTO complementary_remedies VALUES (83, 36, 'for emotional and physical depletion');
INSERT INTO complementary_remedies VALUES (83, 78, 'for chronic fatigue and depletion of energy');
INSERT INTO complementary_remedies VALUES (83, 60, 'for strengthening the assimilation of   nutrients');
INSERT INTO complementary_remedies VALUES (83, 130, 'for liver support and improved digestion');
INSERT INTO complementary_remedies VALUES (83, 65, 'for anxiety, panic, and spotting');
INSERT INTO complementary_remedies VALUES (83, 150, 'or PMS and chronic hormonal swings');
INSERT INTO complementary_remedies VALUES (83, 152, 'for irregular menstruation');
INSERT INTO complementary_remedies VALUES (19, 103, 'to arrest bleeding');
INSERT INTO complementary_remedies VALUES (19, 39, 'for chronic constipation');
INSERT INTO complementary_remedies VALUES (19, 41, 'for acute constipation');
INSERT INTO complementary_remedies VALUES (19, 18, 'for severe hemorrhoids');
INSERT INTO complementary_remedies VALUES (19, 85, 'for prolapse of tissues and organs');
INSERT INTO complementary_remedies VALUES (18, 103, 'to arrest bleeding');
INSERT INTO complementary_remedies VALUES (18, 39, 'for chronic constipation');
INSERT INTO complementary_remedies VALUES (18, 41, 'for acute constipation');
INSERT INTO complementary_remedies VALUES (18, 19, 'for severe hemorrhoids');
INSERT INTO complementary_remedies VALUES (18, 85, 'for prolapse of tissues');
INSERT INTO complementary_remedies VALUES (29, 25, 'for support of the immune system during 		chemotherapy');
INSERT INTO complementary_remedies VALUES (29, 168, 'for cleansing of the urogenital system');
INSERT INTO complementary_remedies VALUES (29, 63, 'brings nourishment to the kidneys');
INSERT INTO complementary_remedies VALUES (29, 144, 'supports a healthy prostate gland');
INSERT INTO complementary_remedies VALUES (29, 28, 'for protection of the tissues during radiation therapy');
INSERT INTO complementary_remedies VALUES (75, 75, 'With the appropriate presentation, herbal formulas which address the physiological needs of the patient are an important adjunct to the Flower Remedies. This holistic approach respects the intimate relationship of the body-mind-heart-spirit connection.    Emotional confusion and upset often accompanies physiological problems. By relating an emotion to the Five Phases Theory or the Four Humors, and applying an appropriate herbal formula can be very beneficial during the course of the healing process.     An excess or lack of any emotion can serve as a guide to the systemic imbalance of the patient. The important thing to remember is to adapt and apply these theories in a creative and dynamic way. Rigidity spoils the soup, limits the possibilities, and closes the door to healing.');
INSERT INTO complementary_remedies VALUES (10, 83, 'for fatigue, anemia, and weak blood');
INSERT INTO complementary_remedies VALUES (10, 11, 'for additional blood detoxification');
INSERT INTO complementary_remedies VALUES (10, 12, 'for chronic dry skin');
INSERT INTO complementary_remedies VALUES (189, 79, 'for retinal degeneration');
INSERT INTO complementary_remedies VALUES (189, 63, 'moistens the body fluids and kidney tonic');
INSERT INTO complementary_remedies VALUES (189, 80, 'for excess heat in the upper body and night sweats');
INSERT INTO complementary_remedies VALUES (189, 157, 'for debility, no motivation, and cold body');
INSERT INTO complementary_remedies VALUES (189, 158, 'for nourishing and cleansing of the liver');
INSERT INTO complementary_remedies VALUES (189, 189, 'for loss of vision due to aging');
INSERT INTO complementary_remedies VALUES (189, 97, 'for red, itchy eyes and inflammation');
INSERT INTO complementary_remedies VALUES (164, 164, 'With the appropriate presentation, herbal formulas which address the physiological needs of the patient are an important adjunct to the Flower Remedies. This holistic approach respects the intimate relationship of the body-mind-heart-spirit connection.    Emotional confusion and upset often accompanies physiological problems. By relating an emotion to the Five Phases Theory or the Four Humors, and applying an appropriate herbal formula can be very beneficial during the course of the healing process.     An excess or lack of any emotion can serve as a guide to the systemic imbalance of the patient. The important thing to remember is to adapt and apply these theories in a creative and dynamic way. Rigidity spoils the soup, limits the possibilities, and closes the door to healing.');
INSERT INTO complementary_remedies VALUES (123, 122, 'for sciatica or pinched nerve in lower back');
INSERT INTO complementary_remedies VALUES (30, 58, 'for calming, teeth grinder, insomnia');
INSERT INTO complementary_remedies VALUES (30, 59, 'for emotional highs and lows, mood swings');
INSERT INTO complementary_remedies VALUES (30, 130, 'for irritability, anxiousness, edgy');
INSERT INTO complementary_remedies VALUES (30, 83, 'for fatigue and tired blood');
INSERT INTO complementary_remedies VALUES (76, 76, 'With the appropriate presentation, herbal formulas which address the physiological needs of the patient are an important adjunct to the Flower Remedies. This holistic approach respects the intimate relationship of the body-mind-heart-spirit connection.    Emotional confusion and upset often accompanies physiological problems. By relating an emotion to the Five Phases Theory or the Four Humors, and applying an appropriate herbal formula can be very beneficial during the course of the healing process.     An excess or lack of any emotion can serve as a guide to the systemic imbalance of the patient. The important thing to remember is to adapt and apply these theories in a creative and dynamic way. Rigidity spoils the soup, limits the possibilities, and closes the door to healing.');
INSERT INTO complementary_remedies VALUES (28, 77, 'for rebuilding the white blood count');
INSERT INTO complementary_remedies VALUES (28, 63, 'for dry mouth and throat, night sweats');
INSERT INTO complementary_remedies VALUES (28, 82, 'for rebuilding the immune system');
INSERT INTO complementary_remedies VALUES (28, 76, 'for emotional protection from radiation');
INSERT INTO complementary_remedies VALUES (28, 11, 'for clearing radiation burns');
INSERT INTO complementary_remedies VALUES (97, 87, 'for cleansing the blood');
INSERT INTO complementary_remedies VALUES (97, 79, 'for macular degeneration, retinitis');
INSERT INTO complementary_remedies VALUES (97, 80, 'for heat or dryness in the upper body');
INSERT INTO complementary_remedies VALUES (97, 44, 'for liver and/or gallbladder pain');
INSERT INTO complementary_remedies VALUES (97, 96, 'for cleansing the lymphatic system');
INSERT INTO complementary_remedies VALUES (97, 189, 'for blurred vision, corneal ulcers, glaucoma');
INSERT INTO complementary_remedies VALUES (138, 61, 'for irritability and inability to concentrate');
INSERT INTO complementary_remedies VALUES (138, 130, 'for edginess, belligerence, and anger');
INSERT INTO complementary_remedies VALUES (138, 65, 'for excessive thought, worry, and anxiety');
INSERT INTO complementary_remedies VALUES (138, 67, 'for anxiety with palpitations');
INSERT INTO complementary_remedies VALUES (122, 113, 'for severe muscular cramps and spasms');
INSERT INTO complementary_remedies VALUES (122, 114, 'for arthritic aches and pains');
INSERT INTO complementary_remedies VALUES (122, 115, 'for inflammation of the lower back or knees');
INSERT INTO complementary_remedies VALUES (122, 118, 'for pain that decreases with movement');
INSERT INTO complementary_remedies VALUES (122, 120, 'for muscular tension and spasms');
INSERT INTO complementary_remedies VALUES (122, 137, 'for restoring the nerves');
INSERT INTO complementary_remedies VALUES (122, 121, 'for arthritic and rheumatic aches and pains');
INSERT INTO complementary_remedies VALUES (122, 123, 'for chronic weakness in the lower back and	lower body');
INSERT INTO complementary_remedies VALUES (132, 126, 'for bronchial and respiratory infections, 			moist cough');
INSERT INTO complementary_remedies VALUES (132, 88, 'for sore throat and strep infections, swollen glands, tonsillitis');
INSERT INTO complementary_remedies VALUES (132, 33, 'for contagious diseases, colds, flu, fever');
INSERT INTO complementary_remedies VALUES (132, 135, 'for headache with sinus infection');
INSERT INTO complementary_remedies VALUES (132, 96, 'for contagious diseases and infections');
INSERT INTO complementary_remedies VALUES (132, 131, 'for chronic clear mucous');
INSERT INTO complementary_remedies VALUES (11, 87, 'for deeper cleansing of the blood');
INSERT INTO complementary_remedies VALUES (11, 7, 'for eczema, contact dermatitis, and skin 		rashes');
INSERT INTO complementary_remedies VALUES (11, 10, 'for psoriasis, rashes, weepy, red, itchy skin');
INSERT INTO complementary_remedies VALUES (11, 98, 'for hives, itchy skin, and allergic skin rashes');
INSERT INTO complementary_remedies VALUES (11, 12, 'for dry and aging skin');
INSERT INTO complementary_remedies VALUES (98, 87, 'for deeper cleansing of the blood');
INSERT INTO complementary_remedies VALUES (98, 141, 'for allergic reactions');
INSERT INTO complementary_remedies VALUES (98, 44, 'for cleansing of the liver and gall bladder  Irritation Remedy');
INSERT INTO complementary_remedies VALUES (98, 74, 'for emotional irritability');
INSERT INTO complementary_remedies VALUES (98, 11, 'for various outbreaks of the skin');
INSERT INTO complementary_remedies VALUES (12, 1, 'for acne, adolescent acne, chronic skin   problems');
INSERT INTO complementary_remedies VALUES (12, 63, 'for dry skin, dry mouth and throat');
INSERT INTO complementary_remedies VALUES (12, 83, 'for building healthier blood');
INSERT INTO complementary_remedies VALUES (12, 11, 'for occasional skin blemishes and boils');
INSERT INTO complementary_remedies VALUES (12, 150, 'for hormonal acne');
INSERT INTO complementary_remedies VALUES (12, 153, 'for menopause and hormone deficiency');
INSERT INTO complementary_remedies VALUES (139, 143, 'for calming a stressed body and mind');
INSERT INTO complementary_remedies VALUES (139, 61, 'for irritability and inability to concentrate');
INSERT INTO complementary_remedies VALUES (139, 130, 'for edginess, belligerence, and anger');
INSERT INTO complementary_remedies VALUES (139, 65, 'for excessive thought, worry, and anxiety');
INSERT INTO complementary_remedies VALUES (139, 67, 'for anxiety with palpitations');
INSERT INTO complementary_remedies VALUES (47, 103, 'for internal bleeding');
INSERT INTO complementary_remedies VALUES (47, 37, 'for indigestion following meals');
INSERT INTO complementary_remedies VALUES (47, 182, 'for heart burn and acid reflux');
INSERT INTO complementary_remedies VALUES (47, 40, 'for stomach or duodenal ulcers');
INSERT INTO complementary_remedies VALUES (47, 42, 'for colitis or irritable bowels');
INSERT INTO complementary_remedies VALUES (47, 44, 'for gentle cleansing of the liver and gall 			bladder');
INSERT INTO complementary_remedies VALUES (47, 46, 'for vomiting and diarrhea, dysentery');
INSERT INTO complementary_remedies VALUES (47, 48, 'for nausea and vomiting');
INSERT INTO complementary_remedies VALUES (133, 135, 'for headaches with sinus congestion');
INSERT INTO complementary_remedies VALUES (133, 44, 'for supporting the livers production of   antihistamines');
INSERT INTO complementary_remedies VALUES (133, 82, 'for strengthening the bodys defense');
INSERT INTO complementary_remedies VALUES (133, 81, 'for chronic infections that effect the sinuses');
INSERT INTO complementary_remedies VALUES (133, 97, 'for red, itchy eyes with allergies');
INSERT INTO complementary_remedies VALUES (133, 57, 'for calming and cleansing of the liver');
INSERT INTO complementary_remedies VALUES (66, 57, 'for calming and cleansing of the liver');
INSERT INTO complementary_remedies VALUES (66, 68, 'for breaking the emotional links');
INSERT INTO complementary_remedies VALUES (66, 61, 'for calming an overly excited personality');
INSERT INTO complementary_remedies VALUES (66, 158, 'for a weaker constitution with emotional 		withdrawal');
INSERT INTO complementary_remedies VALUES (66, 65, 'for calming a more subdued personality');
INSERT INTO complementary_remedies VALUES (66, 138, 'for restless sleep or surface sleep');
INSERT INTO complementary_remedies VALUES (66, 139, 'for insomnia with a non-stop mind');
INSERT INTO complementary_remedies VALUES (160, 35, 'for weakness, loss of weight, poor digestion');
INSERT INTO complementary_remedies VALUES (160, 37, 'for indigestion after meals, heart burn');
INSERT INTO complementary_remedies VALUES (160, 58, 'for depression and feel like stuck in a rut');
INSERT INTO complementary_remedies VALUES (160, 130, 'for negative and aggressive behavior');
INSERT INTO complementary_remedies VALUES (160, 46, 'for vomiting and diarrhea');
INSERT INTO complementary_remedies VALUES (160, 47, 'for intestinal inflammation and nutritional impairment, weakness');
INSERT INTO complementary_remedies VALUES (84, 35, 'for weakness and loss of weight');
INSERT INTO complementary_remedies VALUES (84, 78, 'for exhaustion, low vitality, and general 			lassitude');
INSERT INTO complementary_remedies VALUES (84, 62, 'for lower back pain and weak lower body');
INSERT INTO complementary_remedies VALUES (84, 83, 'for fatigue and weak blood, dizziness');
INSERT INTO complementary_remedies VALUES (84, 149, 'for weak libido in men and fatigue after sex');
INSERT INTO complementary_remedies VALUES (84, 211, 'for weak libido in women, no interest in sex');
INSERT INTO complementary_remedies VALUES (48, 60, 'for chronic digestive disorders');
INSERT INTO complementary_remedies VALUES (48, 40, 'for gastric hyperacidity and abdominal pain');
INSERT INTO complementary_remedies VALUES (48, 44, 'for inconsistent stools and feeling blah');
INSERT INTO complementary_remedies VALUES (48, 46, 'for vomiting and diarrhea');
INSERT INTO complementary_remedies VALUES (48, 47, 'for inflammation of the digestive tract');
INSERT INTO complementary_remedies VALUES (48, 160, 'for diarrhea and lack of appetite');
INSERT INTO complementary_remedies VALUES (123, 113, 'for muscular cramps and spasms');
INSERT INTO complementary_remedies VALUES (123, 114, 'for arthritis, rheumatism, and joint pain');
INSERT INTO complementary_remedies VALUES (123, 157, 'for strengthening the lower body');
INSERT INTO complementary_remedies VALUES (123, 115, 'for stiffness and swelling in the lower back and knees');
INSERT INTO complementary_remedies VALUES (123, 121, 'for joint and tendon inflammation and pain');
INSERT INTO complementary_remedies VALUES (31, 6, 'for obesity, overweight');
INSERT INTO complementary_remedies VALUES (31, 79, 'for dry eyes, cataracts');
INSERT INTO complementary_remedies VALUES (31, 4, 'for gnawing hunger and excess appetite');
INSERT INTO complementary_remedies VALUES (31, 80, 'for night sweats and dry mouth');
INSERT INTO complementary_remedies VALUES (31, 157, 'for excess urination and weak lower body');
INSERT INTO complementary_remedies VALUES (31, 159, 'for dry throat and dry cough');
INSERT INTO complementary_remedies VALUES (31, 136, 'for neuropathy');
INSERT INTO complementary_remedies VALUES (54, 49, 'for colic and indigestion');
INSERT INTO complementary_remedies VALUES (54, 51, 'for feverish conditions during teething');
INSERT INTO complementary_remedies VALUES (54, 55, 'for teething, especially suits those infants 		who bare their challenges stoically');
INSERT INTO complementary_remedies VALUES (55, 49, 'for colic and indigestion');
INSERT INTO complementary_remedies VALUES (55, 51, 'for feverish conditions during teething');
INSERT INTO complementary_remedies VALUES (14, 87, 'for cleansing the blood');
INSERT INTO complementary_remedies VALUES (14, 62, 'for oily hair');
INSERT INTO complementary_remedies VALUES (14, 83, 'for weakness in the blood');
INSERT INTO complementary_remedies VALUES (14, 11, 'for scaly scalp conditions');
INSERT INTO complementary_remedies VALUES (14, 12, 'for dry skin and hair');
INSERT INTO complementary_remedies VALUES (67, 61, 'unable to concentrate, palpitations, insomnia');
INSERT INTO complementary_remedies VALUES (67, 137, 'for nourishing the nerves and calming');
INSERT INTO complementary_remedies VALUES (67, 65, 'for excessive worry or thought, depleted');
INSERT INTO complementary_remedies VALUES (67, 138, 'for restless and surface sleep');
INSERT INTO complementary_remedies VALUES (67, 139, 'for inability to fall asleep');
INSERT INTO complementary_remedies VALUES (193, 193, 'When there is a need to induce vomiting, all other herbal formulas should be suspended until the situation returns to normal.');
INSERT INTO complementary_remedies VALUES (85, 35, 'for fatigue following an illness');
INSERT INTO complementary_remedies VALUES (85, 78, 'for stress, burnt out, fatigue');
INSERT INTO complementary_remedies VALUES (85, 60, 'for weak digestion and anxiety');
INSERT INTO complementary_remedies VALUES (85, 62, 'for weak lower body with cold extremities');
INSERT INTO complementary_remedies VALUES (85, 18, 'for hemorrhoids (piles)');
INSERT INTO complementary_remedies VALUES (85, 84, 'for adrenal exhaustion');
INSERT INTO complementary_remedies VALUES (99, 87, 'for cleansing of the blood');
INSERT INTO complementary_remedies VALUES (99, 33, 'for flu like symptoms');
INSERT INTO complementary_remedies VALUES (99, 130, 'for alternating chills and fevers');
INSERT INTO complementary_remedies VALUES (99, 183, 'for deep seated viral infections, herpes, 			shingles');
INSERT INTO complementary_remedies VALUES (99, 82, 'for a weakened immune system');
INSERT INTO complementary_remedies VALUES (99, 114, 'for joint aches and pains');
INSERT INTO complementary_remedies VALUES (99, 96, 'for cleansing of the lymphatic system');
INSERT INTO complementary_remedies VALUES (22, 60, 'for weak digestion and anxiety');
INSERT INTO complementary_remedies VALUES (22, 19, 'for hemorrhoids');
INSERT INTO complementary_remedies VALUES (22, 18, 'for hemorrhoids');
INSERT INTO complementary_remedies VALUES (22, 160, 'for weak appetite, exhaustion upon exertion');
INSERT INTO complementary_remedies VALUES (22, 85, 'for fatigue, collapsed organs, sleep curled up in a ball');
INSERT INTO complementary_remedies VALUES (110, 87, 'for detoxification of the blood');
INSERT INTO complementary_remedies VALUES (110, 69, 'for trauma and shock');
INSERT INTO complementary_remedies VALUES (110, 44, 'for cleansing the liver');
INSERT INTO complementary_remedies VALUES (110, 96, 'for detoxification of the lymph system');
INSERT INTO complementary_remedies VALUES (110, 11, 'for relieving the swelling');
INSERT INTO complementary_remedies VALUES (110, 98, 'for relieving the itching');
INSERT INTO complementary_remedies VALUES (110, 99, 'for detoxification of the body and support the immune system');
INSERT INTO complementary_remedies VALUES (134, 124, 'for chronic and long-standing lung and 			breathing problems');
INSERT INTO complementary_remedies VALUES (134, 125, 'for asthma (chronic bronchial asthma and 		mild asthma)');
INSERT INTO complementary_remedies VALUES (134, 125, 'for acute and chronic coughs with mucous');
INSERT INTO complementary_remedies VALUES (134, 127, 'for acute and chronic dry coughs with no 		mucous');
INSERT INTO complementary_remedies VALUES (134, 159, 'for dry chronic cough, cough with scanty 		mucous, wheezing');
INSERT INTO complementary_remedies VALUES (134, 131, 'for coughing with copious sputum, chronic mucous');
INSERT INTO complementary_remedies VALUES (150, 78, 'for exhaustion, low blood pressure, and 			general 	lassitude');
INSERT INTO complementary_remedies VALUES (150, 113, 'for acute and chronic menstrual spasms and 	cramps');
INSERT INTO complementary_remedies VALUES (150, 147, 'for abdominal masses, fluid cysts, menstrual 	pain');
INSERT INTO complementary_remedies VALUES (150, 148, 'for lower abdominal masses, uterine fibroids');
INSERT INTO complementary_remedies VALUES (150, 83, 'for fatigue, tired blood, maintaining smooth 	and pain free periods');
INSERT INTO complementary_remedies VALUES (154, 35, 'for weakness, loss of weight, poor digestion and assimilation');
INSERT INTO complementary_remedies VALUES (154, 60, 'for weak digestion and anxiety');
INSERT INTO complementary_remedies VALUES (154, 183, 'for foul smelling leukorrhea, genital herpes');
INSERT INTO complementary_remedies VALUES (154, 157, 'for weakness in the lower body');
INSERT INTO complementary_remedies VALUES (154, 160, 'for tendency to loose stool or diarrhea,   distention, nausea');
INSERT INTO complementary_remedies VALUES (152, 78, 'for fatigue due to frequent and prolonged 		stress');
INSERT INTO complementary_remedies VALUES (152, 119, 'for pain that worsens with movement');
INSERT INTO complementary_remedies VALUES (152, 65, 'for early or prolonged menstruations,   anemia, spotting');
INSERT INTO complementary_remedies VALUES (152, 83, 'for fatigue, tired blood, irregular   menstruation');
INSERT INTO complementary_remedies VALUES (152, 152, 'for infertility, mild or persistent uterine 			bleeding');
INSERT INTO complementary_remedies VALUES (153, 168, 'for frequent bladder infections');
INSERT INTO complementary_remedies VALUES (153, 61, 'for stress and insomnia');
INSERT INTO complementary_remedies VALUES (153, 211, 'for a weak libido');
INSERT INTO complementary_remedies VALUES (153, 63, 'for dry mouth, afternoon fever');
INSERT INTO complementary_remedies VALUES (153, 80, 'for frequent hot flashes, night sweats');
INSERT INTO complementary_remedies VALUES (153, 183, 'for vaginal herpes');
INSERT INTO complementary_remedies VALUES (153, 138, 'for restless and shallow sleep');
INSERT INTO complementary_remedies VALUES (153, 12, 'for dry, aging skin');
INSERT INTO complementary_remedies VALUES (153, 14, 'for thinning hair');
INSERT INTO complementary_remedies VALUES (153, 85, 'for prolapsed organs or depletion');
INSERT INTO complementary_remedies VALUES (155, 143, 'for nervous exhaustion, stress, insomnia');
INSERT INTO complementary_remedies VALUES (155, 211, 'for sexual exhaustion, debility, lack of libido');
INSERT INTO complementary_remedies VALUES (155, 63, 'for dryness of sexual fluids');
INSERT INTO complementary_remedies VALUES (155, 83, 'for PMS, infertility, habitual miscarriage');
INSERT INTO complementary_remedies VALUES (155, 152, 'for anemia, fatigue, menstrual irregularity');
INSERT INTO complementary_remedies VALUES (56, 56, 'To ensure a daily bowel movement, take either GI Movement or GI Corrective.     We recommend that following a successful worming treatment program, a herbal formula be taken to tone the digestive tract, such as:');
INSERT INTO complementary_remedies VALUES (56, 60, 'for supporting digestion, calming, and   	relieving stagnation');
INSERT INTO complementary_remedies VALUES (56, 47, 'for soothing the mucous membranes in the 	digestive system');
INSERT INTO complementary_remedies VALUES (56, 160, 'for poor assimilation of food, weak appetite');
INSERT INTO complementary_remedies VALUES (194, 135, 'for headache and stiff upper back');
INSERT INTO complementary_remedies VALUES (194, 114, 'for arthritis, rheumatism, stiff and achy 			joints');
INSERT INTO complementary_remedies VALUES (194, 119, 'for pain that worsens with movement');
INSERT INTO complementary_remedies VALUES (194, 120, 'for chronic muscular tension');
INSERT INTO complementary_remedies VALUES (194, 188, 'for bursitis, tendonitis, limited mobility in the upper body');
INSERT INTO complementary_remedies VALUES (194, 121, 'for numbness, neuralgia');
INSERT INTO complementary_remedies VALUES (103, 101, 'for wounds to the skin');
INSERT INTO complementary_remedies VALUES (103, 180, 'for bruises and wounds');
INSERT INTO complementary_remedies VALUES (103, 109, 'for sprains and pulled muscles');
INSERT INTO complementary_remedies VALUES (180, 103, 'for internal hemorrhaging, black and blue bruises');
INSERT INTO complementary_remedies VALUES (180, 162, 'for trauma to muscles, tissues, and joints');
INSERT INTO complementary_remedies VALUES (180, 118, 'for pain that decrease with movement');
INSERT INTO complementary_remedies VALUES (180, 119, 'for pain that intensifies with movement');
INSERT INTO complementary_remedies VALUES (180, 120, 'for muscular tension and stiffness');
INSERT INTO complementary_remedies VALUES (180, 136, 'for inflamed nerve fibers');
INSERT INTO complementary_remedies VALUES (180, 121, 'for pain relief');
INSERT INTO complementary_remedies VALUES (180, 123, 'for low back pain');
INSERT INTO complementary_remedies VALUES (180, 101, 'for cleansing the affected area');
INSERT INTO complementary_remedies VALUES (104, 87, 'for cleansing the blood');
INSERT INTO complementary_remedies VALUES (104, 69, 'for emotional trauma and shock');
INSERT INTO complementary_remedies VALUES (104, 82, 'for supporting the immune system');
INSERT INTO complementary_remedies VALUES (104, 28, 'for clearing burns and nourishing the blood');
INSERT INTO complementary_remedies VALUES (104, 76, 'for clearing surface burns');
INSERT INTO complementary_remedies VALUES (104, 12, 'for supporting healthy skin tissue');
INSERT INTO complementary_remedies VALUES (104, 101, 'for cleansing the affected area');
INSERT INTO complementary_remedies VALUES (142, 87, 'for cleansing of the blood');
INSERT INTO complementary_remedies VALUES (142, 105, 'for insect bites');
INSERT INTO complementary_remedies VALUES (142, 7, 'for eczema, dermatitis');
INSERT INTO complementary_remedies VALUES (142, 183, 'for herpes outbreak');
INSERT INTO complementary_remedies VALUES (142, 10, 'for psoriasis, dermatitis');
INSERT INTO complementary_remedies VALUES (142, 11, 'for carbuncles, sores, and boils');
INSERT INTO complementary_remedies VALUES (142, 99, 'for deeper detoxification and immune   support');
INSERT INTO complementary_remedies VALUES (142, 101, 'for cleansing the affected area');
INSERT INTO complementary_remedies VALUES (3, 87, 'for cleansing of the blood');
INSERT INTO complementary_remedies VALUES (3, 7, 'for eczema');
INSERT INTO complementary_remedies VALUES (3, 11, 'for skin suppurations, pimples, and acne');
INSERT INTO complementary_remedies VALUES (3, 12, 'for chronic dry skin');
INSERT INTO complementary_remedies VALUES (3, 101, 'for cleansing the affected area');
INSERT INTO complementary_remedies VALUES (3, 8, 'for fungal infections, apply prior to Calendula Cream');
INSERT INTO complementary_remedies VALUES (112, 15, 'for cold limbs and poor circulation');
INSERT INTO complementary_remedies VALUES (112, 113, 'for muscular cramps and spasms');
INSERT INTO complementary_remedies VALUES (112, 114, 'for arthritis and joint pain');
INSERT INTO complementary_remedies VALUES (112, 115, 'for knee and back pain');
INSERT INTO complementary_remedies VALUES (112, 120, 'for muscular stiffness');
INSERT INTO complementary_remedies VALUES (112, 188, 'for upper body pain');
INSERT INTO complementary_remedies VALUES (112, 121, 'for aches and pains of the body');
INSERT INTO complementary_remedies VALUES (112, 123, 'for weakness in the lower back, lumbago');
INSERT INTO complementary_remedies VALUES (112, 194, 'for pain in the arms');
INSERT INTO complementary_remedies VALUES (5, 7, 'for eczema, dermatitis, and rough skin');
INSERT INTO complementary_remedies VALUES (5, 83, 'for weak blood, pale skin, and fatigue');
INSERT INTO complementary_remedies VALUES (5, 11, 'for acne and skin outbreaks');
INSERT INTO complementary_remedies VALUES (5, 12, 'for chronic dry skin');
INSERT INTO complementary_remedies VALUES (5, 152, 'for balancing a womans hormones');
INSERT INTO complementary_remedies VALUES (53, 49, 'if colic or any digestive disturbances are 		present in the baby');
INSERT INTO complementary_remedies VALUES (53, 101, 'for cleansing the affected area');
INSERT INTO complementary_remedies VALUES (181, 88, 'for sore throat and swollen glands');
INSERT INTO complementary_remedies VALUES (181, 89, 'for ear aches and fluid build-up in the ear canals');
INSERT INTO complementary_remedies VALUES (181, 33, 'for symptom relief from the flu');
INSERT INTO complementary_remedies VALUES (181, 135, 'for headache and congestion');
INSERT INTO complementary_remedies VALUES (181, 81, 'for chronic recurring infections');
INSERT INTO complementary_remedies VALUES (181, 96, 'for bacterial and viral infections');
INSERT INTO complementary_remedies VALUES (181, 131, 'for excessive mucous');
INSERT INTO complementary_remedies VALUES (181, 132, 'for nasal discharge and sinus infection');
INSERT INTO complementary_remedies VALUES (106, 87, 'for cleansing of the blood');
INSERT INTO complementary_remedies VALUES (106, 79, 'for dry eyes, macular degeneration retinitis');
INSERT INTO complementary_remedies VALUES (106, 135, 'for headaches and frontal congestion');
INSERT INTO complementary_remedies VALUES (106, 44, 'for liver cleansing and enhance the production of antihistamines');
INSERT INTO complementary_remedies VALUES (106, 97, 'for relieving red, itchy eyes');
INSERT INTO complementary_remedies VALUES (106, 132, 'for acute and chronic sinus infections');
INSERT INTO complementary_remedies VALUES (106, 133, 'for seasonal allergies and itchy eyes');
INSERT INTO complementary_remedies VALUES (8, 87, 'for detoxification of the blood');
INSERT INTO complementary_remedies VALUES (8, 91, 'for internal cleansing and immune enhancement');
INSERT INTO complementary_remedies VALUES (8, 44, 'for cleansing viruses from the liver');
INSERT INTO complementary_remedies VALUES (8, 11, 'for skin inflammations');
INSERT INTO complementary_remedies VALUES (8, 101, 'for cleansing the affected area');
INSERT INTO complementary_remedies VALUES (93, 87, 'for cleansing the blood from toxins');
INSERT INTO complementary_remedies VALUES (93, 182, 'for acid reflux and heartburn');
INSERT INTO complementary_remedies VALUES (93, 63, 'for strengthening the teeth and gums');
INSERT INTO complementary_remedies VALUES (93, 183, 'for herpes, mouth sores');
INSERT INTO complementary_remedies VALUES (93, 96, 'for viral and bacterial infections');
INSERT INTO complementary_remedies VALUES (93, 94, 'for gum disease, gingivitis, and mouth sores');
INSERT INTO complementary_remedies VALUES (94, 87, 'for cleansing the blood');
INSERT INTO complementary_remedies VALUES (94, 91, 'for cleansing and immune enhancement');
INSERT INTO complementary_remedies VALUES (94, 63, 'for mouth sores and teeth problems when accompanied with signs of dryness');
INSERT INTO complementary_remedies VALUES (94, 80, 'for excess heat in the head and upper body, night sweats, hot palms and feet');
INSERT INTO complementary_remedies VALUES (94, 96, 'for swollen lymph glands and toothache');
INSERT INTO complementary_remedies VALUES (94, 99, 'for infections and a weak immune system');
INSERT INTO complementary_remedies VALUES (94, 93, 'for cleansing the mouth and throat from harmful bacteria');
INSERT INTO complementary_remedies VALUES (94, 182, 'for heartburn, acid reflux');
INSERT INTO complementary_remedies VALUES (9, 35, 'for a depleted body and energy system');
INSERT INTO complementary_remedies VALUES (9, 62, 'for oily hair and skin');
INSERT INTO complementary_remedies VALUES (9, 158, 'for nourishing the liver and blood');
INSERT INTO complementary_remedies VALUES (9, 83, 'for fatigue and tired blood');
INSERT INTO complementary_remedies VALUES (9, 11, 'for scaly skin or dandruff');
INSERT INTO complementary_remedies VALUES (9, 12, 'for dryness of the skin');
INSERT INTO complementary_remedies VALUES (9, 84, 'for glandular support');
INSERT INTO complementary_remedies VALUES (9, 14, 'for thinning or receding hair');
INSERT INTO complementary_remedies VALUES (9, 5, 'for irritated, chapped, or itchy skin');
INSERT INTO complementary_remedies VALUES (9, 165, 'to help reduce scar tissue from blemishes');
INSERT INTO complementary_remedies VALUES (95, 103, 'for arresting bleeding');
INSERT INTO complementary_remedies VALUES (95, 87, 'for cleansing the blood');
INSERT INTO complementary_remedies VALUES (95, 161, 'for pain relief and discomfort');
INSERT INTO complementary_remedies VALUES (95, 162, 'for enhancing the internal healing process');
INSERT INTO complementary_remedies VALUES (95, 96, 'for viral and bacterial infections');
INSERT INTO complementary_remedies VALUES (128, 57, 'for rebellious behaviour');
INSERT INTO complementary_remedies VALUES (128, 68, 'for breaking the link to the addiction');
INSERT INTO complementary_remedies VALUES (128, 125, 'for asthma and wheezing');
INSERT INTO complementary_remedies VALUES (128, 126, 'for chronic mucous in the lungs');
INSERT INTO complementary_remedies VALUES (128, 127, 'for dry cough without mucous');
INSERT INTO complementary_remedies VALUES (128, 44, 'for detoxification of the liver');
INSERT INTO complementary_remedies VALUES (128, 71, 'for assistance in the emotional letting go of the habit');
INSERT INTO complementary_remedies VALUES (128, 159, 'for moistening the lungs and healing the 		lung tissues from smoke damage');
INSERT INTO complementary_remedies VALUES (128, 134, 'for acute asthma attacks and wheezing');
INSERT INTO complementary_remedies VALUES (116, 114, 'for arthritis and joint pain');
INSERT INTO complementary_remedies VALUES (116, 115, 'for knee and back pain');
INSERT INTO complementary_remedies VALUES (116, 120, 'for muscular stiffness');
INSERT INTO complementary_remedies VALUES (116, 188, 'for upper body pain');
INSERT INTO complementary_remedies VALUES (116, 121, 'for aches and pains of the body');
INSERT INTO complementary_remedies VALUES (116, 123, 'for weakness in the lower back, lumbago');
INSERT INTO complementary_remedies VALUES (116, 194, 'for pain in the arms');
INSERT INTO complementary_remedies VALUES (117, 113, 'for muscular cramps and spasms');
INSERT INTO complementary_remedies VALUES (117, 114, 'for arthritis and joint pain');
INSERT INTO complementary_remedies VALUES (117, 115, 'for knee and back pain');
INSERT INTO complementary_remedies VALUES (117, 120, 'for muscular stiffness');
INSERT INTO complementary_remedies VALUES (117, 188, 'for upper body pain');
INSERT INTO complementary_remedies VALUES (117, 121, 'for aches and pains of the body');
INSERT INTO complementary_remedies VALUES (117, 123, 'for weakness in the lower back, lumbago');
INSERT INTO complementary_remedies VALUES (117, 194, 'for pain in the arms');
INSERT INTO complementary_remedies VALUES (108, 103, 'arrests bleeding and helps tissues to mend');
INSERT INTO complementary_remedies VALUES (108, 87, 'for cleansing of the blood');
INSERT INTO complementary_remedies VALUES (108, 162, 'benefits the healing process for all injuries');
INSERT INTO complementary_remedies VALUES (108, 96, 'for cleansing of the lymphatic system');
INSERT INTO complementary_remedies VALUES (108, 120, 'for alleviating muscle tension');
INSERT INTO complementary_remedies VALUES (108, 121, 'for alleviating joint pain');
INSERT INTO complementary_remedies VALUES (108, 11, 'for boils and carbuncles');
INSERT INTO complementary_remedies VALUES (108, 101, 'for wounds to the skin');
INSERT INTO complementary_remedies VALUES (108, 180, 'for bruises and wounds');
INSERT INTO complementary_remedies VALUES (108, 109, 'for sprains and pulled muscles');
INSERT INTO complementary_remedies VALUES (165, 103, 'to arrest bleeding and help tissues to heal');
INSERT INTO complementary_remedies VALUES (165, 87, 'for infections and cleansing of the blood');
INSERT INTO complementary_remedies VALUES (165, 162, 'for surgery, wounds, broken bones, and 			traumatic injuries');
INSERT INTO complementary_remedies VALUES (165, 99, 'for internal cleansing and immune support');
INSERT INTO complementary_remedies VALUES (165, 101, 'for cleansing the affected area');
INSERT INTO complementary_remedies VALUES (109, 111, 'for broken bones, strained or torn ligaments');
INSERT INTO complementary_remedies VALUES (109, 114, 'for painful joints');
INSERT INTO complementary_remedies VALUES (109, 115, 'for injury and swelling to the lower back or knee');
INSERT INTO complementary_remedies VALUES (109, 120, 'for muscular tension and spasms');
INSERT INTO complementary_remedies VALUES (109, 188, 'for neck tension and shoulder inflammation');
INSERT INTO complementary_remedies VALUES (109, 121, 'for joint and tendon trauma');
INSERT INTO complementary_remedies VALUES (109, 123, 'for chronic lower back pain or weakness');
INSERT INTO complementary_remedies VALUES (109, 194, 'for bursitis, tendonitis, and carpal tunnel');
INSERT INTO complementary_remedies VALUES (13, 87, 'for cleansing of the blood');
INSERT INTO complementary_remedies VALUES (13, 44, 'for cleansing of the liver');
INSERT INTO complementary_remedies VALUES (13, 96, 'for cleansing of the lymphatic system');
INSERT INTO complementary_remedies VALUES (13, 99, 'for anti-viral activity');
INSERT INTO complementary_remedies VALUES (13, 101, 'for cleansing the affected area');
INSERT INTO complementary_remedies VALUES (151, 140, 'for a weak libido');
INSERT INTO complementary_remedies VALUES (151, 143, 'for opening of the heart');
INSERT INTO complementary_remedies VALUES (151, 211, 'for sexual exhaustion, debility, lack of libido');
INSERT INTO complementary_remedies VALUES (151, 211, 'for dryness of sexual fluids');
INSERT INTO complementary_remedies VALUES (151, 80, 'for hot flashes, night sweats');
INSERT INTO complementary_remedies VALUES (151, 65, 'for spotting between periods');
INSERT INTO complementary_remedies VALUES (151, 12, 'for aging, drying skin');
INSERT INTO complementary_remedies VALUES (151, 14, 'for thin and brittle hair');
INSERT INTO complementary_remedies VALUES (151, 153, 'for menopausal symptoms');
INSERT INTO complementary_remedies VALUES (151, 155, 'for mild or persistent uterine bleeding');


--
-- Data for Name: complementary_singles; Type: TABLE DATA; Schema: public; Owner: app
--

INSERT INTO complementary_singles VALUES (97, 100, 'action_1');
INSERT INTO complementary_singles VALUES (58, 100, 'action_1');
INSERT INTO complementary_singles VALUES (302, 1, 'action_2');
INSERT INTO complementary_singles VALUES (312, 1, 'action_2');
INSERT INTO complementary_singles VALUES (390, 1, 'action_2');
INSERT INTO complementary_singles VALUES (237, 1, 'action_2');
INSERT INTO complementary_singles VALUES (399, 57, 'action_2');
INSERT INTO complementary_singles VALUES (241, 57, 'action_2');
INSERT INTO complementary_singles VALUES (455, 57, 'action_2');
INSERT INTO complementary_singles VALUES (58, 124, 'action_2');
INSERT INTO complementary_singles VALUES (327, 124, 'action_2');
INSERT INTO complementary_singles VALUES (355, 124, 'action_2');
INSERT INTO complementary_singles VALUES (266, 124, 'action_2');
INSERT INTO complementary_singles VALUES (111, 166, 'action_2');
INSERT INTO complementary_singles VALUES (364, 166, 'action_2');
INSERT INTO complementary_singles VALUES (156, 166, 'action_2');
INSERT INTO complementary_singles VALUES (252, 166, 'action_2');
INSERT INTO complementary_singles VALUES (473, 166, 'action_2');
INSERT INTO complementary_singles VALUES (495, 1, 'action_2');
INSERT INTO complementary_singles VALUES (218, 57, 'action_2');
INSERT INTO complementary_singles VALUES (49, 20, 'action_2');
INSERT INTO complementary_singles VALUES (305, 20, 'action_2');
INSERT INTO complementary_singles VALUES (73, 20, 'action_2');
INSERT INTO complementary_singles VALUES (123, 20, 'action_2');
INSERT INTO complementary_singles VALUES (191, 20, 'action_2');
INSERT INTO complementary_singles VALUES (74, 49, 'action_2');
INSERT INTO complementary_singles VALUES (319, 49, 'action_2');
INSERT INTO complementary_singles VALUES (101, 36, 'action_2');
INSERT INTO complementary_singles VALUES (415, 36, 'action_2');
INSERT INTO complementary_singles VALUES (210, 36, 'action_2');
INSERT INTO complementary_singles VALUES (227, 36, 'action_2');
INSERT INTO complementary_singles VALUES (453, 36, 'action_2');
INSERT INTO complementary_singles VALUES (87, 58, 'action_2');
INSERT INTO complementary_singles VALUES (137, 58, 'action_2');
INSERT INTO complementary_singles VALUES (411, 58, 'action_2');
INSERT INTO complementary_singles VALUES (474, 58, 'action_2');
INSERT INTO complementary_singles VALUES (477, 58, 'action_2');
INSERT INTO complementary_singles VALUES (288, 17, 'action_2');
INSERT INTO complementary_singles VALUES (332, 17, 'action_2');
INSERT INTO complementary_singles VALUES (359, 17, 'action_2');
INSERT INTO complementary_singles VALUES (55, 103, 'action_2');
INSERT INTO complementary_singles VALUES (65, 103, 'action_2');
INSERT INTO complementary_singles VALUES (156, 103, 'action_3');
INSERT INTO complementary_singles VALUES (155, 87, 'action_2');
INSERT INTO complementary_singles VALUES (194, 87, 'action_2');
INSERT INTO complementary_singles VALUES (198, 87, 'action_2');
INSERT INTO complementary_singles VALUES (473, 87, 'action_3');
INSERT INTO complementary_singles VALUES (42, 77, 'action_2');
INSERT INTO complementary_singles VALUES (495, 77, 'action_3');
INSERT INTO complementary_singles VALUES (61, 77, 'action_2');
INSERT INTO complementary_singles VALUES (496, 77, 'action_1');
INSERT INTO complementary_singles VALUES (489, 77, 'action_2');
INSERT INTO complementary_singles VALUES (269, 77, 'action_2');
INSERT INTO complementary_singles VALUES (335, 15, 'action_2');
INSERT INTO complementary_singles VALUES (110, 15, 'action_2');
INSERT INTO complementary_singles VALUES (355, 15, 'action_3');
INSERT INTO complementary_singles VALUES (168, 15, 'action_2');
INSERT INTO complementary_singles VALUES (474, 15, 'action_3');
INSERT INTO complementary_singles VALUES (43, 167, 'action_2');
INSERT INTO complementary_singles VALUES (101, 167, 'action_3');
INSERT INTO complementary_singles VALUES (139, 167, 'action_2');
INSERT INTO complementary_singles VALUES (453, 167, 'action_3');
INSERT INTO complementary_singles VALUES (79, 111, 'action_2');
INSERT INTO complementary_singles VALUES (90, 111, 'action_2');
INSERT INTO complementary_singles VALUES (355, 111, 'action_4');
INSERT INTO complementary_singles VALUES (142, 111, 'action_2');
INSERT INTO complementary_singles VALUES (446, 111, 'action_2');
INSERT INTO complementary_singles VALUES (261, 111, 'action_2');
INSERT INTO complementary_singles VALUES (49, 16, 'action_3');
INSERT INTO complementary_singles VALUES (365, 16, 'action_2');
INSERT INTO complementary_singles VALUES (227, 16, 'action_3');
INSERT INTO complementary_singles VALUES (474, 16, 'action_4');
INSERT INTO complementary_singles VALUES (48, 129, 'action_2');
INSERT INTO complementary_singles VALUES (64, 129, 'action_2');
INSERT INTO complementary_singles VALUES (497, 129, 'action_1');
INSERT INTO complementary_singles VALUES (365, 129, 'action_2');
INSERT INTO complementary_singles VALUES (411, 129, 'action_3');
INSERT INTO complementary_singles VALUES (196, 129, 'action_2');
INSERT INTO complementary_singles VALUES (147, 23, 'action_2');
INSERT INTO complementary_singles VALUES (498, 23, 'action_1');
INSERT INTO complementary_singles VALUES (149, 23, 'action_2');
INSERT INTO complementary_singles VALUES (239, 23, 'action_2');
INSERT INTO complementary_singles VALUES (455, 23, 'action_2');
INSERT INTO complementary_singles VALUES (506, 87, 'action_2');
INSERT INTO complementary_singles VALUES (264, 87, 'action_2');
INSERT INTO complementary_singles VALUES (506, 125, 'action_3');
INSERT INTO complementary_singles VALUES (410, 125, 'action_2');
INSERT INTO complementary_singles VALUES (206, 125, 'action_2');
INSERT INTO complementary_singles VALUES (210, 125, 'action_3');
INSERT INTO complementary_singles VALUES (499, 125, 'action_1');
INSERT INTO complementary_singles VALUES (343, 126, 'action_2');
INSERT INTO complementary_singles VALUES (185, 126, 'action_2');
INSERT INTO complementary_singles VALUES (413, 126, 'action_2');
INSERT INTO complementary_singles VALUES (242, 126, 'action_2');
INSERT INTO complementary_singles VALUES (266, 126, 'action_5');
INSERT INTO complementary_singles VALUES (318, 35, 'action_2');
INSERT INTO complementary_singles VALUES (154, 35, 'action_2');
INSERT INTO complementary_singles VALUES (439, 35, 'action_2');
INSERT INTO complementary_singles VALUES (456, 35, 'action_2');
INSERT INTO complementary_singles VALUES (105, 140, 'action_2');
INSERT INTO complementary_singles VALUES (339, 140, 'action_2');
INSERT INTO complementary_singles VALUES (125, 140, 'action_2');
INSERT INTO complementary_singles VALUES (417, 140, 'action_2');
INSERT INTO complementary_singles VALUES (218, 140, 'action_3');
INSERT INTO complementary_singles VALUES (455, 140, 'action_4');
INSERT INTO complementary_singles VALUES (494, 140, 'action_2');
INSERT INTO complementary_singles VALUES (506, 141, 'action_4');
INSERT INTO complementary_singles VALUES (355, 141, 'action_5');
INSERT INTO complementary_singles VALUES (149, 141, 'action_3');
INSERT INTO complementary_singles VALUES (105, 143, 'action_2');
INSERT INTO complementary_singles VALUES (339, 143, 'action_2');
INSERT INTO complementary_singles VALUES (125, 143, 'action_2');
INSERT INTO complementary_singles VALUES (417, 143, 'action_2');
INSERT INTO complementary_singles VALUES (218, 143, 'action_3');
INSERT INTO complementary_singles VALUES (455, 143, 'action_4');
INSERT INTO complementary_singles VALUES (494, 143, 'action_2');
INSERT INTO complementary_singles VALUES (303, 24, 'action_2');
INSERT INTO complementary_singles VALUES (441, 24, 'action_2');
INSERT INTO complementary_singles VALUES (500, 45, 'action_1');
INSERT INTO complementary_singles VALUES (501, 45, 'action_1');
INSERT INTO complementary_singles VALUES (417, 45, 'action_3');
INSERT INTO complementary_singles VALUES (455, 45, 'action_2');
INSERT INTO complementary_singles VALUES (210, 25, 'action_2');
INSERT INTO complementary_singles VALUES (253, 25, 'action_2');
INSERT INTO complementary_singles VALUES (269, 25, 'action_3');
INSERT INTO complementary_singles VALUES (105, 78, 'action_3');
INSERT INTO complementary_singles VALUES (364, 78, 'action_3');
INSERT INTO complementary_singles VALUES (448, 78, 'action_2');
INSERT INTO complementary_singles VALUES (489, 78, 'action_3');
INSERT INTO complementary_singles VALUES (49, 21, 'action_2');
INSERT INTO complementary_singles VALUES (76, 21, 'action_2');
INSERT INTO complementary_singles VALUES (123, 21, 'action_2');
INSERT INTO complementary_singles VALUES (146, 21, 'action_2');
INSERT INTO complementary_singles VALUES (495, 59, 'action_3');
INSERT INTO complementary_singles VALUES (355, 59, 'action_6');
INSERT INTO complementary_singles VALUES (417, 59, 'action_4');
INSERT INTO complementary_singles VALUES (473, 59, 'action_8');
INSERT INTO complementary_singles VALUES (16, 88, 'action_3');
INSERT INTO complementary_singles VALUES (82, 88, 'action_2');
INSERT INTO complementary_singles VALUES (131, 88, 'action_2');
INSERT INTO complementary_singles VALUES (198, 88, 'action_3');
INSERT INTO complementary_singles VALUES (101, 168, 'action_2');
INSERT INTO complementary_singles VALUES (359, 168, 'action_3');
INSERT INTO complementary_singles VALUES (152, 168, 'action_2');
INSERT INTO complementary_singles VALUES (156, 168, 'action_2');
INSERT INTO complementary_singles VALUES (453, 168, 'action_4');
INSERT INTO complementary_singles VALUES (266, 168, 'action_2');
INSERT INTO complementary_singles VALUES (495, 26, 'action_2');
INSERT INTO complementary_singles VALUES (101, 26, 'action_4');
INSERT INTO complementary_singles VALUES (455, 26, 'action_2');
INSERT INTO complementary_singles VALUES (502, 127, 'action_1');
INSERT INTO complementary_singles VALUES (364, 127, 'action_4');
INSERT INTO complementary_singles VALUES (399, 127, 'action_3');
INSERT INTO complementary_singles VALUES (185, 127, 'action_2');
INSERT INTO complementary_singles VALUES (192, 127, 'action_2');
INSERT INTO complementary_singles VALUES (203, 127, 'action_2');
INSERT INTO complementary_singles VALUES (326, 147, 'action_2');
INSERT INTO complementary_singles VALUES (351, 147, 'action_2');
INSERT INTO complementary_singles VALUES (143, 147, 'action_2');
INSERT INTO complementary_singles VALUES (231, 147, 'action_2');
INSERT INTO complementary_singles VALUES (484, 147, 'action_2');
INSERT INTO complementary_singles VALUES (273, 37, 'action_2');
INSERT INTO complementary_singles VALUES (296, 37, 'action_2');
INSERT INTO complementary_singles VALUES (240, 37, 'action_2');
INSERT INTO complementary_singles VALUES (455, 37, 'action_3');
INSERT INTO complementary_singles VALUES (145, 6, 'action_2');
INSERT INTO complementary_singles VALUES (417, 6, 'action_3');
INSERT INTO complementary_singles VALUES (237, 6, 'action_3');
INSERT INTO complementary_singles VALUES (473, 6, 'action_4');
INSERT INTO complementary_singles VALUES (113, 79, 'action_2');
INSERT INTO complementary_singles VALUES (133, 79, 'action_2');
INSERT INTO complementary_singles VALUES (145, 79, 'action_3');
INSERT INTO complementary_singles VALUES (305, 89, 'action_2');
INSERT INTO complementary_singles VALUES (149, 89, 'action_3');
INSERT INTO complementary_singles VALUES (455, 89, 'action_2');
INSERT INTO complementary_singles VALUES (145, 4, 'action_4');
INSERT INTO complementary_singles VALUES (199, 4, 'action_2');
INSERT INTO complementary_singles VALUES (234, 4, 'action_2');
INSERT INTO complementary_singles VALUES (473, 4, 'action_4');
INSERT INTO complementary_singles VALUES (70, 91, 'action_2');
INSERT INTO complementary_singles VALUES (131, 91, 'action_3');
INSERT INTO complementary_singles VALUES (149, 91, 'action_3');
INSERT INTO complementary_singles VALUES (266, 91, 'action_3');
INSERT INTO complementary_singles VALUES (143, 60, 'action_3');
INSERT INTO complementary_singles VALUES (364, 60, 'action_3');
INSERT INTO complementary_singles VALUES (171, 60, 'action_2');
INSERT INTO complementary_singles VALUES (210, 60, 'action_4');
INSERT INTO complementary_singles VALUES (448, 60, 'action_3');
INSERT INTO complementary_singles VALUES (240, 60, 'action_3');
INSERT INTO complementary_singles VALUES (253, 60, 'action_2');
INSERT INTO complementary_singles VALUES (175, 61, 'action_2');
INSERT INTO complementary_singles VALUES (411, 61, 'action_4');
INSERT INTO complementary_singles VALUES (218, 61, 'action_4');
INSERT INTO complementary_singles VALUES (455, 61, 'action_5');
INSERT INTO complementary_singles VALUES (490, 61, 'action_2');
INSERT INTO complementary_singles VALUES (474, 162, 'action_5');
INSERT INTO complementary_singles VALUES (266, 162, 'action_4');
INSERT INTO complementary_singles VALUES (16, 211, 'action_4');
INSERT INTO complementary_singles VALUES (277, 211, 'action_2');
INSERT INTO complementary_singles VALUES (288, 211, 'action_3');
INSERT INTO complementary_singles VALUES (448, 211, 'action_4');
INSERT INTO complementary_singles VALUES (494, 211, 'action_3');
INSERT INTO complementary_singles VALUES (154, 7, 'action_3');
INSERT INTO complementary_singles VALUES (256, 7, 'action_2');
INSERT INTO complementary_singles VALUES (336, 148, 'action_2');
INSERT INTO complementary_singles VALUES (503, 148, 'action_1');
INSERT INTO complementary_singles VALUES (199, 148, 'action_3');
INSERT INTO complementary_singles VALUES (221, 148, 'action_2');
INSERT INTO complementary_singles VALUES (473, 148, 'action_5');
INSERT INTO complementary_singles VALUES (344, 32, 'action_2');
INSERT INTO complementary_singles VALUES (353, 32, 'action_2');
INSERT INTO complementary_singles VALUES (183, 32, 'action_2');
INSERT INTO complementary_singles VALUES (247, 32, 'action_2');
INSERT INTO complementary_singles VALUES (484, 32, 'action_2');
INSERT INTO complementary_singles VALUES (344, 33, 'action_2');
INSERT INTO complementary_singles VALUES (353, 33, 'action_3');
INSERT INTO complementary_singles VALUES (183, 33, 'action_2');
INSERT INTO complementary_singles VALUES (247, 33, 'action_3');
INSERT INTO complementary_singles VALUES (293, 62, 'action_2');
INSERT INTO complementary_singles VALUES (504, 62, 'action_1');
INSERT INTO complementary_singles VALUES (129, 62, 'action_2');
INSERT INTO complementary_singles VALUES (364, 62, 'action_3');
INSERT INTO complementary_singles VALUES (223, 62, 'action_2');
INSERT INTO complementary_singles VALUES (241, 62, 'action_3');
INSERT INTO complementary_singles VALUES (101, 130, 'action_2');
INSERT INTO complementary_singles VALUES (140, 130, 'action_2');
INSERT INTO complementary_singles VALUES (237, 130, 'action_3');
INSERT INTO complementary_singles VALUES (240, 130, 'action_3');
INSERT INTO complementary_singles VALUES (465, 130, 'action_2');
INSERT INTO complementary_singles VALUES (320, 182, 'action_2');
INSERT INTO complementary_singles VALUES (367, 182, 'action_2');
INSERT INTO complementary_singles VALUES (163, 182, 'action_2');
INSERT INTO complementary_singles VALUES (240, 182, 'action_2');
INSERT INTO complementary_singles VALUES (88, 39, 'action_2');
INSERT INTO complementary_singles VALUES (359, 39, 'action_4');
INSERT INTO complementary_singles VALUES (246, 39, 'action_2');
INSERT INTO complementary_singles VALUES (484, 39, 'action_2');
INSERT INTO complementary_singles VALUES (59, 40, 'action_2');
INSERT INTO complementary_singles VALUES (406, 40, 'action_2');
INSERT INTO complementary_singles VALUES (410, 40, 'action_3');
INSERT INTO complementary_singles VALUES (505, 41, 'action_1');
INSERT INTO complementary_singles VALUES (279, 41, 'action_2');
INSERT INTO complementary_singles VALUES (455, 41, 'action_6');
INSERT INTO complementary_singles VALUES (491, 41, 'action_2');
INSERT INTO complementary_singles VALUES (336, 42, 'action_3');
INSERT INTO complementary_singles VALUES (506, 42, 'action_5');
INSERT INTO complementary_singles VALUES (273, 169, 'action_3');
INSERT INTO complementary_singles VALUES (302, 169, 'action_3');
INSERT INTO complementary_singles VALUES (453, 169, 'action_5');
INSERT INTO complementary_singles VALUES (43, 63, 'action_3');
INSERT INTO complementary_singles VALUES (299, 63, 'action_2');
INSERT INTO complementary_singles VALUES (123, 63, 'action_3');
INSERT INTO complementary_singles VALUES (199, 63, 'action_2');
INSERT INTO complementary_singles VALUES (448, 63, 'action_2');
INSERT INTO complementary_singles VALUES (241, 63, 'action_4');
INSERT INTO complementary_singles VALUES (62, 38, 'action_2');
INSERT INTO complementary_singles VALUES (139, 38, 'action_3');
INSERT INTO complementary_singles VALUES (199, 38, 'action_4');
INSERT INTO complementary_singles VALUES (237, 38, 'action_4');
INSERT INTO complementary_singles VALUES (335, 34, 'action_2');
INSERT INTO complementary_singles VALUES (117, 34, 'action_2');
INSERT INTO complementary_singles VALUES (417, 34, 'action_4');
INSERT INTO complementary_singles VALUES (455, 34, 'action_4');
INSERT INTO complementary_singles VALUES (320, 184, 'action_3');
INSERT INTO complementary_singles VALUES (167, 184, 'action_2');
INSERT INTO complementary_singles VALUES (417, 184, 'action_5');
INSERT INTO complementary_singles VALUES (199, 184, 'action_5');
INSERT INTO complementary_singles VALUES (218, 184, 'action_5');
INSERT INTO complementary_singles VALUES (461, 184, 'action_2');
INSERT INTO complementary_singles VALUES (253, 184, 'action_3');
INSERT INTO complementary_singles VALUES (82, 135, 'action_3');
INSERT INTO complementary_singles VALUES (409, 135, 'action_2');
INSERT INTO complementary_singles VALUES (410, 135, 'action_4');
INSERT INTO complementary_singles VALUES (506, 11, 'action_8');
INSERT INTO complementary_singles VALUES (474, 135, 'action_6');
INSERT INTO complementary_singles VALUES (48, 156, 'action_3');
INSERT INTO complementary_singles VALUES (365, 156, 'action_3');
INSERT INTO complementary_singles VALUES (455, 156, 'action_7');
INSERT INTO complementary_singles VALUES (490, 156, 'action_3');
INSERT INTO complementary_singles VALUES (128, 80, 'action_2');
INSERT INTO complementary_singles VALUES (139, 80, 'action_3');
INSERT INTO complementary_singles VALUES (172, 80, 'action_2');
INSERT INTO complementary_singles VALUES (404, 80, 'action_2');
INSERT INTO complementary_singles VALUES (243, 80, 'action_2');
INSERT INTO complementary_singles VALUES (105, 43, 'action_4');
INSERT INTO complementary_singles VALUES (110, 43, 'action_3');
INSERT INTO complementary_singles VALUES (48, 44, 'action_4');
INSERT INTO complementary_singles VALUES (352, 44, 'action_2');
INSERT INTO complementary_singles VALUES (355, 44, 'action_7');
INSERT INTO complementary_singles VALUES (182, 44, 'action_2');
INSERT INTO complementary_singles VALUES (473, 44, 'action_6');
INSERT INTO complementary_singles VALUES (312, 183, 'action_2');
INSERT INTO complementary_singles VALUES (168, 183, 'action_3');
INSERT INTO complementary_singles VALUES (200, 183, 'action_2');
INSERT INTO complementary_singles VALUES (474, 183, 'action_7');
INSERT INTO complementary_singles VALUES (100, 185, 'action_2');
INSERT INTO complementary_singles VALUES (138, 185, 'action_2');
INSERT INTO complementary_singles VALUES (285, 82, 'action_2');
INSERT INTO complementary_singles VALUES (299, 82, 'action_3');
INSERT INTO complementary_singles VALUES (406, 82, 'action_3');
INSERT INTO complementary_singles VALUES (417, 82, 'action_6');
INSERT INTO complementary_singles VALUES (241, 82, 'action_5');
INSERT INTO complementary_singles VALUES (96, 81, 'action_2');
INSERT INTO complementary_singles VALUES (506, 81, 'action_6');
INSERT INTO complementary_singles VALUES (404, 81, 'action_3');
INSERT INTO complementary_singles VALUES (76, 114, 'action_3');
INSERT INTO complementary_singles VALUES (86, 114, 'action_2');
INSERT INTO complementary_singles VALUES (94, 114, 'action_2');
INSERT INTO complementary_singles VALUES (373, 114, 'action_2');
INSERT INTO complementary_singles VALUES (415, 114, 'action_3');
INSERT INTO complementary_singles VALUES (417, 114, 'action_7');
INSERT INTO complementary_singles VALUES (59, 157, 'action_3');
INSERT INTO complementary_singles VALUES (299, 157, 'action_2');
INSERT INTO complementary_singles VALUES (364, 157, 'action_5');
INSERT INTO complementary_singles VALUES (417, 157, 'action_5');
INSERT INTO complementary_singles VALUES (450, 157, 'action_2');
INSERT INTO complementary_singles VALUES (76, 115, 'action_3');
INSERT INTO complementary_singles VALUES (94, 115, 'action_3');
INSERT INTO complementary_singles VALUES (415, 115, 'action_3');
INSERT INTO complementary_singles VALUES (417, 115, 'action_8');
INSERT INTO complementary_singles VALUES (335, 186, 'action_2');
INSERT INTO complementary_singles VALUES (105, 186, 'action_5');
INSERT INTO complementary_singles VALUES (127, 186, 'action_2');
INSERT INTO complementary_singles VALUES (417, 186, 'action_9');
INSERT INTO complementary_singles VALUES (455, 186, 'action_8');
INSERT INTO complementary_singles VALUES (491, 186, 'action_3');
INSERT INTO complementary_singles VALUES (495, 158, 'action_4');
INSERT INTO complementary_singles VALUES (97, 158, 'action_2');
INSERT INTO complementary_singles VALUES (105, 158, 'action_6');
INSERT INTO complementary_singles VALUES (127, 158, 'action_3');
INSERT INTO complementary_singles VALUES (163, 158, 'action_2');
INSERT INTO complementary_singles VALUES (59, 27, 'action_4');
INSERT INTO complementary_singles VALUES (241, 27, 'action_6');
INSERT INTO complementary_singles VALUES (16, 159, 'action_5');
INSERT INTO complementary_singles VALUES (96, 159, 'action_2');
INSERT INTO complementary_singles VALUES (155, 159, 'action_3');
INSERT INTO complementary_singles VALUES (187, 159, 'action_2');
INSERT INTO complementary_singles VALUES (310, 96, 'action_2');
INSERT INTO complementary_singles VALUES (82, 96, 'action_4');
INSERT INTO complementary_singles VALUES (189, 96, 'action_2');
INSERT INTO complementary_singles VALUES (375, 96, 'action_3');
INSERT INTO complementary_singles VALUES (477, 96, 'action_3');
INSERT INTO complementary_singles VALUES (293, 144, 'action_3');
INSERT INTO complementary_singles VALUES (373, 144, 'action_3');
INSERT INTO complementary_singles VALUES (421, 144, 'action_2');
INSERT INTO complementary_singles VALUES (112, 145, 'action_2');
INSERT INTO complementary_singles VALUES (404, 145, 'action_4');
INSERT INTO complementary_singles VALUES (320, 187, 'action_4');
INSERT INTO complementary_singles VALUES (111, 187, 'action_3');
INSERT INTO complementary_singles VALUES (355, 187, 'action_8');
INSERT INTO complementary_singles VALUES (417, 187, 'action_2');
INSERT INTO complementary_singles VALUES (281, 46, 'action_2');
INSERT INTO complementary_singles VALUES (404, 46, 'action_5');
INSERT INTO complementary_singles VALUES (440, 46, 'action_2');
INSERT INTO complementary_singles VALUES (376, 120, 'action_2');
INSERT INTO complementary_singles VALUES (484, 120, 'action_3');
INSERT INTO complementary_singles VALUES (485, 120, 'action_2');
INSERT INTO complementary_singles VALUES (94, 188, 'action_2');
INSERT INTO complementary_singles VALUES (376, 188, 'action_2');
INSERT INTO complementary_singles VALUES (253, 188, 'action_6');
INSERT INTO complementary_singles VALUES (485, 188, 'action_2');
INSERT INTO complementary_singles VALUES (76, 121, 'action_3');
INSERT INTO complementary_singles VALUES (78, 121, 'action_2');
INSERT INTO complementary_singles VALUES (406, 121, 'action_4');
INSERT INTO complementary_singles VALUES (237, 121, 'action_5');
INSERT INTO complementary_singles VALUES (94, 64, 'action_4');
INSERT INTO complementary_singles VALUES (335, 64, 'action_3');
INSERT INTO complementary_singles VALUES (417, 64, 'action_10');
INSERT INTO complementary_singles VALUES (199, 64, 'action_4');
INSERT INTO complementary_singles VALUES (240, 64, 'action_2');
INSERT INTO complementary_singles VALUES (253, 64, 'action_4');
INSERT INTO complementary_singles VALUES (299, 65, 'action_4');
INSERT INTO complementary_singles VALUES (320, 65, 'action_5');
INSERT INTO complementary_singles VALUES (110, 65, 'action_4');
INSERT INTO complementary_singles VALUES (218, 65, 'action_6');
INSERT INTO complementary_singles VALUES (241, 65, 'action_4');
INSERT INTO complementary_singles VALUES (455, 65, 'action_4');
INSERT INTO complementary_singles VALUES (14, 131, 'action_2');
INSERT INTO complementary_singles VALUES (344, 131, 'action_3');
INSERT INTO complementary_singles VALUES (62, 131, 'action_4');
INSERT INTO complementary_singles VALUES (253, 131, 'action_5');
INSERT INTO complementary_singles VALUES (320, 149, 'action_7');
INSERT INTO complementary_singles VALUES (112, 149, 'action_3');
INSERT INTO complementary_singles VALUES (355, 149, 'action_9');
INSERT INTO complementary_singles VALUES (412, 149, 'action_2');
INSERT INTO complementary_singles VALUES (448, 149, 'action_5');
INSERT INTO complementary_singles VALUES (494, 149, 'action_4');
INSERT INTO complementary_singles VALUES (289, 83, 'action_2');
INSERT INTO complementary_singles VALUES (76, 83, 'action_4');
INSERT INTO complementary_singles VALUES (101, 83, 'action_5');
INSERT INTO complementary_singles VALUES (415, 83, 'action_4');
INSERT INTO complementary_singles VALUES (110, 83, 'action_5');
INSERT INTO complementary_singles VALUES (338, 18, 'action_2');
INSERT INTO complementary_singles VALUES (359, 18, 'action_4');
INSERT INTO complementary_singles VALUES (471, 18, 'action_2');
INSERT INTO complementary_singles VALUES (491, 18, 'action_4');
INSERT INTO complementary_singles VALUES (59, 29, 'action_5');
INSERT INTO complementary_singles VALUES (94, 29, 'action_5');
INSERT INTO complementary_singles VALUES (433, 29, 'action_2');
INSERT INTO complementary_singles VALUES (237, 29, 'action_5');
INSERT INTO complementary_singles VALUES (148, 10, 'action_2');
INSERT INTO complementary_singles VALUES (131, 10, 'action_4');
INSERT INTO complementary_singles VALUES (191, 10, 'action_3');
INSERT INTO complementary_singles VALUES (62, 189, 'action_3');
INSERT INTO complementary_singles VALUES (188, 189, 'action_2');
INSERT INTO complementary_singles VALUES (15, 28, 'action_2');
INSERT INTO complementary_singles VALUES (293, 28, 'action_4');
INSERT INTO complementary_singles VALUES (342, 28, 'action_2');
INSERT INTO complementary_singles VALUES (506, 97, 'action_7');
INSERT INTO complementary_singles VALUES (343, 97, 'action_3');
INSERT INTO complementary_singles VALUES (179, 97, 'action_2');
INSERT INTO complementary_singles VALUES (227, 97, 'action_4');
INSERT INTO complementary_singles VALUES (473, 97, 'action_7');
INSERT INTO complementary_singles VALUES (48, 138, 'action_5');
INSERT INTO complementary_singles VALUES (411, 138, 'action_5');
INSERT INTO complementary_singles VALUES (218, 138, 'action_7');
INSERT INTO complementary_singles VALUES (237, 138, 'action_6');
INSERT INTO complementary_singles VALUES (165, 132, 'action_3');
INSERT INTO complementary_singles VALUES (172, 132, 'action_3');
INSERT INTO complementary_singles VALUES (507, 132, 'action_2');
INSERT INTO complementary_singles VALUES (244, 132, 'action_2');
INSERT INTO complementary_singles VALUES (305, 11, 'action_3');
INSERT INTO complementary_singles VALUES (131, 11, 'action_5');
INSERT INTO complementary_singles VALUES (157, 11, 'action_2');
INSERT INTO complementary_singles VALUES (191, 11, 'action_4');
INSERT INTO complementary_singles VALUES (473, 11, 'action_8');
INSERT INTO complementary_singles VALUES (506, 98, 'action_9');
INSERT INTO complementary_singles VALUES (201, 98, 'action_2');
INSERT INTO complementary_singles VALUES (473, 98, 'action_3');
INSERT INTO complementary_singles VALUES (264, 98, 'action_3');
INSERT INTO complementary_singles VALUES (59, 12, 'action_6');
INSERT INTO complementary_singles VALUES (172, 12, 'action_4');
INSERT INTO complementary_singles VALUES (242, 12, 'action_3');
INSERT INTO complementary_singles VALUES (473, 12, 'action_6');
INSERT INTO complementary_singles VALUES (477, 12, 'action_2');
INSERT INTO complementary_singles VALUES (346, 133, 'action_2');
INSERT INTO complementary_singles VALUES (359, 133, 'action_6');
INSERT INTO complementary_singles VALUES (165, 133, 'action_3');
INSERT INTO complementary_singles VALUES (172, 133, 'action_3');
INSERT INTO complementary_singles VALUES (507, 133, 'action_2');
INSERT INTO complementary_singles VALUES (14, 66, 'action_3');
INSERT INTO complementary_singles VALUES (304, 66, 'action_2');
INSERT INTO complementary_singles VALUES (110, 66, 'action_6');
INSERT INTO complementary_singles VALUES (508, 66, 'action_2');
INSERT INTO complementary_singles VALUES (214, 66, 'action_2');
INSERT INTO complementary_singles VALUES (66, 160, 'action_2');
INSERT INTO complementary_singles VALUES (320, 160, 'action_6');
INSERT INTO complementary_singles VALUES (86, 160, 'action_3');
INSERT INTO complementary_singles VALUES (199, 160, 'action_6');
INSERT INTO complementary_singles VALUES (86, 84, 'action_2');
INSERT INTO complementary_singles VALUES (117, 84, 'action_3');
INSERT INTO complementary_singles VALUES (186, 84, 'action_2');
INSERT INTO complementary_singles VALUES (231, 84, 'action_3');
INSERT INTO complementary_singles VALUES (163, 48, 'action_2');
INSERT INTO complementary_singles VALUES (205, 48, 'action_2');
INSERT INTO complementary_singles VALUES (240, 48, 'action_2');
INSERT INTO complementary_singles VALUES (376, 123, 'action_2');
INSERT INTO complementary_singles VALUES (479, 123, 'action_2');
INSERT INTO complementary_singles VALUES (485, 123, 'action_2');
INSERT INTO complementary_singles VALUES (495, 30, 'action_3');
INSERT INTO complementary_singles VALUES (168, 30, 'action_4');
INSERT INTO complementary_singles VALUES (410, 30, 'action_5');
INSERT INTO complementary_singles VALUES (216, 30, 'action_2');
INSERT INTO complementary_singles VALUES (237, 30, 'action_7');
INSERT INTO complementary_singles VALUES (16, 31, 'action_5');
INSERT INTO complementary_singles VALUES (154, 31, 'action_4');
INSERT INTO complementary_singles VALUES (179, 31, 'action_2');
INSERT INTO complementary_singles VALUES (199, 31, 'action_7');
INSERT INTO complementary_singles VALUES (102, 14, 'action_2');
INSERT INTO complementary_singles VALUES (174, 14, 'action_2');
INSERT INTO complementary_singles VALUES (179, 14, 'action_3');
INSERT INTO complementary_singles VALUES (48, 67, 'action_6');
INSERT INTO complementary_singles VALUES (320, 67, 'action_5');
INSERT INTO complementary_singles VALUES (222, 67, 'action_2');
INSERT INTO complementary_singles VALUES (474, 67, 'action_8');
INSERT INTO complementary_singles VALUES (50, 85, 'action_2');
INSERT INTO complementary_singles VALUES (277, 85, 'action_3');
INSERT INTO complementary_singles VALUES (100, 85, 'action_3');
INSERT INTO complementary_singles VALUES (127, 85, 'action_4');
INSERT INTO complementary_singles VALUES (347, 85, 'action_2');
INSERT INTO complementary_singles VALUES (342, 99, 'action_3');
INSERT INTO complementary_singles VALUES (200, 99, 'action_3');
INSERT INTO complementary_singles VALUES (101, 150, 'action_6');
INSERT INTO complementary_singles VALUES (335, 150, 'action_4');
INSERT INTO complementary_singles VALUES (127, 150, 'action_5');
INSERT INTO complementary_singles VALUES (179, 150, 'action_4');
INSERT INTO complementary_singles VALUES (269, 150, 'action_2');
INSERT INTO complementary_singles VALUES (116, 154, 'action_2');
INSERT INTO complementary_singles VALUES (128, 154, 'action_3');
INSERT INTO complementary_singles VALUES (176, 154, 'action_2');
INSERT INTO complementary_singles VALUES (212, 154, 'action_2');
INSERT INTO complementary_singles VALUES (440, 154, 'action_3');
INSERT INTO complementary_singles VALUES (129, 152, 'action_3');
INSERT INTO complementary_singles VALUES (154, 152, 'action_5');
INSERT INTO complementary_singles VALUES (143, 152, 'action_4');
INSERT INTO complementary_singles VALUES (355, 152, 'action_4');
INSERT INTO complementary_singles VALUES (16, 155, 'action_6');
INSERT INTO complementary_singles VALUES (59, 155, 'action_4');
INSERT INTO complementary_singles VALUES (110, 155, 'action_7');
INSERT INTO complementary_singles VALUES (168, 155, 'action_3');
INSERT INTO complementary_singles VALUES (509, 56, 'action_1');
INSERT INTO complementary_singles VALUES (376, 194, 'action_2');
INSERT INTO complementary_singles VALUES (406, 194, 'action_3');
INSERT INTO complementary_singles VALUES (479, 194, 'action_2');
INSERT INTO complementary_singles VALUES (485, 194, 'action_2');
INSERT INTO complementary_singles VALUES (453, 103, 'action_6');


--
-- Data for Name: contra_indications; Type: TABLE DATA; Schema: public; Owner: app
--

INSERT INTO contra_indications VALUES (122, 'FDA external use', 'These herbs are recommended for external use only according to FDA Guidelines');
INSERT INTO contra_indications VALUES (123, 'Cautions', 'FDA considers these herbs to be used with caution');
INSERT INTO contra_indications VALUES (124, 'Short Term Use Only', 'These herbs are for short term use only and/or in minimal dosages in herbal remedies, or used as a homeopathic');
INSERT INTO contra_indications VALUES (125, 'Use in Minimal Dosages', 'These herbs are for short term use only and/or in minimal dosages in herbal remedies, or used as a homeopathic');
INSERT INTO contra_indications VALUES (126, 'Use as a Homeopathic', 'These herbs are for short term use only and/or in minimal dosages in herbal remedies, or used as a homeopathic');
INSERT INTO contra_indications VALUES (127, 'Pregnancy or Nursing', 'Herbs recommended not to be used during pregnancy or nursing');
INSERT INTO contra_indications VALUES (128, 'Blood Thinning Medication', 'Herbs recommended not to be used when taking prescription blood thinning medication');
INSERT INTO contra_indications VALUES (129, 'Chemotherapy or Radiation', 'Herbs recommended not to be used when undergoing chemotherapy, radiation therapy, or taking MAO inhibitors &leftpar;anti-depressant drugs&rightpar;');
INSERT INTO contra_indications VALUES (130, 'Blood Pressure Medication', 'Herbs recommended to avoid with blood pressure medication');
INSERT INTO contra_indications VALUES (131, 'Anti-Seizure Medication', 'Herbs recommended to avoid with anti-seizure medication');
INSERT INTO contra_indications VALUES (132, 'Interferon Treatments', 'Herbs and herbal formulas recommended to avoid when undergoing interferon treatments or other drug therapies

');
INSERT INTO contra_indications VALUES (133, 'Skin Rash', 'Possible side effect &leftpar;usually if taken in dosages larger than recommended');
INSERT INTO contra_indications VALUES (134, 'Weak Digestion, Diarrhea, Nausea, or Inflammatory ', 'Herbs recommended to be used with caution with weak digestion, diarrhea, nausea, or inflammatory digestive diseases');
INSERT INTO contra_indications VALUES (135, 'Unsafe as Food', 'These herbs are considered unsafe as food according to FDA Guidelines ');
INSERT INTO contra_indications VALUES (136, 'External Use Only', 'These herbs are recommended for external use only according to FDA Guidelines');
INSERT INTO contra_indications VALUES (137, 'Broken Skin', 'Herbs recommended not for use on broken skin');
INSERT INTO contra_indications VALUES (138, 'Antidepressant Medication', 'Herbs recommended not for use when taking MAO-inhibitors &leftpar;antidepressant drugs&rightpar;');
INSERT INTO contra_indications VALUES (139, 'Kidney Disease', 'Herbs recommended not for use with kidney dysfunction

');
INSERT INTO contra_indications VALUES (140, 'Liver Disease', 'Herbs recommended not for use with liver dysfunction

');
INSERT INTO contra_indications VALUES (141, 'Hyperthyroid', 'Herbs recommended not for use with hyperthyroid conditions');
INSERT INTO contra_indications VALUES (142, 'Anti-Platelet Activity ', 'Herbs commonly used for their anti-platelet activity 

&leftpar;prevents strokes and heart attacks&rightpar; 

');
INSERT INTO contra_indications VALUES (143, 'Anti-Coagulant Activity ', 'Herbs commonly used for their anti-coagulant activity 

&leftpar;prevents blood clotting&rightpar;

');
INSERT INTO contra_indications VALUES (144, 'Pro-Coagulants', 'Herbs commonly used as pro-coagulants');
INSERT INTO contra_indications VALUES (145, 'Happy Thoughts!', 'Herbs commonly used for happy thoughts!');
INSERT INTO contra_indications VALUES (147, 'Frontal Headache', 'Possible side effect &leftpar;usually if taken in dosages larger than recommended');
INSERT INTO contra_indications VALUES (148, 'Stomach Irritation', 'Possible side effect &leftpar;usually if taken in dosages larger than recommended');
INSERT INTO contra_indications VALUES (150, 'Nervousness', 'Possible side effect &leftpar;usually if taken in dosages larger than recommended&rightpar;');
INSERT INTO contra_indications VALUES (151, 'Depression', 'Possible side effect &leftpar;long term use&rightpar;');
INSERT INTO contra_indications VALUES (152, 'Inflammation', 'Aggravate inflammation  &leftpar;usually if taken in dosages larger than recommended&rightpar;');
INSERT INTO contra_indications VALUES (153, 'Nausea, Vomiting', 'Possible side effect &leftpar;usually if taken in dosages larger than recommended&rightpar;');
INSERT INTO contra_indications VALUES (154, 'Pregnancy &leftpar;Cohosh Herbs&rightpar;', 'Traditionally, Black Cohosh has not been used during the first seven months of a pregnancy.  Traditionally, Blue Cohosh has been used to strengthen the uterus throughout the entire pregnancy.');
INSERT INTO contra_indications VALUES (155, 'Drug Interactions', 'St. Johns Wort is the most frequently named herb for causing drug interactions. It is best not to use this herb if someone is taking prescribed medications or undergoing chemotherapy. Blood thinners, such as Coumadin, are reported to have a greater frequency of interaction with herbs. Blood coagulation tests should be done regularly when combining herbs with blood thinners. ');
INSERT INTO contra_indications VALUES (157, 'Blood Sugar Drop  &leftpar;Low Blood Sugar&rightpa', 'Possible side effect &leftpar;usually if taken in dosages larger than recommended&rightpar;');


--
-- Name: contra_indications_local_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app
--

SELECT pg_catalog.setval('contra_indications_local_id_seq', 157, true);


--
-- Data for Name: health_category; Type: TABLE DATA; Schema: public; Owner: app
--

INSERT INTO health_category VALUES (1, 'Body Care');
INSERT INTO health_category VALUES (3, 'Circulatory Support');
INSERT INTO health_category VALUES (5, 'Digestive Support');
INSERT INTO health_category VALUES (6, 'Emotional Support');
INSERT INTO health_category VALUES (7, 'Restorative');
INSERT INTO health_category VALUES (8, 'First Aid');
INSERT INTO health_category VALUES (9, 'Emotional Support-Flower Remedies');
INSERT INTO health_category VALUES (10, 'Cleansing Support');
INSERT INTO health_category VALUES (11, 'Muscular & Skeletal');
INSERT INTO health_category VALUES (12, 'Nervous System');
INSERT INTO health_category VALUES (16, 'Renal Support');
INSERT INTO health_category VALUES (17, 'Respiratory Support');
INSERT INTO health_category VALUES (18, 'Men''s Health');
INSERT INTO health_category VALUES (19, 'Women''s Health');
INSERT INTO health_category VALUES (20, 'Child & Natal Care');


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

INSERT INTO product_category VALUES ('External Lotion', 1);
INSERT INTO product_category VALUES ('Herbal Remedy', 2);
INSERT INTO product_category VALUES ('Internal Powder', 3);
INSERT INTO product_category VALUES ('Flower Remedy', 4);
INSERT INTO product_category VALUES ('Ointment', 5);
INSERT INTO product_category VALUES ('Herbal Smoke', 6);
INSERT INTO product_category VALUES ('Internal Drops', 7);
INSERT INTO product_category VALUES ('External Wash', 8);
INSERT INTO product_category VALUES ('External Powder', 9);
INSERT INTO product_category VALUES ('External Drops', 10);
INSERT INTO product_category VALUES ('External Paste', 11);
INSERT INTO product_category VALUES ('Herbal Remedy Special', 12);
INSERT INTO product_category VALUES ('Specialty Tonic', 13);
INSERT INTO product_category VALUES ('Gargle Mouthwash', 14);
INSERT INTO product_category VALUES ('External Cream', 15);
INSERT INTO product_category VALUES ('Gum Lotion', 16);
INSERT INTO product_category VALUES ('Antiseptic Lotion', 17);
INSERT INTO product_category VALUES ('Tonic Spray', 18);
INSERT INTO product_category VALUES ('Spritzers', 19);
INSERT INTO product_category VALUES ('Bath Salts', 20);
INSERT INTO product_category VALUES ('Wart Lotion', 21);
INSERT INTO product_category VALUES ('Hair Lotion', 27);
INSERT INTO product_category VALUES ('herbremedy4oz', 28);
INSERT INTO product_category VALUES ('herbremedy1oz', 29);
INSERT INTO product_category VALUES ('herbremedy8oz', 30);
INSERT INTO product_category VALUES ('internalpowder2.5oz', 31);
INSERT INTO product_category VALUES ('extrnalpowder2.5oz', 32);
INSERT INTO product_category VALUES ('internalpowder.75oz', 33);
INSERT INTO product_category VALUES ('extrnalpowder.75oz', 34);
INSERT INTO product_category VALUES ('burnlotion2oz', 35);
INSERT INTO product_category VALUES ('acnelotion4oz', 36);
INSERT INTO product_category VALUES ('eyewash1oz', 37);
INSERT INTO product_category VALUES ('External Balm', 38);
INSERT INTO product_category VALUES ('External Rub', 39);


--
-- Name: product_category_local_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app
--

SELECT pg_catalog.setval('product_category_local_id_seq', 39, true);


--
-- Data for Name: product_health_category; Type: TABLE DATA; Schema: public; Owner: app
--

INSERT INTO product_health_category VALUES (192, 19);
INSERT INTO product_health_category VALUES (193, 8);
INSERT INTO product_health_category VALUES (194, 11);
INSERT INTO product_health_category VALUES (211, 19);
INSERT INTO product_health_category VALUES (2, 1);
INSERT INTO product_health_category VALUES (3, 1);
INSERT INTO product_health_category VALUES (4, 1);
INSERT INTO product_health_category VALUES (5, 1);
INSERT INTO product_health_category VALUES (6, 1);
INSERT INTO product_health_category VALUES (7, 1);
INSERT INTO product_health_category VALUES (8, 1);
INSERT INTO product_health_category VALUES (9, 1);
INSERT INTO product_health_category VALUES (10, 1);
INSERT INTO product_health_category VALUES (11, 1);
INSERT INTO product_health_category VALUES (12, 1);
INSERT INTO product_health_category VALUES (13, 1);
INSERT INTO product_health_category VALUES (14, 1);
INSERT INTO product_health_category VALUES (15, 3);
INSERT INTO product_health_category VALUES (16, 3);
INSERT INTO product_health_category VALUES (18, 3);
INSERT INTO product_health_category VALUES (19, 3);
INSERT INTO product_health_category VALUES (20, 3);
INSERT INTO product_health_category VALUES (21, 3);
INSERT INTO product_health_category VALUES (22, 3);
INSERT INTO product_health_category VALUES (37, 5);
INSERT INTO product_health_category VALUES (38, 5);
INSERT INTO product_health_category VALUES (39, 5);
INSERT INTO product_health_category VALUES (40, 5);
INSERT INTO product_health_category VALUES (41, 5);
INSERT INTO product_health_category VALUES (42, 5);
INSERT INTO product_health_category VALUES (44, 5);
INSERT INTO product_health_category VALUES (46, 5);
INSERT INTO product_health_category VALUES (47, 5);
INSERT INTO product_health_category VALUES (48, 5);
INSERT INTO product_health_category VALUES (49, 20);
INSERT INTO product_health_category VALUES (51, 20);
INSERT INTO product_health_category VALUES (52, 20);
INSERT INTO product_health_category VALUES (53, 20);
INSERT INTO product_health_category VALUES (54, 20);
INSERT INTO product_health_category VALUES (55, 20);
INSERT INTO product_health_category VALUES (57, 6);
INSERT INTO product_health_category VALUES (58, 6);
INSERT INTO product_health_category VALUES (59, 6);
INSERT INTO product_health_category VALUES (60, 6);
INSERT INTO product_health_category VALUES (61, 6);
INSERT INTO product_health_category VALUES (62, 6);
INSERT INTO product_health_category VALUES (63, 6);
INSERT INTO product_health_category VALUES (64, 6);
INSERT INTO product_health_category VALUES (65, 6);
INSERT INTO product_health_category VALUES (66, 6);
INSERT INTO product_health_category VALUES (68, 9);
INSERT INTO product_health_category VALUES (69, 9);
INSERT INTO product_health_category VALUES (70, 9);
INSERT INTO product_health_category VALUES (71, 9);
INSERT INTO product_health_category VALUES (73, 9);
INSERT INTO product_health_category VALUES (74, 9);
INSERT INTO product_health_category VALUES (75, 9);
INSERT INTO product_health_category VALUES (77, 7);
INSERT INTO product_health_category VALUES (78, 7);
INSERT INTO product_health_category VALUES (79, 7);
INSERT INTO product_health_category VALUES (80, 7);
INSERT INTO product_health_category VALUES (81, 7);
INSERT INTO product_health_category VALUES (82, 7);
INSERT INTO product_health_category VALUES (83, 7);
INSERT INTO product_health_category VALUES (84, 7);
INSERT INTO product_health_category VALUES (85, 7);
INSERT INTO product_health_category VALUES (87, 10);
INSERT INTO product_health_category VALUES (88, 10);
INSERT INTO product_health_category VALUES (89, 10);
INSERT INTO product_health_category VALUES (91, 10);
INSERT INTO product_health_category VALUES (92, 10);
INSERT INTO product_health_category VALUES (93, 10);
INSERT INTO product_health_category VALUES (94, 10);
INSERT INTO product_health_category VALUES (96, 10);
INSERT INTO product_health_category VALUES (97, 10);
INSERT INTO product_health_category VALUES (98, 10);
INSERT INTO product_health_category VALUES (99, 10);
INSERT INTO product_health_category VALUES (100, 8);
INSERT INTO product_health_category VALUES (101, 8);
INSERT INTO product_health_category VALUES (102, 8);
INSERT INTO product_health_category VALUES (103, 8);
INSERT INTO product_health_category VALUES (104, 8);
INSERT INTO product_health_category VALUES (105, 8);
INSERT INTO product_health_category VALUES (106, 8);
INSERT INTO product_health_category VALUES (107, 8);
INSERT INTO product_health_category VALUES (108, 8);
INSERT INTO product_health_category VALUES (109, 8);
INSERT INTO product_health_category VALUES (110, 8);
INSERT INTO product_health_category VALUES (111, 11);
INSERT INTO product_health_category VALUES (112, 11);
INSERT INTO product_health_category VALUES (113, 11);
INSERT INTO product_health_category VALUES (114, 11);
INSERT INTO product_health_category VALUES (115, 11);
INSERT INTO product_health_category VALUES (116, 11);
INSERT INTO product_health_category VALUES (117, 11);
INSERT INTO product_health_category VALUES (118, 11);
INSERT INTO product_health_category VALUES (119, 11);
INSERT INTO product_health_category VALUES (120, 11);
INSERT INTO product_health_category VALUES (121, 11);
INSERT INTO product_health_category VALUES (122, 11);
INSERT INTO product_health_category VALUES (123, 11);
INSERT INTO product_health_category VALUES (124, 17);
INSERT INTO product_health_category VALUES (125, 17);
INSERT INTO product_health_category VALUES (126, 17);
INSERT INTO product_health_category VALUES (127, 17);
INSERT INTO product_health_category VALUES (128, 17);
INSERT INTO product_health_category VALUES (131, 17);
INSERT INTO product_health_category VALUES (132, 17);
INSERT INTO product_health_category VALUES (133, 17);
INSERT INTO product_health_category VALUES (134, 17);
INSERT INTO product_health_category VALUES (136, 12);
INSERT INTO product_health_category VALUES (137, 12);
INSERT INTO product_health_category VALUES (138, 12);
INSERT INTO product_health_category VALUES (139, 12);
INSERT INTO product_health_category VALUES (144, 18);
INSERT INTO product_health_category VALUES (145, 18);
INSERT INTO product_health_category VALUES (147, 19);
INSERT INTO product_health_category VALUES (148, 19);
INSERT INTO product_health_category VALUES (150, 19);
INSERT INTO product_health_category VALUES (151, 19);
INSERT INTO product_health_category VALUES (152, 19);
INSERT INTO product_health_category VALUES (153, 19);
INSERT INTO product_health_category VALUES (154, 19);
INSERT INTO product_health_category VALUES (155, 19);
INSERT INTO product_health_category VALUES (166, 16);
INSERT INTO product_health_category VALUES (167, 16);
INSERT INTO product_health_category VALUES (168, 16);
INSERT INTO product_health_category VALUES (169, 16);
INSERT INTO product_health_category VALUES (170, 9);
INSERT INTO product_health_category VALUES (1, 1);
INSERT INTO product_health_category VALUES (156, 3);
INSERT INTO product_health_category VALUES (95, 1);
INSERT INTO product_health_category VALUES (86, 8);
INSERT INTO product_health_category VALUES (36, 20);
INSERT INTO product_health_category VALUES (17, 20);
INSERT INTO product_health_category VALUES (129, 12);
INSERT INTO product_health_category VALUES (23, 10);
INSERT INTO product_health_category VALUES (35, 7);
INSERT INTO product_health_category VALUES (140, 18);
INSERT INTO product_health_category VALUES (140, 19);
INSERT INTO product_health_category VALUES (141, 5);
INSERT INTO product_health_category VALUES (142, 1);
INSERT INTO product_health_category VALUES (143, 6);
INSERT INTO product_health_category VALUES (24, 10);
INSERT INTO product_health_category VALUES (45, 10);
INSERT INTO product_health_category VALUES (25, 7);
INSERT INTO product_health_category VALUES (26, 10);
INSERT INTO product_health_category VALUES (161, 11);
INSERT INTO product_health_category VALUES (113, 19);
INSERT INTO product_health_category VALUES (90, 20);
INSERT INTO product_health_category VALUES (162, 7);
INSERT INTO product_health_category VALUES (32, 10);
INSERT INTO product_health_category VALUES (33, 10);
INSERT INTO product_health_category VALUES (130, 6);
INSERT INTO product_health_category VALUES (169, 18);
INSERT INTO product_health_category VALUES (34, 20);
INSERT INTO product_health_category VALUES (135, 11);
INSERT INTO product_health_category VALUES (43, 10);
INSERT INTO product_health_category VALUES (157, 16);
INSERT INTO product_health_category VALUES (158, 5);
INSERT INTO product_health_category VALUES (27, 10);
INSERT INTO product_health_category VALUES (159, 17);
INSERT INTO product_health_category VALUES (149, 18);
INSERT INTO product_health_category VALUES (83, 19);
INSERT INTO product_health_category VALUES (80, 19);
INSERT INTO product_health_category VALUES (29, 10);
INSERT INTO product_health_category VALUES (164, 9);
INSERT INTO product_health_category VALUES (76, 10);
INSERT INTO product_health_category VALUES (28, 7);
INSERT INTO product_health_category VALUES (165, 1);
INSERT INTO product_health_category VALUES (160, 5);
INSERT INTO product_health_category VALUES (30, 7);
INSERT INTO product_health_category VALUES (31, 7);
INSERT INTO product_health_category VALUES (67, 12);
INSERT INTO product_health_category VALUES (56, 5);
INSERT INTO product_health_category VALUES (159, 6);
INSERT INTO product_health_category VALUES (157, 6);
INSERT INTO product_health_category VALUES (156, 6);
INSERT INTO product_health_category VALUES (158, 6);
INSERT INTO product_health_category VALUES (160, 6);
INSERT INTO product_health_category VALUES (67, 6);
INSERT INTO product_health_category VALUES (85, 6);
INSERT INTO product_health_category VALUES (56, 10);
INSERT INTO product_health_category VALUES (28, 10);
INSERT INTO product_health_category VALUES (25, 10);
INSERT INTO product_health_category VALUES (180, 8);
INSERT INTO product_health_category VALUES (181, 8);
INSERT INTO product_health_category VALUES (182, 5);
INSERT INTO product_health_category VALUES (183, 10);
INSERT INTO product_health_category VALUES (184, 6);
INSERT INTO product_health_category VALUES (185, 10);
INSERT INTO product_health_category VALUES (185, 7);
INSERT INTO product_health_category VALUES (186, 20);
INSERT INTO product_health_category VALUES (187, 20);
INSERT INTO product_health_category VALUES (188, 11);
INSERT INTO product_health_category VALUES (189, 7);


--
-- Data for Name: product_sample_indications; Type: TABLE DATA; Schema: public; Owner: app
--

INSERT INTO product_sample_indications VALUES (false, 1, 5);
INSERT INTO product_sample_indications VALUES (false, 35, 19);
INSERT INTO product_sample_indications VALUES (false, 87, 175);
INSERT INTO product_sample_indications VALUES (false, 77, 175);
INSERT INTO product_sample_indications VALUES (false, 35, 175);
INSERT INTO product_sample_indications VALUES (false, 44, 175);
INSERT INTO product_sample_indications VALUES (false, 82, 175);
INSERT INTO product_sample_indications VALUES (false, 157, 175);
INSERT INTO product_sample_indications VALUES (false, 99, 175);
INSERT INTO product_sample_indications VALUES (false, 114, 176);
INSERT INTO product_sample_indications VALUES (false, 115, 176);
INSERT INTO product_sample_indications VALUES (false, 118, 176);
INSERT INTO product_sample_indications VALUES (false, 119, 176);
INSERT INTO product_sample_indications VALUES (false, 120, 176);
INSERT INTO product_sample_indications VALUES (false, 121, 176);
INSERT INTO product_sample_indications VALUES (false, 117, 176);
INSERT INTO product_sample_indications VALUES (false, 116, 176);
INSERT INTO product_sample_indications VALUES (false, 111, 177);
INSERT INTO product_sample_indications VALUES (false, 62, 177);
INSERT INTO product_sample_indications VALUES (false, 157, 177);
INSERT INTO product_sample_indications VALUES (false, 123, 177);
INSERT INTO product_sample_indications VALUES (false, 82, 20);
INSERT INTO product_sample_indications VALUES (false, 85, 20);
INSERT INTO product_sample_indications VALUES (false, 86, 20);
INSERT INTO product_sample_indications VALUES (false, 100, 20);
INSERT INTO product_sample_indications VALUES (false, 95, 20);
INSERT INTO product_sample_indications VALUES (false, 141, 178);
INSERT INTO product_sample_indications VALUES (false, 37, 178);
INSERT INTO product_sample_indications VALUES (false, 37, 21);
INSERT INTO product_sample_indications VALUES (false, 44, 22);
INSERT INTO product_sample_indications VALUES (false, 99, 22);
INSERT INTO product_sample_indications VALUES (false, 65, 23);
INSERT INTO product_sample_indications VALUES (false, 86, 23);
INSERT INTO product_sample_indications VALUES (false, 11, 25);
INSERT INTO product_sample_indications VALUES (false, 86, 25);
INSERT INTO product_sample_indications VALUES (false, 142, 25);
INSERT INTO product_sample_indications VALUES (false, 130, 179);
INSERT INTO product_sample_indications VALUES (false, 96, 179);
INSERT INTO product_sample_indications VALUES (false, 150, 179);
INSERT INTO product_sample_indications VALUES (false, 159, 27);
INSERT INTO product_sample_indications VALUES (false, 96, 27);
INSERT INTO product_sample_indications VALUES (false, 134, 27);
INSERT INTO product_sample_indications VALUES (false, 99, 27);
INSERT INTO product_sample_indications VALUES (false, 116, 27);
INSERT INTO product_sample_indications VALUES (false, 162, 28);
INSERT INTO product_sample_indications VALUES (false, 102, 28);
INSERT INTO product_sample_indications VALUES (false, 180, 28);
INSERT INTO product_sample_indications VALUES (false, 4, 180);
INSERT INTO product_sample_indications VALUES (false, 37, 180);
INSERT INTO product_sample_indications VALUES (false, 96, 29);
INSERT INTO product_sample_indications VALUES (false, 100, 29);
INSERT INTO product_sample_indications VALUES (false, 76, 30);
INSERT INTO product_sample_indications VALUES (false, 35, 30);
INSERT INTO product_sample_indications VALUES (false, 28, 30);
INSERT INTO product_sample_indications VALUES (false, 188, 181);
INSERT INTO product_sample_indications VALUES (false, 136, 181);
INSERT INTO product_sample_indications VALUES (false, 194, 181);
INSERT INTO product_sample_indications VALUES (false, 79, 182);
INSERT INTO product_sample_indications VALUES (false, 63, 182);
INSERT INTO product_sample_indications VALUES (false, 135, 182);
INSERT INTO product_sample_indications VALUES (false, 80, 182);
INSERT INTO product_sample_indications VALUES (false, 189, 182);
INSERT INTO product_sample_indications VALUES (false, 97, 182);
INSERT INTO product_sample_indications VALUES (false, 31, 182);
INSERT INTO product_sample_indications VALUES (false, 106, 182);
INSERT INTO product_sample_indications VALUES (false, 88, 33);
INSERT INTO product_sample_indications VALUES (false, 33, 33);
INSERT INTO product_sample_indications VALUES (false, 96, 33);
INSERT INTO product_sample_indications VALUES (false, 132, 33);
INSERT INTO product_sample_indications VALUES (false, 33, 36);
INSERT INTO product_sample_indications VALUES (false, 82, 36);
INSERT INTO product_sample_indications VALUES (false, 81, 36);
INSERT INTO product_sample_indications VALUES (false, 130, 183);
INSERT INTO product_sample_indications VALUES (false, 20, 184);
INSERT INTO product_sample_indications VALUES (false, 21, 184);
INSERT INTO product_sample_indications VALUES (false, 156, 184);
INSERT INTO product_sample_indications VALUES (false, 158, 184);
INSERT INTO product_sample_indications VALUES (false, 62, 58);
INSERT INTO product_sample_indications VALUES (false, 157, 58);
INSERT INTO product_sample_indications VALUES (false, 132, 58);
INSERT INTO product_sample_indications VALUES (false, 168, 185);
INSERT INTO product_sample_indications VALUES (false, 6, 185);
INSERT INTO product_sample_indications VALUES (false, 130, 185);
INSERT INTO product_sample_indications VALUES (false, 39, 185);
INSERT INTO product_sample_indications VALUES (false, 40, 185);
INSERT INTO product_sample_indications VALUES (false, 44, 185);
INSERT INTO product_sample_indications VALUES (false, 150, 185);
INSERT INTO product_sample_indications VALUES (false, 11, 2);
INSERT INTO product_sample_indications VALUES (false, 86, 2);
INSERT INTO product_sample_indications VALUES (false, 95, 2);
INSERT INTO product_sample_indications VALUES (false, 111, 3);
INSERT INTO product_sample_indications VALUES (false, 162, 3);
INSERT INTO product_sample_indications VALUES (false, 188, 3);
INSERT INTO product_sample_indications VALUES (false, 86, 3);
INSERT INTO product_sample_indications VALUES (false, 102, 3);
INSERT INTO product_sample_indications VALUES (false, 180, 3);
INSERT INTO product_sample_indications VALUES (false, 116, 3);
INSERT INTO product_sample_indications VALUES (false, 141, 4);
INSERT INTO product_sample_indications VALUES (false, 44, 4);
INSERT INTO product_sample_indications VALUES (false, 150, 5);
INSERT INTO product_sample_indications VALUES (false, 2, 5);
INSERT INTO product_sample_indications VALUES (false, 142, 5);
INSERT INTO product_sample_indications VALUES (false, 165, 5);
INSERT INTO product_sample_indications VALUES (false, 57, 6);
INSERT INTO product_sample_indications VALUES (false, 68, 6);
INSERT INTO product_sample_indications VALUES (false, 130, 6);
INSERT INTO product_sample_indications VALUES (false, 60, 6);
INSERT INTO product_sample_indications VALUES (false, 43, 6);
INSERT INTO product_sample_indications VALUES (false, 158, 6);
INSERT INTO product_sample_indications VALUES (false, 159, 6);
INSERT INTO product_sample_indications VALUES (false, 35, 7);
INSERT INTO product_sample_indications VALUES (false, 62, 7);
INSERT INTO product_sample_indications VALUES (false, 157, 7);
INSERT INTO product_sample_indications VALUES (false, 125, 177);
INSERT INTO product_sample_indications VALUES (false, 134, 9);
INSERT INTO product_sample_indications VALUES (false, 3, 9);
INSERT INTO product_sample_indications VALUES (false, 129, 186);
INSERT INTO product_sample_indications VALUES (false, 35, 186);
INSERT INTO product_sample_indications VALUES (false, 113, 186);
INSERT INTO product_sample_indications VALUES (false, 137, 186);
INSERT INTO product_sample_indications VALUES (false, 129, 10);
INSERT INTO product_sample_indications VALUES (false, 35, 10);
INSERT INTO product_sample_indications VALUES (false, 67, 10);
INSERT INTO product_sample_indications VALUES (false, 77, 187);
INSERT INTO product_sample_indications VALUES (false, 78, 187);
INSERT INTO product_sample_indications VALUES (false, 60, 187);
INSERT INTO product_sample_indications VALUES (false, 65, 187);
INSERT INTO product_sample_indications VALUES (false, 83, 187);
INSERT INTO product_sample_indications VALUES (false, 160, 187);
INSERT INTO product_sample_indications VALUES (false, 20, 188);
INSERT INTO product_sample_indications VALUES (false, 156, 188);
INSERT INTO product_sample_indications VALUES (false, 59, 189);
INSERT INTO product_sample_indications VALUES (false, 60, 189);
INSERT INTO product_sample_indications VALUES (false, 130, 189);
INSERT INTO product_sample_indications VALUES (false, 65, 189);
INSERT INTO product_sample_indications VALUES (false, 83, 189);
INSERT INTO product_sample_indications VALUES (false, 47, 189);
INSERT INTO product_sample_indications VALUES (false, 160, 189);
INSERT INTO product_sample_indications VALUES (false, 100, 190);
INSERT INTO product_sample_indications VALUES (false, 101, 190);
INSERT INTO product_sample_indications VALUES (false, 142, 190);
INSERT INTO product_sample_indications VALUES (false, 60, 191);
INSERT INTO product_sample_indications VALUES (false, 130, 191);
INSERT INTO product_sample_indications VALUES (false, 47, 191);
INSERT INTO product_sample_indications VALUES (false, 160, 191);
INSERT INTO product_sample_indications VALUES (false, 20, 192);
INSERT INTO product_sample_indications VALUES (false, 21, 192);
INSERT INTO product_sample_indications VALUES (false, 115, 15);
INSERT INTO product_sample_indications VALUES (true, 118, 15);
INSERT INTO product_sample_indications VALUES (false, 120, 15);
INSERT INTO product_sample_indications VALUES (false, 188, 15);
INSERT INTO product_sample_indications VALUES (false, 121, 15);
INSERT INTO product_sample_indications VALUES (false, 194, 15);
INSERT INTO product_sample_indications VALUES (false, 67, 193);
INSERT INTO product_sample_indications VALUES (false, 138, 193);
INSERT INTO product_sample_indications VALUES (false, 137, 193);
INSERT INTO product_sample_indications VALUES (false, 44, 18);
INSERT INTO product_sample_indications VALUES (false, 99, 18);
INSERT INTO product_sample_indications VALUES (false, 142, 18);
INSERT INTO product_sample_indications VALUES (false, 35, 194);
INSERT INTO product_sample_indications VALUES (false, 78, 194);
INSERT INTO product_sample_indications VALUES (false, 130, 194);
INSERT INTO product_sample_indications VALUES (false, 82, 194);
INSERT INTO product_sample_indications VALUES (false, 137, 194);
INSERT INTO product_sample_indications VALUES (false, 121, 194);
INSERT INTO product_sample_indications VALUES (false, 84, 194);
INSERT INTO product_sample_indications VALUES (false, 99, 194);
INSERT INTO product_sample_indications VALUES (false, 87, 195);
INSERT INTO product_sample_indications VALUES (false, 44, 195);
INSERT INTO product_sample_indications VALUES (false, 82, 195);
INSERT INTO product_sample_indications VALUES (false, 81, 195);
INSERT INTO product_sample_indications VALUES (false, 96, 195);
INSERT INTO product_sample_indications VALUES (false, 99, 195);
INSERT INTO product_sample_indications VALUES (false, 35, 196);
INSERT INTO product_sample_indications VALUES (false, 78, 196);
INSERT INTO product_sample_indications VALUES (false, 82, 196);
INSERT INTO product_sample_indications VALUES (false, 157, 196);
INSERT INTO product_sample_indications VALUES (false, 85, 196);
INSERT INTO product_sample_indications VALUES (false, 20, 37);
INSERT INTO product_sample_indications VALUES (false, 21, 37);
INSERT INTO product_sample_indications VALUES (false, 15, 38);
INSERT INTO product_sample_indications VALUES (false, 62, 38);
INSERT INTO product_sample_indications VALUES (false, 157, 38);
INSERT INTO product_sample_indications VALUES (false, 123, 38);
INSERT INTO product_sample_indications VALUES (false, 112, 38);
INSERT INTO product_sample_indications VALUES (false, 112, 37);
INSERT INTO product_sample_indications VALUES (false, 91, 39);
INSERT INTO product_sample_indications VALUES (false, 33, 39);
INSERT INTO product_sample_indications VALUES (false, 96, 39);
INSERT INTO product_sample_indications VALUES (false, 87, 42);
INSERT INTO product_sample_indications VALUES (false, 44, 42);
INSERT INTO product_sample_indications VALUES (false, 69, 44);
INSERT INTO product_sample_indications VALUES (false, 69, 45);
INSERT INTO product_sample_indications VALUES (false, 62, 45);
INSERT INTO product_sample_indications VALUES (false, 134, 45);
INSERT INTO product_sample_indications VALUES (false, 159, 45);
INSERT INTO product_sample_indications VALUES (false, 127, 45);
INSERT INTO product_sample_indications VALUES (false, 131, 45);
INSERT INTO product_sample_indications VALUES (false, 117, 45);
INSERT INTO product_sample_indications VALUES (true, 113, 46);
INSERT INTO product_sample_indications VALUES (false, 118, 46);
INSERT INTO product_sample_indications VALUES (false, 119, 46);
INSERT INTO product_sample_indications VALUES (false, 121, 46);
INSERT INTO product_sample_indications VALUES (false, 116, 46);
INSERT INTO product_sample_indications VALUES (false, 117, 46);
INSERT INTO product_sample_indications VALUES (false, 152, 46);
INSERT INTO product_sample_indications VALUES (false, 87, 48);
INSERT INTO product_sample_indications VALUES (false, 63, 48);
INSERT INTO product_sample_indications VALUES (false, 80, 48);
INSERT INTO product_sample_indications VALUES (false, 183, 48);
INSERT INTO product_sample_indications VALUES (false, 147, 197);
INSERT INTO product_sample_indications VALUES (false, 142, 198);
INSERT INTO product_sample_indications VALUES (false, 3, 198);
INSERT INTO product_sample_indications VALUES (false, 53, 198);
INSERT INTO product_sample_indications VALUES (false, 60, 53);
INSERT INTO product_sample_indications VALUES (false, 44, 53);
INSERT INTO product_sample_indications VALUES (false, 40, 53);
INSERT INTO product_sample_indications VALUES (false, 46, 53);
INSERT INTO product_sample_indications VALUES (false, 160, 53);
INSERT INTO product_sample_indications VALUES (false, 57, 63);
INSERT INTO product_sample_indications VALUES (false, 69, 63);
INSERT INTO product_sample_indications VALUES (false, 61, 63);
INSERT INTO product_sample_indications VALUES (false, 184, 63);
INSERT INTO product_sample_indications VALUES (false, 64, 63);
INSERT INTO product_sample_indications VALUES (false, 58, 63);
INSERT INTO product_sample_indications VALUES (false, 60, 63);
INSERT INTO product_sample_indications VALUES (false, 130, 63);
INSERT INTO product_sample_indications VALUES (false, 170, 63);
INSERT INTO product_sample_indications VALUES (false, 158, 63);
INSERT INTO product_sample_indications VALUES (false, 62, 63);
INSERT INTO product_sample_indications VALUES (false, 157, 63);
INSERT INTO product_sample_indications VALUES (false, 71, 63);
INSERT INTO product_sample_indications VALUES (false, 164, 63);
INSERT INTO product_sample_indications VALUES (false, 159, 63);
INSERT INTO product_sample_indications VALUES (false, 68, 63);
INSERT INTO product_sample_indications VALUES (false, 65, 63);
INSERT INTO product_sample_indications VALUES (false, 160, 63);
INSERT INTO product_sample_indications VALUES (false, 124, 199);
INSERT INTO product_sample_indications VALUES (false, 126, 199);
INSERT INTO product_sample_indications VALUES (false, 62, 199);
INSERT INTO product_sample_indications VALUES (false, 159, 199);
INSERT INTO product_sample_indications VALUES (false, 134, 199);
INSERT INTO product_sample_indications VALUES (false, 69, 64);
INSERT INTO product_sample_indications VALUES (false, 129, 64);
INSERT INTO product_sample_indications VALUES (false, 155, 66);
INSERT INTO product_sample_indications VALUES (false, 153, 66);
INSERT INTO product_sample_indications VALUES (false, 79, 68);
INSERT INTO product_sample_indications VALUES (false, 135, 68);
INSERT INTO product_sample_indications VALUES (false, 189, 68);
INSERT INTO product_sample_indications VALUES (false, 63, 68);
INSERT INTO product_sample_indications VALUES (false, 157, 68);
INSERT INTO product_sample_indications VALUES (false, 158, 68);
INSERT INTO product_sample_indications VALUES (false, 77, 69);
INSERT INTO product_sample_indications VALUES (false, 35, 69);
INSERT INTO product_sample_indications VALUES (false, 62, 69);
INSERT INTO product_sample_indications VALUES (false, 82, 69);
INSERT INTO product_sample_indications VALUES (false, 65, 69);
INSERT INTO product_sample_indications VALUES (false, 149, 69);
INSERT INTO product_sample_indications VALUES (false, 83, 69);
INSERT INTO product_sample_indications VALUES (true, 52, 70);
INSERT INTO product_sample_indications VALUES (false, 33, 70);
INSERT INTO product_sample_indications VALUES (false, 87, 200);
INSERT INTO product_sample_indications VALUES (false, 147, 200);
INSERT INTO product_sample_indications VALUES (false, 148, 200);
INSERT INTO product_sample_indications VALUES (false, 83, 200);
INSERT INTO product_sample_indications VALUES (false, 150, 200);
INSERT INTO product_sample_indications VALUES (false, 152, 200);
INSERT INTO product_sample_indications VALUES (false, 35, 201);
INSERT INTO product_sample_indications VALUES (false, 60, 201);
INSERT INTO product_sample_indications VALUES (false, 82, 201);
INSERT INTO product_sample_indications VALUES (false, 114, 201);
INSERT INTO product_sample_indications VALUES (false, 120, 201);
INSERT INTO product_sample_indications VALUES (false, 121, 201);
INSERT INTO product_sample_indications VALUES (false, 103, 202);
INSERT INTO product_sample_indications VALUES (false, 104, 202);
INSERT INTO product_sample_indications VALUES (false, 105, 202);
INSERT INTO product_sample_indications VALUES (false, 110, 202);
INSERT INTO product_sample_indications VALUES (false, 86, 202);
INSERT INTO product_sample_indications VALUES (false, 100, 202);
INSERT INTO product_sample_indications VALUES (false, 142, 202);
INSERT INTO product_sample_indications VALUES (false, 108, 202);
INSERT INTO product_sample_indications VALUES (false, 86, 71);
INSERT INTO product_sample_indications VALUES (false, 103, 71);
INSERT INTO product_sample_indications VALUES (false, 142, 71);
INSERT INTO product_sample_indications VALUES (false, 130, 72);
INSERT INTO product_sample_indications VALUES (false, 40, 72);
INSERT INTO product_sample_indications VALUES (false, 111, 203);
INSERT INTO product_sample_indications VALUES (false, 103, 203);
INSERT INTO product_sample_indications VALUES (false, 162, 203);
INSERT INTO product_sample_indications VALUES (false, 120, 203);
INSERT INTO product_sample_indications VALUES (false, 121, 203);
INSERT INTO product_sample_indications VALUES (false, 180, 203);
INSERT INTO product_sample_indications VALUES (false, 109, 203);
INSERT INTO product_sample_indications VALUES (false, 169, 204);
INSERT INTO product_sample_indications VALUES (false, 144, 204);
INSERT INTO product_sample_indications VALUES (false, 31, 204);
INSERT INTO product_sample_indications VALUES (false, 153, 204);
INSERT INTO product_sample_indications VALUES (false, 44, 75);
INSERT INTO product_sample_indications VALUES (false, 142, 75);
INSERT INTO product_sample_indications VALUES (false, 3, 75);
INSERT INTO product_sample_indications VALUES (false, 141, 76);
INSERT INTO product_sample_indications VALUES (false, 130, 76);
INSERT INTO product_sample_indications VALUES (false, 38, 76);
INSERT INTO product_sample_indications VALUES (false, 44, 76);
INSERT INTO product_sample_indications VALUES (false, 141, 205);
INSERT INTO product_sample_indications VALUES (false, 38, 205);
INSERT INTO product_sample_indications VALUES (false, 44, 205);
INSERT INTO product_sample_indications VALUES (false, 130, 79);
INSERT INTO product_sample_indications VALUES (false, 88, 79);
INSERT INTO product_sample_indications VALUES (false, 194, 80);
INSERT INTO product_sample_indications VALUES (false, 121, 80);
INSERT INTO product_sample_indications VALUES (false, 114, 80);
INSERT INTO product_sample_indications VALUES (false, 87, 80);
INSERT INTO product_sample_indications VALUES (false, 6, 206);
INSERT INTO product_sample_indications VALUES (false, 96, 206);
INSERT INTO product_sample_indications VALUES (false, 131, 206);
INSERT INTO product_sample_indications VALUES (false, 96, 207);
INSERT INTO product_sample_indications VALUES (false, 99, 207);
INSERT INTO product_sample_indications VALUES (false, 93, 207);
INSERT INTO product_sample_indications VALUES (false, 94, 207);
INSERT INTO product_sample_indications VALUES (false, 63, 82);
INSERT INTO product_sample_indications VALUES (false, 62, 82);
INSERT INTO product_sample_indications VALUES (false, 157, 82);
INSERT INTO product_sample_indications VALUES (false, 158, 82);
INSERT INTO product_sample_indications VALUES (false, 9, 82);
INSERT INTO product_sample_indications VALUES (false, 60, 208);
INSERT INTO product_sample_indications VALUES (false, 69, 84);
INSERT INTO product_sample_indications VALUES (false, 130, 84);
INSERT INTO product_sample_indications VALUES (false, 120, 84);
INSERT INTO product_sample_indications VALUES (false, 188, 84);
INSERT INTO product_sample_indications VALUES (false, 121, 84);
INSERT INTO product_sample_indications VALUES (false, 20, 85);
INSERT INTO product_sample_indications VALUES (false, 21, 85);
INSERT INTO product_sample_indications VALUES (false, 61, 85);
INSERT INTO product_sample_indications VALUES (false, 156, 85);
INSERT INTO product_sample_indications VALUES (false, 138, 85);
INSERT INTO product_sample_indications VALUES (false, 67, 85);
INSERT INTO product_sample_indications VALUES (false, 37, 85);
INSERT INTO product_sample_indications VALUES (false, 130, 85);
INSERT INTO product_sample_indications VALUES (false, 44, 85);
INSERT INTO product_sample_indications VALUES (false, 20, 86);
INSERT INTO product_sample_indications VALUES (false, 102, 86);
INSERT INTO product_sample_indications VALUES (false, 180, 86);
INSERT INTO product_sample_indications VALUES (false, 85, 88);
INSERT INTO product_sample_indications VALUES (false, 103, 87);
INSERT INTO product_sample_indications VALUES (false, 162, 87);
INSERT INTO product_sample_indications VALUES (false, 65, 87);
INSERT INTO product_sample_indications VALUES (false, 83, 87);
INSERT INTO product_sample_indications VALUES (false, 87, 89);
INSERT INTO product_sample_indications VALUES (false, 130, 89);
INSERT INTO product_sample_indications VALUES (false, 43, 89);
INSERT INTO product_sample_indications VALUES (false, 158, 89);
INSERT INTO product_sample_indications VALUES (false, 96, 89);
INSERT INTO product_sample_indications VALUES (false, 99, 89);
INSERT INTO product_sample_indications VALUES (false, 130, 209);
INSERT INTO product_sample_indications VALUES (false, 85, 209);
INSERT INTO product_sample_indications VALUES (false, 141, 90);
INSERT INTO product_sample_indications VALUES (false, 183, 90);
INSERT INTO product_sample_indications VALUES (false, 142, 90);
INSERT INTO product_sample_indications VALUES (false, 5, 90);
INSERT INTO product_sample_indications VALUES (false, 37, 210);
INSERT INTO product_sample_indications VALUES (false, 87, 211);
INSERT INTO product_sample_indications VALUES (false, 77, 211);
INSERT INTO product_sample_indications VALUES (false, 35, 211);
INSERT INTO product_sample_indications VALUES (false, 185, 211);
INSERT INTO product_sample_indications VALUES (false, 82, 211);
INSERT INTO product_sample_indications VALUES (false, 96, 211);
INSERT INTO product_sample_indications VALUES (false, 99, 211);
INSERT INTO product_sample_indications VALUES (false, 11, 212);
INSERT INTO product_sample_indications VALUES (false, 61, 212);
INSERT INTO product_sample_indications VALUES (false, 5, 212);
INSERT INTO product_sample_indications VALUES (false, 63, 213);
INSERT INTO product_sample_indications VALUES (false, 80, 213);
INSERT INTO product_sample_indications VALUES (false, 153, 213);
INSERT INTO product_sample_indications VALUES (false, 63, 214);
INSERT INTO product_sample_indications VALUES (false, 80, 214);
INSERT INTO product_sample_indications VALUES (false, 68, 92);
INSERT INTO product_sample_indications VALUES (false, 63, 92);
INSERT INTO product_sample_indications VALUES (false, 159, 92);
INSERT INTO product_sample_indications VALUES (false, 160, 92);
INSERT INTO product_sample_indications VALUES (false, 31, 92);
INSERT INTO product_sample_indications VALUES (false, 20, 93);
INSERT INTO product_sample_indications VALUES (false, 21, 93);
INSERT INTO product_sample_indications VALUES (false, 74, 93);
INSERT INTO product_sample_indications VALUES (false, 59, 94);
INSERT INTO product_sample_indications VALUES (false, 130, 94);
INSERT INTO product_sample_indications VALUES (false, 35, 215);
INSERT INTO product_sample_indications VALUES (false, 78, 215);
INSERT INTO product_sample_indications VALUES (false, 6, 215);
INSERT INTO product_sample_indications VALUES (false, 62, 215);
INSERT INTO product_sample_indications VALUES (false, 157, 215);
INSERT INTO product_sample_indications VALUES (false, 35, 95);
INSERT INTO product_sample_indications VALUES (false, 143, 96);
INSERT INTO product_sample_indications VALUES (false, 140, 96);
INSERT INTO product_sample_indications VALUES (false, 62, 96);
INSERT INTO product_sample_indications VALUES (false, 157, 96);
INSERT INTO product_sample_indications VALUES (false, 144, 96);
INSERT INTO product_sample_indications VALUES (false, 145, 96);
INSERT INTO product_sample_indications VALUES (false, 149, 96);
INSERT INTO product_sample_indications VALUES (false, 169, 97);
INSERT INTO product_sample_indications VALUES (false, 62, 97);
INSERT INTO product_sample_indications VALUES (false, 145, 97);
INSERT INTO product_sample_indications VALUES (false, 153, 97);
INSERT INTO product_sample_indications VALUES (false, 64, 99);
INSERT INTO product_sample_indications VALUES (false, 211, 99);
INSERT INTO product_sample_indications VALUES (false, 63, 99);
INSERT INTO product_sample_indications VALUES (false, 62, 99);
INSERT INTO product_sample_indications VALUES (false, 157, 99);
INSERT INTO product_sample_indications VALUES (false, 145, 99);
INSERT INTO product_sample_indications VALUES (false, 149, 99);
INSERT INTO product_sample_indications VALUES (false, 87, 101);
INSERT INTO product_sample_indications VALUES (false, 110, 101);
INSERT INTO product_sample_indications VALUES (false, 142, 101);
INSERT INTO product_sample_indications VALUES (false, 3, 101);
INSERT INTO product_sample_indications VALUES (false, 83, 103);
INSERT INTO product_sample_indications VALUES (false, 142, 103);
INSERT INTO product_sample_indications VALUES (false, 5, 103);
INSERT INTO product_sample_indications VALUES (false, 87, 104);
INSERT INTO product_sample_indications VALUES (false, 43, 104);
INSERT INTO product_sample_indications VALUES (false, 158, 104);
INSERT INTO product_sample_indications VALUES (false, 87, 106);
INSERT INTO product_sample_indications VALUES (false, 183, 106);
INSERT INTO product_sample_indications VALUES (false, 166, 105);
INSERT INTO product_sample_indications VALUES (false, 167, 105);
INSERT INTO product_sample_indications VALUES (false, 62, 106);
INSERT INTO product_sample_indications VALUES (false, 63, 106);
INSERT INTO product_sample_indications VALUES (false, 157, 106);
INSERT INTO product_sample_indications VALUES (false, 115, 106);
INSERT INTO product_sample_indications VALUES (false, 77, 219);
INSERT INTO product_sample_indications VALUES (false, 35, 219);
INSERT INTO product_sample_indications VALUES (false, 25, 219);
INSERT INTO product_sample_indications VALUES (false, 62, 219);
INSERT INTO product_sample_indications VALUES (false, 82, 219);
INSERT INTO product_sample_indications VALUES (false, 157, 219);
INSERT INTO product_sample_indications VALUES (false, 83, 219);
INSERT INTO product_sample_indications VALUES (false, 183, 220);
INSERT INTO product_sample_indications VALUES (false, 82, 220);
INSERT INTO product_sample_indications VALUES (false, 160, 220);
INSERT INTO product_sample_indications VALUES (false, 99, 220);
INSERT INTO product_sample_indications VALUES (false, 154, 220);
INSERT INTO product_sample_indications VALUES (false, 87, 221);
INSERT INTO product_sample_indications VALUES (false, 44, 221);
INSERT INTO product_sample_indications VALUES (false, 96, 221);
INSERT INTO product_sample_indications VALUES (false, 130, 221);
INSERT INTO product_sample_indications VALUES (false, 43, 221);
INSERT INTO product_sample_indications VALUES (false, 158, 221);
INSERT INTO product_sample_indications VALUES (false, 44, 108);
INSERT INTO product_sample_indications VALUES (false, 158, 108);
INSERT INTO product_sample_indications VALUES (false, 78, 222);
INSERT INTO product_sample_indications VALUES (false, 82, 222);
INSERT INTO product_sample_indications VALUES (false, 157, 222);
INSERT INTO product_sample_indications VALUES (false, 159, 223);
INSERT INTO product_sample_indications VALUES (false, 24, 109);
INSERT INTO product_sample_indications VALUES (false, 82, 109);
INSERT INTO product_sample_indications VALUES (false, 114, 109);
INSERT INTO product_sample_indications VALUES (false, 121, 109);
INSERT INTO product_sample_indications VALUES (false, 99, 109);
INSERT INTO product_sample_indications VALUES (false, 87, 224);
INSERT INTO product_sample_indications VALUES (false, 33, 224);
INSERT INTO product_sample_indications VALUES (false, 130, 224);
INSERT INTO product_sample_indications VALUES (false, 82, 224);
INSERT INTO product_sample_indications VALUES (false, 114, 224);
INSERT INTO product_sample_indications VALUES (false, 99, 224);
INSERT INTO product_sample_indications VALUES (false, 88, 110);
INSERT INTO product_sample_indications VALUES (false, 103, 225);
INSERT INTO product_sample_indications VALUES (false, 79, 225);
INSERT INTO product_sample_indications VALUES (false, 157, 225);
INSERT INTO product_sample_indications VALUES (false, 158, 225);
INSERT INTO product_sample_indications VALUES (false, 97, 225);
INSERT INTO product_sample_indications VALUES (false, 33, 111);
INSERT INTO product_sample_indications VALUES (false, 129, 112);
INSERT INTO product_sample_indications VALUES (false, 61, 112);
INSERT INTO product_sample_indications VALUES (false, 65, 112);
INSERT INTO product_sample_indications VALUES (false, 63, 113);
INSERT INTO product_sample_indications VALUES (false, 80, 113);
INSERT INTO product_sample_indications VALUES (false, 157, 113);
INSERT INTO product_sample_indications VALUES (false, 155, 113);
INSERT INTO product_sample_indications VALUES (false, 151, 113);
INSERT INTO product_sample_indications VALUES (false, 130, 114);
INSERT INTO product_sample_indications VALUES (false, 83, 114);
INSERT INTO product_sample_indications VALUES (false, 155, 114);
INSERT INTO product_sample_indications VALUES (false, 113, 114);
INSERT INTO product_sample_indications VALUES (false, 120, 114);
INSERT INTO product_sample_indications VALUES (false, 65, 114);
INSERT INTO product_sample_indications VALUES (false, 129, 115);
INSERT INTO product_sample_indications VALUES (false, 61, 115);
INSERT INTO product_sample_indications VALUES (false, 65, 115);
INSERT INTO product_sample_indications VALUES (false, 69, 116);
INSERT INTO product_sample_indications VALUES (false, 130, 116);
INSERT INTO product_sample_indications VALUES (false, 188, 116);
INSERT INTO product_sample_indications VALUES (false, 121, 116);
INSERT INTO product_sample_indications VALUES (false, 66, 116);
INSERT INTO product_sample_indications VALUES (false, 65, 117);
INSERT INTO product_sample_indications VALUES (false, 83, 117);
INSERT INTO product_sample_indications VALUES (false, 48, 118);
INSERT INTO product_sample_indications VALUES (false, 60, 119);
INSERT INTO product_sample_indications VALUES (false, 61, 226);
INSERT INTO product_sample_indications VALUES (false, 93, 226);
INSERT INTO product_sample_indications VALUES (false, 63, 226);
INSERT INTO product_sample_indications VALUES (false, 183, 226);
INSERT INTO product_sample_indications VALUES (false, 96, 226);
INSERT INTO product_sample_indications VALUES (false, 88, 121);
INSERT INTO product_sample_indications VALUES (false, 96, 121);
INSERT INTO product_sample_indications VALUES (false, 77, 227);
INSERT INTO product_sample_indications VALUES (false, 15, 227);
INSERT INTO product_sample_indications VALUES (false, 129, 227);
INSERT INTO product_sample_indications VALUES (false, 35, 227);
INSERT INTO product_sample_indications VALUES (false, 82, 227);
INSERT INTO product_sample_indications VALUES (false, 157, 227);
INSERT INTO product_sample_indications VALUES (false, 137, 227);
INSERT INTO product_sample_indications VALUES (false, 160, 227);
INSERT INTO product_sample_indications VALUES (false, 123, 227);
INSERT INTO product_sample_indications VALUES (false, 85, 227);
INSERT INTO product_sample_indications VALUES (false, 58, 228);
INSERT INTO product_sample_indications VALUES (false, 59, 228);
INSERT INTO product_sample_indications VALUES (false, 113, 228);
INSERT INTO product_sample_indications VALUES (false, 120, 228);
INSERT INTO product_sample_indications VALUES (false, 188, 228);
INSERT INTO product_sample_indications VALUES (false, 121, 228);
INSERT INTO product_sample_indications VALUES (false, 91, 229);
INSERT INTO product_sample_indications VALUES (false, 135, 229);
INSERT INTO product_sample_indications VALUES (false, 96, 229);
INSERT INTO product_sample_indications VALUES (false, 131, 229);
INSERT INTO product_sample_indications VALUES (false, 132, 229);
INSERT INTO product_sample_indications VALUES (false, 133, 229);
INSERT INTO product_sample_indications VALUES (false, 60, 122);
INSERT INTO product_sample_indications VALUES (false, 37, 122);
INSERT INTO product_sample_indications VALUES (false, 44, 122);
INSERT INTO product_sample_indications VALUES (false, 68, 124);
INSERT INTO product_sample_indications VALUES (false, 58, 230);
INSERT INTO product_sample_indications VALUES (false, 67, 230);
INSERT INTO product_sample_indications VALUES (false, 63, 231);
INSERT INTO product_sample_indications VALUES (false, 80, 231);
INSERT INTO product_sample_indications VALUES (false, 187, 232);
INSERT INTO product_sample_indications VALUES (false, 111, 233);
INSERT INTO product_sample_indications VALUES (false, 62, 233);
INSERT INTO product_sample_indications VALUES (false, 157, 233);
INSERT INTO product_sample_indications VALUES (false, 123, 233);
INSERT INTO product_sample_indications VALUES (false, 114, 125);
INSERT INTO product_sample_indications VALUES (false, 121, 125);
INSERT INTO product_sample_indications VALUES (false, 188, 125);
INSERT INTO product_sample_indications VALUES (false, 194, 125);
INSERT INTO product_sample_indications VALUES (false, 40, 125);
INSERT INTO product_sample_indications VALUES (false, 42, 125);
INSERT INTO product_sample_indications VALUES (false, 47, 125);
INSERT INTO product_sample_indications VALUES (false, 115, 125);
INSERT INTO product_sample_indications VALUES (false, 123, 125);
INSERT INTO product_sample_indications VALUES (false, 102, 125);
INSERT INTO product_sample_indications VALUES (false, 180, 125);
INSERT INTO product_sample_indications VALUES (false, 66, 234);
INSERT INTO product_sample_indications VALUES (false, 65, 234);
INSERT INTO product_sample_indications VALUES (false, 64, 234);
INSERT INTO product_sample_indications VALUES (false, 56, 234);
INSERT INTO product_sample_indications VALUES (false, 87, 235);
INSERT INTO product_sample_indications VALUES (false, 130, 235);
INSERT INTO product_sample_indications VALUES (false, 155, 235);
INSERT INTO product_sample_indications VALUES (false, 15, 126);
INSERT INTO product_sample_indications VALUES (false, 22, 126);
INSERT INTO product_sample_indications VALUES (false, 131, 236);
INSERT INTO product_sample_indications VALUES (false, 132, 236);
INSERT INTO product_sample_indications VALUES (false, 107, 127);
INSERT INTO product_sample_indications VALUES (false, 11, 127);
INSERT INTO product_sample_indications VALUES (false, 98, 127);
INSERT INTO product_sample_indications VALUES (false, 65, 128);
INSERT INTO product_sample_indications VALUES (false, 83, 128);
INSERT INTO product_sample_indications VALUES (false, 85, 128);
INSERT INTO product_sample_indications VALUES (false, 186, 238);
INSERT INTO product_sample_indications VALUES (false, 34, 238);
INSERT INTO product_sample_indications VALUES (false, 17, 238);
INSERT INTO product_sample_indications VALUES (true, 46, 122);
INSERT INTO product_sample_indications VALUES (false, 96, 127);
INSERT INTO product_sample_indications VALUES (true, 87, 2);
INSERT INTO product_sample_indications VALUES (true, 91, 2);
INSERT INTO product_sample_indications VALUES (true, 96, 2);
INSERT INTO product_sample_indications VALUES (true, 108, 2);
INSERT INTO product_sample_indications VALUES (false, 99, 2);
INSERT INTO product_sample_indications VALUES (true, 100, 1);
INSERT INTO product_sample_indications VALUES (true, 101, 1);
INSERT INTO product_sample_indications VALUES (false, 103, 1);
INSERT INTO product_sample_indications VALUES (false, 87, 1);
INSERT INTO product_sample_indications VALUES (false, 91, 1);
INSERT INTO product_sample_indications VALUES (false, 96, 1);
INSERT INTO product_sample_indications VALUES (false, 103, 3);
INSERT INTO product_sample_indications VALUES (false, 104, 3);
INSERT INTO product_sample_indications VALUES (false, 141, 3);
INSERT INTO product_sample_indications VALUES (false, 113, 3);
INSERT INTO product_sample_indications VALUES (false, 117, 3);
INSERT INTO product_sample_indications VALUES (false, 118, 3);
INSERT INTO product_sample_indications VALUES (false, 119, 3);
INSERT INTO product_sample_indications VALUES (false, 120, 3);
INSERT INTO product_sample_indications VALUES (false, 121, 3);
INSERT INTO product_sample_indications VALUES (false, 101, 5);
INSERT INTO product_sample_indications VALUES (true, 87, 5);
INSERT INTO product_sample_indications VALUES (false, 91, 5);
INSERT INTO product_sample_indications VALUES (false, 7, 5);
INSERT INTO product_sample_indications VALUES (false, 44, 5);
INSERT INTO product_sample_indications VALUES (true, 96, 5);
INSERT INTO product_sample_indications VALUES (false, 10, 5);
INSERT INTO product_sample_indications VALUES (true, 11, 5);
INSERT INTO product_sample_indications VALUES (true, 12, 5);
INSERT INTO product_sample_indications VALUES (false, 78, 6);
INSERT INTO product_sample_indications VALUES (false, 6, 6);
INSERT INTO product_sample_indications VALUES (false, 4, 6);
INSERT INTO product_sample_indications VALUES (true, 44, 6);
INSERT INTO product_sample_indications VALUES (false, 128, 6);
INSERT INTO product_sample_indications VALUES (false, 74, 6);
INSERT INTO product_sample_indications VALUES (true, 137, 6);
INSERT INTO product_sample_indications VALUES (false, 75, 6);
INSERT INTO product_sample_indications VALUES (true, 66, 6);
INSERT INTO product_sample_indications VALUES (false, 30, 6);
INSERT INTO product_sample_indications VALUES (true, 67, 6);
INSERT INTO product_sample_indications VALUES (false, 49, 4);
INSERT INTO product_sample_indications VALUES (true, 37, 4);
INSERT INTO product_sample_indications VALUES (true, 40, 4);
INSERT INTO product_sample_indications VALUES (false, 42, 4);
INSERT INTO product_sample_indications VALUES (true, 47, 4);
INSERT INTO product_sample_indications VALUES (false, 140, 7);
INSERT INTO product_sample_indications VALUES (false, 143, 7);
INSERT INTO product_sample_indications VALUES (true, 78, 7);
INSERT INTO product_sample_indications VALUES (false, 59, 7);
INSERT INTO product_sample_indications VALUES (false, 145, 7);
INSERT INTO product_sample_indications VALUES (true, 137, 7);
INSERT INTO product_sample_indications VALUES (false, 66, 7);
INSERT INTO product_sample_indications VALUES (true, 84, 7);
INSERT INTO product_sample_indications VALUES (true, 67, 7);
INSERT INTO product_sample_indications VALUES (false, 155, 7);
INSERT INTO product_sample_indications VALUES (false, 141, 8);
INSERT INTO product_sample_indications VALUES (true, 78, 8);
INSERT INTO product_sample_indications VALUES (false, 91, 8);
INSERT INTO product_sample_indications VALUES (true, 96, 8);
INSERT INTO product_sample_indications VALUES (false, 90, 9);
INSERT INTO product_sample_indications VALUES (false, 105, 9);
INSERT INTO product_sample_indications VALUES (false, 181, 9);
INSERT INTO product_sample_indications VALUES (true, 106, 9);
INSERT INTO product_sample_indications VALUES (false, 107, 9);
INSERT INTO product_sample_indications VALUES (true, 97, 9);
INSERT INTO product_sample_indications VALUES (true, 132, 9);
INSERT INTO product_sample_indications VALUES (true, 98, 9);
INSERT INTO product_sample_indications VALUES (true, 133, 9);
INSERT INTO product_sample_indications VALUES (true, 78, 10);
INSERT INTO product_sample_indications VALUES (false, 59, 10);
INSERT INTO product_sample_indications VALUES (false, 63, 10);
INSERT INTO product_sample_indications VALUES (false, 74, 10);
INSERT INTO product_sample_indications VALUES (true, 137, 10);
INSERT INTO product_sample_indications VALUES (false, 66, 10);
INSERT INTO product_sample_indications VALUES (false, 153, 11);
INSERT INTO product_sample_indications VALUES (false, 100, 12);
INSERT INTO product_sample_indications VALUES (false, 101, 12);
INSERT INTO product_sample_indications VALUES (false, 59, 13);
INSERT INTO product_sample_indications VALUES (false, 63, 13);
INSERT INTO product_sample_indications VALUES (true, 74, 13);
INSERT INTO product_sample_indications VALUES (true, 137, 13);
INSERT INTO product_sample_indications VALUES (false, 66, 13);
INSERT INTO product_sample_indications VALUES (true, 67, 13);
INSERT INTO product_sample_indications VALUES (false, 112, 15);
INSERT INTO product_sample_indications VALUES (true, 114, 15);
INSERT INTO product_sample_indications VALUES (false, 116, 15);
INSERT INTO product_sample_indications VALUES (false, 117, 15);
INSERT INTO product_sample_indications VALUES (true, 119, 15);
INSERT INTO product_sample_indications VALUES (true, 124, 16);
INSERT INTO product_sample_indications VALUES (true, 125, 16);
INSERT INTO product_sample_indications VALUES (true, 126, 16);
INSERT INTO product_sample_indications VALUES (false, 128, 16);
INSERT INTO product_sample_indications VALUES (false, 69, 16);
INSERT INTO product_sample_indications VALUES (true, 134, 16);
INSERT INTO product_sample_indications VALUES (false, 87, 17);
INSERT INTO product_sample_indications VALUES (true, 15, 17);
INSERT INTO product_sample_indications VALUES (true, 16, 17);
INSERT INTO product_sample_indications VALUES (false, 100, 18);
INSERT INTO product_sample_indications VALUES (false, 87, 18);
INSERT INTO product_sample_indications VALUES (false, 8, 18);
INSERT INTO product_sample_indications VALUES (false, 96, 18);
INSERT INTO product_sample_indications VALUES (false, 12, 18);
INSERT INTO product_sample_indications VALUES (false, 99, 18);
INSERT INTO product_sample_indications VALUES (true, 78, 19);
INSERT INTO product_sample_indications VALUES (false, 113, 19);
INSERT INTO product_sample_indications VALUES (false, 69, 19);
INSERT INTO product_sample_indications VALUES (false, 117, 19);
INSERT INTO product_sample_indications VALUES (false, 120, 19);
INSERT INTO product_sample_indications VALUES (false, 121, 19);
INSERT INTO product_sample_indications VALUES (false, 109, 19);
INSERT INTO product_sample_indications VALUES (true, 84, 19);
INSERT INTO product_sample_indications VALUES (false, 49, 21);
INSERT INTO product_sample_indications VALUES (true, 37, 21);
INSERT INTO product_sample_indications VALUES (false, 44, 21);
INSERT INTO product_sample_indications VALUES (true, 46, 21);
INSERT INTO product_sample_indications VALUES (false, 47, 21);
INSERT INTO product_sample_indications VALUES (true, 48, 21);
INSERT INTO product_sample_indications VALUES (true, 100, 20);
INSERT INTO product_sample_indications VALUES (false, 101, 20);
INSERT INTO product_sample_indications VALUES (false, 87, 20);
INSERT INTO product_sample_indications VALUES (true, 15, 20);
INSERT INTO product_sample_indications VALUES (false, 96, 20);
INSERT INTO product_sample_indications VALUES (true, 166, 22);
INSERT INTO product_sample_indications VALUES (false, 141, 22);
INSERT INTO product_sample_indications VALUES (true, 168, 22);
INSERT INTO product_sample_indications VALUES (true, 169, 22);
INSERT INTO product_sample_indications VALUES (false, 96, 22);
INSERT INTO product_sample_indications VALUES (false, 119, 22);
INSERT INTO product_sample_indications VALUES (false, 100, 23);
INSERT INTO product_sample_indications VALUES (false, 101, 23);
INSERT INTO product_sample_indications VALUES (true, 103, 23);
INSERT INTO product_sample_indications VALUES (true, 87, 24);
INSERT INTO product_sample_indications VALUES (true, 77, 24);
INSERT INTO product_sample_indications VALUES (true, 83, 24);
INSERT INTO product_sample_indications VALUES (false, 15, 24);
INSERT INTO product_sample_indications VALUES (false, 78, 24);
INSERT INTO product_sample_indications VALUES (false, 113, 24);
INSERT INTO product_sample_indications VALUES (true, 44, 24);
INSERT INTO product_sample_indications VALUES (true, 96, 24);
INSERT INTO product_sample_indications VALUES (false, 11, 24);
INSERT INTO product_sample_indications VALUES (false, 12, 24);
INSERT INTO product_sample_indications VALUES (false, 99, 24);
INSERT INTO product_sample_indications VALUES (false, 78, 26);
INSERT INTO product_sample_indications VALUES (false, 74, 26);
INSERT INTO product_sample_indications VALUES (true, 137, 26);
INSERT INTO product_sample_indications VALUES (true, 138, 26);
INSERT INTO product_sample_indications VALUES (true, 139, 26);
INSERT INTO product_sample_indications VALUES (true, 67, 26);
INSERT INTO product_sample_indications VALUES (true, 87, 25);
INSERT INTO product_sample_indications VALUES (true, 91, 25);
INSERT INTO product_sample_indications VALUES (true, 96, 25);
INSERT INTO product_sample_indications VALUES (true, 108, 25);
INSERT INTO product_sample_indications VALUES (false, 12, 25);
INSERT INTO product_sample_indications VALUES (false, 99, 25);
INSERT INTO product_sample_indications VALUES (false, 125, 27);
INSERT INTO product_sample_indications VALUES (true, 126, 27);
INSERT INTO product_sample_indications VALUES (false, 141, 27);
INSERT INTO product_sample_indications VALUES (false, 82, 27);
INSERT INTO product_sample_indications VALUES (false, 81, 27);
INSERT INTO product_sample_indications VALUES (true, 96, 27);
INSERT INTO product_sample_indications VALUES (false, 131, 27);
INSERT INTO product_sample_indications VALUES (true, 109, 28);
INSERT INTO product_sample_indications VALUES (false, 87, 29);
INSERT INTO product_sample_indications VALUES (true, 104, 29);
INSERT INTO product_sample_indications VALUES (false, 96, 29);
INSERT INTO product_sample_indications VALUES (false, 87, 30);
INSERT INTO product_sample_indications VALUES (false, 77, 30);
INSERT INTO product_sample_indications VALUES (true, 23, 30);
INSERT INTO product_sample_indications VALUES (true, 24, 30);
INSERT INTO product_sample_indications VALUES (true, 25, 30);
INSERT INTO product_sample_indications VALUES (true, 26, 30);
INSERT INTO product_sample_indications VALUES (false, 82, 30);
INSERT INTO product_sample_indications VALUES (true, 27, 30);
INSERT INTO product_sample_indications VALUES (true, 29, 30);
INSERT INTO product_sample_indications VALUES (false, 78, 30);
INSERT INTO product_sample_indications VALUES (true, 96, 30);
INSERT INTO product_sample_indications VALUES (false, 69, 30);
INSERT INTO product_sample_indications VALUES (true, 141, 31);
INSERT INTO product_sample_indications VALUES (false, 8, 31);
INSERT INTO product_sample_indications VALUES (true, 30, 31);
INSERT INTO product_sample_indications VALUES (false, 124, 32);
INSERT INTO product_sample_indications VALUES (true, 15, 32);
INSERT INTO product_sample_indications VALUES (true, 16, 32);
INSERT INTO product_sample_indications VALUES (false, 100, 34);
INSERT INTO product_sample_indications VALUES (false, 53, 34);
INSERT INTO product_sample_indications VALUES (false, 151, 34);
INSERT INTO product_sample_indications VALUES (false, 12, 34);
INSERT INTO product_sample_indications VALUES (false, 36, 35);
INSERT INTO product_sample_indications VALUES (true, 17, 35);
INSERT INTO product_sample_indications VALUES (true, 186, 35);
INSERT INTO product_sample_indications VALUES (false, 49, 36);
INSERT INTO product_sample_indications VALUES (false, 90, 36);
INSERT INTO product_sample_indications VALUES (false, 51, 36);
INSERT INTO product_sample_indications VALUES (false, 52, 36);
INSERT INTO product_sample_indications VALUES (false, 53, 36);
INSERT INTO product_sample_indications VALUES (false, 54, 36);
INSERT INTO product_sample_indications VALUES (false, 55, 36);
INSERT INTO product_sample_indications VALUES (false, 126, 33);
INSERT INTO product_sample_indications VALUES (false, 133, 33);
INSERT INTO product_sample_indications VALUES (false, 15, 37);
INSERT INTO product_sample_indications VALUES (false, 32, 37);
INSERT INTO product_sample_indications VALUES (false, 116, 37);
INSERT INTO product_sample_indications VALUES (false, 126, 39);
INSERT INTO product_sample_indications VALUES (false, 32, 39);
INSERT INTO product_sample_indications VALUES (false, 92, 39);
INSERT INTO product_sample_indications VALUES (true, 49, 40);
INSERT INTO product_sample_indications VALUES (false, 113, 40);
INSERT INTO product_sample_indications VALUES (true, 37, 40);
INSERT INTO product_sample_indications VALUES (false, 32, 40);
INSERT INTO product_sample_indications VALUES (false, 40, 40);
INSERT INTO product_sample_indications VALUES (false, 42, 40);
INSERT INTO product_sample_indications VALUES (false, 44, 40);
INSERT INTO product_sample_indications VALUES (true, 46, 40);
INSERT INTO product_sample_indications VALUES (false, 119, 40);
INSERT INTO product_sample_indications VALUES (false, 47, 40);
INSERT INTO product_sample_indications VALUES (true, 42, 41);
INSERT INTO product_sample_indications VALUES (true, 47, 41);
INSERT INTO product_sample_indications VALUES (true, 106, 42);
INSERT INTO product_sample_indications VALUES (true, 96, 42);
INSERT INTO product_sample_indications VALUES (true, 97, 42);
INSERT INTO product_sample_indications VALUES (false, 133, 42);
INSERT INTO product_sample_indications VALUES (true, 39, 43);
INSERT INTO product_sample_indications VALUES (true, 41, 43);
INSERT INTO product_sample_indications VALUES (false, 113, 44);
INSERT INTO product_sample_indications VALUES (true, 120, 44);
INSERT INTO product_sample_indications VALUES (true, 67, 44);
INSERT INTO product_sample_indications VALUES (false, 124, 45);
INSERT INTO product_sample_indications VALUES (false, 125, 45);
INSERT INTO product_sample_indications VALUES (true, 126, 45);
INSERT INTO product_sample_indications VALUES (false, 128, 45);
INSERT INTO product_sample_indications VALUES (false, 74, 45);
INSERT INTO product_sample_indications VALUES (true, 120, 46);
INSERT INTO product_sample_indications VALUES (true, 100, 47);
INSERT INTO product_sample_indications VALUES (false, 101, 47);
INSERT INTO product_sample_indications VALUES (false, 103, 47);
INSERT INTO product_sample_indications VALUES (true, 168, 48);
INSERT INTO product_sample_indications VALUES (false, 74, 48);
INSERT INTO product_sample_indications VALUES (false, 87, 49);
INSERT INTO product_sample_indications VALUES (true, 9, 49);
INSERT INTO product_sample_indications VALUES (false, 12, 49);
INSERT INTO product_sample_indications VALUES (true, 14, 49);
INSERT INTO product_sample_indications VALUES (true, 44, 50);
INSERT INTO product_sample_indications VALUES (false, 118, 50);
INSERT INTO product_sample_indications VALUES (false, 119, 50);
INSERT INTO product_sample_indications VALUES (false, 120, 50);
INSERT INTO product_sample_indications VALUES (true, 137, 50);
INSERT INTO product_sample_indications VALUES (false, 69, 50);
INSERT INTO product_sample_indications VALUES (true, 66, 50);
INSERT INTO product_sample_indications VALUES (false, 141, 51);
INSERT INTO product_sample_indications VALUES (true, 78, 51);
INSERT INTO product_sample_indications VALUES (true, 59, 51);
INSERT INTO product_sample_indications VALUES (true, 137, 51);
INSERT INTO product_sample_indications VALUES (true, 67, 51);
INSERT INTO product_sample_indications VALUES (false, 87, 52);
INSERT INTO product_sample_indications VALUES (false, 96, 52);
INSERT INTO product_sample_indications VALUES (true, 11, 52);
INSERT INTO product_sample_indications VALUES (false, 98, 52);
INSERT INTO product_sample_indications VALUES (true, 12, 52);
INSERT INTO product_sample_indications VALUES (false, 141, 53);
INSERT INTO product_sample_indications VALUES (true, 46, 53);
INSERT INTO product_sample_indications VALUES (true, 47, 53);
INSERT INTO product_sample_indications VALUES (false, 166, 54);
INSERT INTO product_sample_indications VALUES (false, 168, 54);
INSERT INTO product_sample_indications VALUES (false, 87, 55);
INSERT INTO product_sample_indications VALUES (false, 78, 55);
INSERT INTO product_sample_indications VALUES (false, 44, 55);
INSERT INTO product_sample_indications VALUES (false, 74, 55);
INSERT INTO product_sample_indications VALUES (false, 96, 55);
INSERT INTO product_sample_indications VALUES (false, 137, 55);
INSERT INTO product_sample_indications VALUES (false, 75, 55);
INSERT INTO product_sample_indications VALUES (false, 66, 55);
INSERT INTO product_sample_indications VALUES (false, 67, 55);
INSERT INTO product_sample_indications VALUES (false, 141, 56);
INSERT INTO product_sample_indications VALUES (true, 113, 56);
INSERT INTO product_sample_indications VALUES (false, 120, 56);
INSERT INTO product_sample_indications VALUES (false, 150, 56);
INSERT INTO product_sample_indications VALUES (false, 152, 56);
INSERT INTO product_sample_indications VALUES (false, 141, 57);
INSERT INTO product_sample_indications VALUES (false, 113, 57);
INSERT INTO product_sample_indications VALUES (true, 37, 57);
INSERT INTO product_sample_indications VALUES (true, 40, 57);
INSERT INTO product_sample_indications VALUES (false, 42, 57);
INSERT INTO product_sample_indications VALUES (true, 44, 57);
INSERT INTO product_sample_indications VALUES (false, 90, 59);
INSERT INTO product_sample_indications VALUES (true, 89, 59);
INSERT INTO product_sample_indications VALUES (false, 181, 59);
INSERT INTO product_sample_indications VALUES (false, 96, 59);
INSERT INTO product_sample_indications VALUES (true, 90, 60);
INSERT INTO product_sample_indications VALUES (true, 89, 60);
INSERT INTO product_sample_indications VALUES (true, 181, 60);
INSERT INTO product_sample_indications VALUES (false, 90, 58);
INSERT INTO product_sample_indications VALUES (false, 89, 58);
INSERT INTO product_sample_indications VALUES (false, 181, 58);
INSERT INTO product_sample_indications VALUES (false, 87, 61);
INSERT INTO product_sample_indications VALUES (false, 53, 61);
INSERT INTO product_sample_indications VALUES (false, 96, 61);
INSERT INTO product_sample_indications VALUES (false, 11, 61);
INSERT INTO product_sample_indications VALUES (true, 12, 61);
INSERT INTO product_sample_indications VALUES (false, 99, 61);
INSERT INTO product_sample_indications VALUES (false, 59, 76);
INSERT INTO product_sample_indications VALUES (false, 135, 76);
INSERT INTO product_sample_indications VALUES (true, 44, 76);
INSERT INTO product_sample_indications VALUES (true, 37, 77);
INSERT INTO product_sample_indications VALUES (false, 6, 77);
INSERT INTO product_sample_indications VALUES (true, 39, 77);
INSERT INTO product_sample_indications VALUES (true, 40, 77);
INSERT INTO product_sample_indications VALUES (true, 41, 77);
INSERT INTO product_sample_indications VALUES (true, 42, 77);
INSERT INTO product_sample_indications VALUES (true, 44, 77);
INSERT INTO product_sample_indications VALUES (true, 46, 77);
INSERT INTO product_sample_indications VALUES (true, 47, 77);
INSERT INTO product_sample_indications VALUES (true, 48, 77);
INSERT INTO product_sample_indications VALUES (true, 193, 77);
INSERT INTO product_sample_indications VALUES (false, 56, 77);
INSERT INTO product_sample_indications VALUES (false, 87, 78);
INSERT INTO product_sample_indications VALUES (false, 91, 78);
INSERT INTO product_sample_indications VALUES (false, 93, 78);
INSERT INTO product_sample_indications VALUES (false, 94, 78);
INSERT INTO product_sample_indications VALUES (false, 96, 78);
INSERT INTO product_sample_indications VALUES (false, 99, 78);
INSERT INTO product_sample_indications VALUES (false, 87, 79);
INSERT INTO product_sample_indications VALUES (false, 88, 79);
INSERT INTO product_sample_indications VALUES (false, 6, 79);
INSERT INTO product_sample_indications VALUES (false, 91, 79);
INSERT INTO product_sample_indications VALUES (true, 96, 79);
INSERT INTO product_sample_indications VALUES (false, 144, 79);
INSERT INTO product_sample_indications VALUES (false, 145, 79);
INSERT INTO product_sample_indications VALUES (false, 99, 79);
INSERT INTO product_sample_indications VALUES (false, 150, 79);
INSERT INTO product_sample_indications VALUES (false, 152, 79);
INSERT INTO product_sample_indications VALUES (false, 153, 79);
INSERT INTO product_sample_indications VALUES (false, 155, 79);
INSERT INTO product_sample_indications VALUES (false, 88, 100);
INSERT INTO product_sample_indications VALUES (false, 168, 100);
INSERT INTO product_sample_indications VALUES (false, 89, 100);
INSERT INTO product_sample_indications VALUES (false, 106, 100);
INSERT INTO product_sample_indications VALUES (false, 40, 100);
INSERT INTO product_sample_indications VALUES (false, 42, 100);
INSERT INTO product_sample_indications VALUES (false, 94, 100);
INSERT INTO product_sample_indications VALUES (true, 114, 100);
INSERT INTO product_sample_indications VALUES (true, 118, 100);
INSERT INTO product_sample_indications VALUES (true, 119, 100);
INSERT INTO product_sample_indications VALUES (true, 120, 100);
INSERT INTO product_sample_indications VALUES (true, 136, 100);
INSERT INTO product_sample_indications VALUES (false, 107, 100);
INSERT INTO product_sample_indications VALUES (false, 97, 100);
INSERT INTO product_sample_indications VALUES (true, 122, 100);
INSERT INTO product_sample_indications VALUES (true, 47, 100);
INSERT INTO product_sample_indications VALUES (false, 133, 100);
INSERT INTO product_sample_indications VALUES (false, 100, 101);
INSERT INTO product_sample_indications VALUES (false, 105, 101);
INSERT INTO product_sample_indications VALUES (false, 96, 101);
INSERT INTO product_sample_indications VALUES (false, 143, 102);
INSERT INTO product_sample_indications VALUES (true, 138, 102);
INSERT INTO product_sample_indications VALUES (true, 139, 102);
INSERT INTO product_sample_indications VALUES (false, 87, 103);
INSERT INTO product_sample_indications VALUES (true, 74, 103);
INSERT INTO product_sample_indications VALUES (true, 96, 103);
INSERT INTO product_sample_indications VALUES (true, 107, 103);
INSERT INTO product_sample_indications VALUES (true, 11, 103);
INSERT INTO product_sample_indications VALUES (true, 98, 103);
INSERT INTO product_sample_indications VALUES (true, 12, 103);
INSERT INTO product_sample_indications VALUES (false, 119, 103);
INSERT INTO product_sample_indications VALUES (true, 15, 103);
INSERT INTO product_sample_indications VALUES (true, 113, 103);
INSERT INTO product_sample_indications VALUES (true, 87, 127);
INSERT INTO product_sample_indications VALUES (false, 91, 127);
INSERT INTO product_sample_indications VALUES (true, 96, 127);
INSERT INTO product_sample_indications VALUES (true, 107, 127);
INSERT INTO product_sample_indications VALUES (false, 11, 127);
INSERT INTO product_sample_indications VALUES (true, 36, 128);
INSERT INTO product_sample_indications VALUES (false, 103, 128);
INSERT INTO product_sample_indications VALUES (false, 152, 128);
INSERT INTO product_sample_indications VALUES (false, 78, 129);
INSERT INTO product_sample_indications VALUES (true, 186, 129);
INSERT INTO product_sample_indications VALUES (false, 152, 129);
INSERT INTO product_sample_indications VALUES (false, 87, 130);
INSERT INTO product_sample_indications VALUES (false, 168, 130);
INSERT INTO product_sample_indications VALUES (false, 91, 130);
INSERT INTO product_sample_indications VALUES (false, 96, 130);
INSERT INTO product_sample_indications VALUES (true, 144, 130);
INSERT INTO product_sample_indications VALUES (false, 145, 130);
INSERT INTO product_sample_indications VALUES (false, 87, 131);
INSERT INTO product_sample_indications VALUES (false, 74, 131);
INSERT INTO product_sample_indications VALUES (false, 96, 131);
INSERT INTO product_sample_indications VALUES (false, 11, 131);
INSERT INTO product_sample_indications VALUES (true, 12, 131);
INSERT INTO product_sample_indications VALUES (false, 150, 132);
INSERT INTO product_sample_indications VALUES (false, 152, 132);
INSERT INTO product_sample_indications VALUES (true, 15, 133);
INSERT INTO product_sample_indications VALUES (false, 112, 133);
INSERT INTO product_sample_indications VALUES (false, 32, 133);
INSERT INTO product_sample_indications VALUES (false, 116, 133);
INSERT INTO product_sample_indications VALUES (false, 117, 133);
INSERT INTO product_sample_indications VALUES (true, 166, 80);
INSERT INTO product_sample_indications VALUES (false, 87, 80);
INSERT INTO product_sample_indications VALUES (false, 168, 80);
INSERT INTO product_sample_indications VALUES (true, 114, 80);
INSERT INTO product_sample_indications VALUES (false, 117, 80);
INSERT INTO product_sample_indications VALUES (false, 135, 81);
INSERT INTO product_sample_indications VALUES (false, 137, 81);
INSERT INTO product_sample_indications VALUES (false, 67, 81);
INSERT INTO product_sample_indications VALUES (true, 14, 82);
INSERT INTO product_sample_indications VALUES (false, 126, 83);
INSERT INTO product_sample_indications VALUES (false, 88, 83);
INSERT INTO product_sample_indications VALUES (false, 89, 83);
INSERT INTO product_sample_indications VALUES (false, 181, 83);
INSERT INTO product_sample_indications VALUES (false, 91, 83);
INSERT INTO product_sample_indications VALUES (true, 106, 83);
INSERT INTO product_sample_indications VALUES (false, 44, 83);
INSERT INTO product_sample_indications VALUES (false, 96, 83);
INSERT INTO product_sample_indications VALUES (true, 97, 83);
INSERT INTO product_sample_indications VALUES (true, 133, 83);
INSERT INTO product_sample_indications VALUES (false, 99, 83);
INSERT INTO product_sample_indications VALUES (false, 141, 84);
INSERT INTO product_sample_indications VALUES (false, 63, 84);
INSERT INTO product_sample_indications VALUES (true, 136, 84);
INSERT INTO product_sample_indications VALUES (true, 135, 84);
INSERT INTO product_sample_indications VALUES (false, 44, 84);
INSERT INTO product_sample_indications VALUES (true, 137, 84);
INSERT INTO product_sample_indications VALUES (false, 66, 84);
INSERT INTO product_sample_indications VALUES (false, 30, 84);
INSERT INTO product_sample_indications VALUES (false, 67, 84);
INSERT INTO product_sample_indications VALUES (false, 15, 85);
INSERT INTO product_sample_indications VALUES (true, 16, 85);
INSERT INTO product_sample_indications VALUES (false, 113, 85);
INSERT INTO product_sample_indications VALUES (false, 113, 86);
INSERT INTO product_sample_indications VALUES (false, 118, 86);
INSERT INTO product_sample_indications VALUES (false, 119, 86);
INSERT INTO product_sample_indications VALUES (false, 120, 86);
INSERT INTO product_sample_indications VALUES (true, 109, 86);
INSERT INTO product_sample_indications VALUES (true, 103, 87);
INSERT INTO product_sample_indications VALUES (false, 78, 87);
INSERT INTO product_sample_indications VALUES (false, 18, 87);
INSERT INTO product_sample_indications VALUES (false, 152, 87);
INSERT INTO product_sample_indications VALUES (true, 18, 88);
INSERT INTO product_sample_indications VALUES (true, 19, 88);
INSERT INTO product_sample_indications VALUES (false, 59, 89);
INSERT INTO product_sample_indications VALUES (true, 44, 89);
INSERT INTO product_sample_indications VALUES (false, 87, 90);
INSERT INTO product_sample_indications VALUES (false, 91, 90);
INSERT INTO product_sample_indications VALUES (false, 96, 90);
INSERT INTO product_sample_indications VALUES (false, 11, 90);
INSERT INTO product_sample_indications VALUES (true, 99, 90);
INSERT INTO product_sample_indications VALUES (false, 141, 91);
INSERT INTO product_sample_indications VALUES (false, 78, 91);
INSERT INTO product_sample_indications VALUES (true, 153, 91);
INSERT INTO product_sample_indications VALUES (true, 30, 92);
INSERT INTO product_sample_indications VALUES (true, 16, 93);
INSERT INTO product_sample_indications VALUES (false, 74, 93);
INSERT INTO product_sample_indications VALUES (false, 66, 93);
INSERT INTO product_sample_indications VALUES (true, 67, 93);
INSERT INTO product_sample_indications VALUES (true, 30, 94);
INSERT INTO product_sample_indications VALUES (false, 87, 95);
INSERT INTO product_sample_indications VALUES (true, 91, 95);
INSERT INTO product_sample_indications VALUES (true, 96, 95);
INSERT INTO product_sample_indications VALUES (true, 99, 95);
INSERT INTO product_sample_indications VALUES (false, 140, 96);
INSERT INTO product_sample_indications VALUES (false, 144, 96);
INSERT INTO product_sample_indications VALUES (true, 145, 96);
INSERT INTO product_sample_indications VALUES (false, 141, 97);
INSERT INTO product_sample_indications VALUES (false, 74, 97);
INSERT INTO product_sample_indications VALUES (true, 144, 97);
INSERT INTO product_sample_indications VALUES (false, 119, 97);
INSERT INTO product_sample_indications VALUES (true, 155, 97);
INSERT INTO product_sample_indications VALUES (false, 100, 98);
INSERT INTO product_sample_indications VALUES (true, 87, 98);
INSERT INTO product_sample_indications VALUES (false, 126, 98);
INSERT INTO product_sample_indications VALUES (false, 141, 98);
INSERT INTO product_sample_indications VALUES (false, 88, 98);
INSERT INTO product_sample_indications VALUES (false, 168, 98);
INSERT INTO product_sample_indications VALUES (false, 89, 98);
INSERT INTO product_sample_indications VALUES (true, 91, 98);
INSERT INTO product_sample_indications VALUES (false, 32, 98);
INSERT INTO product_sample_indications VALUES (false, 92, 98);
INSERT INTO product_sample_indications VALUES (true, 96, 98);
INSERT INTO product_sample_indications VALUES (false, 46, 98);
INSERT INTO product_sample_indications VALUES (false, 97, 98);
INSERT INTO product_sample_indications VALUES (false, 133, 98);
INSERT INTO product_sample_indications VALUES (true, 99, 98);
INSERT INTO product_sample_indications VALUES (false, 140, 99);
INSERT INTO product_sample_indications VALUES (false, 152, 99);
INSERT INTO product_sample_indications VALUES (true, 155, 99);
INSERT INTO product_sample_indications VALUES (false, 151, 103);
INSERT INTO product_sample_indications VALUES (false, 141, 104);
INSERT INTO product_sample_indications VALUES (false, 59, 104);
INSERT INTO product_sample_indications VALUES (true, 44, 104);
INSERT INTO product_sample_indications VALUES (true, 168, 105);
INSERT INTO product_sample_indications VALUES (true, 166, 106);
INSERT INTO product_sample_indications VALUES (false, 141, 106);
INSERT INTO product_sample_indications VALUES (true, 168, 106);
INSERT INTO product_sample_indications VALUES (false, 126, 107);
INSERT INTO product_sample_indications VALUES (false, 141, 107);
INSERT INTO product_sample_indications VALUES (true, 88, 107);
INSERT INTO product_sample_indications VALUES (true, 91, 107);
INSERT INTO product_sample_indications VALUES (true, 93, 107);
INSERT INTO product_sample_indications VALUES (true, 96, 107);
INSERT INTO product_sample_indications VALUES (false, 141, 108);
INSERT INTO product_sample_indications VALUES (false, 59, 108);
INSERT INTO product_sample_indications VALUES (true, 44, 108);
INSERT INTO product_sample_indications VALUES (true, 87, 109);
INSERT INTO product_sample_indications VALUES (false, 141, 109);
INSERT INTO product_sample_indications VALUES (false, 91, 109);
INSERT INTO product_sample_indications VALUES (true, 96, 109);
INSERT INTO product_sample_indications VALUES (true, 87, 110);
INSERT INTO product_sample_indications VALUES (false, 6, 110);
INSERT INTO product_sample_indications VALUES (true, 91, 110);
INSERT INTO product_sample_indications VALUES (true, 96, 110);
INSERT INTO product_sample_indications VALUES (false, 99, 110);
INSERT INTO product_sample_indications VALUES (true, 87, 111);
INSERT INTO product_sample_indications VALUES (false, 91, 111);
INSERT INTO product_sample_indications VALUES (true, 96, 111);
INSERT INTO product_sample_indications VALUES (true, 99, 111);
INSERT INTO product_sample_indications VALUES (false, 78, 112);
INSERT INTO product_sample_indications VALUES (false, 135, 112);
INSERT INTO product_sample_indications VALUES (true, 137, 112);
INSERT INTO product_sample_indications VALUES (true, 67, 112);
INSERT INTO product_sample_indications VALUES (false, 141, 113);
INSERT INTO product_sample_indications VALUES (false, 78, 113);
INSERT INTO product_sample_indications VALUES (true, 153, 113);
INSERT INTO product_sample_indications VALUES (true, 78, 115);
INSERT INTO product_sample_indications VALUES (true, 137, 115);
INSERT INTO product_sample_indications VALUES (false, 139, 115);
INSERT INTO product_sample_indications VALUES (false, 67, 115);
INSERT INTO product_sample_indications VALUES (false, 141, 114);
INSERT INTO product_sample_indications VALUES (false, 150, 114);
INSERT INTO product_sample_indications VALUES (false, 152, 114);
INSERT INTO product_sample_indications VALUES (false, 141, 116);
INSERT INTO product_sample_indications VALUES (false, 59, 116);
INSERT INTO product_sample_indications VALUES (true, 135, 116);
INSERT INTO product_sample_indications VALUES (false, 44, 116);
INSERT INTO product_sample_indications VALUES (true, 186, 117);
INSERT INTO product_sample_indications VALUES (true, 48, 118);
INSERT INTO product_sample_indications VALUES (false, 48, 119);
INSERT INTO product_sample_indications VALUES (false, 49, 122);
INSERT INTO product_sample_indications VALUES (false, 59, 122);
INSERT INTO product_sample_indications VALUES (false, 119, 122);
INSERT INTO product_sample_indications VALUES (false, 47, 122);
INSERT INTO product_sample_indications VALUES (true, 48, 122);
INSERT INTO product_sample_indications VALUES (false, 166, 123);
INSERT INTO product_sample_indications VALUES (false, 168, 123);
INSERT INTO product_sample_indications VALUES (false, 74, 124);
INSERT INTO product_sample_indications VALUES (false, 136, 124);
INSERT INTO product_sample_indications VALUES (true, 137, 124);
INSERT INTO product_sample_indications VALUES (false, 138, 124);
INSERT INTO product_sample_indications VALUES (false, 139, 124);
INSERT INTO product_sample_indications VALUES (false, 78, 124);
INSERT INTO product_sample_indications VALUES (false, 135, 124);
INSERT INTO product_sample_indications VALUES (true, 67, 124);
INSERT INTO product_sample_indications VALUES (false, 141, 125);
INSERT INTO product_sample_indications VALUES (false, 113, 125);
INSERT INTO product_sample_indications VALUES (false, 181, 125);
INSERT INTO product_sample_indications VALUES (false, 135, 125);
INSERT INTO product_sample_indications VALUES (true, 114, 125);
INSERT INTO product_sample_indications VALUES (false, 116, 125);
INSERT INTO product_sample_indications VALUES (false, 117, 125);
INSERT INTO product_sample_indications VALUES (true, 118, 125);
INSERT INTO product_sample_indications VALUES (true, 119, 125);
INSERT INTO product_sample_indications VALUES (true, 120, 125);
INSERT INTO product_sample_indications VALUES (true, 136, 125);
INSERT INTO product_sample_indications VALUES (true, 122, 125);
INSERT INTO product_sample_indications VALUES (false, 47, 125);
INSERT INTO product_sample_indications VALUES (false, 109, 125);
INSERT INTO product_sample_indications VALUES (false, 54, 125);
INSERT INTO product_sample_indications VALUES (false, 55, 125);
INSERT INTO product_sample_indications VALUES (true, 118, 126);
INSERT INTO product_sample_indications VALUES (false, 119, 126);
INSERT INTO product_sample_indications VALUES (true, 15, 126);
INSERT INTO product_sample_indications VALUES (true, 18, 126);
INSERT INTO product_sample_indications VALUES (true, 113, 126);
INSERT INTO product_sample_indications VALUES (false, 124, 134);
INSERT INTO product_sample_indications VALUES (false, 125, 134);
INSERT INTO product_sample_indications VALUES (false, 126, 134);
INSERT INTO product_sample_indications VALUES (false, 141, 134);
INSERT INTO product_sample_indications VALUES (true, 133, 134);
INSERT INTO product_sample_indications VALUES (true, 134, 134);
INSERT INTO product_sample_indications VALUES (false, 166, 135);
INSERT INTO product_sample_indications VALUES (false, 141, 135);
INSERT INTO product_sample_indications VALUES (false, 112, 135);
INSERT INTO product_sample_indications VALUES (false, 168, 135);
INSERT INTO product_sample_indications VALUES (false, 113, 135);
INSERT INTO product_sample_indications VALUES (true, 114, 135);
INSERT INTO product_sample_indications VALUES (false, 116, 135);
INSERT INTO product_sample_indications VALUES (false, 117, 135);
INSERT INTO product_sample_indications VALUES (true, 118, 135);
INSERT INTO product_sample_indications VALUES (true, 119, 135);
INSERT INTO product_sample_indications VALUES (false, 120, 135);
INSERT INTO product_sample_indications VALUES (false, 109, 135);
INSERT INTO product_sample_indications VALUES (true, 87, 136);
INSERT INTO product_sample_indications VALUES (true, 91, 136);
INSERT INTO product_sample_indications VALUES (true, 8, 136);
INSERT INTO product_sample_indications VALUES (true, 96, 136);
INSERT INTO product_sample_indications VALUES (false, 11, 136);
INSERT INTO product_sample_indications VALUES (false, 99, 136);
INSERT INTO product_sample_indications VALUES (false, 118, 137);
INSERT INTO product_sample_indications VALUES (false, 136, 137);
INSERT INTO product_sample_indications VALUES (true, 137, 137);
INSERT INTO product_sample_indications VALUES (true, 122, 137);
INSERT INTO product_sample_indications VALUES (false, 67, 137);
INSERT INTO product_sample_indications VALUES (false, 87, 138);
INSERT INTO product_sample_indications VALUES (false, 91, 138);
INSERT INTO product_sample_indications VALUES (true, 96, 138);
INSERT INTO product_sample_indications VALUES (true, 11, 138);
INSERT INTO product_sample_indications VALUES (true, 12, 138);
INSERT INTO product_sample_indications VALUES (true, 143, 139);
INSERT INTO product_sample_indications VALUES (false, 59, 139);
INSERT INTO product_sample_indications VALUES (false, 63, 139);
INSERT INTO product_sample_indications VALUES (false, 135, 139);
INSERT INTO product_sample_indications VALUES (false, 74, 139);
INSERT INTO product_sample_indications VALUES (false, 136, 139);
INSERT INTO product_sample_indications VALUES (true, 137, 139);
INSERT INTO product_sample_indications VALUES (false, 66, 139);
INSERT INTO product_sample_indications VALUES (false, 54, 139);
INSERT INTO product_sample_indications VALUES (true, 140, 140);
INSERT INTO product_sample_indications VALUES (true, 145, 140);
INSERT INTO product_sample_indications VALUES (true, 155, 140);
INSERT INTO product_sample_indications VALUES (true, 100, 141);
INSERT INTO product_sample_indications VALUES (false, 87, 141);
INSERT INTO product_sample_indications VALUES (false, 78, 141);
INSERT INTO product_sample_indications VALUES (false, 91, 141);
INSERT INTO product_sample_indications VALUES (false, 74, 141);
INSERT INTO product_sample_indications VALUES (false, 96, 141);
INSERT INTO product_sample_indications VALUES (false, 119, 141);
INSERT INTO product_sample_indications VALUES (false, 136, 141);
INSERT INTO product_sample_indications VALUES (false, 11, 141);
INSERT INTO product_sample_indications VALUES (false, 67, 141);
INSERT INTO product_sample_indications VALUES (true, 99, 141);
INSERT INTO product_sample_indications VALUES (false, 91, 142);
INSERT INTO product_sample_indications VALUES (false, 96, 142);
INSERT INTO product_sample_indications VALUES (true, 133, 142);
INSERT INTO product_sample_indications VALUES (false, 100, 143);
INSERT INTO product_sample_indications VALUES (false, 87, 143);
INSERT INTO product_sample_indications VALUES (false, 91, 143);
INSERT INTO product_sample_indications VALUES (false, 8, 143);
INSERT INTO product_sample_indications VALUES (false, 74, 143);
INSERT INTO product_sample_indications VALUES (false, 96, 143);
INSERT INTO product_sample_indications VALUES (false, 107, 143);
INSERT INTO product_sample_indications VALUES (true, 11, 143);
INSERT INTO product_sample_indications VALUES (true, 98, 143);
INSERT INTO product_sample_indications VALUES (true, 12, 143);
INSERT INTO product_sample_indications VALUES (false, 99, 143);
INSERT INTO product_sample_indications VALUES (true, 143, 144);
INSERT INTO product_sample_indications VALUES (true, 137, 144);
INSERT INTO product_sample_indications VALUES (true, 138, 144);
INSERT INTO product_sample_indications VALUES (true, 139, 144);
INSERT INTO product_sample_indications VALUES (false, 67, 144);
INSERT INTO product_sample_indications VALUES (false, 124, 145);
INSERT INTO product_sample_indications VALUES (false, 87, 145);
INSERT INTO product_sample_indications VALUES (false, 15, 145);
INSERT INTO product_sample_indications VALUES (false, 125, 145);
INSERT INTO product_sample_indications VALUES (false, 126, 145);
INSERT INTO product_sample_indications VALUES (false, 128, 145);
INSERT INTO product_sample_indications VALUES (false, 74, 145);
INSERT INTO product_sample_indications VALUES (false, 96, 145);
INSERT INTO product_sample_indications VALUES (false, 137, 145);
INSERT INTO product_sample_indications VALUES (false, 66, 145);
INSERT INTO product_sample_indications VALUES (false, 67, 145);
INSERT INTO product_sample_indications VALUES (true, 113, 146);
INSERT INTO product_sample_indications VALUES (false, 117, 146);
INSERT INTO product_sample_indications VALUES (true, 119, 146);
INSERT INTO product_sample_indications VALUES (true, 120, 146);
INSERT INTO product_sample_indications VALUES (false, 112, 147);
INSERT INTO product_sample_indications VALUES (false, 113, 147);
INSERT INTO product_sample_indications VALUES (false, 114, 147);
INSERT INTO product_sample_indications VALUES (false, 116, 147);
INSERT INTO product_sample_indications VALUES (true, 117, 147);
INSERT INTO product_sample_indications VALUES (false, 118, 147);
INSERT INTO product_sample_indications VALUES (false, 119, 147);
INSERT INTO product_sample_indications VALUES (false, 120, 147);
INSERT INTO product_sample_indications VALUES (true, 109, 147);
INSERT INTO product_sample_indications VALUES (true, 145, 148);
INSERT INTO product_sample_indications VALUES (true, 155, 148);
INSERT INTO product_sample_indications VALUES (false, 143, 150);
INSERT INTO product_sample_indications VALUES (false, 78, 150);
INSERT INTO product_sample_indications VALUES (false, 135, 150);
INSERT INTO product_sample_indications VALUES (true, 74, 150);
INSERT INTO product_sample_indications VALUES (true, 137, 150);
INSERT INTO product_sample_indications VALUES (true, 67, 150);
INSERT INTO product_sample_indications VALUES (false, 15, 151);
INSERT INTO product_sample_indications VALUES (true, 16, 151);
INSERT INTO product_sample_indications VALUES (false, 87, 152);
INSERT INTO product_sample_indications VALUES (false, 96, 152);
INSERT INTO product_sample_indications VALUES (false, 119, 152);
INSERT INTO product_sample_indications VALUES (false, 136, 152);
INSERT INTO product_sample_indications VALUES (false, 137, 152);
INSERT INTO product_sample_indications VALUES (false, 87, 153);
INSERT INTO product_sample_indications VALUES (false, 114, 153);
INSERT INTO product_sample_indications VALUES (false, 96, 153);
INSERT INTO product_sample_indications VALUES (false, 118, 153);
INSERT INTO product_sample_indications VALUES (false, 119, 153);
INSERT INTO product_sample_indications VALUES (true, 109, 153);
INSERT INTO product_sample_indications VALUES (true, 54, 154);
INSERT INTO product_sample_indications VALUES (true, 55, 154);
INSERT INTO product_sample_indications VALUES (false, 141, 155);
INSERT INTO product_sample_indications VALUES (false, 113, 155);
INSERT INTO product_sample_indications VALUES (false, 135, 155);
INSERT INTO product_sample_indications VALUES (false, 119, 155);
INSERT INTO product_sample_indications VALUES (true, 136, 155);
INSERT INTO product_sample_indications VALUES (true, 137, 155);
INSERT INTO product_sample_indications VALUES (true, 67, 155);
INSERT INTO product_sample_indications VALUES (false, 16, 156);
INSERT INTO product_sample_indications VALUES (true, 89, 156);
INSERT INTO product_sample_indications VALUES (false, 118, 156);
INSERT INTO product_sample_indications VALUES (false, 75, 156);
INSERT INTO product_sample_indications VALUES (false, 133, 156);
INSERT INTO product_sample_indications VALUES (false, 87, 157);
INSERT INTO product_sample_indications VALUES (false, 141, 157);
INSERT INTO product_sample_indications VALUES (true, 94, 157);
INSERT INTO product_sample_indications VALUES (false, 96, 157);
INSERT INTO product_sample_indications VALUES (false, 119, 157);
INSERT INTO product_sample_indications VALUES (true, 136, 157);
INSERT INTO product_sample_indications VALUES (true, 54, 157);
INSERT INTO product_sample_indications VALUES (false, 67, 157);
INSERT INTO product_sample_indications VALUES (true, 55, 157);
INSERT INTO product_sample_indications VALUES (false, 100, 158);
INSERT INTO product_sample_indications VALUES (false, 103, 158);
INSERT INTO product_sample_indications VALUES (false, 141, 158);
INSERT INTO product_sample_indications VALUES (false, 109, 158);
INSERT INTO product_sample_indications VALUES (false, 150, 197);
INSERT INTO product_sample_indications VALUES (false, 152, 197);
INSERT INTO product_sample_indications VALUES (false, 7, 49);
INSERT INTO product_sample_indications VALUES (false, 11, 49);
INSERT INTO product_sample_indications VALUES (false, 100, 159);
INSERT INTO product_sample_indications VALUES (true, 87, 159);
INSERT INTO product_sample_indications VALUES (false, 141, 159);
INSERT INTO product_sample_indications VALUES (false, 91, 159);
INSERT INTO product_sample_indications VALUES (true, 96, 159);
INSERT INTO product_sample_indications VALUES (false, 99, 159);
INSERT INTO product_sample_indications VALUES (true, 166, 160);
INSERT INTO product_sample_indications VALUES (false, 141, 160);
INSERT INTO product_sample_indications VALUES (false, 168, 160);
INSERT INTO product_sample_indications VALUES (false, 74, 160);
INSERT INTO product_sample_indications VALUES (false, 119, 160);
INSERT INTO product_sample_indications VALUES (true, 99, 160);
INSERT INTO product_sample_indications VALUES (true, 166, 161);
INSERT INTO product_sample_indications VALUES (false, 141, 161);
INSERT INTO product_sample_indications VALUES (true, 168, 161);
INSERT INTO product_sample_indications VALUES (false, 87, 162);
INSERT INTO product_sample_indications VALUES (false, 96, 162);
INSERT INTO product_sample_indications VALUES (true, 98, 162);
INSERT INTO product_sample_indications VALUES (true, 12, 162);
INSERT INTO product_sample_indications VALUES (false, 150, 163);
INSERT INTO product_sample_indications VALUES (true, 152, 163);
INSERT INTO product_sample_indications VALUES (false, 153, 163);
INSERT INTO product_sample_indications VALUES (true, 155, 163);
INSERT INTO product_sample_indications VALUES (true, 15, 164);
INSERT INTO product_sample_indications VALUES (true, 113, 164);
INSERT INTO product_sample_indications VALUES (false, 119, 164);
INSERT INTO product_sample_indications VALUES (false, 18, 164);
INSERT INTO product_sample_indications VALUES (false, 109, 164);
INSERT INTO product_sample_indications VALUES (false, 15, 165);
INSERT INTO product_sample_indications VALUES (false, 16, 165);
INSERT INTO product_sample_indications VALUES (false, 89, 165);
INSERT INTO product_sample_indications VALUES (false, 135, 165);
INSERT INTO product_sample_indications VALUES (false, 119, 165);
INSERT INTO product_sample_indications VALUES (false, 137, 165);
INSERT INTO product_sample_indications VALUES (true, 87, 166);
INSERT INTO product_sample_indications VALUES (false, 126, 166);
INSERT INTO product_sample_indications VALUES (false, 88, 166);
INSERT INTO product_sample_indications VALUES (false, 89, 166);
INSERT INTO product_sample_indications VALUES (true, 91, 166);
INSERT INTO product_sample_indications VALUES (true, 96, 166);
INSERT INTO product_sample_indications VALUES (true, 99, 166);
INSERT INTO product_sample_indications VALUES (false, 141, 168);
INSERT INTO product_sample_indications VALUES (false, 125, 168);
INSERT INTO product_sample_indications VALUES (false, 125, 168);
INSERT INTO product_sample_indications VALUES (false, 126, 168);
INSERT INTO product_sample_indications VALUES (false, 96, 168);
INSERT INTO product_sample_indications VALUES (false, 99, 168);
INSERT INTO product_sample_indications VALUES (true, 166, 62);
INSERT INTO product_sample_indications VALUES (false, 168, 62);
INSERT INTO product_sample_indications VALUES (false, 150, 62);
INSERT INTO product_sample_indications VALUES (false, 59, 63);
INSERT INTO product_sample_indications VALUES (false, 63, 63);
INSERT INTO product_sample_indications VALUES (true, 137, 63);
INSERT INTO product_sample_indications VALUES (false, 66, 63);
INSERT INTO product_sample_indications VALUES (false, 67, 63);
INSERT INTO product_sample_indications VALUES (true, 150, 63);
INSERT INTO product_sample_indications VALUES (true, 120, 64);
INSERT INTO product_sample_indications VALUES (true, 137, 64);
INSERT INTO product_sample_indications VALUES (true, 67, 64);
INSERT INTO product_sample_indications VALUES (true, 87, 65);
INSERT INTO product_sample_indications VALUES (false, 78, 65);
INSERT INTO product_sample_indications VALUES (false, 91, 65);
INSERT INTO product_sample_indications VALUES (false, 44, 65);
INSERT INTO product_sample_indications VALUES (true, 96, 65);
INSERT INTO product_sample_indications VALUES (false, 84, 65);
INSERT INTO product_sample_indications VALUES (true, 151, 66);
INSERT INTO product_sample_indications VALUES (false, 124, 67);
INSERT INTO product_sample_indications VALUES (false, 125, 67);
INSERT INTO product_sample_indications VALUES (true, 126, 67);
INSERT INTO product_sample_indications VALUES (false, 141, 67);
INSERT INTO product_sample_indications VALUES (false, 134, 67);
INSERT INTO product_sample_indications VALUES (true, 106, 68);
INSERT INTO product_sample_indications VALUES (true, 97, 68);
INSERT INTO product_sample_indications VALUES (false, 140, 69);
INSERT INTO product_sample_indications VALUES (false, 141, 69);
INSERT INTO product_sample_indications VALUES (true, 78, 69);
INSERT INTO product_sample_indications VALUES (false, 145, 69);
INSERT INTO product_sample_indications VALUES (true, 137, 69);
INSERT INTO product_sample_indications VALUES (true, 84, 69);
INSERT INTO product_sample_indications VALUES (false, 67, 69);
INSERT INTO product_sample_indications VALUES (false, 155, 69);
INSERT INTO product_sample_indications VALUES (true, 51, 70);
INSERT INTO product_sample_indications VALUES (true, 32, 70);
INSERT INTO product_sample_indications VALUES (true, 92, 70);
INSERT INTO product_sample_indications VALUES (false, 96, 70);
INSERT INTO product_sample_indications VALUES (true, 100, 71);
INSERT INTO product_sample_indications VALUES (true, 87, 71);
INSERT INTO product_sample_indications VALUES (false, 74, 71);
INSERT INTO product_sample_indications VALUES (true, 96, 71);
INSERT INTO product_sample_indications VALUES (false, 18, 71);
INSERT INTO product_sample_indications VALUES (false, 19, 71);
INSERT INTO product_sample_indications VALUES (true, 12, 71);
INSERT INTO product_sample_indications VALUES (false, 49, 72);
INSERT INTO product_sample_indications VALUES (false, 141, 72);
INSERT INTO product_sample_indications VALUES (false, 59, 72);
INSERT INTO product_sample_indications VALUES (true, 37, 72);
INSERT INTO product_sample_indications VALUES (false, 42, 72);
INSERT INTO product_sample_indications VALUES (false, 44, 72);
INSERT INTO product_sample_indications VALUES (false, 47, 72);
INSERT INTO product_sample_indications VALUES (true, 126, 73);
INSERT INTO product_sample_indications VALUES (false, 141, 73);
INSERT INTO product_sample_indications VALUES (false, 88, 73);
INSERT INTO product_sample_indications VALUES (false, 91, 73);
INSERT INTO product_sample_indications VALUES (true, 32, 73);
INSERT INTO product_sample_indications VALUES (true, 92, 73);
INSERT INTO product_sample_indications VALUES (false, 96, 73);
INSERT INTO product_sample_indications VALUES (true, 15, 74);
INSERT INTO product_sample_indications VALUES (false, 104, 74);
INSERT INTO product_sample_indications VALUES (true, 32, 74);
INSERT INTO product_sample_indications VALUES (true, 100, 75);
INSERT INTO product_sample_indications VALUES (true, 87, 75);
INSERT INTO product_sample_indications VALUES (true, 141, 75);
INSERT INTO product_sample_indications VALUES (true, 8, 75);
INSERT INTO product_sample_indications VALUES (true, 96, 75);
INSERT INTO product_sample_indications VALUES (false, 11, 75);
INSERT INTO product_sample_indications VALUES (true, 12, 75);
INSERT INTO product_sample_indications VALUES (false, 99, 75);
INSERT INTO product_sample_indications VALUES (false, 68, 50);
INSERT INTO product_sample_indications VALUES (false, 74, 50);
INSERT INTO product_sample_indications VALUES (false, 57, 50);
INSERT INTO product_sample_indications VALUES (false, 129, 50);
INSERT INTO product_sample_indications VALUES (false, 107, 202);
INSERT INTO product_sample_indications VALUES (false, 98, 212);
INSERT INTO product_sample_indications VALUES (false, 63, 105);
INSERT INTO product_sample_indications VALUES (false, 80, 105);


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: app
--

INSERT INTO products VALUES (1, 'Acne Free', '', 28, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Coix			Yi Yi Ren

Sarsaparilla		Smilax Officinalis

Stillingia			Stillingia Sylvatica

Coptis			Huang Lian

Phellodendron	Huang Bai

Neem			Azadirachta Indica

Prunella			Xiao Ku Cao

Burdock root		Arctium Lappa

Skullcap			Scutellaria Lateriflora

Peony, red		Chi Shao Yao

Meadowsweet	Spiraea Ulmaria

Uva Ursi			Arctostaphylos Uva Ursi

Poke Root		Phytolacca Spp.

Yellow Dock		Rumex Crispus

Licorice			Gan Cao', 'Western Therapeutic Actions

Alterative, depurative, anti-inflammatory, and restorative', 'Traditional Chinese Medicine

Clears damp/heat, relieves toxicity, dissipates nodules, and 

invigorates the blood', 'Sample Indications

Acne, adolescent acne, hormonal acne, acne rosacea and acne associated with auto-toxemia, dermatitis, eczema, seborrhea, 	boils, urticaria, and hives', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

Contraindicated during pregnancy. If the client is spleen qi deficient &leftpar;weak appetite, bloating with tendency towards loose stool&rightpar;, complement this herbal formula with supportive digestive herbs, such as Fennel or Cardamon.', 'Notations 

Acne Free is a blood purifying formula. It is designed to clear heat and toxicity from the liver, lungs, and the blood. In Oriental Medicine, it states that the health of the lungs is revealed through the skin. When the lungs lose their proper function of cleansing and descending the qi, toxic heat builds up in the blood and liver. This can cause skin eruptions, pimples, and acne. After the blood is purified, blood tonics are recommended, especially if there are signs of dryness.

Coix is widely used in Japan for skin suppuration and known for its ability to nourish the skin. Burdock root is a blood purifier and liver detoxicant. Sarsaparilla and Peony help to stimulate the circulation of blood and resolve blood stagnation. Coptis, Phellodendron, and Uva Ursi drain damp/heat from the body and direct the qi downward. Neem, an Ayurvedic herb, is a blood purifier, clears heat, relieves toxicity, and is the herb of choice when dealing with skin problems.  Stillingia, also known as Queens Delight, with Prunella, Poke Root, and Yellow Dock clear heat, relieve toxicity, reduce lymph congestion, soften hard carbuncles, and relieve skin inflammations. Skullcap is a nervine with analgesic and astringent properties. Meadowsweet supports Skullcap and balances the pH of the body. Licorice harmonizes the formula and opens all of the energy channels.

To help clear acne, appropriate dietary, exercise, and cleansing routines are adopted. Include plenty of fresh organic fruit and vegetables in the diet and eliminate fatty, fried foods. Drink clean water instead of soda or fructose sweetened drinks. Eliminate white sugar and put the junk food in the trash.', 'external');
INSERT INTO products VALUES (2, 'Acne Lotion', '', 36, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Benzoin			  Styrax Benzoin

Neem		          Azadirachta Indica

Myrrh		          Commiphora Myrrha

Lithospermum	  Zi Cao

Camphor		  Cinnamonum Camphora

Calendula		  Calendula Officinalis

Cayenne			  Capsicum Annuum

Lemon			  Citrus Limonum

Peppermint Oil	  Mentha Piperita

Tea Tree Oil		  Melaleuca Alternifolia Witch Hazel			

Witch Hazel             Hamamelis Virginiana', 'Western Therapeutic Actions

Stimulant, antiseptic, anti-bacterial, anti-viral, anti-fungal, 

astringent, tonic, refrigerant, and antiscorbutic', 'Traditional Chinese Medicine

Clears surface heat, invigorates the blood, and dispels blood stasis', 'Sample Indications

Oily, adolescent, hormonal, and cystic skin conditions', 'External Application

Apply topically onto the affected area, after it has been thoroughly cleansed, 3 times daily', 'Contraindications and Cautions

There are none known.', 'Notations 

Acne Lotion is a natural cleanser and antiseptic that can support the healing process of many types of skin disorders. Acne can be a persistent and troublesome complaint, and is seldom treated effectively with external formulas alone. The root cause of all skin disorders is internal.

Cleansing herbs are important for acne. Benzoin is an antiseptic and promotes healing of the tissues. Neem is a premier blood purifier and detoxicant. It excels when addressing skin conditions. Myrrh resin, when used externally, has anti-bacterial and anti-fungal actions. When Myrrh resin is used internally, it acts as an anodyne and disperses blood stagnation. Lithospermum clears heat and toxicity, and is especially effective for carbuncles. Camphor resin is an anti-inflammatory, especially effective for the upper body and head region.

It is wise to take a holistic approach, take an overview of the persons lifestyle, and make some appropriate adjustments. Some areas to be considered include: the diet, exercise, stress, and hormones. Each one of these factors may be contributing to the problem. 

Eliminate soda, white sugar, chips, high fructose sugar, and other junk foods from the diet. A diet rich in fresh organic fruits and vegetables is beneficial for cleansing the blood. Filtered drinking water helps to flush toxins from the body. Drink enough water to keep your urine a mellow yellow. Put a de-chlorinator on your shower head. Use oatmeal bar soaps for washing the skin. Use unscented laundry soaps and avoid using bleach. Avoid harsh chemicals for cleaning the house or in your immediate environment. Some people are highly allergic to synthetic clothing. Consider switching to 100% cotton clothing instead of synthetics.', 'external');
INSERT INTO products VALUES (3, 'Calendula Cream', 'Rough, Dry Skin', 15, 'Ingredients &leftpar;Herbal extracts&rightpar;

Calendula	Calendula Officinalis

Beeswax

Olive oil', 'Western Therapeutic Actions

Vulnerary, emollient, anti-inflammatory, antipruritic, and 

anti-fungal', 'Traditional Chinese Medicine

Clears surface heat and cools the blood', 'Sample Indications

Irritated skin, chapped skin, diaper rash, dermatitis, fungus, 

and other inflammatory conditions of the skin', 'External Application

Apply topically onto the affected area, after it has been thoroughly cleansed, 3 times daily', 'Contraindications and Cautions

There are none known.', 'Notations 

The rich amount of flavonoids and saponins found in the Calendula flowers makes it a good anti-inflammatory and anti-fungal agent. Because it promotes rapid healing of the skin tissues, the affected areas should be kept clean and free of infection. Calendula is often effective in evening out the skin tones, and has been known to help fade dark blemishes.', 'external');
INSERT INTO products VALUES (4, 'Eat Less', 'Appetite Reduction', 29, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Bladderwrack		Fucus Vesiculosus

Chickweed			Stellaria Media

Garcinia				Garcinia Cambogia

Pseudostellaria		Tai Zi Shen

Wild Yam			Dioscorea Villosa

Dendrobium			Shi Hu 

Anemarrhena		Zhi Mu

Ophiopogon			Mai Men Dong

Scrophularia			Xuan Shen

Licorice				Gan Cao

Golden Rod			Solidago Virgaurea', 'Western Therapeutic Actions

Alterative, anti-fat, demulcent, antispasmodic, and stimulant', 'Traditional Chinese Medicine

Drains stomach fire, nourishes the yin, generates fluids, and supports the spleen', 'Sample Indications

Excessive appetite, hungers easily, bulimia nervosa, and overeating due to emotional stress', 'Suggested Dosage

5 - 20 drops, in a small amount of water, 

3 times daily

Take this dosage 1 hour before meals 

Variation is according to individual symptoms', 'Contraindications and Cautions

Use with caution in hyperthyroid conditions. Contraindicated for spleen qi deficiency and internal cold patterns. Contraindicated during pregnancy and while nursing.', 'Notations 

Excessive appetite can be affected by a number of things. Diabetes could be the cause. Many patients turn to food when emotionally upset. Food becomes the temporary healing salve, as in obesity; or the imagined problem, as in anorexia; until the emotion passes. Once this habit becomes chronic, a serious eating disorder can develop. 

Eat Less, combines Western herb specifics with a Chinese formula, Bai Hu Tang or Gypsum Combination, which is designed to correct the imbalances of the stomach. Excessive appetite can be linked to the excess heat in the stomach. The excess heat parches the stomach and it becomes dry. This can be a link to diabetes or low blood sugar. Eat Less drains the fire and brings moisture back to the stomach.

Anemarrhena and Scrophularia help to quell the fire by draining the excess heat and generate fluids. Chickweed, Dendrobium, and Ophiopogon nourish the yin &leftpar;fluids&rightpar; of the stomach, normalizing the excess appetite. Garcinia, a fruit from India, is an antacid, anti-ulcerogenic, and helps to stabilize the glucose levels. Pseudostellaria and Licorice generate fluids and support the qi of the spleen. Licorice also helps to harmonize the actions of the other herbs in the formula. Wild Yam is a hepatic and antispasmodic. Bladderwrack nourishes the thyroid gland which controls the body metabolism. It is considered a metabolic stimulant and helps to reduce fat. Goldenrod is a hepatic and supports digestion.

Complex carbohydrates &leftpar;whole grains&rightpar;, organic vegetables, fruits, nuts and seeds can be eaten in abundance without gaining weight. Reduce calories by eliminating refined sugars &leftpar;found in almost all processed foods, canned sodas, and juices&rightpar;. Drink plenty of clean water. Keep the urine a soft yellow.', 'external');
INSERT INTO products VALUES (5, 'Derma Cream', 'Itchy,Dry,Flaky Skin', 15, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Neem				 Azadirachta Indica Lithospermum		

Lithospermum               Zi Cao

Tang Kuei			 Dang Gui

Phellodendron		 Huang Bai

Aloe Vera			 Lu Hui

Marshmallow			 Althea Officinalis

Slippery Elm			 Ulmus Fulva

Cnidium seed		 Che Chuang Zi

Calendula			 Calendula Officinalis

Nettles				 Urtica Spp.

Chaparral			 Larrea Mexicana

Rhubarb				 Da Huang

Beeswax

Olive Oil', 'Western Therapeutic Actions

Vulnerary, anti-inflammatory, antipruritic, demulcent, emollient, alterative, and depurative', 'Traditional Chinese Medicine

Clears heat, nourishes and vitalizes the blood, and moistens dryness

ü', 'Sample Indications

Eczema, psoriasis, dermatitis, diaper rash, heat rash, trichomoniasis, and jock itch', 'External Application

Apply topically to the affected area, after it has been thoroughly cleansed, 3 times daily

ü', 'Contraindications and Cautions

There are none known.', 'Notations 

The skin expresses the quality and purity of the blood, and the health of the lungs. In Oriental Medicine, the skin is the lungs turned inside out. External applications, alone, seldom clear chronic skin conditions. Use an internal herbal formula, such as Exema Clear or Psor Skin, to address the internal imbalances and enhance the healing potential. 

Neem is a classic Ayurvedic vulnerary and blood purifier. This herb could be used alone in healing a wide variety of skin ailments. Lithospermum cools the blood and helps to vent rashes, especially when the skin is turning dark red or purple. Tang Kuei is a premier blood tonic and is used for many skin conditions. Nettles supports Tang Kuei, as it is also a blood tonic. Aloe Vera drains fire and assists in the healing of the skin tissues. Marshmallow root, Slippery Elm and Calendula are anti-inflammatory and relieve irritated skin tissue. Cnidium seed helps to relieve the itching, and Chaparral, Phellodendron and Rhubarb drain damp/heat and assist in drying wet skin rashes.', 'external');
INSERT INTO products VALUES (6, 'Down Size', 'Weight Loss', 28, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Bladderwrack	Fucus Vesiculosus

Garcinia		        Garcinia Cambogia

Eclipta			Han Lian Cao

Myrrh			Commiphora Molmol

Burdock root		Arctium Lappa

Cyperus			Xiang Fu

Magnolia bark	Hou Po

Hoelen			Fu Ling

Turmeric		Curcuma Longa

Corn Silk		Yu Mi Xu

Boldo			Peumus Boldus

Crataegus		Shan Zha

Poke Root		Phytolacca Spp.

Chih-Ko			Zhi Ke

Cayenne			Capsicum Annuum', 'Western Therapeutic Actions

Alterative, diuretic, hepatic, digestive stimulant, carminative, deobstruent, and anti-fat', 'Traditional Chinese Medicine

Supplements and promotes the movement of qi, nourishes the liver, drains and resolves dampness, and reduces food stagnation', 'Sample Indications

Overweight and obesity with slow metabolism', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

Contraindicated during pregnancy and hyperthyroid conditions.', 'Notations 

Every year there is a new diet regime that is going to solve the obesity problem in America. Dieting has becoming the modern day neurosis. Slim is in , fat free, marketing madness, anorexic models, fat...fat...fat, saturated fats, trans fats, meat fat, carbs are out, protein is in, fake foods, fake fat, fake butter loaded with chemicals, mommys fat, daddys fat, babies fat, fat is the obsession, obesity is the problem. 

Lets look at the causes: Lack of exercise, sedentary lifestyles &leftpar;no more chopping wood or carrying water&rightpar;, eating empty foods &leftpar;highly processed, high in calories, high in chemicals and additives, with no nutritional value&rightpar;. These empty calories do not feed the body, and the body will demand, Feed me more, I am starving, feed me more! The stomach is full, yet the body is starving for nutrition, still hungry! 

How is it that our children came to hate the taste of vegetables? 

Try a diet of fast food from McDonalds and see what happens to your own taste buds and body. Watch your cholesterol soar and exhaustion set in. Dietary adjustments may be in order. There is no quick fix to obesity, but requires a disciplined readjustment towards food and eating habits. Cook wholesome, organic, fresh meals and rekindle those taste buds! Throw out those bags of chips and chew on a carrot. Park the car and start walking. Turn the TV off, light a candle, and eat as a family, sharing the days journey. Begin thinking in terms of wellness, gratitude, and a rich life instead of a rich diet full of refined sugars, preservatives, and saturated fats. 

Down Size helps to resolve the excess fat, remove the excess water, purify the blood, and eliminate the excess bulk from the overloaded digestive system. The rest is up to you; make healthy choices, eat for wellness, and treat the body as a sacred temple that houses the soul!', 'external');
INSERT INTO products VALUES (7, 'Exema Clear', 'Excema', 28, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Smilax			Tu Fu Ling

Neem			Azadirachta Indica

Burdock root		Arctium Lappa

Coptis			Huang Lian

Sophora			Ku Shen

Oats			Avena Sativa

Tang Kuei		Dang Gui

Phellodendron	Huang Bai

Mistletoe		Viscum Album

Meadowsweet	Filipendula Ulmaria

Cicada			Chan Tui

Sarsaparilla		Smilax Officinalis

Oregon Grape	Berberis Aquafolium

Uva Ursi			Arctostaphylos Uva Ursi

Wahoo			Euonymus Atropurpureus

Licorice			Gan Cao', 'Western Therapeutic Actions

Nutritive, detoxicant, anti-inflammatory, nerve tonic, alterative, antacid, hepatic, and diuretic', 'Traditional Chinese Medicine

Disperses wind, eliminates dampness, clears heat, cools and nourishes the blood', 'Sample Indications

Eczema, contact dermatitis, skin rashes, and weepy, red, itchy skin aggravated by hot weather', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

Consumption of coffee, alcohol, spicy foods, seafood, and smoking should be avoided. Nourish the blood and supplement the qi if the patient is depleted.', 'Notations 

Exema Clear combines the energetic patterns and herbs used in the Western classics with a Chinese formula, Xiao Feng San, or Eliminate Wind Powder, for healing this aggravating and generational disorder &leftpar;passed down through the family tree&rightpar;. 

Stress is a key factor in skin flare-ups. If the emotions run the patients life, healing the skin can be difficult. Creating a healthier relationship with the self is essential as there might be a hidden battle being fought. The question is, Who is going to surrender, you or the disorder? 

Wind, as it travels through the blood, spreads the pre-existing toxins, and can be one of the issues surrounding chronic skin ailments. The skin eruptions and itchiness are the result of the toxic wind trying to escape from the body. In Oriental Medicine, stagnant qi creates heat and injures or depletes the blood. With the blood weakening, the skin condition and temperament become even more aggravated. 

With this scenario, Oriental Medicine states, To treat the wind, first treat the blood; when the blood moves, the wind is naturally extinguished. 

Whenever serious skin conditions exist, treat them with internal herbal formulas and with an external herbal cream. Dietary habits are extremely beneficial. Organic, big leafy green vegetables eaten daily with plenty of pure water cleanses the liver and blood. Allergies often accompany these types of skin conditions. Identify allergens through a process of elimination.', 'external');
INSERT INTO products VALUES (8, 'Fungal Lotion', 'Skin And Nail Fungus', 1, 'Ingredients &leftpar;Herbal Extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Myrrh			Commiphora Myrrha

Black Walnut		Juglans Nigra

Thuja			Thuja Occidentalis

Cnidium seed		Che Chuang Zi

Harakeke		        Phormium Tenax

Benzoin			Styrax Benzoin

Gypsum		        Shi Gao

Talc			        Hua Shi

Wild Indigo		Qing Dai

Phellodendron		Huang Bai', 'Western Therapeutic Actions

Anti-fungal, antiseptic, anti-viral, anti-bacterial, alterative, depurative, and balsamic', 'Traditional Chinese Medicine

Dries dampness, clears heat, and alleviates itching', 'Sample Indications

Fungal infections &leftpar;toenail and fingernail&rightpar;, skin fungus, jock rot, ringworm, and athlete''s foot', 'External Application

Apply to the affected area after it has been thoroughly cleansed, 3 times daily', 'Contraindications and Cautions

There are none known.', 'Notations 

Fungal problems may be systemic and dietary changes may be appropriate. Sugars, including fruit sugars, must be eliminated from the diet until all signs of fungus are gone. Jocks and Jockeys will love us for this one! No more itch!!! 

Myrrh and Thuja contain anti-fungal properties. Walnut is an astringent and resolves damp/heat conditions of the skin. Cnidium seed relieves itching. Harakeke, a herb from New Zealand, is used much the same way Aloe Vera is. It is especially healing for all skin conditions. Benzoin is an antiseptic and helps to clear irritable conditions of the skin. Gypsum, Talc, and Wild Indigo help to clear the heat from the skin tissues. Phellodendron drains damp/heat and has drying properties.', 'external');
INSERT INTO products VALUES (9, 'Hair Lotion', 'Hair And Scalp', 27, 'Ingredients &leftpar;Herbal Extracts&rightpar;

Listed by common and pin yin or latin names, in sequence from largest to smallest amount by quantity.

Burdock root		Arctium Lappa

Nettles			Urtica Spp. 

Chamomile, German	Matricaria Recutita

Rosemary		        Rosmarinus Officinalis

Southernwood		Artemisia Abrotanum

Drynaria		        Gu Sui Bu

Psoralea		        Bu Gu Zhi

Borax			Boron

Lemon			Citrus Limonum

Camphor		        Cinnamonum Camphora', 'Western Therapeutic Actions

Alterative, depurative, nutritive, astringent, tonic, and antiscorbutic', 'Traditional Chinese Medicine

Stimulates the growth of hair, nourishes the kidneys, and clears toxins', 'Sample Indications

Alopecia &leftpar;hair loss and thinning&rightpar;, dandruff, and scaly scalp', 'External Application

Gently, massage a small amount into the scalp 2 times daily. A good time to apply the Hair Lotion is after washing the hair. Do not rinse out this lotion until the hair is washed again the next time.', 'Contraindications and Cautions

There are none known.', 'Notations

Hair thinning is considered a depletion of the energy within the liver and kidney. When using this topical lotion, combine it with either Top Crop, Kidney/Long Life, or Liver/New Life. For scalp problems, the blood needs to be cleaned. Use one of the herbal remedies from the Cleansing section.', 'external');
INSERT INTO products VALUES (10, 'Psor Skin', 'Psoriasis', 28, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Rehmannia, raw	    Sheng Di Huang

Coix			    Yi Yi Ren

Neem		            Azadirachta Indica

Mistletoe		    Viscum Album

Imperata		    Bai Mao Gen

Burdock root		    Arctium Lappa

Tang Kuei	            Dang Gui

Coptis			    Huang Lian

Schizonepeta		    Jing Jie

Lonicera			    Jin Yin Hua

Peony, red		   Chi Shao Yao 

Oregon Grape	   Berberis Aquafolium

Couchgrass		   Agropyron Repens

Sarsaparilla		   Smilax Officinalis

Barberry			   Berberis Vulgaris

Cardamon		   Sha Ren', 'Western Therapeutic Actions

Dermatic, nervine, alterative, depurative, hepatic, and diuretic', 'Traditional Chinese Medicine

Clears heat, expels wind, drains dampness, and invigorates the blood', 'Sample Indications

Psoriasis &leftpar;weepy and dry&rightpar;, eczema, contact dermatitis, urticaria, skin rashes, and flaky, inflamed, itchy skin', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 

3 times daily

Variation is according to individual symptoms

External Application

Dilute 1/2 teaspoon of Psor Skin with 4 teaspoons of water. Apply topically on affected areas with sterile cotton gauze, 2 times daily', 'Contraindications and Cautions

Consumption of coffee, alcohol, spicy foods, seafood, and smoking should be avoided while healing this disorder. Supplement the blood and qi if the patient is depleted.', 'Notations

Psor Skin is a modified version of Xiao Feng San or Tang Kuei and Arctium Formula and Shi Wei Bai Du Tang or Bupleurum and Schizonepeta Combination combined with tim proven Western herbs for this disorder.

Rehmannia clears heat and cools the blood. It also nourishes the yin and generates fluids. Rehmannia would be considered a demulcent in Western terms because of its ability to generate fluids. Couchgrass supports Rehmannia and is a diuretic. Coix, used commonly in Japan for skin conditions, clears heat and expels pus from the inflamed skin. Neem is a vulnerary and blood purifier. Burdock root supports Neem. Mistletoe is a detoxicant, relieves skin inflammations, and a nervine relaxant. Imperata cools the blood and clears heat from the lungs. The lungs and the condition of the skin are related. Chronic cigarette smokers have very dry, wrinkly facial skin due to the excess heat and dryness of the lungs. Tang Kuei is a premier blood tonic. Coptis drains fire and relieves toxicity. Schizonepeta alleviates itching. Lonicera disperses wind/heat. Peony vitalizes the blood. Oregon Grape is used for inflamed, flaky skin disorders. Sarsaparilla is an alterative and depurative. Barberry relieves liver congestion. Cardamon is a digestive aromatic.

The quality of the blood can cause this type of skin disorder and takes patience and perseverance to heal. All foods affect the condition and health of the blood. Large, green, leafy vegetables are excellent blood purifiers and blood builders. Blue green algae is an excellent source for improvement of the quality of the blood. For psoriasis, not only does the blood require cleansing, it requires renewal Blood, being the mother of qi, is feminine. To help heal this disorder, consider the emotional issues surrounding the feminine side; past, present, and future. Explore the possibilities of a link that might need healing.ü', 'external');
INSERT INTO products VALUES (11, 'Skin Clear', 'Skin Cleansing', 29, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Neem				Azadirachta Indica

Lonicera				Jin Yin Hua

Burdock seed		Niu Bang Zi

Phellodendron		Huang Bai

Coptis				Huang Lian

Violet				Zi Hua Di Ding

Prunella				Xiao Ku Cao

Yellow Dock			Rumex Crispus

Salvia				Dan Shen

Stillingia				Stillingia Sylvatica

Sarsaparilla			Smilax Officinalis

Oregon Grape		Berberis Aquafolium

Mistletoe			Viscum Album', 'Western Therapeutic Actions

Alterative, depurative, detoxicant, dermatic, cholagogue, antiseptic, and nervine', 'Traditional Chinese Medicine

Clears damp/heat, relieves toxicity, cools the blood, and reduces swelling', 'Sample Indications

All types of boils, sores, and carbuncles with localized erythema, accompanied with swelling, pain, and heat', 'Suggested Dosage

10 - 20 drops, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

Use with caution in cases of cold from deficiency.', 'Notations

Skin Clear is an excellent formula for clearing toxicity from the body. In Oriental Medicine boils and carbuncles can arise from an internal system that has become excessively toxic; from an external influence which causes a warm febrile disease; or from an accumulation of toxins in the internal organs. Internal toxicity can also be caused by poor dietary habits or unsanitary conditions. Whatever the cause, the accumulation of toxicity creates excess heat, which produces stagnation of the blood and qi. This is a bad combination because heat causes stagnation and stagnation causes heat. As these two factors feed each other in a vicious circle, the accumulated toxicity can surface and erupt on the skin. Skin inflammations are the bodies natural purification mechanism as it is expelling the toxicity.

Skin Clear is a blend of time proven Western herbs and modified version of a Chinese formula called Wu Wei Xiao Du Yin or Clear Heat, Resolve Toxin Compound. One of the lead herbs, Lonicera, is commonly used in Oriental Medicine for clearing heat from the blood and qi, and for relieving fire toxicity. It is used extensively in treating the early stages of warm febrile diseases &leftpar;colds / flu&rightpar;, sores and abscesses, dysentery, and painful urinary dysfunction. 

Neem is a blood purifier and vulnerary. Burdock seed is usually preferred to Burdock root when there is a skin disorder. Burdock seed is a blood purifier and disperses wind/heat. Phellodendron, Coptis and Violet drain fire and relieve toxicity. Prunella clears heat and dissipates nodules &leftpar;carbuncles&rightpar;. Yellow Dock and Stillingia are alteratives and stimulate the bowels for additional cleansing. Salvia vitalizes the blood. Sarsaparilla is an alterative is usually combined with other blood purifiers such as Burdock. Oregon Grape is a hepatic and alterative. Mistletoe is a detoxicant, softens carbuncles and draws out pus, and calms the nerves.', 'external');
INSERT INTO products VALUES (12, 'Skin Shine', 'Beatiful Skin', 28, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Burdock root			Arctium Lappa

Coix				Yi Yi Ren

Meadowsweet		Filipendula Ulmaria

Neem				Azadirachta Indica

Ho Shou Wu			He Shou Wu

Cornus				Shan Zhu Yu

Sesame seed			Hei Zi Ma

Tang Kuei			Dang Gui

Peony, red			Chi Shao Yao 

Mistletoe			Viscum Album

Sarsaparilla			Smilax Officinalis

Glehnia				Sha Shen

Angelica dah.		Bai Zhi

Couchgrass			Agropyron Repens', 'Western Therapeutic Actions

Nutritive, alterative, depurative, antacid, nervine, diuretic, demulcent, and anti-inflammatory', 'Traditional Chinese Medicine

Nourishes the blood and yin, releases the exterior, and cools the blood', 'Sample Indications

Dry skin, aging skin, sallow complexion, blemishes, wrinkles, and clogged skin pores', 'Suggested Dosage 1/2 - 1 teaspoon, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

Contraindicated during pregnancy.', 'Notations

Skin Shine is designed to bring luster back to the skin by using a combination of traditional methods; cleansing the blood of impurities, balancing the pH of the body, nourishing the blood and yin &leftpar;water&rightpar;, and moistening the lungs. The vitality of the skin is directly related to the lungs. The skin, being in direct contact with the air, can be thought of the lungs turned inside out. Many smokers have dry wrinkly skin. This reveals the dryness of the lungs due to the heat from smoke inhalation. 

Coix has been used extensively in Japan for maintaining lustrous skin and is supported by Couchgrass. Its antiseptic qualities help to keep the skin blemish free. Meadowsweet helps to balance the pH of the blood. Neem is a blood purifier and used specifically for maintaining healthy skin conditions. Ho Shou Wu, Cornus, and Tang Kuei help to eliminate dry skin by nourishing and moistening the blood. Sesame seed nourishes and fortifies the liver and kidneys. Its oils moisten the skin. Peony stimulates the circulation of the blood and helps to break up any toxic stagnation. Mistletoe is a detoxicant, relieves skin inflammations, and calms the nerves. Sarsaparilla is an alterative and depurative. Glehnia moistens the lungs which brings moisture to the skin. Angelica, dah. &leftpar;Bai Zhi&rightpar; maintains clean skin pores by releasing the exterior. 

Maintaining healthy skin includes a healthy diet rich in organic vegetables, fruits, nuts, seeds, sea weeds, and fish. The Scandinavian people have some of most beautiful skin in the world. This is attributed to not only a diet rich in seafood and clean, cold arctic air, but to their bathhouses. A sauna provides heat and steam to open and clean the pores from toxins; and the cold rinse afterwards, tightens the skin pores backup. Regularly, using the opposing energies of hot steam and cold rinses helps to maintain the firmness and elasticity of the skin which is essential for the prevention of wrinkles and sagging skin.', 'external');
INSERT INTO products VALUES (13, 'Taggy Wart Lotion', 'Warts, Tags', 21, 'Ingredients &leftpar;Herbal Extracts&rightpar;

Listed by common and pin yin or latin names, in sequence from largest to smallest amount by quantity.

Thuja			Thuja Occidentalis

Pulsatilla	         	Bai Tou Weng

Sassafras	         	Sassafras Albidum

Coix		         	Yi Yi Ren

Artemesia	         	Ai Ye

Brucea fruit		Ya Dan Zi

Drynaria     		Gu Sui Bu

Bloodroot	         	Sanguinaria Canadensis

Harakeke  		Phormium Tenax', 'Western Therapeutic Actions

Alterative, depurative, antiseptic, anti-viral, and anti-bacterial', 'Traditional Chinese Medicine

Clears heat and toxicity', 'Sample Indications

Warts, taggy wart, corns, and papillomas', 'External Application

Cleanse the area thoroughly before applying this lotion. After cleansing the area, apply lotion to the affected area, 3 times daily', 'Contraindications and Cautions

There are none known.', 'Notations

Taggy Wart Lotion has been very effective in many situations. Cleansing the liver assists in the ridding of these stubborn, irritating, and ugly little creatures. In the spring time, picking the dandelion stems and sqeezing the white milk onto warts is also very effective.', 'external');
INSERT INTO products VALUES (14, 'Top Crop', 'Hair Growth', 28, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Eclipta			Han Lian Cao

Ho Shou Wu		He Shou Wu

Drynaria		        Gu Sui Bu

Neem			Azadirachta Indica

Cnidium			Chuan Xiong

Burdock root		Arctium Lappa

Nettles			Urtica Spp.

Gotu Kola		Hydrocotyle Asiatica

Psoralea			Bu Gu Zhi

Jaborandi		Pilocarpus Spp.

Sophora			Ku Shen

Poke Root		Phytolacca Spp.

Wahoo			Euonymus Atropurpureus', 'Western Therapeutic Actions

Restorative, nutritive, alterative, depurative, and hepatic', 'Traditional Chinese Medicine

Nourishes the blood, enriches the yin, benefits the essence, and clears heat', 'Sample Indications

Premature greying of hair, hair thinning and loss, balding, alopecia, dandruff, and itchy scalp', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

There are none known.', 'Notations

Top Crop falls into the Oriental Medicine categories of blood, yin, and yang tonics. Eclipta is a premier liver tonic and nourishes the liver and kidney. Ho Shou Wu strengthens the liver and kidney, nourishes the blood and augments the essence. Nettles nourishes the liver blood. Kidney/liver tonics in Chinese medicine, are considered the source of nourishment for the entire body. When the body is well nourished, the hair will flourish! When the hair grays prematurely or begins to fall out, then it is believed that the functioning of the liver and kidneys have diminished. Drynaria, a kidney yang tonic, stimulates the growth of hair. Psoralea supports Drynaria as it is a kidney yang tonic and stabilizes the essence. Neem and Burdock root are blood purifiers and help to resolve problematic scalp conditions. Cnidium leads the herbs upward and promotes circulation. Burdock root is the premier blood purifier. Gotu Kola is a restorative and stimulates circulation in the head, and nourishes the brain. Jaborandi and Poke root are stimulants and deobstruent. Sophora clears heat, dries dampness, alleviates itching, and heals skin disorders. Wahoo is a cholagogue and alterative.

In many traditional healing practices, herbal tonics are not enough to counteract this type of deficiency or depleted life force. Exercise, breathing, diet, and a spiritual renewal have to be included in the rebuilding process. 

Consider a commitment to a one year herbal healing program to help restore and rejuvenate each organ in the body. Consuming an herbal organ system tonic during the season the energy flows through it creates the greatest healing possibilities. In other words; in winter, nourish the kidneys; in spring, nourish the liver; in summer, nourish the heart, in late summer, nourish the spleen; and in fall, nourish the lungs. Using an herbal restorative tonic suitable for that season will provide a wealth of benefits down the road. This is an excellent approach in practicing preventative medicine.', 'external');
INSERT INTO products VALUES (15, 'Blue Limbs', 'Poor Circulation', 28, 'Ingredients  &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Bayberry		        Myrica Cerifera

Tang Kuei              Dang Gui

Holy Thistle		Cnicus Benedictus

Cinnamon twig	Gui Zhi

Peony			Bai Shao Yao

Dipsacus		Xu Duan

Ginseng, Chinese	 Ji Lin Ren Shen

Yarrow			Achillea Millefolium

Prickly Ash		Zanthoxylum Americanum

Cnidium			Chuan Xiong

Sarsaparilla		Smilax Officinalis

Ginger, dried		Gan Jiang

Licorice, baked	Zhi Gan Cao

Cayenne			Capsicum Annuum', 'Western Therapeutic Actions

Circulatory stimulant, tonic, alterative, diaphoretic, and cardiac tonic', 'Traditional Chinese Medicine

Warms the channels, disperses cold, nourishes the blood, and vitalizes the blood', 'Sample Indications

Poor circulation, discoloration and coldness of the extremities &leftpar;cold hands and feet&rightpar;, Reynaud''s disease, fibromyalgia, sciatica, varicose veins, chilblains, frostbite, and atherosclerosis', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 

3 times daily

Variation is according to individual symptoms

ü', 'Contraindications and Cautions

Contraindicated in patients with fire from yin deficiency &leftpar;heat in the feet and palms, afternoon fever, night sweats, thirst&rightpar;. Use with caution during the hot summer months or in warm climates as this formula can injure the fluids.', 'Notations 

Blue Limbs follows the pattern of Dang Gui Si Ni Tang or Tang Kuei and Jujube Combination, which addresses the imbalance of internal cold with deficiency and stagnation. Patients with this condition are usually suffering because cold has entered the energy channels due to an underlying blood deficiency. When the blood is full and rich, it is difficult for the cold and also the wind to enter the body and channels. 

In Oriental Medicine, a pale tongue is indicative of blood deficiency and a thin white coating reveals the interior cold. The pulse for this type of condition is very thin or frail, almost imperceptible, which confirms the blood deficiency and cold. 

Blue Limbs is very effective when the patient has suffered from long term cold hands and feet. If the entire limbs are cold, not just the hands and feet, supplement this formula with a kidney yang formula, such as Fortify Will or Kidney Long Life. 

The addition of Ginger, Cayenne Pepper and Cinnamon to the diet benefits these complaints. Adding some Cayenne into the shoes help to keep the feet warm. 

Living in a warmer environment, daily exercise and saunas help to increase the circulation. Nightly foot soaks with sea salt or Epsom salts enhance the circulation and support the elimination of toxicity. Massage the feet with olive oil after the foot soak and put on a clean pair of cotton socks before going to bed.', 'external');
INSERT INTO products VALUES (16, 'BP Down', '', 28, 'Ingredients  &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Eucommia		Du Zhong

Salvia			Dan Shen

Scute			Huang Qin

Red Clover		Trifolium Pratense

Anemarrhena	Zhi Mu

Haliotis			Shi Jue Ming

Gastrodia		Tian Ma

Rehmannia, prep.	Shu Di Huang

Yarrow			Achillea Millefolium

Hawthorn berry	Crataegus Spp. 

Achyranthes		Niu Xi

Prunella			Xiao Ku Cao

Mistletoe		Viscum Album

Lime Flower		Tilia Europea

Chamomile, Roman Anthemis Nobilis

Uva Ursi			Arctostaphylos Uva Ursi', 'Western Therapeutic Actions

Nervine, alterative, general and cardiovascular tonic, diuretic, and antispasmodic', 'Traditional Chinese Medicine

Calms the liver, extinguishes wind, nourishes the kidney, clears liver heat, causes yang to descend, and nourishes the heart', 'Sample Indications

Vascular hypertension &leftpar;high blood pressure that lowers itself in a calm setting&rightpar;, renal hypertension, headache, dizziness, vertigo, irritability, and muscular tension', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

Contraindicated during pregnancy. Alcohol, caffeine, red meat, and stimulants should be eliminated from the diet. Be sure to have high blood pressure monitored by a qualified physician.', 'Notations

BP Down follows the herbal patterns of Jiang Ya Wan or Decrease Pressure Pills and Tian Ma Gou Teng Yin or Gastrodia & Gambir Combination, two Chinese formulas used for alleviating tension in the muscles, relieving headaches, and essential hypertension. 

BP Down addresses the ascending liver yang which disturbs the upper part of the body and the heart. In Oriental Medicine, when an excess amount of qi and heat ascend from the liver, this can cause a rise in the blood pressure, dizziness, headaches, or disturbed sleeping patterns. This type of imbalance is usually accompanied by a red tongue and wiry pulse. 

Eucommia strengthens the kidneys and the liver which allows the kidney to anchor the yang. This is similar to the concept of fortifying the root of a tree to stabilize it. Salvia stimulates the flow of blood, cools the blood, and is calming. Prunella, Gastrodia, and Scute calm the liver, drain the excess heat, and extinguish the wind. The Western herbs, Yarrow and Mistletoe &leftpar;European&rightpar; support these Chinese herbs in patterns of liver yang rising. Red Clover clears heat and calms the spirit. Lime Flower, Hawthorn berry, and Chamomile are relaxants. Achyranthes directs the blood downward. 

High blood pressure is a warning sign; the internal geography of the body is talking. Listen. What is it saying? Is a lifestyle change in order? Burning the candle on both ends?. Too much stress? Meditation, yoga, cultivating life enhancing habits, and "thinking the blood pressure down" are allies.', 'external');
INSERT INTO products VALUES (17, 'Big Belly', 'Meniere''s, Tinnitus', 28, 'Ingredients &leftpar;Herbal Extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Raspberry leaf	Rubus Idaeus

Oats			Avena Sativa

Peony			Bai Shao Yao

Hoelen			Fu Ling

Atractylodes		Bai Zhu

Alisma			Ze Xie

Tang Kuei		Dang Gui

Cnidium		        Chuan Xiong

Blue Cohosh		Caulophyllum Thalictroides

Squaw Vine		Mitchella Repens

Gentian			Gentiana Lutea

Cramp Bark		Viburnum Opulus

Wild Yam		Dioscorea Villosa', 'Western Therapeutic Actions

General uterine and nerve tonic, antispasmodic, parturient, and astringent', 'Traditional Chinese Medicine

Warms the abdomen, supports the spleen, nourishes the liver blood, disperses stagnant liver qi, and resolves dampness', 'Sample Indications

Fatigue, anemia, abdominal pain or cramping that is continuous but not severe, urinary difficulty, numbness in the lower body, and slight edema', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 

3 times daily. Take during the LAST MONTH of pregnancy

Variation is according to individual symptoms', 'Contraindications and Cautions

If any health problem persists, seek the advice of a qualified health care practitioner.', 'Notations 

Big Belly is made upon request to limit alcohol content. Additional herbs can be requested if labor is delayed or overdue. Big Belly combines herbs from the West with the Chinese formula, Tang Kuei and Peony Formula or Dang Gui Shao Yao San, to provide support during the last part of the pregnancy. Generally, herbs are not used during pregnancy. Tang Kuei and Peony Formula has traditionally been used to treat threatened miscarriages. However, it is commonly used in China and Japan as a daily preventative during pregnancy.

During pregnancy, the mother should eat high quality foods &leftpar;organic&rightpar;, avoid alcohol, processed sugar and caffeine. Over-consumption of rich foods and raw, cold foods can make labor more difficult as they deplete the spleen qi, cause dampness, and impede the movement of blood and qi. 

The fetus or unborn baby can feel all of the different emotions of the mother and the energies surrounding her. The mother and her baby should be protected and kept away from people who are angry or expressing other volatile negative emotions. Happy moms bring happy babies into this world.

Shiatsu, acupuncture, yoga, breathing exercises, and meditation are excellent natural ways to maintain optimal health during pregnancy and in preparation for labor. Women who have used warm water baths for labor or birth have given some positive feed back. Warm water baths help the body relax and alleviate some of the pain.', 'external');
INSERT INTO products VALUES (18, 'Prep P Relief', 'Hemmorhoid (Internal)', 28, 'Ingredients &leftpar;Herbal Extracts & Homeopathics&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Tang Kuei		Dang Gui

Bupleurum		Chai Hu

Scute			Huang Qin

Shave Grass		Mu Zei

Cimicifuga		Sheng Ma

Sanguisorba		Di Yu

Plantain			Plantago Spp.

Pilewort			Ranunculus Ficaria 

Stone Root		Collinsonia Canadensis

Witch Hazel		Hamamelis Virginiana

Rhubarb			Da Huang

Cascara Sagrada	Rhamnus Purshiana

Homeopathics

Horse Chestnut	     Aesculus Hippocastanum

Bryonia			     Bryonia Dioica', 'Western Therapeutic Actions 

Astringent, anti-inflammatory, analgesic, antipruritic, venous and capillary tonic, alterative, and specific', 'Traditional Chinese Medicine

Raises and lifts the yang, clears heat, and stops bleeding', 'Sample Indications

Hemorrhoids &leftpar;piles&rightpar;, constipation with bleeding, severe local pain, varicose veins, phlebitis, thrombosis, and thrombophlebitis', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

There are none known.', 'Notations

A Japanese doctor, Hara Nanyou, from the Tokugawa era, developed a hemorrhoid formula, Yi Zi Tang or Cimicifuga Combination, that proved to be quite successful. Prep P Relief integrates his recommended herbs with those from the Western herbal practices that help heal this aggravating and painful disorder. 

Tang Kuei moistens the intestines and stimulates the bowels. Bupleurum and Cimicifuga raise the yang and are used for prolapse. Scute, Shave Grass, Sanguisorba, and Plantain clear heat and stop bleeding. Pilewort &leftpar;Lesser Celandine&rightpar; is hemorrhoid specific. Stone Root and Witch Hazel are a venous tonic and astringent. Rhubarb and Cascara Sagrada stimulate the bowels. 

The homeopathics; Horse Chestnut is an anodyne and hemorrhoid specific while Bryonia is an anti-inflammatory and analgesic.

Prep P Powder, when combined with Prep P Relief, provides excellent support for chronic piles. 

Incorrect dietary patterns, chronic constipation, and lack of exercise often leads to the development of hemorrhoids. If any of these situations exist, it is important to take steps to correct them. Straining during bowel movements is avoided. Sitting on cold stones or cold damp cement is a sure fire way to encourage them. Drinking a glass of warm water with a teaspoon of honey helps to ease constipation.', 'external');
INSERT INTO products VALUES (19, 'Prep P Powder', 'Hemmorhoid (External)', 31, 'Ingredients &leftpar;Mineral Powders&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Sulfur &leftpar;precipitated&rightpar;

Cream of Tartar

Magnesium Carbonate &leftpar;light&rightpar;

Calcium Fluoride', 'Western Therapeutic Actions

Venous tonic, astringent, restorative, and specific', 'Traditional Chinese Medicine

Supports the spleen qi, clears heat, retains the essence, and stops bleeding', 'Sample Indications

Hemorrhoids &leftpar;piles&rightpar;, constipation with bleeding, severe local pain, varicose veins, phlebitis, thrombosis, and thrombophlebitis', 'Suggested Dosage

1 large teaspoon in 2 tablespoons of milk or juice, twice daily

Variation is according to individual symptoms', 'Contraindications and Cautions

There are none known.', 'Notations

Prep P Powder, when combined with Prep P Relief, provides excellent support for piles. Sulfur, an acid forming mineral, has excellent anti-bacterial, anti-viral, and anti-infective qualities. It supports the structural integrity of the skin and used for problematic skin tissue irritations. Calcium Fluoride helps promote the elasticity of tissues and is useful for piles, varicose veins, circulation problems, and muscle weakness. Magnesium Carbonate is an antacid. Cream of Tartar is a binder or solidifier.

Incorrect dietary patterns, chronic constipation, and lack of exercise often leads to the development of hemorrhoids. If any of these situations exist, it is important to take steps to correct them. Straining, during bowel movements, is avoided. Sitting on cold stones or cold damp cement is a sure fire way to encourage them. Drinking a glass of warm water with a teaspoon of honey helps to ease constipation.', 'external');
INSERT INTO products VALUES (20, 'Artery Cleanser', 'Arterial Plaque', 28, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Salvia                      Dan Shen

Arjuna			Terminalia Arjuna

Gynostemma		Jiao Gu Lan

Ho Shou Wu		He Shou Wu

Pseudoginseng	Tien Qi

Astragalus		Huang Qi

Myrrh			Commiphora Molmol

Turmeric		Curcuma Longa

Red Clover		Trifolium Pratense

Tang Kuei		Dang Gui

Hawthorn berry	Crataegus Spp.

Yarrow			Achillea Millefolium

Ginkgo leaf		Ginkgo Biloba

Carthamus		Hong Hua

Bayberry			Myrica Cerifera

Cassia seed		Jue Ming Zi', 'Western Therapeutic Actions

Neurocardiac restorative, alterative, tonic, venous astringent, and circulatory stimulant', 'Traditional Chinese Medicine

Disperses blood stasis, vitalizes the blood, enhances circulation, and nourishes the heart blood and qi', 'Sample Indications

Coronary heart disease, poor blood circulation, hardening of the arteries, arterial plaque, atherosclerosis, and hyperlipemia', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

Contraindicated during pregnancy.', 'Notations 

Artery Cleanser, a heart tonic and circulatory stimulant, uses one of the most relied upon herbs to promote blood circulation, called Salvia &leftpar;Dan Shen&rightpar;. Salvia can be used for long periods of time without having any adverse side effects. Artery Cleanser follows the Oriental Medicine guidelines for resolving blood stagnation. These guidelines state that the correct way to resolve stagnation of the blood &leftpar;plaque and platelet aggregation&rightpar;, the blood must also be nourished and fortified. 

When the arteries become obstructed with plague or lipids, circulation to the heart becomes impaired. The herbs in this formula help clear the excess lipids &leftpar;fats&rightpar; from the blood, enhance blood circulation and nourish the heart. Arjuna, an Ayurvedic herb, is a cardiovascular tonic. It has cholesterol regulating properties and is a blood pressure regulator. Gynostemma is a neurocardiac restorative and alleviates platelet aggregation. Ho Shou Wu and Cassia seed help to reduce the absorption of fats into the blood stream. Pseudoginseng arrests bleeding and vitalizes the blood. Myrrh and Turmeric, used in Oriental and Ayurvedic Medicine, are excellent anti-fat herbs and used for obesity and cholesterol maintenance. Red Clover is a detoxicant, nutritive, and demulcent. Hawthorn berry, a heart tonic, resolves food stagnation and assists in the digestion of fats. The synergy of Astragalus and Tang Kuei nourishes the blood and qi. Yarrow, Ginkgo leaf, and Bayberry are circulatory stimulants. Carthamus enhances circulation and is used for angina.

From China, a red yeasted rice, Hong Gu, has been used for cholesterol disorders.

Cleaning up the diet and exercising are important elements in maintaining a healthy heart and circulation. In dealing with heart imbalances it is important to address the client''s soul.', 'external');
INSERT INTO products VALUES (21, 'Cholest Balancer', 'Lower Cholesterol', 28, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by ComImon Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Crataegus			Shan Zha

Salvia				Dan Shen

Arjuna				Terminalia Arjuna

Ho Shou Wu			He Shou Wu

Red Clover			Trifolium Pratense

Yarrow				Achillea Millefolium

Ginseng, Siberian		Ci Wu Jia

Pseudoginseng		Tien Qi

Gynostemma			Jiao Gu Lan

Cassia seed			Jue Ming Zi 

Garcinia				Garcinia Cambogia

Turmeric			Curcuma Longa

Capillaris			Yin Chen Hao

Chamomile, Roman	Anthemis Nobilis

Barberry			        Berberis Vulgaris', 'Western Therapeutic Actions

Neurocardiac restorative, astringent, tonic, antiseptic, deobstruent, circulatory stimulant, and alterative', 'Traditional Chinese Medicine

Disperses blood stasis, nourishes the heart, enhances circulation, and clears damp/heat', 'Sample Indications

High cholesterol, hyperlipemia, poor blood circulation, elevated cholesterol not responding to medication or dietary corrections, and a weak heart', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

Contraindicated during pregancy.', 'Notations 

Cholest Balancer is designed to improve the bodys capacity to digest and eliminate fats &leftpar;lipids&rightpar; and remove excess fats from the blood stream. With these qualities, Cholest Balancer helps to improve the HDL / LDL ratios. 

Crataegus &leftpar;Hawthorn berry&rightpar; is a neurocardiac restorative and vasodilator, primarily of the coronary blood vessels. It supports the integrity of the blood vessels and assists in the prevention of cholesterol build up in the liver. This last mentioned quality might be why in Oriental Medicine, Crataegus is used for food stagnation. Salvia stimulates blood circulation, particularly of the chest region. Arjuna is a nervine, cardiovascular tonic, and has cholesterol regulating qualities. Ho Shou Wu nourishes the blood and yin, and contains lecithin. Red Clover is an anti-coagulant and detoxicant. Yarrow promotes venous integrity and enhances circulation. Ginseng &leftpar;Siberian&rightpar; with its rich supply of saponins, prevents blood coagulation, and decreases the sugar and cholesterol levels in the blood. Gynostemma and Cassia seed are used for cholesterol abnormalities. Pseudoginseng and Gynostemma are used in China and Japan for maintaining healthy blood pressure and good cholesterol readings. Capillaris clears damp/heat from the liver and is a vasodilator.  Turmeric, from the Ayurvedic tradition, has anti-fat and hepatic cleansing actions. In India, Turmeric and Garcinia, Ayurvedic herbs, have both shown their anti-fat qualities and ability to promote healthy cholesterol levels. Chamomile has mild anti-coagulant qualities and is calming. Barberry disperses stagnation and vitalizes the blood and liver.

Removing saturated fats from the diet, breathing fresh air, having fun with exercise, saunas, and a satisfying life assist the body in maintaining balance and integrity.ü', 'external');
INSERT INTO products VALUES (22, 'Vein Away Powder', 'Varicose Veins', 31, 'Ingredients &leftpar;Homeopathic Biochemic Tissue Salts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Calcium Fluoride

Ferrum Phosphate

Magnesium Phosphate

Calcium Phosphate', 'Western Therapeutic Actions

Venous tonic, astringent, restorative, and specific', 'Traditional Chinese Medicine

Vitalizes the blood and strengthens the spleen qi', 'Sample Indications

Varicose veins, spider veins, swollen veins, and pain due to vascular constriction', 'Suggested Dosage

1/4 teaspoon dissolved directly on the tongue, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

There are none known.', 'Notations

A German chemist and physicist, Dr. W.H. Schuessler, studied twelve essential cell salts and recorded the effects that the mineral constituents within the cell salts had on supporting the wellness of the body. He identified the specific attributes of each cell salt and they were used accordingly, in the natural healing process from suffering. The cell salts or tissue salts are mineral constituents that are vital for the healthy functioning of our cells and are used extensively by homeopathic doctors. They combine well with herbal formulas in correcting constitutional imbalances. 

Biochemic Tissue Salts

Calcium Fluoride

	This cell salt helps to retain proper elasticity of tissues and veins. It benefits enlarged varicose veins, hemorrhoids and other conditions caused by over-relaxed fibers of connective tissue. It stimulates blood circulation and strengthens the blood vessels.

Ferrum Phosphate 

	This cell salt is considered the oxygen carrier because of its ability to oxygenate all the cells of the body, which is then converted into energy.

Magnesium Phosphate

        This cell salt is an anti-inflammatory agent for the muscular system or nervous system. Cramping or spasmodic pain that 		         is stabbing or sharp responds well to this cell salt. 

Calcium Phosphate

	This cell salt improves digestion and nutrient assimilation.', 'external');
INSERT INTO products VALUES (35, 'Build Pure Essence', 'Weak Assimilation, Gain Weight', 28, 'Ingredients&leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Astragalus		  Huang Qi

Tang Kuei		  Dang Gui

Ashwaganda		  Withania Somnifera

Ligustrum		  Nu Zhen Zi

Oats			  Gou Qi Zi

Ganoderma		  Jiao Gu Lan

Ginseng, Chinese	  Ji Lin Ren Shen

Schizandra		 Wu Wei Zi

Saw Palmetto		 Serenoa Serrulata

Salvia			 Dan Shen

Citrus			 Chen Pi

Ginger, fresh	         Sheng Jiang', 'Western Therapeutic Actions

Adaptogenic, restorative tonic, and nutritive tonic', 'Traditional Chinese Medicine

Supplements the qi, nourishes the blood, and replenishes the essence', 'Sample Indications

Weakness, loss of weight, poor digestion and assimilation, recovery from illness, AIDS, cancer, adjunct to chemotherapy and radiation therapy', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

Contraindicated during pregnancy or when external pathogenic influences have invaded the body &leftpar;fever, influenza, colds, or rashes&rightpar;.', 'Notations 

The Chinese have made an oral liquid similar to this formula and is called Ren Shen Feng Wang Pian. Build Pure Essence is without royal jelly &leftpar;a fluid secreted from the glands of worker bees and fed to bee larvae&rightpar; because of possible allergic reactions, and added Astragalus, Tang Kuei, and Ligustrum in place of it. 

Astragalus supplements and raises the qi. Tang Kuei nourishes and moves the blood. These two herbs are used together when there is blood and qi deficiency. Ashwaganda is the premier Ayurvedic herb for supplementing the qi. Ligustrum helps to replenish the essence and is a kidney and liver restorative. Oats is the classic Western herb restorative and could be added to any supplementing formula. Lycium fruit, a longevity herb, nourishes the blood and essence, and is a kidney and liver restorative. Ganoderma, a fungus also known as Reishi, has been used as a longevity herb and in cancer therapies. It strengthens the qi, nourishes the heart and lungs, and calms the spirit. Gyno-stemma and Saw Palmetto have been added for an increased adaptogenic effect. Saw Palmetto has been used for wasting diseases. Chinese Ginseng is the unsurpassed, classic Asian restorative. This white root is warming, but not as hot as the red Korean Ginseng. Citrus was added to move the qi in the middle burner &leftpar;digestive system&rightpar; and prevent bloating or distention.

This restorative tonic helps to create more energy in the body, calms the mind, enhances the respiratory system, and improves the digestive functions. Take this formula 30 minutes before mealtime to stimulate the appetite. 

If an herbal formula causes stomach upset or is irritating, then take a smaller dosage after meals.', 'external');
INSERT INTO products VALUES (38, 'Green Stone', 'Gall Stones', 28, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Scute				Huang Qin

Saussurea			Mu Xiang

Lysimachia			Jin Qian Cao

Capillaris			Yin Chen Cao

Corydalis			Yan Hu Suo

Isatis root			Ban Lan Gen

Celandine, Greater	Chelidonium Majus 

Marshmallow			Althea Officinalis

Skullcap				Scutellaria Lateriflora

Bupleurum			Chai Hu

Wild Yam			Dioscorea Villosa

Meadowsweet		Filipendula Ulmaria

Stone Root			Collinsonia Canadensis

Golden Rod			Solidago Virgaurea

Wahoo				Euonymus Atropurpureus', 'Western Therapeutic Actions

Cholagogue, anti-inflammatory, de-obstruent, antilithic, antispasmodic, hepatic, demulcent, and emollient', 'Traditional Chinese Medicine

Clears damp/heat in the liver and purges the gallbladder', 'Sample Indications

Acute jaundice, inflammation of the bile ducts, cholelithiasis, gallstones, hepatitis, rashes with itching, and difficulty digesting fats', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

Additional herbs for the spleen and stomach may be necessary if there is indigestion, weak appetite, or loose stool.', 'Notations

Gallbladder inflammation and congestion makes it difficult to digest fats. When phlegm accumulates over time, soft masses and stones can be created. Phlegm accumulation also creates heat. Green Stone addresses this damp/heat condition. The Chinese patent formula, Ludan Pian, combined with the traditional Western specifics creates this new formulation.

Consider a rigorous liver detoxification program after the stones have been resolved. This requires a dietary program that includes organic bitter greens, olive oil, apple cider and vegetable juicing. Greasy, fried foods, coffee, alcohol, starchy food &leftpar;soft breads&rightpar;, spicy foods, and unrefined sugars are eliminated from the diet. Saunas and exercise with sweating are very beneficial for cleansing the liver, the lymphatic system, and the blood. For chronic liver sufferers, an annual spring and fall liver cleanse is called for. Consider doing a liver cleanse for two weeks, beginning with the new moon phase. Repeat this on the next new moon phase. 

Liquid Juice Fast:

To make a good vegetable juice use the following organic foods: carrots, beet, cucumber, garlic, wheat grass, celery, and dandelion greens. Drink three 8 ounce glasses of this juices per day. During the day drink as much water as needed. During the fast, take one tablespoon of cold pressed olive oil, two times daily. This will help to move the stool, cleanse the liver, and cleanse the colon. Apple juice helps to soften the stones, if present.

If blood sugar problems exist, drink organic chicken broth throughout the day to help stabilize the blood sugar. Sugar Blues is an excellent herbal formula for hypoglycemia &leftpar;low blood sugar&rightpar; and Sugar Fire for diabetics &leftpar;high blood sugar&rightpar;.', 'external');
INSERT INTO products VALUES (23, 'Breast C Clear', 'Breast Cancer', 30, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Chih-Ko			Zhi Ke

Curcuma		Yu Jin

Burdock root		Arctium Lappa

Prunella			Xia Ku Cao

Blue Citrus		Qing Pi

Trichosanthes fruit Gua Lou

Fritillaria		Zhe Bei Mu

Jaborandi		Pilocarpus Spp.

Lonicera			Jin Yin Hua

Turmeric		Jiang Huang

Poke Root		Phytolacca Spp.

Figwort			Scrophularia Nodosa

Kohe Kohe		Dysoxylum Spectabile

Thuja			Thuja Occidentalis', 'Western Therapeutic Actions

Anti-tumor, alterative, depurative, diuretic, anthelmintic, 

anodyne, astringent, resolvent, and absorbent', 'Traditional Chinese Medicine

Transforms phlegm, vitalizes the blood, resolves masses, and clears heat, and relieves toxicity', 'Sample Indications

Breast cancer, tumors, and solid cysts in the upper body, chronic congestion and swelling in the lymphatic and glandular systems', 'Suggested Dosage

1  2 teaspoons, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

The herb St. Johns Wort should not be consumed while undergoing chemotherapy or radiation therapy because of potential adverse effects. This formula is not a substitute for qualified medical health care. It is intended as an adjunct therapy.', 'Notations 

A gastrointestinal cancer herbal formula, Ping Xiao Dan, developed in China by Dr. Jia Kun in 1958, creates the foundation for Breast C Clear. This formula is primarily a clearing and resolving formula. Herbal formulas that enhance the immune system are beneficial with Breast C Clear. Immune enhancement is critical in dealing with deep seated disorders such as cancer.

Chih-ko and Curcuma are two of the main herbs taken from his formula. Chih-ko disperses stagnant energy and transforms phlegm; Curcuma invigorates the blood and breaks up stagnation in the chest area. Phlegm is considered one of the main causes of solid masses in the body. Our formula has included herbs commonly used to resolve masses and disperse phlegm in the upper body: Prunella, Blue Citrus, Trichosanthes fruit, Jaborandi, and Fritillaria. Lonicera clears toxic heat. Turmeric assists in resolving phlegm. The Western herbs, Poke root and Figwort, clear toxicity from the blood and lymphatic system and help to resolve swollen glands. Kohe Kohe is a specific for the pectoral region of the body and is an alterative. Thuja is an alterative and helps to resolve phlegm and masses. 

Nutrition is extremely important in this life threatening disorders. All phlegm-producing foods should be eliminated immediately from the diet, including dairy products. Soy products &leftpar;tofu&rightpar; have proven to be beneficial for cancer prevention, along with CoQ10 &leftpar;~400 mg / day&rightpar;. A deep cleansing on all levels is recommended,and the patient requires support by a deeply committed, loving team.', 'external');
INSERT INTO products VALUES (24, 'C Clear', 'Basic Cancer Cleanser', 30, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Oldenlandia		Bai Hua She She Cao

Scutellaria		Ban Zhi Lian

Gynostemma		Jiao Gu Lan

Astragalus		Huang Qi

Burdock root		Arctium Lappa

Ganoderma		Ling Chi

Sheeps Sorrel	Rumex Acetosella

Paris			Zao Xiu

Slippery Elm 		Ulmus Fulva

Sparganium		San Leng

Zedoaria			E Zhu

Kohe Kohe		Dysoxylum Spectabile

Thuja			Thuja Occidentalis

Jaborandi		Pilocarpus Spp.

Bellis &leftpar;Daisy&rightpar;		Bellis Perennis

Violet			Zi Hua Di Ding

Poke Root		Phytolacca Spp.', 'Western Therapeutic Actions

Anti-tumor, alterative, depurative, restorative, diuretic, anthelmintic, antiseptic, and absorbent', 'Traditional Chinese Medicine

Clears heat, relieves toxicity, supplements the qi, resolves masses, and disperses blood stasis', 'Sample Indications

Cancer, tumors, solid masses, lupus, and for cleansing and 

immune system support in the treatment of chronic conditions', 'Suggested Dosage

1  2 teaspoons, in a small amount of water, 

3 times daily

Variation is according to individual symptoms

C Clear is used in conjunction with a herbal formula that focuses on the specific type of cancer and imbalance&leftpar;breast, colon, lung, prostate&rightpar;.', 'Contraindications and Cautions

The herb St. Johns Wort should not be consumed while undergoing chemotherapy or radiation therapy because of potential adverse effects. This formula is not a substitute for qualified medical health care. It is intended as an adjunct therapy.', 'Notations

Genetics and exposure to external environmental toxins &leftpar;carcinogenic chemicals, radiation, pollutants&rightpar; are current medical theories on the possible causes of cancer. Traditional healers also link the emotions as an important contributing factor to imbalances and disorders. 

An excessive amount of any emotion, whether it is anger, depression &leftpar;anger turned inward&rightpar;, anxiety, worry, grief, or fear, has a negative impact on the body. Anything in excess, external or internal, disrupts the normal circulatory patterns of the blood and qi. Over time, this leads to stagnation in areas of weakness in the body. Stagnation of blood and qi, when linked with a toxin present in the body, and a compromised immune system, can lead to abnormal cell growth or a tumor. 

The Oriental Medicine method of treatment for cancer, developed in the 1960''s, is called Fu Zheng Pei Ben. This translates into, "support the normal and strengthen the root". C Clear is formulated to address this concept. Using the model of Fu Zheng Pei Ben, C Clear clears the body of toxicity, resolves stagnation, and supports the weakened immune system. 

Consider a comprehensive healing program. Some supportive natural therapies include: acupuncture, Shiatsu, ozone treatments, enzyme therapy, castor oil packs, coffee enemas, ginger compresses, albi root plasters, juicing and chelation therapy. A cleansing diet based on organic fruits and vegetables benefits this disorder. This helps to keep the body in an alkaline state, cleanses the body of toxicity, and supports the immune system.', 'external');
INSERT INTO products VALUES (25, 'Chemo Balancer', 'Builds White Blood', 2, 'Ingredients Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Oats			Avena Sativa

Astragalus		Huang Qi

Millettia			Ji Xue Teng

Gynostemma		Jiao Gu Lan

Burdock root		Arctium Lappa

Ashwaganda		Withania Somnifera

Ganoderma		Ling Chi

Atractylodes		Bai Zhu

Salvia			Dan Shen

Guduchi			Tinospora Cordifolia

Cuscuta			Tu Si Zi

Morus fruit		Sang Shen

Gentian			Gentiana Lutea

Citrus			Chen Pi

Ginger, fresh		Sheng Jiang

Licorice, baked	Zhi Gan Cao', 'Western Therapeutic Actions

Restorative, nutritive, digestive, nerve tonic, and alterative', 'Traditional Chinese Medicine

Nourishes the blood and supplements the qi, enriches the yin and yang, supports the spleen, and regulates the qi', 'Sample Indications

Adjunct to chemotherapy, nausea, leukopenia, weakness, 

dizziness, and loss of appetite', 'Suggested Dosage

1 - 2 teaspoons, in a small amount of water, 

3 times daily

Chemo Balancer can be used in conjunction with C Clear, which addresses the elimination of toxins &leftpar;toxic heat&rightpar; in the body, while supporting the vital energy, and protecting the immune system.

Variation is according to individual symptoms

ü', 'Contraindications and Cautions

St. Johns Wort is the only herb known to inhibit the actions of chemotherapy. High doses of Vitamin C, exceeding 1.5 grams/day, has been questioned &leftpar;it is absorbed by the cancer cells&rightpar;, but these studies are not definitive.', 'Notations 

Chemotherapy is directed at destroying cancer cells, but also adversely affects the entire body; loss of hair, diarrhea, low white blood count, weakness, and emotional distress. Protection of the non-targeted normal cells &leftpar;white blood cells, bone marrow cells&rightpar; becomes critical for the survival and recovery of a patient. If the white blood count gets too low, chemotherapy is halted until the patients immune system builds back up. Chemo Balancer counters the possible negative impact drug therapy has on the body. 

Supplements and antioxidants may protect the body from the undesirable side effects of chemotherapy without adversely limiting the drug therapy. This includes neuropathy and cardiac damage. 

Oats &leftpar;wild&rightpar; is a restorative, providing nourishment to the endocrine, nervous, and immune systems. Astragalus, Millettia, and Salvia are used together for treating bone marrow suppression. Astragalus replenishes the qi and blood; Millettia nourishes and promotes the movement of blood; and Salvia disperses blood stagnation, particularly in the chest area and calms the spirit. Gynostemma and Ashwaganda are adaptogenic herbs and antioxidants, fortifying the body when undergoing high levels of stress and illness. Gynostemma is used to nourish the heart and disperse platelet aggregation &leftpar;clotting and plaque&rightpar;. Burdock root is a detoxicant, eliminating toxins from the tissues and bloodstream. Ashwaganda and Cuscuta nourish the kidney yang &leftpar;fire&rightpar; and counteract the depletion caused by the toxic chemicals. Guduchi restores the immune system and is an excellent purifier. Morus fruit nourishes the blood and moistens. Atractylodes, Citrus, Ginger, and Licorice support the spleen and enhance digestion.', 'external');
INSERT INTO products VALUES (26, 'Colon C Clear', 'Colon Cancer', 30, 'Ingredients  &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Pau Darco			Tabebuia Avellanedae

Chih-Ko				Zhi Ke

Curcuma			Yu Jin

Agrimony			Xian He Cao

Patrinia				Bai Jiang Cao

Coix				Yi Yi Ren

Imperata			Bai Mao Gen

Zedoaria				E Zhu

Sparganium			San Leng

Oldenlandia			Bai Hua She She Cao

Burdock root			Arctium Lappa

Peony, red			Chi Shao Yao

Dandelion			Pu Gong Ying

Skullcap				Scutellaria Lateriflora

Saussurea			Mu Xiang', 'Wesern Therapeutic Actions

Anti-tumor, alterative, depurative, nervine, and cholagogue', 'Traditional Chinese Medicine

Vitalizes the blood and moves the qi, resolves masses, clears heat, relieves toxicity, and transforms phlegm', 'Sample Indications

Gastrointestinal cancer, tumors, and solid masses in the 

digestive tract', 'Suggested Dosage

1  2 teaspoons, in a small amount of water, 

3 times daily

Variation is according to individual symptoms

Colon C Clear can be used in conjunction with 

C Clear, which addresses the elimination of 

toxins &leftpar;toxic heat&rightpar; in the body, supports the vital energy, and protects the immune system.', 'Contraindications and Cautions

The herb St. Johns Wort should not be consumed while undergoing chemotherapy or radiation therapy because of potential adverse effects. This formula is not a substitute for qualified medical health care. It is intended as an adjunct therapy.', 'Notations 

Colon C Clear uses a gastrointestinal cancer herbal formula, Ping Xiao Dan, developed in China by Dr. Jia Kun in 1958, as its foundation. In designing herbal formulas for cancer, the current Chinese model recommends this strategy: support the vital qi and immune system, expel the toxins with herbs that have shown themselves to inhibit tumors, vitalize the blood and qi &leftpar;create movement&rightpar;, and disperse the phlegm &leftpar;some believe that tumors are congealed masses of phlegm&rightpar;.

Pau Darco is the inner bark of the Taheebo tree from South America. It has anti-viral and anti-fungal properties and multiplies the red corpuscles, the oxygen carrying blood cells. Pau Darco is widely used in South America as a detoxifying tea in treating cancerous disorders, especially colon cancer. Chih-Ko is cool in nature and helps to regulate the qi in the middle burner &leftpar;digestive tract&rightpar;. Curcuma helps to invigorate the blood and break up stagnation. Agrimony is anti-inflammatory, a hemostatic, and anti-viral. Patrinia and Oldenlandia relieve toxicity and internal toxic sores and swellings. Coix has shown in studies to inhibit carcinoma. Zedoaria and Sparganium strongly activate circulation and resolve abdominal masses. Red Peony promotes the circulation of blood and qi. Burdock root and Dandelion are blood purifiers.

During chemotherapy or radiation therapy, Chemo Balancer and Radiation Support support the immune system and help minimize the adverse side effects of these types of therapies. Immune support is a critical issue during these stages of therapy.

Consider adapting to a cleansing diet of organic raw foods. The elimination of red meats, fried foods, and dairy is recommended. Daily juicing of organic raw vegetable assist the cleansing process. Chew well, eat slowly, and relax.', 'external');
INSERT INTO products VALUES (31, 'Sugar Fire', 'High Blood Sugar', 28, 'Ingredients&leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Gymnema		       Gymnema Sylvestre

Trichosanthes root     Tian Hua Fen 

Rehmannia, raw	       Sheng Di Huang

Oats			       Avena Sativa

Bitter Melon		       Momordica Charantia

Ophiopogon		       Mai Men Dong

Periwinkle		       Vinca Minor

Rhodiola			       Hong Jing Tian

Shilajit			       Asphaltum

Dioscorea		       Shan Yao

Salvia			       Dan Shen

Bugleweed		       Lycopus Virgininicus 

Polygonatum, sib.       Huang Jing

Polygonatum, odor.    Yu Zhu

Meadowsweet	       Filipendula Ulmaria

Cranesbill, American  Geranium Maculatum

Coptis			       Huang Lian

Jambul			       Eugenia Jambolana', 'Western Therapeutic Actions

Restorative, nutritive, demulcent, nerve tonic, astringent, antacid, and diuretic', 'Traditional Chinese Medicine

Nourishes the yin, supplements the qi, vitalizes the blood, and clears heat', 'Sample Indications

Diabetes &leftpar;type 2, non-insulin dependent&rightpar;, hyperglycemia, excessive thirst, excessive hunger, excessive urination, chronic kidney disease, tuberculosis, and dry cough', 'Suggested Dosage

1 -2 teaspoons, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

There are none known.', 'Notations

Sugar Fire is designed to treat the initial stages of diabetes and non-insulin dependent glucose imbalances. If diabetes is chronic and deeply rooted &leftpar;insulin dependent&rightpar;, then herbal formulas that nourish the kidney yang &leftpar;fire&rightpar; are to be considered, such as Fortify Will or Kidney Long Life. Sugar Fire, is a modified version of two Chinese formulas; Mai Men Dong Yin Zi or Ophiopogon and Trichosanthes Combination and Yu Quan Pian or Jade Screen Tablet combined with Western proven specifics. 

Sugar Fire enhances the bodies ability to utilize the insulin being produced in the spleen &leftpar;islets of langerhans&rightpar;, encourages insulin production, and supports the livers ability to store glycogen. The Ayurvedic herbs, Gymnema, Bitter Melon, Shilajit, and Jambul, are used in India for regulating sugar metabolism. 

Diet is a major factor in diabetes. Refined sugars, simple carbohydrates, raw milk, and fried foods should be eliminated from the diet. A more traditional diet based on ones ancestral heritage could be of benefit. Obesity is another major problem because of the bodies inability to produce enough extra insulin to support the excess weight. Exercise promotes better circulation, and will oxygenate the cells so they can burn off excess calories. 

An excess amount of emotional stress and tension can cause an internal disharmony between the liver and spleen, triggering glucose imbalances. Stress reduction is the key.

The Native American population has the highest incidence of diabetes in the Americas. White sugar and white flour given them by the government replaced the wild berries and wild meat. Reservations, reformatories, and missionaries created emotional scars that even the healthiest of livers and spleens would be pressed to thrive, let alone survive, and echoed around the world by many indigenous peoples!

ü', 'external');
INSERT INTO products VALUES (27, 'Lung C Clear', 'Lung Cancer', 30, 'Ingredients  &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Houttuynia			Yu Xing Cao

Oldenlandia			Bai Hua She She Cao

Gynostemma			Jiao Gu Lan

Scutellaria			Ban Zhi Lian

Marshmallow			Althea Officinalis

Slippery Elm 			Ulmus Fulva

Lungwort			Pulmonaria Officinalis

Phragmites			Lu Gen

Platycodon			Jie Geng

Ophiopogon			Mai Men Dong

Kumarahoe			Pomaderris Kum

Fritillaria			Zhe Bei Mu

Kohe Kohe			Dysoxylum Spectabile

Horopito			Pseudowintera Colorata

Fenugreek			Trigonella Foenum-Graecum

Licorice				Gan Cao

Bellis &leftpar;Daisy&rightpar;			Bellis Perennis', 'Wesern Therapeutic Actions

Anti-tumor, absorbent, alterative, depurative, demulcent, and emollient', 'Traditional Chinese Medicine

Clears heat, relieves toxicity, nourishes the yin, moistens the lung,  vitalizes the blood, and resolves masses', 'Sample Indications

Lung cancer, tumors, and solid masses in the chest and upper body', 'Suggested Dosage

1  2 teaspoons, in a small amount of water, 

3 times daily

Variation is according to individual symptoms

Lung C Clear can be used in conjunction with 

C Clear, which addresses the elimination of 

toxins &leftpar;toxic heat&rightpar; in the body, supports the vital energy, and protects the immune system.', 'Contraindications and Cautions

The herb St. Johns Wort should not be consumed while undergoing chemotherapy or radiation therapy because of a potential adverse effect. This formula is not a substitute for qualified medical health care. It is intended as an adjunct therapy.', 'Notations

Lung C Clear brings moisture back to the lungs and clears the toxic/heat and phlegm build-up. Oldenlandia and Scutellaria are used in Oriental Medicine in cancer therapy and are used extensively in our herbal cancer formulas. They are known for their potent ability to cleanse toxins from the body. 

Houttuynia clears toxic/heat, is excellent for lung abscesses, and reduces swellings. Gynostemma has adaptogenic and antioxidant properties, strengthens the immune system, promotes healthy cholesterol levels, and increases stamina. Marshmallow and Slippery Elm soothe the mucous membranes of the lungs and are anti-inflammatory. Lungwort, as it name implies, is pectoral specific, and helps to alleviate the dryness of the lungs, similar to the Chinese herb, Ophiopogon. Phragmites clears lung heat and generates fluids which helps the actions of Fritillaria to expel the toxic mucous from the lungs. Platycodon is a brilliant herb that opens the lungs and helps in expectorating mucous, hot or cold. It is an excellent herb for many lung disorders. Kumarahoe and Kohe Kohe, Maori herbs, are pectorals with clearing and anti-inflammatory actions. Horopito, another Maori herb, is an excellent alterative and depurative. Fenugreek and Licorice support the digestion. Bellis supports the healing of tissues.

This formula deals directly with the lungs and should be supported by other herbal formulas to address any other imbalances the patient is experiencing. Cancer is the result of a long-term imbalance in the body network of systems. Consider a comprehensive healing program using the traditional concept practiced by most traditional cultures; the poetic interplay and dance of the of the body-mind-heart-spirit.', 'external');
INSERT INTO products VALUES (28, 'Radiation Support', 'Cleanses, Supports recovery from Radiation Therapy', 30, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Oldenlandia		     Bai Hua She She Cao

Salvia			     Dan Shen

Ashwaganda		     Withania Somnifera

Guduchi			     Tinospora cordifolia

Ophiopogon		     Mai Men Dong

Astragalus		     Huang Qi

Bushy Knotweed	     Hu Zhang

Rehmannia, raw	     Sheng Di Huang

Anemarrhena	     Zhi Mu

Pseudostellaria	     Tai Zi Shen

Imperata		     Bai Mao Gen

Polygonatum, sib.     Huang Jing

Atractylodes		     Bai Zhu

Scrophularia		     Xuan Shen

Moutan			     Mu Dan Pi

Cardamon		     Sha Ren', 'Western Therapeutic Actions

Demulcent, nutritive, restorative, alterative, and emollient', 'Traditional Chinese Medicine

Clears heat, vitalizes the blood, nourishes the liver and kidney yin, replenishes the essence, and supports the spleen', 'Sample Indications

Supports the internal organs, body fluids, and vital energy during radiation therapy for cancer', 'Suggested Dosage

1 - 2 teaspoons, in a small amount of water, 

3 times daily

Radiation Support can be used in conjunction with C Clear, which addresses the elimination of toxins &leftpar;toxic heat&rightpar; in the body, while supporting the vital energy, and protecting the immune system.

Variation is according to individual symptoms', 'Contraindications and Cautions

St. Johns Wort is the only herb known to inhibit the actions of chemotherapy. High doses of Vitamin C, exceeding 1.5 grams/day, has been questioned &leftpar;it is absorbed by the cancer cells&rightpar;, but not definitive.', 'Notations

Radiation Support addresses the damaging heat that radiation therapy causes. In Oriental Medicine, an excess amount of heat can create a yin &leftpar;water&rightpar; deficiency as the excess heat consumes the body fluids. Excess heat can also damage the mucous membranes causing sores, inflammation, and ulcers. Dr. Pan Mingji has done extensive cancer research using Traditional Chinese Medicine in China. He created a formula, Fuzhen Shengjin Decoction, in support of the bodies internal response to radiation. Radiation Support uses the energetic patterns and herbal guidelines he developed. 

Oldenlandia is a strong detoxicant, clears heat, and relieves toxicity. It can be used both externally and internally. Salvia clears heat, calms irritability, and is effective when the damaging heat reaches the nutritive level of the body. Salvia is an effective herb in all yin deficient conditions. Ashwaganda is an adaptogenic and antioxidant, fortifying the body during high levels of stress. Guduchi is a blood purifier and restorative. Astragalus strengthens the qi and blood and augments the protective qi. Astragalus is also used for skin ulcerations that do not heal. Bushy Knotweed invigorates the blood, drains heat downward, and relieves toxicity. Imperata cools the blood. Ophiopogon, Rehmannia, Anemarrhena, and Scrophularia nourish the fluids. Pseudostellaria and Polygonatum were added because of their ability to nourish the spleen &leftpar;nutritive assimilation&rightpar; without damaging the yin. Moutan cools the blood and calms the irritability and edginess caused by the excess heat. Cardamon is an aromatic digestive aid, especially useful when strong clearing action is the focus of an herbal formula.

Minimizing the adverse side effects of allopathic medicine without suppressing their actions is a healthy approach to consider.', 'external');
INSERT INTO products VALUES (29, 'Prostate C Clear', 'Prostate Cancer', 30, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Coix			Yi Yi Ren

Capillaris		Yin Chen Hao

Saw Palmetto		Serenoa Serrulata

Burdock root		Arctium Lappa

Sarsaparilla		Smilax Officinalis

Pseudostellaria	Tai Zi Shen

Plantago seed	Che Qian Zi

Gardenia		Zhi Zi

Lygodium spore	Hai Jin Sha

Achyranthes		Niu Xi

Salvia			Dan Shen

Persica			Tao Ren

Atractylodes		Bai Zhu

Polyporous		Zhu Ling

Peony, red		Chi Shao Yao', 'Western Therapeutic Actions

Anti-tumor, alterative, depurative, detoxicant, absorbent, deobstruent, tonic, and diuretic', 'Traditional Chinese Medicine

Dries dampness and drains damp/heat, supplements the qi, resolves masses, and disperses blood stasis', 'Sample Indications

Cancer and tumors of the prostate, prostatitis, benign prostatic hyperplasia', 'Suggested Dosage

1  2 teaspoons, in a small amount of water, 

3 times daily

Variation is according to individual symptoms

Prostate C Clear can be used in conjunction with 

C Clear, which addresses the elimination of 

toxins &leftpar;toxic heat&rightpar; in the body, supports the vital energy, and protects the immune system.', 'Contraindications and Cautions

The herb St. Johns Wort should not be consumed while undergoing chemotherapy or radiation therapy because potential adverse effects. This formula is not a substitute for qualified medical health care. It is intended as an adjunct therapy. Attention must be given to the intricate web of the body-mind-heart-spirit connections.', 'Notations

Fu Zheng Pei Ben, support the normal and strengthen the root, is the energetic and herbal strategy used in Prostate C Clear. When the kidneys lose their vitality, various systemic changes can take place. One of these changes is the healthy functioning of the prostate gland. The kidneys, from a traditional perspective, control the bladder, prostate gland, and adrenal glands. As the energy of the kidneys weakens, their ability to discharge waste from the body diminishes. The accumulated waste turns into damp/heat and accumulates in the prostate gland. Over time, this damp/heat, if not treated correctly, causes a disruption in urinary and erectile functions, and eventually can turn into tumors and cancer.', 'external');
INSERT INTO products VALUES (133, 'Sneeze Ease', 'Natural Anti-histamine, itchy eyes, sneezing', 29, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Astragalus				Huang Qi

Angelica dah.			Bai Zhi

Nettles					Urtica spp.

Magnolia flower	      Xin Yi Hua

Scute			      Huang Qin

Xanthium		      Cang Er Zi

Centipeda		      E Bu Shi Cao

Mullein			      Verbascum Thapsus

Schizonepeta		      Jing Jie

Cassia seed		      Jue Ming Zi

Siler				      Fang Feng

Platycodon		      Jie Geng

Agastache		      Huo Xiang', 'Western Therapeutic Actions

Antihistaminic, decongestant, alterative, depurative, and astringent', 'Traditional Chinese Medicine

Supplements the protective qi, dispels wind, opens the nasal passages, clears heat, and resolves dampness', 'Sample Indications

Seasonal allergies, sneezing, itchy eyes, runny discharge, and headache', 'Suggested Dosage

10 - 20 drops, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

Contraindicated during pregnancy.', 'Notations

Sneeze Ease is similar to Sinus Clear as both treat sinus conditions. The difference is that the former treats seasonal allergies without any signs of infection, while the later treats allergies and infections of the sinus cavity. Sneeze Ease also uses Astragalus to strengthen the protective qi so that the individual is more immune to seasonal pollens. This formula is patterned after the Chinese patent formula, Bi Yan Pian or Nose Inflammation Pills. 

Angelica dah., Magnolia flower, Xanthium, Centipeda, and Schizonepeta expel wind and open the nasal passages. Nettles is a liver blood tonic rich in chlorophyll, has pectoral qualities and relieves allergies. Scute sedates the liver yang alleviating headaches and inflamed eyes. Mullein is an astringent and pectoral. Cassia seed expels wind/heat and clears the liver and the vision. Siler releases the exterior and expels wind. It also supports the spleen. Platycodon opens the lungs and directs the other herbs to the upper body. Agastache, an aromatic herb, releases the exterior and harmonizes the middle burner.

If an individual suffers from chronic allergies, consider alleviating liver congestion and toxicity. Enhancing the normal functions of the liver is beneficial as it produces natural antihistamines.

Also consider using herbal formulas to build up their immunity prior to allergy seasons. 

Eat fresh juicy pineapple. It provides mouth watering allergy relief! You can tell when a pineapple is ripe by pulling on one of its center leaves. If it pulls out easily, its time to eat!

ü', 'external');
INSERT INTO products VALUES (30, 'Sugar Blues', 'Low Blood Sugar', 28, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Oats				Avena Sativa

Peony				Bai Shao Yao

Codonopsis			Dang Shen

Polygonatum, sib.	Huang Jing

Skullcap				Scutellaria Lateriflora

Bitter Melon			Momordica Charantia

Ophiopogon			Mai Men Dong

Dendrobium			Shi Hu

Polygonum vine		Ye Jiao Teng

Cinnamon twig		Gui Zhi

Dioscorea			Shan Yao

Cyperus				Xiang Fu

Dandelion			Pu Gong Ying

Saussurea			Mu Xiang

Licorice, baked		Zhi Gan Cao', 'Western Therapeutic Actions

Restorative, nutritive, hepatic, demulcent, nerve tonic, and nervine,', 'Traditional Chinese Medicine

Warms and strengthens the middle burner, harmonizes the protective and nutritive qi, and nourishes the yin', 'Sample Indications 

Hypoglycemia, low blood sugar, sudden onset of hunger, dizziness, shaky, sweaty, light headed, difficult to concentrate, cold extremities, feverish from unknown causes, edgy and irritable, fatigue, craves protein, and intermittent abdominal pain', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

Contraindicated for heat from yin deficiency.', 'Notations

Sugar Blues is a modified version of two Chinese formulas, Xiao Jian Zhong Tang or Minor Cinnamon and Peony Combination, and  Gui Zhi Jia Shao Yao Tang or Cinnamon and Peony Combination. 

Peony calms the liver, preserves the yin, and harmonizes the functioning of the liver and spleen. This helps to contain and stabilize the nutritive qi &leftpar;regulation of the production of insulin by the spleen and the storage of glycogen in the liver&rightpar;. Oats, Codonopsis, Polygonatum, and Licorice strengthen the spleen. This helps to raise the glucose levels. Ophiopogon, and Dendrobium moisten the yin of the stomach and lung. Cyperus, Skullcap, and Saussurea help to regulate the middle burner and vitalize the liver qi. Bitter Melon is a blood sugar stabilizer. Cinnamon twig combines with Peony in harmonizing the protective qi and nutritive qi. Dioscorea benefits the spleen, lung, and kidney. Dandelion is a detoxicant and cleanses the liver.

Low blood sugar can be caused by a number of factors: chronic stress adversely affecting the liver &leftpar;constrained liver qi&rightpar;, which then energetically invades the stomach &leftpar;excess heat, depletes the yin&rightpar;; poor dietary habits with an over-consumption of refined sugars and processed carbohydrates &leftpar;depletes the spleen qi&rightpar;; irregular eating habits &leftpar;creates stomach yin deficiency and inability of the spleen to transform fluids&rightpar;. The sleeper in this disorder is chronic anxiety which exhausts the adrenal glands. Anxiety over stimulates the adrenal glands which produces epinephrine &leftpar;a nervous stimulant&rightpar; and initiates the breakdown of glycogen into glucose. With the liver storing a limited amount of glycogen, anxiety depletes the reserves, we run out of gas, and we meet the villain, low blood sugar, the sugar blues!', 'external');
INSERT INTO products VALUES (37, 'Digest Ease', 'Heart Burn, Digestive Aid', 29, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Gallus				Ji Nei Jin

Marshmallow			Althea Officinalis

Meadowsweet		Filipendula Ulmaria

Raphanus			Lai Fu Zi

Crataegus			Shan Zha

Chamomile, Roman	Anthemis Nobilis

Chih-Shih			Zhi Shi

Cuttlebone			Hai Piao Xiao

Wild Yam			Dioscorea Villosa

Fennel				Foeniculum Vulgare

Gentian				Gentiana Lutea

Ginger, fresh			Sheng Jiang

Asafoetida			Ferula Asafoetida', 'Western Therapeutic Actions

Antispasmodic, warming, carminative, anti-nauseant, digestive, aromatic, and antacid', 'Traditional Chinese Medicine

Reduces food stagnation, transforms accumulation, controls acidity, and regulates the qi', 'Sample Indications

Indigestion, belching, acid regurgitation, nausea, hiatal hernia, flatulence, dyspepsia, and colic', 'Suggested Dosage

5 - 20 drops, in a small amount of water, 

3 times daily

Take this formula after each meal for digestive support

Variation is according to individual symptoms', 'Contraindications and Cautions

There are none known.', 'Notations

Digest Ease improves the digestibility of foods and enhances the movement of food through the digestive tract, eliminating the stuffed sensation after eating. This helps to eliminate belching and acid regurgitation.

Gallus, Raphanus &leftpar;radish seed&rightpar;, and Crataegus eliminate food stagnation and accumulation, abdominal fullness and distention &leftpar;bloating&rightpar;. Gallus is highly effective for improving the health of undernourished children &leftpar;nutritional impairment&rightpar; or for children with poor eating habits &leftpar;junk food junkies&rightpar;. Marshmallow root soothes the mucous membranes. Meadowsweet balances the pH of the body and can be used as tea for childrens diarrhea. Cuttlebone, containing calcium carbonate, helps to control acidity, sour belching, and acid regurgitation. Wild Yam, different than the Chinese Wild Yam &leftpar;Dioscorea&rightpar;, is anti-bilious and antispasmodic. It is an excellent herb for colic. Fennel is a stomachic and carminative. Ginger is a warm digestive. Asafoetida, a gum resin from Afghanistan, is a specific remedy for hiatal hernia. It is also used for food stagnation, weak digestion, bowel disorders connected to the emotions &leftpar;such as Irritable Bowel Syndrome&rightpar;, intestinal worms, and parasites. Asafoetida is warm in nature, bitter, and pungent. Because of its potency, a little goes a long ways.

Dietary adjustments are often suggested with this complaint. An overindulgence of meats, starchy foods, dairy, or alcohol can lead to food stagnation. Eat three regular meals &leftpar;calmly sitting at a table and chewing well&rightpar;, organic fruits and vegetables, organic grains, and pure water help the digestive system to function properly. Take time to chew your food, not gulp, and allow adequate time for a relaxed meal. For better digestion, drink after a meal instead of during. Papaya is loaded with digestive enzymes. Eat a small serving of papaya after the main meal for one week to enhance the digestive enzymes.', 'external');
INSERT INTO products VALUES (32, 'Fire Water', 'Diabetes, Excess Appetite', 28, 'Ingredients  &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Yarrow			Achillea Millefolium

Elder Flowers		Sambucus Nigra

Cinnamon twig	Gui Zhi

Peony			Bai Shao Yao

Bayberry			Myrica Cerifera

Oak Bark		Quercus Spp.

Ginger, dried		Gan Jiang

Licorice, baked	Zhi Gan Cao

Jujube			Da Zao

Orange			Citrus Sinensis

Peppermint		Mentha Piperita

Cayenne			Capsicum Annuum', 'Western Therapeutic Actions

Anti-pyretic, anti-inflammatory, circulatory stimulant, warming, astringent, tonic, antiseptic, carminative, expectorant, and diaphoretic', 'Traditional Chinese Medicine

Releases pathogenic influences from the muscle layer and regulates the nutritive and protective qi', 'Sample Indications

Fevers and chills unrelieved by sweating, influenza, aches and pains, headache, aversion to wind, stiff neck, and stuffy nose', 'Suggested Dosage

1 teaspoon in HOT water to induce sweating. If the first cup is successful, do not repeat the dosage. If there is little sweating, repeat the dosage until sweating occurs. 

Usually the dosage does not need to be repeated more than 2 - 3 times. The patient should bundle up in a warm blanket, rest, and allow the sweating to happen. Once sweating starts, stop administering Fire Water.', 'Contraindications and Cautions

Discontinue the consumption of raw, cold, spicy, or greasy foods, coffee, and alcohol while taking this formula.', 'Notations 

Ma Huang, in Oriental Medicine, is used to induce sweating. However, it was excluded from this formula because patients with weaker constitutions cannot tolerate it. Fire Water was designed to induce sweating without having to use this herb. 

The nutritive qi and protective qi normally regulate each other. The protective qi guards the body from external influences &leftpar;virus, bacteria&rightpar; while the nutritive qi nourishes and stabilizes the interior. When the protective qi rises to fend off the attack, fever and chills are the results of this battle. The body is unable to protect the nutritive qi as it is using its energy fighting the external influence. As a consequence the nutritive qi becomes unstable and is unable to contain the fluids in the body. The slight sweating that is experienced is not strong enough to expel the external influences, so the condition does not improve. 

This syndrome is considered wind/cold invading the body because there is usually no thirst. This pattern can also be experienced without an invasion of wind/cold, such as after a serious illness, childbirth, or a patient who has a constitutional weakness. 

The predominant symptoms include a fever, aversion to the wind, and some sweating. The Chinese formula used for this syndrome is widely is called Gui Zhi Tang or Cinnamon Combination.', 'external');
INSERT INTO products VALUES (33, 'Flu Shield', 'Diabetes Excess Urination', 28, 'Ingredients  &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Isatis leaf			Da Qing Ye

Lonicera				Jin Yin Hua

Forsythia			Lian Qiao

Osha				Ligusticum Porteri

Platycodon			Jie Geng

Burdock seed		Niu Bang Zi

Schizonepeta			Jing Jie

Echinacea			Echinacea Angustifolia

Phragmites			Lu Gen

Wild Indigo			Qing Dai

Poke Root			Phytolacca Spp.

Goldenseal			Hydrastis Canadensis

Licorice				Gan Cao

Peppermint			Bo He', 'Western Therapeutic Actions

Anti-inflammatory, analgesic, diaphoretic, anti-pyretic, alterative, anti-viral, anti-bacterial, depurative, and antiseptic', 'Traditional Chinese Medicine

Disperses wind/heat, clears heat, and relieves toxicity', 'Sample Indications

Prophylactic, early stages of influenza, colds, contagious diseases, viral or bacterial infections, sore throats, aches and pains, earaches, and swollen glands', 'Suggested Dosage

1/2  1 teaspoon, in a small amount of water, 

3 times daily

Take 1/2 teaspoon twice daily as a preventative

Variation is according to individual symptoms

Variation is according to individual symptoms', 'Contraindications and Cautions

Use with caution during pregnancy.', 'Notations 

Flu Shield is a modified version of the Chinese classic, Yin Qiao San. Its effectiveness has proven itself for hundreds of years in eradicating common colds, flu and upper respiratory infections. It can be used at a low dosage for preventative measures.

Lonicera and Forsythia are two commonly used herbs in Oriental Medicine for treating contagious diseases, or what they term early-stage warm-febrile disease. A few years ago, China was experiencing a flu epidemic. During this time, Lonicera was almost impossible to purchase in America as the demand for it in China exhausted the supply. Native Americans chew on the roots of Osha and Echinacea during the onset of any contagious disease. In the West, Goldenseal has been revered as one of natures premier anti-infective herbs. In the East, Isatis holds that reverent position. Isatis root and Isatis leaf clear toxic/heat and cool the blood. Isatis root drains the heat. This makes it beneficial for damp/heat conditions such as jaundice. Burdock seed is a detoxicant and especially effective in treating the throat. Its actions of expelling wind/heat are supported by Peppermint. Schizonepeta expels wind/heat or wind/cold and its actions are enhanced by the other wind expelling herbs. Licorice, in combination with Platycodon, helps to relieve inflammations of the throat. Phragmites clears heat from the lungs, generates fluids, and is especially effective during the initial stages of a contagious disease. Wild Indigo and Poke root assist in detoxification and cleansing of the blood and lymph &leftpar;relieves fire toxicity and cools the blood&rightpar;.

A soup made with chicken, onion, garlic, parsley, cayenne, and ginger is the home favorite during the flu season. Drink a bowl regularly for prevention and protect the neck from the winters wind. Increasing the intake of Vitamin C and other antioxidants is a wise decision during the flu season.', 'external');
INSERT INTO products VALUES (34, 'Growing Belly', 'Diabetes Excess Thirst', 28, 'Ingredients  &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Raspberry leaf	Rubus Idaeus

Peony			Bai Shao Yao

Motherwort		Leonurus Cardiaca

Eucommia		Du Zhong

Nettles			Urtica Spp.

Chamomile, Roman	Anthemis Nobilis

Atractylodes		Bai Zhu

Cuscuta			Tu Si Zi

Scute			Huang Qin

Black Haw		Viburnum Prunifolium

Gentian			Gentiana Lutea', 'Western Therapeutic Actions

Nutrient and nerve tonic, astringent, and antispasmodic', 'Traditional Chinese Medicine

Nourishes the blood, supports the spleen, clears heat, and calms a restless fetus', 'Sample Indications

A mild acting tonic with nutritive qualities, specifically for the first and second trimester of pregnancy', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 

3 times daily. 

Take during the first and second trimester of pregnancy

Variation is according to individual symptoms', 'Contraindications and Cautions

Bleeding and spotting during pregnancy can be life threatening. If any health problems persist, seek the advice of a qualified health care practitioner.', 'Notations 

Growing Belly is made upon request, to limit alcohol content. This formula is a mild tonic supporting the first and second trimester of a pregnancy. Women who experience miscarriages could benefit from this formula.

Raspberry leaf is an astringent and uterine and reproductive restorative. It is one of the few botanicals that can be used during the entire length of a pregnancy. The two herbs, Raspberry leaf and Black Haw, work together to help prevent miscarriages. Motherwort is an anti-spasmodic and nervine. It has a calming effect on the spirit, similar to Roman Chamomile. Nettles is a blood tonic and support the nutritive Chinese herbs in this formula. The combination of the Chinese herbs, Peony, Eucommia, Atractylodes, Cuscuta, and Scute help to relax the liver, support the kidney and spleen, and secure the fetus. Gentian is a bitter tonic, supports the blood, and helps to alleviate fatigue. 

It is important to remind the pregnant mother that her body has the higher intelligence and capacity to care for the unborn child in a good way. Taking a high quality multiple vitamin is recommended along with a highly nutritious diet. Equally important, the pregnant mother should avoid alcohol, tobacco, caffeine, and food preservatives to protect the unborn child from these harsh and toxic foods and chemicals. Prescription drugs can be harmful. 

Herbs should only be taken when under the supervision of a qualified health care practitioner. If a pregnant mother has any health concerns about a supplement or drug she has been prescribed, she should contact her health care provider immediately.', 'external');
INSERT INTO products VALUES (161, 'Comfort Remedy', 'Inflammation, Bruising, Pain', 4, 'Ingredients  &leftpar;Homeopathic&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

St. Johns Wort		Hypericum Perforatum

Arnica				Arnica Montana

Comfrey root		Symphytum Officinale

Bryonia				Bryonia Dioica

Aconite				Acontium Napellus

Gelsemium			Gelsemium Sempervirens

Staphisagria			Delphinium Staphisagria', 'Western Therapeutic Actions

Anti-inflammatory, analgesic, anodyne, and antispasmodic', 'Traditional Chinese Medicine

Clears heat, disperses blood stasis, and alleviates pain', 'Sample Indications

Pain, inflammation, and general discomfort following surgery or traumatic injury', 'Suggested Dosage

5 - 20 drops every 2 hours

Reduce dosage as the symptoms subside

Variation is according to individual symptoms', 'Contraindications and Cautions

There are none known.', 'Notations 

Comfort Remedy is a homeopathic remedy. Many people feel lousy after an operation because the anesthesia and surgery disrupted the energy flow patterns of the body. Acupuncture, Shiatsu, Tai Ji, and comprehensive herbal therapy assist in reestablishing the normal and healthy flow of blood and qi &leftpar;energy&rightpar; throughout the entire body. Comfort Remedy is beneficial following any injury or surgery as it supports the healing of the nerves and tissues, and is an anti-inflammatory. It shortens the recovery time and assists in the healing process.

Homeopathic Properties

St. Johns Wort	for nerve injury and pain relief

Arnica		after all types of traumatic injury, falls, blows 

Comfrey root	known as Knit Bone, stimulates the growth of 			bone, tissues and ulcerated surfaces

Bryonia		muscle aches and pains, stitching pain, worse 			with movement, better with rest

Aconite		physical and mental anxiety and fear, acute and 			sudden, does not want to be touched, inflamed

Gelsemium	desire to be quiet, left alone, restores the nerves

Staphisagria 	heals the pain from surgery or bodily insult

Homeopathic remedies are extreme dilutions of different agents, some being herbs. The homeopathic properties are somewhat different than the properties of the full strength herbs. Because of their extremely diluted state, toxic herbs can be found and used in homeopathic pharmacies without any actual toxic effects and are completely safe.', 'external');
INSERT INTO products VALUES (36, 'Belly Be Gone', 'Chrons Disease', 28, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Oats			Avena Sativa

Raspberry leaf	Rubus Idaeus

Tang Kuei		Dang Gui

Leonurus		Yi Mu Cao

Atractylodes		Bai Zhu

Skullcap			Scutellaria Lateriflora

Rehmannia, prep.	Shu Di Huang

Hoelen			Fu Ling

Lindera			Wu Yao

Ladys Mantle		Alchemilla Vulgaris

False Unicorn	Chamaelirium Luteum

Gentian			Gentiana Lutea 

Citrus			Chen Pi

Licorice, baked	Zhi Gan Cao', 'Western Therapeutic Actions

Postpartum tonic, astringent, hormonal balancing, nerve tonic, antispasmodic, styptic, and general tonic', 'Traditional Chinese Medicine

Supplements the qi, nourishes the blood, enriches the yin and yang, regulates the qi, and vitalizes the blood', 'Sample Indications

Tones the uterine muscles, fallen or collapsed uterus, postpartum exhaustion, depression, weak nutritional assimilation, and weak digestion', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

Postpartum difficulties are very common. Women who are depleted are very susceptible to physical and mental breakdowns. It is important to seek qualified help if any signs of difficulty arise.', 'Notations 

Belly Be Gone is made upon request to limit alcohol content. Cnidium and Rehmannia Combination, or Xiong Gui Tiao Xue Yin, was created during the Ming Dynasty, and sets the energetic tone and herbal pattern for our tailored formula. Belly Be Gone is a specific postpartum tonic as it restores balance to the hormones, brings health and vigor back to the mother, and helps prevent postpartum hemorrhaging. In some Chinese hospitals, women are given an herb tea made from Leonurus &leftpar;Yi Mu Cao&rightpar; following childbirth to help the uterus contract and to stop excess bleeding. Leonurus is an important addition to this formula because of this time proven practice.

Oats is a total body restorative as it nourishes and fortifies the blood and qi. Raspberry leaf is an astringent, arrests bleeding, and a reproductive restorative that benefits the uterus.  Ladys Mantle supports Leonurus with its styptic qualities.  Tang Kuei and Rehmannia nourish the blood. Atractylodes, Hoelen, Ginger, and Licorice supplement the spleen and stomach. Skullcap relieves liver stagnation, spasms, insomnia, and agitation. 

A pregnant woman is nourishing two humans, herself and the fetus. This extra demand on the mothers body can make her blood weak and her qi depleted. Postpartum difficulties may arise because the mother can not hold it together anymore due to her exhaustion. Replenishing that which has been given away is critical at this time in order to prevent any further deterioration of her physical and mental health. It is wise to heed to the old adage, an ounce of prevention is worth a ton of salt.', 'external');
INSERT INTO products VALUES (39, 'GI Corrective', 'Bloating Constipation', 28, 'Ingredients  &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Marshmallow		    Althea Officinalis

Cannabis seed	    Huo Ma Ren

Ho Shou Wu		    He Shou Wu

Magnolia bark	    Hou Po

Yellow Dock		    Rumex Crispus

Apricot seed		    Xing Ren

Peony			    Bai Shao Yao

Chih-Shih		    Zhi Shi

Skullcap			    Scutellaria Lateriflora

Rhubarb			    Da Huang

Cascara Sagrada	    Rhamnus Purshiana

Dandelion		    Pu Gong Ying

Aloe Vera		    Lu Hui', 'Western Therapeutic Actions

Hepatic, cholagogue, demulcent, emollient, nervine, detergent, and aperient', 'Traditional Chinese Medicine

Moistens the intestines, drains heat, promotes the movement of qi &leftpar;unblocks the bowels&rightpar;,  and nourishes the yin', 'Sample Indications

Sluggish bowel function, habitual constipation, dry stool, and irregular bowel movements', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

Contraindicated during pregnancy. GI Corrective is draining and purging in nature, so use with caution for patients who are weak or depleted.', 'Notations

GI Corrective utilizes Western herbs with the Chinese formula, Ma Zi Ren Wan or Hemp Seed Pill. GI Corrective is a mild laxative and can be used safely by the young or the old. Constipation can be caused by a number of different factors. GI Corrective focuses on heat-induced dryness in the stomach and the intestines. In Oriental Medicine, when the stomach becomes overly heated for extended periods of time, the heat disrupts the ability of the spleen to disperse the fluids properly. This disruption in the movement of fluids leads to dry intestines and constipation. 

Marshmallow root contains a large amount of mucilage so it is able to moisten the digestive tissues  and reduce gastric hyperacidity &leftpar;clears stomach fire&rightpar;. Heat-treated Cannabis seed is excellent for moistening the intestines and unblocking the bowels. Ho Shou Wu and Peony moisten and nourish the blood. Rhubarb, Chih-shih, and Magnolia bark are commonly used together for purging the intestines. Yellow Dock is a bitter digestive stimulant that relieves stagnation and promotes elimination. Apricot seed is rich in oils and moistens the intestines. Skullcap is a relaxant and relieves constrained liver qi.

The way in which herbs are prepared can significantly change their actions. Aloe Vera, when used in an extraction, is a strong purgative. Aloe Vera, when used as a raw gel, soothes inflammations and clears surface heat. 

Drinking a glass of warm honey water every morning upon rising is an excellent home remedy. Honey redirects the energy downwards. This is why it is used for coughs. It is important to support the client with herbal formulas that address blood and yin deficiency as a follow-up to using GI Corrective.

ü', 'external');
INSERT INTO products VALUES (40, 'GI Mend', 'Stomach Ulcer', 28, 'Ingredients  &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Marshmallow			Althea Officinalis

Atractylodes			Bai Zhu

Slippery Elm 			Ulmus Fulva

Ginseng, Chinese		Ji Lin Ren Shen

Skullcap				Scutellaria Lateriflora

Echinacea			Echinacea Angustifolia

Dioscorea			Shan Yao

Lotus Seed			Lian Zi

Dolichos				Bai Bian Dou

Platycodon			Jie Geng

Goldenseal			Hydrastis Canadensis

Poke Root			Phytolacca Spp.

Cranesbill, American	Geranium Maculatum

Licorice, baked		Zhi Gan Cao

Ginger, fresh			Sheng Jiang', 'Western Therapeutic Actions

Soothing, demulcent, anti-bacterial, anti-viral, astringent, emollient, alterative, antiseptic, and styptic', 'Traditional Chinese Medicine

Supports the spleen and stomach qi, supplements the qi, and dries dampness', 'Sample Indications

Stomach and duodenal ulcers, chronic gastritis, chronic colitis, diarrhea with watery stool, gastric hyperacidity, nausea and vomiting, lack of appetite, and abdominal pain', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

Contraindicated during pregnancy and in cases of high fever, heat from deficiency, or a combination of heat, thirst, and irritability. Absence of thirst is a clear marker for interior cold.', 'Notations

In combination with traditional Western specifics and the adapted Chinese formula, Li Zhong Wan or Regulate the Middle Pill, GI Mend  addresses the digestive disturbances caused by a chronic cold interior condition. In Oriental Medicine, when cold attacks the middle burner &leftpar;stomach and spleen&rightpar;, digestive problems will follow. If the middle burner is not warmed up, this cold will congeal, much like water, and turn into ice. As a consequence, the normal movement of the fluids, which is regulated by the spleen, will be disrupted. Overtime, cold creates stagnation and turns into its opposite, heat. Similar to going outside in the winter when it is freezing cold out and at first you are shivering to the bone. Then, out of nowhere, you become warm. This is the same principle applied to the heat that now occupies the stomach: anything when taken to its extreme &leftpar;cold&rightpar; will convert into its opposite &leftpar;heat&rightpar;. 

Marshmallow and Slippery Elm coat the stomach lining with mucilage, relieving it from dryness and gastric ulceration. Skullcap stimulates digestion, relieves liver and stomach stagnation, and calms the nerves. Ginseng, Atractylodes, Dioscorea, Ginger, and Licorice warm and nourish the middle burner. Poke Root reduces gastric hyperacidity and clears heat. Goldenseal, containing the powerful alkaloid, berberine, is a premier decongestant. This means that it can vitalize the circulation and resolve chronic stagnation, whether it is vascular or digestive. Goldenseal, Poke root, and Echinacea combine to strengthen the cellular tissues that line the mucous membranes. Cranesbill, classified as an astringent with mucostatic and hemostatic properties, benefits damp/cold conditions of the digestive system with symptoms such as diarrhea, peptic and bleeding ulcers, gastric hyperacidity, and hemorrhoids.', 'external');
INSERT INTO products VALUES (41, 'GI Movement', 'Acute Constipation', 29, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Marshmallow			Althea Officinalis

Magnolia bark		Hou Po

Chih-Shih			Zhi Shi

Ho Shou Wu			He Shou Wu

Rhubarb				Da Huang

Cascara Sagrada		Rhamnus Purshiana

Aloe Vera			Lu Hui

Senna				Senna Angustifolia

Dandelion			Pu Gong Ying

Mandrake, American	Podophyllum Peltatum', 'Western Therapeutic Actions

Quick acting purgative, aperient, cholagogue, demulcent, and emollient', 'Traditional Chinese Medicine

Purges heat accumulation, drains qi downward, and promotes the movement of qi', 'Sample Indications

Severe constipation and flatulence, abdominal fullness, and abdominal pain with pressure', 'Suggested Dosage

10 - 30 drops, in a small of water, 

1 - 3 times daily

Discontinue use once the stools have been eliminated.

Addressing the underlying cause for constipation should follow this short term treatment. Consider herbal formulas that are moistening in nature, nourishing to the blood and yin, and supplement the spleen qi.

Variation is according to individual symptoms', 'Contraindications and Cautions

Contraindicated during pregnancy. For weak patients, use with caution and then with additional tonic herbs.

This remedy is for short term use only.', 'Notations

GI Movement treats heat that has accumulated in the center and injured the fluids of the digestive tract. The excess heat creates a dry stool. There are four types of abdominal disharmony in Oriental Medicine: focal distention &leftpar;sensation of obstruction&rightpar;, fullness &leftpar;visible distention&rightpar;, dryness &leftpar;dry stool causing abdominal tenseness&rightpar;, and hardness &leftpar;abdominal pain that increases with pressure&rightpar;. 

The Oriental Medicine theory is to treat the internal excess with purging actions, and the excess heat with cooling actions. GI Movement utilizes traditional Western specifics along with a Chinese formula called, Hou Po San Wu Tang or Three Substance Decoction with Magnolia Bark, to harmonize these energetic imbalances.

Marshmallow root  moistens and soothes the mucous membranes, and relieves digestive inflammations. Magnolia bark, and Chih-Shih resolve the qi stagnation and moves the qi downward. Ho Shou Wu, a blood tonic, moistens the intestines and helps to move the bowels. Rhubarb, a bitter and cooling herb, drains heat and purges accumulations. Cascara Sagrada and Aloe Vera, considered by some herbalists to be a bit milder in action than Rhubarb and Senna, help to drain accumulation and are considered laxatives. Dandelion promotes the flow of bile and is a digestive stimulant. American Mandrake is a purgative, anti-bilious, and helps to relieve liver stagnation.', 'external');
INSERT INTO products VALUES (42, 'GI Soothe', 'Bowel Irregularity', 28, 'Ingredients Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Atractylodes			Bai Zhu

Ginseng, Chinese		Ji Lin Ren Shen

Hoelen				Fu Ling

Marshmallow			Althea Officinalis

Peony				Bai Shao Yao

Skullcap				Scutellaria Lateriflora

Meadowsweet		Filipendula Ulmaria

Slippery Elm 			Ulmus Fulva

Corydalis			Yan Hu Suo

Mume				Wu Mei

Saussurea			Mu Xiang

Pseudoginseng		Tien Chi

Licorice, baked		Zhi Gan Cao

Ginger, dried			Gan Jiang

Goldenseal			Hydrastis Canadensis

Bryonia				Bryonia Dioica', 'Western Therapeutic Actions

Antispasmodic, demulcent, anti-inflammatory, anodyne, nervine, emollient, antiseptic, astringent, and antacid', 'Traditional Chinese Medicine

Supplements the qi of the middle burner, binds up the intestines and stops diarrhea, drains dampness, absorbs seepage, and promotes the movement of qi', 'Sample Indications

Ulcerative colitis, irritable bowel syndrome, leaky gut syndrome, Crohns disease, chronic inflammatory intestinal disorders, and colic', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 

3 times daily

Variation is according to individual symptoms

ü', 'Contraindications and Cautions

Contraindicated for fever, heat from deficiency, or a combination of heat, thirst, and irritability.', 'Notations

GI Soothe combines Western specifics with a Chinese clinical formula, Jian Pi Ling or Strengthen the Spleen Remedy, which is derived from a classic formula, Bu Zhong Yi Qi Wan. Disorders such as ulcerative colitis and irritable bowel syndrome are experienced when there has been chronic weakness in the digestive system. There are many possible causes: inherited weaknesses, chronic bacterial infections, autoimmune diseases, poor eating habits and food choices, or chronic stress and worry warts. 

In Oriental Medicine the spleen controls the digestive system, holds things in their proper place, and assists nutritional assimilation. The spleen influences the stomach, and the large and small intestines. The Earth, in the Five Phases Theory, is represented by the spleen and stomach and their meridian channels. This element assists transitions, whether they be internal or external, such as the transition from night into day, spring into summer, or life style changes. People who have difficulty making transitions in life or digesting life can benefit from herbal formulas like the Eight Wise Ones or Spleen Abundant Life. These formulas have the ability to strengthen the spleen and stomach. 

Healing our digestive system requires a gentle process filled with kindness, acknowledgment, and encouragement. Good nutritional and eating habits, a healthy emotional state of mind, and living with a spiritual practice, assist in maintaining the inner health of the body. 

Healing touch with body work reaps great rewards, and is a healthy way to release lifes tensions and help open the opportunities to experience the sweetness of life.', 'external');
INSERT INTO products VALUES (43, 'Hep C Clear', 'Hepatitis C', 30, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Oldenlandia			Bai Hua She She Cao

Capillaris			Yin Chen Hao

Salvia				Dan Shen

Eclipta				Han Lian Cao

Guduchi				Tinospora Cordifolia

Astragalus			Huang Qi

Peony, red			Chi Shao Yao

Paris				Zao Xiu

Turmeric			Curcuma Longa

Atractylodes			Bai Zhu

Ginseng, Siberian		Ci Wu Jia

Milk Thistle			Silybum Marianum

Ligustrum			Nu Zhen Zi

Schizandra			Wu Wei Zi

Peach Leaf			Prunus Persica 

Fringe Tree Bark		Cheonanthus Virginicus

Licorice, baked		Zhi Gan Cao', 'Western Therapeutic Actions

Detoxicant, decongestant, demulcent, restorative, anti-viral, cholagogue, and hepatic tonic', 'Traditional Chinese Medicine

Clears damp/heat, clears heat, relieves toxicity, breaks up the stagnant qi and disperses blood stasis, supports the spleen, supplements the qi, and nourishes the liver and kidney yin', 'Sample Indications

Hepatitis C, chronic viral infections, liver diseases, and cirrhosis of the liver', 'Suggested Dosage

1  2 teaspoons, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

Consult a qualified health care practitioner for all serious liver disorders. If a patient is receiving interferon treatments for Hepatitis C, relying upon multiple drug therapies, or has a low platelet count, Hep C Clear and Hepato Clear should not be used because of the possibility of contracting interstitial pneumonia. The reason for this is still unknown.', 'Notations

The Institute of Traditional Medicine published a report on some of the herbal formulas being used in China to treat this disorder. The formula that was reported to be most effective is called Qing Tui Fang. Hep C Clear is a modified version of the original formula. Capillaris, similar to Bupleurum, is less drying and gentler on the liver. Eclipta and Ligustrum combine well together to nourish the liver. Oldenlandia and Paris are strong anti-viral agents. Guduchi and Turmeric, Ayurvedic herbs, are well known for their ability to clear liver toxicity. Salvia and Red Peony invigorate the blood and alleviate blood stasis. Milk Thistle, Peach leaf, and Fringe Tree Bark are blood and liver purifiers. Astragalus, Atractylodes, Ginseng, and Licorice support the spleen and supplement the qi. 

A holistic approach supports the healing of liver disorders. This includes dietary guidelines, emotional balancing, and encouragement to develop a spiritual practice. Acupuncture and Shiatsu support the healing process. When all the different modalities are integrated into a persons wellness program, the opportunity for healing is greatly enhanced. It is recommended that all herbal therapies be stopped during interferon treatments. Antioxidants, B complex, Vitamin E, and a cleansing diet support the body during interferon treatments. 

Juicing is highly recommended. A good combination includes carrots, beets, cucumber, celery, garlic, and barley grass. Adding some olive oil is very healing to the liver, as is fish oil.', 'external');
INSERT INTO products VALUES (44, 'Hepato Clear', 'Liver Cleanser', 28, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Codonopsis			Dang Shen

Bupleurum			Chai Hu 

Peony				Bai Shao Yao

Cyperus				Xiang Fu

Scute				Huang Qin

Pinellia				Ban Xia

Licorice, baked		Zhi Gan Cao

Ginger, fresh			Sheng Jiang 

Milk Thistle			Silybum Marianum

Wild Yam			Dioscorea Villosa

Peach Leaf			Prunus Persica 

Fennel				Foeniculum Vulgare

Celandine, Greater	Chelidonium Majus 

Wahoo				Euonymus Atropurpureus', 'Western Therapeutic Actions

Cholalogogue, hepatic, digestive, antispasmodic, carminative, aromatic, and alterative', 'Traditional Chinese Medicine

Regulates the liver qi, harmonizes the liver and spleen, releases lesser yang-stage disorders, and promotes the smooth flow of qi', 'Sample Indications

Digestive disturbances, liver and/or gallbladder pain, sour stomach, gallstones, jaundice, acute viral hepatitis, cirrhosis, common cold with lingering fever, cholesterol, and headaches', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

Cleansing the liver, may in some cases, cause temporary nausea, irritability and alternating fever and chills. If this occurs, the dosage may be reduced. If a patient is receiving interferon treatments for Hepatitis C, relying upon multiple drug therapies, or has a low platelet count, Hepato Clear should not be used.', 'Notations

Hepato Clear is a liver and gall bladder tonic with a broad range of healing possibilities. It promotes the opening of the liver and the flow of bile via the gall bladder ducts and relaxes the muscle and tissue membranes, which alleviates painful spasms. Hepato Clear can help heal toxic liver damage and protect against toxic liver agents. The Chinese herbs used in this formula have been used as folk medicine for generations and is known as Xiao Chai Hu Tang or Minor Bupleurum Decoction. Chinese physicians used this formula extensively for treating lesser yang stage disorders. Lesser yang stage disorders are thought to be half-exterior and half-interior. Classical symptoms include one of the following: alternating fever and chills, bitter or sour taste in the mouth, dry throat, or a sensation of fullness in the chest &leftpar;difficult to take a full breath&rightpar;. The gall bladder can be affected by this disorder and can include one of the following symptoms: nausea, vomiting, heartburn, and reduced appetite. 

Codonopsis is a gentle qi tonic and supports the spleen. Bupleurum releases the qi constrained in the liver and helps to harmonize the liver and spleen when used with the appropriate herbs as in this formula, specifically; Peony, Cyperus, Scute, Pinellia, Licorice, and Ginger. Milk Thistle protects the cells of the liver, a liver decongestant, and is an important herb for liver disorders. Wild Yam relieves constrained qi in the liver, reduces spasmodic cramping, and harmonizes the liver and spleen. Peach leaf and Wahoo are liver decongestants. Fennel supports digestion. Celandine promotes bile production, the detoxification of the liver, and clears the gallbladder.', 'external');
INSERT INTO products VALUES (45, 'Candida Clear', 'Irritable Bowel Syndrome', 28, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Phellodendron	Huang Bai

Pulsatilla		Bai Tou Weng

Marshmallow		Althea Officinalis

Cnidium seed	Che Chuang Zi

Houttuynia		Yu Xing Cao

Codonopsis		Dang Shen

Meadowsweet	Filipendula Ulmaria

Atractylodes, red	Cang Zhu

Calendula		Calendula Officinalis

Horopito		Pseudowintera Colorata

Hoelen			Fu Ling

Euryales			Qian Shi

Goldenseal		Hydrastis Canadensis

Saussurea		Mu Xiang

Licorice, baked	Zhi Gan Cao

Asafoetida		Ferula Asafoetida', 'Western Therapeutic Actions

Demulcent, emollient, alterative, detergent, and anti-fungal

 l', 'Traditional Chinese Medicine

Supports the spleen, supplements the qi, clears heat, and dries dampness', 'Sample Indications

Candida, yeast / fungal outbreak of the digestive tract &leftpar;can include fatigue, headaches, foggy brain, and muscular aches and pains&rightpar;, thrush, leaky gut syndrome, and food allergies', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 

3 times daily', 'Contraindications and Cautions

Contraindicated during pregnancy.', 'Notations 

A weak digestive system can lead to many types of disorders and inflammations. Candida is an overgrowth of yeast, Candida Albicans, usually due to a weakened immune system, excessive use of antibiotics, or lack of beneficial bacteria in the gut. The overgrowth of yeast can travel to other parts of the body including the esophagus, the mouth, and the genital tract. 

Yeast requires moisture and heat to thrive. Oriental Medicine considers candida a damp/heat syndrome. Herbs that treat damp/heat lay the foundation for Candida Clear. An herb that is of particular value in this formula is Horopito. The Maori have used this herb extensively for yeast and fungal infections, whether they be internal or external. Phellodendron drains damp/heat and Pulsatilla clears heat and toxicity. Marshmallow protects the mucous membranes of the digestive tract and helps to relieve the inflammation. Cnidium seed dries the excess dampness. Meadowsweet is an ideal herb for balancing the pH of the body. Asafoetida, from India, relieves food stagnation, bloating, and has anti-spasmodic qualities. It is used as a digestive stimulant, for people who have food allergies, and candida. Goldenseal is and anti-inflammatory and clears damp/heat from the digestive tract.

Yeast feeds off sugar. All types of sugars, including fruit sugars should be eliminated from the diet. Yeast breads and all other yeast products should be temporarily eliminated from the diet. Dairy products, unless organic, feed yeast growth. Probiotics is a beneficial supplement. Lactobacillus Acidophilus rebuilds healthy flora and enhances the immune system. Alkalizing the ph of the body is beneficial and can be done by eating bitter greens daily, seaweed, and miso soup. Add some Oregano to some prepared dishes throughout the week. It has anti-fungal qualities.

With perseverance, this debilitating disorder can be healed.', 'external');
INSERT INTO products VALUES (46, 'Montezuma Match', 'Vomiting And Diarrhea', 29, 'Ingredients&leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Blackberry root	   Rubus Villosus 

Purslane			   Ma Qi Xian

Meadowsweet	   Filipendula Ulmaria

Coptis			   Huang Lian

Scute		           Huang Qin

Saussurea		   Mu Xiang

Echinacea		   Echinacea Angustifolia

Koromiko		   Hebe Salicifolia

Wild Indigo		   Qing Dai

Wild Yam		   Dioscorea Villosa

Ipecacuanha		   Cephaelis Ipecacuanha', 'Western Therapeutic Actions

Anti-viral, anti-bacterial, anti-amoebic, anti-inflammatory, antispasmodic, astringent, antacid, alterative, and carminative', 'Traditional Chinese Medicine

Clears heat, relieves fire toxicity, cools the blood, and drains damp/heat', 'Sample Indications

Diarrhea and vomiting, and all types of dysentery', 'Suggested Dosage

10 - 20 drops, in a small amount of water, 

3 times daily 

Repeat every 1 - 2 hours if needed

Variation is according to individual symptoms', 'Contraindication and Cautions

Contraindicated during pregnancy. Use with caution in cases of cold/deficient spleen and stomach.', 'Notations

Blackberry root is a premier astringent, especially useful when diarrhea is present. Purslane relieves fire toxicity found in dysenteric disorders, especially when due to bacterial infestations. Meadowsweet supports Blackberry root with its astringent qualities and is a digestive aromatic. Coptis and Scute support Purslane by clearing additional damp/heat. Saussurea supports the normalization of the digestive functions. Echinacea counters the bacterial infection, if any. Koromiko, a Maori herb, is a blood purifier, promotes bile production, and is an astringent. Wild Indigo clears heat and relieves toxicity and is supportive of Echinacea. Wild Yam helps to alleviate cramps and intestinal spasms. Ipecacuanha, in minute dosages, is an anti-emetic.  

Movement Makes Worse can be beneficial if the diarrhea or vomiting is persistent and stubborn. If the digestive tract and bowels continue to be irritable following an infection, GI Soothe or Slippery Elm Food help to normalize the stool. After this type of infection it may be useful to follow-up with a general tonic if there is any weakness or fatigue, along with a probiotic; Chi Rebound, Spleen Abundant Life, or Immuno Rebound could be considered

Montezuma Match may be taken as a preventative when traveling to foreign countries where the water and food could be contaminated. As a preventative, take 10 drops, 3 times daily. Drink bottled water. Wash all fruits and vegetables in a bowl of bottled water and a pinch of vinegar. This eliminates any bacterial contamination on the produce.', 'external');
INSERT INTO products VALUES (47, 'Slippery Elm Food', 'Heals Digestive Tissues, Ulcers', 31, 'Ingredients&leftpar;Herbal powders&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Slippery Elm		Ulmus Fulva

Arrowroot		Maranta Arundinacea', 'Western Therapeutic Actions

Inflammation of the digestive tract, duodenal and stomach 

ulcers, colitis, and ulcerative colitis', 'Traditional Chinese Medicine

Nourishes the stomach yin, clears heat, and generates fluids', 'Sample Indications

Inflammation of the digestive tract, duodenal and stomach 

ulcers, colitis, and ulcerative colitis', 'Suggested Dosage

1/2 - 1 teaspoon, mixed in a small amount of water, 3 times daily

Variation is according to individual symptoms

ü', 'Contraindications and Cautions

If the individual is sensitive to lactose, Slippery Elm Soy Powder is the appropriate alternative.', 'Notations

Slippery Elm Powder soothes and promotes healing to the internal mucous membranes that it comes into contact with. It is easily digested by even the weakest of digestive systems, the frail, and the malnourished. Slippery Elm will improve nourishment and impart strength to anyone who ingests it. 

Slippery Elm makes one of the finest poultices of all the botanicals. It treats inflamed tissues, ulcers, wounds, burns, boils, and all skin disorders. Slippery Elm soothes the tissues, reduces the inflammation, and promotes healing of the mucous membranes. 

Nutritionally, Slippery Elm is equal to oatmeal and can be used for sickly infants, the nutritionally impaired, and those suffering from weight loss due to illness. It is a demulcent, emollient, diuretic, and pectoral. Because of its moistening qualities and soothing effect on inflamed digestive tissues, Slippery Elm functions in a similar manner to the Chinese herb, Dendrobium &leftpar;Shi Hu&rightpar;. Arrowroot is a nutritive and demulcent, supporting Slippery Elm in this formula.', 'external');
INSERT INTO products VALUES (187, 'Milk Drops', NULL, 7, 'Ingredients &leftpar;Herbal Extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Holy Thistle	  Cnicus Benedictus

Skullcap		  Scutellaria Lateriflora

Shatavari	  Asparagus racemosa

Astragalus	  Huang Qi

Tang Kuei	  Dang Gui

Sesame seed	  Hei Zhi Ma

Goats Rue	  Galega Officinalis

Fennel		  Foeniculum Vulgare

Ginger, fresh	  Sheng Jiang', 'Western Therapeutic Actions

Galactagogue &leftpar;milk promoting&rightpar;, nervine, carminative, and stomachic', 'Traditional Chinese Medicine

Promotes lactation and unblocks the blood vessels, nourishes the blood, and supplements the qi', 'Sample Indications

Lack of milk production following childbirth', 'Suggested Dosage

5 - 20 drops, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

There are none known.', 'Notations 

Milk Drops benefit Mothers who are having a difficult time producing enough milk for their newborn infant. Holy Thistle, Goats Rue, and Fennel are time proven galactagogues. Skullcap, a relaxant, relieves qi congestion in the chest area. Shatavari is a female hormone balancer and stabilizer. Astragalus and Tang Kuei combine together to promote the production of fluids. Sesame seed nourishes the liver and kidneys and promotes lactation. Fennel and Ginger, warm in nature, promote the smooth functioning of the stomach.

For breast congestion and pain, a *Chamomile fomentation may be applied to the affected area, as well as taken as a tea. 

Chamomile Fomentation: Infuse 1 oz of Chamomile flowers in a pint of boiling water; wet small cloth, and apply as hot as can be tolerated onto the breast, cover with a dry towel, repeat as needed. 

Taken internally as a tea: 

1 tablespoonful per teapot, drink a cupful 3 - 5 times daily.

*Chamomile fomentation: See External Applications', 'internal');
INSERT INTO products VALUES (48, 'Stomach Ease', 'Nausea Motion Sickness', 29, 'Ingredients&leftpar;Homeopathic&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Ipecacuanha		Cephaelis Ipecacuanha', 'Western Therapeutic Actions

Anti-nauseant and specific', '', 'Sample Indications

Nausea, vomiting, motion sickness, morning sickness, dyspepsia, and colic', 'Suggested Dosage

5 -15 drops, in a small amount of water, 

3 times daily

Variation is according to individual symptoms

ü', 'Contraindications and Cautions

There are none known.', 'Notations

Stomach Ease is a homeopathic remedy. 

There are two types of Ipecac preparations:

Standard: The Portuguese, who had invaded South America, were shown the medicinal value of this herb by the friendly indigenous peoples who had inhabited that territory for generations. The Portuguese saw how it would make people vomit and named it Caephalis Ipecacuanha, meaning sick-making plant. Ipecacuanha is made into a syrup and used in allopathic medical practice to induce vomiting in case of accidental poisoning. The substance in Ipecac, called cephaeline, irritates the stomach and causes vomiting. Syrup of Ipecac is considered a safe drug to treat poisoning and is often very effective.

Homeopathic remedy: Ipecacuanha is a homeopathic remedy made from Ipecac by a process of dilution and succussion &leftpar;shaking&rightpar;. In contrast to syrup of Ipecac, it is given to relieve vomiting. In a homeopathic preparation, Ipecac works in just the opposite direction as the standardized preparation.

Nausea can be caused by a cold condition of the stomach. Ginger, Cardamon, or Fennel tea can be helpful as they are warming to the digestive system. Avoiding raw or fried foods, cold liquids and sweets will help the stomach. Rebuild the strength of the stomach by eating a warm breakfast, such as cooked cereal, cooked apples, or miso soup. For an acidic stomach, lemon juice has an alkalizing effect on the pH of the body. Eating small regular meals in a calm setting and chewing the food well is helpful to those who suffer from a weak digestive system.', 'external');
INSERT INTO products VALUES (49, 'Baby Belly', 'Baby Colic', 29, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Fennel			Foeniculum Vulgare

Meadowsweet	Filipendula Ulmaria

Wild Yam		Dioscorea Villosa', 'Western Therapeutic Actions

Carminative, antispasmodic, anti-bilious, and digestive', 'Traditional Chinese Medicine

Supplements the stomach qi and regulates the middle burner', 'Sample Indications

Acute baby colic and tummy upset', 'Suggested Dosage

5 - 15 Drops, in a small amount of water, 

3 times daily 

This formula can be administered in a baby''s formula bottle or on its own.

Variation is according to individual symptoms', 'Contraindications and Cautions

There are none known. Baby Belly can be used by all ages.', 'Notations 

Baby Belly is made upon request, with no alcohol. Baby Belly has been used as a curative and as a preventative to help maintain healthy digestion in infants. If the infant is breast fed, the mother should avoid heavy rich foods, spices, and foods that may cause gas &leftpar;cabbage family or beans&rightpar;. The mother should eat in a calm setting and reduce her own stress level.  A gentle massage along both sides of the spine of the baby &leftpar;bladder meridian&rightpar; and down the stomach meridian has cured many difficult cases.

Fennel has a broad range of functions and is supportive to the digestive, respiratory, and renal systems. Fennel is a warm digestive and carminative and its gentle nature makes it suitable for children. Meadowsweet, well-suited for the young, elderly, and those with sensitive stomachs, counteracts gastric acidity and soothes any inflammation of the digestive tract. Wild Yam harmonizes the middle burner &leftpar;liver/spleen&rightpar; and is a digestive relaxant. It benefits digestive disturbances such as colic, irritable bowel syndrome, stomach cramps and spasms.

Meal time is prayer time, a time to give thanks, gratitude, and appreciation for everyone who prepared the meal. A teaching given from the Oneida Tradition states that when we pray before our meals and offer food to the ancestors, our children and the future generations will never go hungry.', 'external');
INSERT INTO products VALUES (51, 'Baby Fire Drops', 'Baby / Child Fever', 29, 'Ingredients &leftpar;Homeopathic&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Aconite			Acontium Napellus

Bryonia			Bryonia Dioica

Gelsemium		Gelsemium Sempervirens

Belladonna		Atropa Belladonna', 'Western Therapeutic Actions

Antipyretic, anti-inflammatory, and analgesic', 'Traditional Chinese Medicine

Clears heat, relieves toxicity, and dispels wind', 'Sample Indications

Fever and feverish conditions from any cause &leftpar;such as coughs, colds, flu, teething, or earache&rightpar;', 'Suggested Dosage

5 - 20 drops, in a small amount of water, every 30 minutes

Reduce frequency of dose as the fever subsides and a normal temperature is restored.

Variation is according to individual symptoms', 'Contraindications and Cautions

Baby Fire Drops is intended for short term use only. Fever may be a sign of a serious illness, if symptoms persist seek professional medical advice.', 'Notations 

Baby Fire Drops is a homeopathic remedy and is made upon request, with no alcohol. Use Jade Screen Defense after the fever/infection has cleared or for recurring colds/infections.

Homeopathic Properties

Aconite		anti-inflammatory, symptoms that have sudden 			onset with fever, anguish of body and mind

Bryonia		aches and pains in various muscles, irritable

Gelsemium	symptoms that have hot, flushed face, desires to 		be left alone, sore throat, tonsillitis

Belladonna	symptoms that have hot, red skin, flushed face, 			throbbing and burning

A *Tofu Plaster applied to the forehead is an excellent home remedy in bringing down fevers. Give the baby plenty of fluids during feverish conditions.

*Tofu Plaster: See External Applications', 'external');
INSERT INTO products VALUES (52, 'Baby Fire Powder', 'Baby / Child Fever', 33, 'Ingredients 

&leftpar;Homeopathic Biochemic Tissue Salts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Ferrum Phosphate

Magnesium Phosphate

Calcium Phosphate

Potassium Chloride', 'Western Therapeutic Actions

Antipyretic, nutritive, antispasmodic, decongestant and analgesic', 'Traditional Chinese Medicine

Clears heat, relieves toxicity, and dispels wind', 'Sample Indications

Fever and feverish conditions from any cause &leftpar;such as coughs, colds, flu, teething, or earache&rightpar;', 'Suggested Dosage

Dissolve 1/4 teaspoon of powder, directly on the tongue, every 30 minutes 

Reduce the frequency of dose as the fever subsides and a normal temperature is restored.', 'Contraindications and Cautions

Baby Fire Powder is intended for short term use only. Fever may be a sign of a serious illness, if symptoms persist seek professional medical advice.', 'Notations 

Baby Fire Powder is made from Biochemic Tissue Salts. It may help reduce the pain and discomfort of most common childhood ailments. This formula is often equally effective for adults. Use Jade Screen Defense after the fever/infection has cleared or for recurring colds/infections.

Biochemic Tissue Salts

Ferrum Phosphate

	Used for inflammation on the skin, fevers, sore throat, 		coughs, chills, and colds 

Magnesium Phosphate

	Used to relieve pain, acute spasms, hiccups, and colic

Calcium Phosphate

	Use for poor circulation, chilblains, indigestion, anemia, 		convalescence, and teeth problems

Potassium Chloride

	Used for respiratory ailments such as asthma, bronchi		tis, catarrh, colds, tonsillitis, and sore throat

A *Tofu Plaster applied to the forehead is an excellent remedy in bringing down fevers. Give the baby plenty of fluids during feverish conditions.

*Tofu plaster: See External Applications', 'external');
INSERT INTO products VALUES (77, 'Blood Rebound', 'Anemia, Tire Easily, Chemotherapy', 28, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Nettles			Urtica Spp.

Millettia			Ji Xue Teng

Salvia			Dan Shen

Astragalus		Huang Qi

Tang Kuei		Dang Gui

Rehmannia, prep.	Shu Di Huang

Deer Antler		Lu Rong

Gynostemma		Jiao Gu Lan

Comfrey root	Symphytum Officinale

Cnidium			Chuan Xiong

Saussurea		Mu Xiang

Gentian			Gentiana Lutea', 'Western Therapeutic Actions

Blood tonic, nutritive tonic, and astringent', 'Traditional Chinese Medicine

Nourishes the blood, supplements the qi, vitalizes the blood, and promotes the movement of qi', 'Sample Indications

Anemia, iron deficiency, bone marrow suppression, leukopenia, fatigue, and chronic pain from internal injury', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

Contraindicated during the acute stages of any illness such as colds and influenza &leftpar;external pathogenic influence&rightpar;. If the patient has a constitutional spleen qi deficiency &leftpar;weak appetite, bloating, tendency towards loose stool&rightpar;, Blood Rebound requires the support of herbs that nurture the middle burner.', 'Notations

The nourishment of every cell in the body depends on the quality and vitality of the blood. Blood Rebound is a useful supplement for general vitamin and mineral depletion, and provide vitality to the whole system. Blood Rebound follows the pattern of Dang Gui Ji Xue Teng Tang or Tang Kuei and Millettia Combination, which addresses blood and qi deficiency accompanied by blood stagnation. This Chinese formula was developed for treating injuries, and more recently, has been adapted to help support the production of blood cells and strengthen the bone marrow. Replenishment is critical when undergoing the various depleting cancer therapies.

Oriental Medicine states, for exhaustion of blood, supplement the qi. Astragalus, Deer Antler, and Gynostemma have been added to this formula to supplement the qi. Nettles nourishes the liver and blood, and is classified as a blood restorative and nutritive. Millettia is considered a blood tonic and in combination with Salvia, vitalizes the blood. Millettia, Salvia, Astragalus, and Tang Kuei are being used for bone marrow suppression and leukopenia, which is often experienced during cancer therapies. Because of the blood vitalizing aspect of Blood Rebound, numbness and pain can be alleviated. 

Chlorophyll, found in all green vegetables, is essential for healthy blood building. Wheat grass, barley green, spirulina, and blue green algae are widely used for maintaining vital, healthy blood. Mineral deficiency often accompanies blood deficiency. Seaweed is unsurpassed in mineral content and is an important dietary supplement.', 'external');
INSERT INTO products VALUES (53, 'Diaper Rash Cream', 'Diaaper Rash', 15, 'Ingredients &leftpar;Herbal Extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Calendula		        Calendula Officinalis

Chickweed		Stellaria Media

Lithospernum		Zi Cao

Tang Kuei		        Dang Gui

Marshmallow		Althea Officinalis

Beeswax

Olive Oil', 'Western Therapeutic Actions

Antipruritic, antiseptic, anti-fungal, anti-inflammatory, demulcent, and emollient', 'Traditional Chinese Medicine

Clears heat and nourishes the blood', 'Sample Indications

Diaper rash, dermatitis, chapped skin, and general skin irritations', 'External Application

Apply liberally to the affected areas, after each change of diaper. 

Change the diaper frequently whenever there is any sign of skin irritation due to dampness.', 'Contraindications and Cautions

There are none known. Change diapers more frequently and let the baby air out occasionally. If washable cotton diapers are being used, be sure to use a laundry soap that is free of scents.', 'Notations 

Dietary changes by the nursing mother may be required if the problem persists. Alkalize the blood by eating fewer acidic foods and fruit juices. Twig tea &leftpar;bancha or kukicha&rightpar; and miso soup help to alkalize the bodies pH, along with chewing your food better. Refer to the *Acid  Alkaline Food Chart for a list of foods.

Calendula is an anti-inflammatory and antiseptic. It is a wonderful herb for healing chapped or burned skin. Chickweed, that abundant garden weed, is a demulcent and refrigerant and helps to heal chapped skin, skin ulcers, and other skin afflictions. Lithospernum clears heat and cools the blood. Tang Kuei nourishes the skin and Marshmallow root promotes tissue repair.

*Acid  Alkaline Food Chart: See Appendix', 'external');
INSERT INTO products VALUES (54, 'Teething Drops', 'Teething', 7, 'Ingredients &leftpar;Homeopathic&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Chamomile		Matricaria Recutita', 'Western Therapeutic Actions

Anti-inflammatory, soothing, antispasmodic, carminative, gentle sedative, and specific', 'Traditional Chinese Medicine

Clears heat, dispels wind, and calms the spirit', 'Sample Indications

For teething babies, especially those that become irritable, fractious, and difficult to deal with when they are in pain. These infants often display one reddened cheek.', 'Suggested Dosage5 - 20 Drops, in a small amount of water, 

3 - 5 times daily 

This remedy can be administered in a baby''s formula bottle or on its own.

Variation is according to individual symptoms', 'Contraindications and Cautions

Teething Powder differs from Teething Drops in that the former treats the infant that is more at ease with teething and its discomfort. Both remedies may be combined.', 'Notations

Teething Drops is a homeopathic remedy.

In homeopathy, the remedy Chamomilla is prepared from German Chamomile, and is used mainly for pain relief to teething babies.

This remedy is made upon request, with no alcohol. 

A *Tofu Plaster applied to the forehead is an excellent remedy in bringing down fevers. Give the baby plenty of fluids during feverish conditions.

*Tofu plaster: See External Applications', 'external');
INSERT INTO products VALUES (55, 'Teething Powder', 'Teething', 33, 'Ingredients &leftpar;Homeopathic Biochemic Tissue Salts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Calcium Fluoride

Magnesium Phosphate

Calcium Phosphate

Ferrum Phosphate

Silica', 'Western Therapeutic Actions

Antispasmodic, anti-inflammatory, anodyne, and analgesic', 'Traditional Chinese Medicine

Clears toxic heat and dispels wind', 'Sample Indications

For teething infants, with inflamed, red sore gums. It especially suits those infants who bare their challenge stoically and do not complain or get irritable with the pain.', 'Suggested Dosage

Dissolve 1/4 teaspoon of powder, directly on the tongue, every 30 minutes 

Reduce the frequency of dose as the fever subsides and a normal temperature is restored.', 'Contraindications and Cautions

Teething Powder differs from Teething Drops in that it treats the infant that is more at ease with teething and its discomfort. Both remedies may be combined.', 'Notations

Teething Powder is made from Biochemic Tissue Salts.

Calcium Fluoride

	Helps to promote elasticity of the tissues

Magnesium Phosphate

	Nerve and muscle fiber nutrient and relieves pain

Calcium Phosphate

	Strengthens bones and teeth and enhances circulation

Ferrum Phosphate

	Helps to oxygenate the body and anti-inflammatory

Silica

	Detoxicant and blood purifier

A *Tofu Plaster applied to the forehead is an excellent remedy in bringing down fevers. Give the baby plenty of fluids during feverish conditions.

*Tofu plaster: See External Applications', 'external');
INSERT INTO products VALUES (56, 'Worming Drops', 'Intestinal Parasite', 7, 'Ingredients &leftpar;Herbal Extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Black Walnut			Juglans Nigra

Torryea seed			Fei Zi

Tansy 				Tanacetum Vulgare

Wormwood			Artemisia Absinthium

Wild Carrot 			Daucus Carota

Polygonum			Bian Xu

Stemona				Bai Bu

Wormseed			Chenopodium Ambrosiodes

Cloves				Ding Xiang', 'Western Therapeutic Actions

Vermifuge, anthelmintic, and vermicide specific', 'Traditional Chinese Medicine

Kills parasites', 'Sample Indications

Kills parasites &leftpar;pinworms, roundworms, hook worms and tapeworms&rightpar;', 'Suggested Dosage

5 - 20 drops, in a small amount of water, before going to bed. 

It is recommended that this treatment be continued for at least 2 weeks &leftpar; 10 - 14 days being the life-cycle of most intestinal worms&rightpar;. 

It is important, to ensure efficacy of this formula, that the patient has a bowel movement the morning after taking the dosage.

Variation is according to individual symptoms

ü', 'Contraindications and Cautions

Contraindicated during pregnancy. This formula is non-toxic, slightly laxative, and will not harm the stomach qi.', 'Notations

Worming Drops are designed to clear intestinal infestations and are effective with most types of worms. Chewing raw pumpkin seeds daily will help to clear infestation. Avoid sugars, alcohol, caffeine, and fried foods during a worming program. Wash hands thoroughly and change underwear daily. A glass of warm water with a teaspoon of sesame oil in the morning will help the bowels to move.

Black Walnut promotes bowel movement and detoxification. It is a detergent with anti-parasitic actions. Torryea seed kills a broad spectrum of parasites, has a laxative effect, and non-toxic. Tansy is an excellent vermifuge, alleviates cramps and spasms, and combines well with Black Walnut in expelling parasites. Wormwood, as its name refers, expels worms. It is a vermifuge, restorative and a bitter digestive with cooling and draining qualities. Wild Carrot is a deobstruent, opens the natural passages of the body. Polygonum is draining, kills parasites, and alleviates troublesome itching. Stemona, an expectorant, has the ability to expel parasites. Wormseed is a vermifuge and expels intestinal worms. Cloves direct the qi downward, alleviates abdominal pain, and stops vomiting.

A daily diet that contains organic grated carrots and/or grated garlic assists in expelling worms and parasites. 

Pumpkin seeds contain an amino acid,cucurbitin, which kills worms and parasites. Pumpkin seeds have been traditionally used in Mexico to kill tapeworms. Eat three to four tablespoons a day and chew them really well.

We recommend that you rebuild the healthy intestinal bacteria flora by taking a probiotic, such as yogurt or acidophilus, for one month following this cleansing formula.', 'external');
INSERT INTO products VALUES (71, 'Letting Go Remedy', 'Hanging On', 4, 'Ingredients &leftpar;Flower Essences&rightpar;

Honeysuckle

Walnut

Holly

Chicory

Mimulus', 'Western Therapeutic Actions

Assists in the letting go process from an event in the past, whether it is physical or emotional', '', 'Sample Indications

Struggling with letting go of an emotional tie, and knowing it is holding you back', 'Suggested Dosage

5 drops, directly onto the tongue, 3 times daily, or more frequently if needed

Letting Go Remedy can be repeated every 30 minutes during times of stress and repetitive thought patterns.

Variation is according to individual symptoms', 'Contraindications and Cautions

Contact a licensed psychiatrist if extreme emotional conditions persist.', 'Notations

Letting Go Remedy addresses the emotional and psychological aspects of clutching onto something, whether it is a thing, person, or event. It reveals our inability to surrender and our attachment to our thoughts. We have over-identified with the events of our life. This creates anxiety, stress, and turmoil. Letting go means surrender to this present moment and bring your awareness to the now. Take a deep breath and say yes to it all!

                                                       Flower Essences

                                                            Key words

Honeysuckle

	Dwells on the past, nostalgic, homesick

Walnut

	Oversensitive to others and ideas, link-breaker

Holly

	Hatred, jealousy, envy, suspicious', 'external');
INSERT INTO products VALUES (57, 'Addict Free', 'Calms Cravings', 28, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Oats			Avena Sativa

Cinnamon twig	Gui Zhi

Peony			Bai Shao Yao

Bacopa			Bacopa Monnieri

Albizzia bark		He Huan Pi

Biota			Bai Zi Ren

Dragon bone		Long Gu

Oyster shell		Mu Li

Tang Kuei		Dang Gui

Ginseng, Siberian	Ci Wu Jia

Lotus seed		Lian Zi

Mistletoe		Viscum Album

Milk Thistle		Silybum Marianum

Motherwort		Leonurus Cardiaca

Licorice			Gan Cao', 'Western Therapeutic Actions

Restorative, nutritive, nervous sedative, and liver decongestant', 'Traditional Chinese Medicine

Restrains the essence, suppresses rebellion, regulates and 

harmonizes the yin and yang, and quells reckless fire', 'Sample Indications

	Psychological

Alcoholism, drug and narcotic addictions, workaholic, sex addict, chronically constrained, compulsive, and neurotic

	Physical

Intolerant to temperature changes, day or night sweats, insomnia with dream disturbed sleep, dizziness, palpitations, cold and constrained lower abdomen, weak lower body, and loss of hair', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 

3 times daily. Higher dosages may be required at the beginning stages of withdrawal.

Variation is according to individual symptoms', 'Contraindications and Cautions

Contact a licensed psychiatrist if extreme emotional conditions persist. Addict Free is most suited for a patient who is blood and qi deficient, yin deficient, unstable yang, and internal cold.', 'Notations 

Addict Free, similar to the Chinese formula, Gui Zhi Jia Long Ju Mu Li Tang or Cinnamon and Dragon Bone Combination, addresses the depletion of essence, the disruption of the yin and yang balance, and an agitated heart. In Oriental Medicine, addictions, or any negative behavior that exhibits itself excessively over time, destroy the intimate relationship and balance of yin &leftpar;water&rightpar; and yang &leftpar;fire&rightpar;. When the communication between the heart &leftpar;fire&rightpar; and kidney &leftpar;water&rightpar; is lost, our behavior can become rebellious, as if the water is drowning the fire, or the fire is vaporizing the water. In other words, they are inadvertently destroying each other, much the same way addictions destroy our lives. Addict Free assists in the healing process and helps resolve the inner conflicts and battles. 

Oats &leftpar;wild&rightpar;, a premier nutritive and restorative, has proven to facilitate the withdrawal from addictive substances, such as tobacco and opiates. Cinnamon twig and Peony are used to restore the communication between the heart and kidneys. Bacopa, a nervine, improves concentration and memory. Albizzia, Biota, Lotus seed, and Motherwort combine to calm the spirit. Dragon bone and Oyster shell help to anchor the spirit, which keeps anxiety and panic from welling up. Siberian Ginseng is an adaptogenic and helps to restore the inner core. Tang Kuei nourishes the blood and calms as it enters the heart channel. Mistletoe is a nervine and helps to relieve stress. Milk Thistle is a hepatic and detoxicant. Licorice harmonizes the formula.', 'external');
INSERT INTO products VALUES (58, 'Bend Like Bamboo', 'Edgy, Rigidity', 28, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Bupleurum		    Chai Hu

Tang Kuei		    Dang Gui

Peony		    	    Bai Shao Yao

Codonopsis		    Dang Shen

Gardenia		    Zhi Zi

Salvia			    Dan Shen

Albizzia bark		    He Huan Pi

Cyperus			    Xiang Fu

Moutan			    Mu Dan Pi

Licorice, baked	    Zhi Gan Cao

Ginger, fresh		    Sheng Jiang

Peppermint		    Bo He', 'Western Therapeutic Actions

Mediates the liver and spleen, digestive, nervine, and calming', 'Traditional Chinese Medicine

Regulates the liver qi, supports the spleen, clears heat, and calms the spirit', 'Sample Indications

Psychological

Rigidity &leftpar;stubborn&rightpar;, narrow-minded, stuck in a rut, depressed, and agitated

	Physical

Muscular tension, teeth grinder, insomnia, and dream disturbed sleep patterns', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

Use with caution for patients with a constitutional qi and yang deficiency &leftpar;exhaustion, cold, and a weak lower body&rightpar;.', 'Notations 

Bend Like Bamboo follows the pattern of many of the herbal formulas that address the disruption of the flow of qi through the liver which can cause digestive disturbances, emotional instability, and sleeping disorders. Bend Like Bamboo calms, relaxes, and allows for greater flexibility on lifes journey. 

In Oriental Medicine, chronic stress and worry disables the liver, exhausts the spleen qi, excites the heart and eventually weakens the kidney/liver yin. Bupleurum and Peppermint are frequently used together in dealing with emotional depression. Bupleurum releases constrained liver qi. Peppermint supports Bupleurum as it releases the excess heat. Peony and Tang Kuei help to soften the persons temperament. Codonopsis and Licorice supplements the qi. Gardenia gently drains heat trapped from a congested liver. Albizzia bark nourishes the heart and calm the spirit. Salvia calms the spirit and enhances circulation. Ho Shou Wu nourishes the blood and essence. Cyperus is used when dealing with constrained and suppressed emotions.

Lifestyle changes may be appropriate. Meditation, counseling, and physical exercise help to release the emotional tension. Learning to surrender to the life and go with the flow might be the lessons with this syndrome. 

For patients who have sensitive constitutions, begin taking this formula at a lower dosage and gradually increase it if necessary. Consider combining Bend Like Bamboo with a kidney tonic such as Fortify Will, Kidney Long Life, or Strong Back if the patient is very depleted, cold, and has no will power.', 'external');
INSERT INTO products VALUES (59, 'Cinnamon Harmony', 'Anti-Depressant, Prozac Alternative', 28, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Tang Kuei			Dang Gui

Ginseng, Siberian		Ci Wu Jia

Cinnamon twig		Gui Zhi

Peony				Bai Shao Yao

Cyperus				Xiang Fu

Albizzia bark			He Huan Pi

Pinellia				Ban Xia

Scute				Huang Qin

Burdock root			Arctium Lappa

Skullcap				Scutellaria Lateriflora

Bupleurum			Chai Hu

Barberry				Berberis Vulgaris

Ginger, dried			Gan Jiang

Licorice, baked		Zhi Gan Cao', 'Western Therapeutic Actions

Adaptogenic, nutritive, nervine, hepatic, alterative, and digestive', 'Traditional Chinese Medicine

Harmonizes the nutritive and protective qi, relieves the liver, 

and supports the spleen', 'Sample Indications

Emotions fluctuate between highs and lows, hypersensitive, anxiety with depression, and calm facade with inner turmoil, especially anger

	Physical

Chronic muscular tension, joint or body ache, body temperature fluctuates between hot and cold, and digestive disorders', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 

3 times daily

Variation is according to individual symptoms.', 'Contraindications and Cautions

Contraindicated for high blood pressure, warm febrile diseases, and pregnancy.', 'Notations 

Cinnamon Harmony, is based on a Chinese formula, Chai Hu Gui Zhi Tang or Bupleurum and Cinnamon Combination, which promotes harmony and balance. Patients who have chronic stress, work too much, and suffer from burn-out &leftpar;including in bed&rightpar;, usually fit this pattern well. 

Anger or depression, excessive worry, and a turbid life feed this disharmony. There is too much of something or too little of something else, with the inability to break the pattern. A turbulent roller coaster ride becomes the life style. 

Oriental Medicine calls this condition, half-exterior and half-interior. Emotionally speaking, this can be interpreted as someone with a calm facade and inner turbulence, or true disharmony. They appear warm one minute and cold the next.

Bupleurum is commonly used in liver disorders. It is used for restoring the normal function of the liver and gallbladder, and to clear interior heat. It has a drying nature so it should be used with some caution with yin deficient &leftpar;dry&rightpar; clients. When combined with Cyperus, the constrained energy is released creating a more calm feeling. Cinnamon twig and Peony combine to harmonize the exterior with the interior. Albizzia bark is calming and excellent for pent up emotions. Barberry, somewhat similar to the Chinese herbs Coptis and Phellodendron, helps to relieve the stagnant energy and drain the damp/heat caused by an uptight liver that is emotionally under duress.  Pinellia resolves phlegm and strengthens the function of the spleen. It is assisted by Siberian Ginseng, Ginger, and Licorice.', 'external');
INSERT INTO products VALUES (60, 'Eight Wise Ones', 'Focus, Perseverance', 28, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Oats				Avena Sativa

Atractylodes			Bai Zhu

Skullcap				Scutellaria Lateriflora

Hoelen				Fu Ling

Ginseng, Chinese		Ji Lin Ren Shen

Gentian				Gentiana Lutea

Chamomile, Roman	Anthemis Nobilis

Licorice, baked		Zhi Gan Cao', 'Western Therapeutic Actions

Restorative, nutritive, digestive, and nervine', 'Traditional Chinese Medicine

Supplements the qi, supports the spleen, breaks up stagnant qi, and calms the spirit', 'Sample Indications

Psychological

Overly self-conscious, compulsive, overworked, stressed, and burdened by the demands of life

	Physical

Indigestion, chronic digestive disorders, fatigue, lethargy, and nervous exhaustion', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 

3 times daily. 

Variation is according to individual symptoms', 'Contraindications and Cautions

Modify this formula if the patient has a high fever, heat from deficiency, or a combination of heat, thirst, and irritability.', 'Notations 

The herbal combination of Atractylodes, Hoelen, Ginseng, and Licorice &leftpar;baked&rightpar; was created by Master Chen Shi-wen, called Si Jun Zi Tang, or Soup of the Four Gentlemen in ancient China, around 1150 A.D.. It was subsequently expanded about 100 years later to Soup of the Six Gentlemen during the Xue Ji Ming Dynasty. The two herbs added to the original four are Citrus &leftpar;Chen Pi&rightpar; and Pinellia &leftpar;Ban Xia&rightpar;. This addition made the formula more phlegm resolving than the original formula. 

Eight Wise Ones focuses on supporting the middle burner &leftpar;stomach and spleen&rightpar;, improving nutritional assimilation, and calming the spirit. Modern times has created an enormous amount of stress, with peoples nerves on edge. Due to this fact, this formula utilizes the ancient concept, health begins with a well functioning digestive system, and complements the classic formula with nervines and calming herbs. 

Oats and Skullcap are excellent nutritive tonics and nervines. Skullcap also relieves constrained qi due to stress. Atractylodes, Ginseng, and Licorice strengthen the spleen and build the qi. Hoelen supports the spleen and calms the spirit. Gentian is a bitter tonic and is called upon when there is weakness and debility due to stress. Roman Chamomile harmonizes the digestion and is calming.

The Soup of the Four Gentlemen serves as a foundation formula for many herbal formulas used today in dealing with the wide variety of digestive disorders. Shiatsu Master, Toru Namikoshi said that the way to keep your digestive system healthy is to smile and laugh a lot! .', 'external');
INSERT INTO products VALUES (61, 'Emperors Heaven', 'Anxious, Over Stimulated, Brain Won''t Stop', 28, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Rehmannia, raw		Sheng Di Huang

Asparagus			Tian Men Dong

Ophiopogon			Mai Men Dong

Tang Kuei			Dang Gui

Schizandra			Wu Wei Zi

Biota				Bai Zi Ren

Zizyphus			Suan Zao Ren

Ginseng, American      Xi Yang Shen

Salvia			       Dan Shen

Scrophularia		       Xuan Shen

Hoelen			       Fu Shen

Polygala			       Yuan Shi

Dragon bone		       Long Gu

Platycodon		       Jie Geng

Cardamon		      Sha Ren', 'Western Therapeutic Actions

Nervous sedative, nutritive, demulcent, and cardiac tonic', 'Traditional Chinese Medicine

Enriches the yin of the heart and kidney, nourishes the blood, and calms the spirit', 'Sample Indications

Psychological

Irritable and unable to concentrate, moves from one thing to another, excessive thinking, forgetful, erratic emotions

	Physical

Insomnia with restless sleep, palpitations, anxiety, sores in the mouth, dry stool, menopausal symptoms, chronic urticaria, and heart disease', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 

3 times daily. 

Variation is according to individual symptoms', 'Contraindications and Cautions

There are none known. The patient fitting this profile will have a red tongue with little coating and a thin, rapid pulse. A dry stool may also be present. These signs are classic markers for yin and blood deficiency.', 'Notations 

Disturbances of the spirit are treated with herbs that nourish the heart and blood. When these aspects of the body become depleted or disrupted, the body becomes imbalanced and emotional disorders surface. Sleep disturbances are one of the key indicators for a heart imbalance. From many traditions, sleep is the time when our ancestral spirits come to visit us. If our sleep patterns are disrupted, some traditional healers consider this a spirit disorder and encourage tending to the ancestral spirits.

In Oriental Medicine, heart disorders are revealed in the tongue. A red tipped tongue reveals the excess heat in the heart &leftpar;caused by depletion&rightpar; and contributes to palpitations, restless sleep, and anxiety. The pulse will usually be rapid and thin. A knotted, hurried, or intermittent pulse points to heart irregularities. 

Emperors Heaven follow the principles of a Chinese formula, Tian Wang Bu Xin Wan or Ginseng and Zizyphus Combination, and is effective for patients who are excessive thinkers and deliberators, living in their head. Emperors Heaven is suited also for patients who are fretful, stressed out, and have difficulty getting a restful sleep. Patients who are finding sleeping pills no longer effective will find this stress reducing formula very beneficial.

Emperors Heaven is different from the Pathfinder formula, in that the later deals more with blood and qi deficiency, which includes weak appetite, loose stool, and a pale tongue.', 'external');
INSERT INTO products VALUES (62, 'Fortify Will', 'Courage, Motivation', 28, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Rehmannia, prep.		Shu Di Huang

Eucommia			Du Zhong

Borage				Borago Officinalis

Morinda				Ba Ji Tian

Cornus				Shan Zhu Yu

Lycium fruit			Gou Qi Zi

Cuscuta				Tu Si Zi

Red Clover			Trifolium Pratense

Dioscorea			Shan Yao

Ginseng, Chinese		Ji Lin Ren Shen

Deer Antler			Lu Rong

Cinnamon bark		Rou Gui

Ginger, dried			Gan Jiang

Licorice, baked		Zhi Gan Cao', 'Western Therapeutic Actions

Restorative and nutritive tonic, adaptogenic tonic, stimulant, and alterative', 'Traditional Chinese Medicine

Warms and fortifies the kidney yang, replenishes the essence, nourishes the blood and supports the spleen', 'Sample Indications

Psychological

Fear causing paralysis, no backbone or will, psychic tiredness as if there is nothing left to give, and difficult to express what one feels for fear of the consequence

	Physical

Lower back pain, weak lower body, cold extremities, low libido, infertility, hypothyroid, aversion to cold, exhaustion from chronic illness, incontinence, and undigested food in the stool', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

Contraindicated in cases with yin deficiency &leftpar;dry mouth, red tongue with no coating, hot hands and feet&rightpar;.', 'Notations 

Fortify Will restores the essence of our being. The Chinese call it the gate of vitality, the kidney yang. Herbal remedies that treat the kidney yang are the most potent of all the remedies. The teachings tell us that the kidney yang &leftpar;fire&rightpar; controls the kidney yin &leftpar;water&rightpar;. Because of this, patients with kidney yang deficiency will have water metabolism disorders; such as edema, incontinence or difficulty in urinating, unusual sweating, spermatorrhea, and oily skin. 

The kidneys are considered the root of the tree. When the root is unable to grasp the air, it has a difficult time thriving &leftpar;asthma or wheezing&rightpar;. It is also said "the yang lives within the yin". For this reason the blood and yin tonics, Lycium fruit and Tang Kuei, are added to support this kidney yang remedy. Patterned after You Gui Wan, this remedy provides excellent results when used appropriately.

Trauma can be a cause for this depletion because of its ability to paralyze an individual in fear. Post traumatic stress disorder &leftpar;PTSD&rightpar; operates in a veil of fear. The trauma has the ability to exhaust the kidney fire and freeze and individual on their lifes journey, freezing them in a space of time. Fortify Will can help thaw the frozen bones and reclaim the will that was lost in the shadows of a distant cave.', 'external');
INSERT INTO products VALUES (63, 'Graceful Movement', 'Restlessness, No Roots, Unsettled', 28, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Rehmannia, prep.		Shu Di Huang

Cornus				Shan Zhu Yu

Dioscorea			Shan Yao

Hoelen				Fu Ling

Pseudostellaria		Tai Zi Shen

Lycium fruit			Gou Qi Zi

Moutan				Mu Dan Pi

Ophiopogon			Mai Men Dong

Alisma				Ze Xie

Mistletoe			Viscum Album 

Motherwort			Leonurus Cardiaca

Cardamon			Sha Ren', 'Western Therapeutic Actions

Demulcent, nervine, antispasmodic, diuretic, and nutritive tonic', 'Traditional Chinese Medicine

Nourishes the yin, enriches the kidney and liver blood, and supports the spleen', 'Sample Indications

Psychological

Fear causing the desire to run away or withdraw, unsettled, restless, always searching, and feels shaky inside when under stress

	Physical

Weakness and soreness of the lower body, diminished hearing, ringing in the ears, night sweats, dry mouth and throat, dryness of sexual fluids, and spontaneous nocturnal emissions', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 

3 times daily. 

Variation is according to individual symptoms', 'Contraindications and Cautions

Additional herbs for the spleen and stomach may be necessary if there is indigestion, weak appetite or loose stool.', 'Notations 

Graceful Movement is patterned after one of the most relied upon formulas in the Chinese Materia Medica, Six Flavor Rehmannia Pill or Liu Wei Di Huang Wan, created by Qian Yi in 1114 A.D. The kidneys in Oriental Medicine are considered to be the Mansion of Fire and Water and the root of the body functions. With this in mind we can see the importance of preserving, maintaining, and fortifying the kidney energy, whether it be the yin &leftpar;water&rightpar; or the yang &leftpar;fire&rightpar;. 

Graceful Movement is a modified version of Zuo Gui Yin, which in turn is a modified formula of the Six Flavor Rehmannia Pill. The emphasis of this formula is on nurturing the kidney yin and supporting the liver and spleen. This modification in Graceful Movement was made because of the support that the kidney yin gives to the liver, and how the disruption of fluids adversely affects the spleen. 

Prepared Rehmannia nourishes the blood and yin. Cornus nourishes the liver and stabilizes the kidneys. Lycium fruit nourishes the kidneys, liver, and the blood. Cornus and Lycium fruit have been called longevity herbs because of their ability to fortify the body. Pseudostellaria &leftpar;Tai Zi Shen&rightpar; has a wonderful ability to nourish the spleen qi without damaging the yin. Cardamon strengthens the stomach and promotes the movement of qi. If there is a strong heat presentation &leftpar;dryness&rightpar;, complement this formula accordingly. 

The demands of todays world makes this a brilliant preventative and remedial tonic for men and women for burn out.', 'external');
INSERT INTO products VALUES (64, 'Panic Free', 'Anxiety Attacks', 28, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Skullcap				Scutellaria Lateriflora

Pinellia				Ban Xia

Hoelen				Fu Shen

Magnolia bark		Hou Po

Cyperus				Xiang Fu

Ginseng, Siberian		Ci Wu Jia

Perilla leaf			Zi Su Ye

Blue Citrus			Qing Pi

Salvia				Dan Shen

Trichosanthes fruit	Gua Lou

Curcuma		        Yu Jin

Chih-Shih		        Zhi Shi

Bupleurum		        Chai Hu

Citrus			        Chen Pi

Ginger, fresh		        Sheng Jiang', 'Western Therapeutic Actions

Expectorant, digestive stimulant, nervine, and relaxant', 'Traditional Chinese Medicine

Promotes the smooth movement of qi, transforms phlegm, and directs rebellious qi downward

ü', 'Sample Indications

Psychological

Phobic, panic attacks, sensation of being choked or being constricted around the neck, feels as if something is stuck in the throat, sensation that death is looming, emotionally unstable, nervousness, and fearfulness

	Physical

Pain, discomfort, or tightness in the chest or upper back, phlegmatic, coughing, nausea or vomiting, fatigue, disruptive sleep, and palpitations', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

This formula is drying and dispersing in nature, and should be discontinued once the symptoms subside. In Oriental Medicine, the tongue will be moist or greasy with a white coating. The pulse will be wiry, feeling like a tight guitar string. Contraindicated with patients who exhibit a red tongue with no coating, red flushed face, and a bitter taste in the mouth.', 'Notations

Panic Free is derived from the Chinese formula, Ban Xia Hou Po Tang or Pinellia and Magnolia Combination, and falls into the category of stagnant qi and constrained liver qi with phlegm. In Oriental Medicine, qi can stagnate at the beginning of a disorder or from an emotional trauma. It can also develop from erratic eating habits or long-term deficiencies. Constrained liver qi can develop from emotional disturbances. Phlegm is produced from a weakened spleen. 

Emotionally, we could ask, Is the patient unable to swallow something in life or accept? Identifying what that something is creates the opportunity to move forward in life and accept lifes mysterious unfolding with openness and surrender. With the appropriate match, Panic Free has resolved some of the most stubborn phobias.

Skullcap, Cyperus, Blue Citrus, Perilla leaf, Trichosanthes fruit, and Bupleurum help to release the constrained liver qi and expand the chest. Pinellia, Hoelen, Magnolia bark, Citrus, and Ginger assist the spleen and transform dampness. Ginseng is an adaptogenic and strengthens the qi. Salvia vitalizes the blood and calms the spirit. Curcuma transforms phlegm and calming. Chih-Shih directs the qi downward and breaks up stagnant qi.', 'external');
INSERT INTO products VALUES (65, 'Pathfinder', 'Scattered, Drained Energy', 28, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Oats				Avena Sativa

Astragalus			Huang Qi

Atractylodes			Bai Zhu

Zizyphus			Suan Zao Ren

Hoelen				Fu Shen

Tang Kuei			Dang Gui

Ginseng, Chinese		Ji Lin Ren Shen

Longan				Long Yan Rou

Polygala				Yuan Shi

Saussurea			Mu Xiang 

Motherwort			Leonurus Cardiaca

Licorice, baked		Zhi Gan Cao

Ginger, fresh			Sheng Jiang

Jujube				Da Zao', 'Western Therapeutic Actions

Restorative, nutritive, nerve tonic, cardiac tonic, and relaxant', 'Traditional Chinese Medicine

Supplements the qi, supports the spleen, nourishes the blood, and calms the spirit', 'Sample Indications

Psychological

Excessive thought, worry and anxiety, lacks self esteem, difficult to concentrate, imagines the worse case scenario, overly cautious with too many possibilities, withdraws, phobias, and insecure

	Physical

Insomnia, dream disturbed sleep, palpitations, shortness of breath, feverish, bleeding disorders, early or prolonged menstruations, anemia, and myasthenia gravis &leftpar;chronic muscle weakness&rightpar;', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

Pathfinder is suited for a patient who has a pale, swollen tongue with a thin white coating. The complexion will be pale and the pulse will be deficient, feeling thin and frail.', 'Notations

Pathfinder, designed after the Chinese formula, Gui Pi Tang or Ginseng and Longan Combination, finds its place for those suffering from anxiety due to exhaustion. Not only does this formula replenish, it brings back the ability to focus and concentrate. Pathfinder fills the heart with blood, allowing the spirit to be at ease with a sense of abundance. In Oriental Medicine, obsessive behavior or excessive thinking can injure the qi of the spleen. When the spleen is weak it can no longer generate blood. The blood, then, lacks the ability to nourish the heart. With a depleted heart, the spirit has no home, and the thoughts wander from one thing to another, not knowing which way to turn or which path to follow. 

Pathfinder to the rescue, a brilliant formula that will restore the pulse of life, as the restless spirit is quieted , and the body regains its ability to control the blood.

Oats has been added to replenish the nervous system and rejuvenate the body. Astragalus and Tang Kuei exhibit a great synergy for building the blood and qi. Ginseng and Atractylodes supplement the qi and strengthen the spleen. Hoelen, Licorice, Ginger, and Jujube support the spleen. Zizyphus, Longan, Polygala, and Motherwort nourish and calm the heart. Saussurea assists in the regulation of the movement of the digestive qi.', 'external');
INSERT INTO products VALUES (78, 'Chi Rebound', 'Energy Builder', 28, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Oats		         	Avena Sativa

Ginseng, American	Xi Yang Shen

Astragalus		Huang Qi

Rhodiola	         	Hong Jing Tian

Tang Kuei	         	Dang Gui

Gynostemma		Jiao Gu Lan

Codonopsis		Dang Shen

Longan			Long Yan Rou

Damiana	         	Turnera Diffusa

Mistletoe	         	Viscum Album

Kola Vera	         	Kola Vera

Gentian			Gentiana Lutea

Licorice, baked		Zhi Gan Cao', 'Western Therapeutic Actions

Adaptogenic, nutritive tonic, restorative and nerve tonic, digestive, and cardiac tonic', 'Traditional Chinese Medicine

Nourishes the blood, strengthens the chi, and augments the essence', 'Sample Indications

Exhaustion, low vitality, and general lassitude due to frequent and prolonged stress &leftpar;physical or mental&rightpar;', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

Use caution with high blood pressure. Modify this remedy if the patient has a high fever, heat from deficiency, or a combination of heat, thirst, and irritability.', 'Notations 

Chi Rebound is an all around balanced supplement that enhances mental and physical well-being. This remedy has shown itself to be very effective when used as an adjunct therapy when treating any chronic disease, especially if fatigue, general debility, low blood pressure, or a feeble heart presents themselves as part of the symptoms. Well-balanced restorative tonics, such as Chi Rebound, will combine herbs that stimulate and calm the body concurrently. This is because anxiety and depression sit side by side and are common companions. People with sensitive blood sugar levels can take this tonic without adverse affects.

Oats &leftpar;wild&rightpar; is considered the perfect food, both as a nutritive and restorative tonic. It is one of the few grains that is warm in nature, very grounding, and supportive of the thyroid, pancreas, and testis. American Ginseng, considered a yin tonic in Chinese medicine because it is cooler in nature than the Asian ginseng, is adaptogenic and restorative. It excels in its ability to restore the body and calm the mind. Astragalus strengthens the chi of the spleen and lungs, raises the chi upward, and stabilizes the protective chi. It is an excellent herb that can be used for most deficient conditions. If a client has blood or chi stagnation, especially in the middle burner, Astragalus can cause neck and shoulder tension because of its ability to raise the chi. Rhodiola, known as the golden root, is found in the arctic regions of Siberia and has been highly regarded for centuries. The Scandinavians used it to enhance their physical strength and endurance. In Russia it is used for nervous disorders, depression, and alleviating depletion from various stress factors. Longan nourishes the blood and calms the heart. It is frequently used in restorative formulas because of its calming effect. Mistletoe &leftpar;European&rightpar; supports Longan as a nervous relaxant. Damiana and Kola Vera are used for nervous debility, depression, and fatigue.', 'external');
INSERT INTO products VALUES (66, 'Soothe The Dragon', 'Anger, Rage', 28, 'Ingredients Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Bupleurum			 Chai Hu

Valerian				 Valeriana Officinalis

Pinellia				 Ban Xia

Hoelen				 Fu Shen

Zizyphus			 Suan Zao Ren

Polygonum vine		 Ye Jiao Teng

Dragon bone			 Long Gu

Oyster shell			 Mu Li

Scute				 Huang Qin

Cyperus				 Xiang Fu

Ginseng, Chinese		 Ji Lin Ren Shen

Cinnamon twig	        Gui Zhi

Chih-Shih		        Zhi Shi

Skullcap			        Scutellaria Lateriflora

Ginger, fresh		   Sheng Jiang', 'Western Therapeutic Actions

Nervous sedative, adaptogenic, alterative, depurative, and digestive', 'Traditional Chinese Medicine

Sedates and calms the spirit, harmonizes the liver and spleen, clears heat, and transforms phlegm', 'Sample Indications

Psychological

Drug withdrawal, irritable, angry, chronic depression, PTSD, frightens easily, "wound up tighter than a knot", nervous twitching, neurotic, and schizophrenia

	Physical

Tightness in the chest, occasional palpitations when resting, a sense of heaviness in the body, epilepsy, Menieres disease, hyperthyroid, and post-concussion syndrome', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions 

This formula is suited for a patient who has a red tongue with a wiry, rapid pulse &leftpar;excess&rightpar;.', 'Notations

Soothe the Dragon, is a modified version of the Chinese formula, Chai Hu Jia Long Gu Mu Li Tang or Bupleurum and Dragon Bone Combination. In Oriental Medicine, when the qi of the body gets trapped internally for an excessive amount of time, the liver and the heart can become imbalanced and accumulate an excess amount of heat. Soothe the Dragon will help to open and purge what has been trapped. 

Chronic emotional withholding leads to many imbalances. The withheld emotions contain energy. There comes a time, when the cup can not hold anymore water. When this moment is reached, explosive reactions can show themselves. Road rage, hidden rage, everything rocks the boat; even in the absence of a storm. Soothe the Dragon relieves some of the inner turmoil, and calms the body down. Many herbs in this formula bring the qi down, not to depress the qi, but to calm and balance.

Bupleurum helps to crack open the constrained liver qi. Valerian is a strong nervine with anodyne and antispasmodic qualities. It promotes sleep, alleviates nervous debility, irritation and anger. Pinellia transforms phlegm and causes the qi to descend.  Hoelen, Ginseng, and Ginger support the spleen. Zizyphus and Polygonum vine calm the spirit. Dragon bone and Oyster shell anchor and calm the spirit. Scute sedates liver yang and clears heat. Skullcap and Cyperus release constrained liver qi. Cinnamon twig warms and promotes the movement of qi in the chest. Chih-Shih breaks up stagnant qi and directs the qi downward.', 'external');
INSERT INTO products VALUES (67, 'Tranquillo', 'Calms, Fortifies, Peaceful', 28, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Oats				Avena Sativa

Codonopsis			Dang Shen

Rehmannia, raw		Sheng Di Huang

Arjuna				Terminalia Arjuna

Salvia				Dan Shen

Zizyphus			Suan Zao Ren

Biota				Bai Zi Ren

Mistletoe			Viscum Album

Vervain				Verbena Officinalis

Licorice, baked		Zhi Gan Cao

Ophiopogon			Mai Men Dong

Lily					Bai He

Cinnamon twig		Gui Zhi

Skullcap				Scutellaria Lateriflora

Cardamon			Sha Ren', 'Western Therapeutic Actions

Restorative, nutritive, nerve tonic, nervine, demulcent, and 

relaxant', 'Traditional Chinese Medicine

Supplements the qi, nourishes the blood, nourishes the yin, and restores the pulses', 'Sample Indications

Psychological

Anxiety with palpitations, panic with fear, irritable and restless, and strong judgement about oneself as being inconsistent or unacceptable

	Physical

Insomnia, palpitations, arrhythmia &leftpar;irregular or intermittent pulses&rightpar;, shortness of breath, constipation, emaciation, and 

mitral valve disorders,', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

This remedy is suited for a patient who has a pale, shiny tongue, dry mouth and throat, with a pulse that is consistently irregular, intermittent, or thin and forceless.', 'Notations

Tranquillo falls into the Oriental Medicine categories of qi and blood tonics. Tranquillo differs from the Pathfinder formula, in that the former is stronger in nourishing the blood, and addresses irregular pulses. Tranquillo is a modified version of the Chinese formula, Zhi Gan Cao Tang or Baked Licorice Combination and combined with Western nervines. Tranquillo regenerates the heart blood and restores the qi, so that the pulses will be full of vitality, lose their irregularity, and the spirit can feel at ease. When the heart has lost its vital energy, a person can experience palpitations, agitation, anxiety, and insomnia. 

Licorice, in larger amounts, is a heart tonic; and in combination with Oats and Codonopsis, supplement the spleen qi. When the spleen qi is strengthened, it is more able to generate blood. Arjuna, an Ayurvedic herb, is a cardiac tonic, regulates blood pressure, a relaxant, and possesses cholesterol regulating properties. Mistletoe is a cardiac circulatory stimulant, relaxant, and nervine. Vervain is a nervine and anti-depressant. Rehmannia, Ophiopogon, Ho Shou Wu, and Lily nourish the the yin and heart blood. Cinnamon twig and Salvia open the heart channels and stimulate circulation in the chest region. Zizyphus and Biota nourish the heart and calm the spirit. Skullcap relieves tightness in the chest, breaks up stagnant qi, and is calming. Cardamon is an aromatic digestive and balances the actions of this formula.

ü', 'external');
INSERT INTO products VALUES (68, 'Addiction Remedy', 'Dependencies', 4, 'Ingredients &leftpar;Flower Essences&rightpar;

Agrimony

Chestnut Bud

Cherry Plum

Impatiens

Walnut

White Chestnut', 'Western Therapeutic Actions

Supports the healing of all types of substance abuse, and helps break the links to destructive emotional  patterns', '', 'Sample Indications

Assists the emotional healing process of letting go of addictions: food, drug, tobacco, and behavioral', 'Suggested Dosage

5 drops, directly onto the tongue, 3 times daily, or more frequently if needed

Addiction Remedy can be repeated every 30 minutes during times of stress, or when the addiction is most difficult to control.

Variation is according to individual symptoms

Variation is according to individual symptoms', 'Contraindications and Cautions

Contact a licensed psychiatrist if extreme emotional conditions persist. Addict Free can be considered for additional support.', 'Notations 

Addiction Remedy addresses the emotional and psychological aspects of addictions. It may be necessary with certain addictions to use detoxifying formulas to help clear the physical body. Addiction Remedy helps to break the unwanted links of negative repetitive behavioral patterns. Lifestyle changes, counseling, and treatment guidance is highly recommended when dealing with addictions. Body therapy and acupuncture have proven to be highly effective during the healing process. Saunas are an excellent way to cleanse the body of impurities, bring clarity to the mind, and calm the spirit.

Flower Essences

Key words

Agrimony

	Mental torture, worry, concealed from others

Chestnut Bud

	Failure to learn by experience, lack of observation in the 		lessons of life and the need for repetition

Cherry Plum

	Desperation, fear of losing control of the mind, dread of 		doing some frightful thing

Impatiens

	Impatience, irritability and extreme mental tension

Walnut

	Oversensitive to ideas and influences, the link-breaker

White Chestnut

	Persistent unwanted thoughts, mental arguments and 		conversations', 'external');
INSERT INTO products VALUES (69, 'Crisis Remedy', 'Trauma', 4, 'Ingredients &leftpar;Flower Essences&rightpar;

Star of Bethlehem

Rock Rose

Impatiens

Clematis

Cherry Plum', 'Western Therapeutic Actions

Heals the emotional wounds of trauma, shock, grief, and sustained stress', '', 'Sample Indications

Trauma, shock, panic, grief, anxiety, and fright', 'Suggested Dosage

5 drops, directly onto the tongue, 3 times daily, or more frequently if needed

Crisis Remedy can be repeated every 30 minutes during times of stress.

Variation is according to individual symptoms', 'Contraindications and Cautions

Contact a licensed psychiatrist or a mental health clinic if extreme emotional conditions persist.', 'Notations

This is the same remedy as the Bach Flower Rescue Remedy. Crisis Remedy addresses the emotional states brought on by trauma and allows the patient to stay calm, focused, and functional during and after a traumatic experience.

Flower Essences

Key words

Star of Bethlehem

	Mental or physical shock or trauma

Rock Rose

	Terror, panic, extreme fright

Impatiens

	Impatience, irritability and extreme mental tension

Clematis

	Indifferent, dreaminess, unconscious

Cherry Plum

	Desperation, fear of losing control of the mind, dread of doing some frightful thing', 'external');
INSERT INTO products VALUES (70, 'Crossroads Remedy', 'Clarity', 4, 'Ingredients &leftpar;Flower Essences&rightpar;

Wild Oat

Walnut

Honeysuckle

Chestnut Bud

White Chestnut

Mimulus', 'Western Therapeutic Actions

Promotes emotional and mental clarity in discovering one''s direction in life', '', 'Sample Indications

Fear and lack of direction, at a crossroads in life, and confusion about lifes purpose', 'Suggested Dosage

5 drops, directly onto the tongue, 3 times daily, or more frequently if needed

Crossroads Remedy can be repeated every 30 minutes during times of stress.

Variation is according to individual symptoms', 'Contraindications and Cautions

Contact a licensed psychiatrist if extreme emotional conditions persist.', 'Notations 

Crossroads Remedy suits those who are in a transitional time in their life. The possibilities are limitless and time is running out. Alas, what to do? This remedy enables you to focus your energies, and give room or make space for the sacred. Give room means to quiet the self, find some moments of stillness, breathe, and allow this present awareness lead you. Allow yourself to be led. Feel from the belly. If you stay in your head, try to think your way through this decisive time, you fail miserably. Your thoughts and emotions are not in alignment with the natural rhythm of life. When you quiet your mind, by surrendering to everything just as it is, a peacefulness shortly arrives and you become empowered and have clarity. 

Flower Essences

Key words

Wild Oat

	Uncertainty, despondent, dissatisfied

Walnut

	Oversensitive to ideas and influences, the link-breaker

Honeysuckle

	Dwells upon the past, nostalgic, homesick

Chestnut Bud

	Failure to learn by experience, lack of observation in the lessons of life and the need for repetition

White Chestnut

	Persistent unwanted thoughts, mental arguments and conversations

Mimulus

	Fear or anxiety of known origin', 'external');
INSERT INTO products VALUES (73, 'Grounding Remedy', 'Staying Present', 4, 'Ingredients &leftpar;Flower Essences&rightpar;

Clematis

Star of Bethlehem

Rock Rose

Aspen

Cherry Plum', 'Western Therapeutic Actions

Heals the emotional foggy brain, vagueness, and out of body reality, brings the energy back down to earth', '', 'Sample Indications

People who have lost direction, struggle living in this reality, spend their time talking to God, and have gone

"away with the fairies"', 'Suggested Dosage

5 drops, directly onto the tongue, 3 times daily, or more frequently if needed

Grounding Remedy can be repeated every 30 minutes during times of stress.

Variation is according to individual symptoms', 'Contraindications and Cautions

Contact a licensed psychiatrist or a mental health clinic if extreme emotional conditions persist.', 'Notations

Emotional confusion and upset often accompanies physiological problems. By relating an emotion to the Five Phases Theory or the Four Humors, and applying an appropriate herbal formula can be very beneficial during the course of the healing process. 

An excess or lack of any emotion can serve as a guide to the systemic imbalance of the patient. The important thing to remember is to adapt and apply these theories in a creative and dynamic way. Rigidity spoils the soup, limits the possibilities, and closes the door to healing.

                                 Flower Essences

                                       Key words

Clematis

	Indifferent, dreaminess, preoccupied, unconscious

Star of Bethlehem

	Shock, trauma, mental or physical

Rock Rose

	Terror, panic, extreme fright

Aspen

	Vague fears of unknown origin, anxiety, apprehension

Cherry Plum

	Desperation, fear of losing control of the mind, dread of doing some frightful thing', 'external');
INSERT INTO products VALUES (74, 'Irritation Remedy', 'Irritability', 4, 'Ingredients&leftpar;Flower Essences&rightpar;

Impatiens

Clematis

Cherry Plum', 'Western Therapeutic Actions

Assists in the emotional control of irritation and lashing out, regardless of the cause', '', 'Sample Indications

For emotional or physical irritation and impatience l', 'Suggested Dosage

5 drops, directly onto the tongue, 3 times daily, or more frequently if needed

Irritation Remedy can be repeated every 30 minutes during times of stress.

Variation is according to individual symptoms', 'Contraindications and Cautions

Contact a licensed psychiatrist if extreme emotional conditions persist.', 'Notations

This flower remedy is designed for those times in life when circumstances has stretched a person too thin and frustration has settled into the psyche. Agitation clouds everything and you are unable to smell the roses and sense the beauty of life. Meditation is calling and setting priorities is essential. Remember your purpose in life is first to become aware of who you are. You bring this presence to all that you do. It is not in the doing, but in the being, you will find what you are looking for. Combining it will some of the hepatic formulas creates good results

                                                          Flower Essences

                                                               Key words

Clematis

	Indifferent, dreaminess, lack of attention, unconscious

Impatiens

	Impatience, irritability, extreme mental tension

Cherry Plum

	Desperation, fear of losing control of the mind, dread of doing some frightful thing', 'external');
INSERT INTO products VALUES (75, 'Protection Remedy', 'Builds Shields', 4, 'Ingredients  &leftpar;Flower Essences&rightpar;

Walnut

White Chestnut

Star of Bethlehem', 'Western Therapeutic Actions

Helps clear unwanted and unnecessary influences in ones life. It enables one to see more clearly where, what, and how these influences approach and affect wellness, therefore allowing the opportunity to make better choices and avoid them in the future.', '', 'Sample Indications

External energies or keep interfering with the movement forward in life or when one feels bombarded or attacked by unwanted energies and someone elses emotional baggage', 'Suggested Dosage

5 drops, directly onto the tongue, 3 times daily, or more frequently if needed

Protection Remedy can be repeated every 30 minutes during times of stress and repetitive thought patterns.

Variation is according to individual symptoms', 'Contraindications and Cautions

Contact a licensed psychiatrist if extreme emotional conditions persist.', 'Notations

When the body is depleted, it is difficult to protect itself from external influences. To replenish the body, it is necessary to take blood and qi tonics. Also, when a person has a deep understanding of who they are, external influences pass through them and are emotionally unaffected.

                                                  Flower Essences

                                                       Key words

Walnut

	Oversensitive to ideas and influences, the link-breaker

White Chestnut

	Persistent unwanted thoughts, mental arguments and conversations

Star of Bethlehem

	Shock or trauma, mental or physical', 'external');
INSERT INTO products VALUES (76, 'Radiation Remedy', 'Radiation Protection', 4, 'Ingredients &leftpar;Flower essences&rightpar;

Aspen

Cherry Plum

Crab Apple

Olive

Walnut

Water Violet', 'Western Therapeutic Actions

This flower essence remedy helps release toxic emotions due to exposure to radiation', '', 'Sample Indications

Exposure to toxic levels of radiation', 'Suggested Dosage

5 drops, directly onto the tongue, 3 times daily, or more frequently if needed

Radiaion Remedy can be repeated every 30 minutes during times of stress.

Variation is according to individual symptoms', 'Contraindications and Cautions 

Use Radiation Support to alleviate any injury to the body from radiation exposure.', 'Notations

Radiation creates an excess acidic condition in the body. Miso soup, fermented foods, and the herb, Meadowsweet, help to balance the pH of the body. The other techniques that have been used from different traditions to alkalize the body are deep breathing, meditation, eating and chewing in a calm quiet setting, and saunas. Saunas are one of the few purification techniques that can remove heavy metals and deep seated chemicals from the body.

                                                            Flower Essences

                                                                 Key words

Aspen

	Vague fears of unknown origin, anxiety, apprehension

Cherry Plum

	Desperation, fear of losing control of the mind, dread of 		doing some frightful thing

Crab Apple

	Feelings of uncleanness, despondent, despair

Olive

	Complete exhaustion, mental fatigue

Walnut

	Oversensitive to ideas and influences, the link-breaker

Water Violet

	Pride, aloof, bear their grief in silence', 'external');
INSERT INTO products VALUES (104, 'Burn Lotion', 'Heals Burns', 35, 'Ingredients&leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Aloe Vera			Lu Hui

Nettles				Urtica Spp.

Lithospermum		Zi Cao Gen

Sanguisorba			Di Yu

St. Johns Wort		Hypericum Perforatum

Phellodendron		Huang Bai', 'Western Therapeutic Actions

Vulnerary, antiseptic, anti-inflammatory, analgesic, antipruritic, emollient, and anodyne', 'Traditional Chinese Medicine

Clears heat and generates flesh', 'Sample Indications

The skin or other epithelial tissues are burned &leftpar;thermal and sun burns, radiation burns and chemical burns&rightpar;', 'External Application

Topically, apply onto the cleansed area. Pour directly onto the affected area or use sterile gauze, reapply 3 times daily.

If gauze sticks onto the affected area, moisten before attempting to remove.', 'Contraindications and Cautions

If the burn is severe, seek qualified medical help immediately. If the gauze sticks to the burned area, moisten with warm water before trying to remove.', 'Notations 

Burn Lotion can be applied directly onto the cleansed burned area or diluted with purified water and used in the same way. 

Nettles nourish the blood and supports connective tissue repair. Lithospernum and St. Johns Wort have anti-inflammatory actions and have qualities which clear damp/heat from the skin tissues. Sanguisorba clears heat from the skin and promotes the generation of new flesh. Phellodendron supports the other herbs in this formula with its strong actions of clearing damp/heat. Aloe Vera could stand on its own when healing skin tissue damage from burns because of its ability to clear heat and promote new flesh 

After the burn has healed, Calendula Cream or Silk Pond Cream may be used to help reduce scarring.

The Aloe Vera plant, similar to some other botanicals, requires age to develop its medicine. The plant is mature when it is seven years old. The Ginseng root also requires a minimum of seven years of growth before it is mature and harvested. 

If someone uses a immature Aloe Vera plant for healing, some benefit can be experienced. However, the healing capacity of a mature plant is unsurpassed and excels when dealing with damaged skin and tissue damage. It heals both external and internal tissue inflammation. 

Use a fresh liquid gel for internal use. Take a shot glass of Aloe Vera gel, two times daily for internal inflammations. Because of its cold nature, someone who is suffering from a cold stomach or damp spleen should exercise caution when using this powerful tissue healer. Consider taking the dosage after a meal.', 'external');
INSERT INTO products VALUES (79, 'Dry Eyes', 'Moistens Eyes', 28, 'Ingredients  &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Rehmannia, raw	        Sheng Di Huang

Chrysanthemum	        Ju Hua

Lycium fruit		       Gou Qi Zi

Cornus			       Shan Zhu Yu

Marshmallow		       Althea Officinalis

Eucommia		       Du Zhong

Bilberry			       Vaccinium Myrtillus

Salvia			       Dan Shen

Anemarrhena	       Zhi Mu

Eclipta			       Han Lian Cao

Moutan			       Mu Dan Pi

Cuscuta			Tu Si Zi

Eyebright		Euphrasia Officinalis

Pseudoginseng	Tien Chi

Pulsatilla		Bai Tou Weng

Cardamon		Sha Ren', 'Western Therapeutic Actions

Alterative, depurative, demulcent, hepatic nutritive, tonic, 

circulatory, and emollient', 'Traditional Chinese Medicine

Clears heat, nourishes the liver yin, fortifies the kidney yang, vitalizes the blood, and stops bleeding', 'Sample Indications

Dry eyes, eyestrain, macular degeneration, retinal degeneration, retinitis, and failing eyesight', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

Use with caution in cases that exhibit indigestion or spleen qi deficiency &leftpar;diarrhea, or a white coated, greasy tongue&rightpar;.', 'Notations 

In Oriental Medicine the organs of the body are revealed on the face. This diagnostic tool allows the healer to see the tendency of the body functions and the internal organs prior to a sickness or illness. Prevention is one of the virtues of traditional medicines. Wisdom is in the gift of maintaining our health.

The health of the liver is revealed through the eyes and supported by the kidneys. From diverse herbal teachings, herbs that nourish the liver and enhance the kidneys are used for eye disorders. Dry Eyes is an adaptation from the Chinese formula, Qi Ju Di Huang Wan and Liu Wei Di Huang Wan.

Raw Rehmannia is used instead of Prepared Rehmannia because the former clears heat and cools the blood in addition to nourishing the kidneys. Anemarrhena supports the actions of Rehmannia. Chrysanthemum expels wind/heat and soothes red, irritated eyes. Lycium fruit nourishes the essence. Cornus, Eclipta, and Cuscuta nourish the liver and kidneys and are wonderful tonics for all deep rooted liver and kidney weaknesses. Marshmallow root, a demulcent, brings moisture to the dry tissues. Eucommia fortifies the kidney yin and yang. Bilberry is cooling and nourishes the eyes. Eyebrights name speaks for itself. Culpeper wrote, If the herb was but as much used as it is neglected, it would spoil the spectacle makers trade. Salvia and Moutan stimulate the circulation of blood. Pseudoginseng  arrests internal hemorrhaging. Pulsatilla is a nervine and an alterative. Cardamon supports the digestion and balances the cooling effect of raw Rehmannia.

Refer to the Facial Diagnosis chart on page 20.', 'external');
INSERT INTO products VALUES (80, 'Heat Wave', 'Overheating, Night Sweats', 28, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Rehmannia, prep.		Shu Di Huang

Oats				Avena Sativa

Anemarrhena		Zhi Mu

Phellodendron		Huang Bai

Cornus				Shan Zhu Yu

Dioscorea			Shan Yao

Lycium fruit			Gou Qi Zi

Moutan				Mu Dan Pi

Hoelen				Fu Ling

Shatavari			Asparagus racemosa

Alisma				Ze Xie

Gotu Kola			Hydrocotyle Asiatica

Bladderwrack		Fucus Vesiculosus

Black Cohosh		Cimicufuga Racemosa', 'Western Therapeutic Actions

Demulcent, nutritive, restorative, nerve tonic, diuretic, alterative, and astringent', 'Traditional Chinese Medicine

Enriches the yin, nourishes the kidney and yin, clears heat, and binds up the essence', 'Sample Indications

Heat or dryness in the upper body, dark urine, hot flashes, night sweats, sore lower back, autoimmune diseases, chronic inflammations, and insomnia', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 

3 times daily

Variation is according to individual symptoms

ü', 'Contraindications and Cautions

Use supportive herbs for the spleen and stomach if the patient has weak appetite, loose stool, or nausea.', 'Notations

Heat Wave is designed after the Chinese classic, Zhi Bai Di Huang or Anemarrhena, Phellodendron and Rehmannia Formula. Heat Wave differs from Graceful Movement because of the additional herbs included to clear additional internal heat, nourish the yin, and replenish the depletion. They both use the basic six herbs found in Liu Wei Di Huang Wan: Rehmannia, Cornus, Dioscorea, Moutan, Hoelen, and Alisma. The herbs, Anemarrhena and Philodendron have been added to Heat Wave because they are the key herbs for clearing heat in the upper part of the body and draining the excess fire, the classic hot flash syndrome. 

In Oriental Medicine, excess heat of any type causes agitation of the spirit. Moutan helps to alleviate this excess heat build-up and is calming. Alisma helps to direct the qi back down towards the kidneys and is a diuretic. Cornus and Lycium fruit support the liver and kidneys and enhance the essence. Oats is included in this formula because of its wonderful ability to nourish the body and calm the nerves. Shatavari, an Ayurvedic herb, nourishes the yin and is cool in nature. It is one of the premier herbs used in India for menopausal symptoms and hormonal imbalances. Gotu Kola is a tonic and assists with mental and physical fatigue. Bladderwrack nourishes the thyroid, which governs body metabolism. Black Cohosh is an astringent and menopause specific.

Menopausal hot flashes, afternoon feverishness, and excessive perspiration are symptoms that benefit greatly from this formula. In treating the whole spectrum of menopause, herbs that fortify the kidney yang &leftpar;fire&rightpar; are usually combined with these kidney yin &leftpar;water&rightpar; nurturing herbs.', 'external');
INSERT INTO products VALUES (81, 'Jade Screen Defense', 'Frquent Illness', 28, 'Ingredients  &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Astragalus			Huang Qi

Gynostemma			Jiao Gu Lan

Ginseng, Siberian		Ci Wu Jia

Siler					Fang Feng

Guduchi				Tinospora Cordifolia

Horehound			Marrubium Vulgare

Dioscorea			Shan Yao

Holy Basil			Ocimum Tenuiflorum

Peony				Bai Shao Yao

Cinnamon twig		Gui Zhi

Osha				Ligusticum Porteri

Licorice, baked		Zhi Gan Cao

Ginger, fresh			Sheng Jiang', 'Western Therapeutic Actions

Restorative, tonic, antihistaminic, alterative, anti-inflammatory, astringent, expectorant, and digestive', 'Traditional Chinese Medicine

Augments, releases, and stabilizes the exterior, supplements the qi, supports the spleen, and clears heat', 'Sample Indications

Chronic and recurring infections, such as frequent colds and flu, upper respiratory infection, recurring infections in children or the elderly', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

There are none known.', 'Notations

Jade Screen Defense is a cold and flu preventative, or can be used for recurring infections, seen in many school age children. It can be taken regularly during the fall and winter seasons, when contagious diseases are most prevalent. Patterned after a well known Chinese formula, Yu Ping Feng San or Jade Windscreen Powder, and supported by some time proven Western herbs, this formula is an excellent preventative from those nasty bugs. 

Jade Screen Defense is specially designed for children and the elderly who find themselves very vulnerable during the cold winter months, and for those who have a compromised immune system. It can be used as a prophylactic during the flu season. When taken as a prophylactic, the lower dosages are recommended unless a patient is suffering from extreme depletion.

Astragalus, Gynostemma, and Siberian Ginseng combine well together to build and strengthen the bodys immunity. Siler helps to release surface toxins and supports the spleen. Guduchi is anti-viral and anti-bacterial, plus enhances the immune system. Horehound clears heat, benefits the throat, and stimulates the digestion. Holy Basil is an expectorant, anti-viral, anti-bacterial, and promotes a healthy respiratory system. Peony, Cinnamon, Licorice, and Ginger combine together as in the Chinese formula Gui Zhi Tang. These herbs are used in a small quantity but an important addition to this formula, as they protect the exterior from invasion and help to nourish and stabilize the interior. Dioscorea has been included because of its ability to nourish the spleen and supplement the lung qi. Osha supports the protective nature of Cinnamon twig which releases external wind/cold.', 'external');
INSERT INTO products VALUES (82, 'Immuno Rebound', 'Compromised Immunity', 28, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Ganoderma			Ling Zhi

Astragalus			Huang Qi

Rhodiola				Hong Jing Tian

Ashwaganda			Withania Somnifera

Burdock root			Arctium Lappa

Echinacea			Echinacea Angustifolia

Guduchi				Tinospora Cordifolia

Tang Kuei			Dang Gui

Atractylodes			Bai Zhu

Lycium fruit			Gou Qi Zi 

Gentian				Gentiana Lutea

Uva Ursi				Arctostaphylos Uva Ursi

Licorice, baked		Zhi Gan Cao

Ginger, dried			Gan Jiang

Wild Yam			Dioscorea Villosa', 'Western Therapeutic Actions

Restorative, nutritive, digestive tonic, alterative, depurative, 

antispasmodic, and antiseptic', 'Traditional Chinese Medicine

Supplements the qi, supports the spleen, nourishes the blood, relieves toxicity, and replenishes the essence', 'Sample Indications

Weak or compromised immune system, low resistance to "bugs", easily fatigued, palpitations with anxiety, weak appetite, slow healing sores, and continuous spotting from uterine bleeding', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

There are none known. Use with caution during pregnancy.', 'Notations

Immuno Rebound is a gentle building tonic that restores the blood and qi that can be depleted from various chronic causes, emotional or physical. This internal imbalance is accompanied by a pale tongue with white coating and possible indentations on the sides. The complexion will be pallid &leftpar;pale&rightpar; or sallow &leftpar;yellowish&rightpar;, and the eyes will lack spirit or intensity. Because of the deficiency, the patient speaks with very few words, not wanting to exert the effort when there is so little energy left. Immuno Rebound, combining qi and blood tonics, is energetically patterned after Ba Zhen Tang or Tang Kuei and Ginseng Eight Combination, in combination with traditional Western herb specifics. It can be used prior to and throughout the cold/flu season as a protective agent against infection. This is especially important for the young and old, or those suffering from a compromised immune system. 

Ganoderma is a fungi that supports the immune and endocrine systems. Reishi is another name for this mushroom and it has been used by AIDS patients. Ganoderma has added value because of its ability to detoxify the liver and eliminate toxic free radicals. Cancer patients use it to reduce the side effects of chemotherapy and radiation. In order to stimulate the immune system, the spleen and the blood have to be supplemented and nourished. Astragalus, Atractylodes, Hoelen, Licorice, Citrus, and Ginger support the spleen while Tang Kuei, Lycium fruit, and Gentian nourish the blood. Guduchi and Wild Yam support Ganoderma in the detoxification of the liver. Uva Ursi helps to flush the toxicity through the kidneys. When detoxification of the body is being done with herbal medicine it is a good practice to add a small amount of diuretics in the formula so that the toxins get flushed out of the kidneys.', 'external');
INSERT INTO products VALUES (83, 'Precious Blood', 'Blood Builder', 28, 'Ingredients&leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Tang Kuei		     Dang Gui

Rehmannia, prep.	     Shu Di Huang

Peony			     Bai Shao Yao

Leonurus		     Yi Mu Cao

Ho Shou Wu		     He Shou Wu

Atractylodes		     Bai Zhu

Hoelen			     Fu Ling

Ginseng, Chinese	     Ji Lin Ren Shen

Cnidium			    Chuan Xiong

Gentian			    Gentiana Lutea

Saussurea		    Mu Xiang

Motherwort		    Leonurus Cardiaca

Licorice, baked	    Zhi Gan Cao', 'Western Therapeutic Actions

Nutritive, emmenagogue, restorative, digestive tonic, and 

relaxant', 'Traditional Chinese Medicine

Nourishes the blood, supplements the qi, invigorates the blood, and adjusts the menses', 'Sample Indications

Fatigue, tired blood, irregular menstruation &leftpar;amenorhea, dysmenorrhea, menorrhagia, and scanty menstruation, PMS, infertility, habitual miscarriage, and postpartum recovery', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

There are none known.', 'Notations

Oriental Medicine states that blood is the mother of qi, and qi is the commander of blood. This reveals the intimate relationship between fire &leftpar;qi&rightpar; and water &leftpar;blood&rightpar; and the necessity to nurture them together when dealing with deficient syndromes. Precious Blood combines the Chinese classic blood tonic, Si Wu Tang or Tang Kuei Combination, with the classic qi tonic, Si Jun Zi Tang or Four Gentlemen Decoction, to create a formula that addresses a wide variety of gynecological disorders. A similar Chinese formula, Ba Zhen Yi Mu Wan or Eight Treasure Pill to Benefit Mothers, is a very popular patent formula in China.

From another perspective, the oceans waters are controlled by the moon and in the Oneida teachings, the moon is called our ancient grandmother. This reveals the great powers of the moon and her deep connection with all women and all of life. A healthy womans menstruation will cycle rhythmically, as the moon, every 28 days. When a womans menstrual cycle &leftpar;some Native Americans call it the womans moon&rightpar; ends with the new moon and then ovulates close to the full moon, she is in harmony with nature and there will be fewer problems with improved fertility. 

Blood, like water, nourishes life. Seeds sprout, grow, mature, and bear fruit when given water. Blood creates the possibility for building future generations by bringing nourishment to our bones, which hold the ancient memory of who we are. Blood &leftpar;water&rightpar; feeds the dream and qi &leftpar;fire&rightpar; activates its desire. For this reason, a womens fertility is dependent upon the abundance of blood and the movement of qi. 

Ho Shou Wu and Gentian have been added to enhance the blood and qi. Saussurea helps resolve lower abdominal distention and pain. Motherwort helps to calm the spirit and with Cnidium invigorates the blood and moves the qi.', 'external');
INSERT INTO products VALUES (84, 'Stamina Plus', 'Quick Energy, Adrenals', 29, 'Ingredients&leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Ashwaganda			Withania Somnifera

Ginseng, Siberian		Ci Wu Jia

Oats				Avena Sativa

Astragalus			Huang Qi

Rhodiola				Hong Jing Tian

Damiana				Turnera Diffusa

Sarsaparilla			Smilax Officinalis

Gentian				Gentiana Lutea

Saw Palmetto			Serenoa Serrulata

Lycium fruit			Gou Qi Zi 

Cornus				Shan Zhu Yu

Licorice, baked		Zhi Gan Cao', 'Western Therapeutic Actions Restorative, nutritive, stimulant, and nerve tonic', 'Traditional Chinese Medicine

Supplements the qi, nourishes the blood, fortifies the kidneys, and replenishes the essence', 'Sample Indications

Fatigue, muscular burn out, stress, adrenal exhaustion, lack of zip in your step, tired body and tired brain', 'Suggested Dosage

10 - 20 drops, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions 

Contraindicated during acute febrile diseases. Use with caution in cases of yin deficiency with heat &leftpar;hot hands and feet, dry mouth with thirst for cold beverages, and night sweats&rightpar;.', 'Notations

Stamina Plus is used as an aid for optimal performance in any high stress busy environment, and as an energy boost in daily situations. This formula is also beneficial for athletic training and competition, for men and women athletes. 

Adaptogenic herbs exert a normalizing influence on the body, neither over-stimulating, nor inhibiting normal body functions. This quality enhances the bodies ability to cope with stress, whether it is physical or emotional. The adrenal glands are the beneficiaries of these adaptogenic qualities and are fueled by these herbs. Dopamine, norepinephrine &leftpar;known as noradrenaline outside the USA&rightpar;, and epinephrine are synthesized and stored in the adrenal glands. These compounds are responsible for maintaining the body in a homeostatic state during stressful situations. When these compounds are depleted from constant stress, the bodies ability to perform at a high level is diminished. Stamina Plus is a well-designed herbal formula for anyone who is requiring additional adrenal support during stressful or physically demanding situations.

Ashwaganda, Siberian Ginseng, and Rhodiola are known for their adaptogenic qualities. Oats is a premier nervine and restorative. Astragalus supplements the qi and blood, and supports the lung. Damiana is a kidney restorative and nervine. Sarsaparilla and Saw Palmetto enhance the circulation and fortify the kidney yang. Gentian is a highly regarded bitter tonic and has restorative qualities for the body. Lycium fruit nourishes the liver and kidney, and replenishes the essence. Cornus stabilizes and assists the kidney yang, nourishes the liver, and enriches the essence. Licorice supports the spleen and opens the channels.', 'external');
INSERT INTO products VALUES (90, 'Baby Ear Oil', 'Earache', 10, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Aloe Vera			Lu Hui

Mullein				Verbascum Thapsus

Camphor			Cinnamonum Camphora

Echinacea			Echinacea Angustifolia

Gentiana			Long Dan Cao

Goldenseal			Hydrastis Canadensis

Scute				Huang Qin

Gardenia			Zhi Zi

St. Johns Wort		Hypericum Perforatum

Pulsatilla			Bai Tou Weng

Asafoetida			Ferula Asafoetida

Wormseed			Chenopodium Ambrosiodes

Wintergreen			Gaultheria Promcumbens

Basil				Ocimum Basilicum

Spearmint			Mentha Spicata

Leptotaenia			Lomatium dissecutim', 'Western Therapeutic Actions

Anodyne, analgesic, anti-inflammatory, alterative, antiseptic, and depurative', 'Traditional Chinese Medicine

Clears heat, relieves toxicity, drains liver fire, and resolves phlegm', 'Sample Indications

Earache, ear infections, congestion, and inflammation of the ear canal', 'External Application

Massage a small amount of Baby Ear Oil around the base and back of the ear, 3 times daily

Place some Baby Ear Oil on a sterile cotton ball and place gently into the ear, 3 times daily', 'Contraindications and Cautions

There are none known. Ear infections can be a serious condition. Consult a qualified health care practitioner if the condition persists.', 'Notations 

Baby Ear Oil loosens and clears wax build-up from the ear. The formula is gently absorbed through the tissues of the ear. In cases of ear pain and infections, it is important to protect the ears, head and neck from draughts and wind. 

Mullein flower, the lead herb in this formula, excels in the treatment of ear aches with its astringent and pectoral qualities. In the summer, collect the yellow flowers just as they begin to open, or you can use the whole spike. Cover them immediately with olive oil and in three months you will have one of the best ear oils available. The Mullein leaf is preferred to the flower when treating respiratory complaints.

Breast-feeding is the optimal way to support the babys immune system. If the baby is drinking cows milk, this might cause an excess amount of mucous and congestion in the ear canals. Organic cows milk has shown to be less mucous producing. Check to make sure the baby is not allergic to dairy products. If in doubt, use goat milk, soy milk, or rice milk. Many African, Native American, and Scandinavian people are unable to digest the proteins in cow milk. The milk from the smaller animals; goat, sheep, reindeer, contain different enzymes and are easily assimilate by most folks. Fermented dairy products also are easily assimilated, such as yogurt, kefir, or cottage cheese.

A *Tofu Plaster placed on the forehead of the baby is a home remedy for lowering fevers. A warm *Salt Pack can be applied to the ear to alleviate some of the pain and inflammation.

*Tofu Plaster: See External Applications

*Salt Pack: 	 See External Applications', 'external');
INSERT INTO products VALUES (85, 'Uplift the Chi', 'Hernia Prolapse', 28, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Astragalus			Huang Qi

Rhodiola				Hong Jing Tian

Atractylodes			Bai Zhu

Tang Kuei			Dang Gui

Lycium fruit			Gou Qi Zi

Agrimony			Agrimonia Eupatoria

Raspberry leaf		Rubus Idaeus

Ginseng, Chinese		Ji Lin Ren Shen

Bupleurum			Chai Hu

Cimicifuga			Sheng Ma

Black Cohosh		Cimicufuga Racemosa

Saussurea			Mu Xiang

Licorice, baked		Zhi Gan Cao

Witch Hazel			Hamamelis Virginiana', 'Western Therapeutic Actions

Restorative, nutritive, astringent, digestive tonic, and 

deobstruent', 'Traditional Chinese Medicine

Supplements the qi, supports the spleen qi, nourishes the blood, and raises the yang', 'Sample Indications

Psychological

On again  off again, wishy washy, difficult to follow through to the end, unable to control oneself, poor listener, excessive deliberation, emotionally drained, depression, and lacks clarity

	Physical

Fatigue, sleep curled up, prolapse of organs, hemorrhoids, frequent miscarriage, weakness following a febrile disease, symptoms are intensified upon exertion, feverish with unknown origin, spontaneous sweating, postpartum disorders, incontinence, and menstrual spotting', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

According to Oriental Medicine, Uplift the Chi would be suited for a patient who has a pale, swollen tongue with a thin white coating. They will have thirst, except it will be for warm liquids. This is in contrast to yin deficiency thirst, in which cold liquids are preferred.', 'Notations

Uplift the Chi is a modified version of a highly used Chinese formulas, Bu Zhong Yi Qi Wan or Ginseng and Astragalus Combination. It is the foundation for many other formulas. In Oriental Medicine, when the middle burner &leftpar;spleen and stomach&rightpar; loses its strength, it no longer is able to restrain or hold things in their proper place. This is manifested on a physical level &leftpar;organ prolapse, incontinence, and bleeding disorders&rightpar;, and on an emotional level &leftpar;goes back and forth, constantly breaks commitments, and deliberates excessively&rightpar;. When using herbs on the physical level, we take higher dosages; and for the psychic or emotional level, we take the lower dosages. The lower dosage works like a homeopathic remedy and what they call in homeopathy, vibrational medicine. 

The energy of the Earth plays a key role in this paradigm. To heal this collapsed condition it might be helpful if the patient reconnects with the Earth and allow themselves to be nourished back to vitality. A concept passed down to us states that our purpose in Life is to serve, to give; and be humble enough to receive. Our bodies can collapse if we give it all away and have not allowed ourselves to be nourished; a balanced life or body is not something we seek, but something we allow.', 'external');
INSERT INTO products VALUES (86, 'Antiseptic Drawing Ointment', 'Dependencies', 5, 'Ingredients&leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Marshmallow			Althea Officinalis

Lithospermum		Zi Cao

Plantain				Plantago Spp.

Slippery Elm 			Ulmus Fulva

Echinacea			Echinacea Angustifolia

Goldenseal			Hydrastis Canadensis

Phellodendron		Huang Bai

Comfrey leaf			Symphytum Officinale

Calendula			Calendula Officinalis

Beeswax

Olive Oil', 'Western Therapeutic Actions

Vulnerary, demulcent, absorbent, antiseptic, anti-inflammatory, alterative, and depurative', 'Traditional Chinese Medicine

Clears heat and toxicity', 'Sample Indications

Topically, where impurities need to be drawn out from the epithelial tissues, infected wounds', 'External Application

Cleanse wounded area thoroughly before applying this ointment. After cleansing the wound, apply ointment to the affected area, or smear a small amount of ointment onto a sterile gauze and tape to area, 3 times daily

ü', 'Contraindications and Cautions

If the gauze sticks to the wound, moisten with warm water before trying to remove. Contact a physician immediately if the infected area begins to have hot, red streaks.', 'Notations 

Infections, swelling, and boils often indicate an impure blood stream. Care should be taken to keep the wound or broken skin area clean and away from possible sources of blood infections. It would be wise to stay out of public pools, away from dirt and chemicals until the wound has healed. Soaking the infected area in hot salty water, or applying hot, salty sterile cotton swabs to the infected area, three times daily, will assist the healing process. 

Marshmallow root is used internally and externally. Its moist, cool nature helps to soften boils and draw out pus. Lithospermum clears heat and toxicity and an excellent vulnerary. Plantain is an alterative and when applied topically, cleanses and promotes tissue repair. It is an excellent first aid herb. Pick a few leaves and apply topically to the tissue trauma, infected area or skin ulcer. Comfrey leaf , traditionally known as Knit Bone, is one of the premier botanicals for tissue healing. Its name means, to grow together. The old bone-setters would make a plaster with this botanical knowing of its ability to heal tissue and bones. Slippery Elm makes an excellent poultice by itself. Echinacea is a purifier. Phellodendron drains fire, relieves toxicity, and heals damp lesions. Calendula is an antiseptic, anti-fungal, and mends tissues.

If the skin tissue is broken, Comfrey leaf or root needs to be combined with blood purifiers and detoxicants as the wound heals rapidly. This is why cleansing herbs are an integral part of this ointment.', 'external');
INSERT INTO products VALUES (87, 'Blood Clear', 'Blood / Liver Cleanser', 29, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Burdock root		Arctium Lappa

Gardenia		Zhi Zi

Peony, red		Chi Shao Yao

Lonicera			Jin Yin Hua

Bupleurum		Chai Hu

Nettles			Urtica Spp.

Rehmannia, raw	Sheng Di Huang

Red Clover		Trifolium Pratense

Yellow Dock		Rumex Crispus

Yarrow			Achillea Millefolium

Prickly Ash		Zanthoxylum Americanum

Plantain			Plantago Spp.

Cleavers			Galium Aparine

Licorice			Gan Cao', 'Western Therapeutic Actions

Alterative, depurative, and diuretic', 'Traditional Chinese Medicine

Clears heat, relieves toxicity, drains fire, cools and vitalizes the blood', 'Sample Indications

All infections &leftpar;internal & external&rightpar;, skin disorders, boils, constipation, herpes, hepatitis, rheumatoid arthritis, and swollen lymph glands', 'Suggested Dosage

5 - 20 drops, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

Use with caution in pregnancy and high blood pressure. Use with caution in cases of cold from deficiency.', 'Notations

Blood Clear acts through the blood, lymphatic and glandular systems, the mucous membranes, and kidneys. The primary actions of this formula is to breakdown and eliminate metabolic wastes by clearing the excess heat and toxins from the qi and blood. Once the blood is cleansed, there is better assimilation and absorption of nutrients. This facilitates the regeneration of healthy new tissues and blood cells throughout the body. 

Internal toxicity or chronic infections are not always accompanied by a fever. It reveals itself in different ways. Chronic toxicity or chronic viral infections cause internal inflammations, skin inflammations, joint inflammations, digestive disturbances, irritability, disturbed sleep, lethargy, and chronic fatigue. The immune system becomes compromised when it has to constantly combat a chronic internal infection or internal toxic heat. When the immune system becomes compromised, the body no longer has the power to generate a fever. In these situations, restorative herbs have to be added to correct this imbalance.

Gardenia clears heat and damp/heat from the interior level of the body, in particular the qi level. Burdock root cleanses the lymphatic system and supports Gardenia. Dandelion clears heat and toxicity from the liver. Bupleurum releases heat from the exterior level and activates the liver. Peony clears heat from the blood and activates the blood. 

If the tongue is pale and swollen, add restorative herbal tonics, such as Immuno Rebound, Build Pure Essence, or Chi Rebound. If the tongue is red or red raised papillae, clear the toxic heat &leftpar;inflammation&rightpar; before adding restorative herbal tonics. Remember the herbal rule of thumb; clear heat before restoring!', 'external');
INSERT INTO products VALUES (88, 'Clear Throat', 'Sore Throat, Strep', 29, 'Ingredients  &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Scrophularia			Xuan Shen

Isatis leaf			Da Qing Ye

Echinacea			Echinacea Angustifolia 

Lonicera				Jin Yin Hua

Rehmannia, raw		Sheng Di Huang

Osha				Ligusticum Porteri

Platycodon			Jie Geng		

Licorice				Gan Cao 

Goldenseal			Hydrastis Canadensis

Poke Root			Phytolacca Spp.

Marshmallow			Althea Officinalis

Raspberry leaf		Rubus Idaeus

Sage				Salvia Officinalis

Bayberry				Myrica Cerifera

Peppermint			Bo He', 'Western Therapeutic Actions

Anti-viral, anti-bacterial, demulcent, astringent, alterative, 

antiseptic, emollient, and aromatic', 'Traditional Chinese Medicine

Clears heat, relieves fire toxicity, cools the blood, and dissipates nodules', 'Sample Indications

Sore throat, fever, tonsillitis, mumps, and swollen lymph glands', 'Suggested Dosage

10 - 40 drops, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindication and Cautions

Contraindicated during pregnancy. Clear Throat expels externally-contracted wind/heat disorders &leftpar;fever, slight chills, sore throat, swollen glands, and headache&rightpar;.', 'Notations 

Clear Throat addresses febrile contagious diseases and is suited for most constitutional types, the young and the old. For maximum results, hold each dosage of Clear Throat in the back of the throat for a minute, and allow the extract to absorb into the lymph tissues. This allows for some local soothing action.

Scrophularia leads this formula because of its ability to clear toxic heat &leftpar;febrile diseases&rightpar; in the upper body, cool the blood, and dissipate nodules in the neck and throat &leftpar;swellings&rightpar;. Rehmannia supports the actions of Scrophularia with its clearing and cool nature. Isatis leaf clears toxic heat and is used for contagious febrile diseases, regardless of ones constitution. Lonicera is a Chinese classic for acute febrile diseases and can be used for exterior &leftpar;warm febrile diseases&rightpar; or interior heat &leftpar;chronic viral or bacterial infections&rightpar;. Osha, Apache bear root, is anti-viral and anti-bacterial. Echinacea is used because of its ability to reduce infections, fevers, inflammation, suppuration, and nasal discharge. Licorice &leftpar;raw&rightpar; clears fire toxicity from the throat and combines well with Platycodon. They are a classic combination for sore throats. When Licorice is honey baked, it strengthens the spleen, alleviates spasms, smoothes the pulses, and arrests palpitations. Poke root resolves swollen lymph nodes. Marshmallow root soothes inflamed mucous membranes. Sage is an astringent and excellent cleanser for the throat. Bayberry is an deobstruent and cleanser.

Make a tea from green scallions. Bring two cups of water to a boil and remove from the heat. Add six chopped green onions &leftpar;include the white rootlets&rightpar;. Let steep for twenty minutes. Drink 1/2 cup of green onion tea every two hours for excellent results. Avoid dairy products, red meat, caffeine, and refined sugar during the acute stages of this disorder.', 'external');
INSERT INTO products VALUES (89, 'Ear Clear', 'Ear Infection', 28, 'Ingredients  &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Mullein			Verbascum Thapsus

Coltsfoot		Tussilago Farfara

Forsythia		Lian Qiao

Lonicera		        Jin Yin Hua

Isatis root		Ban Lan Gen

Echinacea		Echinacea Angustifolia

Chrysanthemum	Ju Hua

Cnidium			Chuan Xiong

Balm Of Gilead	Populus Balsamifera

Magnolia flower	Xin Yi Hua

Siler				Fang Feng

Wild Indigo		Qing Dai

Goldenseal		Hydrastis Canadensis

Pulsatilla		Bai Tou Weng', 'Western Therapeutic Actions

Alterative, anti-viral, anti-bacterial, decongestant, nervine, 

demulcent, astringent, tonic, detergent, and antiseptic', 'Traditional Chinese Medicine

Clears heat, relieves toxicity, releases the exterior, and resolves dampness', 'Sample Indications

Ear infections, ear congestion, otalgia, ear inflammation, build-up of ear wax, otitis media, and swimmers ear', 'Suggested Dosage

1  2 teaspoons, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

Contraindicated during pregnancy. Ear pain might indicate a serious infection and could result in damaging the ear membrane or ear drum. If the condition persists, seek professional medical advise.', 'Notations 

Ear Clear is a wonderful example where Oriental and Galenic Medicine meld in herbal formulations. Mullein, the lead herb in this formula, is widely used in respiratory and ear formulas. The anti-inflammatory, resolvent, and resorbent qualities of Mullein make it a perfect herb for all ear canal inflammations. By adding the fresh Mullein flower to olive oil, one can make a wonderful ear drop remedy for all ages. 

Coltsfoot, known as Kuan Dong Hua in Oriental medicine, is an excellent expectorant and helps to resolve phlegm. Forsythia, Lonicera, Isatis root, and Echinacea help to relieve inflammation and clear heat. Chrysanthemum clears wind/heat. Cnidium expels wind and alleviates pain. Balm of Gilead, Magnolia flower and Siler are commonly used in resolving phlegmatic conditions of the sinuses and ear canals. Wild Indigo is an antiseptic and can be used externally on skin ulcers. Goldenseal, imbued with the two alkaloids, hydrastine and berberine, is a bitter tonic and helps to heal debilitated mucous membranes. Pulsatilla relieves fire toxicity.

Whenever there is an ear infection, mucous forming foods should be eliminated from the diet, especially dairy.

The following recipe creates an excellent home remedy for earaches: 

Grate 1/4 tsp. of ginger root and add to 1/4 tsp. of sesame oil. Warm slightly. Put two drops of this warm solution onto a sterile cotton ball and place in the ear. Reapply with a fresh cotton ball and two drops of the warm solution, three times daily.

*Salt pack - earache: See External Application', 'external');
INSERT INTO products VALUES (91, 'Echinacea Plus', 'Infection Immunity', 29, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Echinacea		Echinacea Angustifolia

Lonicera			Jin Yin Hua

Astragalus		Huang Qi

Oregon Grape	Berberis Aquafolium

Isatis leaf		Da Qing Ye

Osha			Ligusticum Porteri

Goldenseal		Hydrastis Canadensis

St. Johns Wort	Hypericum Perforatum

Propolis			Resina Propoli

Barberry			Berberis Vulgaris

Licorice			Gan Cao

Fennel			Foeniculum Vulgare', 'Western Therapeutic Actions

Anti-viral, anti-bacterial, carminative, alterative, analgesic, tonic, cholagogue, diuretic, and digestive', 'Traditional Chinese Medicine

CClears heat, relieves toxicity, supplements the qi, and harmonizes the stomach', 'Sample Indications

Acute febrile diseases, colds, flu, fevers, earaches, and bacterial or viral infections', 'Suggested Dosage

5 - 20 drops, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

Contraindicated in cases of yin deficiency with heat, or reckless movement of blood. Use with caution during pregnancy. Patients who are undergoing chemotherapy should not use this formula as it contains St. Johns Wort.', 'Notations 

Echinacea Plus is designed to treat the early stages of warm febrile and contagious diseases. This formula can be used at a lower dosage for preventative measures. This is especially important for the elderly, the young, or those suffering from a compromised immune system. 

Echinacea Angustifolia is the most medicinal of the Echinacea family. Mass marketed, overused, and now on the endangered species list, Echinacea Angustifolia has long been used throughout Europe and by the Plains Indians. After the summer harvest, the Fort Peck region of Montana looks like a waste land of turf balls due to all of the digging. This speaks to the importance of extracts versus tablets or capsules. When herbs are extracted, a minimum of ten times the amount of medicinal compounds from that herb can be obtained compared to using the dried form.

Lonicera is widely used for contagious diseases as it contains anti-viral and anti-bacterial qualities. Astragalus is a premier immune system stimulant and can be found in a wide variety of formulas. Oregon Grape root contains berberine, which is also found in Barberry, Coptis, Phellodendron and Goldenseal. Berberine treats damp/heat disorders and is an antiseptic. Isatis leaf has anti-viral and anti-bacterial actions, and in Oriental Medicine, this action is called, clearing toxic heat. Osha, or Bear root, is a strong anti-viral and anti-bacterial herb, especially for the respiratory system. In small dosages, it is used for protection and the release of negative energies. Fennel and Licorice protect the stomach from the other cooling herbs, which makes this formula effective for long-term use.', 'external');
INSERT INTO products VALUES (92, 'FLS  (flu like symptoms)', 'Flu Like Symptoms', 29, 'Ingredients&leftpar;Homeopathic&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Crawley Root			Corallorhiza Odontorhiza

Boneset				Eupatorium Perfoliatum

Phosphoric Acid		Phosphoric Acid

Aconite				Acontium Napellus

Bryonia				Bryonia Dioica', 'Western Therapeutic Actions

Anti-inflammatory, analgesic, antipyretic, diaphoretic, sedative, and febrifuge', 'Traditional Chinese Medicine

Releases pathogenic influences from the exterior', 'Sample Indications

Early stages &leftpar;first or second day only&rightpar; of fever from influenza, colds, with aches and pains', 'Suggested Dosage

5 - 20 drops, every 2 hours

Reduce dosage as symptoms subside

Variation is according to individual symptoms', 'Contraindications and Cautions

Discontinue the consumption of raw, cold, spicy, or greasy foods, coffee, and alcohol while taking this homeopathic remedy.', 'Notations

FLS &leftpar;flu like symptoms&rightpar; is a homeopathic remedy is often fast acting, and clears most fevers. If feverish conditions reoccur frequently, check for the cause, seat of toxicity, or deficiency. 

Remember that a fever is an attempt by the body to burn off toxic states. Rest and drink plenty of fluids.

Homeopathic Properties

Crawley Root	                 quick acting and powerful diaphoretic, muscular pain

Boneset		                 slow and persistent febrifuge and 

			                diaphoretic, bone pain

Phosphoric Acid	        debility and acute diseases, listless

Aconite			       syndromes that come on suddenly, 

			              out of the blue, anti-inflammatory

Bryonia			      relieves fevers and colds with a bronchial

                                      nature, pain aggravated by motion

 A *Tofu Plaster applied to the forehead is an excellent home remedy in bringing down fevers. Drink plenty of fluids during feverish conditions, get rest, and sip on some homemade broth.

*Tofu Plaster: See External Applications', 'external');
INSERT INTO products VALUES (93, 'Gargle Mouthwash', 'Mouth Gargle', 14, 'Ingredients &leftpar;Herbal Extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Marshmallow		Althea Officinalis

Myrrh			Mo Yao

Prickly Ash		Zanthoxylum Americanum

Bistort			Polygonurn Bistorta

Chaparral		        Larrea Mexicana

Tang Kuei		        Dang Gui

Rehmannia, raw	Sheng Di Huang

Red Sage		        Salvia Colorata

Raspberry leaf		Rubus Idaeus

Moutan			Mu Dan Pi

Rhatany Root		Krameria Triandra

Cimicifuga		Sheng Ma

Coptis			Huang Lian

Goldenseal		Hydrastis Canadensis

Peppermint		Bo He', 'Western Therapeutic Action

Antiseptic, anti-inflammatory, anti-bacterial, anti-viral, astringent, styptic, alterative, depurative, and demulcent', 'Traditional Chinese Medicine

Drains stomach fire, cools the blood, and nourishes the yin', 'Sample Indications

Bad breath, gingivitis, toothache, bleeding and sores of the gums, and frontal headache', 'External Application

Place one capful of Gargle Mouthwash in a small amount of cold water. Gargle for thirty seconds and expectorate the herbal liquid into the sink.

Repeat this 2 times daily for healthy gums and 

3 times daily for diseased gums or toothache.', 'Contraindications and Cautions

Externally, when used as a mouthwash, there are none known. If taken internally, this remedy is contraindicated for cases with a wind/cold condition &leftpar;pale tongue with thin white coating&rightpar;, or gum and teeth problems due to kidney deficiency &leftpar;pale, swollen tongue&rightpar; and during pregnancy.', 'Notations 

The stomach energy channel supplies the gums and teeth with blood and chi. When the stomach overheats, the smooth flow of chi becomes obstructed and gives rise to rebellious fire. The mouth cavity is adversely affected. Bleeding gums, mouth sores, toothache, and bad breath are some of the results of this injurious fire. This remedy can also be taken internally for severe conditions. Take 1/2 teaspoon, 3 times a day until the symptoms have decreased. Avoid heavy, rich foods &leftpar;creates heat&rightpar; or cold foods &leftpar;obstructs the movement of chi and transforms into fire&rightpar;. 

Marshmallow root, the lead herb in this remedy, is a demulcent, clears heat, and nourishes the yin. It soothes inflamed tissue membranes, moisturizes, and is used internally and externally. Myrrh is an antiseptic, cooling, and promotes tissue repair. Prickly Ash is an anti-infective and relieves toothaches. Bistort 

acts as an astringent, promotes tissue repair from gum diseases, and firms loose teeth. Chaparral is an anti-infective and antiseptic with qualities that help to clear fire toxicity. The aromatic Red Sage benefits the gum tissues and throat with its astringent and antiseptic properties. Rhatany Root is an astringent, promotes tissue repair, and benefits soft spongy gums.

The Chinese herbs used in this remedy are patterned after Qing Wei San. The Chinese herb, Coptis, is similar in action to Goldenseal, and is unsurpassed in its ability to drain fire. Raw Rehmannia and Moutan assist by cooling the blood. Tang Kuei promotes the movement of blood and the creation of new flesh.', 'external');
INSERT INTO products VALUES (94, 'Gum Lotion', 'Gum Disease', 16, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Myrrh			Mo Yao

Rhatany Root		Krameria Triandra

Tang Kuei		        Dang Gui

Prickly Ash		Zanthoxylum Americanum

Rehmannia, raw	Sheng Di Huang

Scute			Huang Qin

Goldenseal		Hydrastis Canadensis

Moutan			Mu Dan Pi

Cimicifuga		Sheng Ma

Coptis			Huang Lian

Propolis			Resina Propoli

Witch Hazel		Hamamelis Virginiana', 'Western Therapeutic Actions

Vulnerary, antiseptic, astringent, anti-bacterial, anti-viral, and alterative', 'Traditional Chinese Medicine

Clears heat, reduces swelling, and generates flesh', 'Sample Indications

Mouth sores, pyorrhea, gum disease, bleeding gums, and gingivitis', 'External Application

Brush the teeth and gargle with Gargle Mouthwash. 

Gently massage Gum Lotion onto the gums for one minute, 3 times daily

Mouth Sores:

Apply Gum Lotion directly onto mouth sores, 3 times daily', 'Contraindications and Cautions

Contraindicated during pregnancy.', 'Notations 

Oral hygiene is essential to combat gum disease. Consult with a dentist who practices preventative dentistry to establish a healing program. Gum disease and teeth problems can be due to an imbalanced digestive system, toxic heat in the blood, and/or depleted energy in the kidneys. If there are signs of deficiency, support the cleansing action of this remedy with restorative herbal remedies.

Gum Lotion and Gargle Mouthwash utilize the healing action of many of the same herbs as they are dealing with infection, tissue degeneration, and teeth problems. 

Propolis is a vulnerary with cleansing actions and Witch Hazel is an astringent.', 'external');
INSERT INTO products VALUES (95, 'Harmony Lotion', 'Abcesses, Bed Sores', 1, 'Ingredients &leftpar;Herbal Extracts&rightpar;

Listed by common and pin yin or latin names, in sequence from largest to smallest amount by quantity.

Plantain		        Plantago Spp.

Comfrey leaf		Symphytum Officinalis

Echinacea		        Echinacea Angustifolia

Goldenseal		Hydrastis Canadensis

St. Johns Wort		Hypericum Perforatum

Dragons Blood		Xue Jie

Typha			Pu Huang

Calendula		        Calendula Officinalis

Witch Hazel		Hamamelis Virginiana', 'Western Therapeutic Actions

Vulnerary, alterative, depurative, antiseptic, anodyne, analgesic, and astringent', 'Traditional Chinese Medicine

Clears toxins, dispels blood stasis, alleviates pain, and generates flesh', 'Sample Indications

Wounds, injuries, surgery, sprains, fractures, and physical traumas', 'External Application

Apply topically to the affected area, 3 times daily', 'Contraindications and Cautions

There are none known.', 'Notations

This topical lotion restores balance to the tissues and eases discomfort. It is specifically useful in the healing of wounds where the flesh has been injured or cut.', 'external');
INSERT INTO products VALUES (96, 'Lymph Clear', 'Lymph Cleanser', 29, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Burdock root			Arctium Lappa

Echinacea			Echinacea Angustifolia

Scrophularia			Xuan Shen

Forsythia			Lian Qiao

Lonicera				Jin Yin Hua

Sarsaparilla			Smilax Officinalis

Bladderwrack		Fucus Vesiculosus

Prunella				Xiao Ku Cao

Poke Root			Phytolacca Spp.

Uva Ursi				Arctostaphylos Uva Ursi

Goldenseal			Hydrastis Canadensis

Goldenrod			Solidago Virgaurea

Neem				Azadirachta Indica', 'Western Therapeutic Actions

Alterative, depurient, absorbent, diuretic, and antiseptic', 'Traditional Chinese Medicine

Disperses wind/heat, clears heat, and relieves toxicity', 'Sample Indications

Initial stages of infectious and contagious diseases, colds, flu, upper respiratory tract infection, acute bronchitis, swollen lymph nodes, and measles', 'Suggested Dosage

5 - 20 drops, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

Contraindicated during pregnancy.', 'Notations

Lymph Clear is highly beneficial when taken at the first signs of an infectious or contagious disease, and prevents the infection from descending deeper into the lower respiratory tract. Lymph Clear is also very effective for cleansing of the lymphatic system in the absence of an infectious or contagious disease. Difficult glandular blockages have responded well to Lymph Clear, including small breast lumps that occur during menstruation. 

A synergy of time proven Western herbs and two Chinese formulas, Jie Geng Tang or Platycodon Decoction and Yin Qiao San or Lonicera and Forsythia Formula creates Lymph Clear. One of the functions underlying this herbal formula, according to Oriental Medicine, is to expel the external pathogenic influence &leftpar;febrile disease/viral or bacterial&rightpar; before it penetrates deeper into the body. 

Burdock root treats a broad range of disharmonies. One of its functions is purification, and has the ability to cleanse the lymph system. Burdock seed is used primarily for treating the throat and resolving skin blemishes. Sarsaparilla supports Burdock root with its eliminative, diaphoretic, and detoxicant actions. Forsythia and Lonicera are a classic combination when treating infectious and contagious diseases in their early stages. Bladderwrack, Scrophularia, and Prunella help to resolve enlarged lymph nodes. Poke Root is a strong detoxicant and clears lymph and liver congestion. Uva Ursi, with its diuretic actions and with support from Goldenrod, expels the toxins via the kidneys. Goldenseal drains the damp/heat and heals the mucous membranes. Neem, an Ayurvedic herb, supports the actions of this formula with its anti-viral, anti-bacterial, and cleansing actions.

Avoid drafts, eat plenty of homemade soups, eat some garlic, drink peppermint tea, and rest. Hot spicy foods, dairy, seafood, alcohol, and caffeine should be avoided during any infectious disease. Let your body rest and heal.', 'external');
INSERT INTO products VALUES (97, 'Red Eye', 'Eye Inflammation', 29, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Chrysanthemum	     Ju Hua

Morus leaf		     Sang Ye

Fraxinus			    Qin Pi

Lophatherum	    Dan Zhu Ye

Cassia seed		    Jue Ming Zi

Nettles			    Urtica Spp.

Marshmallow		    Althea Officinalis

Buddleia			    Mi Meng Hua

Tribulus			    Bai Ji Li

Raspberry leaf	    Rubus Idaeus

Bilberry			    Vaccinium Myrtillus

Eyebright		    Euphrasia Officinalis

Bayberry			    Myrica Cerifera

Goldenseal		    Hydrastis Canadensis', 'Western Therapeutic Actions

Antiseptic, detoxicant, astringent, anti-inflammatory, demulcent, and emollient', 'Traditional Chinese Medicine

Drains liver fire, benefits the eye, and dispels wind/heat', 'Sample Indications

Conjunctivitis, styes, allergies, itchy eyes, excessive tearing, blood shot eyes, and as an adjunct therapy for failing vision, cataracts, glaucoma, and retinal displacement', 'Suggested Dosage

5 - 20 drops, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

Contraindicated during pregnancy.', 'Notations

Red Eye is a modified version of Sang Ju Yin or Morus and Chrysanthemum Combination, and reflects the Oriental and Galenictraditional concepts that the health of the eye is connected to the functioning of the liver. In Oriental Medicine, the herbs used in this formula are noted for their ability to clear the excess heat from the liver and expel the wind/heat which can cause various types of inflammations. 

Chrysanthemum, Morus leaf, and Cassia seed clear the liver, benefit the eye, and expel wind/heat. Fraxinus, Lophatherum, and Goldenseal alleviate styes, and red inflamed eyes. Nettles is a detoxicant and blood builder. Marshmallow soothes irritated mucous membranes. Buddleia expels wind and soothes inflamed eyes with excessive tearing. Tribulus calms the liver and anchors the yang, which benefits the eye. Raspberry leaf is an anti-inflammatory, astringent, and promotes tissue repair. Bilberry and Eyebright are detoxicants and restore the vision. Bayberry is an astringent and circulatory stimulant.

After the acute symptoms have been alleviated, herbal formulas that nourish the blood and yin of the liver and kidney could be considered.

Dietary recommendations include the removal of alcohol, fried foods, caffeine and red meat during the healing process. A diet rich in dark green vegetables, fruits, olive oil, nuts and seeds, fish, and rice will benefit the healing of the liver. 

Chronic frustration, irritability, anger, and the inability to express deep seated emotions are healed by deep compassion. A fiery eye holds contempt and blurred vision is the resistance to look clearly at the reality of this world and our predicament.', 'external');
INSERT INTO products VALUES (98, 'Skin Fire', 'Hives', 29, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Shave Grass			Mu Zei

Neem				Azadirachta Indica

Burdock root			Arctium Lappa

Burdock seed		Niu Bang Zi

Tribulus				Bai Ji Li

Meadowsweet		Filipendula Ulmaria

Red Clover			Trifolium Pratense

Schizonepeta			Jing Jie

Cicada				Chan Tui

Mistletoe			Viscum Album

Couchgrass			Agropyron Repens

Goldenseal			Hydrastis Canadensis

Wahoo				Euonymus Atropurpureus

Mezereum			Daphne Mezereum', 'Western Therapeutic Actions

Antihistaminic, antipyretic, alterative, depurative, antacid, diuretic, demulcent, and anti-inflammatory', 'Traditional Chinese Medicine

RReleases the exterior, clears heat, and relieves toxicity', 'Sample Indications

Hives, allergic skin rashes, red and itchy skin, and eczema', 'Suggested Dosage

10 - 40 drops, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

Contraindicated during pregnancy.', 'Notations

Skin Fire infuses the herbal wisdom of the Orient and the West in dealing with hives. Shave Grass combines with Tribulus to disperse wind/heat and calm the liver. Neem is an analgesic and antipyretic. Meadowsweet is an analgesic, antipyretic, and anti-inflammatory. Red Clover is a detoxicant with cooling actions and a relaxant. Schizonepeta and Cicada vent rashes and alleviate itching. Mistletoe is a nervine and relaxant. Couchgrass, somewhat similar to the Chinese Coix &leftpar;Yi Yi Ren&rightpar;, is a diuretic and soften skin masses and draws out pus. Couchgrass is also a strong detoxicant or purifier. Goldenseal is an alterative and detergent. Wahoo is an alterative and cholagogue. Mezereum is an anti-inflammatory used for eczema and skin disorders.

Burdock root helps to clear toxicity through the kidneys while Burdock seed helps to release surface heat and relieve toxicity by venting. This is an interesting combination of two different parts of an herb. Western herbalists rely upon the root and Oriental herbalists rely upon the seed. When used together, they create a wonderful synergy in supporting the actions of this herbal formula. 

If the skin reaction is an allergic reaction to food, Ginger tea or Licorice tea will help to eliminate the allergen. Ginger tea will also relieve a toxic reaction to an herb. Avoid hot spicy foods during an outbreak of the hives!

Hives might have a strong repugnant or repulsive emotional component linked to an outbreak. In dealing with this type of reaction, a safe environment is provided for, and the patient encouraged to express what it is that they find so repugnant. It is important to welcome these feelings without any desire to fix or change them. Emotions are an integral part of our inner life. In the acknowledgment of our feelings, we become less reactive and less compulsive in our behavior.', 'external');
INSERT INTO products VALUES (114, 'Joint Ease', 'Arthritis, Joint Pain', 28, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Burdock root		   Arctium Lappa

Meadowsweet	   Filipendula Ulmaria

Boswellia		   Boswellia Serrata

Couchgrass		   Agropyron Repens

Gentiana, macro.	   Qin Jiao

Turmeric		   Curcuma Longa

Du Huo			   Tu Huo

Prickly Ash		   Zanthoxylum Americanum

Tang Kuei		   Dang Gui

Morus twig		   Sang Zhi

Wintergreen		   Gaultheria Promcumbens

White Willow bark	   Salix Alba

Uva Ursi			   Arctostaphylos Uva Ursi

Guaiacum		   Guaiacum Officinale 

Ginger, dried		   Gan Jiang', 'Western Therapeutic Actions

Anti-inflammatory, analgesic, diuretic, alterative, depurative, and antacid', 'Traditional Chinese Medicine

Dispels wind/dampness, and disperses painful obstruction', 'Sample Indications

Arthritis, rheumatism, bursitis, stiff and achy joints, lumbago, and osteoarthritis', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

There are none known.', 'Notations

Joint Ease helps to clear acid deposits in the joints and the surrounding tissues, relieves pain, and supports joint lubrication and mobility. There are a number of causes for joint pain: hereditary, environmental, dietary, work-related, and emotional. The more difficult cases lie in the hereditary factor. The imbalance has been carried for many generations and the underlying disorder has never been corrected. The immobility of the joints or lack of freedom of movement seems to hold the patient back in life. Generational disorders take patience to heal and for many people, the results of the work and effort done in this lifetime may not be completely experienced, but the benefits, as the essence is replenished, will be seen in the future generations. 

This applies to many things in our lives; our commitment and effort to heal ourselves, secure our families, or revitalize our communities. The results we are hoping for may not happen in our lifetime, but will be healed one generation at a time. Moving forward means that we must first, take care of the past, in order to be present, so that we can dream the future. This is life, living! Movement is life as it continues to unveil its beauty. On an emotional level, allow it and let go of any resistance.

Burdock root will be found in many formulas when dealing with joint problems. Over a period of time, toxic build up in the blood can eventually end up in the joints. The outcome is joint pain and a body that has become too acidic. Burdock root is a premier herb when there is a calling for blood purification. The herb is easy to grow. The seeds can be collected and used for skin disorders, and the root can be dug, washed, and used in a variety of vegetable dishes. The Macrobiotic diet uses this herb extensively in its powerful healing programs.  

See Muscular & Skeletal External Formulas for additional support', 'external');
INSERT INTO products VALUES (99, 'VBX', 'Chronic Bacterial And Viral Infection', 28, 'Ingredients  &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Oats				Avena Sativa

Gynostemma			Jiao Gu Lan

Astragalus			Huang Qi

Skullcap				Scutellaria Lateriflora

Burdock root			Arctium Lappa

Echinacea			Echinacea Angustifolia

Wild Indigo			Baptisia Tinctoria

Sarsaparilla			Smilax Officinalis

Oldenlandia			Bai Hua She She Cao

Forsythia			Lian Qiao

Meadowsweet		Filipendula Ulmaria

Poke Root			Phytolacca Spp.

Goldenseal			Hydrastis Canadensis

St. Johns Wort		Hypericum Perforatum

Uva Ursi				Arctostaphylos Uva Ursi

Goldenrod			Solidago Virgaurea', 'Western Therapeutic Actions

Anti-bacterial, anti-viral, alterative, depurative, nerve tonic, nervine, antacid, antiseptic, and diuretic', 'Traditional Chinese Medicine

Supplements the protective qi, clears heat, relieves toxicity, and cools the blood, and vitalizes the blood', 'Sample Indications

Chronic infections, viral and bacterial infections, chronic fatigue syndrome, Epstein-Barr virus, Lyme disease, and lupus', 'Suggested Dosage

1/2  1 teaspoon, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions 

Contraindicated during pregnancy.', 'Notations

VBX is carefully designed to treat chronic fatigue, inflammation, and infection. The strategy is two-fold; to clear the toxicity and to strengthen the immune system. A well-balanced herbal formula addresses these two energetic opposites without compounding the problem. 

Oats, Gynostemma, and Astragalus are nutritive and immune system enhancers, while Burdock root, Wild Indigo, and Oldenlandia are excellent purifiers and detoxicants. Skullcap is a nervine, an antispasmodic, and an analgesic, which helps to relieve pain. Echinacea is an antiseptic and alterative, useful for all situations due to impurities of the blood. Wild Indigo is an antiseptic and purgative. Sarsaparilla is an alterative and used traditionally for syphilis. Forsythia clears heat and relieves toxicity. Meadowsweet and Goldenrod have diuretic actions helping to eliminate toxins through the kidneys. Poke root is an alterative and depurative, and helps to resolve lymphatic congestion. Goldenseal is a bitter tonic and resolves inflammation of the mucous membranes. St. Johns Wort with its diuretic and anti-inflammatory action, assists in the cleansing of the body from unwanted toxicity. Uva Ursi further drains the toxins through the kidneys as they are being released by the blood purifying herbs. 

A diet rich in green vegetables and fruit helps to cool and thin the blood. Saunas support the purification process; sweating out toxicity, stimulating the circulation, and strengthening the immune system. 

Unloading the emotional back-pack creates space and lightens the load for a healthier immune system to operate from. Chronic imbalances, suffering, and pain are debilitating, and requires a committed team of caring individuals to support someone through the healing process.', 'external');
INSERT INTO products VALUES (100, 'Antiseptic Healing Ointment', 'Cleanses Heals Wounds', 5, 'Ingredients  &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Goldenseal			Hydrastis Canadensis

Echinacea			Echinacea Angustifolia

Lithospermum		Zi Cao

Tang Kuei			Dang Gui

Calendula			Calendula Officinalis

Plantain				Plantago Spp.

Angelica dah.		Bai Zhi

Beeswax

Olive Oi', 'Western Therapeutic Action

Vulnerary, antiseptic, anti-inflammatory, astringent, anti-fungal, alterative, and depurative', 'Traditional Chinese Medicine

Clears heat, clears toxicity, and invigorates the blood', 'Sample Indications

The skin or epithelial tissues are wounded, irritated or inflamed; cuts, abrasions, ulcers, wounds, chapped skin and lips, cracked nipples, fissures, bedsores, and chilblains', 'External Application

Cleanse wounded area thoroughly before applying this ointment. After cleansing the wound, apply ointment to the affected area, or smear a small amount of ointment onto a sterile gauze and tape to area, 3 times daily', 'Contraindications and Cautions

If the gauze sticks to the wound, moisten with warm water before trying to remove. Contact a physician immediately if the infected area begins to have hot, red streaks.', 'Notations 

This salve stimulates the regeneration of damaged tissues and their blood vessels. Care should be taken to keep the wound or broken skin area clean, and away from possible sources of blood infections; stay out of public pools, away from dirt, and avoid contact with chemicals. 

Goldenseal is an anti-infective and detergent. It is very similar to the Chinese herb, Coptis, as they are both rich with the alkaloid, berberine. Echinacea is a detoxicant with anti-viral and anti-bacterial qualities, and is very effective for tissue trauma.

Lithospernum supports Echinacea, as it is a detoxicant, clears heat, cools the blood and relieves fire toxicity. Tang Kuei helps to heal tissue trauma and promotes the formation of new skin tissue. Angelica dah. is an analgesic and has anti-bacterial qualities. It will assist in the dispelling of any pus from a sore or cut.

Calendula is an anti-fungal and helps to heal injured tissues. Plantain assists in healing tissue wounds.', 'external');
INSERT INTO products VALUES (101, 'Antiseptic Lotion', 'Cuts, Wounds', 17, 'Ingredients &leftpar;Herbal Extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Goldenseal		Hydrastis Canadensis

Lithospernum		Zi Cao

Dragons Blood		Xue Jie

Myrrh			Commiphora Myrrha

Echinacea	         	Echinacea Angustifolia

Calendula	         	Calendula Officinalis

Aloe Juice	         	Lu Hui

Witch Hazel		Hamamelis Virginiana', 'Western Therapeutic Action

Vulnerary, antiseptic, anti-inflammatory, anti-bacterial, anti-viral, anti-fungal, analgesic, emollient, and astringent', 'Traditional Chinese Medicine

Clears heat, clears toxicity, vitalizes the blood, and stops pain', 'Sample Indications

The skin or epithelial tissues are wounded; cuts, abrasions, 

ulcers, wounds, bed sores, herpes simplex, chilblains, and 

fissures', 'External Application

Cleanse wounded area thoroughly before applying this lotion. Apply directly with a sterile cotton swab, or dilute a small quantity in clean warm water before applying to affected area, 

3 times daily', 'Contraindications and Cautions

Consult a qualified health care practitioner if the wound becomes infected and fails to heal.', 'Notations 

This is an effective topical cleanser and helps to clear and prevent surface tissue infections. After the use of Antiseptic Lotion, keep the affected area clean and free from dirt and other sources of infection, until healing is complete. 

Aloe Vera, as a vulnerary, cools and cleanses the blood, and supports tissue repair. Witch Hazel is an astringent, which assists in the binding of tissues together. Dragon''s Blood stimulates blood circulation, generates flesh, reduces swelling, and stops bleeding. It acts as an anodyne, similar to Myrrh resin, and has antiseptic properties. When combined with Lithospermum, they provide strong antiseptic properties. Echinacea is an alterative, antiseptic, and is useful for all infections and impurities in the blood. Calendula is beneficial for ulceration of the skin, promotes tissue repair, and is an anti-inflammatory.', 'external');
INSERT INTO products VALUES (102, 'Arnica Cream', 'Bruises With No Broken Skin', 15, 'Ingredients  &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Arnica		  Arnica Montana

Beeswax

Olive Oil', 'Western Therapeutic Actions

Anti-inflammatory, anti-traumatic, anodyne, and analgesic', 'Traditional Chinese Medicine

Clears heat, moves the blood, and alleviates pain', 'Sample Indications

Bruises, contusions, and inflamed muscles where there is no evidence of broken skin tissue', 'External Application

Apply ointment liberally onto the affected area only if the skin tissue is NOT BROKEN, 

3 times daily', 'Contraindications and Cautions

Do not apply to areas that have broken skin as this could cause inflammation.', 'Notations 

Following trauma, the body will often need more rest than usual. It is best to comply. Alternating between hot and cold compresses at the onset of an injury provides circulatory and anti-inflammatory benefits. After 48 hours, a hot compress, without a cold compress, is the common procedure. Applying too much cold or ice can injure the tissues and cause blood stagnation.

Arnica flower is an excellent anti-inflammatory. This formula, if used immediately following any trauma to the muscular or skeletal system can provide immediate relief. It is an anodyne, reduces swelling, and promotes tissue repair. Beware of any broken skin. If the skin tissue is broken, Arnica can not be applied or used as it may cause inflammation.', 'external');
INSERT INTO products VALUES (103, 'Bleeding Powder', 'Stops Bleeding', 33, 'Ingredients&leftpar;Herbal powders&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Pseudoginseng		Tien Chi

Slippery Elm			Ulmus Fulva', 'Western Therapeutic Actions

Styptic, antihemorrhagic, hemostatic, emollient, and demulcent', 'Traditional Chinese Medicine

Arrests bleeding and disperses stagnant blood', 'Sample Indications

Internal

Active or passive internal hemorrhaging; internal injuries, 

ulcerative colitis, uterine fibroids, strained or torn ligaments, 

cardiovascular disorders, and angina

		External

Bleeding cuts, wounds, and abrasions', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 

3 times daily

Variation is according to individual symptoms

External Application

Topically, apply the powder directly to the 

affected area after cleansing. Use in a generous manner and cover with a sterile gauze.

ü', 'Contraindications and Cautions

Contraindicated during pregnancy. With all cases of bleeding, it is critical that the root cause of the bleeding disorder be treated.', 'Notations 

Tien Chi &leftpar;Pseudoginseng&rightpar;, a rare and legendary herb, is widely used in the Orient. It has the remarkable ability to arrest bleeding without causing blood stasis. A Chinese patent formula, Yunnan Pai Yao, is one of the most commonly used formulas in treating injuries, of which Tien Chi is the main ingredient. Currently in China, Tien Chi is being used during cancer therapy, as it has been claimed to help tumors reduce in size more rapidly, and help reduce the damage to healthy tissues during radiation treatments. 

Tien Chi is also used in a cooked form. When used cooked, it has the ability to tone the blood and qi, but loses some of its blood regulation qualities.

Slippery Elm is a nutritive demulcent &leftpar;soothes the mucous membranes&rightpar;, emollient &leftpar;soothes the skin&rightpar;, and reduces inflammation. 

This styptic formula is an excellent addition to any First Aid Kit. 

Bleeding Powder can be ordered in larger sizes when being used as an adjunct therapy to radiation treatments.', 'external');
INSERT INTO products VALUES (105, 'Bzzz Bite', 'Bee Sting', 29, 'Ingredients

&leftpar;Herbal Extracts and Homeopathic&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Lobelia		Ban Bian Lian

Neem		Azadirachta Indica

Dandelion	Pu Gong Ying

Homeopathic

Apis Mel', 'Western Therapeutic Actions

Counter-irritant, anti-inflammatory, and specific', 'Traditional Chinese Medicine

Cools the blood and relieves fire toxicity

ü', 'Sample Indications

Bee stings, wasp stings, insect bites', 'Suggested Dosage

5 - 20 drops every 30 minutes

Gradually reduce the dose and frequency as the swelling and discomfort reduces

Variation is according to individual symptoms', 'Contraindications and Cautions

For some people, bee or insect stings can cause severe and sometimes fatal allergic reactions; if a person is known to be allergic to bee stings, seek immediate qualified medical assistance.', 'Notations 

A paste made from baking soda and water, applied to the area of the sting, helps clear the heat, pain, and residual itching. If you have a yellow onion, slice it and apply directly to the bee sting. Wrap a bandage around the area to hold the onion firmly in place on top of the bee sting. This helps detoxify the poison, relieve the swelling, and alleviate itch.

Lobelia is a detoxicant and relieves fire toxicity. It can be used internally or externally for bee, wasp, or snake bites. Neem, an Ayurvedic herb, is used for poisonous insect bites and is a premier cleanser and purifier of the blood. Dandelion relieves fire toxicity and helps to dissipate hard swollen nodules such as swellings from insect stings.

Homeopathic Properties

Apis Mel &leftpar;Honey Bee&rightpar;

	for puffing or swelling of sting, pain, irritated by touch, 		red and inflamed', 'external');
INSERT INTO products VALUES (106, 'Eye Wash', 'Eye Irritation', 37, 'Ingredients &leftpar;Herbal Extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Pulsatilla	         	Bai Tou Weng

Coptis			Huang Lian

Eyebright	         	Euphrasia Officinalis

Marshmallow		Althea Officinalis

Raspberry leaf		Rubus Idaeus

Sassafras	         	Sassafras Albidum

Goldenseal		Hydrastis Canadensis', 'Western Therapeutic Actions

Soothing, cleansing, astringent, demulcent, and antiseptic', 'Traditional Chinese Medicine

Clears heat and toxicity', 'Sample Indications

Conjunctivitis, pink eye, itchy allergy eyes, tired eyes, bloodshot eyes, keratitis, cataracts, glaucoma, and retinal displacement', 'External Application

Place 3 - 5 drops in a sterile eye cup, filled with room-temperature, sterile water. Mix well. Wash eye with this mixture, 3 times daily, using a separate mixture for each eye.  Keep eye wide open while washing. Sterilize eye cup before each use.', 'Contraindications and Cautions

The amount of drops used may vary with each individual. If it seems too strong, lower the number of drops. Take care not to contaminate the dropper, bottle, or eye cup. Sterilize the eye cup before each use &leftpar;boil for 5 minutes&rightpar;.  

Discontinue use of this remedy if it creates redness or irritation. If symptoms persists for more than a few days, seek the advise of a qualified health care practitiioner.', 'Notations 

Pulsatilla, the lead herb, is also known as Pasque flower. It is used similarly in the East-West traditions. In Eye Wash, the heat clearing, antiseptic, anti-infective, and diaphoretic qualities of Pulsatilla are relied upon. This is supported with Coptis and Goldenseal. The herb, Eyebright, with it''s cooling, antiseptic, astringent, and anti-inflammatory actions, relieves eye irritation and pain, removes surface obstructions from the eyes &leftpar;corneal macula and nebula, cataracts&rightpar;, and helps to restore the vision. Being able to cleanse and restore simultaneously, makes Eyebright a treasured flower. Marshmallow is used externally as a wash, when redness, irritation, and pain are present. Raspberry leaf is used externally when inflammation, swelling, and discharge are present.

Eye and vision problems often relate to liver imbalances. Eliminate spicy foods, alcohol, caffeine and egg products from the diet until the symptoms have cleared. Drink Chrysanthemum tea and eat plenty of dark green vegetables daily. Wear sunglasses to protect the eye when outdoors. As with all external applications, it is wise to include an internal herbal remedy to address the imbalance being presented.', 'external');
INSERT INTO products VALUES (107, 'Oak Bite', 'Poisin Oak', 29, 'Ingredients &leftpar;Herbal Extracts and Homeopathic&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Burdock seed	     Niu Bang Zi

Neem			     Azadirachta Indica

Chrysanthemum	     Ju Hua

Cicada			    Chan Tui

Peppermint		    Bo He

Homeopathic

Poison ivy		    Rhus Toxicodendron', 'Western Therapeutic Actions

Anti-allergenic, anti-inflammatory, and specific', 'Traditional Chinese Medicine

Clears wind/heat and vents rashes', 'Sample Indications

Specific for contact dermatitis associated with Poison Oak and Poison Ivy', 'Suggested Dosage

5 - 20 drops every 2 hours

Gradually reduce the dose and frequency as the itching and discomfort subsides

Variation is according to individual symptoms', 'Contraindications and Cautions

There are none known.', 'Notations

Oak Bite helps to relieve itching, prevent blisters, and eliminate the toxins from the body. Oak Bite combines herbal extracts with the homeopathic remedy, Rhus Tox., a specific for contact with poison ivy or poison oak.

Burdock seed, Cicada, Chrysanthemum, and Peppermint combine well together in venting rashes and dispersing wind/heat. Neem, an Ayurvedic herb, is a blood purifier and detoxicant. It is used for a variety of inflammatory skin conditions. This herb can be used externally as a poultice.

Taking a cool bath, twice daily, in baking soda or oatmeal is beneficial and will help to allay the itch. Aloe Vera, applied topically, can soothe the skin. Small drinks of Nettle tea may also be beneficial. Nettle tea can be applied externally for sting-like burns.

An *alkaline diet will offset the acidic condition brought on by this rash.

*Acid / Alkaline Chart: See page 47', 'external');
INSERT INTO products VALUES (108, 'Poultice Powder', 'Sprains Strains', 32, 'Ingredients &leftpar;Herbal powders&rightpar;

Listed by common and pin yin or latin names, in sequence from largest to smallest amount by quantity.

Slippery Elm 		Ulmus Fulva

Arrowroot	         	Maranta Arundinacea

Comfrey root		Symphytum Officinale', 'Western Therapeutic Actions

Antiseptic, anti-inflammatory, absorbent, and demulcent', 'Traditional Chinese Medicine

Clears toxic heat', 'Sample Indications

Bleeding cuts, wounds, boils, ulcers, and abrasions that require cleansing before new skin tissue forms', 'External Application

Take a small amount of powder, mix to a paste in a little hot water. Apply hot to boils and ulcers; allow to cool before applying to wounds. Cover with sterile gauze to hold in place. Repeat application 3 times daily, until area is c', 'Contraindications and Cautions

There are none known.', 'Notations

Poultice Powder is an excellent external cleanser and healing agent. Whenever dealing with infections, combine this remedy with an internal herbal cleansing remedy. Apply a poultice of grated raw potato if the wound does not respond to a warm poultice. Reapply a cold fresh poultice, twice daily or every 2-4 hours for severe cases.', 'external');
INSERT INTO products VALUES (109, 'Sprain Bruise Lotion', 'Pain Relief', 1, 'Ingredients &leftpar;Herbal Extracts&rightpar;

Listed by common and pin yin or latin names, in sequence from largest to smallest amount by quantity.

Comfrey leaf		Symphytum Officinale

Carthamus		Hong Hua

Frankincense		Ru Xiang

Myrrh			Mo Yao

Moutan			Mu Dan Pi

Persica			Tao Ren

Calendula	         	Calendula Officinalis', 'Western Therapeutic Action

Vulnerary, soothing, analgesic, anti-inflammatory, anodyne, demulcent, and astringent', 'Traditional Chinese Medicine

Invigorates the blood, resolves blood stasis, and relieves pain', 'Sample Indications

Injuries, strains, and inflammations of the muscles, ligaments, tendons and joints', 'External Application

Apply liberally to the affected or traumatized area, 3 times daily', 'Contraindications and Cautions

There are none known.', 'Notations

Use a complementary internal remedy with all external applications. This will support the healing process and strenghten the injured area.', 'external');
INSERT INTO products VALUES (110, 'Venom Bite', 'Snake, Spider Bite', 29, 'Ingredients&leftpar;Herbal Extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Neem				  Azadirachta Indica

Burdock root			  Arctium Lappa

Oldenlandia			  Bai Hua She She Cao

Violet				  Zi Hua Di Ding

Swallowwort root		  Bai Wei

Figwort				  Scrophularia Nodosa

Wild Indigo			  Baptisia Tinctoria

Poke Root			  Phytolacca Spp.

Lonicera				  Jin Yin Hua

Chrysanthemum, wild	  Ye Ju Hua', 'Western Therapeutic Actions

Detoxicant, anti-inflammatory, anodyne, analgesic, alterative, diaphoretic, diuretic, and absorbent', 'Traditional Chinese Medicine

Clears heat, strongly relieves fire toxicity, and reduces swelling

ü', 'Sample Indications

Snake bites and insect bites', 'Suggested Dosage

20 - 40 drops every 2 hours

Gradually reduce the dose and frequency as the symptoms subside

Variation is according to individual symptoms', 'Contraindications and Cautions

Snake bites and insect bites may be life threatening. It is advisable to seek medical care as quickly as is possible. Panic will increase the flow of toxins in the body by increasing the heart rate. Stay calm! Focus on your breath. Inhale....Exhale. Slow everything down!', 'Notations

Venom Bite is a specific formula for toxic snake and insect bites. It will help purify the blood and lymph from the venom, and ease the swelling and discomfort. Venom Bite is also applied externally as a poultice on the area that was bitten. The most effective treatment is when Venom Bite is used simultaneously, externally and internally.

Neem, an Ayurvedic herb and an excellent blood purifier, has traditionally been used for poisonous insect and snake bites. Burdock root, the premier Western blood purifier, supports Neem. Oldenlandia, Violet, Swallowwort root, and Lonicera clear heat and strongly relieve toxicity. Figwort purifies the blood and lymphatic systems. Wild Indigo is an antiseptic. Poke root is an alterative and depurative and cleanses the lymph system. Chrysanthemum &leftpar;wild&rightpar; drains fire and relieves toxicity.', 'external');
INSERT INTO products VALUES (111, 'Bone Save', 'Osteoporosis', 28, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Dipsacus		 Xu Duan

Rehmannia, prep.	 Shu Di Huang

Drynaria			Gu Sui Bu

Eucommia		Du Zhong

Boswellia		Boswellia Serrata

Loranthus		Sang Ji Sheng

Deer Antler		Lu Rong

Tang Kuei		Dang Gui

Millettia			Ji Xue Teng

Du Huo			Tu Huo

Comfrey root	Symphytum Officinale

Cyathula			Chuan Niu Xi

Cinnamon bark	Rou Gui

Licorice, baked	Zhi Gan Cao', 'Western Therapeutic Actions

Tonic, restorative, and regenerative', 'Traditional Chinese Medicine

Fortifies the kidney yang, nourishes the blood, ligaments and tendons, and vitalizes the blood', 'Sample Indications

Osteoporosis, weaknesses of the skeletal system, bone loss, 

osteoarthritis, fractures or broken bones, chronic low back pain, and cold lower body', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

Contraindicated in patients with heat from yin deficiency, blood heat, lung heat, or warm febrile diseases.', 'Notations 

Bone Save is called upon when the kidney yang is waning and the blood is in need of nourishment and vitalization. Bone Save, addresses the natural aging process, when the bones have become more porous, fragile, or have difficulty in mending. Herbal formulas that rectify kidney yang deficiency and liver blood deficiency enhance the healing process of all types of fractures or broken bones.

In Oriental Medicine, the kidneys are responsible for the strength of the bones, while the liver nourishes the tendons and ligaments. When treating this disorder, these two organs systems benefit by being flooded with nourishment with herbal formulas patterned like Bone Save.

If signs of heat are evident in the patient, herbs to address the internal heat must be given first, before the kidney yang is augmented. A dry mouth, with thirst and desire for cold beverages, and with the presence of a red tongue characterizes internal heat. The rule of thumb in herbal medicine is to clear heat before tonification. If signs of deficiency are accompanied with signs of heat, consider some restorative herbs or formulas. Keep the dosage of restorative herbs lower until the heat signs have been ameliorated.

Dietary changes are often recommended with conditions of weak bones. An increase in organic vegetables, seaweed, and fish is recommended along with the following supplements; Vitamin A, Vitamin C, Vitamin D, Cod Liver Oil, and the minerals Calcium, Magnesium, and Zinc. Remember to always take Calcium and Magnesium together for better absorption.

See Muscular & Skeletal External Formulas for additional support', 'external');
INSERT INTO products VALUES (123, 'Strong Back', 'Low Back Pain', 28, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Dipsacus			Xu Duan

Boswellia			Boswellia Serrata

Eucommia			Du Zhong

Rehmannia, prep.		Shu Di Huang

Du Huo				Tu Huo

Gentiana, macro.		Qin Jiao

Clematis				Wei Ling Xian

Chaenomeles 		Mu Gua

Atractylodes, red		Cang Zhu

Tang Kuei			Dang Gui

Sarsaparilla			Smilax Officinalis

Ligusticum			Gao Ben

Cyathula				Chuan Niu Xi

Cinnamon bark		Rou Gui', 'Western Therapeutic Actions

Restorative, nutritive, anodyne, anti-inflammatory, antispasmodic, analgesic, and nerve tonic', 'Traditional Chinese Medicine

Fortifies the kidney yang, nourishes the liver and the blood, dispels wind/dampness, and alleviates painful obstructions', 'Sample Indications

Lumbago, sciatica, pain in the lower body, stiffness and weakness in the lower back and knees, osteoarthritis, and rheumatoid arthritis', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

Contraindicated during pregnancy.', 'Notations

Strong Back and Pain Be Gone share a similar herbal foundation based on the Chinese classic, Du Huo Ji Sheng Tang or Tu Huo and Loranthus Combination. Strong Back, a modified version of San Bi Tang or Tu Huo and Gentian Combination, differs from the original formula in that it focuses primarily on strengthening the bones and sinews of the lower body &leftpar;kidney and liver function&rightpar;, and secondarily, on expelling the wind/damp condition in order to alleviate the obstruction and the pain. This illustrates the importance of being able to distinguish the patterns a patient is presenting and addressing the primary disorder. In Oriental Medicine, Strong Back suits someone who is kidney yang deficient which manifests as exhaustion, tends to be cold or an aversion to cold, lethargic, burnt-out, and over-extended. This type of cold can be alleviated by warm clothing, whereas an exterior cold condition &leftpar;i.e., chills during the flu&rightpar; cannot be eliminated by warm clothing or warm blankets. 

Dipsacus, the lead herb, strengthens the tendons and bones, vitalizes the blood, and alleviates pain. Bone, joint, and tendon problems are considered a bi syndrome or obstruction in Oriental Medicine. This disorder is caused by the poor circulation of the blood and qi which is characterized by pain, numbness, stiffness, and swelling in a joint. Wind, cold, and dampness are the three things considered to be responsible for this type of disruption of the flow of blood and qi. There are four herbs that are included in Strong Back, that are commonly used to address a wind/damp/cold condition in the lower body: Du Huo, which dispels wind/damp/cold from the lower body; Clematis, which unblocks the channels and alleviates pain; Atractylodes &leftpar;Cang Zhu&rightpar;, which expels wind/dampness and alleviates pain; and Gentiana &leftpar;Qin Jiao&rightpar;, which dispels wind/dampness and relaxes the tendons.', 'external');
INSERT INTO products VALUES (112, 'Chillie Paste', 'Hot Pain Balm', 11, 'Ingredients&leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Cayenne			   Capsicum Annuum

Pine Node		   Song Jie

Dragons Blood	   Xue Jie

Cinnamon twig	   Gui Zhi

Artemisia		   Ai Ye 

Beeswax

Olive Oil', 'Western Therapeutic Actions

Vulnerary, circulatory stimulant, anodyne, and counterirritant', 'Traditional Chinese Medicine

Warms the channels, invigorates the blood, and promotes the movement of qi', 'Sample Indications

Pain and stiffness in the joints and muscles, arthritis, rheumatism, lumbago , cold hands and feet or unbroken chilblains', 'External Application

Apply topically onto the affected area, 

3 times daily', 'Contraindications and Cautions

Wash your hands after applying. Do not take internally. 

Keep out of children''s reach.

Avoid getting Chillie Paste into broken skin, mucous membranes or the eyes. If the treated area becomes excessively hot, reddened, irritated, or a rash appears, discontinue use. Wash area with warm soapy water to remove any remaining ointment. If it gets into the eyes, flush with liberal amounts of cool clean water.', 'Notations 

Externally, Cayenne is a counterirritant. A counterirritant causes irritation to the surface tissue, distracting the nerves from the original irritation or pain. Pine Node is used for pain in the joints and traumatic injury. Dragons Blood is beneficial for joint and tissue injury as it activates the blood and relieves pain. Cinnamon twig and Artemisia warm the energy channels and disperse cold.

Internally, the hot Cayenne fruit has been used for centuries as a circulatory stimulant. The warm nature of Cayenne will stimulate digestion, alleviate nausea, and help to resolve bloating.

Pain that requires heat often responds well to being wrapped in red-flannel cloth.', 'external');
INSERT INTO products VALUES (113, 'Cramp Powder', 'Muscular Spasm', 33, 'Ingredients &leftpar;Homeopathic Biochemic Tissue Salts&rightpar;

Magnesium Phosphate

Ferrum Phosphate', 'Western Therapeutic Actions

Antispasmodic and nutritive', 'Traditional Chinese Medicine

Breaks up stagnant qi and vitalizes the blood', 'Sample Indications

Acute and chronic muscular spasms and cramps, menstrual cramps, and digestive colic', 'Suggested Dosage

1/4 teaspoon dissolved on the tongue

Take every 20 minutes in acute cases

For chronic treatment, take 2 - 4 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

There are none known.', 'Notations

This is a mineral biochemic cell salt supplement that is rapidly assimilated into the body. Cramp Powder may also help in cases of iron deficient anemia. A German chemist and physicist, Dr. W.H. Schussler, studied twelve essential cell salts and recorded the effects that the mineral constituents within the cell salts had on supporting the wellness of the body. He identified the specific attributes of each cell salt and they were used accordingly, in the natural healing process from disease. The cell salts or tissue salts are mineral constituents that are vital for the healthy functioning of our cells and are used extensively by homeopaths. 

Cramp Powder combines well with herbal formulas in correcting constitutional weaknesses.

Biochemic Tissue Salts

Magnesium Phosphate, also known as Mag. Phos.

	This cell salt is an anti-inflammatory agent for the 

	muscular system or nervous system. Cramping or 

	spasmodic pain that is stabbing or sharp responds well 		to this cell salt. 

Ferrum Phosphate, also known as Ferr. Phos.

	 This cell salt is considered the oxygen carrier because of its ability to oxygenate all the cells of the body, which is then converted into energy.', 'external');
INSERT INTO products VALUES (115, 'Knee Back Pain', 'Anti - Inflammatory', 28, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Atractylodes, red		Cang Zhu

Meadowsweet		Filipendula Ulmaria

Eucommia			Du Zhong

Ligusticum			Gao Ben

Boswellia			Boswellia Serrata

Burdock root			Arctium Lappa

Siler					Fang Feng

Acanthopanax		Wu Jia Pi

Gentiana, macro.		Qin Jiao

Tang Kuei			Dang Gui

Cyathula				Chuan Niu Xi 

Wintergreen			Gaultheria Promcumbens

Couchgrass			Agropyron Repens

Hydrangea			Hydrangea Arborescens

Cinnamon bark		Rou Gui', 'Western Therapeutic Actions

Anti-inflammatory, analgesic, alterative, antacid, demulcent, and diuretic', 'Traditional Chinese Medicine

Dispels wind/cold/dampness, spreads the flow of qi, vitalizes the blood, and nourishes the liver and kidney', 'Sample Indications

Stiffness and swelling in the knees, stiffness in the lower back, lower body arthritis, and paralysis of the lower limbs', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

There are none known.', 'Notations

Knee Back Pain, designed from a Chinese classic called Da Fang Feng Tang or Major Siler Combination, treats imbalances from the invasion of wind/dampness, which adversely affects the muscles, bones, joints, sinews, and tendons. 

In Oriental Medicine, when wind/dampness enters the energy channels, it can create migratory pain &leftpar;wind&rightpar;, fixed stabbing pain &leftpar;blood stagnation&rightpar;, swelling and numbness &leftpar;dampness&rightpar;. The main herbs in this formula expel wind/dampness with assisting herbs to improve the circulation, and nurture the liver and kidney &leftpar;strengthens the sinews and tendons&rightpar;. When the energy channels are rich in blood and qi, then the wind and dampness cannot lodge into the joints and create havoc. Degeneration of the bones and joints is treated differently and is a kidney and liver deficiency, with disorders such as osteoarthritis, degenerative bone disorder, and osteoporosis. 

Red Atractylodes is strongly drying in nature and expels wind/dampness. This is an excellent herb for swollen and arthritic knees. Meadowsweet and Wintergreen support Atractylodes in dispelling wind/dampness and clearing toxicity. Eucommia strengthens the lower body and kidneys. Ligusticum is an anodyne and treats headache and tailbone pain. Boswellia is a much used anti-inflammatory for the joints and the bowels in India. Siler, Acanthopanax, and Gentiana &leftpar;Qin Jiao&rightpar; expel wind/dampness and support the main actions of this formula. Tang Kuei was added to replenish the blood, and Cinnamon bark to warm the kidneys and activate circulation. Burdock root helps with the purification of the blood. Cyathula activates the circulation. Couchgrass and Hydrangea are diuretics, reduce fluid build-up in the knees, and anti-inflammatory. 

See Muscular & Skeletal External Formulas for additional support', 'external');
INSERT INTO products VALUES (116, 'Liniment Balm', 'Muscle And Joint Balm', 5, 'Ingredients &leftpar;Herbal Extracts&rightpar;

Listed by common and pin yin or latin names, in sequence from largest to smallest amount by quantity.

Cajeput Oil		Melaleuca Cajeputii

Wintergreen Oil		Gaultheria Promcumbens

Carthamus		Hong Hua

Cayenne	         	Capsicum Annuum

Peppermint		Bo He

Cinnamon twig		Gui Zhi

Camphor	         	Cinnamonum Camphora

Beeswax

Olive Oil', 'Western Therapeutic Actions

Vulnerary, circulatory stimulant, antispasmodic, anodyne, and analgesic', 'Traditional Chinese Medicine

Dispels wind/damp/cold and invigorates the blood', 'Sample Indications

General pain and stiffness in the joints and muscles, arthritis, rheumatism, sprained joints and strained tendons, and ligaments', 'External Application

Topically, apply ointment generously onto the affected area, 3 times daily', 'Contraindications and Cautions

There may be some sensitivity to this balm if it is applied to the mucous membrane or broken skin. Wash area  thoroughly with cool water if irritation occurs. If there are signs of heat and inflammation, wait until these symptoms subside before using this warming balm.', 'Notations

Use complementary internal remedies to support  the healing action of this balm.', 'external');
INSERT INTO products VALUES (117, 'Liniment Rub', 'Joint Muscle Relief', 1, 'Ingredients &leftpar;Herbal Extracts&rightpar;

Listed by common and pin yin or latin names, in sequence from largest to smallest amount by quantity.

Peppermint		Bo He

Cayenne	         	Capsicum Frutes

Dragons Blood		Xue Jie

Carthamus		Hong Hua 

Cajeput			Melaleuca Leucadendron 

Myrrh			Mo Yao

Frankincense		Ru Xiang

Atractylodes, red	Cang Zhu

Pine Node	         	Song Jie

Corydalis	         	Yan Hu Suo

Calendula	         	Calendula Officinalis', 'Western Therapeutic Actions

Vulnerary, circulatory stimulant, antispasmodic, anodyne, and analgesic', 'Traditional Chinese Medicine

Dispels wind/damp/cold, invigorates the blood, and alleviates pain', 'Sample Indications

Stiff and painful muscles and joints, rheumatism, arthritis, cold limbs, sprained and strained joints, ligaments and tendons, heavy legs and tired feet, and overworked muscles and joints', 'External Application

Topically, apply the liquid with sterile gauze to the affected area, 3 times daily', 'Contraindications and Cautions

There may be some sensitivity to Liniment Rub if it is applied to the mucous membrane or broken skin. Wash area  thoroughly with cool water if irritation occurs. If there are signs of heat and inflammation, wait until these symptoms subside before using this warming liquid.', 'Notations

Use complementary internal remedies to support the healing action of this embrocation.', 'external');
INSERT INTO products VALUES (118, 'Movement Makes Better', 'Pain That Gets Better With Movement', 29, 'Ingredients  &leftpar;Homeopathic&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Arnica				Arnica Montana

Aconite				Acontium Napellus

Poison Ivy			Rhus Toxicodendron

St. Johns Wort		Hypericum Perforatum', 'Western Therapeutic Actions

Anti-inflammatory, analgesic, and anodyne', 'Traditional Chinese Medicine

Dispels wind and alleviates obstruction', 'Sample Indications

Specific for the treatment of pain and conditions that improve with the movement of the body. The pain can be of any origin; arthritis, rheumatism, trauma, accidents, sprains, strained ligaments and tendons, and impaired nerve impulses', 'Suggested Dosage

5 - 20 drops, in a small amount of water,

3 times daily, or every hour if needed

Reduce dosage as symptoms subside

Variation is according to individual symptoms', 'Contraindications and Cautions

There are none known.', 'Notations

This is a homeopathic remedy that has shown to be effective when addressing trauma to the muscular/skeletal system. This remedy is used specifically when muscular/skeletal pain is alleviated by movement, such as stretching or walking. 

                                                    Homeopathic Properties

Arnica		muscle strain, pain, and bruises

Aconite		anti-inflammatory, symptoms that have sudden onset, numbness and tingling

Poison Ivy	pain and stiffness, motion alleviates discomfort

St. Johns Wort	for excessive pain, antispasmodic

Pain is nature''s warning that something is wrong. The excessive use of pain-killing drugs does not remove the cause, but may add to it. It is most important to discover and treat the cause of the pain or syndrome. *Bran poultices or *Chamomile fomentations often give some relief. 

*Bran poultices: See external applications

*Chamomile fomentations: See external applications

See Muscular & Skeletal External Formulas for additional support', 'external');
INSERT INTO products VALUES (119, 'Movement Makes Worse', 'Pain That Worsens With Movement', 29, 'Ingredients  &leftpar;Homeopathic&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Arnica			Arnica Montana

Aconite			Acontium Napellus

Bryonia			Bryonia Dioica

St. Johns Wort	Hypericum Perforatum', 'Western Therapeutic Actions

Anti-inflammatory, analgesic, and anodyne', 'Traditional Chinese Medicine

Expels wind and alleviates obstruction', 'Sample Indications

Specific for the treatment of pain and conditions that worsen with the movement of the body. The pain can be of any origin; arthritis, rheumatism, trauma, accidents, sprains, strained ligaments and tendons, and impaired nerve impulses', 'Suggested Dosage

5 - 20 drops, in a small amount of water,

3 times daily, or every hour if needed

Reduce dosage as symptoms subside

Variation is according to individual symptoms', 'Contraindications and Cautions

There are none known.', 'Notations

This is a homeopathic remedy that has shown to be effective when addressing trauma to the muscular/skeletal system. This remedy is used specifically when muscular/skeletal pain is aggravated by movement, such as stretching or walking. 

                                                        Homeopathic Properties

Arnica		for muscle strain, pain, and bruises

Aconite		anti-inflammatory, symptoms that have sudden onset, numbness and tingling

Bryonia		for acute pain, aggravation from any motion

St. Johns Wort	for excessive pain, antispasmodic

Pain is nature''s warning that something is wrong. The excessive use of pain-killing drugs does not remove the cause, but may add to it. It is most important to discover and treat the cause of the pain or syndrome. *Bran poultices or *Chamomile fomentations often give some relief. 

*Bran poultices: See external applications

*Chamomile fomentations: See external applications

See Muscular & Skeletal External Formulas for additional support', 'external');
INSERT INTO products VALUES (120, 'Muscle Ease', 'Muscular Stiffness, Pain', 28, 'Ingredients &leftpar;Herbal Extracts&rightpar;

Listed by common and pin yin or latin names, in sequence from largest to smallest amount by quantity.

Pueraria     		Ge Gen

Oats		         	Avena Sativa

Skullcap	         	Scutellaria Lateriflora

Cinnamon twig		Gui Zhi

Peony			Bai Shao Yao

Siler		         	Fang Feng

Gentiana, macro.	Qin Jiao

Vitex		         	Man Jing Zi

Cnidium	         	Chuan Xiong

Mistletoe	         	Viscum Album

Meadowsweet		Filipendula Ulmaria

Licorice, baked		Zhi Gan Cao

Ginger, fresh		Sheng Jiang

Chamomile, Roman	Anthemis Nobilis

Motherwort		Leonurus Cardiaca

Passion Flower		Passiflora Incarnata

Cramp Bark		Viburnum Opulus

Jujube			Da Zao', 'Western Therapeutic Actions

Anodyne, anti-inflammatory, antispasmodic, alterative, depurative, nerve tonic, nervine, nutritive tonic, and calming', 'Traditional Chinese Medicine

Harmonizes the nutritive and protective chi, releases the muscle layer, disperses wind, and calms the spirit', 'Sample Indications

Muscle aches and pains, joint pain, neck and shoulder tension, cramps, and headaches', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

This remedy is drying in nature, so use with caution with cases that are yin deficient with heat signs &leftpar;dry mouth and thirst for cold drinks, night sweats, heat in the hands and feet&rightpar;, or modify with cases that exhibit blood and chi defeciencies.', 'Notations

Muscle Ease, designed after one of the most studied herbal remedies in China, Gui Zhi Tang, was initially used for treating patients with a weaker constitution who were suffering from the early stages of a febrile disease in which sweating did not improve the condition. Its use has greatly expanded over the centuries. The main focus of this formula is on disruptions of the flow of chi. Stagnant chi will produce pain that moves from one area to another &leftpar;muscles or joints&rightpar;. Stagnant blood will produce pain that stays in one location. With the appropriate use of other herbs, the base formula &leftpar;Cinnamon twig, Peony, Ginger, Licorice, and Jujube&rightpar;, can be modified very effectively. Pueraria, called Kudzu in Japan and is used extensively as an anti-inflammatory, has been added to this remedy because of its ability to release the neck and shoulder muscles. Herbs to calm the spirit, Chamomile, Motherwort, and Passion flower, have been included because of their ability to calm the spirit. Muscular tension is caused by emotional upsets in many instances, reminding us, once again, of the dance between the psychic realm and the physical realm.', 'external');
INSERT INTO products VALUES (121, 'Pain Be Gone', 'Pain Relief', 28, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Boswellia			Boswellia Serrata

Loranthus			Sang Ji Sheng 

Du Huo				Tu Huo

Turmeric			Curcuma Longa

Jamaica Dogwood	        Piscidia Piscipula

Skullcap				Scutellaria Lateriflora

Gentiana, macro.		Qin Jiao

Eucommia			Du Zhong

Cyathula				Chuan Niu Xi 

Millettia				Ji Xue Teng

Tang Kuei			Dang Gui

Valerian				Valeriana Officinalis

Passion Flower		Passiflora Incarnata

Wild Lettuce			Lactuca Virosa

Cinnamon bark		Rou Gui

Ginger, dried			Gan Jiang', 'Western Therapeutic Actions

Anti-inflammatory, analgesic, anodyne, sedative, nervine, antispasmodic, restorative, and nutritive', 'Traditional Chinese Medicine

Dispels wind/cold/dampness, alleviates pain, and nourishes the deficiencies of the blood, kidneys, and liver', 'Sample Indications

Aches and pains, stiffness, limitation of movement, numbness, neuralgia, arthritis, post-operative pain, lumbago, sciatica, cramps and spasms, and pain from auto-immune diseases', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

Contraindicated during pregnancy.', 'Notations 

In Oriental Medicine, pain can be caused by an obstruction, either physical or emotional, restricting the smooth flow of blood and qi. The physical obstruction can be caused by an invasion of an external influence, such as wind, cold, or dampness, or a combination of them. These external influences can accentuate pre-existing excesses or deficiencies if the body does not have the capacity to expel them or adjust to their influence. A nice saying that could be applied here is, If the cup is empty it will be filled. 

Pain Be Gone follows the energetic patterns used in a time honored Chinese formula, Du Huo Ji Sheng Tang or Tu Huo and Loranthus Combination along with proven Western specifics. The delicate balance of expelling the external influence and nourishing the blood and qi simultaneously gives this formula a special place in the classics of herbal medicine. Underlying most chronic disorders is a depletion or deficiency within the body. Pain can be exhausting. If only the invading influence is treated, the imbalance is difficult to heal.

The possibility of an emotional obstruction also can be addressed. Does the pain represent a conflict between the body and the psyche? What parts of the psyche are resistant to the flow of life? Do I hang onto emotional pain? 

What is my relationship to pain? Do I fight it? If we go to battle with the obstruction &leftpar;pain&rightpar;, it will resist and intensify. When we allow ourselves to breathe into the varying degrees of intensity of the obstruction or pain, the bodies energies can more easily flow, and the possibility of releasing any obstruction is enhanced.

See Muscular & Skeletal External Formulas for additional support', 'external');
INSERT INTO products VALUES (122, 'Sciatigone', 'Sciatica Pain', 29, 'Ingredients  &leftpar;Homeopathic&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Rosemary		Rosmarinus Officinalis

Arnica			Arnica Montana

Poison Ivy		Rhus Toxicodendron

Aconite			Acontium Napellus', 'Western Therapeutic Actions 

Anti-inflammatory, analgesic, and anodyne', 'Traditional Chinese Medicine

Expels wind and alleviates obstruction', 'Sample Indications

Specific for the treatment of sciatica pain; inflammation and general discomfort of the sciatic nerve', 'Suggested Dosage

5 - 20 drops, in a small amount of water,

3 times daily, or every 2 hour if needed

Reduce dosage as symptoms subside

Variation is according to individual symptom', 'Contraindications and Cautions

There are none known.', 'Notations

Sciatigone is a homeopathic remedy that has shown to be effective when addressing sciatic nerve pain. The symptoms for sciatica can include: pain in the buttocks or leg that becomes worse when sitting; burning or tingling sensation that runs down the side or back of the leg; weakness or numbness in the leg; and a constant throbbing pain on either side of the buttocks. 

Standing up for long periods may be difficult or impossible. The pain felt in the leg or legs is much stronger than in the lower back and may make it impossible to walk any distance comfortably.

                                     Homeopathic Properties

Rosemary	a nervine and alleviates nerve pain

Arnica		a stimulant that heals tissue damage

Poison Ivy, commonly called Rhus Tox		

		an anodyne and very effective in dealing with sciatic nerve disorders

Aconite 	an anti-inflammatory, analgesic, and relaxant

Shiatsu, Acupuncture, Yoga, Tai Ji, Qi Gong, and other stretching exercises are a great benefit for sciatica. The lower back is the foundation of the body, so easy does it and find some firmer ground to stand on.

See Muscular & Skeletal External Formulas for additional support', 'external');
INSERT INTO products VALUES (124, 'Air Flow', 'Dependencies', 28, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Astragalus			Huang Qi

Rehmannia, prep.		Shu Di Huang

Cordyceps			Dong Chong Xia Cao

Holy Basil			Ocimum Tenuiflorum

Morus bark			Sang Bai Pi

Lungwort			Pulmonaria Officinalis

Apricot seed			Xing Ren

Fritillaria			Chuan Bei Mu

Anemarrhena		Zhi Mu

Schizandra			Wu Wei Zi

Bugleweed			Lycopus Virgininicus 

Elecampane			Inula Helenium

Marshmallow			Althea Officinalis

Echinacea			Echinacea Angustifolia

Hawthorn berry		Crataegus Spp.', 'Western Therapeutic Actions

Expectorant, demulcent, emollient, sedative, and cardiac tonic', 'Traditional Chinese Medicine

Supplements the lung qi, clears lung heat, transforms phlegm, stops coughing, and arrests wheezing', 'Sample Indications

Chronic and long-standing lung and breathing problems, emphysema, asthma, and cystic fibrosis', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

Contraindicated during the acute stages of any illness, such as colds and influenza &leftpar;external pathogenic influence&rightpar;.', 'Notations 

Air Flow, similar to an ancient Chinese formula, Ren Shen Ge Jie San or Ginseng and Gecko Powder, addresses lung qi deficiency &leftpar;wheezing&rightpar; accompanied by heated phlegm &leftpar;mucous&rightpar;. This is a common imbalance when treating long-standing lung disorders. The two prominent emotions, grief and fear, tie into the complexity of this disorder. Patients with chronic lung conditions can be emotionally constrained or hold onto old issues very tightly as if they live only in the past. They struggle with letting go. It is important to address the possibility of any deep held grief or trauma, "the tears not yet shed", so that the Mother-Child relationship &leftpar;lung - kidney&rightpar; can be supported in this energy pattern. 

Restoratives are key to this formula. Astragalus supplements the qi and blood. Rehmannia nourishes the yin and the blood. Cordyceps nourishes the lung and augments the kidneys, and excels in lung-kidney imbalances. Holy Basil clears heat and supplements the lung qi. Schizandra nourishes the kidney yin and stabilizes the lungs.

If the lung problem is a consequence of exposure to a toxic environment, it is advised that steps be taken to identify and correct those issues. Mold and toxic household cleansers should also be eliminated. There are many non-toxic cleaning products available which are also earth friendly.

An alkaline diet that includes miso soup, organic fruit and vegetables is recommended. The elimination of dairy products helps resolve phlegmatic conditions A hot *Ginger Compress, applied twice daily to the chest and kidney areas, is very healing and beneficial for acute and chronic breathing difficulties.

*Ginger Compress: See External Applications', 'external');
INSERT INTO products VALUES (125, 'Breathe Ease', 'Bronchial Asthma', 28, 'Ingredients&leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Oats			Avena Sativa

Marshmallow		Althea Officinalis

Cordyceps		Dong Chong Xia Cao

Apricot seed		Xing Ren

Morus bark		Sang Bai Pi

Horehound		Marrubium Vulgare

Grindelia		Grindelia Robusta

Cynanchum		Bai Qian

Stemona			Bai Bu

Perilla seed		Zi Su Zi

Glehnia			Sha Shen

Schizandra		Wu Wei Zi

Fritillaria		Chuan Bei Mu

Euphorbia		Euphorbia Pilulifera', 'Western Therapeutic Actions

Nerve and restorative tonic, demulcent, emollient, anti-

asthmatic, expectorant, and pectoral', 'Traditional Chinese Medicine

Redirects the qi downward, arrests coughing and wheezing, expels phlegm, nourishes the kidneys, and nourishes the lung yin', 'Sample Indications

Asthma &leftpar;chronic bronchial asthma and mild asthma&rightpar;, whooping cough, and spasmodic croup', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindication and Cautions

Asthma is a serious condition, and may be life-threatening. Seek qualified medical advice. During an acute febrile disease &leftpar;fever, influenza, cold&rightpar;, use supportive heat clearing herbs or formulas.', 'Notations 

Asthma is a condition that can be cleared, with patience and perseverance. It is usually born of exhaustion, with emotional undertones. Food additives, preservatives, and dyes are often causative factors and should be removed from the diet. Breathe Ease can moderate or eliminate chronic symptoms &leftpar;shortness of breath and wheezing&rightpar;. It may lessen the frequency, duration and intensity of asthma attacks. Breathe Ease relieves muscular and visceral tension in the lungs, while replenishing the nervous energy reserves, and protects the body against further infections. 

The Chinese herbs used in this formula are patterned after Ding Chuan Tang and the Chinese patent formula called Ping Chuan Pian. Oats are a restorative and Marshmallow relieves coughing and clears damp/heat. Marshmallow has been used for whooping cough and pleurisy due to this function. Horehound is an expectorant, tonic, and alleviates cough. Grindelia is an anti-asthmatic and supports the functioning of the spleen. Apricot seed, Morus bark, and Perilla seed alleviate coughs and are anti-asthmatics. Some patients do not tolerate Ma Huang. The herb Cynanchum &leftpar;Bai Qian&rightpar; is used as an effective substitute and does not create the jitters. Cynanchum addresses difficult to expectorate mucous and wheezing and is supported by Fritillaria. Wild Cherry bark and Euphorbia are pectoral specific, anti-asthmatics, and alleviate coughing. Schizandra contains the qi of the lung, supports the kidneys, and is an anti-asthmatic.

A hot *Ginger Compress, applied twice daily to the chest and kidney areas, is also very beneficial for breathing difficulties.

*Ginger Compress: See External Applications', 'external');
INSERT INTO products VALUES (126, 'Bronchol Ease', 'Moist Cough', 28, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Elecampane		   Inula Helenium

Coltsfoot	          Tussilago Farfara

Marshmallow		  Althea Officinalis

Horehound		  Marrubium Vulgare

Echinacea		  Echinacea Angustifolia

Pleurisy root		  Asclepias Tuberosa

Platycodon		  Jie Geng

Pinellia			  Ban Xia

Fritillaria		 Zhe Bei Mu

Houttuynia		 Yu Xing Cao

Hoelen			 Fu Ling

Chih-Shih		 Zhi Shi

Hoelen			 Fu Ling

Citrus			 Chen Pi

Cayenne			 Capsicum Annuum

Peppermint	         Mentha Piperita', 'Western Therapeutic Actions

Expectorant, demulcent, circulatory, anti-bacterial, anti-viral, circulatory, alterative, antiseptic, carminative, and antispasmodic', 'Traditional Chinese Medicine

Expels phlegm, clears heat, relieves toxicity, stops coughing, and redirects the qi downward', 'Sample Indications

Acute and chronic coughs with mucous, lower respiratory infections, bronchitis, pleurisy, pneumonia, whooping cough, croup, and asthma', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of hot 

water, 3 times daily, or more frequently for 

acute conditions

Variation is according to individual symptoms', 'Contraindications and Cautions

Use with caution during pregnancy.', 'Notations 

Bronchol Ease was designed to treat acute and chronic respiratory infections for all ages. It is an excellent formula for children and the elderly who are prone to respiratory infections throughout the winter. Use Jade Screen Defense or Flu Shield prior to the cold/flu season and throughout the winter as a preventative measure. 

Bronchol Ease is best suited for respiratory disorders with a moist cough. Use Cough Stop for dry spasmodic coughs with little or no sputum.

The foundation for this formula was created in the 1900s by Desmond Eggleton, a masterful Medical Herbalist and Healer from New Zealand. His original formula was comprised of Elecampane, Coltsfoot, Marshmallow, Horehound, Echinacea, Pleurisy root, Cayenne, and Peppermint. These herbs can stand on their own in treating respiratory infections. With the combining of the herbs and energetic patterns from a Chinese classic, Qing Qi Hua Tan Wan, the newly tailored Bronchol Ease has cured even the most stubborn cases.

A hot *Ginger Compress applied to the chest and upper back, two times daily is especially effective. With all phlegmatic conditions it is wise to eliminate all dairy from the diet. A pot of chicken soup with the addition of garlic, onion, ginger, and a dash of cayenne is a time-honored cure. Cook the whole chicken with the skin and fat. Keep the upper body protected and avoid the wind! Place a vaporizer with some Eucalyptus oil in the room at night for a more restful sleep. 

*Ginger Compress: See External Applications', 'external');
INSERT INTO products VALUES (132, 'Sinus Clear', 'Runny Nose, Allergies, Sinusitis', 29, 'IngredientsIngredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Mullein				Verbascum Thapsus

Balm of Gilead		Populus Balsamifera

Echinacea			Echinacea Angustifolia

Xanthium			Cang Er Zi

Coltsfoot			Tussilago Farfara

Angelica, dah.		Bai Zhi

Magnolia flower		Xin Yi Hua

Goldenseal			Hydrastis Canadensis

Wild Indigo			Qing Dai

Siler					Fang Feng

Eyebright			Euphrasia Officinalis

Wahoo				Euonymus Atropurpureus

Peppermint			Bo He', 'Western Therapeutic Actions 

Antihistaminic, anti-inflammatory, decongestant, alterative, antiseptic, hepatic, and astringent', 'Traditional Chinese Medicine

Dispels wind, clears heat, opens the nasal passages, and alleviates head pain', 'Sample Indications 

Acute and chronic sinus infections, acute or chronic rhinitis, allergies, and runny nose', 'Suggested Dosage

10 - 20 drops, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

Contraindicated during pregnancy.', 'Notations

The Western herbs in Sinus Clear have a long history of use for sinus disorders. The Chinese herbs in Sinus Clear follow a time tested formula used extensively today, Cang Er Zi San or Xanthium Formula. Together, they create a synergy that has resolved even the most difficult cases.

The head and neck are the most vulnerable parts of the body to the external influences. In Oriental Medicine, there are six external influences that have an adverse affect on the body. They are: Wind, Cold, Wetness, Heat, Summer Heat, and Dryness. When the body is invaded by an external factor, one of the six influences are involved. Wind with its light nature rises or ascends and affects the upper body &leftpar;head, neck and lungs, shoulders, and the skin&rightpar;. Sinusitis, headaches, colds and flu are the common disorders from a wind activated influence.

Aromatic herbs that contain volatile oils has been used since ancient times to open the nasal passages and resolve mucous discharge. Angelica &leftpar;Bai Zhi&rightpar;, Balm of Gilead, and Magnolia flower are very aromatic and help release the exterior wind. Mullein is a demulcent, anti-inflammatory, and anti-bacterial. It is an excellent herb for clearing the sinus and ear canals. Echinacea is an alterative and and antiseptic. Xanthium opens the nasal passages, resolves discharge, and alleviates headaches. Wild Indigo is an antiseptic. Siler disperses wind from the head and face. Coltsfoot resolves phlegm, clears heat, and reduces infections. It also protects the lungs with its ability to promote expectoration should the wind penetrate lower into the respiratory tract. Wahoo is an alterative and cholagogue. Peppermint disperses wind/heat and relieves headache, fever, and cough.

Wrapping your neck with a scarf during cold and windy weather makes some sense, now doesnt it!', 'external');
INSERT INTO products VALUES (127, 'Cough Stop', 'Dry Spasmodic Cough', 28, 'Ingredients &leftpar;Herbal Extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Elecampane		Inula Helenium

Marshmallow		Althea Officinalis

Aster		         	Zi Wan

Stemona	         	Bai Bu

Vervain			Verbena Officinalis

Yerba Santa		Eriodictyon Californicum

Grindelia	         	Grindelia Robusta

Fritillaria	         	Chuan Bei Mu

Trichosanthes fruit	Gua Lou

Wild Cherry bark	Prunus Serotina

Cynanchum		Bai Qian

Ophiopogon		Mai Men Dong

Red Clover		Trifolium Pratense

Platycodon		Jie Geng

Anemarrhena		Zhi Mu

Hoelen			Fu Ling

Biota		          	Bai Zi Ren

Licorice			Gan Cao

Butterbur	         	Petasites Officinalis', 'Western Therapeutic Actions

Antitussive, antispasmodic, anti-inflammatory, and expectorant', 'Traditional Chinese Medicine

Stops coughing, transforms phlegm, clears heat, moistens the lungs, and regulates the chi', 'Sample Indications

Dry, spasmodic, and irritable cough, itchy throat, sequel to a febrile disease, bronchitis, pertussis, and early stages of viral pneumonia', 'Suggested Dosage

1/2 - 1 teaspoon in a small amount of hot water, 3 times daily, or more frequently in acute conditions 

Variation is according to individual symptoms', 'Contraindications and Cautions

Contraindicated during pregnancy.', 'Notations 

Cough Stop, patterned after two Chinese formulas, Zhi Sou San and Bei Mu Gua Lou San, is effective when there is a lingering cough following a febrile disease with or without phlegm &leftpar;thick, sticky mucous that is difficult to expectorate&rightpar; and a harsh, raspy voice. Often, after a febrile disease, the lungs natural moisture is weakened and a dry cough develops. This remedy clears any remaining toxic heat while restoring the lungs back to health. Taking this remedy with hot water enhances the ability of the herbs to be absorbed rapidly into the blood, bronchial, and lymphatic systems. 

Elecampane is a restorative to the lung chi and is used for chronic bronchial infections. Marshmallow root is a demulcent. Aster relieves coughs and wheezing. Stemona supports Elecampane in arresting coughs and bringing moisture to the lungs. Vervain helps to clear wind/heat and releases tightness in the chest. Yerba Santa serves as a bronchial expectorant. Grindelia, also known as Gumweed flower, relieves wheezing by circulating the lung chi and opening the chest area. Fritillaria and Tricosanthes fruit resolve thick, sticky phlegm and clear lung heat. Wild Cherry bark is a bronchial dilator and useful for spasmodic cough and asthma. Cynanchum redirects the chi downward, similar to honey, and supports Fritillaria. Ophiopogon moistens the lungs. Red Clover is an alterative and sedative. Platycodon is a pectoral and leads the herbs to the upper body. Hoelen and Licorice &leftpar;spleen tonics&rightpar; have been added in support of the mother-child relationship &leftpar;spleen-lung&rightpar; according to the Chinese Five Phases theory. Biota and Butterbur help to calm the spirit.

A hot *Ginger Compress, applied twice daily to the chest and kidney areas, is also very beneficial for breathing difficulties.

*Ginger Compress: See External Applications', 'external');
INSERT INTO products VALUES (128, 'Herbal Smoke', 'Lung Tonic, Tobacco Substitute', 6, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by common and pin yin or latin names, in sequence from largest to smallest amount by quantity.

Raspberry leaf		Rubus Idaeus

Coltsfoot	          	Tussilago Farfara

Mullein			Verbascum Thapsus

Horehound		Marrubium Vulgare

Mugwort	          	Artemisia Vulgaris

Lobelia			Lobelia Inflata

Wood Betony		Betonica Officinalis

Lavender	         	Lavendula Officinale

Chamomile, German	Matricaria Recutita', 'Western Therapeutic Actions

Decongestant, relaxant, antispasmodic, and antitussive', 'Traditional Chinese Medicine

Facilitates the movement of lung chi, redirects the chi downward, alleviates coughing, and calming', 'Sample Indications

This smoking mix may be used in asthma to help reduce tightness in the chest, and as an alternative to tobacco to help clear the lungs and reduce dependency.', 'Suggested Use

Roll and smoke as needed', 'Contraindication and Cautions

There are none known.', 'Notations

Excessive inhalation of any substance is not recommended', 'external');
INSERT INTO products VALUES (141, 'Bush Bitters', 'Cure All', 29, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Harakeke		Phormium Tenax

Kumarahoe		Pomaderris Kum

Kawa Kawa		Piper Methysticum 

Pukatea			Laurelia Novae-

Horopito		Pseudowintera Colorata

Koromiko		Hebe Salicifolia

Kohe Kohe		Dysoxylum Spectabile

Puriri			Vitex Lucens

Karamu			Coprosma Robusta

Kowhai			Sophora Microphylla

Kareao			Ripogonum Scandens 

Beeswax

Olive Oil', 'Western Therapeutic Actions

Vulnerary, antiseptic, anti-inflammatory, analgesic, and 

antipruritic', 'Traditional Chinese Medicine

Clears heat, alleviates pain, and disperses blood stasis

ü', 'Sample Indications

Pain relief, cold sores, genital herpes, boils, diaper rash, 

psoriasis, sun spots, tinea, eczema, and itchy bites', 'Suggested Dosage

Apply onto the affected area, after it has been thoroughly cleansed, 3 times daily', 'Contraindications and Cautions

There are none known.', 'Notations 

Bush Bitters Cream is known to be successful when all else has failed. It promotes the healing of most skin conditions. This formula is made exclusively with herbs from the Maori tradition.

Harakeke is considered the Aloe Vera of New Zealand. Kumarahoe is a pectoral, blood purifier, and kidney tonic. Kawa Kawa is a blood purifier and tonic. Pukatea is a powerful anodyne, quite similar to the Chinese herb, Corydalis, Yan Hu Suo. 

Koromiko treats damp/heat of the digestive tract and excellent for dysentery like symptoms. Kohe Kohe is a bitter tonic, stomachic, and blood purifier. Puriri has anti-bacterial qualities. Karamu clears damp/heat from the kidneys and bladder and soothes the stomach. Kowhai is a restorative with analgesic and anti-fungal qualities. Kareao is an alterative and depurative.

 Horopito is the Bushmans Pain Killer, and an excellent anti-fungal. It is has been used quite successfully for clearing candida like disorders.', 'external');
INSERT INTO products VALUES (129, 'Brain Food', 'Nasal Polyps', 28, 'Ingredients  &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Bacopa			Bacopa Monniera

Oats			Avena Sativa

Ginkgo leaf		Ginkgo Biloba

Ashwaganda		Withania Somnifera

Schizandra		Wu Wei Zi

Rhodiola			Hong Jing Tian

Polygala			Yuan Zhi

Salvia			Dan Shen 

Skullcap			Scutellaria Lateriflora

Gotu Kola		Hydrocotyle Asiatica

Lycium fruit		Gou Qi Zi

Curcuma		Yu Jin

Acorus			Shi Chang Pu

Licorice		        Gan Cao', 'Western Therapeutic Actions

Restorative tonic, nerve tonic, and circulatory stimulant', 'Traditional Chinese Medicine

Nourishes the heart blood, replenishes the essence, calms the spirit, vitalizes the blood, resolves turbidity, and opens the heart orifices', 'Sample Indications

Memory loss, difficult to concentrate and focus, stressed out, forgetful, Alzheimers, and depression', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

Contraindicated during pregnancy and during breast feeding. 

Contraindicated in a patient if an exterior conditions exists &leftpar;such as influenza, fever, colds, rash&rightpar; or when there is an excess of interior heat. Clear the exterior condition or interior heat before taking this formula.', 'Notations

The Chinese patent formula, Bu Nao Wan or Cerebral Tonic Pills, uses Schizandra, which enters the heart, kidney, and lung channels, as one of the primary herbs in that formula. Schizandra helps maintain the healthy functioning of the brain. Bacopa, an Ayurvedic herb, is the lead herb in Brain Food. It enhances mental acuity, improves short and long term memory, and increases the intellect. Oats is one of the Western premier nerve restoratives. Rhodiola, from Siberia, has adaptogenic qualities, enhances intelligence, and relieves mental fatigue. Ashwaganda, an adaptogenic, is used for mental distress. Ginkgo leaf is a circulatory stimulant and improves cerebral function. Polygala, supported by Curcuma and Acorus, calms the spirit and clears the orifices of the heart. Obstruction of the orifices of the heart causes mental and emotional disturbances. Gotu Kola is a restorative and enhances brain functioning.

The Medical Classic of the Yellow Emperor &leftpar;Huang Di Nei Jing&rightpar;, refers to the heart as the ruler of the human body and the seat of consciousness and intelligence. It rules the kidney simply because it is the general master of all organ networks. The function of memory &leftpar;who we are and where we came from&rightpar; is associated with the kidney &leftpar;root&rightpar;. The heart &leftpar;houses our spirit&rightpar; processes all incoming sensory experiences, and controls and regulates the body/mind reaction to these sensations.', 'external');
INSERT INTO products VALUES (130, 'Free Spirited', 'Chronic Sinusitits', 28, 'Ingredients  &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Tang Kuei			Dang Gui

Oats				Avena Sativa

Peony				Bai Shao Yao

Atractylodes			Bai Zhu

Hoelen				Fu Ling

Bupleurum			Chai Hu

Skullcap				Scutellaria Lateriflora

Polygonum vine		Ye Jiao Teng 

Cyperus				Xiang Fu

Valerian				Valeriana Officinalis

Moutan				Mu Dan Pi

Gardenia			Zhi Zi

Licorice, baked		Zhi Gan Cao

Ginger, fresh			Sheng Jiang

Peppermint			Bo He', 'Western Therapeutic Actions

Mediates the liver and spleen, restorative, nutritive, nervine, anodyne, and antispasmodic', 'Traditional Chinese Medicine

Harmonizes and smoothes the liver qi, supports the spleen, and nourishes the blood', 'Sample Indications

Psychological

Edginess, belligerent, angry, feeling as if one does not belong, negative, and aggressive

	Physical

Digestive irregularities, headache, fatigue, irregular menstruation, breast distention, alternating fever and chills, desire to sleep, and PMS', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

There are none known.', 'Notations 

The energetic function of Free Spirited, patterned after the ancient Chinese formula, Xiao Yao Wan, is to relieve constrained chi within the liver and strengthen the digestive functions of the spleen and stomach. 

Emotionally, when the energy gets constrained, rigidity ensues. We have been taught that life is a teacher and there are lessons to be learned. Rigidity reveals itself when we keep bumping into the same old wall time after time. Which comes first, the chicken or the egg? Instead of trying to resolve that riddle, we can begin to take responsibility for our lives, learn our lessons, and move forward with grace, wisdom, and serenity. Free Spirited creates a more relaxed attitude and allows movement forward.

When the liver is flowing smoothly, we walk in a more gentle way with life, humbly acknowledging the ebb and flow, without getting tied up in it. Free Spirited relaxes the liver and nourishes us so that we are able to live in a good way during our short visit here. Remember that the body and mind are one.

Free Spirited is an important herbal remedy for womens menstruation as it allows for a rhythmic flow with fewer obstructions.

The herbs in this remedy that support the liver are Tang Kuei, Bupleurum, Peony, Skullcap, Cyperus, Moutan, Gardenia, and Peppermint. Together, they clear heat, open and stimulate the flow of chi and blood through the liver, and are soothing.', 'external');
INSERT INTO products VALUES (131, 'Phlegm Be Gone', 'Excess Mucous, Clear Phlegm', 28, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Pinellia		          Ban Xia

Platycodon		  Jie Geng

Cordyceps 		  Dong Chong Xia Cao

Fritillaria		  Chuan Bei Mu

Aster			  Zi Wan

Hoelen			  Fu Ling

Magnolia bark	  Hou Po

Tangerine peel	  Ju Hong

Bayberry			  Myrica Cerifera

Atractylodes		  Bai Zhu

Coltsfoot		  Tussilago Farfara

Schizandra		  Wu Wei Zi

Citrus			  Chen Pi

Ginger, fresh	          Sheng Jiang', 'Western Therapeutic Actions

Expectorant, restorative, digestive tonic, antitussive, and demulcent', 'Traditional Chinese Medicine

Resolves dampness &leftpar;congested fluids&rightpar;, warms and transforms phlegm, supports the middle burner, and redirects the qi downward', 'Sample Indications

Coughing with copious sputum, chronic mucous, cold hands and feet, nausea, dizziness, attacks of qi rushing upward &leftpar;panic attack&rightpar;, tired after meals, occasional feverish and flushed face', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of hot 

water, 3 times daily, or more frequently for 

acute conditions

Variation is according to individual symptoms', 'Contraindications and Cautions

Use with caution during pregnancy.', 'Notations

Phlegm Be Gone is a modified version of two Chinese formulas, Er Chen Tang or Citrus and Pinellia Combination, and Ling Gui Zhu Gan Tang or Hoelen and Atractylodes Combination. This formula resolves acute and chronic phlegmatic conditions in the absence of a febrile disease or the aftermath of a febrile disease. 

In Oriental Medicine, chronic mucous in the upper respiratory tract &leftpar;sinus, throat, and bronchial tubes&rightpar; involves two main organs, the lung and the spleen; and in this situation, the kidneys. The spleen, when abundant, transforms the turbid fluid into a pure mist and moistens the lungs. When the spleen is deficient, phlegm &leftpar;turbid fluid&rightpar; clogs the lung. Coughing is a natural response from the lungs in their effort to clear the turbidity. The lungs, weakened by the turbidity, are unable to disseminate the fluids and can not direct the renewed qi down to the kidneys. The fire in the kidney wanes and is not able to provide the spleen with the heat necessary to transform fluids. 

This repetitive cycle causes a heaviness in the person. They are slow to respond as if bogged down. Depression, walking around in a haze, and unable to assert or engage themselves, physically and emotionally, becomes their pattern. Phlegm Be Gone is a great assistant for unlocking this pattern and clearing the way for a more engaged and vibrant life.

Eliminate dairy from the diet. Eat plenty of oats, roots, and cooked vegetables. Seafood puts some fire back into the kidneys. Hearty soups perks up the appetite and Motherwort tea lifts the spirits', 'external');
INSERT INTO products VALUES (134, 'Wheezz Drops', 'Acute Asthmal Attack', 7, 'Ingredients Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Lobelia		Lobelia Inflata', 'Western Therapeutic Actions

Antispasmodic, expectorant, and specific', 'Traditional Chinese Medicine

Facilitates the movement of lung qi and controls wheezing', 'Sample Indications

Acute asthma attacks and emphysema', 'Suggested Dosage

5 drops placed under the tongue &leftpar;sub-lingually&rightpar;

After waiting 2 minutes, repeat the dosage of 5 drops placed under the tongue only if needed

After waiting another 2 minutes, repeat the dosage of 5 drops placed under the tongue only if needed

After waiting 1 hour, repeat the dosage of 5 drops placed under the tongue, again only if needed

Variation is according to individual symptoms', 'Contraindications and Cautions

Asthma can be serious and life threatening. Consult a qualified health care practitioner if the asthma persists or the individual is having a difficult time breathing. 

When taking prescription drugs, never stop the usage of them immediately and substitute an herbal formula or remedy in their place. Easy does it! This type of approach may send the body into shock and have serious life threatening consequences.', 'Notations

Wheezz Drops help relax the muscular spasms in the chest and lungs. Asthma can be triggered by many things, especially allergies and febrile diseases. Explore any emotional links that the asthma might represent. In many cases, emotional stress is the trigger point for an asthma attack. A comprehensive healing program designed to include the body-mind-heart-spirit relationships could reveal some unidentified disorders or unresolved issues. Herbal formulas can support the harmonizing of the internal organs, clearing out any excesses, nourishing any weaknesses, and invigorating the circulation. 

The use of inhalers can be minimized this way and the side-effects of the steroids reduced. Steroids have a negative impact on the body functions and organs. Long term use can be debilitating.

Lobelia is an expectorant, emetic, diaphoretic, anti-asthmatic, and stimulant. For bronchial afflictions, its actions are rapidly beneficial. Lobelia has traditionally been used for croup, whooping cough, and asthma. If an infant is suffering from bronchial distress and seemingly suffocated by their phlegm, Lobelia assists in alleviating the obstruction.', 'external');
INSERT INTO products VALUES (135, 'Head Ease', 'Headache, Migraines', 28, 'Ingredients  &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Angelica dah.	      Bai Zhi

Cnidium			      Chuan Xiong

Corydalis		      Yan Hu Suo 

Ligusticum		      Gao Ben

Skullcap			      Scutellaria Lateriflora

Siler				      Fang Feng

Chiang Huo		      Qiang Huo

White Willow bark	      Salix Alba

Meadowsweet	      Filipendula Ulmaria

Blue Flag		      Iris Versicolor

Angelica			     Angelica Archangelica 

Feverfew			     Tanacetum Parthenium

Ladys Slipper	     Cypripedium Pubescens

Wahoo			     Euonymus Atropurpureus', 'Western Therapeutic Actions

Anti-inflammatory, decongestant, analgesic, nervine, alterative, and carminative', 'Traditional Chinese Medicine

Disperses wind and alleviates pain', 'Sample Indications

All types of headaches &leftpar;tension, migraine, acute and chronic&rightpar;, TMJ, trigeminal neuralgia, upper body tension and pain, fevers and chills, and sinus congestion', 'Suggested Dosage

1/2 - 1 teaspoon, in a cup of green tea, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

Head Ease is drying in nature. Use with caution in cases that are yin deficient with heat signs &leftpar;dry mouth, night sweats, heat in the hands and feet&rightpar;, or blood and qi deficiencies.', 'Notations 

Head Ease combines time proven Western herbs with a Chinese formula for the treatment of headaches and upper body pain, Chuan Xiong Cha Tiao San or Cnidium and Tea Formula. Head Ease is specifically designed for upper body pain and headaches. 

In Oriental Medicine, when wind penetrates the body &leftpar;exterior&rightpar;, imbalances such as stagnation can occur. Stagnation causes the muscles and blood vessels to contract, which produces pain. For patients who experience chronic headaches, it is important to enrich the blood. When the blood is full, the wind has difficultly entering the bodies energy system. 

Head Ease is for short term use. If used for long term, herbal formulas that address the other imbalances in the body are added to the healing program. In many instances, the liver and stomach are involved with chronic headache sufferers. 

Wahoo is a wonderful Native American herb used for clearing liver congestion. Angelica &leftpar;Bai Zhi&rightpar;, Cnidium, Ligusticum, Siler, and Chiang Huo are commonly used in releasing pain from the upper body by dispersing the wind. Corydalis is an excellent anodyne. Skullcap is a relaxant and nerve restorative. White Willow bark is an excellent anodyne and analgesic. Meadowsweet, which contains salicylic acid &leftpar;aspirin&rightpar;, disperses wind and is an analgesic. Blue Flag is a detoxicant and used for bilious headaches. Angelica is a warming relaxant. Feverfew is a nervous relaxant and migraine specific. Ladys Slipper is an antispasmodic.

Traditionally, this formula was drunk with green tea to enhance its clearing actions.', 'external');
INSERT INTO products VALUES (136, 'Nerve Fire', 'Neuralgia And Shingles Pain', 29, 'Ingredients &leftpar;Homeopathic&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Gelsemium			Gelsemium Sempervirens

Aconite				Acontium Napellus

Bryonia				Bryonia Dioica

St. Johns Wort		Hypericum Perforatum', 'Western Therapeutic Actions

Anti-inflammatory, analgesic, anodyne, and specific for the nerve fibers', 'Traditional Chinese Medicine

Clears heat and alleviates obstruction', 'Sample Indications

Nerve pain, neuropathy, trigeminal nerve pain, neuralgia, myalgia, shingles, headache, toothache, and tail-bone injury', 'Suggested Dosage

5 - 20 drops, in a small amount of water, 

every 2 hours, or as needed

Reduce dosage as symptoms subside

Variation is according to individual symptoms', 'Contraindications and Cautions

There are none known.', 'Notations

Nerve Fire is a homeopathic remedy that addresses all types of nerve inflammations. Nerve Fire has supported many clients who suffer from neuropathy due to diabetes or chemotherapy.

                                                 Homeopathic Properties

Gelsemium 	alleviates nerve pain and motor paralysis, 

		antispasmodic

Aconite		anti-inflammatory, symptoms that have sudden onset, numbness and tingling

Bryonia		for acute pain, aggravation from any motion

St. Johns Wort alleviates nerve pain, antispasmodic

Using a poultice or fomentation helps to alleviate some of the pain from inflamed nerves.

*Bran Poultice: See External Applications

*Chamomile Fomentation: See External Applications', 'external');
INSERT INTO products VALUES (137, 'Nerve Food', 'Nourishes Nerves, Calms Anxiety', 31, 'Ingredients &leftpar;Herbal Powders &

Homeopathic Biochemic Tissue Salts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Slippery Elm 			Ulmus Fulva

Arrowroot			Maranta Arundinacea

Ashwaganda			Withania Somnifera 

Kapikachu			Mucuna Pruriens

Calcium Phosphate

Kali &leftpar;Potassium&rightpar; Phosphate', 'Western Therapeutic Actions

Restorative, nervine, and nutritive', 'Traditional Chinese Medicine

Supplements the qi, clears heat, and nourishes the heart', 'Sample Indications

Shattered nerves, nervous exhaustion, sleeplessness, poor digestion, hysteria, nervous headache, depression, neuralgia, shingles, and neuritis', 'Suggested Dosage

1/2 - 1 teaspoon, mixed with a small amount of warm water, 3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

If the individual is sensitive to lactose, Soy Nerve Food is the appropriate alternative.', 'Notations

This is an herbal powder and homeopathic biochemic tissue salt remedy. Slippery Elm is a premier nutritive tonic and restorative. 

Arrowroot supports Slippery Elm with its nutritive and demulcent qualities. Ashwaganda is an adaptogenic herb and excels during times of stress, whether it be physical or emotional. In Ayurvedic medicine, it is considered a restorative. Kapikachu, another Ayurvedic herb, is an excellent nervine and assists in supporting the healthy functioning of the nerve cells.

                                                                           Biochemic Tissue Salts

Calcium Phosphate	

	Helps build new blood cells, strengthens bones and teeth 	and aids digestion. Used for poor circulation, chilblains, 		indigestion, anemia, convalescence, teeth problems.

Kali Phosphate		

	A nerve soother and nutrient, and enhances brain 

	functions. Used for tension, headaches, indigestion, 

	depression, loss of sleep and irritability.

Nerve Food soothes, calms, and strengthens the nervous system. With any debility it is essential to treat or remove the cause of exhaustion. Breathing exercises, gentle physical exercise, friction baths, massage, and rest are beneficial tools.', 'external');
INSERT INTO products VALUES (138, 'Rock A Bye', 'Restless Sleep', 29, 'Ingredients&leftpar;Herbal Extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Zizyphus		Suan Zao Ren

Polygala			Yuan Shi

Biota			Bai Zi Ren

Hoelen			Fu Shen

Schizandra		Wu Wei Zi

Peony			Bai Shao Yao

Dragon bone		Long Gu

Juncus			Deng Xin Cao

Hops			Humulus Lupulus

Gardenia		Zhi Zi

Lemon Balm		Melissa Officinalis

Passion Flower	Passiflora Incarnata

Cowslip			Primula Veris', 'Western Therapeutic Actions

Sedative, antispasmodic, nervine, carminative, anodyne, and tonic', 'Traditional Chinese Medicine

Nourishes the heart blood and yin, calms the spirit, and clears excessive heart fire', 'Sample Indications

Insomnia, restless sleep, dream disturbed sleep, and palpitations with anxiety', 'Suggested Dosage

10 - 20 drops, in a small amount of water, 1 hour before bedtime for insomnia

10 - 20 drops, in a small amount of water, 3 times daily, for palpitations with anxiety

Variation is according to individual symptoms', 'Contraindication and Cautions

There are none known.', 'Notations

Rock A Bye follows the traditional concept of many cultures that believe the spirit resides within the heart. When the heart is nourished and well-cared for, the spirit is at ease and rests comfortably. Excessive emotion agitates the heart and the spirit becomes unsettled, restless. An agitated heart creates insomnia. 

In the Dagara teachings, the ancestors visit us in our dreams. When the spirit is agitated, communication with the spirit world is disrupted. If we do not sleep, we do not dream. In the absence of dreams, the messages of the ancestors get lost. Sometimes they are difficult to understand and we need to consult with a healer who is a dream keeper. This way we will know how to act upon the dream. Dreams are considered transmissions that sometimes require action. Spirit, life, and ancestors are not considered to be nouns, but verbs. They hint action!

Rock A Bye brings nourishment to the heart, clears out any excessive heat &leftpar;agitation&rightpar;, calms the liver, and brings calmness to the spirit. This formula does not have any lingering side effects such as daytime drowsiness. It will bring a more calm feeling and the opportunity to wake up rested, refreshed.

Zizyphus, Polygala, and Biota nourish the heart and calm the spirit. Hoelen supports the spleen and quiets the heart. Schizandra stabilizes the spirit, when the fluids of the heart and kidney are depleted. Peony softens and relaxes the liver. Dragon bone settles the spirit and calms the liver. Juncus clears heat from heart and supports communication between the kidneys and heart. Hops and Passion Flower are nervous sedatives, calm the spirit, and relieve anxiety. Gardenia clears heat and relieves irritability. Lemon Balm is a sedative and carminative. Cowslip is a nervous restorative and sedative.', 'external');
INSERT INTO products VALUES (139, 'Sleepy Drops', 'Busy Mind', 7, 'Ingredients &leftpar;Homeopathic&rightpar;

Aconite		Acontium Napellus', 'Western Therapeutic Actions

Nervous sedative and specific', 'Traditional Chinese Medicine

Calms the spirit', 'Sample Indications

Insomnia that is caused through over-activity of the brain, when worry and thoughts interrupt the normal pattern of sleep', 'Suggested Dosage

5 - 20 drops before going to bed

Variation is according to individual symptoms', 'Contraindications and Cautions

There are none known.', 'Notations

The key symptom for this homeopathic remedy is when the mind will not stop thinking or worrying about things that are happening. A person lies down to go to sleep and the mind refuses to stop. Counting sheep does not even help nor does a warm glass of milk! Alas! What to do? Sleepy Drops, and sleep, sleep, sleep!', 'external');
INSERT INTO products VALUES (140, 'Bush Aphrodisiac', 'Sexual Tonic', 29, '&leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Kawa Kawa		Piper Methysticum

Matai			Prumnopitys Traxilohia

Manawa 			Tradescan Tia Fluminensis

Puka			Meryta Sinclairii

Kauri			Agathis Vitiensis

Tawa			Beilschmiedia Tawa

Taraire			Beilschmedia Taraire

Tarata			Pittosporum Eugenioides

Tanekaha	        Phyllocladus Trichomanoides', 'Western Therapeutic Actions

Restorative tonic, nerve tonic, hepatic, aphrodisiac, and adrenal tonic', 'Traditional Chinese Medicine

Enhances the reproductive qi, calms the spirit, and soothes the liver', 'Sample Indications

Weak sexual drive, sexual exhaustion, insomnia, nervous 

exhaustion, and tension', 'Suggested Dosage

5 - 20 drops, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

Sexual dysfunction may indicate more serious medical problems Seek the cause, low libido may be due to physical or emotional problems. If trouble persists seek a diagnosis and treatment from a qualified medical practitioner.', 'Notations 

These Maori herbs &leftpar;New Zealand&rightpar; have been used medicinally for centuries. They are used in many of our herbal remedies. Bush Aphrodisiac was developed by Angela Chadwick, Medical Herbalist of Self Heal, in New Zealand. 

Bush Aphrodisiac is a unique formulation in that it enhances the libido &leftpar;kidney restorative&rightpar; while calming the heart. Her idea was to include a loving open heart into the sexual realm as a means to enhance the libido. Bush Relaxant is the same formulation with different herb quantities to encourage a calm and serene attitude.

Kawa Kawa is a blood purifier, aphrodisiac, and kidney tonic. Matai, Tarata,  and Tawa are digestive and lung tonics. Manawa is a relaxant. Puka is a restorative, regulates the menstruation, and aids digestion. Kauri is a restorative to the body and mind. Taraire is a hormone balancer and calms the mind. Tanekaha is a premier liver purifier.', 'external');
INSERT INTO products VALUES (142, 'Bush Bitters Cream', 'Cure All, Herpes, Fever Blisters', 15, 'Ingredients &leftpar;Herbal Extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Harakeke	        Phormium Tenax

Kumarahoe	Pomaderris Kum

Kawa Kawa	Piper Methysticum 

Pukatea	        Laurelia Novae-

Horopito	        Pseudowintera Colorata

Koromiko	        Hebe Salicifolia

Kohe Kohe	Dysoxylum Spectabile

Puriri		Vitex Lucens

Karamu		Coprosma Robusta

Kowhai		Sophora Microphylla

Kareao		Ripogonum Scandens 

Beeswax

Olive Oil', 'Western Therapeutic Actions

Vulnerary, antiseptic, anti-inflammatory, analgesic, and antipruritic', 'Traditional Chinese Medicine

Clears heat, alleviates pain, and disperses blood stasis', 'Sample Indications

Pain relief, cold sores, genital herpes, boils, diaper rash, psoriasis, sun spots, tinea, eczema, and itchy bites', 'External Application

Apply topically to the affected area, 3 times daily', 'Contraindications and Cautions

There are none known.', 'Notations

Bush Bitters Cream is known to be successful when all else has failed. It promotes the healing of any skin condition. This remedy is made exclusively with herbs from the Maori tradition.', 'external');
INSERT INTO products VALUES (143, 'Bush Relaxant', 'Stress', 29, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Kawa Kawa		Piper Methysticum

Matai			Prumnopitys Traxilohia

Manawa 			Tradescan Tia Fluminensis

Puka			Meryta Sinclairii

Kauri			Agathis Vitiensis

Tawa			Beilschmiedia Tawa

Taraire			Beilschmedia Taraire

Tarata			Pittosporum Eugenioides

Tanekaha		Phyllocladus Trichomanoides', 'Western Therapeutic Actions

Restorative, nerve tonic, hepatic, aphrodisiac, and adrenal tonic', 'Traditional Chinese Medicine

Enhances the reproductive qi, calms the spirit, and soothes the liver', 'Sample Indications

Nervous exhaustion, stress, insomnia, weak libido, and tension', 'Suggested Dosage

5 - 20 drops, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

Sexual dysfunction may indicate more serious medical problems Seek the cause, low libido may be due to physical or emotional problems. If trouble persists seek a diagnosis and treatment from a qualified medical practitioner.', 'Notations 

These Maori herbs &leftpar;New Zealand&rightpar; have been used medicinally for centuries. They are used in many of our herbal remedies. Bush Relaxant was developed by Angela Chadwick, Medical Herbalist of Self Heal, in New Zealand. 

Bush Relaxant is a unique formulation in that it enhances the libido &leftpar;kidney restorative&rightpar; while calming the heart. Her idea was to include a loving open heart into the sexual realm as a means to enhance the libido. Bush Aphrodisiac is the same formulation with different herb quantities to encourage the libido.

Kawa Kawa is a blood purifier, aphrodisiac, and kidney tonic. Matai, Tarata,  and Tawa are digestive and lung tonics. Manawa is a relaxant. Puka is a restorative, regulates the menstruation, and aids digestion. Kauri is a restorative to the body and mind. Taraire is a hormone balancer and calms the mind. Tanekaha is a premier liver purifier.', 'external');
INSERT INTO products VALUES (144, 'Man''s Path', 'Enlarged Prostate', 28, 'Ingredients Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Saw Palmetto			Serenoa Serrulata

Plantago seed		Che Qian Zi

Vaccaria				Wang Bu Liu Xing 

Astragalus			Huang Qi

Marshmallow			Althea Officinalis

Corn Silk			Yu Mi Xu

Patrinia				Bai Jiang Cao

Echinacea			Echinacea Angustifolia

Sarsaparilla			Smilax Officinalis

Skullcap				Scutellaria Lateriflora

Achyranthes			Niu Xi

Saussurea			Mu Xiang

Goldenseal			Hydrastis Canadensis

Kava Kava			Piper Methysticum', 'Western Therapeutic Actions

Antiseptic, detoxicant, diuretic, demulcent, emollient, alterative, depurative, and tonic', 'Traditional Chinese Medicine

Clears damp/heat, supplements the qi, vitalizes the blood, invigorates the channels, relieves toxicity, and promotes urination', 'Sample Indications

Reconditioning of the prostate gland, prostatitis, benign prostatic hyperplasia, sedimentation, painful or difficult urination, frequent urination, difficulty in maintaining an erection, painful ejaculation, blood in the urine or semen, and pain or stiffness in the lower back', 'Suggested Dosage

1  2 teaspoons, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

Use with caution with cases of exhausted yang. Mans Path works well with other formulas that nurture the kidneys.', 'Notations

Mans Path is designed to cleanse the prostate gland and and restore it to healthier functioning. The Chinese herbs used in this formula are patterned after a very effective Chinese patent formula called Kai Kit Wan. 

Saw Palmetto is long established as a specific for the prostate gland in men, and a reproductive enhancing herb as it strengthens the kidney yang. Echinacea supports Saw Palmetto with its cleansing actions. Plantago seed clears damp/heat from the lower body. Vaccaria activates the blood and relieves pain in the lower abdomen. Astragalus and Corn Silk promote the movement of fluids. Patrinia relieves toxicity and toxic swellings. Sarsaparilla is a testosterone hormone enhancer and an alterative. Skullcap helps to relieve the constrained liver qi. Achyranthes directs the action of this formula downwards through the kidneys and reproductive organs. Saussurea regulates the middle burner and activates the circulation of qi. Goldenseal helps to heal the mucous membranes and reproductive tissues. Kava Kava is a restorative and diuretic.

Pumpkin seeds and pomegranates are an excellent addition to the diet. If inflammation, pain, and frequent urination are present, a *Bran Poultice may be placed on the lower abdomen. Hold the poultice in place with a large bandage or towel and leave on overnight. Repeat as needed.

A PSA test and DRE is recommended for prostate cancer screening if urinary or erectile dysfunction persist.

*Bran Poultice: See External Applications', 'external');
INSERT INTO products VALUES (145, 'Men Only', 'Enhances Fertility', 28, 'Ingredients &leftpar;Herbal Extracts&rightpar;

Listed by common and pin yin or latin names, in sequence from largest to smallest amount by quantity.

Rehmannia, prepared	Shu Di Huang

Damiana	                 	Turnera Diffusa

Sarsaparilla	         	Smilax Officinalis

Atractylodes	         	Bai Zhu

Tang Kuei	                 	Dang Gui

Lycium fruit	         	Gou Qi Zi

Saw Palmetto	         	Serenoa Serrulata

Muira Puama	         	Liriosma Ovata

Yohimbe	                 	Pausinystalia Yohimbe

Curculigo	                 	Xian Mao

Ginseng, Chinese      	Ji Lin Ren Shen

Morinda	                 	Ba Ji Tian

Cistanche          	        Rou Cong Rong

Cornus			Shan Zhu Yu

Eucommia		Du Zhong

Epimedium		Yin Yang Huo

Gentian			Gentiana Lutea

Cinnamon bark		Rou Gui

Cnidium seed		Che Chuang Zi', 'Western Therapeutic Actions

Stimulant, reproductive restorative, alterative, nutritive tonic, diuretic, aphrodisiac', 'Traditional Chinese Medicine

Strengthens the kidney yang, warms the lower body, nourishes the yin and replenishes the essence', 'Sample Indications

Infertility, low sperm count, impotence, weakness in the lower body, exhaustion after sex, and loss of passion', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

There are none known.', 'Notations

Men Only, patterned after a Chinese formula, Zan Yu Dan, feeds the fire at Gate of Vitality. When the fire declines in the well of the kidney, sexual dysfunctions arise. This remedy, in alignment with ancient knowledge, follows the principle that when the kidny yang &leftpar;fire&rightpar; is fortified, the kidney yin &leftpar;water&rightpar; must also be nourished. This prevents the overheating of the kidney yang and helps to augment the essence. When a man has cold sperm, they are unable to swim that extra mile and the ones that do make it, lack the power to penetrate the egg. Alas men, keep those kidneys warm, eat those shrimp and oysters, and babies will abound! Premature ejaculation is more of a kidney yin deficiency, as the water is unable to constrain the fire.', 'external');
INSERT INTO products VALUES (147, 'Cysts Clear', 'Uterine Cysts', 28, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Lindera				Wu Yao

Tang Kuei			Dang Gui

Codonopsis			Dang Shen

Carthamus			Hong Hua

Persica				Tao Ren

Burdock root			Arctium Lappa

Corydalis			Yan Hu Suo

Cyperus				Xiang Fu

Poke Root			Phytolacca Spp.

Echinacea			Echinacea Angustifolia

Moutan				Mu Dan Pi

Wild Indigo			Qing Dai

Jaborandi			Pilocarpus Spp.

Goldenseal			Hydrastis Canadensis

Cinnamon bark		Rou Gui', 'Western Therapeutic Actions

Decongestant, detoxicant, alterative, depurient, deobstruent, and relaxant', 'Traditional Chinese Medicine

Vitalizes the blood, promotes the movement of qi, supplements the qi, spreads constrained liver qi, warms the kidneys, and 

alleviates pain', 'Sample Indications

Abdominal masses, fluid cysts, menstrual pain, and fixed lower abdominal pain &leftpar;including hernia&rightpar;', 'Suggested Dosage

1  2 teaspoons, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

Contraindicated during pregnancy. Discontinue the use of this formula during the menstrual cycle.', 'Notations 

In Oriental Medicine, when coldness in the lower body goes untreated, blood loses its free flowing movement, stagnation occurs, and the fluid in the body forms soft masses. Cysts Clear is effective when there are additional cold symptoms &leftpar;cold abdomen or feet&rightpar;. Fluid cysts can be rapidly resolved when blood-invigorating herbs are combined with warming herbs. Cysts Clear is a modified version of Ge Xia Zhu Yu Tang or Drive Out Blood Stasis Below the Diaphragm Decoction, and should subsequently be followed up with formulas that address the systemic cause of the disorder.

Lindera promotes the smooth movement of qi, disperses internal cold, and alleviates pain. Tang Kuei nourishes the blood and Codonopsis supplements the qi. Carthamus with Persica invigorates the blood and disperses blood stasis. Poke root is an excellent alterative and commonly used for swollen lymph nodes. Burdock root is a premier blood purifier and is supported by Echinacea and Wild Indigo. Moutan cools the blood and balances Cinnamon barks warming actions. Cyperus helps to move the qi and breaks up stagnation. Corydalis disperses blood stagnation and alleviates abdominal pain. Jaborandi, an excellent herb for diabetes, is also a deobstruent and clears the lymphatic system. Goldenseal helps the tissue membranes to heal and also balances the warm nature of Cinnamon bark. Cinnamon bark warms the kidneys, disperses internal cold, warms and unblocks the channels, and alleviates pain.

Remember that chronic fear, worry, and stress deplete the essence of the kidney and could be a causative factor.', 'external');
INSERT INTO products VALUES (148, 'Fibroid Clear', 'Uterine Fibroids', 28, 'Ingredients  &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Rhodiola			Hong Jing Tian

Zedoaria			E Zhu

Sparganium		San Leng

Burdock root		Arctium Lappa

False Unicorn	Chamaelirium Luteum

Tang Kuei		Dang Gui

Cinnamon twig	Gui Zhi

Peony, red		Chi Shao Yao

Corydalis		Yan Hu Suo

Hoelen			Fu Ling

Persica			Tao Ren

Moutan			Mu Dan Pi

Poke Root		Phytolacca Spp.

Ladys Mantle	Alchemilla Vulgaris

Goldenseal		Hydrastis Canadensis', 'Western Therapeutic Actions

Alterative, depurative, deobstruent, astringent, styptic, and tonic', 'Traditional Chinese Medicine

Breaks up blood stasis, promotes the movement of qi, nourishes the blood, supplements the qi, reduces fixed abdominal masses, and alleviates pain', 'Sample Indications

Lower abdominal masses, uterine fibroids, uterine cysts, pelvic inflammatory disease, dysmenorrhea, and endometriosis', 'Suggested Dosage

1  2 teaspoons, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

Contraindicated during pregnancy or postpartum. Discontinue the use of this formula during the menstrual cycle.', 'Notations 

Fibroid Clear is designed to be taken for several months. In order to arrest the bleeding from fibroids, they must be reduced in size and the blood stagnation dispersed. Originally, Gui Zhi Fu Ling Wan or Cinnamon and Hoelen Formula, was given to pregnant woman suffering from abdominal pain with uterine bleeding. The herbs in the original formula are Cinnamon twig, Hoelen, Peony, Moutan, and Persica.

By modifying Gui Zhi Fu Ling Wan with the addition of Zedoaria and Sparganium, two strong vitalizing blood herbs, the actions of Fibroid Clear are enhanced. Rhodiola was added to this formula as a restorative to help address the underlying deficiency of this imbalance. Rhodiola has excellent adaptogenic, anti-stress, and anti-oxidant qualities. Red Peony was substituted for White Peony because of its greater ability to break up blood stagnation. In Oriental Medicine, fixed abdominal masses are thought of as qi and blood that is constrained or tied up. Constrained qi or blood can cause, over time, the formation of masses and heat. Moutan and Persica cool the blood and disperse accumulation. Ladys Mantle cools the blood and has astringent qualities. With these two qualities, it is used specifically for excessive female bleeding. False Unicorn is a premier uterine restorative with astringent actions and combines well with Tang Kuei, a blood restorative. Poke root is a blood and lymph cleanser. Cyperus breaks up constrained liver qi and relieves stress. Corydalis relieves lower abdominal pain. 

Restorative herbal tonics should be administered to the patient after the fibroids have been cleared. Usually, a cold lower abdomen that is constrained, is linked to an underlying deficient condition.', 'external');
INSERT INTO products VALUES (149, 'Phoenix Rising', 'Sexual Stimulant', 28, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Epimedium		  Yin Yang Huo

Kapikachu		  Mucuna Pruriens

Ashwaganda		  Withania Somnifera

Rehmannia, prep.   Shu Di Huang

Maca			  Lepidium Meyenii

Tribulus			  Bai Ji Li

Cornus			  Shan Zhu Yu

Catuaba			  Erythroxylum Catuaba

Clavo Huasco	  Tynanthus Panurensis

Damiana			  Turnera Diffusa

Shilajit			  Asphaltum

Lindera			  Wu Yao

Bayberry			  Myrica Cerifera

Motherwort		  Leonurus Cardiaca', 'Western Therapeutic Actions

Aphrodisiac, restorative, nerve tonic, nutritive tonic, circulatory stimulant, and relaxant', 'Traditional Chinese Medicine

Fortifies the kidney yang and replenishes the essence, warms the lower body, and nourishes the yin', 'Sample Indications

Weak libido, sexual impotence, frigidity, erectile dysfunction, spermatorrhea, and infertility', 'Suggested Dosage

1  2 teaspoons, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

Contraindicated during a warm/febrile disease, or if yin deficient with fire &leftpar;thirst, night sweats, hot feet and hands, and a red tongue&rightpar;.', 'Notations

Phoenix Rising was designed with sexual stimulant herbs from time proven herbs from around the world. In Oriental Medicine the kidney yang &leftpar;fire&rightpar; has to be plentiful for a robust libido. Because of the strength, of Phoenix Rising, it activates ones sexuality quite immediately. Taking a dosage one hour before bedtime has proven very effective. Herbs for the heart have been included in this formula, acknowledging that sexuality is intimately connected to our heart, and our ability to be compassionate and open.

Epimedium is a kidney yang tonic. It is used for weak libido, incontinence, forgetfulness, withdrawal, and cold lower body. Kapikachu and Ashwaganda, Ayurvedic herbs, are restoratives and support the nervous system. Rehmannia nourishes the kidney yin and balances the warm nature of this formula. Maca and Clavo Huasco, Peruvian herbs, have been used traditionally as aphrodisiacs and to enhance fertility. Catuaba, a Brazilian herb, is used to fortify the nervous system and as an aphrodisiac. Tribulus anchors the kidney yang and enhances testosterone levels. Cornus nourishes the kidney and liver and augments the essence. Damiana is the Western counterpart to Epimedium. Shilajit, another Ayurvedic herb, is considered an anti-aging herb and fertility enhancer. Lindera and Bayberry enhance the circulation in the lower body. Motherwort nourishes the heart and calms the nerves.', 'external');
INSERT INTO products VALUES (150, 'Woman''s Blues', 'Mood Swings, Supports Hormones', 28, 'Ingredients &leftpar;&leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Tang Kuei		        Dang Gui

Skullcap			        Scutellaria Lateriflora

Cyperus			        Xiang Fu

Lindera			        Wu Yao

Rehmannia, prep.		Shu Di Huang

Shatavari			Asparagus racemosa

Peony, red			Chi Shao Yao

Blue Citrus			Qing Pi

Carthamus			Hong Hua

Cnidium				Chuan Xiong

Uva Ursi				Arctostaphylos Uva Ursi

Motherwort			Leonurus Cardiaca

Moutan				Mu Dan Pi

Cinnamon bark		Rou Gui', 'Western Therapeutic Actions

Emmenagogue, nutritive, decongestant, analgesic, antispasmodic, nervine, diuretic, and relaxant', 'Traditional Chinese Medicine

Vitalizes the blood, transforms blood stasis, nourishes the blood, regulates the qi, and alleviates menstrual distress

ü', 'Sample Indications

PMS &leftpar;emotional outbreaks, sugar cravings, tender or swollen breasts, and water retention&rightpar;, irregular menstruation, and abdominal discomfort prior to menstruation', 'Suggested Dosage

1  2 teaspoons, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

There are none known.', 'Notations

Womans Blues is a hormone balancer for women of all ages up to menopause. When the blood becomes stagnant and loses its free flowing nature, the psyche responds inappropriately and the emotions spill over onto others. In Oriental Medicine, heat accompanies stagnation. Irritation or anger might take the front stage as things begin to heat up. 

Womans Blues is a modified version of a formula created by Dr. Zhang Jie-bin, called Tong Yu Jian, or Penetrate Congealed Blood Decoction, and the Chinese classic, Si Wu Tang or Tang Kuei Four Combination. The Chinese herbs are supported by Western proven specifics.

Tang Kuei is the premier blood tonic. It nourishes the blood and regulates the menstruation. Its warm nature disperses cold and alleviates pain. Tang Kuei also moistens the bowels and alleviates constipation. Skullcap is a nervine and antispasmodic. Cyperus regulates the menstruation, alleviates pain, and moves the liver qi. Lindera warms the lower abdomen, promotes the movement of qi, and alleviates pain. Rehmannia nourishes the liver and kidney yin. Shatavari, an Ayurvedic herb, balances the female hormonal system. Peony, Carthamus, and Cnidium vitalize the blood. Blue Citrus supports Cyperus and helps to spread the liver qi. Moutan and Motherwort &leftpar;Leonurus Cardiaca&rightpar; help to calm the emotional outbursts and agitation. Uva Ursi is a gentle diuretic and will resolve any excess water retention that women experience during their cycle. Because of its draining nature, Uva Ursi directs the actions of the other herbs towards the lower abdomen. Cinnamon bark disperses the deep internal cold and unblocks the channels. It leads the fire back to its source.', 'external');
INSERT INTO products VALUES (151, 'Woman''s Cream', 'Tones Female Tissue', 15, 'Ingredients &leftpar;Herbal Extracts&rightpar;

Listed by common and pin yin or latin names, in sequence from largest to smallest amount by quantity.

Black Cohosh		Cimicufuga Racemosa

Tang Kuei  		Dang Gui

Goldenseal		Hydrastis Canadensis

Marshmallow		Althea Officinalis

Wild Yam   		Dioscorea Villosa

Beeswax

Olive Oil', 'Western Therapeutic Action

Restorative, nutritive, tonic, demulcent, emollient, and antispasmodic', 'Traditional Chinese Medicine

Nourishes the blood and kidney, promotes the circulation of blood, and heals skin tissues', 'Sample Indications

Dry or thinning vaginal tissues, female hypogonadism, and chronic estrogen deficiency', 'External Application

Apply cream to the vaginal tissues, 2 times daily or as needed', 'Contraindications and Cautions

Contraindicated during pregnancy.', 'Notations

Womans Cream is led by the herb, Black Cohosh, which contains phytoestrogens &leftpar;estrogen-like&rightpar; compounds, and mimics  the chemistry of estrogen. This cream is a supportive therapy for estrogen deficiency and women have enjoyed the benefits it has given them during and following menopause.', 'external');
INSERT INTO products VALUES (188, 'Neck Shoulder Pain', NULL, 28, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Corydalis			Yan Hu Suo

Chiang Huo			Qiang Huo

Turmeric			Curcuma Longa

Du Huo				Tu Huo

Clematis				Wei Ling Xian

Pueraria				Ge Gen 

Gentiana, macro.		Qin Jiao

Peony				Bai Shao Yao

Morus twig			Sang Zhi 

Black Cohosh		Cimicufuga Racemosa

Mistletoe			Viscum Album

Cramp Bark			Viburnum Opulus

Cinnamon twig		Gui Zhi

Ginger, dried			Gan Jiang', 'Western Therapeutic Actions

Anodyne, anti-inflammatory, analgesic, nutritive, alterative, and antispasmodic', 'Traditional Chinese Medicine

Dispels wind/dampness, harmonizes the protective and nutritive qi, vitalizes the blood, and breaks up stagnant qi', 'Sample Indications

Neck and shoulder pain, upper body muscular spasms, rotator cuff injury, bursitis, tendonitis, limited mobility in the upper body, and numbness in the arms', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

Contraindicated during pregnancy.', 'Notations 

Neck Shoulder Pain, uses two Chinese formulas, Gui Zhi Jia Ge Gen Tang or Cinnamon and Pueraria Combination, and Juan Bi Tang or Chiang Huo and Turmeric Combination, to address acute and chronic disorders involving the neck and shoulder. 

Corydalis is a specific for pain relief, regardless of location, as it follows the direction of the herbs in the formula. Chiang Huo and Clematis dispel wind/damp and alleviate pain in the upper body. Three specific herbs for treating neck and shoulder problems, Pueraria, Morus twig, and Gentiana &leftpar;Qin Jiao&rightpar; have also been included in this formula. They are commonly used together for resolving wind/dampness, alleviating pain, and unblocking the channels. Turmeric expels wind, vitalizes the blood, and moves the qi. It is used for upper and mid-body pain. Du Huo, commonly used in resolving muscular/skeletal imbalances of the lower body, is led by Chiang Huo for alleviation of upper body pain. Black Cohosh relieves trapezius pain. Mistletoe and Cramp Bark combine well for the relief of muscular spasms. Peony and Cinnamon twig are paired because of their ability to release muscular tension and harmonize the protective and nutritive qi. Ginger warms the limbs and supports the stomach.

Replenishment or tonification of the body is important to consider as it follows the Oriental Medicine belief that, if one desires to unblock, then one must first fill. Herbal therapies that vitalize the blood, move the qi, or open the channels, also take into consideration any depletion or deficiency of the client. Otherwise the symptoms temporarily subside, only to return later, sometimes with greater vigor and fire power.

See Muscular & Skeletal External Formulas for additional support', 'internal');
INSERT INTO products VALUES (152, 'Woman''s Moon', 'Menstrual Regulator', 28, 'Ingredients&leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Tang Kuei			Dang Gui

Raspberry leaf		Rubus Idaeus

Skullcap				Scutellaria Lateriflora

Rehmannia, prep.		Shu Di Huang

Shatavari			Asparagus racemosa

Codonopsis			Dang Shen

Peony				Bai Shao Yao

Cnidium				Chuan Xiong

Hoelen				Fu Ling

Ladys Mantle		Alchemilla Vulgaris

False Unicorn		Chamaelirium Luteum

Uva Ursi				Arctostaphylos Uva Ursi

Licorice, baked		Zhi Gan Cao

Wild Yam			Dioscorea Villosa

Cramp Bark			Viburnum Opulus

Cinnamon bark		Rou Gui', 'Western Therapeutic Actions

Emmenagogue, nutritive, calming, decongestant, astringent, diuretic, and antispasmodic', 'Traditional Chinese Medicine

Nourishes the liver blood, spreads the liver qi, strengthens the spleen, resolves dampness, and warms the kidneys', 'Sample Indications

Anemia, fatigue, menstrual irregularity and discomfort, warmth relieves abdominal pain, neck and shoulder stiffness, flushed face &leftpar;feverish&rightpar;, cold extremities &leftpar;especially the feet&rightpar;, vertigo or dizziness', 'Suggested Dosage

1  2 teaspoons, in a small amount of water, 

3 times daily

Variation is according to individual symptoms

ü', 'Contraindications and Cautions 

Contraindicated during pregnancy.', 'Notations

Womans Moon is designed to create a smooth rhythmic menstrual cycle. Dang Gui Shao Yao San or Tang Kuei and Peony Formula provides the foundation for many womens formulas in Oriental Medicine. It was expanded to include three additional herbs; Codonopsis, Licorice, and Cinnamon and named, Jen Sheng Tang Shao San or Ginseng and Tang Kuei Formula. 

With the addition of Raspberry leaf and Ladys Mantle, Womens Moon corrects the imbalance of a cold uterus. Tang Kuei excels in all gynecological syndromes as it nourishes and moves the blood. Skullcap is a nervine and antispasmodic. Rehmannia nourishes the blood, kidney yin, and essence. Shatavari is a female hormone balancer. False Unicorn supports the production of estrogen, harmonizes menstruation, and enhances fertility. Uva Ursi, also called Bearberry, nourishes the kidneys and directs the herbs downward. Wild Yam is a uterine relaxant, enhances progesterone production, circulates the qi in the uterus, Cinnamon bark fortifies the kidney yang. Cramp bark vitalizes the blood, moves the qi, and harmonizes the menstrual cycle.

In Oriental Medicine, illusionary heat and true cold or heat above/cold below mark this formula. The deficiency &leftpar;blood and qi&rightpar; is unable to hold the yang &leftpar;fire&rightpar; down in its proper place, called the dan-tien, located four inches below the navel. When the yang floats upward &leftpar;heat rising&rightpar;, facial flushing, feverish feeling, acne, hot eyes, headache, palpitations, anxiousness, or rashes are noticed. As the heat floats upward, what is left below suffers from cold. The abdomen and feet feel chilled and are relieved by warmth.', 'external');
INSERT INTO products VALUES (169, 'Golden Lock', 'Urinary Incontinence, Premature Ejaculation', 28, 'Ingredients  &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Astragalus seed		Sha Yuan Zi

Lotus seed			Lian Zi

Euryales				Qian Shi

Cuscuta				Tu Si Zi

Cornus				Shan Zhu Yu

Lotus stamen		Lian Xu

Agrimony			Agrimonia Eupatoria

Psoralea				Bu Gu Zhi

Rose Hip			Jin Ying Zi

Schizandra			Wu Wei Zi

Cynomorium			Suo Yang

Oyster shell			Mu Li

Dragon bone			Long Gu', 'Western Therapeutic Actions

Astringent, tonic, and diuretic', 'Traditional Chinese Medicine

Stabilizes the kidneys, astringes the essence, and binds up the semen', 'Sample Indications

Incontinence, premature ejaculation, neurasthenia &leftpar;mental and physical fatigue and depression&rightpar;, impotence, and myasthenia gravis &leftpar;chronic muscle weakness&rightpar;', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

Contraindicated in cases of damp/heat in the lower burner &leftpar;bladder or vaginal infections&rightpar;.', 'Notations 

Golden Lock follows the pattern of Jin Suo Gu Jing Wan or Golden Lock Tea. This formula has a nurturing effect on the kidney essence. In Oriental Medicine, the kidneys &leftpar;yin/water and yang/fire&rightpar; store the essence &leftpar;sperm&rightpar; and control the bladder. If the kidneys are weakened from chronic stress or illness, poor nutrition or an excessive amount of fear, they loose the ability to function properly and spermatorrhea or incontinence can occur. 

This type of disorder usually requires taking a herbal formula for a number of months so that the body is given the time it requires to rebuild and regenerate the damaged tissues or rectify the disharmony. It requires time to rebuild the essence, much the same as rebuilding the roots of an old oak tree. If the roots become damaged, it will take a minimum of one year for the roots of the mighty oak to regain their strength. Be patient and stay committed. Clear any excessive internal heat or purge the liver when taking this formula for long periods of time. 

Astragalus seed has a different function than Astragalus root. The seed fortifies the kidney fire &leftpar;yang&rightpar;. When the kidney yang is weak symptoms such as as lower back pain, impotence, frequent urination, vaginal discharge, or premature ejaculation are experienced. Astragalus seed is also used for improving the vision which is believed to be controlled by the health of the liver and kidneys. Cuscuta fortifies the kidney fire plus it augments the kidney water &leftpar;yin&rightpar;. Lotus seed, Euryales, Cornus, and Rose hip help to stabilize and bind the energy in the kidneys &leftpar;stops leakage&rightpar;. Schizandra strengthens the lungs and kidneys, prevents leakage and calms the spirit. Oyster shell and Dragon Bone calm the spirit and are astringents.', 'external');
INSERT INTO products VALUES (153, 'Woman''s Twilight', 'Hormone Balancer, Hormone Replacement', 28, 'Ingredients&leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Oats				Avena Sativa

Curculigo			Xian Mao

Epimedium			Yin Yang Huo	

Rehmannia, prep.		Shu Di Huang

Shatavari			Asparagus racemosa

Morinda				Ba Ji Tian

Tang Kuei			Dang Gui

Anemarrhena		Zhi Mu

Phellodendron		Huang Bai 

Mistletoe			Viscum Album

Chamomile, Roman	Anthemis Nobilis

Uva Ursi				Arctostaphylos Uva Ursi

Beth root			Trillium Erectum

Black Cohosh		Cimicufuga Racemosa

Sarsaparilla			Smilax Officinalis

Goldenseal			Hydrastis Canadensis

Wild Yam			Dioscorea Villosa

Chaste Tree berry		Vitex Agnus Castus', 'Western Therapeutic Actions

Restorative, nutritive, nerve tonic, nervine, diuretic, astringent, alterative, and antiseptic', 'Traditional Chinese Medicine

Nourishes the kidneys &leftpar;yin and yang&rightpar;, drains fire, nourishes the blood, and regulates the penetrating and conception channels or vessels', 'Sample Indications

Menopausal symptoms which can include hot flashes, irritability, insomnia, palpitations, sweating, depression, dysmenorrhea, amenorrhea, hypertension, and frequent urination', 'Suggested Dosage

1  2 teaspoons, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

There are none known.', 'Notations

Womans Twilight is a combination of the Western time proven specifics with the Chinese formula, Er Xian Tang or Two Immortals Decoction. In Oriental Medicine, menopause is affected by the penetrating and the conception channels, which have a direct impact on fertility, reproduction, and the menstrual cycle. 

Curculigo and Epimedium, kidney yang tonics, were considered by some as herbs for immortality. They are supported by the nervine and restorative herb, Wild Oats. Morinda and Sarsaparilla are kidney yang tonics. Rehmannia nourishes the blood, the kidney yin, and the essence. Shatavari is an excellent hormone balancer. Anemarrhena and Phellodendron drain the fire and alleviate hot flashes. Tang Kuei, helps to regulate these two channels, enhancing the blood, fertility, and reproduction. The three organs which benefit from Tang Kuei, a warming mother herb are: the heart &leftpar;home of the spirit&rightpar;, liver &leftpar;regulator of movement&rightpar;, and spleen &leftpar;directs transitions&rightpar;. Tang Kuei and its affect on the estrogen levels, in standard dosages, is unsubstantial. Mistletoe and Chamomile are relaxants. Uva Ursi, a diuretic, directs the herbs downward. Beth root is an astringent, arrests excessive bleeding, and strengthens the uterus. Black Cohosh alleviates hot flashes and is an astringent. Goldenseal, a cool bitter tonic, restores health to the mucous membranes. Wild Yam is an antispasmodic. Chaste Tree berry nourishes the kidneys, balances the hormones, and circulates the uterine qi.  

Herbs used for hormonal balancing allow the body to establish its natural balance point. Aging depletes the essence, the fluids dry, and the fire wanes, the bones soften, our minds loose crispness, teeth fallout, sex becomes a foreign word, things sag, and the hair withers. Laugh a lot, enjoy being the elder.', 'external');
INSERT INTO products VALUES (154, 'Woman''s Candida', 'Vaginal Discharge, Leucorreah', 28, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Burdock root			Arctium Lappa

Phellodendron		Huang Bai 

Marshmallow			Althea Officinalis

Wild Indigo			Baptisia Tinctoria

Tang Kuei			Dang Gui

Atractylodes			Bai Zhu

Cuttlebone			Hai Piao Xiao

Cuscuta				Tu Si Zi

Meadowsweet		Filipendula Ulmaria

Echinacea			Echinacea Angustifolia

Calendula			Calendula Officinalis

Poke Root			Phytolacca Spp.

Horopito			Pseudowintera Colorata

Black Walnut			Juglans Nigra

Goldenseal			Hydrastis Canadensis', 'Western Therapeutic Actions

Anti-fungal, astringent, antiseptic, alterative, demulcent, emollient, depurative, antacid, and detergent', 'Traditional Chinese Medicine

Drains damp/heat, supports the spleen qi, nourishes the blood, and retains the essence', 'Sample Indications

Vaginal candidiasis &leftpar;thrush&rightpar;, leukorrhea, white vaginal discharge with irritation and itching, and bacterial or viral infections of the vagina', 'Suggested Dosage

1  2 teaspoons, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

Contraindicated during pregnancy.', 'Notations

Womans Candida is a modified version of a relied upon Chinese patent formula called Chien Chin Chih Tai Wan or Thousand Pieces of Gold Stop Leukorrhea Pill. 

An excellent anti-fungal herb used by the Maoris, Horopito, is included in Womans Candida. Externally or internally, Horopito is one of the premier anti-fungal herbs from around the world. Fungus thrives in a damp heat environment in the natural world and inside of us. In Oriental Medicine, dampness is resolved by using herbs to dry and strengthen the spleen. Excess heat is cleared by herbs that cool and drain the fire.

Burdock root is a blood purifier and cleanses the body via the kidneys. Phellodendron drains damp/heat, particularly from the lower body, and is effective for yellow vaginal discharge. Atractylodes is specific for drying and strengthening the spleen. Tang Kuei is a blood tonic, and with Marshmallow and Calendula nourish, cleanses, and heal the skin tissues and is anti-fungal. Impurities in the blood are cleared by Wild Indigo, Echinacea, and Poke root. Cuscuta strengthens the kidney and secures the essence. Goldenseal is a detergent and tones the mucous membranes. The astringent properties of Cuttlebone and Meadowsweet bind and contract the tissues. Black Walnut is an alterative and detergent.', 'external');
INSERT INTO products VALUES (155, 'Women Only', 'Enhances Fertility', 28, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Raspberry leaf		Rubus Idaeus

Damiana				Turnera Diffusa

Tang Kuei			Dang Gui

Morinda				Ba Ji Tian

Cistanche			Rou Cong Rong

Rehmannia, prep.		Shu Di Huang

Cornus				Shan Zhu Yu

Shatavari			Asparagus racemosa

Muira Puama			Liriosma Ovata

Curculigo			Xian Mao

Motherwort			Leonurus Cardiaca

Sarsaparilla			Smilax Officinalis

False Unicorn		Chamaelirium Luteum

Cinnamon twig		Gui Zhi', 'Western Therapeutic Actions

Restorative, adaptogenic tonic, astringent, aphrodisiac, nerve tonic, and relaxant', 'Traditional Chinese Medicine

Warms and harmonizes the penetrating and conception channels, dispels cold, fortifies the kidneys, nourishes the blood, and disperses blood stagnation', 'Sample Indications

Infertility, mild or persistent uterine bleeding, irregular menstruation, pelvic inflammatory disease, menopause and dysmennorhea', 'Suggested Dosage

1  2 teaspoons, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions Contraindicated in cases with yin deficiency &leftpar;dry mouth and throat, afternoon fever&rightpar; and abdominal masses due to blood stagnation from excess &leftpar;heat&rightpar;.', 'Notations

In Oriental Medicine, two primary issues are taken into consideration when fertility becomes the topic of discussion. They are the uterus, which requires warmth, and the second is the blood. The blood requires abundance, richness, and movement. With these qualities it is able to supply the uterus with a continual flow of fresh blood and qi. The warmth allows the blood and qi to flow freely, without obstruction. When the uterus becomes cold, stagnation manifests and hinders the movement of blood and qi. 

Women Only is designed to warm the uterus and stimulate the flow of internal blood and qi. The Chinese herbs are a modified version of the formula called, Wen Jing Tang or Tang Kuei and Evodia Combination. 

The Western herbs, Raspberry leaf and Damiana are used extensively in womens gynecology. Raspberry leaf is one of the few herbs that can be used during all stages of pregnancy. It enhances fertility, and stimulates milk production, making it a remarkable female tonic. Damiana is somewhat similar to the Chinese herb, Morinda. The former fortifies the kidney yang, enhances fertility, harmonizes the penetrating and conception vessels, strengthens the nerves, and calms the spirit. Rehmannia nourishes the blood, yin, and essence. Cornus retains the essence and is used to enhance the libido and fertility. Shatavari, the Ayurvedic female herb, balances the hormones. Muira Puama, Curculigo, Sarsaparilla, and False Unicorn bring warmth to the kidneys and circulate the blood and qi. Motherwort circulates the uterine qi and calms the spirit. Cinnamon twig is warming and opens the channels.', 'external');
INSERT INTO products VALUES (156, 'Heart Soulful Life', 'Heart Rebuilder', 2, 'Ingredients  &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Oats			      Avena Sativa

Tang Kuei		      Dang Gui

Salvia			      Dan Shen

Hawthorn berry	      Crataegus Spp.

Arjuna			      Terminalia Arjuna

Motherwort		      Leonurus Cardiaca

Zizyphus		      Suan Zao Ren

Polygala			      Yuan Zhi

Ginseng, Siberian	      Ci Wu Jia

Hoelen			      Fu Shen

Mistletoe		      Viscum Album

Ophiopogon		      Mai Men Dong

Dragon bone		      Long Gu

Chamomile, Roman   Anthemis Nobilis

Licorice			      Gan Cao', 'Western Therapeutic Actions

Cardiac tonic, nerve restorative, nervine, and nutritive tonic', 'Traditional Chinese Medicine

Supplements the heart qi, nourishes the heart blood, calms the spirit, nourishes the yin, and vitalizes the blood', 'Sample Indications

Psychological

Lack of joy in life, lacks clarity, anxiety, inappropriate crying or laughing, forgetfulness, apprehension, easily frightened, and obsessive-compulsive disorders

	Physical

Palpitations, weakened heart, insomnia, restless sleep, and wake-up early', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

There are none known. Consult a qualified health care practitioner for any extreme emotional disorders.', 'Notations 

Heart Soulful Life is patterned after a Chinese patent formula, Ding Zhi Wan or Settle the Emotion Pill and is supported by Western specifics. Psychological patterns and spiritual awareness plays a very important role in our well being. Because of their complexities and unique expressions, it is important to understand the many different elements &leftpar;such as fire, water, stagnation, wind, phlegm, excess or deficiency&rightpar; that can be contributing factors and treat them appropriately. The goal is to have harmony and balance with our emotions, in order for our wisdom and intelligence to be expressed here in this world. We have a natural yearning to be comfortable in our bodies.

From the Oneida tradition, our spirit, called the sacred fire, resides within the heart; Oriental Medicine says that the heart is the ruler and master of all the organs, and governs all of our actions. When we do not feed the sacred fire &leftpar;nurture our heart&rightpar;, we lose our passion and gratitude for life. When we allow the emotions to control our actions, the heart can become obstructed; we lose clarity, thinking is muddled, and the inner wisdom and intelligence becomes lost in some dark forest. 

The emotions; joy, worry, grief, fear, and anger, are passengers on the train of life. They come to us as experiences, coming and going as travelers. Whenever the heart longs to be nurtured back to health, address all of the emotions, and the organs and networks that they affect. This way the train can get back on track and head towards its destination - the journey towards the true self!', 'external');
INSERT INTO products VALUES (157, 'Kidney Long Life', 'Kidney Rebuilder', 28, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Rehmannia, prep.		Shu Di Huang

Ashwaganda			Withania Somnifera

Dioscorea			Shan Yao

Cornus				Shan Zhu Yu

Morinda				Ba Ji Tian

Eucommia			Du Zhong

Lycium fruit			Gou Qi Zi

Cuscuta				Tu Si Zi

Achyranthes			Niu Xi

Hoelen				Fu Ling

Motherwort			Leonurus Cardiaca

Deer Antler			Lu Rong

Chamomile, Roman	Anthemis Nobilis

Cinnamon bark		Rou Gui

Saussurea			Mu Xiang', 'Western Therapeutic Actions

Restorative tonic, nutritive tonic, cardiac tonic, and diuretic', 'Traditional Chinese Medicine

Fortifies the kidney yang, nourishes the kidney yin, and replenishes the essence', 'Sample Indications

Psychological

Lacks motivation or courage, dominated by fear, finds it difficult to stand up for oneself, and burnt out from burning the candle on both ends

	Physical

Weakness or soreness in the lower body, impotence, infertility, incontinence or difficult urination, water retention in the lower body, coolness in the lower body, and tires easily when standing', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

Contraindicated for cases with kidney yin deficiency &leftpar;dry mouth, red tongue, and hot palms and feet&rightpar;.', 'Notations

Kidney Long Life is patterned after the traditional Chinese formula, Jin Gui Shen Qi Wan or Rehmannia Eight Formula. The body has a seasonal clock just as we find in nature. In Oriental Medicine, there are the Five Seasons: Spring &leftpar;Liver&rightpar;, Summer &leftpar;Heart&rightpar;, Late Summer &leftpar;Spleen&rightpar;, Fall &leftpar;Lung&rightpar;, and Winter &leftpar;Kidney&rightpar;. Some say that Late Summer &leftpar;Spleen&rightpar; is not a season but resides in the center of this circular pattern of events.

One of the ways to optimize your health or practice preventative medicine, is to take an organ herbal tonic during the season you are currently in. Kidney Long Life can be used during the winter, as a tonic to nourish the kidneys. This formula warms and strengthens the lower part of the body and puts the desire and drive back into an empty cup.

Someone who burns the candle at both ends, will over-time, deplete the energy of their bodies, the kidneys, and their essence. The nervous system will become exhausted which can open the door for emotional problems. When spring arrives, if we did not allow ourselves to rest and replenish our qi, we might struggle and feel poorly instead of spading the spring garden! 

From the Sámi tradition, there is wisdom in the medicine of the Bear. Sleep in winter and when spring comes rolling around, get up and go find the honey! On a daily preventative level; slow it down, do not spend all that you have, and take a deep breath!', 'external');
INSERT INTO products VALUES (158, 'Liver New Life', 'Liver Rebuilder', 28, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by common and pin yin or latin names, in sequence from largest to smallest amount by quantity.

Rehmannia, prepared	Shu Di Huang

Rehmannia, raw        	Sheng Di Huang

Skullcap	                 	Scutellaria Lateriflora

Bladderwrack	         	Fucus Vesiculosus

Lycium fruit	         	Gou Qi Zi

Glehnia		         	Sha Shen

Ophiopogon	         	Mai Men Dong

Ligustrum	                 	Nu Zhen Zi

Eclipta		         	Han Lian Cao

Schizandra	         	Wu Wei Zi

Tang Kuei	                 	Dang Gui

Peony		         	Bai Shao Yao

Gardenia	                 	Zhi Zi

Moutan		         	Mu Dan Pi

Chamomile, Roman	        Anthemis Nobilis

Cyperus	                 	Xiang Fu

Damiana	                	        Turnera Diffusa

Rhubarb	                 	Da Huang

Wahoo		         	Euonymus Atropurpureus', 'Western Therapeutic Actions

Hepatic tonic, nervine, alterative, anti-fat, digestive tonic, and demulcent', 'Traditional Chinese Medicine

Nourishes the liver and kidney yin, disperses stagnant liver chi, clears heat, and cools the blood', 'Sample Indications

Psychological

Talks with a edge, irritable, anger, long-term frustration and stuck in a rut, bitter about life, and rigid

Physical

Discomfort or pain in the liver region &leftpar;hypochondrium&rightpar;, chest tightness or discomfort, chronic cirrhosis or hepatitis, fatty liver, wake-up between the hours of 1-3 AM, and elevated liver enzymes', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

Contraindicated for damp/phlegm disorders &leftpar;coughing with copious white mucous, and swollen tongue with white, thick coating&rightpar;.', 'Notations

Liver New Life, patterned after Yi Guan Jian, is an excellent tonic for patients who suffer from liver discomfort or ailments. When the liver suffers &leftpar;from viral infection, environmental contaminants, drug abuse, long term emotional distress, or poor nutritional habits&rightpar;, its natural ability to store the blood and move the chi becomes impaired. The liver also drains the chi, or moves the chi downward. When this function is weakened, then hypochondriac and chest pain is felt with belching or acid regurgitation. Heat, caused by trapped energy inside the liver, adversely affects the stomach and further injures the fluids in the body, creating a dry mouth and red tongue. Moutan and Gardenia were added to help drain some of the fire, cool the blood and emotionally, take the edge off of life. Liver/New Life moistens the dryness, enriches the blood, and relaxes the liver which enhances the normal movement and flow of chi.', 'external');
INSERT INTO products VALUES (159, 'Lung Flow of Life', 'Lung Rebuilder', 28, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Ginseng, American	Xi Yang Shen

Rehmannia, raw		Sheng Di Huang

Pseudostellaria		Tai Zi Shen

Elecampane			Inula Helenium

Ophiopogon			Mai Men Dong

Glehnia				Sha Shen

Platycodon			Jie Geng

Fritillaria			Chuan Bei Mu

Lungwort			Pulmonaria Officinalis

Lily					Bai He

Polygonatum, sib.	Huang Jing

Licorice				Gan Cao

Ginkgo				Ginkgo Biloba

Pleurisy root			Asclepias Tuberosa', 'Western Therapeutic Actions

Demulcent, restorative, expectorant, mucilaginous, pectoral, and astringent', 'Traditional Chinese Medicine

Moistens the lung, nourishes the lung yin, transforms phlegm, and stops coughing', 'Sample Indications

Psychological

Grief, suffering a loss, inability to grieve, holding on, withdrawn and burned out from giving

	Physical

Dry chronic cough, cough with scanty mucous, wheezing, lung damage, dry sore throat and mouth, chronic sore throat, and laryngitis', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

Contraindicated during the acute stages of any illness such as colds and influenzas &leftpar;external pathogenic influences&rightpar;. Use supportive herbs with patients who are spleen chi deficient &leftpar;weak appetite, bloating, loose stools&rightpar;.', 'Notations Lung Flow of Life is a modified version of a Chinese classic, Bai He Gu Jin Tang or Lily Combination. This formula addresses internal dryness of the stomach and lung characterized by the dry mouth and throat, hot feet and hands, tendency to constipation, night sweats, and thirst. In Oriental Medicine, a Sea of Qi accumulates in the chest. We breathe freely when our lungs maintain their moisture and are filled with vitality &leftpar;qi&rightpar;. There are many causes which can create this internal dryness of the lungs; environmental, febrile disease, smoking, deep emotional grief from loss or the inability to grieve &leftpar;holding on&rightpar;, always extending without replenishing, and chronic internal illness. 

The breath; rhythmic, with an inhale, a pause, and an exhale, serves as a model on how to live in life. Generous giving and extending a helpful hand is the breath out, the exhale. The pause, the still moment, is the transformation of the formless into form. The breath in, the inhale, is the humble expression of receiving. People who have a difficult time slowing down and taking some time off to smell the roses would benefit from this wonderful soothing and moistening tonic. If a patient is suffering from an acute respiratory infection, viral or bacterial, consider a formula in the Cleansing section. *Ginger compresses are helpful for lung disorders.

*Ginger Compress: See External Applications', 'external');
INSERT INTO products VALUES (160, 'Spleen Abundant Life', 'Spleen & Stomach Rebuilder', 28, 'Ingredients&leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Astragalus			  Huang Qi

Atractylodes			  Bai Zhu

Hoelen				  Fu Ling

Ginseng, Chinese		  Ji Lin Ren Shen

Bayberry				 Myrica Cerifera

Dioscorea			 Shan Yao

Lotus seed			 Lian Zi

Grindelia			 Grindelia Robusta

Coix				 Yi Yi Ren

Dolichos				 Bai Bian Dou

Platycodon			 Jie Geng

Citrus			        Chen Pi

Licorice, baked	        Zhi Gan Cao 

Ginger, dried		        Gan Jiang', 'Western Therapeutic Actions

Restorative, nutritive, tonic, and digestive stimulant', 'Traditional Chinese Medicine

Supplements the spleen qi, eliminates dampness, and breaks up stagnant qi in the middle burner', 'Sample Indications

Psychological

Life feels bland, pensive, ruminates over the many possibilities, worry wart, and spaced out

	Physical

Weak appetite and digestion, gastritis, peptic ulcer, tendency to loose stool or diarrhea, distention, nausea, weak muscles and limbs, exhaustion upon exertion, and craves sweets', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindictions and Cautions

Use with caution during pregnancy. This formula should not be used with high fever, heat with deficiency, thirst &leftpar;dryness&rightpar;, or constipation.', 'Notations

In the African medicine wheel of the Dagara tribe, the center represents Earth and the color is yellow. They teach that people who belong to the Earth Clan bring the gift of nurturing to this world. Likewise, in Oriental Medicine, they have the Five Phases, and some place the Earth element in its center; the color is yellow; represents the stomach, the sea of grain and water; and the spleen, which transforms the turbid into qi and blood. 

Whenever a patient is unable to care for themselves &leftpar;deficiency&rightpar;, or on the flip-side, is overly self concerned &leftpar;excess&rightpar;, the spleen and stomach require balancing. The Chinese formula, Liu Jun Zi Tang or Six Gentlemen Decoction, is the foundation for Spleen Abundant Life. The original formula is consistently used and modified. Shen Ling Bai Zhu San or Ginseng and Atractylodes Formula, is an example of the expansion of the original formula and is integrated into Spleen Abundant Life.

The dynamic laws of nature govern our internal natural world in a very poetic fashion. With the stomach and spleen energy network situated in the center of our being, we can see the importance of nutrition and to allow ourselves to be nurtured. Fire and water play an important role in the balancing of the Earth element. For example, if there is too much fire, the stomach will become scorched and the spleen too dry. Patients will hunger easily, or have dry lips and throat. If there is too much water, the spleen will get water logged and collapse. Patients will be phlegmatic, cold, with no desire to drink. Spleen Abundant Life creates a strong center and promotes vitality.', 'external');
INSERT INTO products VALUES (162, 'Enhance', 'Heals Internal Tissue', 28, 'Ingredients  &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Oats			Avena Sativa

Pseudoginseng	Tien Qi

Dipsacus		Xu Duan

Drynaria			Gu Sui Bu

Dragons Blood	Xue Jie

Carthamus		Hong Hua

Echinacea		Echinacea Angustifolia

Myrrh			Commiphora Molmol

Frankincense		Ru Xiang

Astragalus		Huang Qi

Tang Kuei		Dang Gui

Skullcap			Scutellaria Lateriflora

Burdock root		Arctium Lappa

Gentian			Gentiana Lutea

Goldenseal		Hydrastis Canadensis

Wild Yam		Dioscorea Villosa', 'Western Therapeutic Actions

Nerve tonic, alterative, antiseptic, stimulant, nutritive tonic, and antispasmodic', 'Traditional Chinese Medicine

Nurtures and vitalizes the blood, disperses blood stasis, supplements the qi, promotes the movement of qi, reduces swelling, alleviates pain and bleeding', 'Sample Indications

Surgery, wounds, broken bones, and traumatic injuries', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

Contraindicated during pregnancy and in cases presenting yin deficiency with heat.', 'Notations 

Enhance is a trauma formula that does not have to be restricted to only postoperative situations. Swelling and pain that accompanies traumatic injuries or surgery indicates blood stagnation. Hemorrhaging is the result of damaged and broken blood vessels which creates swelling, black and blue bruises, and pain. Enhance follows the principles of a Chinese formula, Qi Li San or Musk and Catechu Formula, which helps to restore the normal flow of qi, blood, and lymphatic fluids; and rejuvenates the vital body functions following a trauma or injury.

Oats, a premier restorative, helps circulate the qi and relieve cramps or spasms. Astragalus and Tang Kuei combine synergistically to provide excellent qi and blood restoration. Dragons Blood, combines well with Myrrh and Frankincense, and helps to break up blood stasis and alleviate pain. Carthamus is also a blood vitalizer and is used to alleviate pain from wounds. Pseudoginseng arrests any hemorrhaging without causing any further blood stagnation. This herb is used alone for internal injuries because of its remarkable ability to arrest bleeding without causing blood stagnation. Goldenseal helps to prevent any infections. Burdock root, a blood purifier, helps to prevent any infection and assists in the healing process. Skullcap and Wild Yam are antispasmodics, which assist the muscles from tightening up following a trauma.

There are two excellent formulas that complement Enhance:

Comfort Remedy 

	relieves inflammation and pain of the nerves and tissues following a trauma or injury. 

Radiance Remedy 

	promotes emotional balance and facilitates moving through transitions with ease.', 'external');
INSERT INTO products VALUES (164, 'Radiance Remedy', 'Trauma, Fear, Transitions', 4, 'Ingredients &leftpar;Flower Essences&rightpar;

Star of Bethlehem

Walnut

Impatiens

Mimulus

Mustard', 'Western Therapeutic Actions

Promotes emotional balance and facilitates moving from one circumstance or situation into the next with more ease', '', 'Sample Indications

Personal transitions are being encountered with fear, depression, or impatience', 'Suggested Dosage

5 drops, directly onto the tongue, 3 times daily, or more frequently if needed

Radiance Remedy can be repeated every 30 minutes during times of stress.

Variation is according to individual symptoms', 'Contraindications and Cautions

Contact a licensed psychiatrist if extreme emotional conditions persist.', 'Notations

Radiance Remedy can be enhanced by using herbal formulas. In Oriental Medicine, the internal organs that support transitions are the spleen and stomach. When they are supplemented and strengthened, the digestive system is enhanced. This enhancement allows the individual to move from one circumstance and into another with greater ease. Oatmeal, a wonder food, brings nourishment to the nervous system and is an excellent spleen tonic.

                                                                  Flower Essences

                                                                       Key words

Star of Bethlehem

	Shock or trauma, mental or physical

Walnut

	Oversensitive to ideas and influences, the link-breaker

Impatiens

	Impatience, irritable, extreme mental tension

Mimulus

	Fear or anxiety of a known origin

Mustard

	Deep black depression, melancholy, gloom', 'external');
INSERT INTO products VALUES (165, 'Silk Pond Cream', 'Skin Scarring', 15, 'Ingredients &leftpar;Herbal Extracts&rightpar;

Listed by common and pin yin or latin names, in sequence from largest to smallest amount by quantity.

Comfrey root		Symphytum Officinale

Comfrey leaf		Symphytum Officinale

Plantain	         	Plantago Spp.

Calendula	         	Calendula Officinalis

Goldenseal		Hydrastis Canadensis

Tang Kuei	         	Dang Gui

Angelica dah.		Bai Zhi

Vitamin E oil

Beeswax

Olive oil', 'Western Therapeutic Action

Vulnerary, anti-inflammatory, antiseptic, and analgesic', 'Traditional Chinese Medicine

Cools the blood, creates new tissue, and invigorates the blood', 'Sample Indications

Traumatized skin tissue, scars, abrasions, burns, cuts, and post-surgery', 'External Application

Massage a small amount of cream onto the affected skin area, or apply onto a sterile gauze and tape to area. 

3 times daily

All wounds should be well cleansed before applying any salve. Burns and sun burn should be cooled with co', 'Contraindications and Cautions

Care needs to be taken that the wound is not infected or septic &leftpar;filled with pus&rightpar; as Silk Pond Cream acts rapidly in closing wounds. If the gauze sticks to the wound, moisten with warm water before trying to remove.', 'Notations

Silk Pond promotes regeneration of the damaged tissues and associated blood vessels and helps minimize scarring. Use with a complementary internal herbal remedy to faciiitate the healing process. Comfrey is recognized as the premier herb for promoting the healing of tissue, bones, and ligaments. Applying comfrey to a wound will leave the affected area scarless. Plantain is used for all topically tissue traumas. It not only supports the healing of tissues but serve as an antiseptic &leftpar;clears toxic heat&rightpar;. Calendula, also known as Marigold flower, is an excellent skin detoxicant and heals traumatized tissues and burns. Internally, it acts much the same as the Chinese Lonicera &leftpar;Jin Yin Hua&rightpar; and Forsythia &leftpar;Lian Qiao&rightpar;.', 'external');
INSERT INTO products VALUES (166, 'Alisma Waterflow', 'Diuretic Edema', 28, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Alisma			Ze Xie

Marshmallow		Althea Officinalis

Hoelen			Fu Ling

Polyporous		Zhu Ling

Atractylodes		Bai Zhu

Siler				Fang Feng

Astragalus		Huang Qi

Cinnamon twig  	Gui Zhi

Morus bark		Sang Bai Pi

Achyranthes		Niu Xi

Horsetail		Equisetum Arvense

Corn Silk		Yu Mi Xu

Juniper berry		Juniperus Communis

Goldenrod		Solidago Virgaurea

Cleavers			Galium Aparine', 'Western Therapeutic Actions

Diuretic, antiseptic, emollient, demulcent, relieves edema, and 

restorative', 'Traditional Chinese Medicine

Promotes urination, drains dampness, dispels wind/damp, warms the yang, and supports the spleen', 'Sample Indications

Fluid retention in the body tissues &leftpar;lower body&rightpar;, renal suppression, cystic catarrh, renal congestion and obstruction, enuresis, and the inability to urinate freely', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

Contraindicated during pregnancy. For patients with spleen qi deficiency &leftpar;weak appetite, loose stool&rightpar;, this herbal formula should be used at a low dosage and for a shorter duration, or combine with supportive herbs.', 'Notations 

Alisma Waterflow is similar to Wu Ling San or Hoelen Five Formula, a Chinese diuretic and renal formula; Alisma Waterflow addresses edema, urinary difficulty and painful urinary dysfunction due to dampness &leftpar;spleen qi deficient&rightpar; and depleted kidney fire. Alisma Waterflow is a restorative to the urinary system, aids in the removal of catabolic wastes from the tissues, and helps in elimination via the renal system. It is effective for lower body edema. 

Alisma, Hoelen, and Polyporous have a synergistic affect and are the primary herbs for resolving edema and urinary difficulties. Cinnamon twig warms the kidneys and assists the bladder in draining the excess fluids. Atractylodes, Siler, and Astragalus have been added to nourish and protect the qi and the spleen from the draining aspect of the other herbs in this formula. Marshmallow root clears damp/heat, relieves irritation, and soothes the urinary tract. Achyranthes drains damp/heat and directs the energy downward. Morus bark, Horsetail, Corn Silk, and Juniper berry are natural diuretics and promote urination.

Dietary habits may be contributing to the cause of fluid retention. Excessive salt, sugars, sodas, and alcohol may add to the problem. Watermelon, shiitake mushrooms, and azuki beans are a excellent addition to the diet because they are excellent kidney tonics and natural diuretics. A hot *Ginger Compress applied to the kidney area is very beneficial in relaxing the kidney area and promoting the flow of fluids.

*Ginger Compress: See External Applications', 'external');
INSERT INTO products VALUES (167, 'Blue Stone', 'Kidney Stones', 28, 'Ingredients Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Marshmallow		Althea Officinalis

Lysimachia		Jin Qian Cao

Lygodium spore	Hai Jin Sha

Gallus			Ji Nei Jin

Pyrrosia			Shi Wei

Dianthus		Qu Mai

Skullcap			Scutellaria Lateriflora

Abutilon			Dong Kui Zi

Achyranthes		Niu Xi

Parsley Piert		Alchemilla Arvensis

Meadowsweet	Filipendula Ulmaria

Uva Ursi			Arctostaphylos Uva Ursi

Corn Silk		Yu Mi Xu

Stone Root		Collinsonia Canadensis

Hydrangea		Hydrangea Arborescens

Valerian			Valeriana Officinalis', 'Western Therapeutic Actions

Demulcent, emollient, diuretic, nervine, anodyne, antispasmodic, and antilithic', 'Traditional Chinese Medicine

Clears damp/heat in the lower burner, promotes urination, and unblocks painful urinary dysfunction', 'Sample Indications

Kidney stones and gravel &leftpar;urinary tract calculi located in the kidney, bladder or ureter&rightpar;; urgent, burning, and painful urination, low back or flank pain, and pain in the kidney area', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

Contraindicated during pregnancy. Advise the patient to avoid caffeine, alcohol, and hot spicy foods during renal dysfunction.', 'Notations 

Blue Stone gradually excoriates and dissolves the calculi, so they may be passed in the urine. It also acts as a prophylactic therapy to prevent the formation of new stones. The leading Chinese herbs used in this formula are based on a formula called San Jin Tang or Three Gold Decoction, and the supportive herbs help to facilitate the removal of the stones in as comfortable a manner as possible. 

Parsley Piert, a Western herb, assists in the dissolving of the calculi and is an anodyne. Marshmallow root is a sweet demulcent, which means it moistens and relieves dryness making it an ideal herb for treating stones by soothing the membranes of the kidney ducts and the urethra. Lysimachia, Lygodium spore, and Gallus work synergistically to resolve all types of stone formations. Pyrrosia and Dianthus are beneficial herbs for renal disorders as they help to clear damp/heat from the urinary system while promoting urination. The Western herbs, Parsley Piert, Stone Root and Hydrangea, combine well with the above Chinese herbs in resolving kidney stones or gravel. Meadowsweet balances the pH of the body, assists in the dissolving the obstruction, relieves pain, and clears toxins. Abutilon, Uva Ursi, Corn Silk, and Horsetail unblock painful urinary channels and promote urination. Skullcap and Valerian are relaxants and antispasmodics. Achyranthes drains damp/heat and direct the actions of the other herbs downward.

A *Ginger Compress, applied to the kidney area two times daily, enhances the circulation, eases the pain and discomfort, and stimulates the flow of urine.', 'external');
INSERT INTO products VALUES (168, 'Clear Waterflow', 'Bladder Infection', 28, 'Ingredients&leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Marshmallow			Althea Officinalis

Dianthus			Qu Mai

Polygonum			Bian Xu

Plantago seed		Che Qian Zi

Lygodium spore		Hai Jin Sha

Echinacea			Echinacea Angustifolia

Achyranthes			Niu Xi

Corn Silk 			Yu Mi Xu

Uva Ursi				Arctostaphylos Uva Ursi

Polyporous			Zhu Ling

Juncus				Deng Xin Cao

Meadowsweet		Filipendula Ulmaria

Mistletoe			Viscum Album

Gardenia			Zhi Zi

Buchu				Barosma Betulina', 'Western Therapeutic Actions

Diuretic, antiseptic, demulcent, emollient, alterative, and 

relaxant', 'Traditional Chinese Medicine

Clears heat from the lower burner, relieves toxicity, drains dampness, and unblocks painful urinary dysfunction', 'Sample Indications

Urinary tract infections, irritable bladder, painful or difficult urination, cystitis, kidney infection, prostatitis, pelvic inflammatory disease &leftpar;PID&rightpar;, and renal obstructions &leftpar;kidney and bladder gravel or stones&rightpar;', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

Contraindicated during pregnancy. Use with caution in patients who are yin deficient &leftpar;thirst, dryness, afternoon fever, hot palms and feet, night sweats&rightpar;.', 'Notations 

Clearwater Flow is designed to gently stimulate renal excretions, disinfect the urinary tract, and soothe irritated urinary membranes. Clear Waterflow combines ancient Western renowned herbs with the Chinese classic, Ba Zheng San or Dianthus Formula in correcting this imbalance. 

Marshmallow, the leading herb in this formula, is a demulcent, rich in mucilage and cool in nature. It is used whenever the internal tissues require soothing and moistening. This sweet demulcent reduces inflammation and clear damp/heat syndromes from the bladder. Lygodium spore and Achyranthes  combine well together in draining damp/heat and removing obstructions from the urinary tract. Dianthus, Polygonum, Plantago seed, Uva Ursi, and Corn Silk promote urination and are used for all types of painful urinary dysfunction. Meadowsweet is an analgesic, rich in salicylic acid, commonly known as aspirin. Mistletoe is a nervine and antispasmodic. Gardenia clears heat and calms the spirit. Buchu is anti-inflammatory and a kidney and bladder tonic. Juncus clears heat and promotes urination.

Food as Medicine:

Soak 1/2 cup of barley in a quart of water overnight. Drink 1/2 cup of barley water 3 times a day. Azuki beans &leftpar;small red Japanese bean&rightpar; are an excellent dietary supplement for the kidneys and bladder. Mix 1/2 cup of azuki beans with 2 cups of rice. Add a pinch of salt and cook until the beans are tender. Eat a small bowl of beans and rice for dinner until the symptoms are alleviated or mix the beans and broth with some miso. 

Beware: Being chronically pissed off can inflame the bladder!', 'external');
INSERT INTO products VALUES (170, 'Hopeful Remedy', 'Depression', 4, 'Ingredients &leftpar;Flower Essences&rightpar;

Clematis

Gorse

Mimulus

Mustard

Star of Bethlehem', 'Western Therapeutic Actions

Helps to heal an emotional state of hopelessness, and when the reason for trying further is considered futile', '', 'Sample Indications

Negative emotions causing a sense of hopelessness, fear, depression, and inability to see a clear future', 'Suggested Dosage

5 drops, directly onto the tongue, 3 times daily, or more frequently if needed

Hopeful Remedy can be repeated every 30 minutes during times of stress.

Variation is according to individual symptoms', 'Contraindications and Cautions

Contact a licensed psychiatrist if extreme emotional conditions persist.', 'Notations

Life reflects back to us our present state of awareness, nothing more and nothing less. Hope lives in the present moment. If we continually identify with the past, depression takes over. If we continually think about the future, anxiety and worry takes over. What a hopeless scenario. Enough of this nonsense. By practicing presence, hope will naturally flow out of you as a gift you give to others. It will come in small things. Maybe opening a door for someone, maybe a smile at the check out counter. Maybe a loaf of bread to that hungry beggar you see on the corner every morning. Hope is not something you receive, it is something you give away.

                                                        Flower Essences

                                                              Key words

Clematis

	Indifferent, dreaminess, lack of attention, unconscious

Gorse

	Hopeless, despair

Mimulus

	Fear of anxiety of a known origin

Mustard

	Deep, black depression; melancholy, gloom

Star of Bethlehem

	Shock or trauma, mental or physical', 'external');
INSERT INTO products VALUES (180, 'Bruise Cream', NULL, 15, 'Ingredients &leftpar;Herbal Extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Comfrey root		Symphytum Officinale 

Comfrey leaf		Symphytum Officinale

Dragons Blood		Xue Jie

Myrrh			Mo Yao

Frankincense		Ru Xiang

Carthamus		Hong Hua

Calendula 		Calendula Officinalis 

Beeswax

Olive oil', 'Western Therapeutic Actions

Vulnerary, anti-inflammatory, analgesic, demulcent, astringent, antiseptic, and anodyne', 'Traditional Chinese Medicine

Disperses blood stasis, promotes the movement of chi, and alleviates pain', 'Sample Indications

Injuries, bruises, sprains, contusions, strains, hematomas, and inflammations', 'External Application

Massage a small amount of cream onto the affected skin area, or apply onto sterile gauze and tape to area, 3 times daily', 'Contraindications and Cautions

There are none known. Discontinue use if skin irritation appears.', 'Notations

Bruise Cream stimulates the regeneration of damaged tissues and their blood vessels, reduces swelling, and speeds up the recovery from injuries or wounds. 

Comfrey promotes tissue, bone, and tendon repair. All tissue trauma will benefit from this herb. Dragons Blood stimulates blood circulation, generates flesh, reduces swelling, and stops bleeding. Myrrh and Frankincense invigorate the blood, reduce swelling, and alleviate pain, especially useful for traumatic pain. Carthamus vitalizes the blood and alleviates pain caused by wounds.

If bruises or black and blue spots occur for no apparent reason, it may be an indication of a deeper imbalance; seek the cause, it may be as simple as adding more vitamin C to your diet or supporting the chi of the spleen.', 'external');
INSERT INTO products VALUES (181, 'Earache Drops', NULL, 10, 'Ingredients &leftpar;Herbal oils and extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Mullein Oil		Verbascum Thapsus

Camphor	         	Cinnamonum Camphor

Wormseed Oil		Chenopodium Ambrosiodes

Wintergreen Oil		Gaultheria Promcumbens

Basil Oil	         	Ocimum Basilicum

Spearmint Oil		Mentha Spicata

Leptotaenia Oil		Lomatium Dissecutim

Echinacea	         	Echinacea Angustifolia

Gentiana	         	Long Dan Cao

Goldenseal		Hydrastis Canadensis

Scute			Huang Qin

Gardenia	         	Zhi Zi

St. Johns Wort		Hypericum Perforatum

Pulsatilla	         	Bai Tou Weng

Asafoetida		Ferula Asafoetida

Aloe Vera			Lu Hui', 'Western Therapeutic Actions

Anti-inflammatory, antipruritic, analgesic, anti-bacterial, anti-fungal, antiseptic, alterative, depurative, and emollient', 'Traditional Chinese Medicine

Clears toxic heat and resolves dampness', 'Sample Indications

Ear infections, ear congestion, ear inflammation, and otitis 

media', 'External Application

Massage a small amount of oil around the external ear, 3 times daily

Place a few drops of oil onto a sterile cotton ball and place in the ear, 2 times daily', 'Contraindications and Cautions

For external use only. Ear pain might indicate a serious infection and could result in damaging the ear membrane or ear drum. If the condition persists, seek professional advise.', 'Notations

Earache Drops loosens and clears wax build-up from the ear. The remedy is gently absorbed through the tissues of the ear. In cases of ear pain and infections, it is important to protect the ears, head, and neck from draughts and wind. 

Mullein flower, the lead herb in this remedy, excels in the treatment of earaches with its astringent and pectoral qualities. In the summer, collect the yellow flowers just as they begin to open, or you can use the whole spike. Cover them immediately with olive oil and in three months you will have one of the best ear oils available. 

Remember to put down a small offering to the plant medicine before harvesting. Women, during their monthly cycle &leftpar;menstruating&rightpar;, should not do any harvesting because their energy is so powerful it will overtake the plants medicine. 

The Mullein leaf is preferred when treating respiratory complaints.

Breast-feeding is the best way to support the baby''s immune system. If the baby is drinking cow milk, this might cause an excess of mucous and congestion in the ear canals. Organic cows milk has shown to be less mucous producing. Check to make sure the baby is not allergic to dairy products. Use soy or rice substitutes.

A *Tofu Plaster placed on the forehead of the baby is an excellent home remedy for lowering fevers.

*Tofu Plaster: See External Applications', 'external');
INSERT INTO products VALUES (182, 'GI Burn', NULL, 29, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Coptis			Huang Lian

Meadowsweet	Filipendula Ulmaria

Evodia			Wu Zhu Yu

Marshmallow		Althea Officinalis

Peony			Bai Shao Yao

Scute			Huang Qin

Pueraria			Ge Gen

Cuttlebone		Hai Piao Xiao

Asafoetida		Ferula Asafoetida', 'Western Therapeutic Actions

Demulcent, cooling digestive, emollient, antispasmodic, anti-nauseant, antacid, aromatic, and astringent', 'Traditional Chinese Medicine

Clears liver heat, drains fire, redirects rebellious qi downwards, and stops vomiting', 'Sample Indications

Acid reflux, heart burn, esophageal reflux, gnawing hunger, acid regurgitation, vomiting, belching, bitter taste in the mouth, and peptic ulcers', 'Suggested Dosage

10 - 30 drops, in a small amount of water, 

3 times daily

Take this formula after each meal for digestive support. Discontinue use once the digestive system has returned to normal.

Variation is according to individual symptoms', 'Contraindications and Cautions

Contraindicated in cases with acid regurgitation from stomach cold with deficiency &leftpar;weak appetite, stomach likes warm objects placed on it, like a hot water bottle&rightpar;.', 'Notations

This simple formula is very effective and quick acting, perfect for those who love that hot spicy food but do not have the stomach for it! GI Burn is patterned after the Chinese formula, Zuo Jin Wan, or Left Metal Pill.

In Oriental Medicine, the tongue, in cases of excess heat, will be red with a yellow coating, and the pulse will be wiry and rapid. When the liver creates excess heat, the heat invades the stomach and moves upwards, into the heart. The stomach, unable to handle all this heat &leftpar;too much heat in the kitchen&rightpar; turns the excess fire into a rebellion, or rebellious qi &leftpar;acid reflux, heartburn&rightpar;. The normal flow of the energy of the stomach is downward, but during a rebellion it goes in the opposite direction, and blows the roof off of the kitchen. 

Coptis is known for its ability to drain excess heat or fire, stabilizes the function of the stomach and calms the heart. The Oriental Five Phases Theory is applied in this formula. It states that in cases of excess, then drain the child. Coptis drains the excess heat from the heart, it being the child of the liver according to the Five Phases Theory. Evodia helps to redirect the rebellious qi downwards and direct the fire downwards. These two herbs work wonderfully together in dealing with heart burn. Meadowsweet, Cuttlebone, and Pueraria balance the pH of the body and alleviate acid conditions. Marshmallow is a soothing demulcent and alleviates inflammation of the digestive membranes. Peony is cooling and softens the liver. Scute supports Coptis and clears liver heat. Asafoetida is an Ayurvedic herb that is excellent for hiatal hernia and acid reflux while promoting a healthy digestive system.', 'internal');
INSERT INTO products VALUES (183, 'Herpe X', NULL, 28, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Rehmannia, raw		Sheng Di Huang

Scute				Huang Qin

Plantago seed		Che Qian Zi

Coptis				Huang Lian

Sarsaparilla			Smilax Officinalis

Echinacea			Echinacea Angustifolia

Gentiana, scabra		Long Dan Cao

Phellodendron		Huang Bai 

Tang Kuei			Dang Gui

Poke Root			Phytolacca Spp.

Coix				Yi Yi Ren

Gardenia			Zhi Zi

Licorice				Gan Cao

St. Johns Wort		Hypericum Perforatum

Cardamon			Sha Ren', 'Western Therapeutic Actions

Antipyretic, anti-inflammatory, hepatic, analgesic, anti-viral, alterative, and depurative', 'Traditional Chinese Medicine

Drains excess fire from the liver and gallbladder, and drains damp/heat from the lower burner', 'Sample Indications

Herpes zoster, herpes simplex, pelvic inflammatory disease, acute glaucoma, corneal ulcers, conjunctivitis, intercostal neuralgia, migraine headaches, and leukorrhea', 'Suggested Dosage

1/2  1 teaspoon, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

Herpe X can injure the spleen. Short term use is recommended. Support the spleen qi with herbal formulas following the course of this treatment if necessary.', 'Notations 

Herpe X can treat a wide range of disorders, as can many of the liver formulas. It is important to distinguish between them. Herpe X addresses excess liver heat. According to Oriental Medicine, look for these indications: wiry, rapid, forceful pulse; red tongue &leftpar;with yellow coating&rightpar; or small red like dots on the side edges of the tongue; and dark urine or painful urination. These are all markers that will distinguish it from the other liver formulas. 

The eye is the sensory organ for the liver. When the liver is inflamed, it is revealed in the eyes. Long Dan Xie Gan Tang or Gentian Combination, the Chinese formula that creates the foundation for Herpe X, is used for inflammatory eye disorders. 

Gentiana, with its cold and bitter qualities, drains excess heat from the liver and gall bladder. Scute, Coptis, and Phellodendron clear heat and drain dampness in support of Gentiana. Plantago seed drains damp/heat, especially from the lower body. Sarsaparilla has the ability to clear toxicity and enhance the immune system. Echinacea is used for sores, boils, pus, and tissue trauma. Rehmannia clears heat and cools the blood. Poke root is a detoxicant for the lymphatic system. Coix drains damp/heat, clears heat, and expels pus. Gardenia cools the blood and drains damp/heat. Tang Kuei, Licorice, and Cardamon help to protect the body from the strong purging and heat clearing actions.

Herpe X can be taken at the higher dosage for a short duration of time, then reduced to the lower dosage. If the condition being treated is chronic, take a milder formula for an extended amount of time &leftpar;2-3 months&rightpar;, such as VBX.', 'internal');
INSERT INTO products VALUES (184, 'Happy Thoughts', NULL, 28, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Albizzia, bark	    He Huan Pi

Albizzia, flower	    He Huan Hua

Ophiopogon		    Mai Men Dong

Asparagus		    Tian Men Dong

Salvia			    Dan Shen

Polygala			    Yuan Shi

Hoelen			    Fu Shen

Oyster Shell		    Mu Li

Dragon Bone		    Long Gu

Anemarrhena	    Zhi Mu

Valerian			    Valeriana Officinalis

Motherwort		Leonurus Cardiaca

Curcuma		Yu Jin

Acorus			Shi Chang Pu', 'Western Therapeutic Actions

Sedative, nervine, demulcent, nutritive, and antispasmodic', 'Traditional Chinese Medicine

Sedates the heart, eliminates phlegm, nourishes the yin, and calms the spirit', 'Sample Indications

	Psychological

Chronic anxiety with worry, restlessness with irritability, manic/depressive, shouting and yelling at people, and explosive 

behavior

	Physical

Disturbed sleep, dry mouth, constant moving of the limbs, severe or throbbing headaches, and fidgety', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 

3 times daily

Variation is according to individual symptoms

ü', 'Contraindications and Cautions

Happy Thoughts is suited for a patient who has a red tongue with yellow coating &leftpar;excess&rightpar;. The pulse will tend to be rapid and wiry. Contraindicated in cases with a pale, swollen tongue and slow, faint pulse &leftpar;deficient&rightpar;. It is important to be able to distinguish between these two patterns.', 'Notations 

Happy Thoughts fits someone, who has over a period of time, kept their anxiety and worry to themselves. In Oriental Medicine, pent up emotions constrain the liver and deplete the qi of the spleen. With a weakened spleen, fluids transform into phlegm. Congealed phlegm eventually turns into heat. The excess liver erupts and releases the hot phlegm. As heat rises, the hot phlegm clogs the orifices of the heart. When the heart channels are not clear, the spirit is not at ease, and emotional instability takes place. 

Happy Thoughts resolves this conflict by clearing out the hot phlegm of the the heart channels, which calms the spirit. The elimination of phlegm, allows the spleen to transform the fluids more efficiently and prevent phlegm accumulation. Based on Sheng Tie Luo Yin or Iron Fillings Decoction, this formula will help the patient regain some composure and stability. 

This imbalance can reoccur if the patient does not take charge of their emotions and find the courage to be able to express themselves. Many times we will not want to share some deep feelings because we are not willing to bear the consequences that they might bring. As long as we maintain this attitude, it is difficult to experience our free flowing energy and be open to the all of life.

Happy Thoughts works well for patients who have difficulty tolerating herbal formulas that open or release the liver.ü', 'internal');
INSERT INTO products VALUES (185, 'HIV Support', NULL, 30, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Astragalus			Huang Qi

Oats				Avena Sativa

Ligustrum			Nu Zhen Zi 

Burdock root			Arctium Lappa

Saw Palmetto			Serenoa Serrulata

Skullcap				Scutellaria Lateriflora

Meadowsweet		Filipendula Ulmaria

Deer Antler			Lu Rong

Isatis leaf			Da Qing Ye

Kohe Kohe			Dysoxylum Spectabile

Sarsaparilla			Smilax Officinalis

Red Clover			Trifolium Pratense

Salvia				Dan Shen

Ginseng, Chinese		Ji Lin Ren Shen

Lycium fruit			Gou Qi Zi

Jaborandi			Pilocarpus Spp.

Poke root			Phytolacca Spp.

Goldenseal			Hydrastis Canadensis

Ginger, fresh			Sheng Jiang', 'Western Therapeutic Actions

Restorative, nutritive, alterative, depurative, anti-viral, astringent, and antiseptic', 'Traditional Chinese Medicine

Supplements the qi and replenishes the essence, vitalizes the blood, and clears heat, and relieves toxicity', 'Sample Indications

HIV &leftpar;human immunodeficiency virus&rightpar;, ARC &leftpar;AIDS related complex&rightpar;, AIDS &leftpar;acquired immune deficiency syndrome&rightpar;, and autoimmune disorders', 'Suggested Dosage

1  2 teaspoons, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

Address the individual imbalances and use additional herbal formulas that are called for. Each individual shows unique strengths and weaknesses and may require custom made formulations. The dosages may have to be increased depending on the degree of deficiency or excess.', 'Notations 

HIV Support is designed similarly to the C Clear formula. It follows the Chinese medical herbal strategy developed during the 1960s, called Fu Zheng Pei Ben, "support the normal and strengthen the root". The concept of support the normal means to rectify any depletion of the bodys energy, fluids, and blood. Strengthen the root means to restore, augment, and nourish the yin and yang, and includes the essence. Using herbs that strengthen the root augment the immune system.

Subhuti Dharmananda and Reece Smith were two of the first Western trained Chinese herbalists that addressed this disorder using herbs. Subhuti Dharmananda, through his company, Seven Forests, has developed many brilliant Chinese herbal formulas that address the imbalances found in patients who have acquired the syndrome called AIDS. Once this disorder was discovered to be transmitted by a virus, herbal formulations emerged to deal with the deeper complexity of this imbalance.

AIDS is much like a febrile disease accompanied by an extreme depletion of the body. HIV SUPPORT is a restorative to the immune system, purifies the blood, and invigorates the circulation. Resolving stagnation is important because this allows for deeper cleansing actions. Additional yin and yang tonics may be required to accompany HIV SUPPORT. Modern drugs, such as AZT, are toxic, very debilitating to the immune system, and disrupt the normal functioning of the body. This makes herbal formulas critical to support the normal and strengthen the root.', 'internal');
INSERT INTO products VALUES (186, 'Little Belly', NULL, 28, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Raspberry leaf		Rubus Idaeus

Codonopsis			Dang Shen

Motherwort			Leonurus Cardiaca

Nettles				Urtica Spp.

Chamomile, Roman	Anthemis Nobilis

Ginger, dried		        Gan Jiang

Citrus			        Chen Pi

Black Haw		        Viburnum Prunifolium

Gentian			        Gentiana Lutea

Agastache		        Huo Xiang

Cardamon		        Sha Ren', 'Western Therapeutic Actions

Nervine, nutritive tonic, astringent, restorative, and antispasmodic', 'Traditional Chinese Medicine

Warms the stomach and middle burner, directs rebellious stomach qi downwards, and stops vomiting', 'Sample Indications

Morning sickness, nausea or vomiting during early pregnancy, 

a mild acting tonic with nutritive qualities specifically for the first trimester of pregnancy', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 

3 times daily. 

Take during the first and second trimester of pregnancy

Variation is according to individual symptoms', 'Contraindications and Cautions

Bleeding and spotting during pregnancy can be life threatening. If any health problems persist, seek the advice of a qualified health care practitioner.', 'Notations 

Little Belly is made upon request, to limit alcohol content. This formula is a mild tonic supporting the first trimester of a pregnancy. 

The combination of Pinellia, Codonopsis, Ginger, and Citrus warm the stomach, resolve dampness, and alleviate morning sickness. Raspberry leaf is an astringent and uterine and reproductive restorative. It is one of the few botanicals that can be used during the entire length of a pregnancy. The two herbs, Raspberry leaf and Black Haw, work together to help prevent miscarriages. Motherwort is an anti-spasmodic and nervine. It has a calming effect on the spirit, similar to Roman Chamomile. Nettles is a blood tonic and supports the nutritive Chinese herbs in this formula. Codonopsis strengthens the spleen and along with Ginger and Citrus help to alleviate nausea and calm the stomach. Cardamon and Agastache harmonize the middle burner and alleviate nausea and vomiting. Gentian is a bitter tonic and supports the blood and help to alleviate fatigue.', 'internal');
INSERT INTO products VALUES (189, 'Pure Vision', NULL, 28, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Bilberry				Vaccinium Myrtillus

Lycium fruit			Gou Qi Zi 

Chrysanthemum		Ju Hua

Buddleia				Mi Meng Hua

Rehmannia, prep.		Shu Di Huang

Cornus				Shan Zhu Yu 

Dioscorea			Shan Yao

Tribulus				Bai Ji Li

Haliotis				Shi Jue Ming

Tang Kuei			Dang Gui

Eyebright			Euphrasia Officinalis

Vitex				Man Jing Zi

Cuscuta				Tu Si Zi

Cassia Seed			Jue Ming Zi', 'Western Therapeutic Actions

Demulcent, restorative, hepatic and renal nutritive, hemogenic, alterative, and emollient', 'Traditional Chinese Medicine

Dispels wind/heat, nourishes the liver and kidney yin, nourishes the blood, and anchors the yang', 'Sample Indications 

Poor vision due to aging, reduced vision acuity, blurred vision, corneal ulcers, glaucoma, myopia, night blindness, and cataracts', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

Avoid eating turnips when taking this formula.', 'Notations 

This Oriental Medicine approach for the treatment of eye disorders involves replenishment of a yin deficiency. Pure Vision will cool, moisten, and soothe the body, calm or relax a restless person, and promote the healing of the eyes, the skin, and other organs. The yin is considered to affect the soft muscles and tissues. The aging process naturally depletes the yin of the body. Pure Vision is a modified version of the ancient Chinese classic formula, Liu Wei Di Huang or Rehmannia Six Formula and a subsequent formula, called Ming Mu Di Huang or Rehmannia Tea. 

Due to the aging process, or when the heat from an imbalanced liver rises and dries the upper part of the body, especially the eyes, moistening formulas help rectify the imbalance. Chrysanthemum, Lycium fruit, Eyebright, and Cassia seed soothe the liver, improve the vision, and brighten the eyes. Bilberry is an antioxidant and strengthens the capillaries surrounding the retina. Buddleia and Cuscuta combine well for restoring visual acuity. Rehmannia, Cornus, and Dioscorea, taken from the classic Chinese formula, Liu Wei Di Huang, nourish the kidney yin and the liver yin &leftpar;yin meaning moisture or fluids&rightpar;. Haliotis and Tribulus settle the raising yang &leftpar;fire&rightpar; which allows it to be more anchored in its rightful place, the kidneys. They also clear heat &leftpar;dryness and redness&rightpar; from the eyes, and are used to benefit the vision. Tang Kuei nourishes the blood. Vitex disperses wind/heat and clears the eyes. 

*Facial Diagnosis &leftpar;Oriental Medicine&rightpar;

Liver / Gallbladder		Eyes / Space between the eye brows

Heart / Small Intestine	Nose and Tongue

Spleen / Stomach			Mouth / Lips

Lungs / Large Intestine	Cheeks / Forehead

Kidneys / Bladder			Ears / Skin below the eye

*See page 20 for an overview of Facial Diagnosis', 'internal');
INSERT INTO products VALUES (192, 'Woman''s Douche', NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'external');
INSERT INTO products VALUES (193, 'Up Chuck', NULL, 29, 'Ingredients 

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Ipecacuanha		Cephaelis Ipecacuanha', 'Western Therapeutic Actions

Emetic &leftpar;when used in sufficient dosage&rightpar;, expectorant, and 

specific', '', 'Sample Indications 

Use only when there is a need to induce vomiting, or experiencing persistent nausea that is not relieved by vomiting, and sudden onset of asthma and cough with the inability to bring up any mucous', 'Suggested Dosage

1 teaspoon to induce vomiting

5 drops, 3 times daily for gasping cough and unable to bring up any mucous

Variation is according to individual symptoms', 'Contraindications and Cautions

This remedy is for emergency situations only. Seek medical advise for all types of ingested poisoning and asthmatic conditions. Contraindicated during pregnancy.', 'Notations 

To induce vomiting, it is necessary to use larger dosages of Up Chuck to be effective. Ipecacuanha or Ipecac &leftpar;Ipecac Root&rightpar; is helpful as an emetic and for persistent nausea that is not relieved by vomiting. There will be profuse clear salivation or vomiting of sticky white mucous. 

When used as an expectorant, the asthma or cough will come on suddenly and the chest will feel constricted as if someone was sitting on the chest. The need to sit up to breathe will be present and a violent gasping with every breath.', 'internal');
INSERT INTO products VALUES (194, 'Wrist Elbow Pain', NULL, 28, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Corydalis			Yan Hu Suo

Boswellia			Boswellia Serrata

Turmeric			Curcuma Longa

Pueraria				Ge Gen

Arisaema			Tian Nan Xing

Gastrodia			Tian Ma

Gentiana, macro.		Qin Jiao

Clematis				Wei Ling Xian

Chiang Huo			Qiang Huo

Pinellia				Ban Xia

Hoelen				Fu Ling

Cinnamon twig		Gui Zhi

Citrus				Chen Pi

Ginger, fresh			Sheng Jiang', 'Western Therapeutic Actions

Anodyne, anti-inflammatory, analgesic, nutritive, and antispasmodic', 'Traditional Chinese Medicine

Dispels wind/damp, transforms phlegm, dries dampness, unblocks the channels, alleviates pain, and supports the spleen', 'Sample Indications

Carpal tunnel syndrome, forearm neuralgia, bursitis, and lymphedema', 'Suggested Dosage

1/2 - 1 teaspoon, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

Contraindicated during pregnancy.', 'Notations 

Wrist Elbow Pain is a modified version of a Japanese formula developed by Dr. Otsuka Keisetsu called Er Zhu Tang, or Atractylodes and Arisaema Combination. According to Oriental Medicine, this formula addresses damp/phlegm accumulation in the energy channels. Phlegm obstructs the movement of qi. When the qi stagnates, circulation is impaired. This creates muscular tension and spasms which can inflame the nerves and cause other inflammatory conditions. The pain experienced is the result of the muscular tension squeezing the nerve. 

Corydalis is a strong anodyne and activates circulation. Boswellia, Chinese Frankincense, supports Corydalis. It a very useful Ayurvedic herb for all types of arthritis, bursitis, and other chronic inflammatory disorders. Turmeric, Chinese Jiang Huang, resolves congealed phlegm conditions, particularly in the shoulder region. Pueraria is an anti-inflammatory and helps muscles to soften and relax. Arisaema &leftpar;treated&rightpar; has strong phlegm resolving qualities. Gastrodia expels wind, alleviates pain, relieves spasms, and controls tremors. Gentiana, macro., Clematis, and Chiang Huo dispel wind/damp, alleviate obstructions and pain, particularly in the upper body. Pinellia combines with Hoelen, Citrus, and Ginger in resolving phlegm and strengthening the spleen. Cinnamon twig warms and opens the channels.

The computer and the pesky little mouse is one of the main culprits in this repetitive stress disorder. Technology has its place in our society but not to the point of disability. Egronomics, fitting the workplace for the worker, is something to consider if someone spends a lot of time at the computer.

See Muscular & Skeletal External Formulas for additional support', 'internal');
INSERT INTO products VALUES (208, 'Skin Boils', NULL, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'internal');
INSERT INTO products VALUES (211, 'Eve''s Delight', NULL, 28, 'Ingredients &leftpar;Herbal extracts&rightpar;

Listed by Common Name and with the Western herb in Latin or the Chinese herb in Pin Yin, and in sequence from largest to smallest amount by quantity.

Damiana				Turnera Diffusa

Marshmallow			Althea Officinalis

Muira Puama			Liriosma Ovata

Raspberry leaf		Rubus Idaeus

Morinda				Ba Ji Tian

Cistanche			Rou Cong Rong

Tang Kuei			Dang Gui 

Rehmannia, prep.		Shu Di Huang

Shatavari			Asparagus racemosa

Cornus				Shan Zhu Yu

False Unicorn		Chamaelirium Luteum

Dioscorea			Shan Yao

Licorice, baked		Zhi Gan Cao', 'Western Therapeutic Actions

Restorative, adaptogenic tonic, aphrodisiac, nerve tonic, demulcent, and emollient', 'Traditional Chinese Medicine

Nourishes the yin, nourishes the blood, fortifies the kidneys, supports the spleen, and directs the qi downward', 'Sample Indications

Sexual exhaustion, debility, lack of libido, and weak lower back', 'Suggested Dosage

1  2 teaspoons, in a small amount of water, 

3 times daily

Variation is according to individual symptoms', 'Contraindications and Cautions

Contraindicated during pregnancy. Discontinue the use of this formula during the menstrual cycle.', 'Notations 

In Oriental Medicine, as a woman ages, the water aspect of the kidney &leftpar;yin&rightpar; diminishes. With the loss of yin energy &leftpar;feminine&rightpar; in the kidney, the libido goes down the tank. Eves Delight reinforces the kidney yin and yang energy. The yang energy puts some fire back into the tank. Eves Delight also addresses the bodys exhaustion from an overactive sexual life. The Chinese herbs used here are patterned after an old classic, Zuo Gui Yin, or Restore the Left &leftpar;Kidney&rightpar; Decoction. The ancient Chinese classics considered the left kidney housing the True Yin and the right kidney housing the Gate of Vitality. Whenever herbs nourish and fortify the kidneys, the sexual functions and libido are enhanced. 

Damiana enhances the reproductive qi, fortifies the kidney yang, and has hormone-regulating qualities. It is an excellent nerve tonic and helps lift the spirits. Marshmallow enriches the kidney yin and helps generate fluids. Tang Kuei builds the blood and enhances circulation. Muira Puama is an aphrodisiac and with Rehmannia, strengthens the kidneys. Raspberry leaf is a premier uterine tonic. False Unicorn is a female reproductive restorative. Cistanche and Morinda are added to replenish the kidney yang and rekindle the fire. Cornus, a liver and kidney tonic, is used as a sexual stimulant and known to benefit the skin. Dioscorea and Licorice support the spleen qi. Shatavari is the premier female tonic in Ayurvedic medicine as it nourishes the hormones and the kidney yin. 

It is important to remember that the most frequent cause of lost libido is stress and a failing relationship. 

For those skeptics, oysters and shrimp are strong aphrodisiacs because of their ability to enrich the kidneys. Try some and see!', 'internal');


--
-- Name: products_local_productID_seq; Type: SEQUENCE SET; Schema: public; Owner: app
--

SELECT pg_catalog.setval('"products_local_productID_seq"', 211, true);


--
-- Data for Name: retail_size_price; Type: TABLE DATA; Schema: public; Owner: app
--

INSERT INTO retail_size_price VALUES (1, '2 oz', 8.9500);
INSERT INTO retail_size_price VALUES (8, '1 oz', 7.7500);
INSERT INTO retail_size_price VALUES (6, '1 oz', 7.7500);
INSERT INTO retail_size_price VALUES (3, '2.5 oz', 11.7500);
INSERT INTO retail_size_price VALUES (2, '1 oz', 10.7000);
INSERT INTO retail_size_price VALUES (4, '1 oz', 8.9500);
INSERT INTO retail_size_price VALUES (3, '.75 oz', 7.7500);
INSERT INTO retail_size_price VALUES (9, '2.5 oz', 11.7500);
INSERT INTO retail_size_price VALUES (2, '4 oz', 21.5000);
INSERT INTO retail_size_price VALUES (2, '8 oz', 41.3000);
INSERT INTO retail_size_price VALUES (5, '1 oz', 7.7500);
INSERT INTO retail_size_price VALUES (7, '1 oz', 7.7500);
INSERT INTO retail_size_price VALUES (10, '1 oz', 7.7500);
INSERT INTO retail_size_price VALUES (11, '1 oz', 7.7500);
INSERT INTO retail_size_price VALUES (12, '1 oz', 10.7000);
INSERT INTO retail_size_price VALUES (12, '4 oz', 21.5000);
INSERT INTO retail_size_price VALUES (13, '4 oz', 21.5000);
INSERT INTO retail_size_price VALUES (14, '8 oz', 11.9500);
INSERT INTO retail_size_price VALUES (15, '1 oz', 7.7500);
INSERT INTO retail_size_price VALUES (16, '1 oz', 7.7500);
INSERT INTO retail_size_price VALUES (17, '8 oz', 11.9500);
INSERT INTO retail_size_price VALUES (18, '4 oz', 10.7000);
INSERT INTO retail_size_price VALUES (19, '4 oz', 7.1000);
INSERT INTO retail_size_price VALUES (20, '12 oz', 10.7000);
INSERT INTO retail_size_price VALUES (21, '2 oz', 8.5500);
INSERT INTO retail_size_price VALUES (8, '8 oz', 11.7500);
INSERT INTO retail_size_price VALUES (27, '4 oz', 10.7500);
INSERT INTO retail_size_price VALUES (12, '8 oz', 41.3000);
INSERT INTO retail_size_price VALUES (9, '.75 oz', 7.7500);
INSERT INTO retail_size_price VALUES (28, '4 oz', 21.5000);
INSERT INTO retail_size_price VALUES (29, '1 oz', 10.7000);
INSERT INTO retail_size_price VALUES (30, '8 oz', 41.3000);
INSERT INTO retail_size_price VALUES (32, '2.5 oz', 11.7500);
INSERT INTO retail_size_price VALUES (31, '2.5 oz', 11.7500);
INSERT INTO retail_size_price VALUES (33, '.75 oz', 7.7500);
INSERT INTO retail_size_price VALUES (34, '.75 oz', 7.7500);
INSERT INTO retail_size_price VALUES (36, '4 oz', 10.7500);
INSERT INTO retail_size_price VALUES (35, '2 oz', 8.9500);
INSERT INTO retail_size_price VALUES (37, '1 oz', 7.7500);
INSERT INTO retail_size_price VALUES (38, '1 oz', 7.7500);
INSERT INTO retail_size_price VALUES (39, '2 oz', 8.9500);


--
-- Data for Name: sample_indications; Type: TABLE DATA; Schema: public; Owner: app
--

INSERT INTO sample_indications VALUES (1, 'Abrasions');
INSERT INTO sample_indications VALUES (2, 'Abscess');
INSERT INTO sample_indications VALUES (3, 'Accidents');
INSERT INTO sample_indications VALUES (4, 'Acidity');
INSERT INTO sample_indications VALUES (5, 'Acne');
INSERT INTO sample_indications VALUES (6, 'Addictions');
INSERT INTO sample_indications VALUES (7, 'Adrenal Glands');
INSERT INTO sample_indications VALUES (8, 'AIDS / HIV');
INSERT INTO sample_indications VALUES (9, 'Allergies');
INSERT INTO sample_indications VALUES (10, 'Alzheimers');
INSERT INTO sample_indications VALUES (11, 'Amenorrhea');
INSERT INTO sample_indications VALUES (12, 'Antiseptic');
INSERT INTO sample_indications VALUES (13, 'Anxiety');
INSERT INTO sample_indications VALUES (15, 'Arthritis');
INSERT INTO sample_indications VALUES (16, 'Asthma');
INSERT INTO sample_indications VALUES (17, 'Atherosclerosis');
INSERT INTO sample_indications VALUES (18, 'Athletes Foot');
INSERT INTO sample_indications VALUES (19, 'Athletic Training');
INSERT INTO sample_indications VALUES (20, 'Bed Sores');
INSERT INTO sample_indications VALUES (21, 'Biliousness');
INSERT INTO sample_indications VALUES (22, 'Bladder');
INSERT INTO sample_indications VALUES (23, 'Bleeding');
INSERT INTO sample_indications VALUES (24, 'Blood Conditions');
INSERT INTO sample_indications VALUES (25, 'Boils');
INSERT INTO sample_indications VALUES (26, 'Brain');
INSERT INTO sample_indications VALUES (27, 'Bronchitis');
INSERT INTO sample_indications VALUES (28, 'Bruises');
INSERT INTO sample_indications VALUES (29, 'Burns');
INSERT INTO sample_indications VALUES (30, 'Cancer');
INSERT INTO sample_indications VALUES (31, 'Candidiasis');
INSERT INTO sample_indications VALUES (32, 'Cardiovascular');
INSERT INTO sample_indications VALUES (33, 'Catarrh');
INSERT INTO sample_indications VALUES (34, 'Chapped Skin');
INSERT INTO sample_indications VALUES (35, 'Childbirth');
INSERT INTO sample_indications VALUES (36, 'Children');
INSERT INTO sample_indications VALUES (37, 'Circulation');
INSERT INTO sample_indications VALUES (38, 'Cold Feet');
INSERT INTO sample_indications VALUES (39, 'Colds');
INSERT INTO sample_indications VALUES (40, 'Colic');
INSERT INTO sample_indications VALUES (41, 'Colitis');
INSERT INTO sample_indications VALUES (42, 'Conjunctivitis');
INSERT INTO sample_indications VALUES (43, 'Constipation');
INSERT INTO sample_indications VALUES (44, 'Convulsions');
INSERT INTO sample_indications VALUES (45, 'Coughs');
INSERT INTO sample_indications VALUES (46, 'Cramps');
INSERT INTO sample_indications VALUES (47, 'Cuts');
INSERT INTO sample_indications VALUES (48, 'Cystitis');
INSERT INTO sample_indications VALUES (49, 'Dandruff');
INSERT INTO sample_indications VALUES (50, 'Delirium Trem');
INSERT INTO sample_indications VALUES (51, 'Depression');
INSERT INTO sample_indications VALUES (52, 'Dermatitis');
INSERT INTO sample_indications VALUES (53, 'Diarrhea');
INSERT INTO sample_indications VALUES (54, 'Diuretic');
INSERT INTO sample_indications VALUES (55, 'Drug Withdrawal');
INSERT INTO sample_indications VALUES (56, 'Dysmenorrhea');
INSERT INTO sample_indications VALUES (57, 'Dyspepsia');
INSERT INTO sample_indications VALUES (58, 'Ear  Wax');
INSERT INTO sample_indications VALUES (59, 'Ear Infection');
INSERT INTO sample_indications VALUES (60, 'Earache');
INSERT INTO sample_indications VALUES (61, 'Eczema');
INSERT INTO sample_indications VALUES (62, 'Edema');
INSERT INTO sample_indications VALUES (63, 'Emotional');
INSERT INTO sample_indications VALUES (64, 'Epilepsy');
INSERT INTO sample_indications VALUES (65, 'Epstein-Barr');
INSERT INTO sample_indications VALUES (66, 'Estrogen');
INSERT INTO sample_indications VALUES (67, 'Expectorant');
INSERT INTO sample_indications VALUES (68, 'Eyes');
INSERT INTO sample_indications VALUES (69, 'Fatigue');
INSERT INTO sample_indications VALUES (70, 'Fever');
INSERT INTO sample_indications VALUES (71, 'Fissure');
INSERT INTO sample_indications VALUES (72, 'Flatulence');
INSERT INTO sample_indications VALUES (73, 'Flu');
INSERT INTO sample_indications VALUES (74, 'Frostbite');
INSERT INTO sample_indications VALUES (75, 'Fungal');
INSERT INTO sample_indications VALUES (76, 'Gall bladder');
INSERT INTO sample_indications VALUES (77, 'Gastro-intestinal');
INSERT INTO sample_indications VALUES (78, 'Gingivitis');
INSERT INTO sample_indications VALUES (79, 'Glands');
INSERT INTO sample_indications VALUES (80, 'Gout');
INSERT INTO sample_indications VALUES (81, 'Grief');
INSERT INTO sample_indications VALUES (82, 'Hair');
INSERT INTO sample_indications VALUES (83, 'Hay fever');
INSERT INTO sample_indications VALUES (84, 'Headache');
INSERT INTO sample_indications VALUES (85, 'Heart');
INSERT INTO sample_indications VALUES (86, 'Hematoma');
INSERT INTO sample_indications VALUES (87, 'Hemorrhage');
INSERT INTO sample_indications VALUES (88, 'Hemorrhoids');
INSERT INTO sample_indications VALUES (89, 'Hepatitis');
INSERT INTO sample_indications VALUES (90, 'Herpes');
INSERT INTO sample_indications VALUES (91, 'Hot Flushes');
INSERT INTO sample_indications VALUES (92, 'Hyperglycemia');
INSERT INTO sample_indications VALUES (93, 'Hypertension');
INSERT INTO sample_indications VALUES (94, 'Hypoglycemia');
INSERT INTO sample_indications VALUES (95, 'Immune');
INSERT INTO sample_indications VALUES (96, 'Impotence');
INSERT INTO sample_indications VALUES (97, 'Incontinence');
INSERT INTO sample_indications VALUES (98, 'Infections');
INSERT INTO sample_indications VALUES (99, 'Infertility');
INSERT INTO sample_indications VALUES (100, 'Inflammation');
INSERT INTO sample_indications VALUES (101, 'Insect Bites');
INSERT INTO sample_indications VALUES (102, 'Insomnia');
INSERT INTO sample_indications VALUES (103, 'Itch');
INSERT INTO sample_indications VALUES (104, 'Jaundice');
INSERT INTO sample_indications VALUES (105, 'Kidney Stones');
INSERT INTO sample_indications VALUES (106, 'Kidneys');
INSERT INTO sample_indications VALUES (107, 'Laryngitis');
INSERT INTO sample_indications VALUES (108, 'Liver');
INSERT INTO sample_indications VALUES (109, 'Lupus');
INSERT INTO sample_indications VALUES (110, 'Lymph');
INSERT INTO sample_indications VALUES (111, 'Measles');
INSERT INTO sample_indications VALUES (112, 'Memory');
INSERT INTO sample_indications VALUES (113, 'Menopause');
INSERT INTO sample_indications VALUES (114, 'Menstrual');
INSERT INTO sample_indications VALUES (115, 'Mental Fatigue');
INSERT INTO sample_indications VALUES (116, 'Migraine');
INSERT INTO sample_indications VALUES (117, 'Miscarriage');
INSERT INTO sample_indications VALUES (118, 'Morning Sickness');
INSERT INTO sample_indications VALUES (119, 'Motion Sickness');
INSERT INTO sample_indications VALUES (120, 'Mucous Membranes');
INSERT INTO sample_indications VALUES (121, 'Mumps');
INSERT INTO sample_indications VALUES (122, 'Nausea');
INSERT INTO sample_indications VALUES (123, 'Nephritis');
INSERT INTO sample_indications VALUES (124, 'Nervous System');
INSERT INTO sample_indications VALUES (125, 'Pain');
INSERT INTO sample_indications VALUES (126, 'Phlebitis');
INSERT INTO sample_indications VALUES (127, 'Poison Oak');
INSERT INTO sample_indications VALUES (128, 'Postpartum');
INSERT INTO sample_indications VALUES (129, 'Prenatal');
INSERT INTO sample_indications VALUES (130, 'Prostate');
INSERT INTO sample_indications VALUES (131, 'Psoriasis');
INSERT INTO sample_indications VALUES (132, 'Puberty');
INSERT INTO sample_indications VALUES (133, 'Raynauds');
INSERT INTO sample_indications VALUES (134, 'Respiratory');
INSERT INTO sample_indications VALUES (135, 'Rheumatism');
INSERT INTO sample_indications VALUES (136, 'Ringworm');
INSERT INTO sample_indications VALUES (137, 'Sciatica');
INSERT INTO sample_indications VALUES (138, 'Seborrhea');
INSERT INTO sample_indications VALUES (139, 'Sedative');
INSERT INTO sample_indications VALUES (140, 'Sexual Tonic');
INSERT INTO sample_indications VALUES (141, 'Shingles');
INSERT INTO sample_indications VALUES (142, 'Sinusitis');
INSERT INTO sample_indications VALUES (143, 'Skin');
INSERT INTO sample_indications VALUES (144, 'Sleep');
INSERT INTO sample_indications VALUES (145, 'Smoking');
INSERT INTO sample_indications VALUES (146, 'Spasms');
INSERT INTO sample_indications VALUES (147, 'Sprains');
INSERT INTO sample_indications VALUES (148, 'Steroids');
INSERT INTO sample_indications VALUES (149, 'Strains');
INSERT INTO sample_indications VALUES (150, 'Stress');
INSERT INTO sample_indications VALUES (151, 'Stroke');
INSERT INTO sample_indications VALUES (152, 'Surgery');
INSERT INTO sample_indications VALUES (153, 'Swelling');
INSERT INTO sample_indications VALUES (154, 'Teething');
INSERT INTO sample_indications VALUES (155, 'Tic-doulour');
INSERT INTO sample_indications VALUES (156, 'Tinnitis');
INSERT INTO sample_indications VALUES (157, 'Toothache');
INSERT INTO sample_indications VALUES (193, 'Arrhythmia');
INSERT INTO sample_indications VALUES (158, 'Trauma');
INSERT INTO sample_indications VALUES (159, 'Ulcers');
INSERT INTO sample_indications VALUES (160, 'Urethritis');
INSERT INTO sample_indications VALUES (161, 'Urinary Tract*');
INSERT INTO sample_indications VALUES (162, 'Urticaria');
INSERT INTO sample_indications VALUES (163, 'Uterus');
INSERT INTO sample_indications VALUES (164, 'Varicose');
INSERT INTO sample_indications VALUES (165, 'Vertigo');
INSERT INTO sample_indications VALUES (166, 'Viral Infections');
INSERT INTO sample_indications VALUES (167, 'Warts');
INSERT INTO sample_indications VALUES (168, 'Whooping Cough');
INSERT INTO sample_indications VALUES (175, 'Autoimmune Diseases');
INSERT INTO sample_indications VALUES (176, 'Back Pain (Lower)');
INSERT INTO sample_indications VALUES (177, 'Back (Weak)');
INSERT INTO sample_indications VALUES (178, 'Belching');
INSERT INTO sample_indications VALUES (179, 'Breast Distention');
INSERT INTO sample_indications VALUES (180, 'Bulimia');
INSERT INTO sample_indications VALUES (181, 'Carpal Tunnel Syndrome');
INSERT INTO sample_indications VALUES (182, 'Cataracts');
INSERT INTO sample_indications VALUES (183, 'Chills and Fever (Alternating)');
INSERT INTO sample_indications VALUES (184, 'Cholesterol');
INSERT INTO sample_indications VALUES (185, 'Abdominal Distention');
INSERT INTO sample_indications VALUES (186, 'ALS ');
INSERT INTO sample_indications VALUES (187, 'Anemia');
INSERT INTO sample_indications VALUES (188, 'Angina');
INSERT INTO sample_indications VALUES (189, 'Anorexia');
INSERT INTO sample_indications VALUES (190, 'Anti-bacterial');
INSERT INTO sample_indications VALUES (191, 'Appetite');
INSERT INTO sample_indications VALUES (192, 'Arteriosclerosis');
INSERT INTO sample_indications VALUES (194, 'Chronic Fatigue Syndrome');
INSERT INTO sample_indications VALUES (195, 'Chronic Infections');
INSERT INTO sample_indications VALUES (196, 'Chronic Muscle Weakness');
INSERT INTO sample_indications VALUES (197, 'Cysts');
INSERT INTO sample_indications VALUES (198, 'Diaper Rash');
INSERT INTO sample_indications VALUES (199, 'Emphysema');
INSERT INTO sample_indications VALUES (200, 'Fibroids');
INSERT INTO sample_indications VALUES (201, 'Fibromyalgia');
INSERT INTO sample_indications VALUES (202, 'First Aid');
INSERT INTO sample_indications VALUES (203, 'Fractures');
INSERT INTO sample_indications VALUES (204, 'Frequent Urination');
INSERT INTO sample_indications VALUES (205, 'Gallstones');
INSERT INTO sample_indications VALUES (206, 'Goiter');
INSERT INTO sample_indications VALUES (207, 'Gum Disease');
INSERT INTO sample_indications VALUES (208, 'Hangover');
INSERT INTO sample_indications VALUES (209, 'Hernia');
INSERT INTO sample_indications VALUES (210, 'Hiccups');
INSERT INTO sample_indications VALUES (211, 'HIV');
INSERT INTO sample_indications VALUES (212, 'Hives');
INSERT INTO sample_indications VALUES (213, 'Hot Flashes');
INSERT INTO sample_indications VALUES (214, 'Hot Palms and Feet');
INSERT INTO sample_indications VALUES (215, 'Hypothyroid');
INSERT INTO sample_indications VALUES (216, 'Indigestion');
INSERT INTO sample_indications VALUES (217, 'Indigestion');
INSERT INTO sample_indications VALUES (219, 'Leukopenia');
INSERT INTO sample_indications VALUES (220, 'Leukorrhea');
INSERT INTO sample_indications VALUES (221, 'Liver Detoxification');
INSERT INTO sample_indications VALUES (222, 'Low Blood Pressure');
INSERT INTO sample_indications VALUES (223, 'Lung Support');
INSERT INTO sample_indications VALUES (224, 'Lyme Disease');
INSERT INTO sample_indications VALUES (225, 'Macular Degeneration');
INSERT INTO sample_indications VALUES (226, 'Mouth Sores');
INSERT INTO sample_indications VALUES (227, 'Multiple Sclerosis');
INSERT INTO sample_indications VALUES (228, 'Muscular Tension');
INSERT INTO sample_indications VALUES (229, 'Nasal Congestion');
INSERT INTO sample_indications VALUES (230, 'Nightmares');
INSERT INTO sample_indications VALUES (231, 'Night Sweats');
INSERT INTO sample_indications VALUES (232, 'Nursing');
INSERT INTO sample_indications VALUES (233, 'Osteoporosis');
INSERT INTO sample_indications VALUES (234, 'Palpitations');
INSERT INTO sample_indications VALUES (235, 'Pelvic Inflammatory Disease');
INSERT INTO sample_indications VALUES (236, 'Phlegm, Excess');
INSERT INTO sample_indications VALUES (238, 'Pneumonia');
INSERT INTO sample_indications VALUES (239, 'Premature Ejaculation');


--
-- Name: sample_indications_local_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app
--

SELECT pg_catalog.setval('sample_indications_local_id_seq', 239, true);


--
-- Data for Name: side_effects; Type: TABLE DATA; Schema: public; Owner: app
--



--
-- Name: side_effects_local_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app
--

SELECT pg_catalog.setval('side_effects_local_id_seq', 1, false);


--
-- Data for Name: single_herb_contra_indications; Type: TABLE DATA; Schema: public; Owner: app
--

INSERT INTO single_herb_contra_indications VALUES (274, 133);
INSERT INTO single_herb_contra_indications VALUES (295, 147);
INSERT INTO single_herb_contra_indications VALUES (270, 124);
INSERT INTO single_herb_contra_indications VALUES (270, 127);
INSERT INTO single_herb_contra_indications VALUES (15, 124);
INSERT INTO single_herb_contra_indications VALUES (273, 127);
INSERT INTO single_herb_contra_indications VALUES (273, 128);
INSERT INTO single_herb_contra_indications VALUES (274, 124);
INSERT INTO single_herb_contra_indications VALUES (277, 127);
INSERT INTO single_herb_contra_indications VALUES (279, 127);
INSERT INTO single_herb_contra_indications VALUES (280, 127);
INSERT INTO single_herb_contra_indications VALUES (288, 127);
INSERT INTO single_herb_contra_indications VALUES (296, 124);
INSERT INTO single_herb_contra_indications VALUES (298, 124);
INSERT INTO single_herb_contra_indications VALUES (299, 136);
INSERT INTO single_herb_contra_indications VALUES (299, 127);
INSERT INTO single_herb_contra_indications VALUES (301, 124);
INSERT INTO single_herb_contra_indications VALUES (303, 124);
INSERT INTO single_herb_contra_indications VALUES (304, 124);
INSERT INTO single_herb_contra_indications VALUES (304, 127);
INSERT INTO single_herb_contra_indications VALUES (308, 124);
INSERT INTO single_herb_contra_indications VALUES (61, 124);
INSERT INTO single_herb_contra_indications VALUES (310, 127);
INSERT INTO single_herb_contra_indications VALUES (312, 124);
INSERT INTO single_herb_contra_indications VALUES (312, 127);
INSERT INTO single_herb_contra_indications VALUES (314, 127);
INSERT INTO single_herb_contra_indications VALUES (313, 127);
INSERT INTO single_herb_contra_indications VALUES (316, 127);
INSERT INTO single_herb_contra_indications VALUES (317, 127);
INSERT INTO single_herb_contra_indications VALUES (321, 127);
INSERT INTO single_herb_contra_indications VALUES (321, 136);
INSERT INTO single_herb_contra_indications VALUES (321, 124);
INSERT INTO single_herb_contra_indications VALUES (322, 127);
INSERT INTO single_herb_contra_indications VALUES (323, 127);
INSERT INTO single_herb_contra_indications VALUES (329, 127);
INSERT INTO single_herb_contra_indications VALUES (329, 124);
INSERT INTO single_herb_contra_indications VALUES (329, 136);
INSERT INTO single_herb_contra_indications VALUES (330, 136);
INSERT INTO single_herb_contra_indications VALUES (330, 127);
INSERT INTO single_herb_contra_indications VALUES (330, 124);
INSERT INTO single_herb_contra_indications VALUES (99, 127);
INSERT INTO single_herb_contra_indications VALUES (337, 124);
INSERT INTO single_herb_contra_indications VALUES (339, 124);
INSERT INTO single_herb_contra_indications VALUES (111, 127);
INSERT INTO single_herb_contra_indications VALUES (341, 124);
INSERT INTO single_herb_contra_indications VALUES (344, 136);
INSERT INTO single_herb_contra_indications VALUES (344, 127);
INSERT INTO single_herb_contra_indications VALUES (346, 127);
INSERT INTO single_herb_contra_indications VALUES (349, 127);
INSERT INTO single_herb_contra_indications VALUES (350, 127);
INSERT INTO single_herb_contra_indications VALUES (353, 127);
INSERT INTO single_herb_contra_indications VALUES (353, 128);
INSERT INTO single_herb_contra_indications VALUES (354, 124);
INSERT INTO single_herb_contra_indications VALUES (356, 128);
INSERT INTO single_herb_contra_indications VALUES (356, 129);
INSERT INTO single_herb_contra_indications VALUES (359, 136);
INSERT INTO single_herb_contra_indications VALUES (359, 127);
INSERT INTO single_herb_contra_indications VALUES (360, 127);
INSERT INTO single_herb_contra_indications VALUES (364, 127);
INSERT INTO single_herb_contra_indications VALUES (367, 127);
INSERT INTO single_herb_contra_indications VALUES (370, 124);
INSERT INTO single_herb_contra_indications VALUES (372, 127);
INSERT INTO single_herb_contra_indications VALUES (373, 124);
INSERT INTO single_herb_contra_indications VALUES (374, 124);
INSERT INTO single_herb_contra_indications VALUES (376, 124);
INSERT INTO single_herb_contra_indications VALUES (378, 124);
INSERT INTO single_herb_contra_indications VALUES (378, 127);
INSERT INTO single_herb_contra_indications VALUES (383, 124);
INSERT INTO single_herb_contra_indications VALUES (383, 127);
INSERT INTO single_herb_contra_indications VALUES (384, 124);
INSERT INTO single_herb_contra_indications VALUES (384, 127);
INSERT INTO single_herb_contra_indications VALUES (392, 127);
INSERT INTO single_herb_contra_indications VALUES (395, 124);
INSERT INTO single_herb_contra_indications VALUES (170, 136);
INSERT INTO single_herb_contra_indications VALUES (170, 124);
INSERT INTO single_herb_contra_indications VALUES (170, 127);
INSERT INTO single_herb_contra_indications VALUES (401, 127);
INSERT INTO single_herb_contra_indications VALUES (408, 124);
INSERT INTO single_herb_contra_indications VALUES (410, 124);
INSERT INTO single_herb_contra_indications VALUES (413, 127);
INSERT INTO single_herb_contra_indications VALUES (415, 127);
INSERT INTO single_herb_contra_indications VALUES (496, 127);
INSERT INTO single_herb_contra_indications VALUES (418, 127);
INSERT INTO single_herb_contra_indications VALUES (419, 127);
INSERT INTO single_herb_contra_indications VALUES (426, 124);
INSERT INTO single_herb_contra_indications VALUES (201, 127);
INSERT INTO single_herb_contra_indications VALUES (428, 124);
INSERT INTO single_herb_contra_indications VALUES (431, 136);
INSERT INTO single_herb_contra_indications VALUES (429, 127);
INSERT INTO single_herb_contra_indications VALUES (431, 127);
INSERT INTO single_herb_contra_indications VALUES (431, 124);
INSERT INTO single_herb_contra_indications VALUES (432, 124);
INSERT INTO single_herb_contra_indications VALUES (433, 136);
INSERT INTO single_herb_contra_indications VALUES (433, 124);
INSERT INTO single_herb_contra_indications VALUES (433, 127);
INSERT INTO single_herb_contra_indications VALUES (273, 123);
INSERT INTO single_herb_contra_indications VALUES (274, 123);
INSERT INTO single_herb_contra_indications VALUES (277, 123);
INSERT INTO single_herb_contra_indications VALUES (279, 123);
INSERT INTO single_herb_contra_indications VALUES (286, 123);
INSERT INTO single_herb_contra_indications VALUES (288, 123);
INSERT INTO single_herb_contra_indications VALUES (289, 123);
INSERT INTO single_herb_contra_indications VALUES (290, 123);
INSERT INTO single_herb_contra_indications VALUES (290, 124);
INSERT INTO single_herb_contra_indications VALUES (290, 127);
INSERT INTO single_herb_contra_indications VALUES (291, 124);
INSERT INTO single_herb_contra_indications VALUES (293, 123);
INSERT INTO single_herb_contra_indications VALUES (294, 136);
INSERT INTO single_herb_contra_indications VALUES (294, 123);
INSERT INTO single_herb_contra_indications VALUES (294, 127);
INSERT INTO single_herb_contra_indications VALUES (295, 123);
INSERT INTO single_herb_contra_indications VALUES (295, 127);
INSERT INTO single_herb_contra_indications VALUES (297, 123);
INSERT INTO single_herb_contra_indications VALUES (299, 123);
INSERT INTO single_herb_contra_indications VALUES (302, 123);
INSERT INTO single_herb_contra_indications VALUES (304, 123);
INSERT INTO single_herb_contra_indications VALUES (308, 123);
INSERT INTO single_herb_contra_indications VALUES (310, 123);
INSERT INTO single_herb_contra_indications VALUES (312, 123);
INSERT INTO single_herb_contra_indications VALUES (314, 123);
INSERT INTO single_herb_contra_indications VALUES (316, 123);
INSERT INTO single_herb_contra_indications VALUES (317, 123);
INSERT INTO single_herb_contra_indications VALUES (321, 123);
INSERT INTO single_herb_contra_indications VALUES (322, 123);
INSERT INTO single_herb_contra_indications VALUES (329, 123);
INSERT INTO single_herb_contra_indications VALUES (330, 123);
INSERT INTO single_herb_contra_indications VALUES (99, 123);
INSERT INTO single_herb_contra_indications VALUES (339, 123);
INSERT INTO single_herb_contra_indications VALUES (111, 123);
INSERT INTO single_herb_contra_indications VALUES (344, 123);
INSERT INTO single_herb_contra_indications VALUES (350, 123);
INSERT INTO single_herb_contra_indications VALUES (353, 123);
INSERT INTO single_herb_contra_indications VALUES (356, 123);
INSERT INTO single_herb_contra_indications VALUES (358, 123);
INSERT INTO single_herb_contra_indications VALUES (359, 123);
INSERT INTO single_herb_contra_indications VALUES (360, 123);
INSERT INTO single_herb_contra_indications VALUES (361, 123);
INSERT INTO single_herb_contra_indications VALUES (364, 123);
INSERT INTO single_herb_contra_indications VALUES (367, 123);
INSERT INTO single_herb_contra_indications VALUES (370, 123);
INSERT INTO single_herb_contra_indications VALUES (378, 123);
INSERT INTO single_herb_contra_indications VALUES (383, 123);
INSERT INTO single_herb_contra_indications VALUES (384, 123);
INSERT INTO single_herb_contra_indications VALUES (392, 123);
INSERT INTO single_herb_contra_indications VALUES (394, 123);
INSERT INTO single_herb_contra_indications VALUES (170, 123);
INSERT INTO single_herb_contra_indications VALUES (406, 123);
INSERT INTO single_herb_contra_indications VALUES (411, 123);
INSERT INTO single_herb_contra_indications VALUES (496, 123);
INSERT INTO single_herb_contra_indications VALUES (419, 123);
INSERT INTO single_herb_contra_indications VALUES (420, 123);
INSERT INTO single_herb_contra_indications VALUES (426, 123);
INSERT INTO single_herb_contra_indications VALUES (428, 123);
INSERT INTO single_herb_contra_indications VALUES (429, 123);
INSERT INTO single_herb_contra_indications VALUES (430, 123);
INSERT INTO single_herb_contra_indications VALUES (431, 123);
INSERT INTO single_herb_contra_indications VALUES (433, 123);
INSERT INTO single_herb_contra_indications VALUES (434, 123);
INSERT INTO single_herb_contra_indications VALUES (440, 123);
INSERT INTO single_herb_contra_indications VALUES (227, 124);
INSERT INTO single_herb_contra_indications VALUES (439, 124);
INSERT INTO single_herb_contra_indications VALUES (441, 123);
INSERT INTO single_herb_contra_indications VALUES (441, 128);
INSERT INTO single_herb_contra_indications VALUES (441, 127);
INSERT INTO single_herb_contra_indications VALUES (443, 124);
INSERT INTO single_herb_contra_indications VALUES (443, 127);
INSERT INTO single_herb_contra_indications VALUES (445, 127);
INSERT INTO single_herb_contra_indications VALUES (445, 124);
INSERT INTO single_herb_contra_indications VALUES (446, 136);
INSERT INTO single_herb_contra_indications VALUES (446, 123);
INSERT INTO single_herb_contra_indications VALUES (446, 127);
INSERT INTO single_herb_contra_indications VALUES (446, 124);
INSERT INTO single_herb_contra_indications VALUES (447, 127);
INSERT INTO single_herb_contra_indications VALUES (447, 124);
INSERT INTO single_herb_contra_indications VALUES (449, 123);
INSERT INTO single_herb_contra_indications VALUES (449, 124);
INSERT INTO single_herb_contra_indications VALUES (450, 127);
INSERT INTO single_herb_contra_indications VALUES (451, 123);
INSERT INTO single_herb_contra_indications VALUES (451, 124);
INSERT INTO single_herb_contra_indications VALUES (451, 127);
INSERT INTO single_herb_contra_indications VALUES (452, 123);
INSERT INTO single_herb_contra_indications VALUES (453, 123);
INSERT INTO single_herb_contra_indications VALUES (453, 127);
INSERT INTO single_herb_contra_indications VALUES (455, 127);
INSERT INTO single_herb_contra_indications VALUES (456, 127);
INSERT INTO single_herb_contra_indications VALUES (460, 136);
INSERT INTO single_herb_contra_indications VALUES (460, 123);
INSERT INTO single_herb_contra_indications VALUES (460, 127);
INSERT INTO single_herb_contra_indications VALUES (460, 124);
INSERT INTO single_herb_contra_indications VALUES (460, 129);
INSERT INTO single_herb_contra_indications VALUES (460, 128);
INSERT INTO single_herb_contra_indications VALUES (461, 124);
INSERT INTO single_herb_contra_indications VALUES (463, 124);
INSERT INTO single_herb_contra_indications VALUES (465, 124);
INSERT INTO single_herb_contra_indications VALUES (470, 127);
INSERT INTO single_herb_contra_indications VALUES (470, 124);
INSERT INTO single_herb_contra_indications VALUES (473, 123);
INSERT INTO single_herb_contra_indications VALUES (473, 127);
INSERT INTO single_herb_contra_indications VALUES (473, 124);
INSERT INTO single_herb_contra_indications VALUES (474, 123);
INSERT INTO single_herb_contra_indications VALUES (474, 127);
INSERT INTO single_herb_contra_indications VALUES (475, 136);
INSERT INTO single_herb_contra_indications VALUES (475, 123);
INSERT INTO single_herb_contra_indications VALUES (475, 127);
INSERT INTO single_herb_contra_indications VALUES (475, 124);
INSERT INTO single_herb_contra_indications VALUES (266, 124);
INSERT INTO single_herb_contra_indications VALUES (484, 123);
INSERT INTO single_herb_contra_indications VALUES (484, 127);
INSERT INTO single_herb_contra_indications VALUES (487, 127);
INSERT INTO single_herb_contra_indications VALUES (489, 123);
INSERT INTO single_herb_contra_indications VALUES (489, 127);
INSERT INTO single_herb_contra_indications VALUES (489, 124);
INSERT INTO single_herb_contra_indications VALUES (490, 123);
INSERT INTO single_herb_contra_indications VALUES (490, 127);
INSERT INTO single_herb_contra_indications VALUES (490, 124);
INSERT INTO single_herb_contra_indications VALUES (491, 123);
INSERT INTO single_herb_contra_indications VALUES (494, 123);
INSERT INTO single_herb_contra_indications VALUES (494, 124);
INSERT INTO single_herb_contra_indications VALUES (494, 129);
INSERT INTO single_herb_contra_indications VALUES (13, 127);
INSERT INTO single_herb_contra_indications VALUES (13, 123);
INSERT INTO single_herb_contra_indications VALUES (43, 127);
INSERT INTO single_herb_contra_indications VALUES (44, 124);
INSERT INTO single_herb_contra_indications VALUES (14, 124);
INSERT INTO single_herb_contra_indications VALUES (46, 123);
INSERT INTO single_herb_contra_indications VALUES (47, 123);
INSERT INTO single_herb_contra_indications VALUES (47, 127);
INSERT INTO single_herb_contra_indications VALUES (272, 127);
INSERT INTO single_herb_contra_indications VALUES (272, 123);
INSERT INTO single_herb_contra_indications VALUES (16, 123);
INSERT INTO single_herb_contra_indications VALUES (53, 123);
INSERT INTO single_herb_contra_indications VALUES (54, 127);
INSERT INTO single_herb_contra_indications VALUES (56, 123);
INSERT INTO single_herb_contra_indications VALUES (58, 124);
INSERT INTO single_herb_contra_indications VALUES (63, 127);
INSERT INTO single_herb_contra_indications VALUES (67, 136);
INSERT INTO single_herb_contra_indications VALUES (67, 127);
INSERT INTO single_herb_contra_indications VALUES (67, 123);
INSERT INTO single_herb_contra_indications VALUES (67, 124);
INSERT INTO single_herb_contra_indications VALUES (69, 123);
INSERT INTO single_herb_contra_indications VALUES (71, 127);
INSERT INTO single_herb_contra_indications VALUES (72, 123);
INSERT INTO single_herb_contra_indications VALUES (73, 123);
INSERT INTO single_herb_contra_indications VALUES (76, 127);
INSERT INTO single_herb_contra_indications VALUES (77, 123);
INSERT INTO single_herb_contra_indications VALUES (78, 123);
INSERT INTO single_herb_contra_indications VALUES (79, 123);
INSERT INTO single_herb_contra_indications VALUES (81, 127);
INSERT INTO single_herb_contra_indications VALUES (82, 123);
INSERT INTO single_herb_contra_indications VALUES (85, 127);
INSERT INTO single_herb_contra_indications VALUES (86, 123);
INSERT INTO single_herb_contra_indications VALUES (86, 127);
INSERT INTO single_herb_contra_indications VALUES (86, 124);
INSERT INTO single_herb_contra_indications VALUES (92, 123);
INSERT INTO single_herb_contra_indications VALUES (95, 127);
INSERT INTO single_herb_contra_indications VALUES (97, 124);
INSERT INTO single_herb_contra_indications VALUES (97, 127);
INSERT INTO single_herb_contra_indications VALUES (101, 127);
INSERT INTO single_herb_contra_indications VALUES (103, 123);
INSERT INTO single_herb_contra_indications VALUES (104, 124);
INSERT INTO single_herb_contra_indications VALUES (104, 127);
INSERT INTO single_herb_contra_indications VALUES (112, 123);
INSERT INTO single_herb_contra_indications VALUES (113, 123);
INSERT INTO single_herb_contra_indications VALUES (114, 127);
INSERT INTO single_herb_contra_indications VALUES (115, 136);
INSERT INTO single_herb_contra_indications VALUES (115, 123);
INSERT INTO single_herb_contra_indications VALUES (119, 127);
INSERT INTO single_herb_contra_indications VALUES (124, 123);
INSERT INTO single_herb_contra_indications VALUES (124, 124);
INSERT INTO single_herb_contra_indications VALUES (132, 127);
INSERT INTO single_herb_contra_indications VALUES (141, 127);
INSERT INTO single_herb_contra_indications VALUES (141, 123);
INSERT INTO single_herb_contra_indications VALUES (146, 123);
INSERT INTO single_herb_contra_indications VALUES (154, 123);
INSERT INTO single_herb_contra_indications VALUES (125, 124);
INSERT INTO single_herb_contra_indications VALUES (129, 124);
INSERT INTO single_herb_contra_indications VALUES (129, 123);
INSERT INTO single_herb_contra_indications VALUES (143, 127);
INSERT INTO single_herb_contra_indications VALUES (162, 123);
INSERT INTO single_herb_contra_indications VALUES (162, 128);
INSERT INTO single_herb_contra_indications VALUES (162, 127);
INSERT INTO single_herb_contra_indications VALUES (163, 124);
INSERT INTO single_herb_contra_indications VALUES (163, 127);
INSERT INTO single_herb_contra_indications VALUES (169, 136);
INSERT INTO single_herb_contra_indications VALUES (169, 124);
INSERT INTO single_herb_contra_indications VALUES (169, 123);
INSERT INTO single_herb_contra_indications VALUES (399, 124);
INSERT INTO single_herb_contra_indications VALUES (173, 127);
INSERT INTO single_herb_contra_indications VALUES (181, 124);
INSERT INTO single_herb_contra_indications VALUES (182, 127);
INSERT INTO single_herb_contra_indications VALUES (183, 123);
INSERT INTO single_herb_contra_indications VALUES (191, 127);
INSERT INTO single_herb_contra_indications VALUES (193, 127);
INSERT INTO single_herb_contra_indications VALUES (194, 127);
INSERT INTO single_herb_contra_indications VALUES (198, 123);
INSERT INTO single_herb_contra_indications VALUES (202, 127);
INSERT INTO single_herb_contra_indications VALUES (207, 123);
INSERT INTO single_herb_contra_indications VALUES (210, 123);
INSERT INTO single_herb_contra_indications VALUES (212, 127);
INSERT INTO single_herb_contra_indications VALUES (217, 123);
INSERT INTO single_herb_contra_indications VALUES (219, 124);
INSERT INTO single_herb_contra_indications VALUES (221, 127);
INSERT INTO single_herb_contra_indications VALUES (224, 127);
INSERT INTO single_herb_contra_indications VALUES (231, 123);
INSERT INTO single_herb_contra_indications VALUES (232, 127);
INSERT INTO single_herb_contra_indications VALUES (232, 123);
INSERT INTO single_herb_contra_indications VALUES (234, 123);
INSERT INTO single_herb_contra_indications VALUES (234, 127);
INSERT INTO single_herb_contra_indications VALUES (234, 124);
INSERT INTO single_herb_contra_indications VALUES (235, 123);
INSERT INTO single_herb_contra_indications VALUES (237, 128);
INSERT INTO single_herb_contra_indications VALUES (244, 123);
INSERT INTO single_herb_contra_indications VALUES (245, 127);
INSERT INTO single_herb_contra_indications VALUES (245, 123);
INSERT INTO single_herb_contra_indications VALUES (249, 127);
INSERT INTO single_herb_contra_indications VALUES (252, 136);
INSERT INTO single_herb_contra_indications VALUES (252, 127);
INSERT INTO single_herb_contra_indications VALUES (252, 123);
INSERT INTO single_herb_contra_indications VALUES (252, 124);
INSERT INTO single_herb_contra_indications VALUES (253, 127);
INSERT INTO single_herb_contra_indications VALUES (253, 128);
INSERT INTO single_herb_contra_indications VALUES (256, 124);
INSERT INTO single_herb_contra_indications VALUES (262, 127);
INSERT INTO single_herb_contra_indications VALUES (263, 127);
INSERT INTO single_herb_contra_indications VALUES (267, 123);
INSERT INTO single_herb_contra_indications VALUES (268, 127);


--
-- Data for Name: single_herb_sample_indications; Type: TABLE DATA; Schema: public; Owner: app
--



--
-- Data for Name: single_herb_side_effects; Type: TABLE DATA; Schema: public; Owner: app
--



--
-- Data for Name: single_herbs; Type: TABLE DATA; Schema: public; Owner: app
--

INSERT INTO single_herbs VALUES (44, 'Aconite', 'Aconitum Carmichaeli Radix &leftpar;treated&rightp', 'Chuan Wu Tou', 'Expels Wind/Dampness, Warms the body, Expels Cold, Relieves Pain, Rheumatism, Paralysis, Spasms', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (45, 'Agastache', 'Agastache Rugosa Seu Pogostemi Herba', 'Huo Xiang', 'Transforms Dampness, Harmonizes the Middle Burner, Relieves Nausea and Vomiting', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (46, 'Agrimony', 'Agrimonia Pilosa Herba', 'Xian He Cao', 'Constricts and Arrests Bleeding, Avoid with Constipation', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (47, 'Akebia', 'Akebia Trifoliata Caulis', 'Mu Tong', 'Promotes Urination, Drains Heat from Heart, Edema, Painful Urinary Dysfunction, Promotes Lactation', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (48, 'Albizzia bark', 'Albizzia Julibrissin Cortex', 'He Huan Pi', 'Calms the Spirit, Depression, Constrained Emotions, Bad Temper', 'For poor memory with constrained emotions', 'For pent up emotions, constrained', 'For pent up emotions, calming', 'For depression and a bad temper', 'For constrained emotions and depression', '', '', '', '');
INSERT INTO single_herbs VALUES (49, 'Alisma', 'Alismatis Orientalis Rhizoma', 'Ze Xie', 'Promotes Urination, Drains Kidney Fire, Damp/Heat in the Lower Body, Edema, Urinary Dysfunction', 'For edema or water retention', 'For water retention and edema, combine with Buchu &leftpar;Barosma Betulina&rightpar;', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (50, 'Alpinia', 'Alpinia Oxyphylla Fructus', 'Yi Zhi Ren', 'Warms the Kidneys and Spleen, Urinary Incontinence, Diarrhea', 'For incontinence or frequent urination', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (51, 'Albizzia flower', 'Albizzia Julibrissin Flos', 'He Huan Hua', 'Insomnia, Pent Up Emotions, Calms the Spirit, Tightness in the Chest, Irritable', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (52, 'Angelica dah.', 'Angelica Dahurica Radix', 'Bai Zhi', 'Expels Wind, Induces Perspiration, Alleviates Pain in Head Region, Opens the Nasal Passages', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (53, 'Apricot seed', 'Prunus Armeniaca Semen', 'Xing Ren', 'Relieves Dry Cough, Expels Sputum, Relieves Asthma, Moistens the Tissues', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (54, 'Arisaema', 'Arisaematis Rhizoma Praeparatum', 'Tian Nan Xing', 'Resolves Cold Phlegm, Disperses Wind/Phlegm in the Channels', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (55, 'Artemisia', 'Artemisine Argyi Folium', 'Ai Ye', 'Stops Bleeding, Warms the Womb, Calms the Fetus', 'Arrests uterine bleeding', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (56, 'Asarum', 'Asarum Sieboldii Herba cum Radix', 'Xi Xin', 'Expels Cold, Disperses Wind, Warms the Lungs, Nasal Congestion, Body Pain and Headache due to Catarrh', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (57, 'Asparagus', 'Asparagus Cochinchinensis Tuber', 'Tian Men Dong', 'Nourishes the Yin, Moistens the Lungs, Clears Lung Heat', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (58, 'Aster', 'Astens Tataiici Radix', 'Zi Wan', 'Warms the Lungs, Relieves All Coughs, Expels Sputum, Asthma, Arrests Bleeding', 'For chronic cough and bronchial constriction', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (59, 'Astragalus', 'Astragalus Membranaceus Radix', 'Huang Qi', 'Strengthens the Spleen and Lung, Augments the Qi, Stabilizes the Exterior, Raises the Yang Qi', 'For fatigue and anemia, combine with Tang Kuei &leftpar;Dang Gui&rightpar;', 'For fatigue and a feeling of depletion', 'For shortness of breath and fatigue', 'For strengthening the immune system', 'For chronic, non-healing sores and lesions', '', '', '', '');
INSERT INTO single_herbs VALUES (60, 'Astragalus seed', 'Astragalus Complanatus Semen', 'Sha Yuan Zi', 'Fortifies the Yang, Nourishes the Liver and Kidneys', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (61, 'Calamus', 'Acorus Calamus', '', 'Aromatic, Carminative, Dyspepsia, Colic, Intestinal Gas', 'Improves digestive assimilation and liver functions', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (62, 'Atractylodes, red', 'Atractylodes Lancea Rhizoma', 'Cang Zhu', 'Dries Dampness, Expels Wind, Improves Vision, Night Blindness, Relieves Pain in Lower Body, Rheumatism', 'Resolves dampness and fluid retention', 'For additional support for night blindness', 'For vomiting up phlegm', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (63, 'Belamcanda', 'Belamcanda Chinensis Rhizoma', 'She Gan', 'Clears Toxicity and Heat, Sore and Swollen Throat, Transforms Phlegm, Clears the Lungs, Influenza', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (13, 'Abutilon', 'Malva Verticillata Semen', 'Dong Kui Zi', 'Promotes Urination, Edema, Promotes Lactation, Moistens the Intestines, Relieves Constipation', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (14, 'Acorus', 'Acorus Gramineus Rhizoma', 'Shi Chang Pu', 'Opens the Orifices, Transforms Dampness, Calms the Spirit', 'For insomnia and an agitated spirit', 'To open the channels to the heart', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (15, 'Aloe Vera', 'Aloe Vera Herba', 'Lu Hui', 'Drains Fire, Clears Liver Fire, Kills Parasites and Roundworms', 'Protects the internal body from excess heat', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (16, 'Anemarrhena', 'Anemarrhena Asphodeloidis Rhizoma', 'Zhi Mu', 'Clears Heat, Drains Fire, Nourishes the Yin, Moistens', 'For dry mouth and night sweats, combine with Phellodendron &leftpar;Huang Bai&rightpar;', 'For fevers, combine with Gypsum &leftpar;Shi Gao&rightpar;', 'For hot flashes and dryness', 'For fever and facial flushing', 'For  facial flushing, dry mouth', '', '', '', '');
INSERT INTO single_herbs VALUES (41, 'Acacia', 'Acacia Catechu', 'Er Chu', 'Drains Dampness, Non-Healing Sores, Transforms Phlegm', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (42, 'Acanthopanax', 'Acanthopanax Gracilistylus Cortex Radix', 'Wu Jia Pi', 'Dispels Wind/Damp, Nourishes the Liver and Kidneys, Strengthens the Bones and Tendons, Leukopenia', 'For leukopenia', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (43, 'Achyranthes', 'Achyranthes Bidentata Radix', 'Niu Xi', 'Activates the Blood, Dysmenorrhea, Strengthens the Tendons, Abdominal and Bone Pain, Hypertension', 'For stony, painful urination', 'For a hot head with cold feet &leftpar;physical and emotional levels&rightpar;', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (64, 'Biota', 'Biotae Orientalis Semen', 'Bai Zi Ren', 'Nourishes the Heart, Calms the Spirit, Moistens the Intestines, Stops Excessive Sweating', 'For irritability and forgetfulness', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (65, 'Bletilla', 'Bletillae Striatae Rhizoma', 'Bai Ji', 'Stops Bleeding, Reduces Swelling, Generates Flesh', 'Gastric and duodenal ulcers, vomiting or coughing blood', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (66, 'Blue Citrus', 'Citrus Reticulata Viride Pericarpium', 'Qing Pi', 'Regulates the Chi, Spreads Liver Chi, Dissipates Lumps, Dries Dampness, Transforms Phlegm', 'For chest tightness and abdominal fullness, use with Bupleurum &leftpar;Chai Hu&rightpar;', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (67, 'Brucea fruit', 'Brucea Javanica Semen', 'Ya Dan Zi', 'Topically for Warts and Corns, Parasites, Dysentery', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (68, 'Buddleia', 'Buddleia Officinalis FIos', 'Mi Meng Hua', 'Expels Wind, Cools the Blood, Benefits the Vision, Excessive Tearing and Redness of the Eyes', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (69, 'Bupleurum', 'Bupleurum Chinense Radix', 'Chai Hu', 'Disperses and Releases Exterior/Heat, Disperses Liver Chi, Raises the Yang, Chest Pain, Dysmenorrhea', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (70, 'Burdock seed', 'Arctium Lappa Fructus', 'Niu Bang Zi', 'Releases Exterior/Heat, Clears Toxic/Heat, Vents Rashes', 'Clears toxicity from the blood', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (71, 'Bushy Knotweed', 'Polygonum Cuspidatum Rhizoma', 'Hu Zhang', 'Activates the Blood, Resolves Stagnation, Clears Heat, Amenorrhea, Relieves Pain, Injury', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (72, 'Cannabis seed &leftpar;treated&rightpar;', 'Cannabis Sativa Semen', 'Huo Ma Ren', 'Moistens the Intestines, Dry Constipation', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (73, 'Capillaris', 'Artemisia Capillaris Herba', 'Yin Chen Hao', 'Clears Damp/Heat from the Liver and Gallbladder, Jaundice, Hepatitis, Protects Bile Production', 'For hepatitis and jaundice', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (74, 'Cardamon', 'Amomum Villosum Fructus seu Semen', 'Sha Ren', 'Strengthens the Stomach, Promotes the Movement of Chi, Transforms Dampness, Stops Vomiting', 'Calms the digestive tract', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (75, 'Cardamon, white', 'Amomi Cardomomum Fructus', 'Bai Dou Kou', 'Transforms Dampness and Stagnation, Warms the Middle Burner', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (76, 'Carthamus', 'Carthamus Tinctorius Flos', 'Hong Hua', 'Activates the Blood, Disperses Blood Stagnation, Alleviates Abdominal Pain, Vents Rashes, Angina', 'For angina and to enhance blood circulation', 'For severe pain', 'abdominal cramping clots and scanty flow, combine with Persica &leftpar;Tao Ren&rightpar;', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (77, 'Cassia seed', 'Cassia Tora Semen', 'Jue Ming Zi', 'Expels Wind/Heat, Benefits the Eyes, Clears the Liver, Moistens the Bowels, Lowers Cholesterol', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (78, 'Chaenomeles &leftpar;Quince fruit&rightpar;', 'Chaenomelis Lagenaria Fructus', 'Mu Gua', 'Relaxes the Tendons, Unblocks the Channels, Pain and Cramping in the Lower Body', 'For lower body pain', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (79, 'Chiang Huo', 'Notopterguim Incisum Rhizoma et Radix', 'Qiang Huo', 'Releases the Exterior, Expels Wind and Dampness, Alleviates Pain, Headaches, Relieves Hot Sensations', 'For pain in the upper body, combine with Clematis &leftpar;Wei Ling Xian&rightpar;', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (80, 'Chih-ko', 'Citrus Aurantium seu Poncirus Fructus mature', 'Zhi Ke', 'Breaks Up Stagnant Chi, Abdominal Fullness, Better for Weak, Deficient Conditions than Chi-Shih', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (81, 'Chih-shih', 'Citrus Aurantium seu Poncirus Fructus immature', 'Zhi Shi', 'Breaks Up Stagnant Chi, Unblocks the Bowels, Directs the Chi Downward, Transforms Phlegm', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (82, 'Chrysanthemum', 'Chrysanthemum Morifolium Flos', 'Ju Hua', 'Expels Wind/Heat, Benefits the Eyes, Clears the Liver, Excessive Tearing, Earache, Headaches', 'For feverish, red, and painful eyes', 'For red eyes and eye pain', 'To clear redness and pain from the eyes and ears', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (83, 'Chrysanthemum, wild', 'Chrysanthemum Indium Flos', 'Ye Ju Hua', 'Drains Fire, Relieves Toxicity, Sores, Boils, Swollen Throat, Hypertension', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (84, 'Cibotium', 'Cibotium Barometz Rhizoma', 'Gou Ji', 'Nourishes the Liver and Kidneys, Strengthens the Tendons, Expels Wind/Damp, Lumbago, Enuresis', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (85, 'Cicada', 'Cicada Atrata Periostracum', 'Chan Tui', 'Disperses Wind, Clears Heat, Vents Rashes, Red and Painful Eyes, Spasms, Convulsions', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (86, 'Cinnamon bark', 'Cinnamomum Cassia Cortex', 'Rou Gui', 'Warms the Kidneys, Fortifies the Yang, Expels Inner Chills &leftpar;Cold to the Bone&rightpar;, Returns Fire to its Source', 'For cold extremities', 'For a cold abdomen and cold extremities', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (87, 'Cinnamon twig', 'Cinnamom Cassia Ramulus', 'Gui Zhi', 'Adjusts the Nutritive and Protective Qi, Warms the Channels and Expels Cold, Moves the Yang Qi', 'Relieves muscular tension, combine with Pueraria &leftpar;Ge Gen&rightpar;', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (88, 'Cistanche', 'Cistanches Deserticola Herba', 'Rou Cong Rong', 'Strengthens the Kidney Yang, Moistens the Intestines, Infertility Due to Cold Womb', 'For stimulating peristalsis of intestines', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (89, 'Citrus', 'Citrus Reticulata Pericarpium', 'Chen Pi', 'Regulates and Promotes the Movement of Chi Downward, Dries Dampness, Transforms Phlegm', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (90, 'Clematis', 'Clematis Chinensis Radix', 'Wei Ling Xian', 'Dispels Wind/Dampness, Unblocks the Channels, Alleviates Muscular and Joint Pain, Rheumatism', 'For pain in the lower body', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (91, 'Cloves', 'Eugenia Catyophyllata Flos', 'Ding Xiang', 'Directs Chi Downward, Warms the Spleen and Kidneys, Relieves Pain, Digestive Aid', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (92, 'Cnidium', 'Ligusticum Wallichii Radix', 'Chuan Xiong', 'Invigorates the Blood and Moves the Chi, Gynecological Problems, Expels Wind, Alleviates Pain', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (93, 'Cnidium seed', 'Cnidium Monnieri Semen', 'She Chuang Zi', 'Kills Parasites, Dries Dampness, Itchy Genitals, Warms the Kidneys, Fortifies the Yang, Impotence', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (113, 'Dendrobium', 'Dendrobium Nobile Herba', 'Shi Hu', 'Nourishes the Yin, Clears Heat, Produces Fluids, Nourishes the Stomach, Benefits the Vision', 'Moistens the body fluids, enhances the vision', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (114, 'Dianthus', 'Dianthus Superbus Herba', 'Qu Mai', 'Clears Damp/Heat, Promotes Urination, Painful Uri-nary Dysfunction, Activates the Blood, Constipation', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (115, 'Dictamnus', 'Dictamnus Dasycarpus Radicis cortex', 'Bai Xian Pi', 'Clears Heat and Toxicity, Expels Wind, Dries Dampness, Sores, Carbuncles, Rashes', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (116, 'Dioscorea', 'Dioscorca Opposita Radix', 'Shan Yao', 'Strengthens Spleen and Stomach, Nourishes Lungs and Kidneys, Diarrhea, Diabetes, Vaginal Discharge', 'For weak appetite and sweating', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (117, 'Dipsacus', 'Dipsacus Asper Radix', 'Xu Duan', 'Strengthens the Kidneys and Liver, Strengthens the Bones and Tendons, Lumbago, Fractures', 'For sore lower back', 'For stiffness in the joints', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (118, 'Dolichos', 'Dolichoris Lablab Semen', 'Bai Bian Dou', 'Strengthens the Spleen, Clears Summerheat, Chronic Diarrhea, Vomiting, Loud Stomach Growling', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (119, 'Dragons Blood', 'Daemonorops Draconis Sanguis', 'Xue Jie', 'Activates the Blood, Relieves Pain, Stops Bleeding, Generates Flesh, Heals Fractures, Sprains, Injury', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (120, 'Dragon bone', 'Draconis Os', 'Long Gu', 'Calms the Spirit, Calms the Liver, Stops Seepage of Fluids, Emotional Distress, Insomnia, Anxiety', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (121, 'Drynaria', 'Drynaria Fortunei Rhizoma', 'Gu Sui Bu', 'Strengthens the Kidneys, Connects Tendons and Bones, Activates the Blood, Relieves Pain, Fractures', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (122, 'Du Huo', 'Angelica Root, Pubescent', 'Tu Huo', 'Dispels Wind/Damp, Releases the Exterior, Relieves Pain, Low Body Pain, Lumbago, Headaches', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (123, 'Eclipta', 'Eclipta Prostrata Herba', 'Han Lian Cao', 'Nourishes the Liver and Kidneys, Cools the blood, Stops Bleeding, Dizziness, Blurred Vision, Vertigo', 'For liver disorders, combine with Ligustrum &leftpar;Nu Zhen Zi&rightpar;', 'For dizziness and blurred vision', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (124, 'Ephedra', 'Ephedra Herba', 'Ma Huang', 'Induces Perspiration, Asthma, Do not use if Sweating Profusely during a Febrile Disease', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (125, 'Epimedium', 'Epimedium Grandiflorum Herba', 'Yin Yang Huo', 'Strengthens the Kidneys, Fortifies the Yang, Impotence, Rheumatism, Hypertension', 'A sexual stimulant', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (126, 'Eriobotrya  &leftpar;Loquat Leaf&rightpar;', 'Eriobotrya Japonica Folium', 'Pi Pa Ye', 'Transforms Phlegm, Clears Lung Heat, Directs Lung Chi Downward, Harmonizes the Stomach', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (127, 'Eucommia', 'Eucommia Ulmoides Cortex', 'Du Zhong', 'Strengthens the Kidneys and Liver, Strengthens Tendons, Secures Fetus, Lumbago, Hypertension', 'For securing a fetus, combine with Scute &leftpar;Huang Qin&rightpar; and Dipsacus &leftpar;Xu Duan&rightpar;', 'For hypertension, combine with Loranthus &leftpar;Sang Ji Sheng&rightpar;', 'For recurring miscarriages', 'For soreness in the lower back', '', '', '', '', '');
INSERT INTO single_herbs VALUES (128, 'Euryales', 'Euryale Ferox Semen', 'Qian Shi', 'Strengthens the Spleen and Kidneys, Diarrhea, Restrains Seminal Emissions, Avoid with Constipation', 'For loose stool or urinary incontinence', 'For loose stools and poor assimilation', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (129, 'Evodia', 'Evodia Rutaecarpa Fructus', 'Wu Zhu Yu', 'Warms the middle burner, Disperses Cold, Relieves vomiting and abdominal pain', 'For abdominal cramping and pain', 'For abdominal pain with vomiting and phlegm', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (130, 'Fennel', 'Foeniculum Vulgare Fructus', 'Xiao Hui Xiang', 'Promotes Movement of Chi, Disperses Stagnation, Warms Internal Organs, Low Abdominal Pain, Hernia', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (145, 'Ginseng &leftpar;American&rightpar;', 'Panax Quinqueforium', 'Xi Yang Shen', 'Nourishes the Yin of the Lung and Stomach, Produces Fluids, Clears Heat', 'To rebuild the energy reserves', 'Helps to produce fluids', 'Supplements the bodies energy and fluids', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (131, 'Forsythia', 'Forsythia Suspensa Fructus', 'Lian Qiao', 'Clears Heat and Toxicity, Expels Wind/Heat, Sore Throat, Fever, Influenza, Carbuncles, Scrofula', 'For fever/chills, swollen glands', 'For fever', 'For severe skin flare ups', 'For fever combine with Coptis  &leftpar;Huang Lian&rightpar;', '', '', '', '', '');
INSERT INTO single_herbs VALUES (94, 'Codonopsis', 'Codonopsis Pilosula Radix', 'Dang Shen', 'Strengthens the Middle Burner and Qi, Nourishes the Lungs and Fluids', 'Strengthens the qi or energy', 'Strengthens the bodies energy', 'Strengthens the spleen and enhances energy', 'For fatigue and weak digestion', '', '', '', '', '');
INSERT INTO single_herbs VALUES (95, 'Coix', 'Coix Lachryma Jobi Semen', 'Yi Yi Ren', 'Promotes Urination/Drains Dampness, Strengthens the Spleen, Clears Carbuncles and Abscesses', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (96, 'Coltsfoot', 'Tussilago Farfara Flos', 'Kuan Dong Hua', 'Redirects the Chi Downward, Stops Coughing and Wheezing', 'For cough and mucous build-up', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (97, 'Coptis', 'Coptis Chinensis Rhizoma', 'Huang Lian', 'Drains Fire, Relieves Toxicity, Clears Heat and Drains Dampness, Drains Stomach Fire, Stops Bleeding', 'For a bitter dry mouth', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (98, 'Cordyceps', 'Cordyceps Sinensis', 'Dong Chong Xia Cao', 'Warms the Kidneys, Fortifies the Yang, Nourishes the Lungs, Nourishes the Yin', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (99, 'Corn Silk', 'Zea Mays stylus', 'Yu Mi Xu', 'Promotes Urination, Urinary Infections, Supports the Gall Bladder, Jaundice, Diabetes', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (100, 'Cornus', 'Cornus Officinalis Fructus', 'Shan Zhu Yu', 'Stabilizes the Kidneys, Nourishes the Liver, Retains the Essence, Stops Excessive Bleeding and Sweating,', 'For excessive sweating', 'For hearing loss, tinnitus, or dizziness', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (101, 'Corydalis', 'Corydalis Yanhusuo Rhizoma', 'Yan Hu Suo', 'Invigorates the Blood, Alleviates Pain, Moves the Qi, Injury, Abdominal and Gynecological Pain', 'Alleviates abdominal pain and discomfort', 'For pain, spasms, and discomfort, combine with Wild Yam &leftpar;Dioscorea Villosa&rightpar;', 'For abdominal pain, combine with Myrrh &leftpar;Mo Yao&rightpar;', 'For dysmenorrhea, combine with Cyperus &leftpar;Xiang Fu&rightpar;', 'For chronic abdominal pain', '', '', '', '');
INSERT INTO single_herbs VALUES (102, 'Crataegus', 'Crataegus Pinnatifida Fructus', 'Shan Zha', 'Reduces Food Stagnation and Accumulation, Disperses Blood Stagnation, Cholesterol, Hypertension', 'For food stagnation and excess fat', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (103, 'Curculigo', 'Curculigo Orchioidis Rhizoma', 'Xian Mao', 'Strengthens the Kidneys, Fortifies the Yang, Infertility in Men and Women, Weak Lower Body, Back Pain', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (104, 'Curcuma', 'Curcuma Longa Tuber', 'Yu Jin', 'Invigorates the Blood, Moves the Chi, Clears the Heart, Cools the Blood, Supports the Gall Bladder', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (105, 'Cuscuta', 'Cuscuta Chinensis Semen', 'Tu Si Zi', 'Nourishes the Kidneys and Liver, Secures the Essence, Strengthens the Yang, Low Body Weakness, Impotence, Calms the Fetus, Diarrhea, Enuresis', 'For premature ejaculation', 'For diarrhea, use with Dioscorea &leftpar;Shan Yao&rightpar; and Hoelen &leftpar;Fu Ling&rightpar;', 'For dizziness or blurred vision and urinary dysfunction', 'For calming a restless fetus', 'For weakened vision, combine with Lycium fruit &leftpar;Gou Qi Zi&rightpar;', '', '', '', '');
INSERT INTO single_herbs VALUES (106, 'Cuttlebone', 'Sepia Esculenta Os', 'Hai Piao Xiao', 'Controls Acidity, Stops Diarrhea, Stops Bleeding and Vaginal Discharge, Retains the Essence', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (107, 'Cyathula', 'Cyathula Officinalis Radix', 'Chuan Niu Xi', 'Expels Wind, Drains Dampness, Low Back Pain', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (108, 'Cynanchum', 'Cynanchi Baiqian Radix', 'Bai Qian', 'Redirects the Chi Downward, Expels Phlegm, Wheezing, Coughing, Substitute for Ma Huang', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (109, 'Cynomorium', 'Cynomorium Songaricum Herba', 'Suo Yang', 'Strengthens the Kidneys, Fortifies the Yang, Strengthens Lower Back and Tendons, Impotence, Moistens the Intestines, Unblocks the Bowels', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (110, 'Cyperus', 'Cyperus Rotundus Rhizoma', 'Xiang Fu', 'Spreads Constrained Liver Qi, Regulates the Menstruation, Harmonizes the Liver and Spleen', 'For cold abdominal pain during menstruation', 'For hypochondriac pain and abdominal bloating', 'For painful menstruation combine with curcuma &leftpar;Yu Jin&rightpar;', 'harmonizes emotional mood swings and tightness in the chest', 'For depression and tightness in the chest', 'For emotional agitation and tension', '', '', '');
INSERT INTO single_herbs VALUES (111, 'Dandelion', 'Taraxacuni Mongolicum Herba cum', 'Pu Gong Ying', 'Clears Heat and Toxicity, Reduces Swelling, Clears Boils and Carbuncles, Mastitis, Bacterial Infections', 'When Potassium has been depleted from the use of diuretics', 'For ''milk fever'', painful breasts, and mastitis', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (112, 'Deer Antler', 'Cervi Comu', 'Lu Rong', 'Strengthens the Kidneys, Fortifies the Yang, Strengthens the Tendons and Bones, Infertility', 'For enhancing fertility', 'Enhances fertility and libido', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (132, 'Frankincense', 'Olibanum Gummi', 'Ru Xiang', 'Activates the Blood, Moves the Chi, Reduces Swelling, Relieves Pain, Generates Flesh, Spasms, Injury', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (133, 'Fraxinus &leftpar;Korean Ash&rightpar;', 'Fraxinus Rhynchophylla Cortex', 'Qin Pi', 'Drains Damp/Heat and Liver Fire, Dispels Wind/Damp, Benefits Vision,  Relieves Pain', 'For clearing the liver and benefits the eyes', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (134, 'Fritillaria', 'Fritillaria Cirrhosa Bulbus', 'Chuan Bei Mu', 'Clears Heat, Transforms Phlegm, Dissipates Nodules, Chronic Cough, Tight Chest, Lung or Breast Masses', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (135, 'Fritillaria bulb', 'Fritillaria Verticillata Bulbus', 'Zhe Bei Mu', 'Clears Heat, Transforms Hot Phlelgm, Dissipate Nodules, Lung Abscesses, Breast Masses', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (136, 'Gallus', 'Cornium Gigeria Gallum Endothelium', 'Ji Nei Jin', 'Reduces Food Accumulation, Augments the Spleen, Enuresis, Poor Childhood Development', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (137, 'Gambir', 'Uncaria Rhynchophylla Ramulus et Uncus', 'Gou Teng', 'Dispels Wind, Alleviates Spasms, Drains Liver Fire, Headache, Dizziness, Anxiety, Spasms, Hypertension', 'For short tempered and road rage', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (138, 'Ganoderma &leftpar;Reishi Mushroom&rightpar;', 'Ganodenna Lucidum', 'Ling Zhi', 'Benefits the Chi, Protects the Spirit, Benefits the Joints, Tendons, and Bones, Heart and Lung Tonic', 'For immune enhancement', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (139, 'Gardenia', 'Gardenia Jasminoidis Fructus', 'Zhi Zi', 'Clears Heat, Calms Irritability, Drains Damp/Heat, Cools the Blood, Fever, Bladder Infection, Jaundice', 'For dark colored urine', 'For clearing heat and dampness', 'Clears heat and dries dampness', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (140, 'Gastrodia', 'Gastrodia Elata Rhizoma', 'Tian Ma', 'Soothes the Liver, Dispels Wind, Pain Relief, Spasms, Headache, Dizziness, Numbness, Migraines', 'For headaches and dizziness', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (141, 'Gentiana, scabra', 'Gentiana Scabra Radix', 'Long Dan Cao', 'Drains Damp/Heat and Liver Fire, Eye Infections, Jaundice, Swollen Genitals, Hot Vaginal Discharge', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (142, 'Gentiana, macro.', 'Gentiana Macrophylla Radix', 'Qin Jiao', 'Dispels Wind/Dampness, Relieves Pain, Spasms, Clears Heat, Moistens the Intestines, Jaundice', 'Relaxes the tendons and ligaments', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (143, 'Ginger, dried', 'Zingiber Officinalis Rhizoma', 'Gan Jiang', 'Expels Interior Cold, Augments the Yang, Warms the Spleen and Stomach, Cold Limbs, Weak Digestion', 'For a cold abdomen', 'For nausea and stomach uneasiness', 'For nausea with regurgitation of sour fluids', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (144, 'Ginger, fresh', 'Zingiberis Officinalis Rhizoma', 'Sheng Jiang', 'Induces Sweating, Disperses Exterior Cold, Warms the Spleen and Stomach, Vomiting, Poisoning', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (301, 'Bryonia &leftpar;Homeopathic&rightpar;', 'Bryonia Dioica', '', 'Anti-inflammatory, Analgesic, Anodyne', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (146, 'Ginseng &leftpar;Chinese&rightpar;', 'Panax Ginseng', 'Ji Lin Ren Shen', 'Strengthens the Spleen and Lung Qi, Calms the Spirit, Produces Fluids, Weakness, Heart Tonic, Lowers Blood Sugar and Blood Fat', 'For a weakened heart condition', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (147, 'Ginseng &leftpar;Siberian&rightpar;', 'Eleutherococcus Senticosus Radix', 'Ci Wu Jia', 'Augments the Qi, Strengthens the Spleen and Kidneys, Normalizes Body Functions', 'Adaptogenic agent, prevents depletion', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (148, 'Glehnia', 'Glehnia Radix', 'Sha Shen', 'Moistens the Lungs, Stomach and Skin, Produces Fluids, Clears Heat, For Dry Cough, Mouth and Throat', 'For itchy skin, aggravated by dry cold weather, use with Ophiopogon &leftpar;Mai Men Dong&rightpar;  and Polygonatum &leftpar;Yu Zhu&rightpar;', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (149, 'Gynostemma', 'Gynostemma Pentaphyllum Radix', 'Jiao Gu Lan', 'Strengthens the Qi and Body Functions, Clears Heat and Toxicity, Produces Fluids, Transforms Phlegm', 'Supports the bone marrow', 'For augmenting the immune system, an adaptogenic', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (150, 'Gypsum', 'Gypsum', 'Shi Gao', 'Clears Heat from Lung and Stomach, Drains Fire, Fever, Febrile Diseases, Thick Hot Phlegm', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (151, 'Haliotis &leftpar;Abalone shell&rightpar;', 'Haliotidis Diversicolor Concha', 'Shi Jue Ming', 'Drains Fire, Directs Yang Downward, Benefits Vision, Eye Diseases, Dizziness, Headache', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (152, 'Hoelen', 'Poria Cocus Scierotium', 'Fu Ling', 'Promotes Urination, Strengthens the Spleen, Transforms Phlegm, Edema, Diarrhea, Weak Appetite', 'For water retention and digestive support', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (153, 'Hoelen &leftpar;Fu Shen&rightpar;', 'Poria Cocus Pararadicis Scierotium', 'Fu Shen', 'Similar to Hoelen &leftpar;Fu Ling&rightpar;, Better for Calming the Spirit, Insomnia, Forgetfulness', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (154, 'Ho Shou Wu', 'Polygonum Multiflorum Radix', 'He Shou Wu', 'Nourishes the Kidneys and Liver, Benefits the Semen and Blood, Grey Hair, Lumbago, Reduces Blood Fat', 'For building stronger blood', 'For wind rash', 'For neuropathy', 'For dry skin or loss of hair', '', '', '', '', '');
INSERT INTO single_herbs VALUES (155, 'Houttuynia', 'Houttuynia Cordata Herba cum Radix', 'Yu Xing Cao', 'Clears Heat and Toxicity, Reduces Swellings, Lung Abscesses, Hot Phlegm, Urinary Dysfunctions', 'For abscesses of the lung', 'For hot yellow sputum and abscesses', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (156, 'Imperata', 'Imperata Cylindrica Rhizoma', 'Bai Mao Gen', 'Cools the Blood, Clears Heat, Stops Bleeding, Warm Febrile Diseases, Hot Urinary Dysfunctions, Edema', 'For bloody, painful urination', 'Arrests nose-bleeding', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (157, 'Isatis leaf &leftpar;Wild Indigo&rightpar;', 'Isatis Tinctoria Folium', 'Da Qing Ye', 'Clears Heat and Toxicity, Cools the Blood, Warm Febrile Diseases, Sore Throat, Skin Eruptions', 'For septicemia, combine with Scutellaria', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (158, 'Isatis root', 'Isatidis Tinctoria Radix', 'Ban Lan Gen', 'Drains Heat, Relieves Fire/Toxicity, Cools the Blood, Viral Infections, Warm Febrile Diseases', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (159, 'Jujube', 'Ziziphus Jujuba Fructus', 'Da Zao', 'Augments the Spleen and Chi, Nourishes the Blood, Calms the Spirit, Moderates Harsh Herbs', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (160, 'Juncus', 'Juncus Effusus Medulla', 'Deng Xin Cao', 'Promotes Urination, Clears Heat from the Heart, Sleep Disorders, Insomnia', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (161, 'Laminaria', 'Laminaria Japonica Algae Thallus', 'Kun Bu', 'Resolves Phlegm, Dissipates Nodules in Neck, Reduces Swelling, Promotes Urination', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (162, 'Leonurus &leftpar;Motherwort&rightpar;', 'Leonuri Heterophylli Herba', 'Yi Mu Cao', 'Invigorates the Blood, Regulates the Menstruation, Induces Labor, Abdominal Pain', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (163, 'Licorice', 'Glycyrrhizae Uralensis Radix', 'Gan Cao', 'Strengthens the Spleen and Qi, Produces Fluids, Clears Toxicity, Sore Throat, Boils, Poisoning', 'For abdominal pain and spasms', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (164, 'Licorice, baked', 'Glycyrrhizae Uralensis Radix', 'Zhi Gan Cao', 'Strengthens the Spleen and Stomach, Produces Fluids, Spasms', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (165, 'Ligusticum', 'Ligusticum Sinensis Rhizome et Radix', 'Gao Ben', 'Expels Wind, Relieves Pain, Headache at the Crown of the Head down to Cheeks', 'For headache relief', 'For headache in the occipital region', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (166, 'Ligustrum', 'Ligustrum Lucidum Fructus', 'Nu Zhen Zi', 'Nourishes the Yin, Tones the Liver and Kidneys, Dizziness, Palpitations, Benefits Vision, Tinnitus', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (167, 'Lilly', 'Lilium Brownii Bulbus', 'Bai He', 'Moistens the Lungs, Clears Heat, Dry Cough, Calms the Heart, Insomnia, Restlessness, Irritable', 'Calms the spirit and stops palpitations', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (168, 'Lindera', 'Lindera Stiycbnifolia Radix', 'Wu Yao', 'Moves the Qi, Relieves Pain in Chest and Lower Abdomen, Warms the Kidneys, Urinary Incontinence', 'For hernial disorder', 'For lower abdominal discomfort', 'For abdominal cramping and pain', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (169, 'Lithospernum', 'Lithosperm Erythrorhizon seu Arnebia Inflorescens', 'Zi Cao', 'Clears Heat and Toxicity, Cools the Blood, Vents Rashes, Carbuncles, Moistens the Intestines', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (170, 'Lobelia', 'Lobelia Chinenis, Herba cum Radice', 'Ban Bian Lian', 'Promotes Urination, Edema, Cools the Blood, Clears Toxicity, Insect and Snake Bites', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (171, 'Longan', 'Euphoria Longana Arillus', 'Long Yan Rou', 'Augments the Heart and Spleen, Calms the Spirit, Insomnia, Forgetfullness, Pensive, Stress', 'For nourishing and calming the spirit', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (172, 'Lonicera &leftpar;Honeysuckle&rightpar;', 'Lonicera Japonica Flos', 'Jin Yin Hua', 'Clears Heat, Clears Toxicity, Cools the Blood, Disperses Wind/Heat, Anti-viral, Anti-bacterial', 'For inflammation of the throat', 'For yellow nasal discharge and sinus infection', 'To reduce swelling of carbuncles, combine with Prunella  &leftpar;Xiao Cu Kao&rightpar;', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (173, 'Lophatherum', 'Lophatherum Gracile Herba', 'Dan Zhu Ye', 'Clears Heat, Irritability, Mouth Sores, Thirst, Promotes Urination, Clears Damp/Heat', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (174, 'Loranthus', 'Viscum Coloratum seu Loranthi Ramus', 'Sang Ji Sheng', 'Nourishes the Blood, Expels Wind, Strengthens the Tendons and Bones, Lumbago, Rheumatism, Secure Fetus, Hypertension', 'For weakness in the joints and tendons', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (175, 'Lotus plumule', 'Nelumbinis Nucifera Plumula', 'Lian Zi Xin', 'Drains Heart Fire, Warm Febrile Disease causing Mental Confusion and Delirium, Insomnia, Irritability', 'For mouth sores', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (176, 'Lotus seed', 'Nelumbinis Nucifera Semen', 'Lian Zi', 'Strengthens the Spleen and Kidneys, Diarrhea, Spermatorrhea, Calms the Spirit, Anxiety, Insomnia', 'For anxiety and insomnia', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (177, 'Lotus stamen', 'Nelumbinis Nucifera Stamen', 'Lian Xu', 'Stabilizes the Kidneys, Binds Up the Essence, Clears the Heart, Spermatorrhea, Enuresis, Incontinence', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (178, 'Lycium bark', 'Lycium Chinense Cortex Radicis', 'Di Gu Pi', 'Clears Heat, Cools the Blood, Drains Fire, Chronic Low Grade Fever, Night Sweats, Cough, Bleeding', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (179, 'Lycium fruit', 'Lycium Barbarum Fructus', 'Gou Qi Zi', 'Nourishes the Kidneys, Liver, and Blood, Benefits the Eyes, Lumbago, Diabetes, Seminal Emmisions', 'For weakening vision', 'For dryness of the eyes, combine with Chrysanthemum  &leftpar;Ju Hua&rightpar;', 'For low grade abdominal pain and brightens the eyes', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (180, 'Lygodium spore', 'Lygodium Japonicum', 'Hai Jin Sha', 'Clears Heat and Toxicity, Promotes Urination, Hot Painful Urination, Stones', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (181, 'Lysimachia', 'Lysimachia Christina Herba', 'Jin Qian Cao', 'Promotes Urination, Hot Painful Urination, Stones, Clears Damp/Heat, Jaundice', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (182, 'Magnolia bark', 'Magnolia Officinalis Cortex', 'Hou Po', 'Moves the Chi, Transforms Phlegm, Resolves Stag-nation, Abdominal Fullness, Directs Chi Downward', 'Belching, fullness and abdominal distention, combine with Citrus &leftpar;Chen Pi&rightpar;', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (183, 'Magnolia flower', 'Magnolia Liliflora Flos', 'Xin Yi Hua', 'Expels Wind, Disperses Cold, Opens the Nasal Passages, Headache, Sinusitis', 'For nasal congestion and sinus discharge', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (184, 'Millettia', 'Spatholobus suberectus radix et caulis', 'Ji Xue Teng', 'Moves and Nourishes the Blood, Gynecology, Relieves Pain, Numbness, Paralysis, Leukopenia', 'For bone marrow suppression and leukopenia', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (185, 'Momordica fruit', 'Momordica Grosvenor Fructus', 'Luo Han Guo', 'Clears Lung Heat, Moistens the Intestines, Coughing With Mucous, Whooping Cough, Dry Constipation', 'For whooping cough', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (186, 'Morinda', 'Morinda Officinalis Radix', 'Ba Ji Tian', 'Warms the Kidneys, Strengthens the Yang, Tendons and Ligaments, Impotence, Dizziness, Tinnitus', 'For strengthening the bones and tendons', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (187, 'Morus bark', 'Morus Alba Cortex Radix', 'Sang Bai Pi', 'Stops Cough, Drains Lung Heat, Wheezing, Promotes Urination, Edema in the Upper Body and Extremeities', 'For copious sputum, combine with Trichosanthes Seed&leftpar;Gua Lou Ren&rightpar;', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (188, 'Morus fruit', 'Morus Alba Fructus', 'Sang Shen', 'Nourishes the Blood and Yin, Dizziness, Tinnitus, Insomnia, Greying of Hair, Constipation', 'For dizziness and tinnitus, combine with vitex &leftpar;Man Jing Zi&rightpar;', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (189, 'Morus leaf', 'Morus Alba Folium', 'Sang Ye', 'Expels Wind, Clears Lung Heat, Warm Febrile Diseases, Clears Liver, Benefits the Eyes', 'To clear infections from the lungs', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (190, 'Morus twig', 'Morus Alba Ramulus', 'Sang Zhi', 'Expels Wind, Unblocks the Channels, Relieves Joint Pain in the Upper Body,', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (191, 'Moutan', 'Moutan Cortex Radix', 'Mu Dan Pi', 'Clears Heat, Cools the Blood, Activates the Blood, Clears Fire from Deficiency, Injury, Gynecology', 'For clearing heat from the blood and enhancing circulation, combine with Peony, red &leftpar;Chi Shao Yao&rightpar;', 'For toxic blood and irritability', 'For dark red sores, combine with Peony', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (192, 'Mume', 'Prunus Mume Fructus', 'Wu Mei', 'Seepage of Lung Qi, Stops Cough, Binds the Intestines, Diarrhea, Expels Roundworms', 'For chronic cough', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (193, 'Myrrh', 'Myrrha', 'Mo Yao', 'Activates the Blood, Dispels Blood Stagnation, Relieves Painful Obstructions, Promotes Healing', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (194, 'Oldenlandia', 'Heydyotidis Diffusa Herba', 'Bai Hua She She Cao', 'Clears Heat and Fire Toxicity, Abscesses, Internal Toxic Sores and Swellings, Cancer', 'For difficult, chronic infections', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (195, 'Ophiopogon', 'Ophiopogonis Japonicum Tuber', 'Mai Men Dong', 'Moistens the Lungs, Stops Dry Cough, Moistens the Stomach, Clears Heat, Moistens the Intestines', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (196, 'Oyster shell', 'Ostrea Concha', 'Mu Li', 'Calms the Spirit, Anchors the Yang, Insomnia, Anxiety, Prevents Sweating, Dissipates Nodules', 'For night sweats, combine with Astragalus &leftpar;Huang Qi&rightpar;', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (197, 'Paris', 'Paris Rhizoma', 'Zao Xiu', 'Clears Toxic Heat, Dissipates Nodules, Chronic Viral Diseases, Hepatitis, Cancer, Tonsillitis, Mastitis', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (198, 'Patrinia', 'Herba cum Radice Patrinia Scabiosaefolia', 'Bai Jiang Cao', 'Clears Heat, Relieves Toxicity, Abscesses, Toxic Sores and Swellings, Pain in the Chest and Abdomen', 'For abscesses of the intestinal tract', 'For the mumps', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (199, 'Peony', 'Paeoniae Lactiflorae Radix', 'Bai Shao Yao', 'Nourishes the Blood, Gynecology, Calms the Liver, Spasms, Adjusts the Nutritive and Protective Chi', 'For frequent hunger that is not satisfied', 'For muscle spasms and cramps, combine with Licorice &leftpar;Gan Cao&rightpar;', 'Relaxes and softens the liver', 'Relaxes the liver and relieves irritability', 'For calming and softening rigidity', 'For gnawing hunger', '', '', '');
INSERT INTO single_herbs VALUES (200, 'Peony, red', 'Paeoneae Rubrae Radix', 'Chi Shao Yao', 'Activates Menstruation due to Blood Stagnation, Relieves Pain, Cools the Blood, Reduces Swelling', 'For painful localized inflammation', 'For abdominal pain and tension', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (201, 'Peppermint', 'Mentha Haplocalyx Herba', 'Bo He', 'Disperses Wind/Heat, Clears the Head, Eyes and Throat, Vents Rashes, Activates the Liver Chi', 'For venting of rashes', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (202, 'Persica &leftpar;Peach Kernel&rightpar;', 'Prunus Persica Semen', 'Tao Ren', 'Breaks Up Blood Stagnation, Relieves Localized Pain, Moistens the Intestines, Dry Constipation', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (203, 'Perilla seed', 'Perilla Fruitescens Fructus', 'Zi Su Zi', 'Stops Moist Cough and Wheezing, Transforms Phlegm, Difficult Exhalation, Moistens the Intestines', 'For chronic cough with wheezing', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (205, 'Perilla leaf', 'Perilla Fruitescens Folium', 'Zi Su Ye', 'Releases the Exterior/Cold, Promotes the Movement of Chi, Calms Restless Fetus, Morning Sickness', 'For nausea, vomiting, and poor appetite, combine with Agastache &leftpar;Huo Xiang&rightpar;', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (206, 'Peucedanum', 'Peucedanum Praeruptorum Radix', 'Qian Hu', 'Directs the Qi Downward, Expels Phlegm, Cough and Wheezing due to Phlegm,', 'For thick, yellow sputum', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (207, 'Phellodendron', 'Phellodendri Cortex', 'Huang Bai', 'Drains Damp/Heat from the Lower Body, Drains Kidney Fire, Vaginal Discharge, Night Sweats', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (208, 'Phragmites', 'Phragmitis communis Rhizoma', 'Lu Gen', 'Clears Heat, Produces Fluids, Promotes Urination, Dry Cough, Lung Diseases, Alleviates Thirst', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (209, 'Picrorrhiza', 'Picrorhiza Scrophulariaeflora Rhizoma', 'Hu Huang Lian', 'Drains Damp/Heat, Clears Heat, Yin Deficiency with Heat Signs, Chronic Diarrhea, Dysentery', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (210, 'Pinellia', 'Pinellia Ternata Rhizoma', 'Ban Xia', 'Dries Dampness, Transforms Phlegm, Directs Chi Downward, Relieves Vomiting, Cough, Asthma', 'For nausea or vomiting', 'For chronic excessive phlegm and mucous', 'Resolves phlegm and stops vomiting, combine with Citrus &leftpar;Chen Pi&rightpar; and Ginger, fresh &leftpar;Sheng Jiang&rightpar;', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (211, 'Pine node', 'Pinus Tabulaeformis Lignum Nodi', 'Song Jie', 'Dispels Wind, Dries Dampness, Relieves Pain in Joints, Injury, Arthritis', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (212, 'Plantago seed', 'Plantago Asiatica Semen', 'Che Qian Zi', 'Clears Heat, Drains Dampness, Promotes Urination, Edema, Jaundice, Relieves Cough, Expels Sputum', 'For colored vaginal discharge', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (213, 'Platycodon', 'Platycodon Grandiflorum Radix', 'Jie Geng', 'Supplements the Lung Chi, Expels Sputum, Cough, Sore Throat, Lung Abscess, Pneumonia', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (214, 'Polygala', 'Polygala Tenuifolia Radix', 'Yuan Shi', 'Calms the Spirit, Transforms Phlegm, Forgetfulness, Insomnia, Palpitations, Cough with Mucous', 'For insomnia forgetfulness, and palpitations', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (215, 'Polygonatum, sib.', 'Polygonatum Sibiricum Rhizoma', 'Huang Jing', 'Nourishes the Yin, Heart, and Lungs, Strengthens the Middle Burner and Chi, Benefits the Marrow', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (216, 'Polygonatum, odor.', 'Polygonatum Odoratum Rhizoma', 'Yu Zhu', 'Nourishes the Yin, Produces Fluids, Extinguishes Wind, Dry Mouth, Thirst, Gnawing Hunger', 'For intense hunger, thirst, and constipation', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (217, 'Polygonum', 'Polygonum Aviculare Herba', 'Bian Xu', 'Clears Damp/Heat from the Bladder, Painful Urinary Dysfunction, Stones, Parasites, Stops Itching', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (304, 'Bugleweed', 'Lycopus Virginicus', '', 'BSedative, Astringent, Emphysema, Cough', 'Specific for hyperthyroid', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (218, 'Polygonum vine', 'Polygonum Multiflori Caulis', 'Ye Jiao Teng', 'Nourishes the Heart and Blood, Calms the Spirit, Dream Disturbed Sleep, Pain, Soreness, Numbness', 'For constrained emotions, irritability', 'For releasing pent up emotions', 'For insomnia, dream disturbed sleep', 'For constriction in the chest and insomnia', 'For generalized weakness soreness and numbness of the muscles', 'For nightmares and dream disturbed sleep', '', '', '');
INSERT INTO single_herbs VALUES (219, 'Polyporous', 'Polyporum Umbellatum Sclerotium', 'Zhu Ling', 'Promotes Urination, Seeps Dampness, Edema, Vaginal Discharge, Scanty Urine', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (220, 'Prunella &leftpar;Self-Heal&rightpar;', 'Prunella Vulgaris Spica', 'Xiao Cu Kao', 'Calms the Liver, Clears Heat, Dissipates Nodules, Disperses Congestion, Scrofula, Headache, Boils', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (221, 'Pseudoginseng', 'Panax Notoginseng Radix', 'Tien Chi', 'Arrest Bleeding, Promote Blood Circulation, Swelling, Pain, Injuries', 'To arrest bleeding, combine with Slippery Elm &leftpar;Ulmus Fulva&rightpar;', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (222, 'Pseudostellaria', 'Pseudostellaria Heterophylla Radix', 'Tai Zi Shen', 'Strengthens the Chi, Spleen, and Lungs, Produces Fluids, Fatigue, Shortness of Breath, Cough, Asthma', 'For thirst and strengthening the digestion', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (223, 'Psoralea', 'Psoralea Corylifolia Fructus', 'Bu Gu Zhi', 'Strengthens the Kidneys, Fortifies the Yang, Impotence, Lumbago, Enuresis, Grasps the Qi, Asthma', 'For spermatorrhea, pasty stool', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (224, 'Pteropus', 'Trogopteri seu Pteromi Excrementum', 'Wu Ling Zi', 'Activates the Blood, Relieves Pain, Gynecology, Stops Bleeding', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (227, 'Pulsatilla', 'Pulsatillae Chinensis Radix', 'Bai Tou Weng', 'Clears Heat and Toxicity, Cools the Blood, Relieves Dysentery, Stops Diarrhea', 'For tears of exhaustion and depression', 'Emotionally, when tears are associated with stress', 'For watery eyes and allergies', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (228, 'Purslane', 'Portulaca Oleracea Herba', 'Ma Chi Xian', 'Cools the blood, Clears Damp/Heat, Dysentery, Boils', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (229, 'Pyrrosia', 'Pyrrosia Lingua Folium', 'Shi Wei', 'Clears Damp/Heat, Hot, Painful, Stony and Bloody Urinary Dysfunction, Stops Bleeding', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (230, 'Raphanus &leftpar;Radish seed&rightpar;', 'Raphanus Sativus Semen', 'Lai Fu Zi', 'Reduces Food Accumulation, Directs Chi Downward, Belching, Acid Regurgitation, Foul Breath', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (231, 'Rehmannia, prepared', 'Rehmannia Glutinosa Radix', 'Shu Di Huang', 'Nourishes the Yin and Blood, Anemia, Night Sweats, Diabetes, Seminal Emission, Grey Hair', 'For weakness in the lower body and kidneys', 'For strengthening the kidneys and nourishes the blood', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (232, 'Rehmannia, raw', 'Rehmannia Glutinosa Radix', 'Sheng Di Huang', 'Nourishes the Yin, Drains Fire, Cools the Blood, Moistens the Intestines, Tidal Fever, Bleeding', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (233, 'Rhodiola', 'Rhodiola Rosea', 'Hong Jing Tian', 'Supplements the Chi, Activates the Blood, Clears Heat, Dry Dampness, Stops Bleeding', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (234, 'Rhubarb', 'Rheum Palmatum &leftpar;or Rhei&rightpar; Rhizoma', 'Da Huang', 'Moves Accumulation, Clears Stomach and Intestine Fire, Constipation, Benefits Gall Bladder, Bleeding', 'For clearing of the bowels', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (235, 'Rose Hip', 'Rosa Laevigata Fructus', 'Jin Ying Zi', 'Stabilizes the Kidneys, Binds Up the Essence and Intestines, Spermatorrhea, Incontinence, Prolapse', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (236, 'Rubus &leftpar;Raspberry fruit&rightpar;', 'Rubus Chingii Fructus', 'Fu Pen Zi', 'Augments and Stabilizes the Kidneys, Enuresis, Wet Dreams, Benefits the Vision, Impotence, Lumbago', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (237, 'Salvia', 'Salvia Miltiorrhiza Radix', 'Dan Shen', 'Activates the Blood, Regulates the Menstruation, Clears Heat, Cools the Blood, Insomnia', 'Enhances the circulation of blood, calms the nerves, and cools the blood', 'For stimulating circulation and relieving agitation', 'Invigorates and resolves poor blood circulation', 'promotes circulation and calms the spirit', 'For tightness in the chest and irratability', 'For calming the spirit and improving circulation', '', '', '');
INSERT INTO single_herbs VALUES (238, 'Sanguisorba', 'Sanguisorba Officinalis Radix', 'Di Yu', 'Cools the Blood, Stops Bleeding in Lower Body, Clears Heat, Generates Flesh', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (239, 'Sargassum', 'Sargassum Pallidum Herba', 'Hai Zao', 'Clears Heat and Reduces Phlegm Nodules, Goiter, Promotes Urination, Edema, Pain from Hernia', 'Resolves phlegm, softens masses', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (240, 'Saussurea', 'Aucklandia Lappa or Saussurea Lappa Radix', 'Mu Xiang', 'Promotes Circulation of Qi, Disperses Accumulation, Abdominal Distention and Pain, Diarrhea', 'For abdominal distention and bloating', 'For fullness after eating very little', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (241, 'Schizandra', 'Schisandra Chinensis Fructus', 'Wu Wei Zi', 'Nourishes Kidney Yin, Inhibits Leakage of Lung Qi, Produces Fluids, Calms the Spirit, Excess Sweating, Asthma, Diarrhea, Liver Disease', 'Quiets the spirit and calms the heart', 'For early morning diarrhea', 'For night sweats or spontaneous sweating', 'For shortness of breath and night sweats', 'For wheezing and calming', '', '', '', '');
INSERT INTO single_herbs VALUES (508, 'Lady''s Slipper', 'Cypripedium Pubescens', '', 'Antispasmodic, Nervine, Tonic, Headache, Neuralgia', 'For post-concussion syndrome', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (242, 'Schizonepeta', 'Schizonepeta Tenuifolia Herba seu Flos', 'Jing Jie', 'Releases the Exterior, Expels Wind, Vents Rashes, Alleviates Itching, Carbuncles, Boils', 'For obstructed phlegm with cough', 'For itchy, dry skin', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (243, 'Scrophularia', 'Scrophularia Ningpoensis Radix', 'Xuan Shen', 'Clears Heat, Nourishes the Yin, Drains Fire, Clears Toxicity, Swollen Glands, Sore Throat, Carbuncles', 'For fever and swollen glands', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (244, 'Scute', 'Scutelaria Baicalensis Radix', 'Huang Qin', 'Clears Heat and Drains Fire, Clears Damp/Heat in Stomach or Intestines, Bleeding, Calms the Fetus', 'For cough with yellow mucous', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (245, 'Scutellaria', 'Scutellaria Barbata Herba', 'Ban Zhi Lian', 'Clears Heat, Relieves Toxicity, Activates the Blood, Reduces Swellings, Hepatitis, Cancer', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (246, 'Sesame seed, black', 'Sesamum Indicum Semen', 'Hei Zhi Ma', 'Nourishes the Liver and Kidneys, Moistens the Body Tissues, Constipation, Promotes Lactation', 'For lubricating the intestines, combine with Ophiopogon &leftpar;Mai Men Dong&rightpar;', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (247, 'Siler', 'Ledebouriella Sesloides Radix', 'Fang Feng', 'Expels Wind/Dampness, Releases the Exterior, Relieves Pain, Headaches, Rheumatism', 'For joint pain and fatigue', 'For joint aches and pain during a febrile disease', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (248, 'Sophora', 'Sophora Flavescentis Radix', 'Ku Shen', 'Clears Heat, Dries Dampness, Nourishes the Yin, Urination Difficulty, Use Caution with Weak Persons', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (249, 'Sparganium', 'Sparganium Stoloniferum Rhizoma', 'San Leng', 'Strongly Activates the Blood, Moves the Chi, Masses, Gynecology, Severe Abdominal Pain', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (250, 'Stemona', 'Stemona Sessilifolia Radix', 'Bai Bu', 'Moistens the Lungs, Suppresses Cough, Chronic Bronchitis, Tuberculosis, Whooping Cough, Lice', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (251, 'Swallowwort root', 'Cynanchum Atratum Radix', 'Bai Wei', 'Relieves Toxicity, Clears Heat, Cools the Blood, Toxic Sores, Snake Bites,', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (252, 'Talc', 'Talcum', 'Hua Shi', 'Promotes Urination, Drains Heat from the Bladder, Hot Painful Urinary Dysfunction', 'Drains vigorous heat and alleviates burning urination', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (302, 'Buchu', 'Barosma Betulina', '', 'Diuretic, Bladder and Kidney Tonic, Inflammation', 'Releases toxins via the kidneys and bladder', 'For additional tonic effect on the bladder and kidneys', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (303, 'Buckthorn bark', 'Rhamnus Frangula', '', 'Laxative, Cathartic, Tonic', 'For additional cleansing activity', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (253, 'Tang Kuei', 'Angelica Sinensis, Corpus Radix', 'Dang Gui', 'Nourishes the Blood, Invigorates the Blood, Regulates the Menstruation, Abdominal Pain, Gynecology', 'For weak and tired blood, fatigue', 'Nourishes the blood and calms the heart', 'For fatigue and weak blood, and calms the heart', 'For blood deficiency and coughing at night', 'For replenishing the blood', '', '', '', '');
INSERT INTO single_herbs VALUES (254, 'Tangerine peel', 'Citrus Reticulata Pericarpium Rubrum', 'Ju Hong Pi', 'Redirects the Chi Downward, Transforms Phlegm, Dries Dampness, Vomiting, Belching, Wet Coughs', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (255, 'Torryea seed', 'Torreya Grandis Semen', 'Fei Zi', 'Kills Parasites', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (256, 'Tribulus', 'Tribuli Terrestris Fructus', 'Bai Ji Li', 'Calms the Liver, Anchors the Yang, Benefits the Eyes, Dispels Wind, Promotes Lactation, Stops Itching', 'To alleviate itching', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (257, 'Trichosanthes fruit', 'Trichosanthes Kirilowii Fructus', 'Gua Lou', 'Clears Lung Heat, Transforms Hot Phlegm, Dissipates Nodules, Cough with Thick Sputum, Abscesses', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (258, 'Trichosanthes peel', 'Trichosanthes Kirilowii Fructus Pericarpium', 'Gua Lou Pi', 'Clears Lungs, Transforms Phlegm, Regulates the Chi, Dry Cough and Throat, Very Sticky Sputum', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (259, 'Trichosanthes root', 'Trichosanthes Kirilowii Radix', 'Tian Hua Fen', 'Clears and Drains Lung and Stomach Heat, Abscesses', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (260, 'Trichosanthes seed', 'Trichosanthes Kirilowii Semen', 'Gua Lou Ren', 'Clears Lungs and Transforms Hot Phlegm, Cools and Moistens the Lungs and Intestines, Dry Constipation', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (261, 'Turmeric', 'Curcuma Longa Rhizoma', 'Jiang Huang', 'Activates the Blood, Gynecology, Relieves Pain, Injury, Moves the Qi, Expels Wind, for Shoulders', 'For pain in the shoulders and upper body', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (262, 'Typha &leftpar;Cattail pollen&rightpar;', 'Typha Angustifolia & Latifolia Pollen', 'Pu Huang', 'Arrests Bleeding, Activates the Blood, Dysmenorrhea, Relieves Pain in the Lower Abdomen, Dizziness', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (263, 'Vaccaria', 'Vaccaria Segetalis Semen', 'Wang Bu Liu Xing', 'Activates the Blood, Promotes Lactation, Unblocks Menstruation, Painful Breasts and Testicles', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (264, 'Violet &leftpar;Viola&rightpar;', 'Viola Yedoensis Herba Cum Radix', 'Zi Hua Di Ding', 'Clears Heat, Relieves Fire Toxicity, Scrofula, Swollen Eyes, Mumps, Sore Throat, Earache, Abscesses', 'For boils and inflamed skin pores', 'For boils and hard carbuncles', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (265, 'Vitex', 'Viticum Fructus', 'Man Jing Zi', 'Disperse Wind/Heat, Headache, Eye Pain, Excessive Tearing, Swollen Eyes', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (266, 'Wild Indigo &leftpar;Baptisia&rightpar;', 'Indigo Pulverata Levis', 'Qing Dai', 'Clears Heat, Relieves Toxicity, Cools the Blood, Disperses Swellings, Sore Throat, Mumps', 'For chronic infections, clears toxic heat', 'Clears toxicity from the blood and disperses swelling', 'If indications of infection are present', 'For stubborn infections', '', '', '', '', '');
INSERT INTO single_herbs VALUES (267, 'Xanthium', 'Xanthii Caulis et Folium', 'Cang Er Zi', 'Disperses Wind, Dispels Dampness, Opens the Nasal Passages, Headache back of Neck, Sinusitis', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (268, 'Zedoaria', 'Curcuma Zedoaria Rhizoma', 'E Zhu', 'Breaks Up Blood Stagnation, Moves the Chi, Gynecology, Abdominal Masses, Relieves Pain', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (269, 'Zizyphus', 'Zizyphus Spinosa Semen', 'Suan Zao Ren', 'Nourishes the Heart and Liver Blood, Calms the Spirit, Insomnia, Palpitations, Excess Sweating', 'For palpitations and insomnia', 'For insomnia, anxiousness, combines well with Hoelen &leftpar;Fu Shen&rightpar;', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (270, 'Aconite &leftpar;Homeopathic&rightpar;', 'Acontium Napellus', '', 'Anti-inflammatory, Analgesic, Relaxant', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (271, 'Agrimony, Western', 'Agrimonia Eupatoria', '', 'Tonifies Digestive Tract, Clears Heat and Mucous', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (272, 'Aloe Vera, Western', 'Aloe Vera Herba', '', 'Purgative, Anthelmintic, Lower Bowel', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (273, 'Angelica', 'Angelica Archangelica', '', 'Aromatic, Carminative, Restoring, Warming, Relaxant', 'Digestive support for the weak or elderly', 'For additional warming of the the kidneys and digestive system', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (274, 'Arnica', 'Arnica Montana', '', 'Vulnerary, Stimulant, Bruising &leftpar;NOT ON BROKEN SKIN&rightpar;', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (275, 'Arrowroot', 'Maranta Arundinacea', '', 'Demulcent, Nutritive, Vulnerary', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (276, 'Asafoetida', 'Ferula Asafoetida', '', 'Antispasmodic, Calms Gastric Irritation', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (277, 'Ashwaganda', 'Withania Somnifera', '', 'Adaptogenic Tonic, Nervine, Aphrodisiac', 'For stress, fatigue, and burn out', 'For exhaustion due to continued stress', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (278, 'Balm of Gilead', 'Populus Balsamifera', '', 'Clears Mucous, Respiratory Affections', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (279, 'Barberry', 'Berberis Vulgaris', '', 'Tonic, Antiseptic, Clears Liver, Mild Purgative', 'For additional clearing of the liver and stimulating the bowels', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (280, 'Basil', 'Ocimum Basilicum', '', 'Aromatic, Carminative, Cooling, Nervine, Vermifuge', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (281, 'Bayberry', 'Myrica Cerifera', '', 'Astringent, Tonic, Circulatory Tonic, Digestive Aid', 'Astringent tonic effect on the GI tract and improved blood circulation', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (283, 'Bellis &leftpar;Daisy&rightpar;', 'Bellis Perennis', '', 'Vulnerary, Clears Eyes, Heals Wounds, Conjunctivitis', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (284, 'Benzoin', 'Styrax Benzoin', '', 'Healing, Cleansing to Wounds, Sores', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (285, 'Beth Root', 'Trillium Erectum', '', 'Astringent Tonic, Female Prolonged Bleeding', 'Specific for continuous uterine spotting', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (286, 'Bilberry', 'Vaccinium Myrtillus', '', 'Astringent, Cooling, Strengthens Eyes', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (287, 'Bistort', 'Polygonurn Bistorta', '', 'Astringent For Hemorrhage, Loose Teeth, Gum Disease', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (288, 'Black Cohosh', 'Cimicufuga Racemosa', '', 'Menopause, Hot Flashes, Astringent, Trapezius Pain', 'Promotes labor, use only if labor is overdue', 'For hot flashes, sore muscles', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (289, 'Black Haw', 'Viburnum Prunifolium', '', 'Antispasmodic, Prevents Miscarriage', 'specific for habitual miscarriage', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (290, 'Black Walnut', 'Juglans Nigra', '', 'Alterative, Detergent, Vermifuge, Depurative', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (291, 'Black Willow', 'Salyx Nigra', '', 'Sexual Sedative, Spermatorrhea', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (292, 'Blackberry root', 'Rubus Villosus', '', 'Astringent, Tonic, Diarrhoea, Dysentery', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (293, 'Bladderwrack', 'Fucus Vesiculosus', '', 'Clears Lymph, Tones Thyroid, Obesity, Hypothyroidism', 'Specific for hypothyroid', 'For clearing action and tonic', 'Protects the thyroid from radiation', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (294, 'Bloodroot', 'Sanguinaria Canadensis', '', 'Stimulant, Tonic, Expectorant', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (295, 'Blue Cohosh', 'Caulophyllum Thalictroides', '', 'Promotes Partuition, Birthing Aid', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (296, 'Blue Flag', 'Iris Versicolor', '', 'Alterative, Diuretic, Carminative, Bilious Headache', 'For digestive headaches', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (297, 'Boldo', 'Peumus Boldus', '', 'Clears Liver and Gallbladder, Useful for Obesity', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (298, 'Boneset', 'Eupatorium Perfoliatum', '', 'Diaphoretic, Febrifuge, Fevers and Influenza, Body Aches', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (299, 'Borage', 'Borago Officinalis', '', 'Lifts the Spirit, Supports Adrenals and Heart, Allays Fears', 'For enhancing the will power, courage', 'For strengthening the kidneys and adrenal glands', 'To help promote inner courage and strengthen the adrenal cortex', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (300, 'Borax', 'Boron', '', 'Decongestant, Throat mucous, Promotes Hair growth', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (305, 'Burdock root', 'Arctium Lappa', '', 'Aterative, Diuretic, Blood Purifier', 'For blood purification', 'For cleansing of the blood', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (306, 'Butcher''s Broom', 'Butchers Broom', '', 'Deobstruent, Aperient, Diuretic, Diaphoretic, Obesity', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (307, 'Butterbur', 'Petasites Japonica', '', 'Cardiac Tonic, Diuretic, Stimulant', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (308, 'Cactus Grandiflorus', 'Cereus Grandiflorus', '', 'Cardiac Tonic, Angina, Palpitation, Neuralgia of the Heart', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (309, 'Cajeput', 'Melaleuca Cajeputii', '', 'Stimulant, Antispasmodic, Diaphoretic, Analgesic', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (310, 'Calendula', 'Calendula Officinalis', '', 'Vulnerary, Anti-fungal, Healing Wounds and Ulcers', 'Specific for measles', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (311, 'Camphor', 'Cinnamonum Camphora', '', 'Sedative, Anodyne, Anthelmintic, Antispasmodic', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (312, 'Cascara Sagrada', 'Rhamnus Purshiana', '', 'Laxative, Tonic, Constipation, Dyspepsia', 'For sluggish bowels and constipation &leftpar;use for short term only&rightpar;', 'For sluggish bowels &leftpar;use for short term&rightpar;', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (313, 'Cats Claw', 'Uncaria Tomentosa', '', 'Alterative, Deobstruent, Depurative, Anti-arthritic', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (314, 'Catnip', 'Nepata Cataria', '', 'Carminative, Tonic, Diaphoretic, Refrigerant', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (315, 'Catuaba', 'Erythroxylum Catuaba', '', 'Nervine, Tonic, Sedative, Mental Stimulant, Aphrodisiac', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (316, 'Cayenne', 'Capsicum Frutes', '', 'Heating, Stimulant, Equalizes Circulation', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (317, 'Celandine, Greater', 'Chelidonium Majus', '', 'Alterative, Clears Liver and Gallbladder, Gallstones', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (318, 'Centuary', 'Centaurium Erythraea', '', 'Aromatic, Nutritive, Tonic, Digestive Support', 'A digestive stimulant, promotes bile function', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (319, 'Chamomile, German', 'Matricaria Recutita', '', 'Sedative, Tonic, Fractious Irritability, Teething Babies', 'Soothes and calms the baby', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (320, 'Chamomile, Roman', 'Anthemis Nobilis', '', 'Harmonizes Digestion, Relaxant, Tonic, Nervine', 'For a nervous stomach and poor digestion', 'Calms the nerves, quiets the stomach', 'For ''milk fever'', painful breasts and mastitis', 'For general tonic qualities and nerve strengthening', 'For calming and upset stomach', 'Digestive aid and calming', '', '', '');
INSERT INTO single_herbs VALUES (321, 'Chaparral', 'Larrea Mexicana', '', 'Anti-inflammatory, Anodyne, Cleansing', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (322, 'Chaste Tree Berry', 'Vitex Agnus-Castus', '', 'Restorative, Female Hormonal Balancer', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (323, 'Chickweed', 'Stellaria Media', '', 'Demulcent, Vulnerary, Reduces Appetite, Heals Wounds', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (324, 'Cinchona', 'Cinchona Calisaya', '', 'General Tonic in Debility, Intermittant Fevers, Malaria', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (325, 'Clavo Huasco', 'Tynanthus Panurensis', '', 'Aphrodisiac, Tonic, Nervine', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (326, 'Cleavers', 'Galium Aparine', '', 'Diuretic, Tonic, Clearing to Kidneys, Blood and Lymph', 'For diuretic and lymphatic cleansing', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (327, 'Coltsfoot, Western', 'Tussilago Farfara', '', 'Expectorant, Demulcent, Clears Cough and Mucous', 'For chronic cough', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (329, 'Comfrey leaf', 'Symphytum Officinale', '', 'Vulnerary, Styptic, Heals Wounds and Bones, Bruises', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (330, 'Comfrey root', 'Symphytum Officinale', '', 'Vulnerary, Demulcent, Astringent, Nutritive', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (331, 'Corn Silk, Western', 'Zea Mays', '', 'Demulcent, Diuretic, Bladder Affections, Cystitis', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (332, 'Cotton Root', 'Gossypium Herbaceum', '', 'Emmenagogue, Parturient, Oxytocic', 'Promotes labor, use only if labor is overdue', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (333, 'Couch Grass', 'Agropyron Repens', '', 'Diuretic, Demulcent, Cystitis, Arthritis and Rheumatism', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (334, 'Cowslip', 'Primula Veris', '', 'Sedative, Antispasmodic, Insomnia, Restlessness', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (335, 'Cramp Bark', 'Viburnum Opulus', '', 'Antispasmodic, Nervine, Cramps, Convulsions, Spasms', 'For spasms and muscular cramps', 'For spasms in throat or muscles', 'For abdominal cramps, combine with Wild Yam &leftpar;Dioscorea Villosa&rightpar;', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (336, 'Cranesbill, American', 'Geranium Maculatum', '', 'Styptic, Astringent, Tonic, Diarrhea, Bleeding', 'Astringent, stops excess bleeding', 'For additional astringent and toning actions', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (337, 'Crawley Root', 'Corallorhiza Odontorhiza', '', 'Diaphoretic, Sedative, Febrifuge, Fevers, Influenza', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (338, 'Culver', 'Leptandra Virginica', '', 'Hepatic, Antiseptic, Aperient, Clears Liver and Bowel', 'For gentle clearing action of liver and bowel', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (339, 'Damiana', 'Turnera Diffusa', '', 'Aphrodisiac, Diuretic, Nervine, Tonic', 'A nerve tonic with aphrodisiac qualities', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (340, 'Dandelion, Western', 'Taraxacum Officinale', '', 'Diuretic, Aperient, Clears Liver, Kidneys and Bowel', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (341, 'Devils Claw', 'Harpagophytum Procumbens', '', 'Osteoarthritis, Anti-inflammatory, Digestive, Vulnerary', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (342, 'Millettia', 'Spatholobus suberectus radix et caulis', 'Ji Xue Teng', 'Moves and Nourishes the Blood, Gynecology, Relieves Pain, Numbness, Paralysis, Leukopenia', 'For bone marrow suppression and leukopenia', 'For soreness in the joints', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (343, 'Elder Flowers', 'Sambucus Nigra', '', 'Alterative, Diuretic, Diaphoretic, Colds, Influenza, Fevers', 'If fever is present, take as a hot infusion', 'For eye inflammation with sinusitis', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (344, 'Elecampane', 'Inula Helenium', '', 'Expectorant, Diaphoretic, Clears Mucous, Cough, Colds', 'For lung infections and mucous congestion', 'For deep seated mucous', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (345, 'Euphorbia', 'Euphorbia Pilulifera', '', 'Anti-asthmatic, Pectoral, Cough, Asthma', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (346, 'Eyebright', 'Euphrasia Officinalis', '', 'Tonic, Astringent, Hayfever, Eye Affections', 'For watery eyes', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (347, 'False Unicorn', 'Chamaelirium Luteum', '', 'Tonic, Diuretic, Restorative, Female Reproductive Tonic', 'For prolapsed uterus and bladder in women', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (348, 'Fennel, Western', 'Foeniculum Vulgare', '', 'Carminative, Stomachic, Digestive Aid, Intestinal Gas', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (349, 'Fenugreek', 'Trigonella Foenum-Graecum', '', 'Carminative, Aromatic, Digestive Aid, Clears Mucous', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (350, 'Feverfew', 'Tanacetum Parthenium', '', 'Carminative, Digestive Aid, Headache, Migraine', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (351, 'Figwort', 'Scrophularia Nodosa', '', 'Depurative, Anodyne, Clears Blood and Lymph', 'For blood and lymph cleansing, resolves lumps', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (352, 'Fringe Tree Bark', 'Cheonanthus Virginicus', '', 'Alterative, Diuretic, Clears Liver, Kidneys and Blood', 'For additional cleansing of the liver', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (353, 'Garlic', 'Allium Sativum', '', 'Antiseptic, Expectorant, Diaphoretic, Coughs, Colds', 'To clear toxic/heat', 'Prophylactic for flu and contagious diseases', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (354, 'Gelsemium', 'Gelsemium Sempervirens', '', 'Antispasmodic, Anodyne, Sedative, Nerve Pain', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (355, 'Gentian, Western', 'Gentiana Lutea', '', 'Tonic, Bitter, Restorative, Weakness, Debility, Anemia', 'For debility, weakness, poor nutrient assimilation', 'For poor circulation due to inadequate diet or impaired nutritional assimilation', 'For improved nutritional assimilation and anemia', 'For additional digestive and assimilation qualities', 'A digestive and liver tonic', 'Boosts the energy and cleanses the liver', 'To help nursing mother''s nutritional absorption and blood quality', 'General body tonic and improves digestion', '');
INSERT INTO single_herbs VALUES (356, 'Ginkgo leaf', 'Ginkgo Biloba', '', 'Circulatory, Pulmonary, Cough, Mucous, Tinnitus, Memory', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (357, 'Goat''s Rue', 'Galega Officinalis', '', 'Galactagogue, Vermifuge, Promotes Milk, Clears Worms', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (358, 'Golden Rod', 'Solidago Virgaurea', '', 'Aromatic, Carminative, Digestive Aid, Hepatic', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (359, 'Goldenseal', 'Hydrastis Canadensis', '', 'Tonic, Detergent, Restorative to Immune System, Cleanser', 'Promotes labor, use only if labor is overdue', 'For immune support and nourishment of the mucous membranes', 'For toning of the intestinal mucous membranes', 'To tone the internal tissues', 'For irritated mucous membranes', '', '', '', '');
INSERT INTO single_herbs VALUES (360, 'Gotu Kola', 'Hydrocotyle Asiatica', '', 'Tonic, Mental and Physical Fatigue, Aids Brain Function', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (361, 'Grindelia', 'Grindelia Robusta', '', 'Anti-asthmatic Tonic, Whooping-Cough, Asthma, Spleen Support', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (362, 'Guaiacum', 'Guaiacum Officinale', '', 'Alterative, Arthritis Specific, Clears Blood', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (363, 'Harakeke', 'Phormium Tenax', '', 'Vulnerary, Astringent, Emmenagogue, Anti-fungal', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (364, 'Hawthorn berry', 'Crataegus Spp.', '', 'Cardiac, Tonic, High Blood Pressure, Heart Conditions', 'For edema due to a weakened heart', 'For debility and weakness due to a weak heart', 'For cough and a weakened heart condition', 'Nurtures the physical and spiritual heart', '', '', '', '', '');
INSERT INTO single_herbs VALUES (365, 'Heartsease', 'Viola Tricolor', '', 'Diaphoretic, Diuretic, Palpitations, Clears Mucous', 'For heart palpitations', 'For palpitations and emotional agitation', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (366, 'Holy Thistle', 'Cnicus Benedictus', '', 'Tonic, Galactagogue, Promotes Milk Supply, Digestive', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (367, 'Hops', 'Humulus Lupulus', '', 'Sedative, Tonic, Anodyne, Indigestion, Insomnia, Debility', 'For nervous dyspepsia', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (368, 'Horehound', 'Marrubium Vulgare', '', 'Tonic, Expectorant, Coughs, Colds, Loss of Appetite', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (369, 'Horopito', 'Pseudowintera Colorata', '', 'Anodyne, Anti-fungal, Analgesic, Alterative, Depurative', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (370, 'Horse Chestnut', 'Aesculus Hippocastanum', '', 'Tonic, Astringent, Anodyne, Painful Hemorrhoids, Specific', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (371, 'Horseradish', 'Cochlearia Armoracia', '', 'Stimulant, Diaphoretic, Diuretic, Digestive Aid, Sinusitis', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (372, 'Horsetail', 'Equisetum Arvense', '', 'Diuretic, Astringent, Heals Wounds, Stops Bleeding', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (373, 'Hydrangea', 'Hydrangea Arborescens', '', 'HDiuretic, Nephritic, Removes Stone and Gravel', 'For painful swollen joints, especially knees', 'For clearing action and diuretic', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (374, 'Ipecacuanha', 'Cephaelis Ipecacuanha', '', 'Emetic, Expectorant, &leftpar;Homeopathic  Anti-Emetic&rightpar;', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (375, 'Jaborandi', 'Pilocarpus Spp.', '', 'Stimulant, Deobstruent, Asthma, Diabetes, Clears Lymph', 'For the mumps', 'For chronic lymph swelling and mumps', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (376, 'Jamaica Dogwood', 'Piscidia Piscipula', '', 'Anodyne, Sedative, Eases Pains, Promotes Sleep', 'For additional pain relief in all conditions; combine with White Willow Bark &leftpar;Salix Alba&rightpar;', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (377, 'Jambul', 'Eugenia Jambolana', '', 'JaAstringent, Diuretic, Diabetes, Specific Reduces Sugar', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (378, 'Juniper Berry', 'Juniperus Communis', '', 'Diuretic, , Stimulant, Carminative, Kidney Complaints', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (379, 'Kapikachu', 'Mucuna Pruriens', '', 'Aphrodisiac, Nervine, Tonic, Anthelmintic, Sexual Aid', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (380, 'Karamu', 'Coprosma Robusta', '', 'Diuretic, Anti-inflammatory, Febrifuge, Antibilious', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (381, 'Kareao', 'Ripogonum Scandens', '', 'Diuretic, Alterative, Depurative, Vulnerary', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (382, 'Kauri', 'Agathis Vitiensis', '', 'Tonic, Relaxant, Strengthens Body and Mind', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (383, 'Kava Kava &leftpar;Fiji&rightpar;', 'Piper Methysticum', '', 'Tonic, Diuretic, Nocturnal Incontinence, Muscular Tonic', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (384, 'Kawa Kawa &leftpar;New Zealand&rightpar;', 'Piper Methysticum', '', 'Aphrodisiac, Alterative, Tonic, Depurative', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (385, 'Kohe Kohe', 'Dysoxylum Spectabile', '', 'Pectoral, Tonic, Alterative, Astringent, Fevers, Clearing', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (386, 'Kola Vera', 'Kola Vera', '', 'Nerve Stimulant, Cardiac Tonic, Low Blood Pressure', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (387, 'Koromiko', 'Hebe Salicifolia', '', 'Astringent, Tonic, Diarrhoea, Dysentry', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (388, 'Kowhai', 'Sophora Microphylla', '', 'Tonic, Alterative, Vulnerary, Analgesic, Anti-fungal', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (389, 'Kumarahoe', 'Pomaderris Kum', '', 'Alterative, Pectoral, Asthma, Bronchitis, Tuberculosis', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (390, 'Lady''s Mantle', 'Alchemilla Vulgaris', '', 'Astringent, Styptic, Reduces Excessive Female Bleeding', 'Helps to balance the female hormones and regulates menstruation', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (391, 'Lady', 'Cypripedium Pubescens', '', 'Antispasmodic, Nervine, Tonic, Headache, Neuralgia', 'For post-concussion syndrome', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (392, 'Lavender', 'Lavendula Officinale', '', 'Stimulant, Carminative, Aromatic', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (393, 'Lemon', 'Citrus Limonum', '', 'Tonic, Refrigerant, Antiscorbutic, Antibilious, Fevers', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (394, 'Lemon Balm', 'Melissa Officinalis', '', 'Carminative, Diaphoretic, Sedative, Insomnia, Fevers', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (395, 'Leptotaenia', 'Lomatium dissecutim', '', 'Anti-viral, Pneumonia, Flu, Colds, Bronchitis, Herpes', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (396, 'Life Root', 'Senecio Aureus', '', 'Emmenagogue, Diuretic, Tonic, Suppressed Menstruation', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (397, 'Lilly-of-the-Valley', 'Convallaria Majalis', '', 'Cardiac Tonic, Diuretic, Valvular Heart Disease', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (398, 'Lime Flower', 'Tilia Europea', '', 'Nervine, Relaxant, Headache, High Blood Pressure', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (399, 'Lobelia, Western', 'Lobelia Inflata', '', 'Anti-asthmatic, Expectorant, Emetic, Spasmodic Cough', 'Specific for tobacco addiction', 'Use sub-lingually, for spasmodic cough', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (400, 'Lungwort', 'Pulmonaria Officinalis', '', 'Astringent, Mucilaginous, Pectoral, Cough, Heals Lungs', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (401, 'Maca', 'Lepidium Meyenii', '', 'Aphrodisiac, Tonic, Steroidal, Nutritive', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (402, 'Manawa', 'Tradescan Tia Fluminensis', '', 'Relaxant, Tonic, Promotes sense of wellbeing &leftpar;Homepathic&rightpar;', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (403, 'Mandrake, American', 'Podophyllum Peltatum', '', 'Purgative, Antibilious, Liver Dysfunction, Constipation', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (404, 'Marshmallow', 'Althea Officinalis', '', 'Demulcent, Emollient, Anti-inflammatory, Soothing', 'Softens and moistens the inner tissues', 'Brings relief to the bronchial tubes and irritated mucous membranes', 'For lubrication of the mucous membranes', 'Soothes and balances he mucous membranes of the GI tract', '', '', '', '', '');
INSERT INTO single_herbs VALUES (405, 'Matai', 'Prumnopitys Traxilohia', '', 'Antiseptic, Pulmonary, Anodyne, Stomachic', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (406, 'Meadowsweet', 'Filipendula Ulmaria', '', 'Astringent, Diuretic, Aromatic, Balances Acidic Levels', 'For associated over-acidic conditions', 'For balancing the pH of the body', 'For pain and is an antacid', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (407, 'Melilot', 'Melilotus Officinalis', '', 'Venous Tonic, Varicose Veins, Raynauds, Digestive', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (408, 'Mezereum &leftpar;Homeopathic&rightpar;', 'Daphne Mezereum', '', 'Anti-inflammatory, Arthritis, Eczema, Skin Ulcers', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (409, 'Milk Thistle', 'Silybum Marianum', '', 'Hepatic, Tonic, Restorative, Clears and Restores Liver', 'For liver cleansing and restorative', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (410, 'Mistletoe &leftpar;European&rightpar;', 'Viscum Album', '', 'Nerve Tonic, Antispasmodic, Stress, Epilepsy', 'Alleviates stress, a factor in asthma attacks', 'For nourishing the nervous system, especially those who eat their stress', 'For emotions that are stored, held-in', 'For anxiety and stress', '', '', '', '', '');
INSERT INTO single_herbs VALUES (411, 'Motherwort, Western', 'Leonurus Cardiaca', '', 'Antispasmodic, Tonic, Nervine, Clears Melancholy', 'Emotionally, softens a hardened heart', 'Relaxes tension from stress, calming', 'For melancholy and sadness', 'For a calm spirit and happy thoughts', '', '', '', '', '');
INSERT INTO single_herbs VALUES (412, 'Muira Puama', 'Liriosma Ovata', '', 'Aphrodisiac, Nerve Stimulant', 'For weak libido and strengthens the nerves', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (413, 'Mullein', 'Verbascum Thapsus', '', 'Demulcent, Astringent, Pectoral, Sinusitis, Earache', 'Clears mucous from the head region', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (414, 'Myrrh, Western', 'Commiphora Myrrha', '', 'Healing Agent, Antiseptic, Mouth Ulcers, Sore Throat', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (415, 'Nettles', 'Urtica Spp.', '', 'Diuretic, Astringent, Blood Tonic, Anaemia, Poor Apetite', 'For anemia and a weak appetite', 'For blood cleansing, burning pains, and inflammation', 'For weak blood, anemia', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (416, 'Oak Bark', 'Quercus Spp.', '', 'Strong Astringent, Mild Tonic, Dysentry, Alcohol Abuse', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (417, 'Oats, wild', 'Avena Sativa', '', 'Nerve Tonic, Restorative, Exhaustion, Antispasmodic', 'A nerve tonic and supplements the energy', 'For support of the nervous system', 'For nervous system support and physical exhaustion', 'Restorative, fortifies the nerves', 'Helps restore the body and nervous system', 'To support the nervous system, when exhausted from pain', 'To support the nervous system, when exhausted from dealing with pain', 'For exhaustion and general fatigue', 'For nervous exhaustion');
INSERT INTO single_herbs VALUES (418, 'Orange', 'Citrus Sinensis', '', 'Aromatic, Carminative, Tonic, Stomachic', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (419, 'Oregon Grape', 'Mahonia Aquifolium', '', 'Alterative, Tonic, Hepatic, Scaly Skin Disorders', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (420, 'Osha &leftpar;Bear root&rightpar;', 'Ligusticum Porteri', '', 'Alterative, Diaphoretic, Respiratory Affections, Protection', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (421, 'Parsley Piert', 'Alchemilla Arvensis', '', 'Demulcent, Diuretic, Kidney Pain, Gravel and Stone', 'For assistance with gravel or stones', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (422, 'Parsley Piert', 'Alchemilla Arvensis', '', 'Demulcent, Diuretic, Kidney Pain, Gravel and Stone', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (423, 'Passion Flower', 'Passiflora Incarnata', '', 'Antispasmodic, Sedative, Insomnia, Anxiety', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (424, 'Pau D''arco', 'Tabebuia Avellanedae', '', 'Alterative, Depurative, Anti-Inflammatory, Astringent', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (425, 'Peach Leaf', 'Prunus Persica', '', 'Clears Congestion, Hepatic, Diuretic, Expectorant', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (426, 'Pennyroyal', 'Mentha Puligeum', '', 'Insecticide, Emenagogue, Carminative, Diaphoretic', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (427, 'Peppermint, Western', 'Mentha Piperita', '', 'Promotes Sweating, Aids Digestion, Clears Colds', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (428, 'Periwinkle', 'Vinca Minor', '', 'Astringent, Tonic, Vulnerary, Anti-hemorrhagic, Diabetes', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (429, 'Pilewort &leftpar;Celandine, Lesser&rightpar;', 'Ranunculus Ficaria', '', 'Piles, Astringent', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (430, 'Plantain', 'Plantago Spp.', '', 'Alterative, Diuretic, Vulnerary, Cooling, Healing Agent', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (431, 'Pleurisy Root', 'Asclepias Tuberosa', '', 'Antispasmodic, Diaphoretic, Expectorant, Bronchitis', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (432, 'Poison Ivy or Oak &leftpar;Homeopathic&rightpar;', 'Rhus Toxicodendron', '', 'Backache, Sciatica, Restless Leg Syndrome, Gout, Carpal Tunnel Syndrome', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (433, 'Poke Root', 'Phytolacca Spp.', '', 'Alterative, Depurative, Deobstruent, Swollen Lymph Node', 'For cleansing the blood and lymph', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (434, 'Prickly Ash', 'Zanthoxylum Americanum', '', 'Alterative, Stimulant, Diaphoretic, Arthritis, Rheumatism', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (435, 'Propolis', 'Resina Propoli', '', 'Protective, Vulnerary, Cleansing Agent', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (436, 'Puka', 'Meryta Sinclairii', '', 'Tonic, Emmenagogue, Hormonal Balancer', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (437, 'Pukatea', 'Laurelia Novae-', '', 'Anodyne, Analgesic, Alterative, Toothache, Ulcers', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (438, 'Puriri', 'Vitex Lucens', '', 'Vulnerary, Germicide, Sore Throat, Sprains, Backache', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (439, 'Quassia', 'Quassia Amara', '', 'Anthelmintic, Tonic, Bitter, Anemia, Anorexia', 'Assimilation and appetite enhancement', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (440, 'Raspberry Leaf', 'Rubus Idaeus', '', 'Astringent, Stimulant, Tonic, Incontinence,', 'Astringent and tonic, strengthens the abdominal muscles', 'For harmone balancing and astringent', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (441, 'Red Clover', 'Trifolium Pratense', '', 'Alterative, Sedative, Bronchial Cough, Clearing', 'For blood cleansing and anti-tumor activity', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (442, 'Red Root', 'Ceanothus Fendeleri', '', 'Astringent, Expectorant, Antispasmodic, Mouthwash', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (443, 'Red Sage', 'Salvia Colorata', '', 'Astringent, Aromatic, Gargle,  Laryngitis, Tonsilitis', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (444, 'Rhatany Root', 'Krameria Triandra', '', 'Astringent, Tonic, Spongy Bleeding Gums, Mucous', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (445, 'Rosemary', 'Rosmarinus Officinalis', '', 'Nervine, Astringent, Diaphoretic, Stomachic, Nerve Pain', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (446, 'Rue', 'Ruta Graveolens', '', 'Stimulant, Antispasmodic, Emmenagogue, Bone Pain', 'Homeopathic: Specific for bone pain and bruising', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (447, 'Sage', 'Salvia Officinalis', '', 'Aromatic, Stimulant, Gargle for Sore Throat, Laryngitis', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (448, 'Sarsaparilla', 'Smilax Officinalis', '', 'Tonic, Alterative, Depurative, Anti-viral, Anti-bacterial', 'For muscle enhancement and blood cleansing', 'For building muscle tissue', 'For increase of energy', 'For cleansing and testosterone support', '', '', '', '', '');
INSERT INTO single_herbs VALUES (449, 'Sassafras', 'Sassafras Albidum', '', 'Stimulant, Diaphoretic, Diuretic, Skin Eruptions', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (450, 'Saw Palmetto', 'Serenoa Serrulata', '', 'Nutritive Tonic, Diuretic, Sedative, Builds Muscle Tissue', 'For muscular strength and increased vitality', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (451, 'Senna', 'Senna Angustifolia', '', 'Laxative, Cathartic, Constipation', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (452, 'Sheep''s Sorrel', 'Rumex Acetosella', '', 'Refrigerant, Diuretic, Diaphoretic, Cools Fevers', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (453, 'Shepherd''s Purse', 'Capsella Bursa-Pastoris', '', 'Stimulant, Diuretic, Astringent, Diarrhea, Heavy Menses', 'For excessive or extended bleeding', 'For bleeding with the passing of the stone', 'For bloody and dreggy urine', 'For kidney support with cleansing and astringent qualities', 'Arrests bleeding', '', '', '', '');
INSERT INTO single_herbs VALUES (454, 'Shilajit', 'Asphaltum', '', 'Alterative, Diuretic, Antiseptic, Rejuvenative, Aphrodisiac', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (455, 'Skullcap', 'Scutellaria Lateriflora', '', 'Tonic, Nervine, Antispasmodic, Astringent, Analgesic', 'For nervous tension and pain relief', 'For a nervous stomach', 'Calms, benefits stress and nervous tension', 'Calming to the nervous system, especially if 	fear is a factor', 'If emotional stress is a contributing factor for constipation', 'Nervous restorative, for a fearful personality', 'Helps to relieve anxiety and stress', '', '');
INSERT INTO single_herbs VALUES (456, 'Slippery Elm', 'Ulmus Fulva', '', 'Demulcent, Emollient, Vulnerary, Nutritive, Pectoral', 'For inflammation of the tissues in the digestive tract', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (457, 'Southernwood', 'Artemisia Abrotanum', '', 'Stimulant, Emmenagogue, Antiseptic, Detergent', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (458, 'Spearmint', 'Mentha Spicata', '', 'Stimulant, Carninative, Antispasmodic', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (459, 'Squaw Vine', 'Mitchella Repens', '', 'Parturient, Diuretic, Astringent, Uterine Tonic', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (460, 'St. John''s Wort', 'Hypericum Perforatum', '', 'Nerve Anodyne, Anti-Depressant, Astringent, Diuretic', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (461, 'Staphisagria', 'Delphinium Staphisagria', '', 'Vermifuge, Parasiticide, Insecticide, Destroys Lice', 'For anxiety with marked irritability', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (462, 'Stillingia &leftpar;Queen''s Delight&rightpar;', 'Stillingia Sylvatica', '', 'Alterative, Tonic, Diuretic, Aperient, Acne, Clears Toxins', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (463, 'Stone Root', 'Collinsonia Canadensis', '', 'Diuretic, Tonic, Stomachic, Kidney Stone and Gravel', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (464, 'Tanekaha', 'Phyllocladus Trichomanoides', '', 'Hepatic, Tonic, Astringent, Gastritis, Dysentery', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (465, 'Tansy', 'Tanacetum Vulgare', '', 'Anthelmintic, Tonic, Emmenagogue, Irregular Menses', 'Specific for menstrual irregularity', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (466, 'Taraire', 'Beilschmedia Taraire', '', 'Antispasmodic, Sedative, Quietens Dreams &leftpar;Homepathic&rightpar;', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (467, 'Tarata', 'Pittosporum Eugenioides', '', 'Pectoral, Antispasmodic, Expectorant, Asthma, Bronchitis', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (468, 'Tawa', 'Beilschmiedia Tawa', '', 'Tonic, Pectoral, Carminative, Tonic, Stomach Pains', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (469, 'Tea Tree', 'Melaleuca Alternifolia', '', 'Anti-fungal, Anti-bacterial', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (470, 'Thuja', 'Thuja Occidentalis', '', 'Alterative, Anthelmintic, Expectorant, Anti-viral', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (471, 'Tormentilla', 'Potentilla Tormentilla', '', 'Infections, Anodyne, Healing Wounds, Burns', 'To alleviate bleeding', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (472, 'True Unicorn Root', 'Alteris Farinosa', '', 'Tonic, Stomachic, Debility, Female Infertility', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (473, 'Uva Ursi', 'Arctostaphylos Uva Ursi', '', 'Mucilagenous, Astringent, Diuretic, Antiseptic', 'For increased diuretic and antiseptic actions', 'For flushing out toxicity via the kidneys', 'For fluid retention and edema', 'For cleansing the kidneys and pelvic area', 'Assists the kidneys in clearing toxins', 'For glaucoma', 'For clearing of body toxins, via the kidneys', '', '');
INSERT INTO single_herbs VALUES (474, 'Valerian', 'Valeriana Officinalis', '', 'Anodyne, Antispasmodic, Nervine, Irritability, Temper', 'For tension and stress that expresses itself as anger', 'For circulation that is impeded by stiff, unbending moods and a bad temper', 'For a bad temper, anger, and stress', 'If associated pain causes loss of temper and irritability', 'For emotional help with temper, stress, and 		pain', 'For help with hot temper, stress, and pain', 'For anger and agitation', '', '');
INSERT INTO single_herbs VALUES (475, 'Vervain', 'Verbena Officinalis', '', 'Nervine, Tonic, Sudorific, Antidepressive, Colds, Fevers', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (476, 'Violet, Western', 'Viola Odorata', '', 'Antiseptic, Expectorant, Alerative, Depurative', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (477, 'Wahoo', 'Euonymus Atropurpureus', '', 'Tonic, Alterative, Cholagogue, Aperient, Liver Disorders', 'For additional liver cleansing', 'For clearing toxins through the liver', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (478, 'White Pond Lily', 'Nymphaea Odorata', '', 'Antiseptic, Astringent, Demulcent, Diarrhea', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (479, 'White Willow Bark', 'Salis Alba', '', 'Anodyne, Analgesic, Tonic, Antiperiodic, Astringent', 'For additional pain relief, all types', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (480, 'Wild Carrot', 'Daucus Carota', '', 'Diuretic, Deobstruent, Stimulant, Fluid Retention', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (481, 'Wild Cherry Bark', 'Prunus Serotina', '', 'Astringent, Tonic, Pectoral, Sedative, Dry Cough', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (482, 'Wild Indigo &leftpar;Baptisia&rightpar;, Western', 'Baptisia Tinctoria', '', 'Antiseptic, Stimulant, Alterative, Emmenagogue', 'For stubborn infections', 'For immune support and chronic infections', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (483, 'Wild Lettuce', 'Lactuca Virosa', '', 'Anodyne, Sedative, Expectorant, Reduces Pain and Cough', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (484, 'Wild Yam', 'Dioscorea Villosa', '', 'Antibilious, Antispasmodic, Diaphoretic, Hepatic', 'For abdominal cramps and spasms', 'For antispasmodic action and pain relief, especially menstrual', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (485, 'Wintergreen', 'Gaultheria Promcumbens', '', 'Aromatic, Astringent, Stimulant, Anti-Arthritic', 'For pain relief specific to rheumatic and arthritic conditions', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (486, 'Witch Hazel', 'Hamamelis Virginiana', '', 'Astringent, Tonic, Sedative, Hemorrhoids, Varicose Veins', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (487, 'Wood Betony', 'Betonica Officinalis', '', 'Alterative, Astringent, Aromatic, Rheumatism, Dyspepsia', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (488, 'Wormseed', 'Chenopodium Ambrosiodes', '', 'Vermifuge, Anthelmintic, Clears Intestinal Worms', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (489, 'Wormwood', 'Artemisia Absinthium', '', 'Tonic, Stomachic, Febrifuge, Anthelmintic, Debility', 'Nutritive tonic, especially for underweight people', 'For debility, weight loss, and poor digestion', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (490, 'Yarrow', 'Achillea Millefolium', '', 'Diaphoretic, Stimulant, Tonic, Calming, Warming', 'Supports the circulation', 'Promotes circulation, clearing of toxins, and supplements the body reserves', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (491, 'Yellow Dock', 'Rumex Crispus', '', 'Alterative, Depurative, Tonic, Aperient, Clears Boils', 'For additional clearing of the blood and stimulating the bowels', 'For sluggish stools', 'For purifying the blood and moving the bowels', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (492, 'Yerba Mate', 'Ilex Paraguaiensis', '', 'Alterative, Aperient, Astringent, Antidepressive', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (493, 'Yerba Santa', 'Eriodyction glutinosum', '', 'Aromatic, Tonic, Expectorant, Bronchitis, Asthma', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (494, 'Yohimbe', 'Pausinystalia Yohimbe', '', 'Aphrodisiac, Stimulant', 'Circulatory stimulant with aphrodisiac qualities', 'Enhances circulation to the sexual glands', 'For weak libido', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (495, 'Atractylodes', 'Atractylodis Macrocephalae Rhizoma', 'Bai Zhu', 'Strengthens the Spleen, Augments the Qi, Dries Dampness, Weak Appetite, Edema, Excess Sweating', 'For weak digestion, loose stool', 'For a weak appetite and loose stool', 'For a loose stool and weak appetite combine with Dioscorea &leftpar;Shan Yao&rightpar;', 'For vomiting up phlegm', '', '', '', '', '');
INSERT INTO single_herbs VALUES (496, 'Olive &leftpar;Flower Remedy&rightpar;', '', '', 'For emotional exhaustion', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (497, 'Clematis &leftpar;Flower Remedy&rightpar;', '', '', 'To help keep the mind in the present', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (498, 'Gorse &leftpar;Flower Remedy&rightpar;', '', '', 'To keep hope alive and not get lost in the negative', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (499, 'Rock Rose &leftpar;Flower Remedy&rightpar;', '', '', 'For panic and anxiety', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (500, 'Crab Apple &leftpar;Flower Remedy&rightpar;', '', '', 'For feelings of uncleanliness', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (501, 'Hornbeam &leftpar;Flower Remedy&rightpar;', '', '', 'For lethargy, exhaustion, and weariness', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (502, 'Chestnut', 'Aesculus hippocastanum', '', 'For whooping cough', '', '', 'Calms, benefits stress and nervous tension', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (503, 'Fraxinus &leftpar;Homeopathic&rightpar;', '', '', 'For a bearing down sensation', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (504, 'Centuary &leftpar;Flower Remedy&rightpar;', '', '', 'Gives too much away, cant say no!', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (505, 'Agrimony &leftpar;Flower Remedy&rightpar;', '', '', 'For holding on, unable to talk things out', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (506, 'Echinacea', 'Echinacea Angustifolia', '', 'Alternative, Antiseptic, Clears Blood, Infections, and Boils', 'For conditions with pus or other secretions', 'For infection or when thick mucous is present', 'For immune support and protection from infections', 'For additional cleansing and antibacterial actions', 'For clearing infections and building up resistance to illnesses', 'For clearing of eye infections', 'For pus-like boils', 'For skin lesions with pus or other secretions', '');
INSERT INTO single_herbs VALUES (507, 'Pueraria', '', 'Ge Gen', 'Induces Perspiration, Clears Heat, Vents Rashes, Neck Stiffness, Relaxes the Muscles', 'For headache in the frontal region of the head', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (509, 'Male Fern', 'Dryopteris filix-mas', '', 'specific for tapeworms', '', '', '', '', '', '', '', '', '');
INSERT INTO single_herbs VALUES (510, 'Aquilaria', '', 'Chen Xiang', 'Moves Qi and Alleviates pain &leftpar;for Xu Cold or Blood Stasis patterns&rightpar;,Descends Qi and Regulates the Middle, and Aids Kidneys in Grasping Qi.', 'For low abdominal pain, use with Lindera &leftpar;Wu Yao&rightpar;', '', 'For abdominal cramps, combine with Wild Yam &leftpar;Dioscorea Villosa&rightpar;', '', '', '', '', '', '');


--
-- Name: single_herbs_local_herb_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app
--

SELECT pg_catalog.setval('single_herbs_local_herb_id_seq', 510, true);


--
-- Data for Name: tos_order_items; Type: TABLE DATA; Schema: public; Owner: app
--



--
-- Data for Name: tos_order_shipping; Type: TABLE DATA; Schema: public; Owner: app
--



--
-- Name: tos_order_shipping_local_order_number_seq; Type: SEQUENCE SET; Schema: public; Owner: app
--

SELECT pg_catalog.setval('tos_order_shipping_local_order_number_seq', 1, false);


--
-- Data for Name: tos_orders; Type: TABLE DATA; Schema: public; Owner: app
--



--
-- Name: tos_orders_local_order_number_seq; Type: SEQUENCE SET; Schema: public; Owner: app
--

SELECT pg_catalog.setval('tos_orders_local_order_number_seq', 1, false);


--
-- Data for Name: wholesale_size_price; Type: TABLE DATA; Schema: public; Owner: app
--

INSERT INTO wholesale_size_price VALUES (1, '2 oz', 4.9500);
INSERT INTO wholesale_size_price VALUES (8, '1 oz', 4.4500);
INSERT INTO wholesale_size_price VALUES (6, '1 oz', 4.4500);
INSERT INTO wholesale_size_price VALUES (3, '2.5 oz', 6.5500);
INSERT INTO wholesale_size_price VALUES (2, '1 oz', 5.9500);
INSERT INTO wholesale_size_price VALUES (4, '1 oz', 4.9500);
INSERT INTO wholesale_size_price VALUES (3, '.75 oz', 4.4500);
INSERT INTO wholesale_size_price VALUES (9, '2.5 oz', 6.5500);
INSERT INTO wholesale_size_price VALUES (2, '4 oz', 11.9500);
INSERT INTO wholesale_size_price VALUES (2, '8 oz', 22.9500);
INSERT INTO wholesale_size_price VALUES (5, '1 oz', 4.4500);
INSERT INTO wholesale_size_price VALUES (8, '8 oz', 6.5500);
INSERT INTO wholesale_size_price VALUES (7, '1 oz', 4.4500);
INSERT INTO wholesale_size_price VALUES (10, '1 oz', 4.4500);
INSERT INTO wholesale_size_price VALUES (12, '4 oz', 11.9500);
INSERT INTO wholesale_size_price VALUES (12, '8 oz', 22.9500);
INSERT INTO wholesale_size_price VALUES (12, '1 oz', 5.9500);
INSERT INTO wholesale_size_price VALUES (11, '1 oz', 4.4500);
INSERT INTO wholesale_size_price VALUES (13, '4 oz', 11.9500);
INSERT INTO wholesale_size_price VALUES (14, '8 oz', 6.9500);
INSERT INTO wholesale_size_price VALUES (15, '1 oz', 4.4500);
INSERT INTO wholesale_size_price VALUES (16, '1 oz', 4.4500);
INSERT INTO wholesale_size_price VALUES (17, '8 oz', 6.9500);
INSERT INTO wholesale_size_price VALUES (18, '4 oz', 5.9500);
INSERT INTO wholesale_size_price VALUES (19, '4 oz', 3.9500);
INSERT INTO wholesale_size_price VALUES (20, '12 oz', 5.9500);
INSERT INTO wholesale_size_price VALUES (21, '2 oz', 4.7500);
INSERT INTO wholesale_size_price VALUES (27, '4 oz', 5.9500);
INSERT INTO wholesale_size_price VALUES (9, '.75 oz', 4.4500);
INSERT INTO wholesale_size_price VALUES (28, '4 oz', 11.9500);
INSERT INTO wholesale_size_price VALUES (29, '1 oz', 5.9500);
INSERT INTO wholesale_size_price VALUES (30, '8 oz', 22.9500);
INSERT INTO wholesale_size_price VALUES (32, '2.5 oz', 6.5500);
INSERT INTO wholesale_size_price VALUES (31, '2.5 oz', 6.5500);
INSERT INTO wholesale_size_price VALUES (33, '.75 oz', 4.4500);
INSERT INTO wholesale_size_price VALUES (34, '.75 oz', 4.4500);
INSERT INTO wholesale_size_price VALUES (34, '.75 oz', 4.4500);
INSERT INTO wholesale_size_price VALUES (36, '4 oz', 5.9500);
INSERT INTO wholesale_size_price VALUES (35, '2 oz', 4.9500);
INSERT INTO wholesale_size_price VALUES (37, '1 oz', 4.4500);
INSERT INTO wholesale_size_price VALUES (38, '1 oz', 4.4500);
INSERT INTO wholesale_size_price VALUES (39, '2 oz', 4.9500);


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

