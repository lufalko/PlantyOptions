--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9
-- Dumped by pg_dump version 14.1

-- Started on 2021-12-16 17:35:56 CET

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
-- TOC entry 2 (class 3079 OID 34854)
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- TOC entry 4047 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 206 (class 1259 OID 34699)
-- Name: accounts_account; Type: TABLE; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE TABLE public.accounts_account (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    email character varying(200) NOT NULL,
    username character varying(40),
    date_joined timestamp with time zone NOT NULL,
    last_login timestamp with time zone NOT NULL,
    is_admin boolean NOT NULL,
    is_active boolean NOT NULL,
    is_staff boolean NOT NULL,
    is_superuser boolean NOT NULL,
    first_name character varying(200),
    last_name character varying(200),
    initials character varying(2),
    profile_picture character varying(100),
    biography character varying(200),
    reset_password boolean NOT NULL
);


ALTER TABLE public.accounts_account OWNER TO hsa_2020ws_pyweb_plantyoptions;

--
-- TOC entry 205 (class 1259 OID 34697)
-- Name: accounts_account_id_seq; Type: SEQUENCE; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE SEQUENCE public.accounts_account_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_account_id_seq OWNER TO hsa_2020ws_pyweb_plantyoptions;

--
-- TOC entry 4048 (class 0 OID 0)
-- Dependencies: 205
-- Name: accounts_account_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER SEQUENCE public.accounts_account_id_seq OWNED BY public.accounts_account.id;


--
-- TOC entry 208 (class 1259 OID 34712)
-- Name: accounts_article; Type: TABLE; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE TABLE public.accounts_article (
    id integer NOT NULL,
    banner character varying(100),
    headline character varying(200) NOT NULL,
    subtitle character varying(300) NOT NULL,
    article_body text NOT NULL,
    date_created timestamp with time zone NOT NULL,
    kcal integer,
    carbs integer,
    fat integer,
    protein integer,
    "ingredientList" boolean,
    recipe_id integer
);


ALTER TABLE public.accounts_article OWNER TO hsa_2020ws_pyweb_plantyoptions;

--
-- TOC entry 207 (class 1259 OID 34710)
-- Name: accounts_article_id_seq; Type: SEQUENCE; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE SEQUENCE public.accounts_article_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_article_id_seq OWNER TO hsa_2020ws_pyweb_plantyoptions;

--
-- TOC entry 4049 (class 0 OID 0)
-- Dependencies: 207
-- Name: accounts_article_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER SEQUENCE public.accounts_article_id_seq OWNED BY public.accounts_article.id;


--
-- TOC entry 250 (class 1259 OID 36610)
-- Name: accounts_author; Type: TABLE; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE TABLE public.accounts_author (
    id integer NOT NULL,
    name character varying(200) NOT NULL
);


ALTER TABLE public.accounts_author OWNER TO hsa_2020ws_pyweb_plantyoptions;

--
-- TOC entry 249 (class 1259 OID 36608)
-- Name: accounts_author_id_seq; Type: SEQUENCE; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE SEQUENCE public.accounts_author_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_author_id_seq OWNER TO hsa_2020ws_pyweb_plantyoptions;

--
-- TOC entry 4050 (class 0 OID 0)
-- Dependencies: 249
-- Name: accounts_author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER SEQUENCE public.accounts_author_id_seq OWNED BY public.accounts_author.id;


--
-- TOC entry 252 (class 1259 OID 36618)
-- Name: accounts_blog; Type: TABLE; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE TABLE public.accounts_blog (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.accounts_blog OWNER TO hsa_2020ws_pyweb_plantyoptions;

--
-- TOC entry 251 (class 1259 OID 36616)
-- Name: accounts_blog_id_seq; Type: SEQUENCE; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE SEQUENCE public.accounts_blog_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_blog_id_seq OWNER TO hsa_2020ws_pyweb_plantyoptions;

--
-- TOC entry 4051 (class 0 OID 0)
-- Dependencies: 251
-- Name: accounts_blog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER SEQUENCE public.accounts_blog_id_seq OWNED BY public.accounts_blog.id;


--
-- TOC entry 220 (class 1259 OID 34769)
-- Name: accounts_comment; Type: TABLE; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE TABLE public.accounts_comment (
    id integer NOT NULL,
    date_created timestamp with time zone NOT NULL,
    content text NOT NULL,
    account_id integer,
    restaurant_id integer,
    ratings integer
);


ALTER TABLE public.accounts_comment OWNER TO hsa_2020ws_pyweb_plantyoptions;

--
-- TOC entry 219 (class 1259 OID 34767)
-- Name: accounts_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE SEQUENCE public.accounts_comment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_comment_id_seq OWNER TO hsa_2020ws_pyweb_plantyoptions;

--
-- TOC entry 4052 (class 0 OID 0)
-- Dependencies: 219
-- Name: accounts_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER SEQUENCE public.accounts_comment_id_seq OWNED BY public.accounts_comment.id;


--
-- TOC entry 222 (class 1259 OID 34827)
-- Name: accounts_coworker; Type: TABLE; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE TABLE public.accounts_coworker (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    picture character varying(100) NOT NULL,
    email character varying(150) NOT NULL,
    social character varying(250) NOT NULL,
    title character varying(50) NOT NULL,
    bio character varying(35) NOT NULL
);


ALTER TABLE public.accounts_coworker OWNER TO hsa_2020ws_pyweb_plantyoptions;

--
-- TOC entry 221 (class 1259 OID 34825)
-- Name: accounts_coworker_id_seq; Type: SEQUENCE; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE SEQUENCE public.accounts_coworker_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_coworker_id_seq OWNER TO hsa_2020ws_pyweb_plantyoptions;

--
-- TOC entry 4053 (class 0 OID 0)
-- Dependencies: 221
-- Name: accounts_coworker_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER SEQUENCE public.accounts_coworker_id_seq OWNED BY public.accounts_coworker.id;


--
-- TOC entry 254 (class 1259 OID 36626)
-- Name: accounts_entry; Type: TABLE; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE TABLE public.accounts_entry (
    id integer NOT NULL,
    headline character varying(255) NOT NULL,
    point public.geometry(Point,4326) NOT NULL,
    blog_id integer NOT NULL
);


ALTER TABLE public.accounts_entry OWNER TO hsa_2020ws_pyweb_plantyoptions;

--
-- TOC entry 256 (class 1259 OID 36637)
-- Name: accounts_entry_authors; Type: TABLE; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE TABLE public.accounts_entry_authors (
    id integer NOT NULL,
    entry_id integer NOT NULL,
    author_id integer NOT NULL
);


ALTER TABLE public.accounts_entry_authors OWNER TO hsa_2020ws_pyweb_plantyoptions;

--
-- TOC entry 255 (class 1259 OID 36635)
-- Name: accounts_entry_authors_id_seq; Type: SEQUENCE; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE SEQUENCE public.accounts_entry_authors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_entry_authors_id_seq OWNER TO hsa_2020ws_pyweb_plantyoptions;

--
-- TOC entry 4054 (class 0 OID 0)
-- Dependencies: 255
-- Name: accounts_entry_authors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER SEQUENCE public.accounts_entry_authors_id_seq OWNED BY public.accounts_entry_authors.id;


--
-- TOC entry 253 (class 1259 OID 36624)
-- Name: accounts_entry_id_seq; Type: SEQUENCE; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE SEQUENCE public.accounts_entry_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_entry_id_seq OWNER TO hsa_2020ws_pyweb_plantyoptions;

--
-- TOC entry 4055 (class 0 OID 0)
-- Dependencies: 253
-- Name: accounts_entry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER SEQUENCE public.accounts_entry_id_seq OWNED BY public.accounts_entry.id;


--
-- TOC entry 216 (class 1259 OID 34750)
-- Name: accounts_food; Type: TABLE; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE TABLE public.accounts_food (
    id integer NOT NULL,
    name character varying(200),
    category character varying(200),
    rating double precision,
    price double precision,
    description character varying(400),
    restaurant_id integer,
    "toGoPrice" double precision
);


ALTER TABLE public.accounts_food OWNER TO hsa_2020ws_pyweb_plantyoptions;

--
-- TOC entry 215 (class 1259 OID 34748)
-- Name: accounts_food_id_seq; Type: SEQUENCE; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE SEQUENCE public.accounts_food_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_food_id_seq OWNER TO hsa_2020ws_pyweb_plantyoptions;

--
-- TOC entry 4056 (class 0 OID 0)
-- Dependencies: 215
-- Name: accounts_food_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER SEQUENCE public.accounts_food_id_seq OWNED BY public.accounts_food.id;


--
-- TOC entry 218 (class 1259 OID 34761)
-- Name: accounts_food_tags; Type: TABLE; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE TABLE public.accounts_food_tags (
    id integer NOT NULL,
    food_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.accounts_food_tags OWNER TO hsa_2020ws_pyweb_plantyoptions;

--
-- TOC entry 217 (class 1259 OID 34759)
-- Name: accounts_food_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE SEQUENCE public.accounts_food_tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_food_tags_id_seq OWNER TO hsa_2020ws_pyweb_plantyoptions;

--
-- TOC entry 4057 (class 0 OID 0)
-- Dependencies: 217
-- Name: accounts_food_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER SEQUENCE public.accounts_food_tags_id_seq OWNED BY public.accounts_food_tags.id;


--
-- TOC entry 260 (class 1259 OID 36949)
-- Name: accounts_friendlist; Type: TABLE; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE TABLE public.accounts_friendlist (
    id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.accounts_friendlist OWNER TO hsa_2020ws_pyweb_plantyoptions;

--
-- TOC entry 262 (class 1259 OID 36959)
-- Name: accounts_friendlist_friends; Type: TABLE; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE TABLE public.accounts_friendlist_friends (
    id integer NOT NULL,
    friendlist_id integer NOT NULL,
    account_id integer NOT NULL
);


ALTER TABLE public.accounts_friendlist_friends OWNER TO hsa_2020ws_pyweb_plantyoptions;

--
-- TOC entry 261 (class 1259 OID 36957)
-- Name: accounts_friendlist_friends_id_seq; Type: SEQUENCE; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE SEQUENCE public.accounts_friendlist_friends_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_friendlist_friends_id_seq OWNER TO hsa_2020ws_pyweb_plantyoptions;

--
-- TOC entry 4058 (class 0 OID 0)
-- Dependencies: 261
-- Name: accounts_friendlist_friends_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER SEQUENCE public.accounts_friendlist_friends_id_seq OWNED BY public.accounts_friendlist_friends.id;


--
-- TOC entry 259 (class 1259 OID 36947)
-- Name: accounts_friendlist_id_seq; Type: SEQUENCE; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE SEQUENCE public.accounts_friendlist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_friendlist_id_seq OWNER TO hsa_2020ws_pyweb_plantyoptions;

--
-- TOC entry 4059 (class 0 OID 0)
-- Dependencies: 259
-- Name: accounts_friendlist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER SEQUENCE public.accounts_friendlist_id_seq OWNED BY public.accounts_friendlist.id;


--
-- TOC entry 258 (class 1259 OID 36941)
-- Name: accounts_friendrequest; Type: TABLE; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE TABLE public.accounts_friendrequest (
    id integer NOT NULL,
    is_active boolean NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    receiver_id integer NOT NULL,
    sender_id integer NOT NULL
);


ALTER TABLE public.accounts_friendrequest OWNER TO hsa_2020ws_pyweb_plantyoptions;

--
-- TOC entry 257 (class 1259 OID 36939)
-- Name: accounts_friendrequest_id_seq; Type: SEQUENCE; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE SEQUENCE public.accounts_friendrequest_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_friendrequest_id_seq OWNER TO hsa_2020ws_pyweb_plantyoptions;

--
-- TOC entry 4060 (class 0 OID 0)
-- Dependencies: 257
-- Name: accounts_friendrequest_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER SEQUENCE public.accounts_friendrequest_id_seq OWNED BY public.accounts_friendrequest.id;


--
-- TOC entry 268 (class 1259 OID 43565)
-- Name: accounts_ingredient; Type: TABLE; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE TABLE public.accounts_ingredient (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    kcal double precision NOT NULL,
    carbs double precision NOT NULL,
    protein double precision NOT NULL,
    fat double precision NOT NULL
);


ALTER TABLE public.accounts_ingredient OWNER TO hsa_2020ws_pyweb_plantyoptions;

--
-- TOC entry 267 (class 1259 OID 43563)
-- Name: accounts_ingredient_id_seq; Type: SEQUENCE; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE SEQUENCE public.accounts_ingredient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_ingredient_id_seq OWNER TO hsa_2020ws_pyweb_plantyoptions;

--
-- TOC entry 4061 (class 0 OID 0)
-- Dependencies: 267
-- Name: accounts_ingredient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER SEQUENCE public.accounts_ingredient_id_seq OWNED BY public.accounts_ingredient.id;


--
-- TOC entry 272 (class 1259 OID 43664)
-- Name: accounts_ingredientvalue; Type: TABLE; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE TABLE public.accounts_ingredientvalue (
    id integer NOT NULL,
    "valueInGrams" integer NOT NULL,
    ingredient_id integer NOT NULL,
    "otherValue" integer,
    "otherValueName" character varying(50)
);


ALTER TABLE public.accounts_ingredientvalue OWNER TO hsa_2020ws_pyweb_plantyoptions;

--
-- TOC entry 271 (class 1259 OID 43662)
-- Name: accounts_ingredientvalue_id_seq; Type: SEQUENCE; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE SEQUENCE public.accounts_ingredientvalue_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_ingredientvalue_id_seq OWNER TO hsa_2020ws_pyweb_plantyoptions;

--
-- TOC entry 4062 (class 0 OID 0)
-- Dependencies: 271
-- Name: accounts_ingredientvalue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER SEQUENCE public.accounts_ingredientvalue_id_seq OWNED BY public.accounts_ingredientvalue.id;


--
-- TOC entry 266 (class 1259 OID 43445)
-- Name: accounts_rd_update; Type: TABLE; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE TABLE public.accounts_rd_update (
    id integer NOT NULL,
    rd_opened integer NOT NULL
);


ALTER TABLE public.accounts_rd_update OWNER TO hsa_2020ws_pyweb_plantyoptions;

--
-- TOC entry 265 (class 1259 OID 43443)
-- Name: accounts_rd_update_id_seq; Type: SEQUENCE; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE SEQUENCE public.accounts_rd_update_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_rd_update_id_seq OWNER TO hsa_2020ws_pyweb_plantyoptions;

--
-- TOC entry 4063 (class 0 OID 0)
-- Dependencies: 265
-- Name: accounts_rd_update_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER SEQUENCE public.accounts_rd_update_id_seq OWNED BY public.accounts_rd_update.id;


--
-- TOC entry 270 (class 1259 OID 43599)
-- Name: accounts_recipe; Type: TABLE; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE TABLE public.accounts_recipe (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    duration double precision NOT NULL,
    portions integer NOT NULL,
    instructions text NOT NULL
);


ALTER TABLE public.accounts_recipe OWNER TO hsa_2020ws_pyweb_plantyoptions;

--
-- TOC entry 269 (class 1259 OID 43597)
-- Name: accounts_recipe_id_seq; Type: SEQUENCE; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE SEQUENCE public.accounts_recipe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_recipe_id_seq OWNER TO hsa_2020ws_pyweb_plantyoptions;

--
-- TOC entry 4064 (class 0 OID 0)
-- Dependencies: 269
-- Name: accounts_recipe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER SEQUENCE public.accounts_recipe_id_seq OWNED BY public.accounts_recipe.id;


--
-- TOC entry 274 (class 1259 OID 43672)
-- Name: accounts_recipe_ingredients; Type: TABLE; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE TABLE public.accounts_recipe_ingredients (
    id integer NOT NULL,
    recipe_id integer NOT NULL,
    ingredientvalue_id integer NOT NULL
);


ALTER TABLE public.accounts_recipe_ingredients OWNER TO hsa_2020ws_pyweb_plantyoptions;

--
-- TOC entry 273 (class 1259 OID 43670)
-- Name: accounts_recipe_ingredients_id_seq; Type: SEQUENCE; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE SEQUENCE public.accounts_recipe_ingredients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_recipe_ingredients_id_seq OWNER TO hsa_2020ws_pyweb_plantyoptions;

--
-- TOC entry 4065 (class 0 OID 0)
-- Dependencies: 273
-- Name: accounts_recipe_ingredients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER SEQUENCE public.accounts_recipe_ingredients_id_seq OWNED BY public.accounts_recipe_ingredients.id;


--
-- TOC entry 212 (class 1259 OID 34731)
-- Name: accounts_restaurant; Type: TABLE; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE TABLE public.accounts_restaurant (
    id integer NOT NULL,
    restaurant_picture character varying(100),
    name character varying(200),
    address character varying(128) NOT NULL,
    city character varying(64) NOT NULL,
    "houseNumber" integer NOT NULL,
    state character varying(64) NOT NULL,
    zip_code character varying(5) NOT NULL,
    latitude numeric(10,7),
    longitude numeric(10,7),
    fri character varying(50),
    mon character varying(50),
    sat character varying(50),
    sun character varying(50),
    thu character varying(50),
    tue character varying(50),
    wed character varying(50),
    affordability double precision,
    "averageRating" double precision NOT NULL,
    description text
);


ALTER TABLE public.accounts_restaurant OWNER TO hsa_2020ws_pyweb_plantyoptions;

--
-- TOC entry 211 (class 1259 OID 34729)
-- Name: accounts_restaurant_id_seq; Type: SEQUENCE; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE SEQUENCE public.accounts_restaurant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_restaurant_id_seq OWNER TO hsa_2020ws_pyweb_plantyoptions;

--
-- TOC entry 4066 (class 0 OID 0)
-- Dependencies: 211
-- Name: accounts_restaurant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER SEQUENCE public.accounts_restaurant_id_seq OWNED BY public.accounts_restaurant.id;


--
-- TOC entry 264 (class 1259 OID 43423)
-- Name: accounts_restaurant_likes; Type: TABLE; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE TABLE public.accounts_restaurant_likes (
    id integer NOT NULL,
    restaurant_id integer NOT NULL,
    account_id integer NOT NULL
);


ALTER TABLE public.accounts_restaurant_likes OWNER TO hsa_2020ws_pyweb_plantyoptions;

--
-- TOC entry 263 (class 1259 OID 43421)
-- Name: accounts_restaurant_likes_id_seq; Type: SEQUENCE; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE SEQUENCE public.accounts_restaurant_likes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_restaurant_likes_id_seq OWNER TO hsa_2020ws_pyweb_plantyoptions;

--
-- TOC entry 4067 (class 0 OID 0)
-- Dependencies: 263
-- Name: accounts_restaurant_likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER SEQUENCE public.accounts_restaurant_likes_id_seq OWNED BY public.accounts_restaurant_likes.id;


--
-- TOC entry 214 (class 1259 OID 34742)
-- Name: accounts_restaurant_tags; Type: TABLE; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE TABLE public.accounts_restaurant_tags (
    id integer NOT NULL,
    restaurant_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.accounts_restaurant_tags OWNER TO hsa_2020ws_pyweb_plantyoptions;

--
-- TOC entry 213 (class 1259 OID 34740)
-- Name: accounts_restaurant_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE SEQUENCE public.accounts_restaurant_tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_restaurant_tags_id_seq OWNER TO hsa_2020ws_pyweb_plantyoptions;

--
-- TOC entry 4068 (class 0 OID 0)
-- Dependencies: 213
-- Name: accounts_restaurant_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER SEQUENCE public.accounts_restaurant_tags_id_seq OWNED BY public.accounts_restaurant_tags.id;


--
-- TOC entry 210 (class 1259 OID 34723)
-- Name: accounts_tag; Type: TABLE; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE TABLE public.accounts_tag (
    id integer NOT NULL,
    name character varying(200) NOT NULL
);


ALTER TABLE public.accounts_tag OWNER TO hsa_2020ws_pyweb_plantyoptions;

--
-- TOC entry 209 (class 1259 OID 34721)
-- Name: accounts_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE SEQUENCE public.accounts_tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_tag_id_seq OWNER TO hsa_2020ws_pyweb_plantyoptions;

--
-- TOC entry 4069 (class 0 OID 0)
-- Dependencies: 209
-- Name: accounts_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER SEQUENCE public.accounts_tag_id_seq OWNED BY public.accounts_tag.id;


--
-- TOC entry 245 (class 1259 OID 36484)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO hsa_2020ws_pyweb_plantyoptions;

--
-- TOC entry 244 (class 1259 OID 36482)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO hsa_2020ws_pyweb_plantyoptions;

--
-- TOC entry 4070 (class 0 OID 0)
-- Dependencies: 244
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- TOC entry 247 (class 1259 OID 36494)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO hsa_2020ws_pyweb_plantyoptions;

--
-- TOC entry 246 (class 1259 OID 36492)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO hsa_2020ws_pyweb_plantyoptions;

--
-- TOC entry 4071 (class 0 OID 0)
-- Dependencies: 246
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- TOC entry 243 (class 1259 OID 36476)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO hsa_2020ws_pyweb_plantyoptions;

--
-- TOC entry 242 (class 1259 OID 36474)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO hsa_2020ws_pyweb_plantyoptions;

--
-- TOC entry 4072 (class 0 OID 0)
-- Dependencies: 242
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- TOC entry 241 (class 1259 OID 36452)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO hsa_2020ws_pyweb_plantyoptions;

--
-- TOC entry 240 (class 1259 OID 36450)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO hsa_2020ws_pyweb_plantyoptions;

--
-- TOC entry 4073 (class 0 OID 0)
-- Dependencies: 240
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- TOC entry 239 (class 1259 OID 36442)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO hsa_2020ws_pyweb_plantyoptions;

--
-- TOC entry 238 (class 1259 OID 36440)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO hsa_2020ws_pyweb_plantyoptions;

--
-- TOC entry 4074 (class 0 OID 0)
-- Dependencies: 238
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- TOC entry 204 (class 1259 OID 34688)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO hsa_2020ws_pyweb_plantyoptions;

--
-- TOC entry 203 (class 1259 OID 34686)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO hsa_2020ws_pyweb_plantyoptions;

--
-- TOC entry 4075 (class 0 OID 0)
-- Dependencies: 203
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- TOC entry 248 (class 1259 OID 36526)
-- Name: django_session; Type: TABLE; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO hsa_2020ws_pyweb_plantyoptions;

--
-- TOC entry 3683 (class 2604 OID 34702)
-- Name: accounts_account id; Type: DEFAULT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_account ALTER COLUMN id SET DEFAULT nextval('public.accounts_account_id_seq'::regclass);


--
-- TOC entry 3684 (class 2604 OID 34715)
-- Name: accounts_article id; Type: DEFAULT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_article ALTER COLUMN id SET DEFAULT nextval('public.accounts_article_id_seq'::regclass);


--
-- TOC entry 3699 (class 2604 OID 36613)
-- Name: accounts_author id; Type: DEFAULT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_author ALTER COLUMN id SET DEFAULT nextval('public.accounts_author_id_seq'::regclass);


--
-- TOC entry 3700 (class 2604 OID 36621)
-- Name: accounts_blog id; Type: DEFAULT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_blog ALTER COLUMN id SET DEFAULT nextval('public.accounts_blog_id_seq'::regclass);


--
-- TOC entry 3690 (class 2604 OID 34772)
-- Name: accounts_comment id; Type: DEFAULT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_comment ALTER COLUMN id SET DEFAULT nextval('public.accounts_comment_id_seq'::regclass);


--
-- TOC entry 3691 (class 2604 OID 34830)
-- Name: accounts_coworker id; Type: DEFAULT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_coworker ALTER COLUMN id SET DEFAULT nextval('public.accounts_coworker_id_seq'::regclass);


--
-- TOC entry 3701 (class 2604 OID 36629)
-- Name: accounts_entry id; Type: DEFAULT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_entry ALTER COLUMN id SET DEFAULT nextval('public.accounts_entry_id_seq'::regclass);


--
-- TOC entry 3702 (class 2604 OID 36640)
-- Name: accounts_entry_authors id; Type: DEFAULT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_entry_authors ALTER COLUMN id SET DEFAULT nextval('public.accounts_entry_authors_id_seq'::regclass);


--
-- TOC entry 3688 (class 2604 OID 34753)
-- Name: accounts_food id; Type: DEFAULT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_food ALTER COLUMN id SET DEFAULT nextval('public.accounts_food_id_seq'::regclass);


--
-- TOC entry 3689 (class 2604 OID 34764)
-- Name: accounts_food_tags id; Type: DEFAULT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_food_tags ALTER COLUMN id SET DEFAULT nextval('public.accounts_food_tags_id_seq'::regclass);


--
-- TOC entry 3704 (class 2604 OID 36952)
-- Name: accounts_friendlist id; Type: DEFAULT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_friendlist ALTER COLUMN id SET DEFAULT nextval('public.accounts_friendlist_id_seq'::regclass);


--
-- TOC entry 3705 (class 2604 OID 36962)
-- Name: accounts_friendlist_friends id; Type: DEFAULT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_friendlist_friends ALTER COLUMN id SET DEFAULT nextval('public.accounts_friendlist_friends_id_seq'::regclass);


--
-- TOC entry 3703 (class 2604 OID 36944)
-- Name: accounts_friendrequest id; Type: DEFAULT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_friendrequest ALTER COLUMN id SET DEFAULT nextval('public.accounts_friendrequest_id_seq'::regclass);


--
-- TOC entry 3708 (class 2604 OID 43568)
-- Name: accounts_ingredient id; Type: DEFAULT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_ingredient ALTER COLUMN id SET DEFAULT nextval('public.accounts_ingredient_id_seq'::regclass);


--
-- TOC entry 3710 (class 2604 OID 43667)
-- Name: accounts_ingredientvalue id; Type: DEFAULT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_ingredientvalue ALTER COLUMN id SET DEFAULT nextval('public.accounts_ingredientvalue_id_seq'::regclass);


--
-- TOC entry 3707 (class 2604 OID 43448)
-- Name: accounts_rd_update id; Type: DEFAULT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_rd_update ALTER COLUMN id SET DEFAULT nextval('public.accounts_rd_update_id_seq'::regclass);


--
-- TOC entry 3709 (class 2604 OID 43602)
-- Name: accounts_recipe id; Type: DEFAULT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_recipe ALTER COLUMN id SET DEFAULT nextval('public.accounts_recipe_id_seq'::regclass);


--
-- TOC entry 3711 (class 2604 OID 43675)
-- Name: accounts_recipe_ingredients id; Type: DEFAULT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_recipe_ingredients ALTER COLUMN id SET DEFAULT nextval('public.accounts_recipe_ingredients_id_seq'::regclass);


--
-- TOC entry 3686 (class 2604 OID 34734)
-- Name: accounts_restaurant id; Type: DEFAULT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_restaurant ALTER COLUMN id SET DEFAULT nextval('public.accounts_restaurant_id_seq'::regclass);


--
-- TOC entry 3706 (class 2604 OID 43426)
-- Name: accounts_restaurant_likes id; Type: DEFAULT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_restaurant_likes ALTER COLUMN id SET DEFAULT nextval('public.accounts_restaurant_likes_id_seq'::regclass);


--
-- TOC entry 3687 (class 2604 OID 34745)
-- Name: accounts_restaurant_tags id; Type: DEFAULT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_restaurant_tags ALTER COLUMN id SET DEFAULT nextval('public.accounts_restaurant_tags_id_seq'::regclass);


--
-- TOC entry 3685 (class 2604 OID 34726)
-- Name: accounts_tag id; Type: DEFAULT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_tag ALTER COLUMN id SET DEFAULT nextval('public.accounts_tag_id_seq'::regclass);


--
-- TOC entry 3697 (class 2604 OID 36487)
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- TOC entry 3698 (class 2604 OID 36497)
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 3696 (class 2604 OID 36479)
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- TOC entry 3694 (class 2604 OID 36455)
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- TOC entry 3693 (class 2604 OID 36445)
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- TOC entry 3682 (class 2604 OID 34691)
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- TOC entry 3988 (class 0 OID 34699)
-- Dependencies: 206
-- Data for Name: accounts_account; Type: TABLE DATA; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

COPY public.accounts_account (id, password, email, username, date_joined, last_login, is_admin, is_active, is_staff, is_superuser, first_name, last_name, initials, profile_picture, biography, reset_password) FROM stdin;
2	pbkdf2_sha256$216000$vBzgEB0X3tfK$giM+T4Ps+Q6WM602G0QvzxJ3cpvZVIPN8zIKrGv4IJs=	robin@plantyoptions.de	Robin	2020-12-11 08:22:01.211774+01	2021-08-03 19:13:29.698915+02	t	t	t	t	Robin	Geramb	RG	DSC03181_KfwxTE5_UUeupl0.jpg	Hallo, ich bin Robin und Vegetarier. Schickt mir gerne eine Freundschaftsanfrage oder Restaurants die euch gefallen. Als Mitglied des PlantyOptions-Team stehe ich jederzeit für Fragen zur Verfügung!	f
8	pbkdf2_sha256$216000$jVPHClPNirVm$KYawrsU3upWnOUytuRH5rmXbTz1LW8hiYgPDbosMlrY=	maximilian.falkowsky@gmail.com	IF4lko	2021-01-04 18:39:56.743078+01	2021-01-04 18:39:57.085659+01	f	t	f	f	Maxi	Falkowsky	\N	dashboard-BG.jpg	\N	f
5	pbkdf2_sha256$216000$EFoDvp0fEocD$/hsP5z7I7a6zWVMxbXgrfZlsZQZ+87f7i7OyT5w4D5I=	kl@gmail.com	KarlLauterbach	2020-12-14 16:48:01.457646+01	2020-12-20 14:05:17.467934+01	f	t	f	f	Karl	Lauterbach	KL	KarlLauterbach_cF66rzR.jpeg	Ich mahne zur Vorsicht!	f
54	pbkdf2_sha256$216000$NZimbtaXQRpt$haL7kMhtTqelkxE6Am2agSAkWCkc6koaq7sN4JcQYRg=	justix.dev@gmx.de	Justus G.	2021-02-22 21:10:06.993758+01	2021-02-22 21:10:06.993786+01	f	f	f	f	Justus	Geramb	\N	dashboard-BG.jpg	\N	f
23	pbkdf2_sha256$216000$CMbpq4ILI2IP$7BDuKrHZII3yEl2JI87LmIRd6kwJ3HVwq1UjeP4Er+M=	fgesell@hotmail.de	flogesell	2021-01-29 13:17:55.013296+01	2021-01-29 13:20:00.300534+01	f	t	f	f	Florian	Gesell	\N	dashboard-BG.jpg	\N	f
51	pbkdf2_sha256$216000$oc6ad2QVFVEZ$xlVh7QWqAAX9lAC5D5Eq4avIjuYXl7NZ9+iRHWcKXxk=	katharina.kuhn@student.uibk.ac.at	Kaethe	2021-02-02 12:46:02.581845+01	2021-02-02 12:47:59.851825+01	f	t	f	f	Katha	Kuhn	\N	dashboard-BG.jpg	\N	f
41	pbkdf2_sha256$216000$vTmMRxmIwUq8$lVBdWXhi/j9JPLt+OJHcm3vnvaATEpHvScOffAXpbY0=	die.falkos@gmail.com	MichaelFalko	2021-01-31 14:16:58.388819+01	2021-01-31 16:03:16.377879+01	f	t	f	f	Michael	Falkowsky	\N	dashboard-BG.jpg	\N	f
52	pbkdf2_sha256$216000$3DQksEzrSGC6$M5ErpIcOlsgbTMn+QDJUBWkOyjkyR3D8p+Ma/2CgFm8=	charlynaw@gmail.com	Charly	2021-02-04 01:25:56.859086+01	2021-02-04 01:25:56.85912+01	f	f	f	f	Charlyna	Wruck	\N	dashboard-BG.jpg	\N	f
55	pbkdf2_sha256$216000$VD7y2SfVRTIo$1wNYMLhHzGLOsOx73ePC33tuGYCabXcdcGotVzfMrDo=	jojo@gmx.de	jjdj	2021-03-08 23:05:53.136047+01	2021-03-08 23:05:53.136075+01	f	f	f	f	Thorid	kek	\N	dashboard-BG.jpg	\N	f
18	pbkdf2_sha256$216000$jGHjdarINMIn$eIwbR5wlkuP0y+fNfWhxJUIAJABrEt+FBpCb+oLYNRc=	lucas.falkowsky@web.de	Leon	2021-01-05 20:11:08.564628+01	2021-02-02 13:28:32.89451+01	f	t	f	f	Leon	Falko	LF	IMG-20190225-WA0019.jpg	Vegetarier	f
53	pbkdf2_sha256$216000$mEilAPTO69we$zLxBeFYcyhADw2Z+L4zsmS00hXKuOp8fas9OqcDtq24=	wolfgang@alephants.org	wolfgang	2021-02-04 19:37:20.084891+01	2021-02-04 19:37:20.08492+01	f	f	f	f	Wolfgang	Geramb	\N	dashboard-BG.jpg	\N	f
50	pbkdf2_sha256$216000$cq4yltdznlSh$gTrgMnwJIktbeiQnPN/lAIYdpSlWbUCGiAz9cr80YgQ=	Paul.quarg2001@gmail.com	Vegan_gott_007	2021-02-01 19:48:54.847316+01	2021-02-02 13:52:41.189987+01	f	t	f	f	Paul	Quarg	PQ	IMG-20190225-WA0005.jpg	leidenschaftlicher Veganer	f
6	pbkdf2_sha256$216000$WjAlnFwuF3qn$H9xLiMwtfG8JButSDAXNkRRnRZUWiL9HQE4sGu07HiM=	luis@plantyoptions.de	Luis	2020-12-18 19:09:54.271975+01	2021-04-03 19:27:53.483125+02	t	t	t	t	Luis	Bauer	LB	SpainPortugal-81.jpg	Spaghetti werden unterschätzt!	f
49	pbkdf2_sha256$216000$egMYXRJq88WV$rkamNA2eLXMUptLPVOUzuJhoyi+RDNvpDQyqayWIk7Y=	anne.fleig@web.de	lisschen	2021-02-01 16:04:52.057502+01	2021-02-01 20:02:15.243177+01	f	t	f	f	Lisa	Fleig	\N	IMG_20200102_150851-min.jpg	Ich interessiere mich für die vegane Ernährung.	f
3	pbkdf2_sha256$216000$ZrrTosql5uZf$D0PSp+Ismc04PjD+uCQeOIRBzpyO4KJ8EZ89tfrgQaY=	anne.fleig@hs-augsburg.de	anne	2020-12-11 17:00:59.439408+01	2021-02-01 20:04:44.911614+01	t	t	t	t	Anne	Fleig	AF	DSC03376-min2-min.jpg	Ernährungswissenschaftlerin	f
48	pbkdf2_sha256$216000$wdFzFWBvJuer$uNZrs4Hd1vBzf7g3+08bYpC7KpssZEojJEuX/ZKYl5g=	robingeramb@icloud.com	Boris	2021-02-01 15:35:55.477613+01	2021-02-02 18:51:06.370562+01	f	t	f	f	Boris	Geramb	BG	WhatsApp_Image_2019-09-16_at_16.28.191.jpeg	Vegetarier, den die vegane Ernährung interessiert	f
1	pbkdf2_sha256$216000$sxnK9vzBi8yj$kzHP9WMlMA+zTczjNm+3Ow9IT4pkf/elNTDvlPYTNxE=	lucas@plantyoptions.de	Falko	2020-12-11 08:09:39.185045+01	2021-04-26 11:30:27.448806+02	t	t	t	t	Lucas	Falkowsky	LF	674E4830-F2B3-4856-8369-86316D1F29F1_E5v8BpN_YBHFX7o.jpeg	What a nice day to eat vegan!	f
\.


--
-- TOC entry 3990 (class 0 OID 34712)
-- Dependencies: 208
-- Data for Name: accounts_article; Type: TABLE DATA; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

COPY public.accounts_article (id, banner, headline, subtitle, article_body, date_created, kcal, carbs, fat, protein, "ingredientList", recipe_id) FROM stdin;
3	imm003_1A_tMTP9Pj.jpg	Veganes Marokko	Hier ein kleines Essay zur kulinarischen Vielfalt veganen Essens in Marokko	Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquy erat, sed diam voluptua. At vero eos etaccusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.	2021-01-07 15:16:29.115485+01	\N	\N	\N	\N	f	\N
4	1022377440-weihnachtsmarkt-muenchen-marienplatz-jantz_20151119-093441-1xs3lun4a7.jpg	Weihnachtsmarkt: Die vegane Steaksemmel	Wie kannst du dir das Traditionsgericht für den kalten Weihnachtsmarkt veganisieren?	Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sitamet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumeirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.	2021-01-07 15:28:14.773819+01	\N	\N	\N	\N	f	\N
1	Leberkas-Semmel-vegan-Vegane-Vibes-Rezept-top.jpg	Veganer Leberkäse	Dieses rezept zeigt dir, wie man veganen Leberkäse aus Fleisch herstellt	Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.	2020-12-19 21:19:57.689453+01	\N	\N	\N	\N	f	\N
2	6D2DD01B-F3EF-43AD-A747-F60F49903BCE_grmtp1x.jpeg	Butternut Ofenkürbis mit Pesto	Hier findest du ein saisonales Rezept für einen leckeren Butternut Ofenkürbis	Der Kürbis ist für Kalorienzähler ein absolutes Superfood. Durch seinen geringen Fett und Kohlehydrat Gehalt glänzt der Butternusskürbis mit nur 38 kcal pro 100g. Das Fruchtfleisch eines ganzen Kürbis kommt folglich auf bis zu knapp 550 kcal und kann zwischen 3 bis 4 Personen als Beilage oder Hauptgericht dienen. Einfach verrückt! In diesem Rezept zeigen wir dir, wie du aus dieser herbstlichen Frucht, ja der Kürbis ist eine Frucht kein Gemüse, einen ausgezeichneten Hauptgang zauberst.	2021-01-07 14:47:09.443624+01	\N	\N	\N	\N	t	2
11	pexels-daniel-lindstrom-14737_680hjWr.jpg	Pasta Pomodoro Classico	Wolltest du schon immer diesen italienischen Klassiker authentisch nachkochen? Wir zeigen dir wie's geht	Als veganer sucht man immer nach traditionsgerichten, welche gut schmecken, schon immer gut geschmeckt haben und auch vegan funktionieren. Auch bei traditioneller italienischer Küche, meiner Meinung nach die beste Hausmannskost der Welt, kann man viele vegane Gerichte finden oder nicht vegane Gerichte veganisieren.\r\n\r\nHeute zeigen wir euch den simplen Klassiker "Pasta Pomodoro", frei übersetzt Nudeln mit Tomatensoße. Viele Nutzen hierfür zuhause passierte Tomaten aus der Dose, Tomatensaft oder ähnliches. Jedoch muss das nicht sein! Mit frischen Tomaten und Basilikum kann man eine Soße kochen, welche nicht nur besser schmeckt, sondern auch aus regionalen Tomaten hergestellt wird. \r\n\r\nViel spaß beim nachkochen und lasst auch euch von der einfachen italienischen Küche begeistern!	2021-01-09 12:43:35.428805+01	\N	\N	\N	\N	t	1
\.


--
-- TOC entry 4017 (class 0 OID 36610)
-- Dependencies: 250
-- Data for Name: accounts_author; Type: TABLE DATA; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

COPY public.accounts_author (id, name) FROM stdin;
\.


--
-- TOC entry 4019 (class 0 OID 36618)
-- Dependencies: 252
-- Data for Name: accounts_blog; Type: TABLE DATA; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

COPY public.accounts_blog (id, name) FROM stdin;
\.


--
-- TOC entry 4002 (class 0 OID 34769)
-- Dependencies: 220
-- Data for Name: accounts_comment; Type: TABLE DATA; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

COPY public.accounts_comment (id, date_created, content, account_id, restaurant_id, ratings) FROM stdin;
88	2021-01-06 15:46:50.101592+01	Mhhhhh. Sehr lecker.	1	4	4
129	2021-02-02 13:35:27.642021+01	Burger waren Mega lecker und vorallem noch sehr Heiß - was uns sehr gewundert hat, da wir nicht gerade ums eck wohnen. Preis/Leistung ist wirklich angemessen. Kann ich nur wärmstens empfehlen.	3	8	5
91	2021-01-10 13:03:57.046269+01	werden die Nudeln auch geliefert?	6	4	5
96	2021-01-29 13:44:32.867821+01	Beste Falaffel der Welt	6	3	5
1	2020-12-11 14:12:10.456946+01	Wow! Total salzige nudeln und vorwurfsvolle Köchin. Immer wieder gerne! Sehr zu empfehlen!	1	4	4
2	2020-12-11 14:13:05.177146+01	Nicht wirklich gut ... naja aber zu dem Preis	1	3	2
103	2021-01-30 19:28:48.927941+01	Viel zu salzig!!!	6	4	2
104	2021-01-31 11:59:46.958012+01	Essen ist nicht gut und dafür noch nicht mal günstig! Aber schönes Logo :)	6	9	1
106	2021-01-31 12:01:37.596366+01	Niemand kann diesen Käserand schlagen!	6	6	5
34	2020-12-12 22:07:07.398193+01	Leckeres veganes und für diese Portionen preiswertes Essen. Sind mit mehreren Personen nach einem Coaching dort gewesen und hatten großen Hunger. Sehr leckeres Essen... tolle hilfsbereite und sehr liebe Mitarbeiter. Danke euch... macht weiter so!	1	1	5
118	2021-02-01 19:59:02.007313+01	Cooles Ambiente und die veganen Speisen sind auch verdammt lecker, aber die Auswahl ist leider sehr gering.	49	10	4
108	2021-01-31 12:03:13.435588+01	Veganer Kuchen ist super!	6	11	5
110	2021-01-31 12:05:45.249623+01	Schnelle Lieferzeiten	6	5	5
117	2021-02-01 19:57:27.919441+01	Die Kuchen sind sehr lecker nur das Personal ist unfreundlich.	49	11	3
112	2021-02-01 12:07:19.950697+01	Beste Falafel der Stadt!	6	12	5
111	2021-01-31 13:18:46.049741+01	Die Falafel ist top. Frisch zubereitet und lecker, alles Handgemacht und gute Zutaten. Manchmal muss man sehr lange warten aber es lohnt sich.	3	12	4
113	2021-02-01 19:51:39.811222+01	Essen ist qualitativ sehr schlecht und das vegane Angebot ist auch mangelhaft. Die 2 Sterne gibt es ausschließlich für das schöne Logo.	49	9	2
114	2021-02-01 19:53:17.100928+01	Nur zu empfehlen!	49	12	5
115	2021-02-01 19:55:18.446786+01	Hm also ich habe schon bessere Falafel gegessen, aber so einen coolen Besitzer wie Luis gibt es sonst nirgends.	49	3	4
116	2021-02-01 19:56:35.5053+01	Mozzarella Burger!!!! Den muss man mal gegessen haben.	49	8	5
130	2021-02-02 13:36:44.452251+01	Sehr zufrieden essen kommt immer warm an Salat ist immer frisch und burger schmecken super! Nur die Pommes schmecken wie von gestern aufgewärmt.	6	8	4
101	2021-01-30 18:52:57.538025+01	Sehr zu empfehlen!	3	3	5
131	2021-02-02 13:38:28.987388+01	Große Auswahl an leckeren veganen Burgern!	50	8	4
119	2021-02-01 20:03:48.588242+01	absolut ekliges Essen und es ist überall dreckig. Personal war auch nicht nett.	3	9	1
121	2021-02-02 13:13:58.334673+01	Fürs Mittagessen war mir das Falafel-Sandwich etwas zu klein. Geschmacklich perfekt! Komme gerne wieder!	18	12	4
102	2021-01-30 18:53:57.038713+01	Nicht so lecker, aber billig.	3	6	2
122	2021-02-02 13:23:55.654731+01	Sehr sehr lecker! Alle Sterne verdient!	1	12	5
123	2021-02-02 13:25:40.439484+01	Falafel war sehr gut!\r\nHimmlisch!\r\n\r\nVielleicht überlegt ihr,  wie es mit der Bezahlung noch gehen könnte.\r\nGeld in der Hand, dann wieder mit den Lebensmittel arbeiten ist nicht ideal.	2	12	3
124	2021-02-02 13:30:09.220835+01	Vorweg: das Essen war prinzipiell ganz gut, Vor allem für den günstigen Preis.\r\n\r\nJedoch erhielt ich ein falsches Gericht für den Preis des teureren (welches ich ursprünglich bestellt hatte). Auch ist alles ziemlich fettig und frittiert. Der Salat und auch der Hummus waren sehr gut.	18	3	3
125	2021-02-02 13:31:22.808735+01	Sehr lecker!\r\nausgesprochen freundliche Jungs sorgen für freundlichen Service	2	3	4
126	2021-02-02 13:32:56.136917+01	Die Bestellung kam komplett falsch an, nicht das was bestellt wurde.\r\nHabe allerdings einen Gutschein von 10€ bekommen und haben sich mehrmals entschuldigt.\r\nWerde dort trotzdem nicht nochmal bestellen.	18	8	1
127	2021-02-02 13:33:51.626938+01	Das Essen war sehr gut, die Lieferung pünktlich und an sich fast alles in Ordnung. Allerdings sollte der Koch eventuell mehr auf seinen Haarausfall achten.. So lecker das Essen auch war, wir hatten mindestens 4 Haare im Essen und das ist schon echt ekelerregend. Ansonsten geschmacklich top.	2	8	2
128	2021-02-02 13:34:32.091893+01	Preis/Leistung ist super. Die Burger sind groß, frisch, noch warm und sehr lecker. Bestellen öfters und sind immer voll zufrieden. Der Lieferant ist freundlich und das essen wird schnell geliefert. Macht weiter so.	1	8	5
132	2021-02-02 13:52:00.594648+01	Die Kaffes und die Bagels waren Top.\r\n\r\nNur die WC sollten öfters gereinigt werden.	50	11	4
133	2021-02-02 13:53:01.15994+01	Haben sehr lecker gefrühstückt und eine nette Bedienung gehabt! Essen ist immer gut hier. Bei der Bedienung kommt es drauf an.. mussten auch schon eine halbe Stunde warten bis wir bedient wurden. Trotzdem ein guter Laden!	1	11	4
134	2021-02-02 13:53:44.488543+01	Sehr guter Kaffee, dazu ein super leckeres Stück Kuchen und absolut freundlicher Service... Was will man mehr?!	2	11	5
135	2021-02-02 13:54:54.549531+01	Sehr schönes Ambiente, super leckeres Essen (Käsekuchen, Pizza, ...) und super Kakao! Außerdem seeehr nettes Personal - besonderes Lob an den lustigen Kellner. Die ganze Familie kommt wieder! :)	3	11	5
136	2021-02-02 13:56:09.330662+01	Der Service ist leider sehr langsam und wenig freundlich oder serviceorientiert.\r\nTische wurden nicht desinfiziert, die Speisekarten ebenfalls nicht, diese waren zudem sehr gammelig und abgegriffen.\r\nFrühstück war gut und die Menge großzügig, man braucht allerdings sehr viel Geduld.\r\nDie Toilette sind eine Katastrophe, sehr ungepflegt und dreckig. Da möchte man gar nicht wissen, wie es in der Küche aussieht.	18	11	1
144	2021-02-02 19:14:36.827921+01	Wow....dieses Restaurant kann ich nur empfehlen...vom Service, Geschmack bis zum Preis alles wunderbar	6	10	4
145	2021-02-02 19:15:27.885188+01	Das Essen ist sehr gut.\r\nNicht teuer.\r\nBedienung freundlich.\r\nNur das vegane Angebot ist nicht gerade umfangreich.	1	10	3
146	2021-02-02 19:17:05.180953+01	Lahmer Service. Essen ging so. Auswahl katastrophal.	18	10	1
147	2021-02-02 19:17:39.69145+01	Typischer Biergarten, gutes Essen und Bier. Nette und flotte Bedienung	2	10	5
148	2021-02-02 19:35:50.037274+01	Nicht unbedingt für Veganer geeignet bzw. man sollte sich vorher schon die Speisekarte anschauen und schauen ob man auf eins der ca 2 veganen Speisen lust hat. Ansonsten ist es gut.	50	10	2
149	2021-02-02 19:37:18.273725+01	Schöner, entspannter Biergarten, bloß bitte keinen Kaffe dort trinken, der schmeckt nicht!	3	10	5
150	2021-02-02 20:13:28.027579+01	Schlechte Leistung McDonald's! Das Personal ist freundlich, aber furchtbar nicht effizient! Bestellungen können bis zu 15 Minuten dauern, oft falsch oder fehlende grundlegende Dinge, wie Strohhalme, Servietten oder Saucen! Das Restaurant ist auch nicht furchtbar sauber, Essen und Müll sind oft auf dem Boden! Das Essen ist 9 mal von 10 perfekt fein und sehr lecker, aber das umliegende Restaurant und Das Personal sind schockierend!	2	9	1
151	2021-02-02 20:15:13.528237+01	Die Burger waren nicht so heiss wie gewohnt, sonst alles ok	18	9	3
152	2021-02-02 20:20:04.724315+01	schrecklich! Veganes Angebot mangelhaft und auch nicht gerade gut. Das Restaurant ist jedoch sehr schön.	1	9	2
153	2021-02-02 22:08:11.838387+01	Hier gibt es die beste Vegane Pasta der Welt. Jede Woche gibt es Abwechslung und das Personal sehr freundlich. Kann ich jedem nur empfehlen.	3	1	5
154	2021-02-02 22:13:21.494729+01	Das Essen ist wirklich super lecker und das Preisleistungsverhältnis ist auch mega gut. Also ein netter Veganer Laden.\r\nPunkt Abzug für den fehlenden Parkplatz und dafür das unsere Teller schon abgeräumt wurden, bevor alle am Tisch fertig waren.	6	1	4
155	2021-02-02 22:14:55.712938+01	Sehr guter Service, Flair und Essen. Preise auch voll ok. Außerdem ist der Name Top :P	2	1	5
156	2021-02-02 22:15:42.550237+01	Super lecker!	18	1	5
157	2021-02-02 22:16:49.131784+01	5 Sterne fürs Essen 3 für den Rest - die Arbeitskräfte waren so strak unterbesetzt, dass wir mehr als eine Stunde (!!) Auf das Essen und auf die Getränke gewartet haben...	49	1	4
158	2021-02-02 22:17:27.098787+01	Super klasse vegane Gerichte, sehr köstlich,hervorragende Tomaten Kokos Suppe und Pasta. Ein muss zum trinken, sind die Limonaden. Besonders Orangen - Ingwer... bestellt die grosse. Sonst zu wenig!\r\nAch übrigens, die Bedienung ist sehr herrzlich!	50	1	5
159	2021-02-02 22:18:47.179594+01	Essen mit 12 Personen, Bedienung war leicht überfordert...Menge an Antipasti war nicht ausreichend....Tomatensuppe war lecker....Brot wurde nach Aufforderung leider abgezählt nachgereicht...Kaffee war lecker mit Mandelmilch und Bio Agavendicksaft....	48	1	3
160	2021-02-02 22:43:26.053049+01	Sehr leckere vegane Optionen. Der Döner schmeckt spitze, ebenso die Pizza und der Dürüm. Können wir alles nur wärmstens empfehlen! Wir bestellen gerne wieder von dort.:)	2	5	5
161	2021-02-02 22:43:53.005727+01	Normal, vegetarisch oder vegan, alles ist super lecker. Lieferungen kommen mega schnell. Die Mitarbeiter sind alle sehr freundlich und sogar hilfsbereit.	1	5	5
162	2021-02-02 22:44:16.186398+01	Bester Veganer Döner	18	5	5
163	2021-02-02 22:45:02.998458+01	Schon krass der Lieferer sich einfach mein Rückgeld eingesteckt hat, ohne dass ich ich gesagt hab dass er den Rest behalten darf? Essen war trotzdem sehr lecker	50	5	3
164	2021-02-02 22:45:33.353973+01	Die Einrichtung ist furchtbar alt und versifft und fällt schon beinahe auseinander. Dem gegenüber steht der geilste vegane Döner weit und breit. Kein Falafel, sondern Seitan vom Dönerspieß, welches ziemlich echt schmeckt. Gerne wieder.	48	5	4
165	2021-02-02 22:46:37.816113+01	Sehr lecker und auch nicht zu wenig. Aber auch nicht der billigste. Dennoch jederzeit gern wieder	49	5	4
166	2021-02-02 22:47:22.52184+01	Der schlechteste döner, den ich je gegessen habe	3	5	1
167	2021-02-03 11:59:40.623151+01	Ich liebe asiatisch!	6	2	5
168	2021-02-03 12:07:18.430586+01	Ich würde gerne ein weiteres mal das schöne Logo loben!	6	9	1
169	2021-02-03 22:10:07.014273+01	Sehr gut!	2	13	4
\.


--
-- TOC entry 4004 (class 0 OID 34827)
-- Dependencies: 222
-- Data for Name: accounts_coworker; Type: TABLE DATA; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

COPY public.accounts_coworker (id, name, picture, email, social, title, bio) FROM stdin;
4	Anne Fleig	DSC03376_U1RAyeM.jpg	anne@plantyoptions.de	https://www.instagram.com/annefleig	Mitgründer*in	Geografic Information Director
1	Lucas Falkowsky	DSC03159.jpg	lucas@plantyoptions.de	https://www.instagram.com/falkowskylucas/	Mitgründer*in	Data Management Director
3	Robin Geramb	DSC03209.jpg	robin@plantyoptions.de	https://www.instagram.com/robingrmb/	Mitgründer*in	Full Stack Development Director
2	Luis Bauer	DSC03278_VXYIAb8.jpg	luis@plantyoptions.de	https://www.instagram.com/theluisbauer/	Mitgründer*in	Creative/Design Director
\.


--
-- TOC entry 4021 (class 0 OID 36626)
-- Dependencies: 254
-- Data for Name: accounts_entry; Type: TABLE DATA; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

COPY public.accounts_entry (id, headline, point, blog_id) FROM stdin;
\.


--
-- TOC entry 4023 (class 0 OID 36637)
-- Dependencies: 256
-- Data for Name: accounts_entry_authors; Type: TABLE DATA; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

COPY public.accounts_entry_authors (id, entry_id, author_id) FROM stdin;
\.


--
-- TOC entry 3998 (class 0 OID 34750)
-- Dependencies: 216
-- Data for Name: accounts_food; Type: TABLE DATA; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

COPY public.accounts_food (id, name, category, rating, price, description, restaurant_id, "toGoPrice") FROM stdin;
2	Salznudeln	Vegan	1	3	Sehr Salzig	4	\N
5	Königsberger Klopse	Vegan	2	2	Hausgemachte Klopse	4	\N
6	Spaghetti Salzonese	Vegetarian	5	5	Nudeln mit Sahnesoße und Salz	4	\N
3	Salzknödel	Vegetarian	3	3	Leckere Knödel mit salziger Soße	4	\N
13	Falafel	Vegetarian	1	5	Falafel Wrap	3	\N
12	Falafel	Vegan	3	4	Falafel Wrap	12	\N
29	Moving Mountains Burger	Vegan	3	12.5	mit 170g Erbsenprotein-Pattie, Salat und veganem Dressing	8	\N
30	Barbecue Bacon Beyond Meat	Vegan	1	14.5	mit Beyond Patty auf Lavastein Grill gegrillt mit veganem Bacon, veganem Käse, Salat und Barbecuesauce	8	\N
34	Espresso	Vegan	1	3	\N	11	\N
9	Salzkäse	Vegetarian	4	5	Lecker	4	\N
8	Pfannkuchen	Vegetarian	3	3	Leckere Pfannkuchen mit Salz	4	\N
7	Frikadellen	Vegan	4	3.5	4 Hausgemachte Frikadellen	4	3
47	Falafel Salat	Vegetarian	1	7	Falafel, Gurken, Tomaten, Sesampaste, Joghurt	3	\N
4	Ramen	Vegan	4	2	Asiatische Rakemen mit Shitake Pilzen und Salz	4	5
28	Original Beyond Meat Burger	Vegan	2	12	mit Salat und veganer Käsesauce	8	\N
27	Chili-Cheese Beyond Meat Burger	Vegan	1	14.5	mit Vegankäse, Jalapenos, Eisbergsalat, Tomaten, Zwiebeln, veganer Chilisauce und veganer Mayonnaise	8	\N
26	Mozzarella Burger	Vegetarian	2	7	mit Salat und Dressing	8	\N
25	Halloumi Burger	Vegetarian	1	7	mit Salat und Dressing	8	\N
24	Falafel Sandwich	Vegan	1	6	mit Grillgemüse	3	\N
23	Falafel Teller	Vegan	1	9	mit Salat, Wildgurken, Hummus, Tabouleh und Sesamsauce	3	\N
22	Falafel Teller	Vegetarian	1	7	Falafel mit Hummus, Salat, Saucen und Brot	12	\N
21	Maqali Sandwich	Vegan	1	5	frittierte Kartoffeln, Zucchini, Auberginen und Karotten	12	\N
20	Halloumi Sandwich	Vegetarian	1	4.5	frittierter Käse aus Kuh- und Ziegenmilch	12	\N
19	Falafel Sandwich	Vegetarian	1	4.5	frittierte Bällchen aus pürierten Kichererbsen, Petersilie, Koriander und Gewürzen	12	\N
18	Frohnatur	Vegan	1	8	Bulgur-Kräuter-Bratling, Guacamole, junger Spinat mit Knoblauchmayo	8	\N
42	Falafel Halloumi Box	Vegetarian	1	8.9	6 Falafel-Bällchen, Zypern-Käse gegrillt, gemischter Salat, Hummus, eingelegte Gurke	3	\N
48	Pizza Margherita	Vegan	1	6	mit veganem Käse	11	\N
32	Tomate Mozzarella Bagel	Vegetarian	1	5	\N	11	\N
31	Joghurt Fruchtbagel	Vegetarian	2	4.8	kurz angebratenes Ratatouille Gemüse und Guacamole, Olivenöl	11	\N
35	Cappuccino	Vegan	2	4	mit Mandelmilch, Sojamilch oder Hafermilch	11	\N
36	Latte Macchiato	Vegan	1	4	mit Mandelmilch, Sojamilch oder Hafermilch	11	\N
38	Glühwein	Vegan	1	3	\N	12	\N
39	Falafel Box	Vegan	2	7.9	Falafel-Bällchen, gemischter Salat, Hummus, eingelegte Gurke	12	\N
40	Mini Falafel	Vegan	2	3	\N	12	\N
41	Curry-Falafel Wrap	Vegetarian	2	4	\N	12	\N
43	Falafel Wrap	Vegan	3	4	mit Knoblauch-Cream	3	\N
14	Pommes	Vegan	1	3	mit 2 Dips	8	\N
15	Curly Fries	Vegan	1	3.5	mit 2 Dips	8	\N
45	Biryani-Reis	Vegan	2	3.5	\N	3	\N
37	Käsekuchen	Vegetarian	1	4	\N	11	\N
33	Schokokuchen	Vegan	1	4	\N	11	\N
46	Fatusch Salat	Vegan	1	4.9	Tomaten, Gurken, Fladenbrot, Balsamico, Olivenöl	3	\N
56	Kleiner gemischter Salat	Vegetarian	2	3.9	verschiedene Salate, gemischt und bunt	10	\N
57	Hausgemachte Käsespätzle	Vegetarian	2	7.9	mit Schmorzwiebeln	10	\N
58	Portion Salzkartoffeln	Vegan	2	2.9	\N	10	\N
59	Veganer Leberkäse	Vegan	2	6	mit Beilage und Salat	10	\N
60	Semmelködel	Vegan	2	9	mit Beilage und Salat	10	\N
61	Mc Planty	Vegan	2	4	Beyond Meat Patty, vegane Mayonnaise, Barbecuesoße, Salat, Tomate, Gurke	9	\N
62	Pommes	Vegan	2	2	\N	9	\N
63	Veggie Burger	Vegetarian	2	4	Süßkartoffel Patty	9	\N
64	Spaghetti Napoli	Vegetarian	2	7.8	mit pikanter Tomatensauce	1	\N
17	Räubertochter	Vegetarian	2	9	Walnuss-Sellerie-Bratling, Champignons, Wildkräuter mit Federleicht-Mayo	8	\N
16	Holde Maid	Vegetarian	1	9	Süßkartoffel-Amaranth-Bratling, würziger Bernsteinkäse mit cremiger Guacamole	8	\N
10	Tinkerbell Burger	Vegan	0	7.5	Leckerer Trüffelburger mit Süßkartoffelpatty und frischem Gemüse	8	\N
65	Spaghetti Pomodoro	Vegetarian	2	9	mit Sugo di Pomodoro, Basilikum, Zwiebeln, Knoblauch	1	\N
66	Rigatoni Gorgonzola	Vegetarian	1	11	mit Gorgonzolasauce	1	\N
67	Panzerotti Spinaci	Vegetarian	1	11	mit Spinat, Sahnesauce, Zwiebeln und Knoblauch	1	\N
68	Insalata Mista	Vegan	1	6.2	gemischter Baby Leaf Salat mit Kirschtomaten, Gurken, Radieschen und Haus-Dressing	1	\N
69	Insalata Caesare	Vegetarian	2	9	Romanasalat mit Knoblauchcroutons, Grana Padano DOP und Caesare-Dressing	1	\N
70	Al Forno	Vegan	1	9.9	Ofengemüse der Saison in Tomatensoße	1	\N
71	Pesto Verde	Vegan	1	7.5	Petersilie-Zitrone mit Cashews	1	\N
72	Mafioso	Vegan	1	9.9	Getrocknete Tomaten, Oliven, Chili, Pinienkerne & Rucola	1	\N
73	Pizzabrot	Vegan	1	5.1	mit Tomatensauce	5	\N
74	Pizza Margherita	Vegetarian	2	6	mit Tomatensauce und Mozzarellaz	5	\N
75	Pizza Peppe	Vegan	2	6.5	mit Peperoni	5	\N
76	Pizza Vegetaria	Vegetarian	3	9.8	mit Paprikamix, Oliven, Mais, Broccoli und Spinat	5	\N
77	Falafel Dürüm	Vegetarian	1	6.7	dünnes Fladenbrot gefüllt mit Salat, Kraut, Tomaten und Joghurt-Dressing	5	\N
78	Vegetarischer Döner	Vegetarian	1	5.7	im Fladenbrot mit Zwiebeln, Salat, Kraut, Tomaten, Käse, Oliven, Mais und Joghurtdressing	5	\N
79	Vegan Döner Sandwich	Vegan	2	6	\N	5	\N
80	Noodle Bowl	Vegetarian	1	7.5	mit Natur-Tofu	2	\N
81	Noodle Soup	Vegetarian	2	7.9	mit Natur-Tofu	2	\N
82	Avocado-Rollen	Vegan	1	3.9	\N	2	\N
83	Pizzabrot	Vegan	0	4.9	Pizzabrot mit Tomatensauce, Olivenöl Extra Virgine	13	4.9
84	Pizza Margherita	Vegetarian	0	6.9	Pizza mit Tomatensauce, Mozzarella, Olivenöl Extra Vergine	13	6.9
90	Pizza Caprese	Vegetarian	0	7.9	Pizza mit Tomatensauce, Mozzarella, Tomatenscheiben, Basilikum, Olivenöl Extra Vergine	13	7.9
93	Pizza Carciofini	Vegan	0	10.9	Pizza mit Tomatensauce, veganem Schmelzkäse, Artischocken und Oliven, Olivenöl Extra Vergine	13	10.9
95	Kleiner gemischter Salat	Vegetarian	0	3.9	verschiedene Babyleaf Blattsalate, Rucolablätter, sonnengereifte Tomaten, knackige Gurken und gesunde Karottenstreifen	13	3.9
96	Kleiner gemischter Salat mit Balsamico Dressing	Vegan	0	3.9	verschiedene Babyleaf Blattsalate, Rucolablätter, sonnengereifte Tomaten, knackige Gurken und gesunde Karottenstreifen	13	3.9
97	Henry's Salat	Vegetarian	0	11.9	verschiedene Babyleaf Blattsalate, Rucolablätter, gebratene Zucchini und Auberginenstreifen, mit Schafskäse und Power-Avocado	13	11.9
87	Pizza Funghi	Vegan	0	10.9	Pizza mit Tomatensauce, veganem Schmelzkäse, Champignons, Olivenöl Extra Vergine	13	10.9
89	Pizza Peperoni	Vegan	0	10.9	Pizza mit Tomatensauce, veganem Schmelzkäse, Peperoni, Olivenöl Extra Vergine	13	10.9
99	Cola Light	Vegan	5	3	Ohne Zucker	13	4
98	Pizza Vegetaria	Vegan	0	9.9	Pizza mit Tomatensauce, veganem Schmelzkäse, Auberginen, Artischocken, Zucchini, Champignons, Oliven, Olivenöl Extra Vergine	13	11.9
\.


--
-- TOC entry 4000 (class 0 OID 34761)
-- Dependencies: 218
-- Data for Name: accounts_food_tags; Type: TABLE DATA; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

COPY public.accounts_food_tags (id, food_id, tag_id) FROM stdin;
2	2	4
3	3	8
4	4	9
5	4	4
6	5	8
7	5	10
8	6	11
9	6	4
10	7	10
11	8	10
12	3	9
13	3	10
14	3	11
15	3	4
16	9	12
17	9	13
18	10	1
20	12	3
21	13	3
24	16	1
25	17	1
26	18	1
27	19	3
28	20	3
29	21	3
30	22	3
31	23	3
32	24	3
33	25	1
34	26	1
35	27	1
36	28	1
37	29	1
38	30	1
39	31	17
40	32	17
41	33	21
42	34	22
43	35	22
44	36	22
45	37	21
46	38	23
47	39	3
48	40	3
49	41	3
50	42	3
51	43	3
53	14	24
54	15	24
55	45	24
56	46	25
57	47	25
58	48	5
66	56	25
67	57	14
68	58	24
69	59	14
70	60	8
71	61	1
72	62	2
73	63	1
74	64	4
75	65	4
76	66	4
77	67	4
78	68	25
79	69	25
80	70	4
81	71	4
82	72	4
83	73	5
84	74	5
85	75	5
86	76	5
87	77	6
88	78	6
89	79	6
90	80	9
91	81	28
92	82	29
93	83	5
94	84	5
97	87	5
99	89	5
100	90	5
103	93	5
105	95	25
106	96	25
107	97	25
108	98	5
109	99	23
\.


--
-- TOC entry 4027 (class 0 OID 36949)
-- Dependencies: 260
-- Data for Name: accounts_friendlist; Type: TABLE DATA; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

COPY public.accounts_friendlist (id, user_id) FROM stdin;
3	1
4	2
1	3
2	5
5	6
\.


--
-- TOC entry 4029 (class 0 OID 36959)
-- Dependencies: 262
-- Data for Name: accounts_friendlist_friends; Type: TABLE DATA; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

COPY public.accounts_friendlist_friends (id, friendlist_id, account_id) FROM stdin;
1	3	2
2	3	3
3	4	1
4	4	3
5	1	1
6	1	2
\.


--
-- TOC entry 4025 (class 0 OID 36941)
-- Dependencies: 258
-- Data for Name: accounts_friendrequest; Type: TABLE DATA; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

COPY public.accounts_friendrequest (id, is_active, "timestamp", receiver_id, sender_id) FROM stdin;
\.


--
-- TOC entry 4035 (class 0 OID 43565)
-- Dependencies: 268
-- Data for Name: accounts_ingredient; Type: TABLE DATA; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

COPY public.accounts_ingredient (id, name, kcal, carbs, protein, fat) FROM stdin;
1	Tomate	19	3.5	0.7	0
2	Zwiebel	33	6	1	0
3	Knoblauch	145	28.5	6	0.1
4	Basilikum	62	7.7	0.8	2.5
5	Tomatenmark	82	19	4.3	0.5
6	Olivenöl	884	0	0	0
7	Pasta (Hartweizengrieß)	346	69	12	1.6
8	Pinienkerne	673	13	14	68
9	Hefeflocken	341	9.1	48.1	6.4
10	Koriander	22	0.9	2	0.5
11	Petersilie	36	6	3	0.8
12	Zitronensaft	29	9	1.1	0.3
13	Butternusskürbis	38	8.3	1	0.1
14	Bedda Hirte	260	14	1.5	22
\.


--
-- TOC entry 4039 (class 0 OID 43664)
-- Dependencies: 272
-- Data for Name: accounts_ingredientvalue; Type: TABLE DATA; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

COPY public.accounts_ingredientvalue (id, "valueInGrams", ingredient_id, "otherValue", "otherValueName") FROM stdin;
6	450	1	\N	\N
9	20	4	\N	\N
10	50	5	\N	\N
12	500	7	\N	\N
8	6	3	1	Zehe
7	40	2	1	Stück
13	140	8	\N	\N
14	100	9	\N	\N
16	10	10	3	Stiele
17	10	11	3	Stiele
18	55	12	1	Zitrone
19	1500	13	1	Frucht
15	135	6	150	ml
20	150	14	\N	\N
11	20	6	20	ml
\.


--
-- TOC entry 4033 (class 0 OID 43445)
-- Dependencies: 266
-- Data for Name: accounts_rd_update; Type: TABLE DATA; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

COPY public.accounts_rd_update (id, rd_opened) FROM stdin;
2	0
3	0
4	0
5	0
6	0
1	0
\.


--
-- TOC entry 4037 (class 0 OID 43599)
-- Dependencies: 270
-- Data for Name: accounts_recipe; Type: TABLE DATA; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

COPY public.accounts_recipe (id, name, duration, portions, instructions) FROM stdin;
1	Pasta Pomodoro Classico	0.5	4	1. Zuerst kannst du den Knoblauch und die Zwiebel schälen und in kleine Würfel schneiden. Anschließend erhitzt du einen Topf mit Olivenöl und schwitzt darin die klein geschnittenen Würfelchen an, bis diese Glasig sind. Während dessen kannst du die Tomaten in kleine Würfel schneiden und dann mit in den Topf geben. Dem Topfinhalt solltest du nun ein wenig Salz beigeben, damit dem Gemüse die Flüssigkeit entzogen wird und diese besser einkochen können. Lass das ganze nun ungefähr 5 Minuten auf dem Herd.\r\n\r\n2. Gib, wenn dir die Soße zu dick ist, ein wenig (bis zu 100ml) Wasser hinzu. Gib zudem noch 3EL Tomatenmark zu der Soße, um diese mehr Umami zu machen und lass es weiter köcheln.\r\n\r\n3. Nun kannst du nebenbei bereits Das Nudelwasser ansetzen, zum Kochen bringen, salzen und die Nudeln darin kochen.\r\n\r\n4. Was ist denn mehr Italien als Basilikum. Gib die Blätter ganz oder grob geschnitten zu der Tomatensoße und lass alles weitere 10 Minuten leicht köcheln. Anschließend kannst du die Soße mit Gewürzen nach belieben verfeinern. Wir empfehlen ausschließlich Salz und Pfeffer zu verwenden und, wenn gewollte zusätzlich Italienische Kräuter oder Kräuter der Provence hinzuzufügen. Mehr braucht die Soße nicht.\r\n \r\n5. Jetzt kannst du die Pasta, wenn diese 'al dente' gekocht ist mit einem Nudelsieb abseihen, auf einen Teller geben und mit der Soße, einem Schuss Olivenöl und Basilikum servieren. \r\n\r\nBuon Appetito!
2	Butternut Ofenkürbis mit Pesto	1	3	1. Die Pinienkerne, die Hefeflocken und ca. 100ml Olivenöl mit dem Mixer oder Pürierstab zu einem Pesto mixen und mit Salz, Pfeffer und nach belieben auch mit anderen Gewürzen den Geschmack verfeinern. \r\n\r\n2. Den Koriander und die Petersilie grob mit dem Messer klein hacken und zum Pesto dazu geben geben. Würde man sie ebenfalls mit dem Mixer oder dem Pürierstab mixen, wären die Stückchen am Ende viel zu fein für ein Pesto.\r\n\r\n3. Den Ofen nun schon einmal auf 200°C vorheizen lassen, während du den Butternut Kürbis je nach Dicke in 3 oder 4 gleichdicke Scheiben schneiden und entkern kannst.\r\n\r\n4. Die Kürbisscheiben Längs und Quer leicht einritzen und mit dem restlichen Olivenöl (50ml) bestreichen. Salze die Scheiben gut von beiden Seiten. \r\n\r\n5. Lege die scheiben auf ein mit Backpapier ausgelegtes Backblech und lass sie für 45 bis 50 Minuten Garen. Wenn du merkst, dass die Scheiben weich sind kannst du sie aus dem Ofen nehmen und auf Tellern mit dem Pesto, verschiedenem Gemüse und (wenn vorrätig) mit dem veganen Hirtenkäse servieren. \r\n\r\nZu diesem Gericht eigenet sich außerdem Baguette oder Brot aller Art als kleine Beilage.
\.


--
-- TOC entry 4041 (class 0 OID 43672)
-- Dependencies: 274
-- Data for Name: accounts_recipe_ingredients; Type: TABLE DATA; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

COPY public.accounts_recipe_ingredients (id, recipe_id, ingredientvalue_id) FROM stdin;
1	1	6
2	1	7
3	1	8
4	1	9
5	1	10
6	1	11
7	1	12
8	2	13
9	2	14
10	2	15
11	2	16
12	2	17
13	2	18
14	2	19
15	2	20
\.


--
-- TOC entry 3994 (class 0 OID 34731)
-- Dependencies: 212
-- Data for Name: accounts_restaurant; Type: TABLE DATA; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

COPY public.accounts_restaurant (id, restaurant_picture, name, address, city, "houseNumber", state, zip_code, latitude, longitude, fri, mon, sat, sun, thu, tue, wed, affordability, "averageRating", description) FROM stdin;
11	dampfender-schwarzer-kaffee-1200x900.jpg	Coffeworld	Philippine-Welser-Straße	Augsburg	4	Germany	86150	48.3682700	10.8970600	8:30 - 23:00 Uhr	08:00 - 21:00 Uhr	08:30 - 23: 00 Uhr	09:00 - 20:00 Uhr	08:00 - 21:00 Uhr	08:00 - 21:00 Uhr	08:00 - 21:00 Uhr	1	3.857142857142857	Coffeworld bietet ihnen kulinarische Vielfalt an Kaffeesorten, sowie eine Auswahl an im Steinofen gebackenen Pizzen.
6	pizza_fresca.jpg	Pizza La Perla	Prinzregentenstraße	Augsburg	27	Bayern	86150	48.3679500	10.8891000	15:00 - 00:00 Uhr	15:00 - 22:00 Uhr	15:00 - 00:00 Uhr	15:00 - 00:00 Uhr	15:00 - 22:00 Uhr	15:00 - 22:00 Uhr	15:00 - 22:00 Uhr	1	3.5	Pizzeria
9	unnamed.jpg	Mc Ronalds	Vorderer Lech	Augsburg	6	Germany	86161	48.3659300	10.9012600	05:00 - 24:00, 24:00 - 03:00	05:00 - 24:00, 24:00 - 03:00	05:00 - 24:00, 24:00 - 03:00	05:00 - 23:00	05:00 - 24:00, 24:00 - 03:00	05:00 - 24:00, 24:00 - 03:00	05:00 - 24:00, 24:00 - 03:00	1	1.5714285714285714	Fast Food Restaurant.
12	LPA024204Moritzplatz_831.jpg	Prinzen Falafel	Moritzplatz	Augsburg	1	Bayern	86150	48.3671300	10.8976600	11:30 - 18:00 Uhr	11:30 - 18:00 Uhr	11:30 - 17:00 Uhr	geschlossen	11:30 - 18:00 Uhr	11:30 - 18:00 Uhr	11:30 - 18:00 Uhr	1	4.333333333333333	Wir sind ein kleiner Stand am Moritzplatz und verkaufen leckere Falafel Wraps für unterwegs.
10	kaelberhalle-augsburg_hasenbraeu-biergarten.jpg	Kalbshalle	Berliner Allee	Augsburg	36	Germany	86153	48.3724700	10.9175100	11:30 - 23:00 Uhr	11:30 - 23:00 Uhr	11:30 - 23: 00 Uhr	11:30 - 23:00 Uhr	11:30 - 23:00 Uhr	11:30 - 23:00 Uhr	11:30 - 23:00 Uhr	1	3.4285714285714284	Das Brauhaus in der Kalbshalle ist eine Brauerei und Braterei in Augsburg.
8	5a33ada59c42f2000136f67d_mmburger_vegan_plantbased.jpg	Crusty Crab	Wendelsteinstraße	Augsburg	1	Germany	25474	48.3537900	10.9482000	15:00 - 00:00 Uhr	15:00 - 22:00 Uhr	15:00 - 00:00 Uhr	geschlossen	15:00 - 22:00 Uhr	15:00 - 22:00 Uhr	15:00 - 22:00 Uhr	2	3.7142857142857144	Burger sind unsere Leidenschaft.
3	Air-Fryer-Falafel-Lead0006-3.jpg	Luis Falafel	Pfarrhausstraße	Augsburg	6	Bayern	86154	48.3804500	10.8795100	11:30 - 18:00 Uhr	11:30 - 18:00 Uhr	11:30 - 17:00 Uhr	geschlossen	11:30 - 18:00 Uhr	11:30 - 18:00 Uhr	11:30 - 15:00 Uhr	1	3.8333333333333335	Ein sehr kleines aber gemütliches Falafel-Restaurant im Stadtteil Oberhausen.
1	pexels-photo-1087906.jpeg	Robins Küche	Wendelsteinstraße	Augsburg	9	Bayern	86163	48.3537900	10.9482000	8:30 - 23:00 Uhr	15:00 - 22:00 Uhr	08:30 - 23: 00 Uhr	geschlossen	15:00 - 22:00 Uhr	15:00 - 22:00 Uhr	15:00 - 22:00 Uhr	2	4.5	Wir machen unsere Nudeln selbst!
13	henrys_pizza_030322_1530.png	Henrys Pizza	Berliner Allee	Augsburg	36	Bayern	86153	48.3724700	10.9175100	11:30 - 14:30 Uhr, 17:00 - 23:00 Uhr	11:30 - 14:30 Uhr, 17:00 - 22:00 Uhr	11:30 - 23:00 Uhr	11:30 - 22:00 Uhr	11:30 - 14:30 Uhr, 17:00 - 22:00 Uhr	11:30 - 14:30 Uhr, 17:00 - 22:00 Uhr	11:30 - 14:30 Uhr, 17:00 - 22:00 Uhr	1	4	Wir liefern frei Haus. Mindestbestellwert je nach Entfernung vom Schlachthofquartier. Genügend Parkplätze bei Selbstabholung vor Ort
4	gettyimages-848649998_1531902796-1040x690-min.png	Annes Salznudeln	Sallingerstraße	Augsburg	6	Bayern	86154	48.3822900	10.8729600	8:30h - 16:30, 18h - 24h	8:30h - 16:30, 18h - 22h	9:30h - 16:30, 18h - 24h	9:30h - 16:30h	8:30h - 16:30, 18h - 22h	8:30h - 16:30, 18h - 22h	8:30h - 16:30, 18h - 22h	1	3.75	Sehr Salziges Restaurant, im alten Salzbergwerk. Nettes Ambiente mit vielen Interessanten Dekorationen aus Salzgestein. Wer ein Fan von Versalzenem Essen ist kann gerne mal Vorbeischauen. Wir bieten neben Vegetarischem Essen auch Vegan an.
2	large.png	Rice Bar	Viktoriastraße	Augsburg	1	Bayern	86150	48.3666900	10.8866800	15:00 - 00:00 Uhr	15:00 - 22:00 Uhr	15:00 - 00:00 Uhr	geschlossen	15:00 - 22:00 Uhr	15:00 - 22:00 Uhr	15:00 - 22:00 Uhr	1	5	Ein Asiatisches-Restaurant welches Wert auf eine familienfreundlichen Atmosphäre setzt.
5	eat_this_die_perfekte_vegane_pizza-22.jpg	Gourmet	Donauwörtherstr.	Augsburg	4	Bayern	86152	48.3927200	10.8816200	10:00 - 00:00 Uhr	10:00 - 23:00 Uhr	10:00 - 00:00 Uhr	10:00 - 00:00 Uhr	10:00 - 23:00 Uhr	10:00 - 23:00 Uhr	10:00 - 23:00 Uhr	1	4	Steinofenpizza und Döner vom Gourmet im Zentrum von Augsburg.
\.


--
-- TOC entry 4031 (class 0 OID 43423)
-- Dependencies: 264
-- Data for Name: accounts_restaurant_likes; Type: TABLE DATA; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

COPY public.accounts_restaurant_likes (id, restaurant_id, account_id) FROM stdin;
3	3	1
4	2	18
5	2	2
97	4	1
129	5	1
131	4	6
133	2	1
134	4	2
137	12	2
152	8	2
168	12	1
173	11	2
175	1	2
177	3	2
178	3	6
179	11	6
180	4	3
182	12	6
183	3	3
184	13	1
185	9	2
186	3	48
\.


--
-- TOC entry 3996 (class 0 OID 34742)
-- Dependencies: 214
-- Data for Name: accounts_restaurant_tags; Type: TABLE DATA; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

COPY public.accounts_restaurant_tags (id, restaurant_id, tag_id) FROM stdin;
4	3	3
5	4	4
7	5	5
8	5	6
9	6	5
11	8	1
12	9	1
13	10	8
14	10	14
16	11	5
17	11	15
18	12	3
19	8	2
22	1	11
23	2	9
24	13	25
25	13	5
\.


--
-- TOC entry 3992 (class 0 OID 34723)
-- Dependencies: 210
-- Data for Name: accounts_tag; Type: TABLE DATA; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

COPY public.accounts_tag (id, name) FROM stdin;
1	Burger
2	Pommes
4	Nudeln
5	Pizza
6	Döner
7	Space Jam
8	Knödel
9	Asiatisch
10	Deutsch
11	Italienisch
12	Vorspeise
13	Käse
14	Bayerisch
15	Kaffee
3	Falafel
17	Bagel
21	Kuchen
22	Kaffee
23	Getränke
24	Beilagen
25	Salate
26	Snacks
27	Cocktailbar
28	Suppe
29	Sushi
\.


--
-- TOC entry 4012 (class 0 OID 36484)
-- Dependencies: 245
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- TOC entry 4014 (class 0 OID 36494)
-- Dependencies: 247
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- TOC entry 4010 (class 0 OID 36476)
-- Dependencies: 243
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add account	6	add_account
22	Can change account	6	change_account
23	Can delete account	6	delete_account
24	Can view account	6	view_account
25	Can add article	7	add_article
26	Can change article	7	change_article
27	Can delete article	7	delete_article
28	Can view article	7	view_article
29	Can add tag	8	add_tag
30	Can change tag	8	change_tag
31	Can delete tag	8	delete_tag
32	Can view tag	8	view_tag
33	Can add restaurant	9	add_restaurant
34	Can change restaurant	9	change_restaurant
35	Can delete restaurant	9	delete_restaurant
36	Can view restaurant	9	view_restaurant
37	Can add food	10	add_food
38	Can change food	10	change_food
39	Can delete food	10	delete_food
40	Can view food	10	view_food
41	Can add comment	11	add_comment
42	Can change comment	11	change_comment
43	Can delete comment	11	delete_comment
44	Can view comment	11	view_comment
45	Can add coworker	12	add_coworker
46	Can change coworker	12	change_coworker
47	Can delete coworker	12	delete_coworker
48	Can view coworker	12	view_coworker
49	Can add rating	13	add_rating
50	Can change rating	13	change_rating
51	Can delete rating	13	delete_rating
52	Can view rating	13	view_rating
53	Can add blog	14	add_blog
54	Can change blog	14	change_blog
55	Can delete blog	14	delete_blog
56	Can view blog	14	view_blog
57	Can add author	15	add_author
58	Can change author	15	change_author
59	Can delete author	15	delete_author
60	Can view author	15	view_author
61	Can add entry	16	add_entry
62	Can change entry	16	change_entry
63	Can delete entry	16	delete_entry
64	Can view entry	16	view_entry
65	Can add restaurant location	17	add_restaurantlocation
66	Can change restaurant location	17	change_restaurantlocation
67	Can delete restaurant location	17	delete_restaurantlocation
68	Can view restaurant location	17	view_restaurantlocation
69	Can add friend	18	add_friend
70	Can change friend	18	change_friend
71	Can delete friend	18	delete_friend
72	Can view friend	18	view_friend
73	Can add friend list	19	add_friendlist
74	Can change friend list	19	change_friendlist
75	Can delete friend list	19	delete_friendlist
76	Can view friend list	19	view_friendlist
77	Can add friend request	20	add_friendrequest
78	Can change friend request	20	change_friendrequest
79	Can delete friend request	20	delete_friendrequest
80	Can view friend request	20	view_friendrequest
81	Can add rd_update	21	add_rd_update
82	Can change rd_update	21	change_rd_update
83	Can delete rd_update	21	delete_rd_update
84	Can view rd_update	21	view_rd_update
85	Can add hours	22	add_hours
86	Can change hours	22	change_hours
87	Can delete hours	22	delete_hours
88	Can view hours	22	view_hours
89	Can add subcoment	23	add_subcoment
90	Can change subcoment	23	change_subcoment
91	Can delete subcoment	23	delete_subcoment
92	Can view subcoment	23	view_subcoment
93	Can add subcomment	23	add_subcomment
94	Can change subcomment	23	change_subcomment
95	Can delete subcomment	23	delete_subcomment
96	Can view subcomment	23	view_subcomment
97	Can add ingredient	24	add_ingredient
98	Can change ingredient	24	change_ingredient
99	Can delete ingredient	24	delete_ingredient
100	Can view ingredient	24	view_ingredient
101	Can add recipe	25	add_recipe
102	Can change recipe	25	change_recipe
103	Can delete recipe	25	delete_recipe
104	Can view recipe	25	view_recipe
105	Can add ingredient value	26	add_ingredientvalue
106	Can change ingredient value	26	change_ingredientvalue
107	Can delete ingredient value	26	delete_ingredientvalue
108	Can view ingredient value	26	view_ingredientvalue
\.


--
-- TOC entry 4008 (class 0 OID 36452)
-- Dependencies: 241
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2020-12-11 08:23:13.8337+01	1	Burger	1	[{"added": {}}]	8	2
2	2020-12-11 08:23:33.725906+01	1	Restaurant object (1)	1	[{"added": {}}]	9	2
3	2020-12-11 08:26:07.244706+01	1	Burger	1	[{"added": {}}]	10	2
4	2020-12-11 08:29:27.636152+01	2	Pommes	1	[{"added": {}}]	8	2
5	2020-12-11 08:29:37.813266+01	2	Restaurant object (2)	1	[{"added": {}}]	9	2
6	2020-12-11 08:31:48.046788+01	3	Falaffel	1	[{"added": {}}]	8	2
7	2020-12-11 08:32:07.05432+01	3	Restaurant object (3)	1	[{"added": {}}]	9	2
8	2020-12-11 08:32:29.896185+01	4	Nudeln	1	[{"added": {}}]	8	2
9	2020-12-11 08:32:46.721183+01	4	Restaurant object (4)	1	[{"added": {}}]	9	2
10	2020-12-11 08:34:13.648588+01	5	Pizza	1	[{"added": {}}]	8	2
11	2020-12-11 08:34:32.370652+01	6	Döner	1	[{"added": {}}]	8	2
12	2020-12-11 08:34:48.368377+01	5	Restaurant object (5)	1	[{"added": {}}]	9	2
13	2020-12-11 08:35:12.06416+01	6	Restaurant object (6)	1	[{"added": {}}]	9	2
14	2020-12-11 13:51:00.038633+01	6	Restaurant object (6)	2	[{"changed": {"fields": ["Address", "HouseNumber", "City", "State", "Zip code"]}}]	9	1
15	2020-12-11 13:52:22.504771+01	5	Restaurant object (5)	2	[{"changed": {"fields": ["Address", "HouseNumber", "City", "State", "Zip code"]}}]	9	1
16	2020-12-11 13:54:51.099603+01	4	Restaurant object (4)	2	[{"changed": {"fields": ["Address", "HouseNumber", "City", "State", "Zip code"]}}]	9	1
17	2020-12-11 13:55:52.004362+01	3	Restaurant object (3)	2	[{"changed": {"fields": ["Address", "HouseNumber", "City", "State", "Zip code"]}}]	9	1
18	2020-12-11 13:56:41.704655+01	2	Restaurant object (2)	2	[{"changed": {"fields": ["Address", "City", "State", "Zip code"]}}]	9	1
19	2020-12-11 13:58:01.758106+01	1	Restaurant object (1)	2	[{"changed": {"fields": ["Address", "HouseNumber", "City", "State", "Zip code"]}}]	9	1
20	2020-12-11 17:31:39.06473+01	1	Rating object (1)	1	[{"added": {}}]	13	1
21	2020-12-12 21:45:46.74457+01	1	Robins Küche - 5 stars	2	[{"changed": {"fields": ["Account"]}}]	13	1
22	2020-12-12 22:04:13.440677+01	1	Falko | Rating: 4	2	[{"changed": {"fields": ["Ratings"]}}]	11	1
23	2020-12-12 22:04:22.233249+01	2	Falko | Rating: 2	2	[{"changed": {"fields": ["Ratings"]}}]	11	1
24	2020-12-12 22:04:31.761009+01	3	Falko | Rating: 1	2	[{"changed": {"fields": ["Ratings"]}}]	11	1
25	2020-12-12 22:04:50.932944+01	33	Falko | Rating: 5	2	[{"changed": {"fields": ["Content", "Ratings"]}}]	11	1
26	2020-12-12 22:05:13.48891+01	3	Falko | Rating: 1	2	[]	11	1
27	2020-12-12 22:18:15.805316+01	6	Papa Pizza	2	[{"changed": {"fields": ["AverageRating"]}}]	9	1
28	2020-12-14 16:56:03.428102+01	4	creepmaster	3		6	1
29	2020-12-14 21:45:18.419192+01	1	RestaurantLocation object (1)	1	[{"added": {}}]	17	3
30	2020-12-14 21:45:23.597351+01	2	RestaurantLocation object (2)	1	[{"added": {}}]	17	3
31	2020-12-14 21:45:31.431862+01	6	Papa Pizza	2	[{"changed": {"fields": ["Point"]}}]	9	3
32	2020-12-14 21:45:37.202248+01	5	Mama Pizza	2	[{"changed": {"fields": ["Point"]}}]	9	3
33	2020-12-15 01:53:24.610235+01	7	Space Jam	1	[{"added": {}}]	8	2
34	2020-12-15 01:53:32.514517+01	7	Cantina Bar	1	[{"added": {}}]	9	2
35	2020-12-15 01:57:14.037803+01	6	Papa Pizza	2	[]	9	2
36	2020-12-15 01:58:23.341945+01	8	Crusty Crab	1	[{"added": {}}]	9	2
37	2020-12-15 02:09:11.802698+01	6	Papa Pizza	2	[]	9	2
38	2020-12-15 02:10:02.756414+01	9	Mc Donalds	1	[{"added": {}}]	9	2
39	2020-12-15 14:11:27.596152+01	2	Salznudeln	1	[{"added": {}}]	10	2
40	2020-12-15 14:11:51.908291+01	8	Knödel	1	[{"added": {}}]	8	2
41	2020-12-15 14:19:03.711397+01	3	Salzknödel	1	[{"added": {}}]	10	2
42	2020-12-15 14:19:19.238578+01	9	Asiatisch	1	[{"added": {}}]	8	2
43	2020-12-15 14:21:01.490279+01	4	Ramen	1	[{"added": {}}]	10	2
44	2020-12-15 14:21:48.957306+01	10	Deutsch	1	[{"added": {}}]	8	2
45	2020-12-15 14:22:05.609692+01	5	Königsberger Klopse	1	[{"added": {}}]	10	2
46	2020-12-15 14:23:15.363125+01	11	Italienisch	1	[{"added": {}}]	8	2
47	2020-12-15 14:23:45.638863+01	6	Spaghetti Salzonese	1	[{"added": {}}]	10	2
48	2020-12-15 14:24:38.188505+01	7	Frikadellen	1	[{"added": {}}]	10	2
49	2020-12-15 14:25:07.227944+01	8	Pfannkuchen	1	[{"added": {}}]	10	2
50	2020-12-15 18:07:57.113684+01	1	Friend object (1)	1	[{"added": {}}]	18	1
51	2020-12-16 11:53:52.085926+01	1	anne	1	[{"added": {}}]	19	1
52	2020-12-16 11:54:00.895114+01	2	KarlLauterbach	1	[{"added": {}}]	19	1
53	2020-12-16 11:54:14.862098+01	3	Falko	1	[{"added": {}}]	19	1
54	2020-12-16 11:54:20.880437+01	4	robin	1	[{"added": {}}]	19	1
55	2020-12-16 13:35:04.908695+01	3	Falko	2	[{"changed": {"fields": ["Friends"]}}]	19	1
56	2020-12-16 13:35:35.096223+01	4	robin	2	[{"changed": {"fields": ["Friends"]}}]	19	1
57	2020-12-16 13:35:43.026343+01	1	anne	2	[{"changed": {"fields": ["Friends"]}}]	19	1
58	2020-12-16 19:38:32.115064+01	2	KarlLauterbach	2	[{"changed": {"fields": ["Friends"]}}]	19	1
59	2020-12-16 19:38:55.604378+01	2	KarlLauterbach	2	[{"changed": {"fields": ["Friends"]}}]	19	1
60	2020-12-17 17:05:13.547896+01	3	Salzknödel	2	[{"changed": {"fields": ["Tags"]}}]	10	2
61	2020-12-17 22:18:59.215982+01	12	Vorspeise	1	[{"added": {}}]	8	2
62	2020-12-17 22:19:06.977415+01	13	Käse	1	[{"added": {}}]	8	2
63	2020-12-17 22:19:18.713376+01	9	Salzkäse	1	[{"added": {}}]	10	2
64	2020-12-18 17:16:37.433517+01	9	Mc Donalds	2	[{"changed": {"fields": ["Point"]}}]	9	3
65	2020-12-18 18:22:53.050869+01	3	RestaurantLocation object (3)	1	[{"added": {}}]	17	3
66	2020-12-18 19:12:39.460329+01	1	Coworker object (1)	1	[{"added": {}}]	12	6
67	2020-12-18 19:15:19.154674+01	1	Falko	2	[{"changed": {"fields": ["Initials"]}}]	6	1
68	2020-12-18 19:15:27.356213+01	1	Falko	2	[{"changed": {"fields": ["Profile picture"]}}]	6	1
69	2020-12-18 19:53:59.406005+01	2	Coworker object (2)	1	[{"added": {}}]	12	6
70	2020-12-18 20:33:28.161463+01	1	Coworker object (1)	2	[{"changed": {"fields": ["Picture"]}}]	12	6
71	2020-12-18 20:33:39.949039+01	2	Coworker object (2)	2	[{"changed": {"fields": ["Picture"]}}]	12	6
72	2020-12-18 20:34:01.760656+01	3	Coworker object (3)	1	[{"added": {}}]	12	6
73	2020-12-18 20:34:20.747479+01	4	Coworker object (4)	1	[{"added": {}}]	12	6
74	2020-12-19 19:31:03.679879+01	9	Mc Donalds	2	[{"changed": {"fields": ["Point"]}}]	9	3
75	2020-12-19 20:08:38.57965+01	8	Crusty Crab	2	[{"changed": {"fields": ["Point"]}}]	9	3
76	2020-12-19 20:13:06.673646+01	7	Cantina Bar	2	[{"changed": {"fields": ["Point"]}}]	9	3
77	2020-12-19 20:13:12.926911+01	6	Papa Pizza	2	[{"changed": {"fields": ["Point"]}}]	9	3
78	2020-12-19 20:13:21.482018+01	5	Mama Pizza	2	[{"changed": {"fields": ["Point"]}}]	9	3
79	2020-12-19 20:13:30.501379+01	4	Annes Salznudeln	2	[{"changed": {"fields": ["Point"]}}]	9	3
80	2020-12-19 20:13:36.601111+01	3	Luis Falaffel	2	[{"changed": {"fields": ["Point"]}}]	9	3
81	2020-12-19 20:13:42.562862+01	2	Peter Pane	2	[{"changed": {"fields": ["Point"]}}]	9	3
82	2020-12-19 20:13:48.743947+01	1	Robins Küche	2	[{"changed": {"fields": ["Point"]}}]	9	3
83	2020-12-19 21:19:57.752393+01	1	Veganer Leberkäse	1	[{"added": {}}]	7	1
84	2020-12-20 13:58:59.897259+01	6	luis	2	[{"changed": {"fields": ["Initials", "Biography"]}}]	6	1
85	2020-12-20 14:00:33.197299+01	5	KarlLauterbach	2	[{"changed": {"fields": ["First name", "Last name", "Initials", "Biography"]}}]	6	1
86	2020-12-20 14:00:55.051898+01	3	anne	2	[{"changed": {"fields": ["Initials", "Profile picture", "Biography"]}}]	6	1
87	2020-12-20 14:02:04.459789+01	2	robin	2	[{"changed": {"fields": ["Initials", "Profile picture", "Biography"]}}]	6	1
88	2020-12-20 14:05:17.532836+01	5	KarlLauterbach	2	[{"changed": {"fields": ["Profile picture"]}}]	6	1
89	2020-12-20 14:05:54.273963+01	6	luis	2	[{"changed": {"fields": ["Profile picture"]}}]	6	1
90	2020-12-20 16:16:50.589055+01	9	Mc Donalds	2	[{"changed": {"fields": ["Point"]}}]	9	3
91	2020-12-20 16:17:13.877737+01	8	Crusty Crab	2	[{"changed": {"fields": ["Point"]}}]	9	3
92	2020-12-20 16:17:41.392298+01	7	Cantina Bar	2	[{"changed": {"fields": ["Point"]}}]	9	3
93	2020-12-20 16:18:16.133805+01	6	Papa Pizza	2	[{"changed": {"fields": ["Point"]}}]	9	3
94	2020-12-20 16:31:26.671551+01	8	Crusty Crab	2	[{"changed": {"fields": ["Latitude", "Longitude"]}}]	9	3
95	2020-12-20 16:39:07.657384+01	9	Mc Donalds	2	[{"changed": {"fields": ["Latitude", "Longitude"]}}]	9	3
96	2020-12-20 16:39:15.799805+01	8	Crusty Crab	2	[]	9	3
97	2020-12-20 16:39:27.978799+01	7	Cantina Bar	2	[{"changed": {"fields": ["Latitude", "Longitude"]}}]	9	3
98	2020-12-20 16:39:43.511888+01	6	Papa Pizza	2	[{"changed": {"fields": ["Latitude", "Longitude"]}}]	9	3
99	2020-12-20 16:39:59.195765+01	5	Mama Pizza	2	[{"changed": {"fields": ["Latitude", "Longitude"]}}]	9	3
100	2020-12-20 16:40:10.318647+01	4	Annes Salznudeln	2	[{"changed": {"fields": ["Latitude", "Longitude"]}}]	9	3
101	2020-12-20 16:40:21.793568+01	3	Luis Falaffel	2	[{"changed": {"fields": ["Latitude", "Longitude"]}}]	9	3
102	2020-12-20 16:40:34.194108+01	2	Peter Pane	2	[{"changed": {"fields": ["Latitude", "Longitude"]}}]	9	3
103	2020-12-20 16:40:45.578338+01	1	Robins Küche	2	[{"changed": {"fields": ["Latitude", "Longitude"]}}]	9	3
104	2020-12-20 16:48:53.385421+01	8	Crusty Crab	2	[]	9	3
105	2020-12-20 16:51:39.466648+01	8	Crusty Crab	2	[{"changed": {"fields": ["Latitude", "Longitude"]}}]	9	3
106	2020-12-20 17:01:07.360732+01	9	Mc Donalds	2	[{"changed": {"fields": ["Latitude", "Longitude"]}}]	9	3
107	2020-12-20 17:01:43.574764+01	7	Cantina Bar	2	[{"changed": {"fields": ["Latitude", "Longitude"]}}]	9	3
108	2020-12-20 17:02:21.179927+01	6	Papa Pizza	2	[{"changed": {"fields": ["Latitude", "Longitude"]}}]	9	3
109	2020-12-20 17:02:56.905795+01	5	Mama Pizza	2	[{"changed": {"fields": ["Latitude", "Longitude"]}}]	9	3
110	2020-12-20 17:03:28.153146+01	4	Annes Salznudeln	2	[{"changed": {"fields": ["Latitude", "Longitude"]}}]	9	3
111	2020-12-20 17:03:57.270153+01	3	Luis Falaffel	2	[{"changed": {"fields": ["Latitude", "Longitude"]}}]	9	3
112	2020-12-20 17:04:37.143887+01	2	Peter Pane	2	[{"changed": {"fields": ["Latitude", "Longitude"]}}]	9	3
113	2020-12-20 17:05:10.081782+01	1	Robins Küche	2	[{"changed": {"fields": ["Latitude", "Longitude"]}}]	9	3
114	2020-12-20 17:06:19.370844+01	1	Robins Küche	2	[]	9	3
115	2020-12-20 17:12:11.108623+01	1	Robins Küche	2	[]	9	3
116	2020-12-27 02:48:36.063839+01	54	robin | Rating: 5	3		11	2
117	2020-12-27 02:48:36.124486+01	53	robin | Rating: 5	3		11	2
118	2020-12-27 02:48:36.182405+01	52	robin | Rating: 5	3		11	2
119	2020-12-27 02:48:36.232568+01	51	robin | Rating: 5	3		11	2
120	2020-12-27 02:48:36.291097+01	50	robin | Rating: 5	3		11	2
121	2020-12-27 02:48:36.340539+01	49	robin | Rating: 5	3		11	2
122	2020-12-27 02:48:36.393962+01	48	robin | Rating: 5	3		11	2
123	2020-12-27 02:48:36.449084+01	47	robin | Rating: 5	3		11	2
124	2020-12-27 02:48:36.506926+01	46	robin | Rating: 5	3		11	2
125	2020-12-27 02:48:36.566425+01	45	robin | Rating: 5	3		11	2
126	2020-12-27 02:48:36.625864+01	44	robin | Rating: 5	3		11	2
127	2020-12-27 02:48:36.682753+01	43	robin | Rating: 5	3		11	2
128	2020-12-27 02:48:36.741127+01	42	robin | Rating: 5	3		11	2
129	2020-12-27 02:48:36.799564+01	41	robin | Rating: 5	3		11	2
130	2020-12-27 02:48:36.8572+01	40	robin | Rating: 5	3		11	2
131	2020-12-27 02:48:36.916111+01	39	robin | Rating: 5	3		11	2
132	2020-12-27 02:48:36.97386+01	38	robin | Rating: 5	3		11	2
133	2020-12-27 02:48:37.036089+01	37	robin | Rating: 5	3		11	2
134	2020-12-27 02:48:37.09066+01	36	robin | Rating: 5	3		11	2
135	2020-12-27 22:19:02.576273+01	58	robin | Rating: 2	2	[{"changed": {"fields": ["Ratings"]}}]	11	2
136	2020-12-27 22:20:19.410798+01	59	KarlLauterbach | Rating: 1	1	[{"added": {}}]	11	2
137	2020-12-30 19:38:50.359372+01	1	Robins Kueche	2	[{"changed": {"fields": ["Name"]}}]	9	3
138	2020-12-30 19:42:01.348274+01	1	Robins Kueche	2	[]	9	3
139	2020-12-30 19:42:23.712934+01	9	Mc Donalds	2	[]	9	3
140	2020-12-30 19:52:56.337532+01	1	Robins Kueche	2	[{"changed": {"fields": ["Longitude"]}}]	9	3
141	2020-12-30 19:53:19.864922+01	1	Robins Kueche	2	[{"changed": {"fields": ["Latitude"]}}]	9	3
142	2020-12-30 19:54:05.244302+01	1	Robins Kueche	2	[{"changed": {"fields": ["Longitude"]}}]	9	3
143	2021-01-02 21:45:30.007931+01	83	Robin | Rating: 5	3		11	2
144	2021-01-02 21:45:30.071809+01	82	Robin | Rating: 3	3		11	2
145	2021-01-02 21:45:30.121626+01	81	Falko | Rating: 1	3		11	2
146	2021-01-02 21:45:30.180198+01	80	Robin | Rating: 1	3		11	2
147	2021-01-02 21:45:30.239106+01	78	Robin | Rating: 1	3		11	2
148	2021-01-02 21:45:30.298277+01	76	Robin | Rating: 1	3		11	2
149	2021-01-02 21:45:30.363309+01	75	Robin | Rating: 5	3		11	2
150	2021-01-02 21:45:30.421794+01	74	Robin | Rating: 5	3		11	2
151	2021-01-02 21:45:30.481415+01	73	Robin | Rating: 5	3		11	2
152	2021-01-02 21:45:30.538393+01	72	Robin | Rating: 5	3		11	2
153	2021-01-02 21:45:30.597375+01	71	Robin | Rating: 5	3		11	2
154	2021-01-02 21:45:30.655718+01	70	Robin | Rating: 5	3		11	2
155	2021-01-02 21:45:30.713644+01	69	Robin | Rating: 5	3		11	2
156	2021-01-02 21:45:30.772055+01	68	Robin | Rating: 5	3		11	2
157	2021-01-02 21:45:30.86826+01	67	Robin | Rating: 5	3		11	2
158	2021-01-02 21:45:30.955483+01	65	Robin | Rating: 5	3		11	2
159	2021-01-02 21:45:31.011545+01	63	Robin | Rating: 5	3		11	2
160	2021-01-02 21:45:31.147774+01	62	Robin | Rating: 5	3		11	2
161	2021-01-02 21:45:31.271478+01	61	Robin | Rating: 5	3		11	2
162	2021-01-02 21:45:31.3216+01	60	Robin | Rating: 5	3		11	2
163	2021-01-02 21:45:31.386521+01	58	Robin | Rating: 2	3		11	2
164	2021-01-02 21:45:31.458617+01	57	Robin | Rating: 5	3		11	2
165	2021-01-02 21:45:31.504891+01	56	Robin | Rating: 3	3		11	2
166	2021-01-02 21:45:31.554775+01	55	Robin | Rating: 5	3		11	2
167	2021-01-04 18:38:47.912149+01	7	IF4lko	3		6	1
168	2021-01-04 19:14:38.231868+01	4	Coworker object (4)	2	[{"changed": {"fields": ["Title"]}}]	12	1
169	2021-01-04 19:14:49.203573+01	3	Coworker object (3)	2	[{"changed": {"fields": ["Title"]}}]	12	1
170	2021-01-04 19:14:56.700684+01	2	Coworker object (2)	2	[{"changed": {"fields": ["Title"]}}]	12	1
171	2021-01-04 19:15:02.902195+01	1	Coworker object (1)	2	[{"changed": {"fields": ["Title"]}}]	12	1
172	2021-01-05 12:49:00.222305+01	9	Mc Donalds	2	[{"changed": {"fields": ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]}}]	9	1
173	2021-01-05 17:01:40.264619+01	9	Salzkäse	2	[{"changed": {"fields": ["Rating"]}}]	10	1
174	2021-01-05 17:16:08.547537+01	9	Salzkäse	2	[{"changed": {"fields": ["Price"]}}]	10	2
175	2021-01-05 17:21:40.387114+01	9	Salzkäse	2	[{"changed": {"fields": ["Rating"]}}]	10	1
176	2021-01-05 18:59:06.749374+01	9	LukeFalko	3		6	1
177	2021-01-05 19:01:23.913344+01	10	LukeFalko	3		6	1
178	2021-01-05 19:02:18.74644+01	11	LukeFalko	3		6	1
179	2021-01-05 19:53:59.069392+01	12	LukeFalko	3		6	1
180	2021-01-05 20:00:24.259736+01	13	LukeFalko	3		6	1
181	2021-01-05 20:02:08.595732+01	14	LukeFalko	3		6	1
182	2021-01-05 20:03:54.827347+01	15	LukeFalko	3		6	1
183	2021-01-05 20:09:37.516796+01	16	LukeFalko	3		6	1
184	2021-01-05 20:10:45.920678+01	17	LukeFalko	3		6	1
185	2021-01-07 14:47:09.490436+01	2	Butternut Ofenkürbis	1	[{"added": {}}]	7	1
186	2021-01-07 15:16:29.158811+01	3	Marokkanische Bowls	1	[{"added": {}}]	7	1
187	2021-01-07 15:18:17.261121+01	3	Veganes Marokko	2	[{"changed": {"fields": ["Banner", "Headline"]}}]	7	1
188	2021-01-07 15:18:44.136902+01	3	Veganes Indien	2	[{"changed": {"fields": ["Headline", "Subtitle"]}}]	7	1
189	2021-01-07 15:19:02.076946+01	3	Veganes Indien	2	[{"changed": {"fields": ["Subtitle"]}}]	7	1
190	2021-01-07 15:28:14.82649+01	4	Weihnachtsmarkt: Die vegane Steaksemmel	1	[{"added": {}}]	7	1
191	2021-01-07 20:07:34.926683+01	90	anne | Rating: 5	1	[{"added": {}}]	11	3
192	2021-01-08 15:50:51.565987+01	2	Coworker object (2)	2	[{"changed": {"fields": ["Bio"]}}]	12	6
193	2021-01-08 15:51:16.245523+01	1	Coworker object (1)	2	[{"changed": {"fields": ["Bio"]}}]	12	6
194	2021-01-08 17:10:45.239835+01	1	Robins Kueche	2	[{"changed": {"fields": ["Likes"]}}]	9	1
195	2021-01-08 17:10:53.304938+01	1	Robins Kueche	2	[]	9	1
196	2021-01-09 12:30:09.672886+01	1	Pasta Pomodoro Classico	1	[{"added": {}}]	25	1
197	2021-01-09 12:31:56.167423+01	1	Tomate	1	[{"added": {}}]	24	1
198	2021-01-09 12:32:28.077135+01	2	Zwiebel	1	[{"added": {}}]	24	1
199	2021-01-09 12:33:16.685958+01	3	Knoblauch	1	[{"added": {}}]	24	1
200	2021-01-09 12:33:56.464329+01	4	Basilikum	1	[{"added": {}}]	24	1
201	2021-01-09 12:34:53.252215+01	5	Tomatenmark	1	[{"added": {}}]	24	1
202	2021-01-09 12:36:15.575527+01	6	Olivenöl	1	[{"added": {}}]	24	1
203	2021-01-09 12:37:27.30056+01	7	Pasta (Hartweizengrieß)	1	[{"added": {}}]	24	1
204	2021-01-09 12:38:12.018107+01	7	Pasta (Hartweizengrieß)	2	[{"changed": {"fields": ["Kcal", "Carbs", "Protein", "Fat"]}}]	24	1
205	2021-01-09 12:43:35.516255+01	11	Pasta Pomodoro Classico	1	[{"added": {}}]	7	1
206	2021-01-10 00:13:26.493304+01	1	Pasta Pomodoro Classico	2	[{"changed": {"fields": ["Instructions"]}}]	25	1
207	2021-01-10 00:15:12.348991+01	1	Pasta Pomodoro Classico	2	[{"changed": {"fields": ["Instructions"]}}]	25	1
208	2021-01-10 00:15:41.222993+01	1	Pasta Pomodoro Classico	2	[{"changed": {"fields": ["Instructions"]}}]	25	1
209	2021-01-10 00:16:34.136771+01	1	Pasta Pomodoro Classico	2	[{"changed": {"fields": ["Instructions"]}}]	25	1
210	2021-01-10 00:17:28.175619+01	1	Pasta Pomodoro Classico	2	[{"changed": {"fields": ["Instructions"]}}]	25	1
211	2021-01-10 00:18:22.574086+01	1	Pasta Pomodoro Classico	2	[{"changed": {"fields": ["Instructions"]}}]	25	1
212	2021-01-10 00:19:57.916539+01	1	Pasta Pomodoro Classico	2	[{"changed": {"fields": ["Instructions"]}}]	25	1
213	2021-01-10 00:20:59.901162+01	1	Pasta Pomodoro Classico	2	[{"changed": {"fields": ["Instructions"]}}]	25	1
214	2021-01-10 00:22:24.473554+01	1	Pasta Pomodoro Classico	2	[{"changed": {"fields": ["Instructions"]}}]	25	1
215	2021-01-10 00:24:21.722272+01	1	Pasta Pomodoro Classico	2	[{"changed": {"fields": ["Instructions"]}}]	25	1
216	2021-01-10 00:30:24.185078+01	1	Pasta Pomodoro Classico	2	[{"changed": {"fields": ["Instructions"]}}]	25	1
217	2021-01-10 15:06:24.353554+01	1	Pasta Pomodoro Classico	2	[{"changed": {"fields": ["Instructions"]}}]	25	1
218	2021-01-11 11:39:46.608729+01	1	Pasta Pomodoro Classico	2	[{"changed": {"fields": ["Instructions"]}}]	25	1
219	2021-01-11 20:20:17.14057+01	11	Pasta Pomodoro Classico	2	[{"changed": {"fields": ["Ingredients"]}}]	7	1
220	2021-01-11 20:50:48.520871+01	6	Tomate | 450	1	[{"added": {}}]	26	1
221	2021-01-11 20:51:40.257432+01	7	Zwiebel | 40	1	[{"added": {}}]	26	1
222	2021-01-11 20:52:18.31169+01	8	Knoblauch | 6	1	[{"added": {}}]	26	1
223	2021-01-11 20:52:34.530233+01	9	Basilikum | 20	1	[{"added": {}}]	26	1
224	2021-01-11 20:53:07.278194+01	10	Tomatenmark | 50	1	[{"added": {}}]	26	1
225	2021-01-11 20:53:34.304165+01	11	Olivenöl | 20	1	[{"added": {}}]	26	1
226	2021-01-11 20:53:41.503838+01	12	Pasta (Hartweizengrieß) | 500	1	[{"added": {}}]	26	1
227	2021-01-11 20:53:44.471713+01	1	Pasta Pomodoro Classico	2	[{"changed": {"fields": ["Ingredients"]}}]	25	1
228	2021-01-12 15:02:26.941168+01	14	Bayerisch	1	[{"added": {}}]	8	1
229	2021-01-12 15:22:43.605976+01	10	Kälberhalle	1	[{"added": {}}]	9	1
230	2021-01-12 15:22:58.422726+01	10	Kälberhalle	2	[]	9	1
231	2021-01-12 15:25:46.228638+01	10	Kälberhalle	2	[]	9	1
232	2021-01-12 15:29:16.758876+01	10	Kälberhalle	2	[]	9	1
233	2021-01-12 15:44:41.499682+01	10	Kälberhalle	2	[]	9	1
234	2021-01-12 15:44:49.857942+01	10	Kälberhalle	2	[]	9	1
235	2021-01-12 15:54:26.18491+01	15	Kaffee	1	[{"added": {}}]	8	1
236	2021-01-12 15:54:30.992904+01	16	Kuchen	1	[{"added": {}}]	8	1
237	2021-01-12 15:54:43.295278+01	11	Henry's Coffeworld	1	[{"added": {}}]	9	1
238	2021-01-12 15:57:21.702399+01	11	Henry's Coffeworld	2	[{"changed": {"fields": ["Latitude", "Longitude"]}}]	9	1
239	2021-01-12 16:00:55.111163+01	11	Henry's Coffeworld	2	[]	9	1
240	2021-01-12 16:01:16.063747+01	3	Luis Falaffel	2	[]	9	1
241	2021-01-12 16:03:21.824472+01	3	Luis Falaffel	2	[]	9	1
242	2021-01-22 14:21:49.377171+01	12	Ratzfatz	1	[{"added": {}}]	9	1
243	2021-01-22 14:22:04.281025+01	12	Ratzfatz	2	[]	9	1
244	2021-01-22 15:43:26.3461+01	10	Tinkerbell Burger	1	[{"added": {}}]	10	1
245	2021-01-22 15:43:28.326164+01	11	Tinkerbell Burger	1	[{"added": {}}]	10	1
246	2021-01-22 15:46:08.164991+01	11	Tinkerbell Burger	3		10	1
247	2021-01-22 15:46:30.334523+01	7	Frikadellen	2	[{"changed": {"fields": ["ToGo"]}}]	10	1
248	2021-01-22 16:05:06.282566+01	2	Coworker object (2)	2	[{"changed": {"fields": ["Bio"]}}]	12	1
249	2021-01-22 22:56:33.726099+01	19	Gobin	3		6	2
250	2021-01-22 22:56:40.73164+01	20	qwe	3		6	2
251	2021-01-23 17:23:08.725975+01	9	Salzkäse	2	[{"changed": {"fields": ["Delivery"]}}]	10	2
252	2021-01-23 18:52:54.684263+01	8	Pfannkuchen	2	[{"changed": {"fields": ["Delivery"]}}]	10	2
253	2021-01-23 18:53:01.336368+01	7	Frikadellen	2	[{"changed": {"fields": ["Delivery"]}}]	10	2
254	2021-01-23 19:26:51.901982+01	12	Ratzfatz	2	[{"changed": {"fields": ["Description"]}}]	9	1
255	2021-01-24 16:53:29.109098+01	4	Annes Salznudeln	2	[{"changed": {"fields": ["Description"]}}]	9	2
256	2021-01-25 20:55:43.51481+01	4	Annes Salznudeln	2	[{"changed": {"fields": ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]}}]	9	2
257	2021-01-25 21:17:31.242133+01	4	Annes Salznudeln	2	[{"changed": {"fields": ["Sun"]}}]	9	2
258	2021-01-29 14:02:14.279008+01	3	Veganes Marokko	2	[{"changed": {"fields": ["Headline"]}}]	7	1
259	2021-01-29 17:11:29.113174+01	4	Annes Salznudeln	2	[]	9	1
260	2021-01-30 16:33:55.126669+01	4	Anne Fleig	2	[{"changed": {"fields": ["Title"]}}]	12	1
261	2021-01-30 16:34:09.847676+01	3	Robin Geramb	2	[{"changed": {"fields": ["Title"]}}]	12	1
262	2021-01-30 16:34:18.909596+01	2	Luis Bauer	2	[{"changed": {"fields": ["Title"]}}]	12	1
263	2021-01-30 16:34:32.088286+01	1	Lucas Falkowsky	2	[{"changed": {"fields": ["Title"]}}]	12	1
264	2021-01-30 18:24:32.609877+01	12	Ratzfatz	2	[{"changed": {"fields": ["Restaurant picture"]}}]	9	6
265	2021-01-30 18:43:43.923296+01	8	Crusty Crab	2	[{"changed": {"fields": ["Description"]}}]	9	6
266	2021-01-30 18:44:08.519901+01	8	Crusty Crab	2	[{"changed": {"fields": ["Restaurant picture"]}}]	9	6
267	2021-01-30 18:44:46.36663+01	3	Luis Falaffel	2	[{"changed": {"fields": ["Restaurant picture", "Description"]}}]	9	6
268	2021-01-30 18:46:01.820362+01	9	Mc Donalds	2	[{"changed": {"fields": ["Restaurant picture", "Description"]}}]	9	6
269	2021-01-30 18:49:32.070703+01	4	Weihnachtsmarkt: Die vegane Steaksemmel	2	[{"changed": {"fields": ["Banner"]}}]	7	6
270	2021-01-30 18:50:19.088946+01	3	Veganes Marokko	2	[{"changed": {"fields": ["Subtitle"]}}]	7	6
271	2021-01-31 12:32:13.129877+01	1	Robins Kueche	2	[{"changed": {"fields": ["Restaurant picture", "Description"]}}]	9	3
272	2021-01-31 12:33:20.700519+01	4	Annes Salznudeln	2	[{"changed": {"fields": ["Restaurant picture"]}}]	9	3
273	2021-01-31 12:35:19.588347+01	5	Mama Pizza	2	[{"changed": {"fields": ["Restaurant picture", "Description"]}}]	9	3
274	2021-01-31 12:39:28.207081+01	4	Annes Salznudeln	2	[]	9	3
275	2021-01-31 12:40:48.674787+01	7	Cantina Bar	2	[{"changed": {"fields": ["Restaurant picture", "Description"]}}]	9	3
276	2021-01-31 12:42:35.843327+01	2	Peter Pane	2	[{"changed": {"fields": ["Restaurant picture", "Description"]}}]	9	3
277	2021-01-31 12:46:03.90377+01	6	Papa Pizza	2	[{"changed": {"fields": ["Restaurant picture", "Description"]}}]	9	3
278	2021-01-31 12:46:51.824663+01	8	Crusty Crab	2	[{"changed": {"fields": ["Address"]}}]	9	3
279	2021-01-31 12:47:22.781223+01	7	Cantina Bar	2	[{"changed": {"fields": ["Address"]}}]	9	3
280	2021-01-31 12:48:00.725798+01	1	Robins Küche	2	[{"changed": {"fields": ["Name"]}}]	9	3
281	2021-01-31 13:10:21.173595+01	12	Razz-Fatzz	2	[{"changed": {"fields": ["Name"]}}]	9	3
282	2021-01-31 13:10:22.013092+01	12	Razz-Fatzz	2	[]	9	3
283	2021-01-31 13:10:22.878176+01	12	Razz-Fatzz	2	[]	9	3
284	2021-01-31 13:11:40.676268+01	12	Razz-Fazz	2	[{"changed": {"fields": ["Name", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]}}]	9	3
285	2021-01-31 13:13:48.708432+01	30	die.falkos@gmail.com	3		6	1
286	2021-01-31 13:15:49.765128+01	12	Falafel	1	[{"added": {}}]	10	3
287	2021-01-31 13:16:36.086433+01	3	Falafel	2	[{"changed": {"fields": ["Name"]}}]	8	3
288	2021-01-31 13:19:21.004032+01	31	MichaelFalko	3		6	1
289	2021-01-31 13:22:13.699121+01	3	Luis Falafel	2	[{"changed": {"fields": ["Name", "Description", "HouseNumber", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]}}]	9	3
290	2021-01-31 13:23:40.75232+01	32	MichaelFalko	3		6	1
291	2021-01-31 13:23:53.659897+01	13	Falafel	1	[{"added": {}}]	10	3
292	2021-01-31 13:24:57.977763+01	14	Pommes	1	[{"added": {}}]	10	3
293	2021-01-31 13:25:43.904263+01	33	MichaelFalko	3		6	1
294	2021-01-31 13:26:55.320978+01	15	Curly Fries	1	[{"added": {}}]	10	3
295	2021-01-31 13:32:30.922417+01	34	MichaelFalko	3		6	1
296	2021-01-31 13:39:40.176275+01	35	MichaelFalko	3		6	1
297	2021-01-31 13:40:44.507324+01	36	MichaelFalko	3		6	1
298	2021-01-31 14:08:02.515291+01	37	MichaelFalko	3		6	1
299	2021-01-31 14:09:51.27851+01	38	MichaelFalko	3		6	1
300	2021-01-31 14:14:03.894923+01	39	MichaelFalko	3		6	1
301	2021-01-31 14:16:25.767148+01	40	MichaelFalko	3		6	1
302	2021-01-31 16:13:03.936211+01	4	Ramen	2	[{"changed": {"fields": ["ToGo"]}}]	10	2
303	2021-01-31 16:26:00.960839+01	2	Burger House	2	[{"changed": {"fields": ["Name", "Description", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]}}]	9	3
304	2021-01-31 16:26:36.392275+01	2	Burger House	2	[{"changed": {"fields": ["Fri", "Sat", "Sun"]}}]	9	3
305	2021-01-31 16:30:37.146925+01	4	Ramen	2	[]	10	2
306	2021-01-31 16:36:37.526011+01	11	Coffeworld	2	[{"changed": {"fields": ["Restaurant picture", "Name", "Description", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]}}]	9	3
307	2021-01-31 16:37:23.20055+01	11	Coffeworld	2	[{"changed": {"fields": ["Sun"]}}]	9	3
308	2021-01-31 16:44:17.807425+01	12	Prinzen Falafel	2	[{"changed": {"fields": ["Name", "Description"]}}]	9	3
309	2021-01-31 16:50:05.510458+01	10	Kalbshalle	2	[{"changed": {"fields": ["Name", "Description", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]}}]	9	3
310	2021-01-31 16:54:11.265326+01	9	Mc Ronalds	2	[{"changed": {"fields": ["Restaurant picture", "Name", "Description"]}}]	9	3
311	2021-01-31 16:57:34.06243+01	9	HS Augsburg	2	[{"changed": {"fields": ["Name", "Address", "HouseNumber", "City", "Zip code", "Latitude", "Longitude"]}}]	9	3
312	2021-01-31 16:59:19.841136+01	9	Mc Ronalds	2	[{"changed": {"fields": ["Name", "Description"]}}]	9	3
313	2021-01-31 18:43:01.901594+01	5	Gourmet	2	[{"changed": {"fields": ["Name", "Description", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]}}]	9	3
314	2021-01-31 18:46:34.274442+01	6	Pizza La Perla	2	[{"changed": {"fields": ["Name", "Description", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]}}]	9	3
394	2021-02-01 17:32:27.845898+01	36	Latte Macchiato	1	[{"added": {}}]	10	3
395	2021-02-01 17:34:47.289796+01	37	Käsekuchen	1	[{"added": {}}]	10	3
315	2021-01-31 18:51:03.300966+01	7	Cantina Bar	2	[{"changed": {"fields": ["Description", "Address", "HouseNumber", "City", "Zip code", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun", "Latitude", "Longitude"]}}]	9	3
316	2021-01-31 19:03:41.412254+01	11	Pasta Pomodoro Classico	2	[{"changed": {"fields": ["Subtitle"]}}]	7	3
317	2021-01-31 19:09:07.912874+01	16	Holde Maid	1	[{"added": {}}]	10	3
318	2021-01-31 19:09:54.675086+01	17	Räubertochter	1	[{"added": {}}]	10	3
319	2021-01-31 19:10:56.117571+01	18	Frohnatur	1	[{"added": {}}]	10	3
320	2021-01-31 21:49:15.271052+01	1	Veganer Leberkäse	2	[{"changed": {"fields": ["Banner"]}}]	7	3
321	2021-01-31 21:50:49.326629+01	1	Veganer Leberkäse	2	[{"changed": {"fields": ["Banner"]}}]	7	3
322	2021-01-31 21:52:01.010719+01	11	Pasta Pomodoro Classico	2	[{"changed": {"fields": ["Subtitle"]}}]	7	3
323	2021-01-31 21:52:19.072346+01	4	Weihnachtsmarkt: Die vegane Steaksemmel	2	[{"changed": {"fields": ["Article body"]}}]	7	3
324	2021-01-31 21:52:29.324214+01	3	Veganes Marokko	2	[{"changed": {"fields": ["Article body"]}}]	7	3
325	2021-01-31 21:53:01.346571+01	4	Weihnachtsmarkt: Die vegane Steaksemmel	2	[{"changed": {"fields": ["Article body"]}}]	7	3
326	2021-01-31 21:53:14.937597+01	2	Butternut Ofenkürbis	2	[{"changed": {"fields": ["Article body"]}}]	7	3
327	2021-01-31 21:53:30.713544+01	3	Veganes Marokko	2	[{"changed": {"fields": ["Article body"]}}]	7	3
328	2021-01-31 21:54:31.687121+01	1	Veganer Leberkäse	2	[{"changed": {"fields": ["Banner"]}}]	7	3
329	2021-01-31 21:57:24.94918+01	19	Falafel Sandwich	1	[{"added": {}}]	10	3
330	2021-01-31 21:58:08.356194+01	20	Halloumi Sandwich	1	[{"added": {}}]	10	3
331	2021-01-31 21:59:28.877746+01	21	Maqali Sandwich	1	[{"added": {}}]	10	3
332	2021-01-31 22:01:14.918934+01	22	Falafel Teller	1	[{"added": {}}]	10	3
333	2021-01-31 22:04:28.44415+01	23	Falafel Teller	1	[{"added": {}}]	10	3
334	2021-01-31 22:05:19.50474+01	24	Falafel Sandwich	1	[{"added": {}}]	10	3
335	2021-01-31 22:09:06.931958+01	4	Anne Fleig	2	[{"changed": {"fields": ["Bio"]}}]	12	3
336	2021-01-31 22:09:28.462048+01	3	Robin Geramb	2	[{"changed": {"fields": ["Bio"]}}]	12	3
337	2021-01-31 22:09:47.471834+01	2	Luis Bauer	2	[{"changed": {"fields": ["Bio"]}}]	12	3
338	2021-01-31 22:11:22.044958+01	1	Lucas Falkowsky	2	[{"changed": {"fields": ["Bio"]}}]	12	3
339	2021-02-01 14:46:01.301074+01	1	Lucas Falkowsky	2	[{"changed": {"fields": ["Bio"]}}]	12	6
340	2021-02-01 14:56:58.906376+01	2	Luis Bauer	2	[{"changed": {"fields": ["Bio"]}}]	12	1
341	2021-02-01 14:58:20.181501+01	3	Robin Geramb	2	[]	12	1
342	2021-02-01 14:58:23.221772+01	3	Robin Geramb	2	[]	12	1
343	2021-02-01 14:59:30.869803+01	25	Halloumi Burger	1	[{"added": {}}]	10	3
344	2021-02-01 14:59:38.178421+01	3	Robin Geramb	2	[{"changed": {"fields": ["Bio"]}}]	12	1
345	2021-02-01 15:00:15.298309+01	26	Mozzarella Burger	1	[{"added": {}}]	10	3
346	2021-02-01 15:00:50.86173+01	4	Anne Fleig	2	[{"changed": {"fields": ["Bio"]}}]	12	1
347	2021-02-01 15:01:06.842221+01	1	Lucas Falkowsky	2	[{"changed": {"fields": ["Bio"]}}]	12	1
348	2021-02-01 15:01:14.477759+01	3	Robin Geramb	2	[]	12	1
349	2021-02-01 15:01:24.399126+01	2	Luis Bauer	2	[{"changed": {"fields": ["Bio"]}}]	12	1
350	2021-02-01 15:30:49.844991+01	27	Chili-Cheese Beyond Meat Burger	1	[{"added": {}}]	10	3
351	2021-02-01 15:33:46.747996+01	46	lisschen	3		6	2
352	2021-02-01 15:33:46.790681+01	45	boris	3		6	2
353	2021-02-01 15:33:46.824469+01	22	robing	3		6	2
354	2021-02-01 15:33:46.857434+01	21	Gobin	3		6	2
355	2021-02-01 15:35:40.660903+01	47	Boris	3		6	2
356	2021-02-01 15:36:35.630736+01	28	Original Beyond Meat Burger	1	[{"added": {}}]	10	3
357	2021-02-01 15:36:50.77483+01	27	Chili-Cheese Beyond Meat Burger	2	[{"changed": {"fields": ["ToGoPrice"]}}]	10	3
358	2021-02-01 15:36:58.965769+01	26	Mozzarella Burger	2	[{"changed": {"fields": ["ToGoPrice"]}}]	10	3
359	2021-02-01 15:37:07.467499+01	25	Halloumi Burger	2	[{"changed": {"fields": ["ToGoPrice"]}}]	10	3
360	2021-02-01 15:37:15.650472+01	24	Falafel Sandwich	2	[{"changed": {"fields": ["ToGoPrice"]}}]	10	3
361	2021-02-01 15:37:23.388534+01	23	Falafel Teller	2	[{"changed": {"fields": ["ToGoPrice"]}}]	10	3
362	2021-02-01 15:37:31.416276+01	22	Falafel Teller	2	[{"changed": {"fields": ["ToGoPrice"]}}]	10	3
363	2021-02-01 15:37:39.965651+01	21	Maqali Sandwich	2	[{"changed": {"fields": ["ToGoPrice"]}}]	10	3
364	2021-02-01 15:37:47.868745+01	20	Halloumi Sandwich	2	[{"changed": {"fields": ["ToGoPrice"]}}]	10	3
365	2021-02-01 15:37:55.970825+01	19	Falafel Sandwich	2	[{"changed": {"fields": ["ToGoPrice"]}}]	10	3
366	2021-02-01 15:38:02.888427+01	18	Frohnatur	2	[{"changed": {"fields": ["ToGoPrice"]}}]	10	3
367	2021-02-01 15:38:10.189311+01	17	Räubertochter	2	[{"changed": {"fields": ["ToGoPrice"]}}]	10	3
368	2021-02-01 15:38:16.623493+01	16	Holde Maid	2	[{"changed": {"fields": ["ToGoPrice"]}}]	10	3
369	2021-02-01 15:38:23.728598+01	15	Curly Fries	2	[{"changed": {"fields": ["ToGoPrice"]}}]	10	3
370	2021-02-01 15:38:31.139441+01	14	Pommes	2	[{"changed": {"fields": ["ToGoPrice"]}}]	10	3
371	2021-02-01 15:38:38.704029+01	13	Falafel	2	[{"changed": {"fields": ["ToGoPrice"]}}]	10	3
372	2021-02-01 15:38:46.058528+01	12	Falafel	2	[{"changed": {"fields": ["ToGoPrice"]}}]	10	3
373	2021-02-01 15:38:55.632571+01	10	Tinkerbell Burger	2	[]	10	3
374	2021-02-01 15:40:51.117917+01	29	Moving Mountains Burger	1	[{"added": {}}]	10	3
375	2021-02-01 15:42:47.980087+01	30	Barbecue Bacon Beyond Meat	1	[{"added": {}}]	10	3
376	2021-02-01 16:24:52.356167+01	17	Bagel	1	[{"added": {}}]	8	3
377	2021-02-01 16:25:17.565811+01	18	Bagel	1	[{"added": {}}]	8	3
378	2021-02-01 16:25:44.958518+01	19	Bagel	1	[{"added": {}}]	8	3
379	2021-02-01 16:26:24.916893+01	20	Bagel	1	[{"added": {}}]	8	3
380	2021-02-01 16:27:21.415252+01	20	Bagel	3		8	3
381	2021-02-01 16:27:21.469541+01	19	Bagel	3		8	3
382	2021-02-01 16:27:21.503489+01	18	Bagel	3		8	3
383	2021-02-01 16:28:47.338059+01	31	Joghurt Fruchtbagel	1	[{"added": {}}]	10	3
384	2021-02-01 16:30:40.036395+01	32	Tomate Mozzarella Bagel	1	[{"added": {}}]	10	3
385	2021-02-01 16:31:58.031586+01	21	Kuchen	1	[{"added": {}}]	8	3
386	2021-02-01 16:33:17.490018+01	33	Schokokuchen	1	[{"added": {}}]	10	3
387	2021-02-01 16:47:19.873498+01	22	Kaffee	1	[{"added": {}}]	8	3
388	2021-02-01 17:11:04.382223+01	34	Espresso	1	[{"added": {}}]	10	3
389	2021-02-01 17:29:48.521776+01	34	Espresso	2	[{"changed": {"fields": ["Description"]}}]	10	3
390	2021-02-01 17:30:02.937336+01	33	Schokokuchen	2	[{"changed": {"fields": ["Description"]}}]	10	3
391	2021-02-01 17:30:12.904941+01	32	Tomate Mozzarella Bagel	2	[{"changed": {"fields": ["Description"]}}]	10	3
392	2021-02-01 17:30:20.760318+01	31	Joghurt Fruchtbagel	2	[]	10	3
393	2021-02-01 17:31:45.036568+01	35	Cappuccino	1	[{"added": {}}]	10	3
396	2021-02-01 17:35:29.053772+01	37	Käsekuchen	2	[{"changed": {"fields": ["Restaurant"]}}]	10	3
397	2021-02-01 17:37:23.558565+01	8	Crusty Crab	2	[{"changed": {"fields": ["Description", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]}}]	9	3
398	2021-02-01 17:38:28.112853+01	23	Getränke	1	[{"added": {}}]	8	3
399	2021-02-01 17:39:06.514939+01	38	Glühwein	1	[{"added": {}}]	10	3
400	2021-02-01 17:41:02.308902+01	39	Falafel Box	1	[{"added": {}}]	10	3
401	2021-02-01 17:41:36.758024+01	40	Mini Falafel	1	[{"added": {}}]	10	3
402	2021-02-01 17:42:26.013809+01	41	Curry-Falafel Wrap	1	[{"added": {}}]	10	3
403	2021-02-01 17:44:37.278223+01	15	Curly Fries	2	[{"changed": {"fields": ["Restaurant"]}}]	10	3
404	2021-02-01 17:44:49.988271+01	15	Curly Fries	2	[{"changed": {"fields": ["Description"]}}]	10	3
405	2021-02-01 17:45:08.578749+01	14	Pommes	2	[{"changed": {"fields": ["Restaurant", "Description"]}}]	10	3
406	2021-02-01 17:46:51.910073+01	42	Falafel Halloumi Box	1	[{"added": {}}]	10	3
407	2021-02-01 17:47:29.668655+01	43	Falafel Wrap	1	[{"added": {}}]	10	3
408	2021-02-01 17:48:07.852577+01	44	Falafel Wrap	1	[{"added": {}}]	10	3
409	2021-02-01 17:49:18.994526+01	24	Beilagen	1	[{"added": {}}]	8	3
410	2021-02-01 17:49:50.59394+01	14	Pommes	2	[{"changed": {"fields": ["Tags"]}}]	10	3
411	2021-02-01 17:50:01.239338+01	15	Curly Fries	2	[{"changed": {"fields": ["Tags"]}}]	10	3
412	2021-02-01 17:50:39.728344+01	45	Biryani-Reis	1	[{"added": {}}]	10	3
413	2021-02-01 17:51:10.816536+01	25	Salate	1	[{"added": {}}]	8	3
414	2021-02-01 17:51:52.731593+01	16	Kuchen	3		8	3
415	2021-02-01 17:52:10.636633+01	37	Käsekuchen	2	[]	10	3
416	2021-02-01 17:52:21.77246+01	33	Schokokuchen	2	[]	10	3
417	2021-02-01 17:53:13.728364+01	46	Fatusch Salat	1	[{"added": {}}]	10	3
418	2021-02-01 17:53:55.104428+01	47	Falafel Salat	1	[{"added": {}}]	10	3
419	2021-02-01 17:55:46.539149+01	42	Falafel Halloumi Box	2	[{"changed": {"fields": ["Description"]}}]	10	3
420	2021-02-01 19:32:19.648579+01	8	Pinienkerne	1	[{"added": {}}]	24	1
421	2021-02-01 19:34:54.576553+01	9	Hefeflocken	1	[{"added": {}}]	24	1
422	2021-02-01 19:35:41.244781+01	10	Koriander	1	[{"added": {}}]	24	1
423	2021-02-01 19:36:22.174629+01	11	Petersilie	1	[{"added": {}}]	24	1
424	2021-02-01 19:41:02.803253+01	90	anne | Rating: 1	2	[{"changed": {"fields": ["Ratings"]}}]	11	3
425	2021-02-01 19:41:36.339436+01	3	Falko | Rating: 1	3		11	3
426	2021-02-01 19:41:47.084965+01	33	Falko | Rating: 5	2	[]	11	3
427	2021-02-01 19:41:55.675281+01	34	Falko | Rating: 5	2	[]	11	3
428	2021-02-01 19:42:05.526494+01	35	Falko | Rating: 5	2	[]	11	3
429	2021-02-01 19:42:14.163761+01	59	KarlLauterbach | Rating: 1	3		11	3
430	2021-02-01 19:42:22.376149+01	64	Falko | Rating: 5	3		11	3
431	2021-02-01 19:42:37.470085+01	66	Falko | Rating: 5	2	[]	11	3
432	2021-02-01 19:42:45.346636+01	66	Falko | Rating: 5	3		11	3
433	2021-02-01 19:42:54.875312+01	77	Falko | Rating: 5	3		11	3
434	2021-02-01 19:43:36.094239+01	12	Zitronensaft	1	[{"added": {}}]	24	1
435	2021-02-01 19:43:53.919252+01	79	Falko | Rating: 4	2	[{"changed": {"fields": ["Content", "Ratings"]}}]	11	3
436	2021-02-01 19:44:08.970459+01	84	Robin | Rating: 5	2	[{"changed": {"fields": ["Content"]}}]	11	3
437	2021-02-01 19:44:23.820277+01	85	Robin | Rating: 1	3		11	3
438	2021-02-01 19:44:37.287949+01	86	Robin | Rating: 1	3		11	3
439	2021-02-01 19:44:44.693355+01	87	Robin | Rating: 3	3		11	3
440	2021-02-01 19:45:03.364284+01	88	Falko | Rating: 4	2	[{"changed": {"fields": ["Content"]}}]	11	3
441	2021-02-01 19:45:14.794724+01	89	Falko | Rating: 5	3		11	3
442	2021-02-01 19:45:25.607117+01	91	Luis | Rating: 5	2	[]	11	3
443	2021-02-01 19:45:33.365616+01	92	Robin | Rating: 5	3		11	3
444	2021-02-01 19:45:40.497189+01	93	Robin | Rating: 3	3		11	3
445	2021-02-01 19:45:47.727767+01	94	Robin | Rating: 3	3		11	3
446	2021-02-01 19:45:56.260265+01	13	Butternusskürbis	1	[{"added": {}}]	24	1
447	2021-02-01 19:46:25.902093+01	95	flogesell | Rating: 3	2	[{"changed": {"fields": ["Content"]}}]	11	3
448	2021-02-01 19:46:34.37443+01	96	Luis | Rating: 5	2	[]	11	3
449	2021-02-01 19:46:45.91514+01	97	Robin | Rating: 1	3		11	3
450	2021-02-01 19:46:54.91421+01	98	Robin | Rating: 5	3		11	3
451	2021-02-01 19:47:02.447285+01	99	Robin | Rating: 5	3		11	3
452	2021-02-01 19:47:10.188012+01	100	Robin | Rating: 2	3		11	3
453	2021-02-01 19:47:20.059476+01	103	Luis | Rating: 2	2	[]	11	3
454	2021-02-01 19:47:34.508513+01	104	Luis | Rating: 1	2	[]	11	3
455	2021-02-01 19:47:45.854916+01	105	Luis | Rating: 4	2	[]	11	3
456	2021-02-01 19:47:56.067872+01	106	Luis | Rating: 5	2	[]	11	3
457	2021-02-01 19:48:06.14995+01	107	Luis | Rating: 3	2	[]	11	3
458	2021-02-01 19:48:14.012508+01	108	Luis | Rating: 5	2	[]	11	3
459	2021-02-01 19:48:21.208225+01	14	Bedda Hirte	1	[{"added": {}}]	24	1
460	2021-02-01 19:48:31.378357+01	108	Luis | Rating: 5	2	[{"changed": {"fields": ["Content"]}}]	11	3
461	2021-02-01 19:48:42.260655+01	109	Luis | Rating: 5	2	[]	11	3
462	2021-02-01 19:48:52.070047+01	110	Luis | Rating: 5	2	[]	11	3
463	2021-02-01 19:49:01.931923+01	112	Luis | Rating: 5	2	[]	11	3
464	2021-02-01 19:49:10.75443+01	111	anne | Rating: 4	2	[]	11	3
465	2021-02-01 19:52:22.133854+01	113	lisschen | Rating: 2	2	[{"changed": {"fields": ["Ratings"]}}]	11	3
466	2021-02-01 19:54:00.648493+01	8	Knoblauch | 6	2	[{"changed": {"fields": ["OtherValue", "OtherValueName"]}}]	26	1
467	2021-02-01 19:54:37.895993+01	7	Zwiebel | 40	2	[{"changed": {"fields": ["OtherValue", "OtherValueName"]}}]	26	1
468	2021-02-01 19:55:00.844275+01	13	Pinienkerne | 140	1	[{"added": {}}]	26	1
469	2021-02-01 19:55:21.201846+01	14	Hefeflocken | 100	1	[{"added": {}}]	26	1
470	2021-02-01 19:55:52.897203+01	15	Olivenöl | 100	1	[{"added": {}}]	26	1
471	2021-02-01 19:55:59.550284+01	11	Olivenöl | 20	2	[{"changed": {"fields": ["OtherValueName"]}}]	26	1
472	2021-02-01 20:00:05.182297+01	118	lisschen | Rating: 4	2	[{"changed": {"fields": ["Ratings"]}}]	11	3
473	2021-02-01 20:00:16.938485+01	117	lisschen | Rating: 3	2	[]	11	3
474	2021-02-01 20:00:23.860455+01	16	Koriander | 10	1	[{"added": {}}]	26	1
475	2021-02-01 20:00:40.872827+01	17	Petersilie | 10	1	[{"added": {}}]	26	1
476	2021-02-01 20:01:41.84757+01	18	Zitronensaft | 55	1	[{"added": {}}]	26	1
477	2021-02-01 20:01:52.355092+01	48	Pizza Margherita	1	[{"added": {}}]	10	3
478	2021-02-01 20:03:24.391328+01	19	Butternusskürbis | 1500	1	[{"added": {}}]	26	1
479	2021-02-01 20:03:53.669727+01	15	Olivenöl | 150	2	[{"changed": {"fields": ["ValueInGrams"]}}]	26	1
480	2021-02-01 20:04:46.760392+01	15	Olivenöl | 135	2	[{"changed": {"fields": ["ValueInGrams", "OtherValue"]}}]	26	1
481	2021-02-01 20:05:19.164581+01	119	anne | Rating: 1	2	[{"changed": {"fields": ["Account"]}}]	11	3
482	2021-02-01 20:18:51.62491+01	2	Butternut Ofenkürbis mit Pesto	1	[{"added": {}}]	25	1
483	2021-02-01 20:19:05.250283+01	1	Pasta Pomodoro Classico	2	[]	25	1
484	2021-02-01 20:19:49.217406+01	20	Bedda Hirte | 150	1	[{"added": {}}]	26	1
485	2021-02-01 20:20:03.021026+01	2	Butternut Ofenkürbis mit Pesto	2	[{"changed": {"fields": ["Ingredients"]}}]	25	1
486	2021-02-01 20:27:15.143674+01	11	Olivenöl | 20	2	[{"changed": {"fields": ["OtherValue"]}}]	26	1
487	2021-02-01 20:39:00.012838+01	2	Butternut Ofenkürbis mit Pesto	2	[{"changed": {"fields": ["Headline", "Article body", "IngredientList", "Recipe"]}}]	7	1
488	2021-02-02 13:13:59.723227+01	121	LukeFalko | Rating: 4	1	[{"added": {}}]	11	3
489	2021-02-02 13:21:53.45042+01	18	LukeFalko	2	[{"changed": {"fields": ["Initials", "Profile picture", "Biography"]}}]	6	3
490	2021-02-02 13:23:57.102559+01	122	Falko | Rating: 5	1	[{"added": {}}]	11	3
491	2021-02-02 13:25:41.908019+01	123	Robin | Rating: 4	1	[{"added": {}}]	11	3
492	2021-02-02 13:26:17.174132+01	123	Robin | Rating: 3	2	[{"changed": {"fields": ["Ratings"]}}]	11	3
493	2021-02-02 13:28:08.835933+01	18	Leon Falko	2	[{"changed": {"fields": ["Username", "First name"]}}]	6	3
494	2021-02-02 13:28:32.90339+01	18	Leon	2	[{"changed": {"fields": ["Username"]}}]	6	3
495	2021-02-02 13:30:10.699843+01	124	Leon | Rating: 3	1	[{"added": {}}]	11	3
496	2021-02-02 13:31:24.226818+01	125	Robin | Rating: 4	1	[{"added": {}}]	11	3
497	2021-02-02 13:32:57.506279+01	126	Leon | Rating: 1	1	[{"added": {}}]	11	3
498	2021-02-02 13:33:52.912157+01	127	Robin | Rating: 2	1	[{"added": {}}]	11	3
499	2021-02-02 13:34:33.614541+01	128	Falko | Rating: 5	1	[{"added": {}}]	11	3
500	2021-02-02 13:35:28.951534+01	129	anne | Rating: 5	1	[{"added": {}}]	11	3
501	2021-02-02 13:36:45.885274+01	130	Luis | Rating: 4	1	[{"added": {}}]	11	3
502	2021-02-02 13:38:30.478184+01	131	Vegan_gott_007 | Rating: 4	1	[{"added": {}}]	11	3
503	2021-02-02 13:50:06.041183+01	50	Vegan_gott_007	2	[{"changed": {"fields": ["Initials", "Profile picture", "Biography"]}}]	6	3
504	2021-02-02 13:52:02.203609+01	132	Vegan_gott_007 | Rating: 4	1	[{"added": {}}]	11	3
505	2021-02-02 13:53:02.57547+01	133	Falko | Rating: 4	1	[{"added": {}}]	11	3
506	2021-02-02 13:53:46.761914+01	134	Robin | Rating: 5	1	[{"added": {}}]	11	3
507	2021-02-02 13:54:55.952143+01	135	anne | Rating: 5	1	[{"added": {}}]	11	3
508	2021-02-02 13:56:10.759008+01	136	Leon | Rating: 1	1	[{"added": {}}]	11	3
509	2021-02-02 17:59:44.351799+01	49	Mojito	1	[{"added": {}}]	10	3
510	2021-02-02 18:01:28.026026+01	50	Long Island Ice Tea	1	[{"added": {}}]	10	3
511	2021-02-02 18:01:40.848741+01	49	Mojito	2	[{"changed": {"fields": ["ToGoPrice"]}}]	10	3
512	2021-02-02 18:03:23.778696+01	51	Bahama Mama	1	[{"added": {}}]	10	3
513	2021-02-02 18:05:15.571911+01	52	Tequila Sunrise	1	[{"added": {}}]	10	3
514	2021-02-02 18:06:16.71566+01	53	Swimming Pool	1	[{"added": {}}]	10	3
515	2021-02-02 18:09:39.485362+01	26	Snacks	1	[{"added": {}}]	8	3
516	2021-02-02 18:10:18.445978+01	54	Tortilla Chips & Dips	1	[{"added": {}}]	10	3
517	2021-02-02 18:11:19.307202+01	55	Basket of Chips	1	[{"added": {}}]	10	3
518	2021-02-02 18:39:14.367058+01	137	Falko | Rating: 5	1	[{"added": {}}]	11	3
519	2021-02-02 18:40:03.139054+01	138	Leon | Rating: 5	1	[{"added": {}}]	11	3
520	2021-02-02 18:40:55.750767+01	139	Luis | Rating: 3	1	[{"added": {}}]	11	3
521	2021-02-02 18:45:19.685195+01	140	anne | Rating: 4	1	[{"added": {}}]	11	3
522	2021-02-02 18:46:29.592072+01	141	Boris | Rating: 3	1	[{"added": {}}]	11	3
523	2021-02-02 18:49:28.622789+01	142	lisschen | Rating: 1	1	[{"added": {}}]	11	3
524	2021-02-02 18:51:06.419309+01	48	Boris	2	[{"changed": {"fields": ["First name", "Initials", "Profile picture", "Biography"]}}]	6	3
525	2021-02-02 18:52:44.00419+01	143	Vegan_gott_007 | Rating: 3	1	[{"added": {}}]	11	3
526	2021-02-02 18:55:59.774443+01	10	Kalbshalle	2	[{"changed": {"fields": ["Description"]}}]	9	3
527	2021-02-02 18:58:22.010451+01	8	Crusty Crab	2	[{"changed": {"fields": ["Tags"]}}]	9	3
528	2021-02-02 18:59:32.438923+01	27	Cocktailbar	1	[{"added": {}}]	8	3
529	2021-02-02 19:05:23.751745+01	7	Cantina Bar	2	[{"changed": {"fields": ["Tags"]}}]	9	3
530	2021-02-02 19:08:18.019627+01	56	Kleiner gemischter Salat	1	[{"added": {}}]	10	3
531	2021-02-02 19:09:19.112986+01	57	Hausgemachte Käsespätzle	1	[{"added": {}}]	10	3
532	2021-02-02 19:10:05.684051+01	58	Portion Salzkartoffeln	1	[{"added": {}}]	10	3
533	2021-02-02 19:12:32.964121+01	59	Veganer Leberkäse	1	[{"added": {}}]	10	3
534	2021-02-02 19:13:16.12077+01	60	Semmelködel	1	[{"added": {}}]	10	3
535	2021-02-02 19:14:37.904289+01	144	Luis | Rating: 4	1	[{"added": {}}]	11	3
536	2021-02-02 19:15:28.94819+01	145	Falko | Rating: 3	1	[{"added": {}}]	11	3
537	2021-02-02 19:17:10.429881+01	146	Leon | Rating: 1	1	[{"added": {}}]	11	3
538	2021-02-02 19:17:40.494656+01	147	Robin | Rating: 5	1	[{"added": {}}]	11	3
539	2021-02-02 19:35:51.25829+01	148	Vegan_gott_007 | Rating: 2	1	[{"added": {}}]	11	3
540	2021-02-02 19:37:19.372464+01	149	anne | Rating: 5	1	[{"added": {}}]	11	3
541	2021-02-02 19:56:50.694354+01	61	Mc Planty	1	[{"added": {}}]	10	3
542	2021-02-02 19:58:50.685136+01	62	Pommes	1	[{"added": {}}]	10	3
543	2021-02-02 20:13:29.344671+01	150	Robin | Rating: 1	1	[{"added": {}}]	11	3
544	2021-02-02 20:15:14.664754+01	151	Leon | Rating: 3	1	[{"added": {}}]	11	3
545	2021-02-02 20:20:06.067883+01	152	Falko | Rating: 2	1	[{"added": {}}]	11	3
546	2021-02-02 20:22:36.15583+01	63	Veggie Burger	1	[{"added": {}}]	10	3
547	2021-02-02 20:26:19.759673+01	1	Robins Küche	2	[{"changed": {"fields": ["Description", "Tags", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]}}]	9	3
548	2021-02-02 20:51:35.615581+01	2	Robin	2	[{"changed": {"fields": ["Biography"]}}]	6	3
549	2021-02-02 20:51:55.265825+01	1	Falko	2	[]	6	3
550	2021-02-02 20:52:46.724028+01	6	Luis	2	[]	6	3
551	2021-02-02 20:52:58.133992+01	1	Falko	2	[]	6	3
552	2021-02-02 21:00:02.767818+01	1	Robins Küche	2	[{"changed": {"fields": ["Restaurant picture"]}}]	9	3
553	2021-02-02 21:40:03.189272+01	1	Robins Küche	2	[{"changed": {"fields": ["Tags"]}}]	9	3
554	2021-02-02 21:43:25.554849+01	64	Spaghetti Napoli	1	[{"added": {}}]	10	3
555	2021-02-02 21:45:59.365565+01	65	Spaghetti Pomodoro	1	[{"added": {}}]	10	3
556	2021-02-02 21:48:01.728236+01	66	Rigatoni Gorgonzola	1	[{"added": {}}]	10	3
557	2021-02-02 21:48:57.291891+01	67	Panzerotti Spinaci	1	[{"added": {}}]	10	3
558	2021-02-02 21:57:09.628095+01	68	Insalata Mista	1	[{"added": {}}]	10	3
559	2021-02-02 21:58:39.823881+01	69	Insalata Caesare	1	[{"added": {}}]	10	3
560	2021-02-02 22:01:59.331865+01	70	Al Forno	1	[{"added": {}}]	10	3
561	2021-02-02 22:03:31.204809+01	71	Pesto Verde	1	[{"added": {}}]	10	3
562	2021-02-02 22:04:19.595989+01	72	Mafioso	1	[{"added": {}}]	10	3
563	2021-02-02 22:08:13.022366+01	153	anne | Rating: 5	1	[{"added": {}}]	11	3
564	2021-02-02 22:08:56.644338+01	1	Burger	3		10	3
565	2021-02-02 22:09:54.358407+01	107	Luis | Rating: 3	3		11	3
566	2021-02-02 22:10:29.976414+01	90	anne | Rating: 1	3		11	3
567	2021-02-02 22:11:04.076706+01	33	Falko | Rating: 5	3		11	3
568	2021-02-02 22:11:37.655521+01	34	Falko | Rating: 5	2	[{"changed": {"fields": ["Content"]}}]	11	3
569	2021-02-02 22:13:24.044734+01	154	Luis | Rating: 4	1	[{"added": {}}]	11	3
570	2021-02-02 22:14:57.059066+01	155	Robin | Rating: 5	1	[{"added": {}}]	11	3
571	2021-02-02 22:15:43.698341+01	156	Leon | Rating: 5	1	[{"added": {}}]	11	3
572	2021-02-02 22:16:50.31625+01	157	lisschen | Rating: 4	1	[{"added": {}}]	11	3
573	2021-02-02 22:17:28.26206+01	158	Vegan_gott_007 | Rating: 5	1	[{"added": {}}]	11	3
574	2021-02-02 22:18:48.389327+01	159	Boris | Rating: 3	1	[{"added": {}}]	11	3
575	2021-02-02 22:20:50.301464+01	5	Gourmet	2	[{"changed": {"fields": ["Tags"]}}]	9	3
576	2021-02-02 22:26:40.376629+01	109	Luis | Rating: 5	3		11	3
577	2021-02-02 22:27:09.061078+01	105	Luis | Rating: 4	3		11	3
578	2021-02-02 22:32:18.179801+01	73	Pizzabrot	1	[{"added": {}}]	10	3
579	2021-02-02 22:33:14.715426+01	74	Pizza Margherita	1	[{"added": {}}]	10	3
580	2021-02-02 22:33:59.713599+01	75	Pizza Peppe	1	[{"added": {}}]	10	3
581	2021-02-02 22:34:45.870936+01	76	Pizza Vegetaria	1	[{"added": {}}]	10	3
582	2021-02-02 22:35:43.249261+01	77	Falafel Dürüm	1	[{"added": {}}]	10	3
583	2021-02-02 22:36:33.598714+01	78	Vegetarischer Döner	1	[{"added": {}}]	10	3
584	2021-02-02 22:38:47.768453+01	79	Vegan Döner Sandwich	1	[{"added": {}}]	10	3
585	2021-02-02 22:43:27.617106+01	160	Robin | Rating: 5	1	[{"added": {}}]	11	3
586	2021-02-02 22:43:54.316354+01	161	Falko | Rating: 5	1	[{"added": {}}]	11	3
587	2021-02-02 22:44:17.667747+01	162	Leon | Rating: 5	1	[{"added": {}}]	11	3
588	2021-02-02 22:45:04.518076+01	163	Vegan_gott_007 | Rating: 3	1	[{"added": {}}]	11	3
589	2021-02-02 22:45:34.591054+01	164	Vegan_gott_007 | Rating: 4	1	[{"added": {}}]	11	3
590	2021-02-02 22:46:03.084039+01	164	Boris | Rating: 4	2	[{"changed": {"fields": ["Account"]}}]	11	3
591	2021-02-02 22:46:39.017813+01	165	lisschen | Rating: 4	1	[{"added": {}}]	11	3
592	2021-02-02 22:47:23.764386+01	166	anne | Rating: 1	1	[{"added": {}}]	11	3
593	2021-02-02 22:48:01.492628+01	5	Gourmet	2	[{"changed": {"fields": ["Description"]}}]	9	3
594	2021-02-02 22:49:43.530217+01	2	Rice Bar	2	[{"changed": {"fields": ["Name", "Description", "Tags"]}}]	9	3
595	2021-02-02 22:50:28.944739+01	95	flogesell | Rating: 3	3		11	3
596	2021-02-02 22:51:23.94959+01	120	Luis | Rating: 5	3		11	3
597	2021-02-02 22:51:47.643718+01	35	Falko | Rating: 5	3		11	3
598	2021-02-02 22:53:52.635924+01	79	Falko | Rating: 4	3		11	3
599	2021-02-02 22:54:33.810472+01	10	Tinkerbell Burger	2	[{"changed": {"fields": ["Restaurant"]}}]	10	3
600	2021-02-02 22:55:00.374597+01	18	Frohnatur	2	[{"changed": {"fields": ["Restaurant"]}}]	10	3
601	2021-02-02 22:55:12.471955+01	17	Räubertochter	2	[{"changed": {"fields": ["Restaurant"]}}]	10	3
602	2021-02-02 22:55:26.986486+01	16	Holde Maid	2	[{"changed": {"fields": ["Restaurant"]}}]	10	3
603	2021-02-02 22:56:02.972881+01	18	Frohnatur	2	[{"changed": {"fields": ["Restaurant"]}}]	10	3
604	2021-02-02 22:56:21.615224+01	17	Räubertochter	2	[{"changed": {"fields": ["Restaurant"]}}]	10	3
605	2021-02-02 22:56:35.408887+01	16	Holde Maid	2	[{"changed": {"fields": ["Restaurant"]}}]	10	3
606	2021-02-02 22:56:46.358006+01	10	Tinkerbell Burger	2	[{"changed": {"fields": ["Restaurant"]}}]	10	3
607	2021-02-02 22:59:28.481596+01	80	Noodle Bowl	1	[{"added": {}}]	10	3
608	2021-02-02 23:00:20.200739+01	28	Suppe	1	[{"added": {}}]	8	3
609	2021-02-02 23:00:45.336188+01	81	Noodle Soup	1	[{"added": {}}]	10	3
610	2021-02-02 23:02:09.680733+01	29	Sushi	1	[{"added": {}}]	8	3
611	2021-02-02 23:02:27.277742+01	82	Avocado-Rollen	1	[{"added": {}}]	10	3
612	2021-02-03 15:33:38.02134+01	13	Henry's Pizza	1	[{"added": {}}]	9	1
613	2021-02-03 15:35:37.057466+01	83	Pizzabrot	1	[{"added": {}}]	10	1
614	2021-02-03 15:36:45.172699+01	84	Pizza Margherita	1	[{"added": {}}]	10	1
615	2021-02-03 15:38:00.380798+01	85	Pizza Margherita	1	[{"added": {}}]	10	1
616	2021-02-03 15:38:52.286985+01	86	Pizza Funghi	1	[{"added": {}}]	10	1
617	2021-02-03 15:40:19.263436+01	87	Pizza Funghi	1	[{"added": {}}]	10	1
618	2021-02-03 15:41:11.892368+01	88	Pizza Peperoni	1	[{"added": {}}]	10	1
619	2021-02-03 15:41:55.831705+01	89	Pizza Peperoni	1	[{"added": {}}]	10	1
620	2021-02-03 15:42:50.818557+01	90	Pizza Caprese	1	[{"added": {}}]	10	1
621	2021-02-03 15:43:26.488496+01	91	Pizza Caprese	1	[{"added": {}}]	10	1
622	2021-02-03 15:44:41.506854+01	92	Pizza Carciofini	1	[{"added": {}}]	10	1
623	2021-02-03 15:45:37.985303+01	93	Pizza Carciofini	1	[{"added": {}}]	10	1
624	2021-02-03 15:46:45.82297+01	94	Pizza Vegetaria	1	[{"added": {}}]	10	1
625	2021-02-03 15:48:25.350401+01	95	Kleiner gemischter Salat	1	[{"added": {}}]	10	1
626	2021-02-03 15:49:16.868565+01	96	Kleiner gemischter Salat mit Balsamico Dressing	1	[{"added": {}}]	10	1
627	2021-02-03 15:50:42.766581+01	97	Henry's Salat	1	[{"added": {}}]	10	1
628	2021-02-03 15:55:18.309385+01	98	Pizza Vegetaria	1	[{"added": {}}]	10	1
629	2021-02-03 17:38:00.265293+01	99	Cola Light	1	[{"added": {}}]	10	2
630	2021-02-03 17:45:32.726123+01	13	Henrys Pizza	2	[{"changed": {"fields": ["Name"]}}]	9	2
631	2021-02-03 17:46:11.275889+01	7	Cantina Barr	2	[{"changed": {"fields": ["Name"]}}]	9	2
632	2021-02-03 17:46:44.736981+01	7	Kantina Bar	2	[{"changed": {"fields": ["Name"]}}]	9	2
633	2021-02-03 17:47:29.676975+01	13	Henry‘s Pizza	2	[{"changed": {"fields": ["Name"]}}]	9	2
634	2021-02-03 17:48:24.243935+01	13	Henry's Pizza	2	[{"changed": {"fields": ["Name"]}}]	9	2
635	2021-02-03 17:48:45.032451+01	13	Henrys Pizza	2	[{"changed": {"fields": ["Name"]}}]	9	2
636	2021-02-03 17:49:05.61192+01	7	Robins Bar	2	[{"changed": {"fields": ["Name"]}}]	9	2
637	2021-02-03 17:51:19.668356+01	7	Cantina Bar	2	[{"changed": {"fields": ["Name"]}}]	9	2
638	2021-02-03 17:52:53.148632+01	54	Tortilla Chips & Dips	2	[{"changed": {"fields": ["ToGoPrice"]}}]	10	2
639	2021-02-03 18:01:30.058409+01	54	Tortilla Chips & Dips	2	[{"changed": {"fields": ["Description"]}}]	10	2
640	2021-02-03 18:02:18.144726+01	54	Tortilla Chips & Dips	2	[{"changed": {"fields": ["Description"]}}]	10	2
641	2021-02-03 18:03:04.383971+01	100	Space Burger	1	[{"added": {}}]	10	2
642	2021-02-03 18:05:47.38799+01	100	Space Burger	2	[]	10	2
643	2021-02-04 13:43:50.785152+01	85	Pizza Margherita	2	[{"changed": {"fields": ["ToGoPrice", "Price"]}}]	10	1
644	2021-02-04 13:44:09.053778+01	87	Pizza Funghi	2	[{"changed": {"fields": ["ToGoPrice", "Price"]}}]	10	1
645	2021-02-04 13:44:25.596066+01	89	Pizza Peperoni	2	[{"changed": {"fields": ["ToGoPrice", "Price"]}}]	10	1
646	2021-02-04 13:44:45.152637+01	91	Pizza Caprese	2	[{"changed": {"fields": ["ToGoPrice", "Price"]}}]	10	1
647	2021-02-04 13:45:03.371588+01	98	Pizza Vegetaria	2	[{"changed": {"fields": ["ToGoPrice", "Price"]}}]	10	1
648	2021-02-04 13:47:36.75639+01	98	Pizza Vegetaria	2	[{"changed": {"fields": ["ToGoPrice"]}}]	10	1
649	2021-02-04 13:48:12.407544+01	98	Pizza Vegetaria	2	[{"changed": {"fields": ["ToGoPrice"]}}]	10	1
650	2021-02-04 13:48:20.794792+01	94	Pizza Vegetaria	2	[]	10	1
651	2021-02-04 16:59:53.32396+01	7	Cantina Bar	3		9	2
652	2021-02-04 17:02:08.948292+01	100	Space Burger	3		10	2
653	2021-02-04 17:02:19.002684+01	99	Cola Light	2	[]	10	2
654	2021-02-04 17:03:15.321989+01	49	Mojito	2	[{"changed": {"fields": ["Restaurant"]}}]	10	2
655	2021-02-04 17:03:38.556262+01	50	Long Island Ice Tea	2	[{"changed": {"fields": ["Restaurant"]}}]	10	2
656	2021-02-04 17:05:53.557409+01	14	Cantina Bar	1	[{"added": {}}]	9	2
657	2021-02-04 17:05:58.574838+01	55	Basket of Chips	2	[{"changed": {"fields": ["Restaurant"]}}]	10	2
658	2021-02-04 17:06:20.678174+01	54	Tortilla Chips & Dips	2	[{"changed": {"fields": ["Restaurant"]}}]	10	2
659	2021-02-04 17:06:39.528496+01	53	Swimming Pool	2	[{"changed": {"fields": ["Restaurant"]}}]	10	2
660	2021-02-04 17:06:51.229887+01	52	Tequila Sunrise	2	[{"changed": {"fields": ["Restaurant"]}}]	10	2
661	2021-02-04 17:07:05.195045+01	51	Bahama Mama	2	[{"changed": {"fields": ["Restaurant"]}}]	10	2
662	2021-02-04 17:38:12.84517+01	85	Pizza Margherita	3		10	2
663	2021-02-04 17:40:24.884077+01	92	Pizza Carciofini	3		10	2
664	2021-02-04 17:40:29.429213+01	91	Pizza Caprese	3		10	2
665	2021-02-04 17:40:36.516946+01	88	Pizza Peperoni	3		10	2
666	2021-02-04 17:40:46.496267+01	86	Pizza Funghi	3		10	2
667	2021-02-04 17:41:54.627506+01	94	Pizza Vegetaria	3		10	2
668	2021-02-04 17:43:50.509923+01	14	Cantina Bar	3		9	2
669	2021-02-04 17:44:50.287084+01	55	Basket of Chips	3		10	2
670	2021-02-04 17:45:13.336764+01	54	Tortilla Chips & Dips	3		10	2
671	2021-02-04 17:45:35.955846+01	53	Swimming Pool	3		10	2
672	2021-02-04 17:45:36.003358+01	52	Tequila Sunrise	3		10	2
673	2021-02-04 17:45:36.043591+01	51	Bahama Mama	3		10	2
674	2021-02-04 17:45:36.093952+01	50	Long Island Ice Tea	3		10	2
675	2021-02-04 17:45:36.144002+01	49	Mojito	3		10	2
676	2021-02-05 14:17:49.472543+01	143	Vegan_gott_007 on  | Rating: 3	3		11	1
677	2021-02-05 14:17:49.540804+01	142	lisschen on  | Rating: 1	3		11	1
678	2021-02-05 14:17:49.607194+01	141	Boris on  | Rating: 3	3		11	1
679	2021-02-05 14:17:49.673395+01	140	anne on  | Rating: 4	3		11	1
680	2021-02-05 14:17:49.740735+01	139	Luis on  | Rating: 3	3		11	1
681	2021-02-05 14:17:49.806914+01	138	Leon on  | Rating: 5	3		11	1
682	2021-02-05 14:17:49.865075+01	137	Falko on  | Rating: 5	3		11	1
683	2021-02-05 14:17:49.922739+01	84	Robin on  | Rating: 5	3		11	1
684	2021-02-05 18:24:55.25355+01	44	Falafel Wrap	3		10	2
\.


--
-- TOC entry 4006 (class 0 OID 36442)
-- Dependencies: 239
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	accounts	account
7	accounts	article
8	accounts	tag
9	accounts	restaurant
10	accounts	food
11	accounts	comment
12	accounts	coworker
13	accounts	rating
14	accounts	blog
15	accounts	author
16	accounts	entry
17	accounts	restaurantlocation
18	accounts	friend
19	accounts	friendlist
20	accounts	friendrequest
21	accounts	rd_update
22	accounts	hours
23	accounts	subcomment
24	accounts	ingredient
25	accounts	recipe
26	accounts	ingredientvalue
\.


--
-- TOC entry 3986 (class 0 OID 34688)
-- Dependencies: 204
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	accounts	0001_initial	2020-12-10 14:24:42.82822+01
2	accounts	0002_coworker	2020-12-10 14:24:43.965158+01
3	accounts	0003_auto_20201202_1656	2020-12-11 08:10:41.064311+01
4	accounts	0004_auto_20201202_1656	2020-12-11 08:10:41.286914+01
5	accounts	0005_auto_20201210_1325	2020-12-11 08:10:41.427259+01
6	contenttypes	0001_initial	2020-12-11 08:10:41.736184+01
7	admin	0001_initial	2020-12-11 08:10:42.021774+01
8	admin	0002_logentry_remove_auto_add	2020-12-11 08:10:42.424542+01
9	admin	0003_logentry_add_action_flag_choices	2020-12-11 08:10:42.575207+01
10	contenttypes	0002_remove_content_type_name	2020-12-11 08:10:42.812687+01
11	auth	0001_initial	2020-12-11 08:10:43.337517+01
12	auth	0002_alter_permission_name_max_length	2020-12-11 08:10:44.070971+01
13	auth	0003_alter_user_email_max_length	2020-12-11 08:10:44.255993+01
14	auth	0004_alter_user_username_opts	2020-12-11 08:10:44.427101+01
15	auth	0005_alter_user_last_login_null	2020-12-11 08:10:44.579759+01
16	auth	0006_require_contenttypes_0002	2020-12-11 08:10:44.76376+01
17	auth	0007_alter_validators_add_error_messages	2020-12-11 08:10:44.905644+01
18	auth	0008_alter_user_username_max_length	2020-12-11 08:10:45.066809+01
19	auth	0009_alter_user_last_name_max_length	2020-12-11 08:10:45.21005+01
20	auth	0010_alter_group_name_max_length	2020-12-11 08:10:45.402967+01
21	auth	0011_update_proxy_permissions	2020-12-11 08:10:45.568318+01
22	auth	0012_alter_user_first_name_max_length	2020-12-11 08:10:45.728993+01
23	sessions	0001_initial	2020-12-11 08:10:46.008038+01
24	accounts	0006_auto_20201211_1248	2020-12-11 13:48:55.381343+01
25	accounts	0007_auto_20201211_1334	2020-12-11 14:34:21.135148+01
26	accounts	0008_auto_20201211_1825	2020-12-11 19:25:15.545628+01
27	accounts	0008_auto_20201211_1826	2020-12-11 19:27:05.419657+01
28	accounts	0009_auto_20201211_1921	2020-12-11 20:21:22.751803+01
29	accounts	0010_auto_20201212_1759	2020-12-12 18:59:20.815018+01
30	accounts	0010_auto_20201212_2037	2020-12-12 21:44:53.373154+01
31	accounts	0011_remove_rating_account	2020-12-12 21:44:53.443376+01
32	accounts	0012_rating_account	2020-12-12 21:45:21.78873+01
33	accounts	0013_auto_20201212_2056	2020-12-12 21:57:06.903969+01
34	accounts	0014_remove_restaurant_averagerating	2020-12-12 23:34:25.138+01
35	accounts	0015_author_blog_entry	2020-12-13 14:00:55.295875+01
36	accounts	0015_restaurant_averagerating	2020-12-13 19:56:25.833904+01
37	accounts	0016_remove_restaurant_averagerating	2020-12-13 22:51:09.969357+01
38	accounts	0017_auto_20201213_2158	2020-12-13 22:58:39.123446+01
39	accounts	0017_account_biography	2020-12-14 16:10:36.425375+01
40	accounts	0016_auto_20201213_1450	2020-12-14 20:59:40.957008+01
41	accounts	0018_merge_20201214_2059	2020-12-14 20:59:41.054034+01
42	accounts	0019_auto_20201214_2102	2020-12-14 21:05:33.331279+01
43	accounts	0018_auto_20201215_1338	2020-12-15 14:39:28.809135+01
44	accounts	0019_auto_20201215_1626	2020-12-15 17:26:20.947377+01
45	accounts	0019_auto_20201215_1704	2020-12-15 18:04:24.691757+01
46	accounts	0018_auto_20201215_1705	2020-12-15 18:05:49.068922+01
47	accounts	0018_auto_20201215_1706	2020-12-15 18:06:53.204317+01
48	accounts	0019_friend	2020-12-15 18:07:16.774282+01
49	accounts	0020_auto_20201215_1740	2020-12-15 18:40:43.991986+01
50	accounts	0020_auto_20201215_2023	2020-12-15 21:24:15.708507+01
51	accounts	0020_auto_20201216_1030	2020-12-16 11:30:27.194773+01
52	accounts	0020_delete_friend	2020-12-16 11:45:55.84451+01
53	accounts	0021_friendlist_friendrequest	2020-12-16 11:46:42.677737+01
54	accounts	0022_merge_20201218_1802	2020-12-18 18:20:07.951062+01
55	accounts	0023_auto_20201218_1819	2020-12-19 18:41:20.784608+01
56	accounts	0024_auto_20201218_1830	2020-12-19 18:41:20.865647+01
57	accounts	0025_remove_restaurant_point	2020-12-19 18:41:20.949683+01
58	accounts	0026_restaurant_point	2020-12-19 18:41:21.03673+01
59	accounts	0027_remove_restaurant_point	2020-12-19 18:41:21.123749+01
60	accounts	0028_restaurant_point	2020-12-19 18:41:21.213798+01
61	accounts	0029_auto_20201220_1340	2020-12-20 13:40:31.665357+01
62	accounts	0030_auto_20201220_1627	2020-12-20 16:27:49.858123+01
63	accounts	0031_auto_20201220_1643	2020-12-20 16:43:42.4721+01
64	accounts	0032_remove_restaurant_point	2020-12-20 17:14:39.574937+01
65	accounts	0022_auto_20210104_1820	2021-01-04 19:26:21.695008+01
66	accounts	0022_auto_20210104_1930	2021-01-04 20:36:11.629269+01
67	accounts	0022_auto_20210104_1938	2021-01-04 20:44:50.756442+01
68	accounts	0023_remove_restaurant_likes	2021-01-04 20:45:27.942967+01
69	accounts	0024_restaurant_likes	2021-01-04 20:45:39.80968+01
70	accounts	0025_delete_rd_update	2021-01-04 21:40:07.432344+01
71	accounts	0026_rd_update	2021-01-04 21:43:40.200466+01
72	accounts	0025_auto_20210105_1142	2021-01-05 12:42:18.123801+01
73	accounts	0026_auto_20210105_1144	2021-01-05 12:45:16.206512+01
74	accounts	0027_auto_20210105_1206	2021-01-05 13:06:40.83896+01
75	accounts	0022_auto_20210103_1656	2021-01-05 15:49:28.263286+01
76	accounts	0023_rd_update	2021-01-05 15:49:28.350848+01
77	accounts	0028_merge_20210105_1449	2021-01-05 15:49:28.424857+01
78	accounts	0023_auto_20210105_1502	2021-01-05 16:02:45.215251+01
79	accounts	0024_auto_20210105_1515	2021-01-05 16:15:52.931514+01
80	accounts	0025_auto_20210105_1833	2021-01-05 19:33:13.70006+01
81	accounts	0026_restaurant_averagerating	2021-01-06 15:44:50.27485+01
82	accounts	0027_subcoment	2021-01-08 11:54:33.203827+01
83	accounts	0028_auto_20210108_1057	2021-01-08 11:57:40.571532+01
84	accounts	0029_auto_20210108_1410	2021-01-08 15:10:51.972496+01
85	accounts	0030_remove_comment_parent	2021-01-08 15:20:44.466591+01
86	accounts	0031_auto_20210108_1831	2021-01-08 19:31:37.178576+01
87	accounts	0032_auto_20210108_1843	2021-01-08 19:43:23.088249+01
88	accounts	0033_article_ingredientlist	2021-01-08 19:52:09.317925+01
89	accounts	0034_auto_20210108_2159	2021-01-08 23:00:13.263015+01
90	accounts	0035_auto_20210109_1110	2021-01-09 12:10:59.491114+01
91	accounts	0036_auto_20210109_1131	2021-01-09 12:31:48.508889+01
92	accounts	0037_auto_20210109_1136	2021-01-09 12:36:08.098993+01
93	accounts	0038_auto_20210111_1923	2021-01-11 20:23:57.937831+01
94	accounts	0039_auto_20210112_1500	2021-01-12 16:00:44.528309+01
95	accounts	0040_food_togo	2021-01-22 14:56:07.317982+01
96	accounts	0041_auto_20210122_1411	2021-01-22 15:12:56.343118+01
97	accounts	0042_remove_food_togo	2021-01-22 15:12:56.427211+01
98	accounts	0043_food_togo	2021-01-22 15:14:31.45764+01
99	accounts	0044_auto_20210123_1543	2021-01-23 16:52:03.509472+01
100	accounts	0045_auto_20210123_1544	2021-01-23 16:52:03.572385+01
101	accounts	0046_remove_food_togoav	2021-01-23 16:52:03.638881+01
102	accounts	0047_food_togoav	2021-01-23 16:52:03.705475+01
103	accounts	0048_auto_20210123_1549	2021-01-23 16:52:03.774081+01
104	accounts	0049_auto_20210123_1550	2021-01-23 16:52:03.847204+01
105	accounts	0050_remove_food_togoprice	2021-01-23 16:52:03.922337+01
106	accounts	0051_food_togo	2021-01-23 16:53:23.628628+01
107	accounts	0052_remove_food_delivery	2021-01-23 17:14:28.295399+01
108	accounts	0053_food_delivery	2021-01-23 17:14:28.358807+01
109	accounts	0054_remove_food_delivery	2021-01-23 17:14:28.433894+01
110	accounts	0055_food_delivery	2021-01-23 17:14:42.032755+01
111	accounts	0044_auto_20210123_1811	2021-01-23 19:11:15.81424+01
112	accounts	0056_merge_20210123_1823	2021-01-23 19:23:29.184238+01
113	accounts	0057_restaurant_description	2021-01-23 19:25:04.915176+01
114	accounts	0058_remove_food_delivery	2021-01-24 18:46:55.238291+01
115	accounts	0059_account_reset_password	2021-01-30 19:12:01.315359+01
116	accounts	0060_auto_20210201_1404	2021-02-01 15:04:13.365869+01
117	accounts	0061_auto_20210201_1840	2021-02-01 19:40:49.083507+01
118	accounts	0062_auto_20210201_1842	2021-02-01 19:42:42.499073+01
119	accounts	0063_auto_20210205_1248	2021-02-05 13:48:36.535009+01
120	accounts	0064_auto_20210205_1251	2021-02-05 13:51:54.338649+01
\.


--
-- TOC entry 4015 (class 0 OID 36526)
-- Dependencies: 248
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
e83lunapxqbm1x9ac6518p5p4j2y6ta9	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1krnfx:w5DHXlQP_Z54TLMN17F8jr8ZxJ5bH2fDfOWixZ7eIq4	2021-01-05 20:50:29.375211+01
2ffoat6vx4t4iy91a86bq3l0cydf1x10	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1l6ehN:Cea70aQKmHXIgt1L_2vc5wpj9D-qC6afl-T24hklpz8	2021-02-15 20:17:21.230062+01
a8slxq2hplsrd8b3yqtk9plrv34esavf	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1kncl3:UqHbkwxlrXJn4xiNQFMoFKW1WyHX5lR56OOh7SY4F4s	2020-12-25 08:22:29.069362+01
gb6xnplgbkzjhxs5grsvi9gdt8av7cxe	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1ksAtY:7fAqwr9TKmAkt_0493RsElsttRAuHTPWnWt-M6B_SCo	2021-01-06 21:38:04.052432+01
chd0fojup805m60n3lu0wvaeecxk9q9k	.eJxVjEEOwiAQRe_C2pAyyAAu3fcMhIFBqoYmpV0Z765NutDtf-_9lwhxW2vYOi9hyuIitDj9bhTTg9sO8j222yzT3NZlIrkr8qBdjnPm5_Vw_w5q7PVbk9OaExltbELiclaskwVXEEA5QG2ACDgNqoDyzns1WM4Z0VhPiFG8P9p6N08:1knkrU:Q8KPfbNhdG_SXdcTFjI7Gg7XlZBKHOL8PdtOKZgi1IQ	2020-12-25 17:01:40.029642+01
f7xna5j78h5qk8x4raxipx0264bfbs5q	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1ksBlb:XtTl0MCB8qd4-dNDYClHXNr4l6qe8STZckMGl3y1JHQ	2021-01-06 22:33:55.873599+01
byxkck4pafbm8xe8amm1x5ad43517scj	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1ktItC:OjD3e3ZRNftmcQ9o87voJwah6Ql10zE9U5l4epWB57Y	2021-01-10 00:22:22.164558+01
7d9f4w9cplu3wfz8i9gil7isvk5jdxzc	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1l6aOS:Es085I6Nr0o8Iq9X9mqdbiZyKWw_PYtXvh3UejdAXBc	2021-02-15 15:41:32.624542+01
xmv107stwfltgdxuuccysivwsqnfjd9n	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1ku0jp:LTsWWj1pnOd_NwSxmoyx-eHD6lwkM8uV42-vx9imAcA	2021-01-11 23:11:37.403446+01
3l821dk3hcirr6ksmfyuic1hmcsmopkn	e30:1kp76j:wxSd9-AkaHRHLs3zF7r3cI4wl61vzOTcsmn_JGYzh6w	2020-12-29 10:59:01.402054+01
mjgg2rtog4ehl0uq7nwe3ins9i12pwls	e30:1kp76s:HE4jcZpRA25yHRD3gHa6Kr06CxgTD90F-ZlX9vAqd5k	2020-12-29 10:59:10.691109+01
93m34sfw777ovttfpf366mpk5zc3zq5j	e30:1kp7AN:54k69UyAGaKP6kog3SYC837Mx1kj32RdX_oEQGfqbfo	2020-12-29 11:02:47.748307+01
0ivz9eqq6074s44d93jc2wrlm3g12ml2	e30:1kp7BJ:3aH8SCWWOSxkrYq6ZCgizJp_hbdXFwS-0ea42oZ9Lds	2020-12-29 11:03:45.894551+01
aa8tgyhk6pdu9bml4h2pcp2favv5qi9w	e30:1kp7Bc:CY13irovp9aWWcynhbo0_GjGq_gOSDPn_Ttt6WtI6go	2020-12-29 11:04:04.507388+01
cgw672j9z45iy2k9m5dsq9vucuoh6ikx	e30:1kp7Bp:1tCDHL-hxpzlwpNdUJHTnjOuQ4b0vswzYOJL5089E8g	2020-12-29 11:04:17.352655+01
ciorafe09wjnq1sytnqoaafo2dawvjg4	e30:1kp7vp:RfkhlO9M7PEtNPWJgmMtqKnz1xCw1DVFAewCwZONv9c	2020-12-29 11:51:49.83054+01
ajozp7g66wen5hs60wgk0p7hc9npd3vd	e30:1kp9GK:Q7K0f6fqoXAqXGx9GT8YVq9gEb5ttCPqPIKx3YFj3XU	2020-12-29 13:17:04.231554+01
wn6mkdnxamdb99sofon8ud5nxcf4o55g	e30:1kp9GY:hmIFRZ0pz-hJME641KuCDhltUivebm8eV64IMeYkL0w	2020-12-29 13:17:18.925984+01
korjxv07a5bbiapoqlipuineefh0odli	e30:1kp9IS:zUxJDJ4WqWS9N9Kdl4oe-mgFl_8V3PE6VZGhBNAbJ-E	2020-12-29 13:19:16.977471+01
f3qbnwa1f89fkxmj2j3wrghv3dkx6chm	e30:1kp9Iw:BFqtxXXqAleFDEemsd1NEjeCB9ZyjudzbXCXQqUUaTk	2020-12-29 13:19:46.181205+01
qysuj1zt8k2epts0svtammgg0z3nef89	e30:1kp9MY:4j4tMqkJEiaASljUft9Rde14_b1pSp9PvfiaoxkK400	2020-12-29 13:23:30.025866+01
ccz3qzleg2dsawwcsikeu9d28xj0e36t	e30:1kp9TY:FKTBt0sINB5V11xtTgJRLlZKbEKn2mgAimlbNTAIIAk	2020-12-29 13:30:44.204429+01
tyw36igs4tz685s6ua5pn0jmcnflcp4t	e30:1kp9Yx:YthmQrag2xUvQ6OjlloSoPv1UyWZ6Jte_DHuDTwXOXk	2020-12-29 13:36:19.813214+01
8tbhcxcooa4txyxdwbwzyhbado226u1x	e30:1kp9kR:j4rT6EI3jp1QZ-GU8X9Dc_2CJ_K9H24DZZtzPUzJJhk	2020-12-29 13:48:11.821438+01
rvvw0e1cuduyxhut8418q8757ohldcmt	e30:1kp9x4:52Y1tvTaYMcA7p-mNtL07NqMpWBndQeoiXB9HAi2Vqg	2020-12-29 14:01:14.258965+01
jpdoqlf0gfwdksa3wwou3f5b9cusovby	e30:1kp9xW:bcLYq3stqhJcyxTjTXq2z_y9cEF0Wa60n_rWsL8QPB4	2020-12-29 14:01:42.184629+01
yblbad8yb9iu836amfsbkm7q92yfwyby	e30:1kp9xk:YUWUzzOABcnL6KCa6kZrgFpz2SmOgIlJvLAz6ZQmFq4	2020-12-29 14:01:56.141652+01
gkayxvol2lz0wm2eicnb3rolej0x5jt4	e30:1kp9zr:eUzqLske8kYXpFRgWmUEcamgGlh8fMDjlw3icpdLQQA	2020-12-29 14:04:07.482159+01
84sz1uxrj568i5kvsqqy21rqurchvf8c	e30:1kp9zw:2lTg5-O9FyAgDWQyn0o0QHU8utP1UoIVdrKVLZDnJFQ	2020-12-29 14:04:12.231901+01
wu7hlzh0fajbbdzoa894uecye9c8eb9d	e30:1kpA0B:6yhOuUj1z6k4iKyD7yN7L_Jc8TPTjMlGFsPhEs7JldY	2020-12-29 14:04:27.471847+01
ikekw054s3ohbr38kdfgvu056im50tdd	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1kpA1h:IebE2Z5vIWHLd6GUL2X3PtxCAGYtefGCY0bbCRk5Ihs	2020-12-29 14:06:01.804229+01
szqql99aapsg76qw8tkbvzpr5nu3l0db	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1kpClH:4EZC8rKs9Py9_kz5e1QrpAox4JBDwlQFdFWTje2E2qE	2020-12-29 17:01:15.508282+01
dj5y7bposxi3s6kfxohwbbw2ddo9okml	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1kpvlU:OAX0zpg2kq5Kx_hjZREHY9nfHSe0S7-OIhs8UWP3P-U	2020-12-31 17:04:28.610942+01
zvrw8007ly4nfzf40qhwiw0frq3iv1wi	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1kq0fG:ZBTy46FT-fZMzYCo8Ay9-zBIOzjG-i3insoCPvN2zv0	2020-12-31 22:18:22.36435+01
5917iyfbpupqs0n81wccf8fiqxklxyj9	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1kqCvO:cydfMuf8Gln0yQuiegkJmbeaaquY2_1fgojs8PKu4OQ	2021-01-01 11:23:50.78205+01
f5k4vi35axvsseah8rs6c2p9jxqem7yd	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1kqFNN:p2Ctzu__lgzMH48i7bhjazqlwdPCA1BvkgXYVUF7_TM	2021-01-01 14:00:53.785406+01
bl991xbxzo5qhyh4xufx1p2o0ckhna99	.eJxVjMsOwiAQRf-FtSFQ3i7d-w1kYAapGkhKuzL-uzbpQrf3nHNfLMK21rgNWuKM7MwsO_1uCfKD2g7wDu3Wee5tXebEd4UfdPBrR3peDvfvoMKo31pYFNoJD8Ubj-hRCHLSGCpkFHkAq4MsaTITgc3ByFQ0ggpBK12ccOz9AeCFN7U:1kqyFT:7Qanhma9OwHJyIGtvTg6wlYdgOCt7F_i3dz4eypJcJ8	2021-01-03 13:55:43.837527+01
et0acafwnfl90zu0oxwe6bwysy5fwjo2	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1kugtE:y51eORVGP5gRaC_EuiCAAa7S9hEU-inh3lEOMZwP9Fg	2021-01-13 20:12:08.722317+01
343hme9l0aza2k5w2mbwcy4ext7vmlhe	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1l5T5E:oh_8lxggt0JuWEK9zgT_tOFDRzbyP28bBjvLFLj12mY	2021-02-12 13:41:04.369447+01
msc0y1za7yvgb3l448y7v3o14rcei0r4	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1l6j7K:t2UqRW9OTwqeMldP5_6VK1MEWzgmoGQ4C_l4Tna7Kts	2021-02-16 01:00:26.822695+01
wpcmwjs82wcyu2w38tdj61w67mi7r3ca	.eJxVjMsOwiAQRf-FtSFQ3i7d-w1kYAapGkhKuzL-uzbpQrf3nHNfLMK21rgNWuKM7MwsO_1uCfKD2g7wDu3Wee5tXebEd4UfdPBrR3peDvfvoMKo31pYFNoJD8Ubj-hRCHLSGCpkFHkAq4MsaTITgc3ByFQ0ggpBK12ccOz9AeCFN7U:1lJNyT:pS6Acr-WQDpu5qdwKGl4MuxHccoeBg3h3X6SHreSQCk	2021-03-22 23:03:37.523452+01
7bgveq2xzbr3zfmo717k2iadebn2gq3v	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1kujZ7:4fn7s0gSgMK-Ky_1o0HQnUed1E-MzlMy4M7S593GOLE	2021-01-13 23:03:33.780003+01
1wnuhiv6e5ysa84melq07qr87kqbplb4	.eJxVjMsOwiAQRf-FtSFQ3i7d-w1kYAapGkhKuzL-uzbpQrf3nHNfLMK21rgNWuKM7MwsO_1uCfKD2g7wDu3Wee5tXebEd4UfdPBrR3peDvfvoMKo31pYFNoJD8Ubj-hRCHLSGCpkFHkAq4MsaTITgc3ByFQ0ggpBK12ccOz9AeCFN7U:1l5T82:jWuC9vPp_3a-9Il9Fo8MXaVPz5jR308_kD7lnQTP_ZE	2021-02-12 13:43:58.620293+01
obc1lf1djlw8soc68guim8eo1sib8awj	.eJxVjMsOwiAQRf-FtSFQ3i7d-w1kYAapGkhKuzL-uzbpQrf3nHNfLMK21rgNWuKM7MwsO_1uCfKD2g7wDu3Wee5tXebEd4UfdPBrR3peDvfvoMKo31pYFNoJD8Ubj-hRCHLSGCpkFHkAq4MsaTITgc3ByFQ0ggpBK12ccOz9AeCFN7U:1lSk3t:Hkvc8j0Utb2j1C-Q3cSqAUC4BIit_61Xyg9OInh0et0	2021-04-17 19:27:53.563163+02
koddr8jpk1jbrpp6c7amh1hlk96eslo1	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1mAxyr:668Ux-dQ6PsyLpCVv4uNgSyp0dDKClD7JMhaKjn7kCI	2021-08-17 19:13:29.840328+02
5r1lgptr9kgen2endkl5s3on38ckqu3y	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1kulNu:NSShebtI5X4Q8xRHLToJOKuhm14Zc2wNEx1z4MNcklg	2021-01-14 01:00:06.486135+01
kf9evzwyckj9wv4u7x6z6la82k9fm1g7	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1l5VuQ:iJkF6RfjOQkmbORaw6A4WRkRdBmrEAociRXA2QxrHww	2021-02-12 16:42:06.114202+01
25wob09rppcps84i39xax1v1a4uqskg9	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1lTBrR:DN6emW_Q8JpsIihlBTY89-MrXVsLy2QRVqyCFwKdXWw	2021-04-19 01:08:53.198586+02
omzat9ny8o0hc0qkrr3xweufobt3arwo	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1kulUT:SY2uZIaU-bbErIMSoHcFXutkWa_7bHTeOPGqrkyutXk	2021-01-14 01:06:53.315683+01
vbe2d7iwyi099trfiuoj33lbq2599cld	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1l5Vvd:Iy-eoJ4EiRGJzkBl6mu56IMOToPKULhJLC7cjBBqKCo	2021-02-12 16:43:21.146979+01
6rntqogdci260jop3ti9rzdhnjsyhevc	.eJxVjMsOwiAURP-FtSFcebt07zeQCxekaiAp7cr477ZJF7qcOWfmzQKuSw3ryHOYiF0YsNNvFzE9c9sBPbDdO0-9LfMU-a7wgw5-65Rf18P9O6g46rYuPkpffDZkTJEOkhMkNYFCi9r5LZdIRiFlQQa8tdKRyoBJg9BnF9nnC-1iN-c:1laxZT:t3PpCa9IKPFKEQHG_H2CmrBeuxwwLsu6KDS5-AvBj98	2021-05-10 11:30:27.541641+02
21qlcx5eeh4orht4bzg6jjc9x9jkotj5	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1kullc:c1s9_xG7mRxHWHyn2VrFUCYySgvTwyXB5hznxSuyWdo	2021-01-14 01:24:36.370005+01
0x4wugukdgreaope5betk5go22h9p242	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1kulvU:S0t6m2rBBhcvxtQ73MX_qFmExbvND42p1oSXwwZ6f8E	2021-01-14 01:34:48.560631+01
d8s4ftabde3oaazzpfrpzz2azexm7hte	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1l5qBZ:ZxIDuxU_gwkGkJzTW41xv4d3XtDEZFgUpQTUEksn7pk	2021-02-13 14:21:09.368682+01
v8gknxhihfcfu9izpdncmxgrson9l6nc	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1l6xX4:zLOqrQmnZwoaqAF8azbnOANQFURi69Xd4GEVHvaEEGQ	2021-02-16 16:23:58.548062+01
qle6hvnnvtauo3q5jcydp8qmn172x9dm	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1kumvY:JA60CTUAD1eCVB2Qs8Jyud7nefB0RJxm_iI2sQLyCUs	2021-01-14 02:38:56.352396+01
v4tlzow0hgu62bcw9q9so93feg17zpx0	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1l5qDZ:xJneUxitLzoRk450brO_mqo-5XK2IWgAfEr_tfBSTTs	2021-02-13 14:23:13.51043+01
jb4w4o6c7ujw8qw9j7rb7jz5kgiabvpw	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1l600U:752ECOpTOn7vUpXbyblVcE98shTjb25b1y-LnP8UsR0	2021-02-14 00:50:22.776962+01
42gmfm8f3ux2s8td24lvndfefrdemcrb	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1kv1Kf:sN-XbLd-6fe5x1BXU_HTHI4SS3BUIAnyo9UabWoEPoo	2021-01-14 18:01:49.364449+01
rwtvkgl0pdl6vpt76rs23b8ygf99n95k	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1l5qKB:Gf2eVcr2Y3rpSPSx_WBUyv9bpdYwQgthqFqtrGaBFL8	2021-02-13 14:30:03.331901+01
ic6h8t3fnot7xbi47zt6e5jjhd9cobws	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1l34ZO:soJU8SZh1W9iyOJA8miKxdgaDMfN_YZ_VQiTD83tqFk	2021-02-05 23:06:18.635776+01
1hynjvhnbfw52yb90luscb7e72ygtjf8	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1kv1hN:1a5LD7mm_Yz5gPXhYiyjEAvX2PHplLhXhVyfZD2TrWk	2021-01-14 18:25:17.248285+01
7v680xlt3ye39exl85wkoe0cm9b8he35	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1l5rXV:2ye0xP471XXjTQoGTfzqYqPaCFTZD71tueHiBC91jWg	2021-02-13 15:47:53.817706+01
9epsy1o3v5puj75mj1nkxjjzqxoax557	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1kv27Y:hqbJZt2AAHsJidKLUNj5sGNr4laWOPhq3myAswzb_60	2021-01-14 18:52:20.140928+01
gbkpyunhyki2t2bjgk6gtqstfacg2ibb	e30:1l6EBB:I9_AvV4wZohAPlxr9Dwc4A39VoXBIIBjt57Vvgz8osc	2021-02-14 15:58:21.137729+01
f4o7vlzobmc2a1gthqs9yuuzfgnfx1sj	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1l7L9S:XI9MoK5hq9eE_AuoOS0nQbpK9-IhKIoYXnwPDCTgqrc	2021-02-17 17:37:10.207709+01
r21rn28r56zcqtqyeyjm1bslboi8r771	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1kv96J:9Q7IYvihxgg-8r-_gopQ4R9bwyIdDs7idcJsNH1GcVQ	2021-01-15 02:19:31.025429+01
7mdsn7e6rw35sux91fewvpn3qekfptk4	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1l7SO9:zzpjM4oGpnFfubNRshZenKCMyIZo47lugNVxmZrO6V0	2021-02-18 01:20:49.421544+01
h0gkqaplfbcjfgbgcq512v31zhi16iun	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1l3Kwr:I7aqDYBe4EaMdSw0MkzGCHTnGEiQ3Pn92tNFxW5_Aw4	2021-02-06 16:35:37.435334+01
5ezxj1mz5qsy56bjawjzxeogy3tpm4mn	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1kv98h:tuwZ4U7YAaEX29SfDksCDfjRB5IHefLu6vfnxGRp89w	2021-01-15 02:21:59.809642+01
dzg368xn769whgc3u3hdhgnmtyqj2rld	.eJxVjDkOwjAUBe_iGlmOtziU9JzB-hs4gBwpTirE3ZGlFNC-mXlvlWHfSt6brHlmdVaDOv1uCPSU2gE_oN4XTUvd1hl1V_RBm74uLK_L4f4dFGil12K8WEzjJBiQLBpgEHZMOKaIbMMQbkbARScpkvcWEhnmCVxCH5z6fAEZJzji:1kxacv:YvS7_YJkHfz4iRFdXQL56nqbFQ7CjZF98iTZEVzakbk	2021-01-21 20:07:17.276243+01
slvxme2e6l3qgganv51as8celox6qdj3	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1l3jmg:ByAmmBvwPDRzx4MEqF8e51fxQsc0hZ_IMh_2N0g9CXg	2021-02-07 19:06:46.045881+01
jveaxayu9h64id136525mc2ngaj0ugzz	.eJxVjEEOwiAQRe_C2pAyyAAu3fcMhIFBqoYmpV0Z765NutDtf-_9lwhxW2vYOi9hyuIitDj9bhTTg9sO8j222yzT3NZlIrkr8qBdjnPm5_Vw_w5q7PVbk9OaExltbELiclaskwVXEEA5QG2ACDgNqoDyzns1WM4Z0VhPiFG8P9p6N08:1l6eVA:nC7bwOU9GmkQe7Z70F-EJRn1Kyc-0xvxiHjgohgbkQ0	2021-02-15 20:04:44.962684+01
3t97e0wkyv0g8b4hiqma1s0ldi8sj46r	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1kv9MB:G0Bu_5dhOQ0Pokw8IfxoIRPGuDWkIt0bXpMguqxXkxs	2021-01-15 02:35:55.185589+01
jig3tragw22r33jfovhbyou8w0pxvrz4	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1l5sem:kyGN7yvSOWNRPIV2zbPpH36wpgIs-9Ma4XGduFJKPnU	2021-02-13 16:59:28.873635+01
1fgmkvmnaka5pdai8u2hap8s2zb35cka	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1kv9YJ:tmuLgf0w0k97S3xg_sagIS1G1eSW10qGo2Rq6zcjxJA	2021-01-15 02:48:27.838637+01
1dgjdi115vt5fgb0wg9kvy7w4exp57em	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1l5sn5:JC15NXybSYky57LHyiMpUwnor2AxaHibGJA9qo7dkBM	2021-02-13 17:08:03.076851+01
x3owxmnnm4q7kup8wq976a8s9c2pfnd9	.eJxVjMsOwiAURP-FtSFcebt07zeQCxekaiAp7cr477ZJF7qcOWfmzQKuSw3ryHOYiF0YsNNvFzE9c9sBPbDdO0-9LfMU-a7wgw5-65Rf18P9O6g46rYuPkpffDZkTJEOkhMkNYFCi9r5LZdIRiFlQQa8tdKRyoBJg9BnF9nnC-1iN-c:1l7hQi:Yjc91WzDu_QprTV3ebiraXkz6XXfB4BuJ0yi3eADAYY	2021-02-18 17:24:28.553715+01
xqbf7fb36pqovnz1jz639kuk774p56hb	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1kv9aq:uQxVl7rjwUojOOKGvwrbGsiR6qLxn_xP8vBtwAI29i4	2021-01-15 02:51:04.540184+01
eir699rjcj1dkd9ug5is1rf30gqwdugz	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1l5spK:bn_D21buNiUrFoKqmJSeOXyC9RWvnUMiISzn1TISfWg	2021-02-13 17:10:22.248288+01
2q4i0n5gcuvskmz5bd22ycudvzf2ox8c	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1l6Ieq:UxA7tdqVfmWtQJL8Rjw_wVBsmbXKvQcRjei35S5pxfw	2021-02-14 20:45:16.867232+01
x7jnoqt0483l79lkucba6qw5c3ah2rdm	.eJxVjMsOwiAQRf-FtSFQ3i7d-w1kYAapGkhKuzL-uzbpQrf3nHNfLMK21rgNWuKM7MwsO_1uCfKD2g7wDu3Wee5tXebEd4UfdPBrR3peDvfvoMKo31pYFNoJD8Ubj-hRCHLSGCpkFHkAq4MsaTITgc3ByFQ0ggpBK12ccOz9AeCFN7U:1l4RFj:JbrlOYPKtC58NzoHAW_7IFZI5HgtScOG3gmEewNz7ts	2021-02-09 17:31:39.426751+01
7a5t9rq3ipkosry6yo7baqr3euwmsqs6	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1kv9bo:iT74SrxeT5hyl9zCmRt-KMBQej5pofdoQvuhfexm-6s	2021-01-15 02:52:04.661967+01
7k9ka3v8m2y89x77seow0v76he2hg5kc	.eJxVjMsOwiAQRf-FtSFQ3i7d-w1kYAapGkhKuzL-uzbpQrf3nHNfLMK21rgNWuKM7MwsO_1uCfKD2g7wDu3Wee5tXebEd4UfdPBrR3peDvfvoMKo31pYFNoJD8Ubj-hRCHLSGCpkFHkAq4MsaTITgc3ByFQ0ggpBK12ccOz9AeCFN7U:1kyZTq:yKjWJ194eKi02fuaw5Qa4ztzhmkqxLm-tK9FO6P4C7c	2021-01-24 13:05:58.285625+01
3gc17e8n3pm0u1zioj82a09nfiugjrtz	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1l5tIh:KWWIMJOMUHxgKgk_eTuLluLUYq2j1BnTSoR4hncwFRE	2021-02-13 17:40:43.277086+01
1p6zz5v2ahdu6r37f62dhnwuo2w7tb9d	.eJxVjEEOwiAQRe_C2pAyyAAu3fcMhIFBqoYmpV0Z765NutDtf-_9lwhxW2vYOi9hyuIitDj9bhTTg9sO8j222yzT3NZlIrkr8qBdjnPm5_Vw_w5q7PVbk9OaExltbELiclaskwVXEEA5QG2ACDgNqoDyzns1WM4Z0VhPiFG8P9p6N08:1l4RG2:-OFsRBLLT_WJ4cQycgREYKyMSFpnAW8YpTQdfVkDqDQ	2021-02-09 17:31:58.064971+01
7irxcupnmqxcreil2wwgsda1s1iwktrw	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1l6IpK:xju0xahK_8JwixKIPMnMJ28wgAP-iqCniYkK-XrW828	2021-02-14 20:56:06.056248+01
8o8fc01hsycjou5ryp2cig3wh2tonk28	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1l7jd0:1qCeXzeNIxxI-79x8_bCrhkgSpTaO87ytw25S4CZ1lY	2021-02-18 19:45:18.321712+01
s5qxynaqys7ierdk6zhgulzw5p42yss5	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1kvPOk:mBhrJbR_Roshf6cIcMmrChFPyyPjOI353hj-xPoeGo4	2021-01-15 19:43:38.724016+01
2qlej640mo93tizavv8fgfmq5e9id1zl	.eJxVjMsOwiAQRf-FtSFQ3i7d-w1kYAapGkhKuzL-uzbpQrf3nHNfLMK21rgNWuKM7MwsO_1uCfKD2g7wDu3Wee5tXebEd4UfdPBrR3peDvfvoMKo31pYFNoJD8Ubj-hRCHLSGCpkFHkAq4MsaTITgc3ByFQ0ggpBK12ccOz9AeCFN7U:1l5u4g:6phJTIyFrLOC8hLqD9AoyxHsYyVT6MoUgRjCWO-k5gM	2021-02-13 18:30:18.873127+01
umfsvi9imppnckbp32z1ie7feuwdjzoe	.eJxVjMsOwiAURP-FtSFcebt07zeQCxekaiAp7cr477ZJF7qcOWfmzQKuSw3ryHOYiF0YsNNvFzE9c9sBPbDdO0-9LfMU-a7wgw5-65Rf18P9O6g46rYuPkpffDZkTJEOkhMkNYFCi9r5LZdIRiFlQQa8tdKRyoBJg9BnF9nnC-1iN-c:1l7z01:2GrE3TN3DRTK1qHhbRyzOdJOJXYaf1-SiY_opuL5-b8	2021-02-19 12:10:05.323798+01
dvhypp5bl170kl47j4kq7qh23cmri7c5	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1kvith:HNCX3Dd9zmozN00-8Pm6X09IPVtE3F5J60ozHADrj-Y	2021-01-16 16:32:53.377022+01
bqu7jvp8vv1xsy1g4434e6qzyfe8fg15	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1l4RHM:qF-IfIslG99r1NTbbJsXD1HzBvjCr5fAEPASELb_n6A	2021-02-09 17:33:20.110361+01
1na865q0e4q1jwisfuv8ek67kdyouei4	.eJxVjEEOwiAQRe_C2pAyyAAu3fcMhIFBqoYmpV0Z765NutDtf-_9lwhxW2vYOi9hyuIitDj9bhTTg9sO8j222yzT3NZlIrkr8qBdjnPm5_Vw_w5q7PVbk9OaExltbELiclaskwVXEEA5QG2ACDgNqoDyzns1WM4Z0VhPiFG8P9p6N08:1l5u79:WSIiKbMEj_Zssme32ayIg4VqCTwVCfW8tgNTIoFVjow	2021-02-13 18:32:51.699528+01
8i93f59plgaxix2djdaoyhhenbmv3uka	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1kvj6M:25ohIHIkcouYn4m6mBusZC8RdUDBzGp4feJRIkAKJig	2021-01-16 16:45:58.380869+01
dlv6mniccfs0i8yskl145dfiv5bzpfgm	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1l84ox:yqHVfktjeV8fOVQXBUWcrj8ixOWvVzlMzFaVkgbmE_g	2021-02-19 18:23:03.460997+01
8ss5546pw4v77dqht5buecgkctlg9kh4	.eJxVjEEOwiAQRe_C2pAyyAAu3fcMhIFBqoYmpV0Z765NutDtf-_9lwhxW2vYOi9hyuIitDj9bhTTg9sO8j222yzT3NZlIrkr8qBdjnPm5_Vw_w5q7PVbk9OaExltbELiclaskwVXEEA5QG2ACDgNqoDyzns1WM4Z0VhPiFG8P9p6N08:1l5uKB:Mmvx58Q1T0bxEOPz2OkmC2sfl9ouf5vwaZFHLdZrKHE	2021-02-13 18:46:19.99684+01
gp9wvwu4bv0o4rfkgqyzdpru8ob4c0di	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1kvjs4:_34w2eXQlum3TCfWsMyeEe9mibr5C4OQpGF-dr-MWGQ	2021-01-16 17:35:16.977191+01
5e39t5355669vu4d2gqtyj2jo9u3ygk3	.eJxVjMsOwiAURP-FtSFcebt07zeQCxekaiAp7cr477ZJF7qcOWfmzQKuSw3ryHOYiF0YsNNvFzE9c9sBPbDdO0-9LfMU-a7wgw5-65Rf18P9O6g46rYuPkpffDZkTJEOkhMkNYFCi9r5LZdIRiFlQQa8tdKRyoBJg9BnF9nnC-1iN-c:1l9C7c:k3QV6S9HtpdTTBNQrVkyDUcYtt4jHnunmxcmlZAxMZs	2021-02-22 20:22:56.236875+01
3gl0opnyzgj4u13lwjhzkson2oknivpm	.eJxVjMsOwiAQRf-FtSFQ3i7d-w1kYAapGkhKuzL-uzbpQrf3nHNfLMK21rgNWuKM7MwsO_1uCfKD2g7wDu3Wee5tXebEd4UfdPBrR3peDvfvoMKo31pYFNoJD8Ubj-hRCHLSGCpkFHkAq4MsaTITgc3ByFQ0ggpBK12ccOz9AeCFN7U:1l6XuN:7MhOwB0vlS5V8-P7YmqJ2Vr4jnCZ9BCNXHZa_AoNHZI	2021-02-15 13:02:19.887467+01
v3rkzyue4fi0ydpph5j2wgwg3sajr1nu	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1kvjzB:8CO_fFXqajiO-_dbPD1Vl1xa_J6hPAEr8nB-TFU0CCY	2021-01-16 17:42:37.85804+01
top359rovb18er6f0qwg2xaese999kui	.eJxVjDsOwjAQBe_iGln-ZrOU9JzB8nptHECOFCcV4u4QKQW0b2beS4S4rTVsPS9hYnEWxorT70gxPXLbCd9ju80yzW1dJpK7Ig_a5XXm_Lwc7t9Bjb1-a0xgypARVCGvvGM2GIEZiyvFoi7egs4Eg0NAIqsVcwJH0dnRjWjF-wMQcDf7:1l5Skq:7-hX6on-OHv_1wo_SfCmHDkoQRHY6qVpRmoqKR7Fg-g	2021-02-12 13:20:00.34174+01
0n1w6wu3sud8n6n5qf69toqbbrgaj6hd	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1kvmqT:z14EEJAlv-VGOIpmw8nYKjHFp-Fo2Xy_bHjBrzMsO7w	2021-01-16 20:45:49.673557+01
lnxqz1mizcss99hq2dih3vjmcho6p10n	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1kvnG7:zfex3di3PcJl2jHs1_JXx5rZSZ-ot5uxIIxbz7RIRns	2021-01-16 21:12:19.540114+01
cp9dag1fkhrqwuuaowppujdhgcbiud9q	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1kw80d:DY8cppn77EWqTQhaglYF60G3CQ3PHYdlw9tEziMQ5YQ	2021-01-17 19:21:43.703621+01
8d4kyalxuevut67wvhqp33iy62y7vz5t	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1kwZxz:MR0Fe67dUYAKfkFc3NuM1a2vY3jl988-gBurOIPEv2k	2021-01-19 01:12:51.487836+01
8e9te320b5jo7z4ysmn0a6xyex5hs57p	.eJxVjDsOwyAQRO9CHSFgkQ0p0-cMaNldgpMIS_5UVu4eW3KRdKN5b2ZTCdelpnWWKQ2srsoHdfktM9JL2kH4ie0xahrbMg1ZH4o-6azvI8v7drp_BxXnuq9j5uwtmEIYLBBwjMKSu046JiRn-2KKp9xjLwTOQTRgLFhHgfcE6vMFMRs4TQ:1l6aNZ:vsa1rHMFnb67yrySexCBtJM90pvVA6fDUVxxtj_srXM	2021-02-15 15:40:37.572231+01
pc951mbkk007ewgh1jxx33eto74soumu	.eJxVjDsOwjAQBe_iGllZe_0JJT1nsHb9wQHkSHFSIe4OkVJA-2bmvUSgba1h63kJUxJnocTpd2OKj9x2kO7UbrOMc1uXieWuyIN2eZ1Tfl4O9--gUq_fejScikbF2kGyEMEr4KIz6IEcKERC75Uz5Eok40sx6AdrmLJlHB2K9wfM4TdB:1kwdNG:_0bXSVGSaeOXTKPqzbO3kzP02_-c6nCFUSztKT4kA8Q	2021-01-19 04:51:10.168537+01
\.


--
-- TOC entry 3681 (class 0 OID 35163)
-- Dependencies: 224
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- TOC entry 4076 (class 0 OID 0)
-- Dependencies: 205
-- Name: accounts_account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

SELECT pg_catalog.setval('public.accounts_account_id_seq', 55, true);


--
-- TOC entry 4077 (class 0 OID 0)
-- Dependencies: 207
-- Name: accounts_article_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

SELECT pg_catalog.setval('public.accounts_article_id_seq', 11, true);


--
-- TOC entry 4078 (class 0 OID 0)
-- Dependencies: 249
-- Name: accounts_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

SELECT pg_catalog.setval('public.accounts_author_id_seq', 1, false);


--
-- TOC entry 4079 (class 0 OID 0)
-- Dependencies: 251
-- Name: accounts_blog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

SELECT pg_catalog.setval('public.accounts_blog_id_seq', 1, false);


--
-- TOC entry 4080 (class 0 OID 0)
-- Dependencies: 219
-- Name: accounts_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

SELECT pg_catalog.setval('public.accounts_comment_id_seq', 169, true);


--
-- TOC entry 4081 (class 0 OID 0)
-- Dependencies: 221
-- Name: accounts_coworker_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

SELECT pg_catalog.setval('public.accounts_coworker_id_seq', 4, true);


--
-- TOC entry 4082 (class 0 OID 0)
-- Dependencies: 255
-- Name: accounts_entry_authors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

SELECT pg_catalog.setval('public.accounts_entry_authors_id_seq', 1, false);


--
-- TOC entry 4083 (class 0 OID 0)
-- Dependencies: 253
-- Name: accounts_entry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

SELECT pg_catalog.setval('public.accounts_entry_id_seq', 1, false);


--
-- TOC entry 4084 (class 0 OID 0)
-- Dependencies: 215
-- Name: accounts_food_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

SELECT pg_catalog.setval('public.accounts_food_id_seq', 100, true);


--
-- TOC entry 4085 (class 0 OID 0)
-- Dependencies: 217
-- Name: accounts_food_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

SELECT pg_catalog.setval('public.accounts_food_tags_id_seq', 110, true);


--
-- TOC entry 4086 (class 0 OID 0)
-- Dependencies: 261
-- Name: accounts_friendlist_friends_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

SELECT pg_catalog.setval('public.accounts_friendlist_friends_id_seq', 9, true);


--
-- TOC entry 4087 (class 0 OID 0)
-- Dependencies: 259
-- Name: accounts_friendlist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

SELECT pg_catalog.setval('public.accounts_friendlist_id_seq', 6, true);


--
-- TOC entry 4088 (class 0 OID 0)
-- Dependencies: 257
-- Name: accounts_friendrequest_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

SELECT pg_catalog.setval('public.accounts_friendrequest_id_seq', 1, false);


--
-- TOC entry 4089 (class 0 OID 0)
-- Dependencies: 267
-- Name: accounts_ingredient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

SELECT pg_catalog.setval('public.accounts_ingredient_id_seq', 14, true);


--
-- TOC entry 4090 (class 0 OID 0)
-- Dependencies: 271
-- Name: accounts_ingredientvalue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

SELECT pg_catalog.setval('public.accounts_ingredientvalue_id_seq', 20, true);


--
-- TOC entry 4091 (class 0 OID 0)
-- Dependencies: 265
-- Name: accounts_rd_update_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

SELECT pg_catalog.setval('public.accounts_rd_update_id_seq', 6, true);


--
-- TOC entry 4092 (class 0 OID 0)
-- Dependencies: 269
-- Name: accounts_recipe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

SELECT pg_catalog.setval('public.accounts_recipe_id_seq', 2, true);


--
-- TOC entry 4093 (class 0 OID 0)
-- Dependencies: 273
-- Name: accounts_recipe_ingredients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

SELECT pg_catalog.setval('public.accounts_recipe_ingredients_id_seq', 15, true);


--
-- TOC entry 4094 (class 0 OID 0)
-- Dependencies: 211
-- Name: accounts_restaurant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

SELECT pg_catalog.setval('public.accounts_restaurant_id_seq', 14, true);


--
-- TOC entry 4095 (class 0 OID 0)
-- Dependencies: 263
-- Name: accounts_restaurant_likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

SELECT pg_catalog.setval('public.accounts_restaurant_likes_id_seq', 186, true);


--
-- TOC entry 4096 (class 0 OID 0)
-- Dependencies: 213
-- Name: accounts_restaurant_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

SELECT pg_catalog.setval('public.accounts_restaurant_tags_id_seq', 26, true);


--
-- TOC entry 4097 (class 0 OID 0)
-- Dependencies: 209
-- Name: accounts_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

SELECT pg_catalog.setval('public.accounts_tag_id_seq', 29, true);


--
-- TOC entry 4098 (class 0 OID 0)
-- Dependencies: 244
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- TOC entry 4099 (class 0 OID 0)
-- Dependencies: 246
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 4100 (class 0 OID 0)
-- Dependencies: 242
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 108, true);


--
-- TOC entry 4101 (class 0 OID 0)
-- Dependencies: 240
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 684, true);


--
-- TOC entry 4102 (class 0 OID 0)
-- Dependencies: 238
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 26, true);


--
-- TOC entry 4103 (class 0 OID 0)
-- Dependencies: 203
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 120, true);


--
-- TOC entry 3716 (class 2606 OID 34709)
-- Name: accounts_account accounts_account_email_key; Type: CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_account
    ADD CONSTRAINT accounts_account_email_key UNIQUE (email);


--
-- TOC entry 3718 (class 2606 OID 34707)
-- Name: accounts_account accounts_account_pkey; Type: CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_account
    ADD CONSTRAINT accounts_account_pkey PRIMARY KEY (id);


--
-- TOC entry 3720 (class 2606 OID 34720)
-- Name: accounts_article accounts_article_pkey; Type: CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_article
    ADD CONSTRAINT accounts_article_pkey PRIMARY KEY (id);


--
-- TOC entry 3778 (class 2606 OID 36615)
-- Name: accounts_author accounts_author_pkey; Type: CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_author
    ADD CONSTRAINT accounts_author_pkey PRIMARY KEY (id);


--
-- TOC entry 3780 (class 2606 OID 36623)
-- Name: accounts_blog accounts_blog_pkey; Type: CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_blog
    ADD CONSTRAINT accounts_blog_pkey PRIMARY KEY (id);


--
-- TOC entry 3743 (class 2606 OID 34777)
-- Name: accounts_comment accounts_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_comment
    ADD CONSTRAINT accounts_comment_pkey PRIMARY KEY (id);


--
-- TOC entry 3746 (class 2606 OID 34835)
-- Name: accounts_coworker accounts_coworker_pkey; Type: CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_coworker
    ADD CONSTRAINT accounts_coworker_pkey PRIMARY KEY (id);


--
-- TOC entry 3788 (class 2606 OID 36651)
-- Name: accounts_entry_authors accounts_entry_authors_entry_id_author_id_7a2f3142_uniq; Type: CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_entry_authors
    ADD CONSTRAINT accounts_entry_authors_entry_id_author_id_7a2f3142_uniq UNIQUE (entry_id, author_id);


--
-- TOC entry 3790 (class 2606 OID 36642)
-- Name: accounts_entry_authors accounts_entry_authors_pkey; Type: CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_entry_authors
    ADD CONSTRAINT accounts_entry_authors_pkey PRIMARY KEY (id);


--
-- TOC entry 3783 (class 2606 OID 36634)
-- Name: accounts_entry accounts_entry_pkey; Type: CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_entry
    ADD CONSTRAINT accounts_entry_pkey PRIMARY KEY (id);


--
-- TOC entry 3733 (class 2606 OID 34758)
-- Name: accounts_food accounts_food_pkey; Type: CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_food
    ADD CONSTRAINT accounts_food_pkey PRIMARY KEY (id);


--
-- TOC entry 3737 (class 2606 OID 34800)
-- Name: accounts_food_tags accounts_food_tags_food_id_tag_id_fd62fcb7_uniq; Type: CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_food_tags
    ADD CONSTRAINT accounts_food_tags_food_id_tag_id_fd62fcb7_uniq UNIQUE (food_id, tag_id);


--
-- TOC entry 3739 (class 2606 OID 34766)
-- Name: accounts_food_tags accounts_food_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_food_tags
    ADD CONSTRAINT accounts_food_tags_pkey PRIMARY KEY (id);


--
-- TOC entry 3800 (class 2606 OID 36983)
-- Name: accounts_friendlist_friends accounts_friendlist_frie_friendlist_id_account_id_aad8970e_uniq; Type: CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_friendlist_friends
    ADD CONSTRAINT accounts_friendlist_frie_friendlist_id_account_id_aad8970e_uniq UNIQUE (friendlist_id, account_id);


--
-- TOC entry 3804 (class 2606 OID 36964)
-- Name: accounts_friendlist_friends accounts_friendlist_friends_pkey; Type: CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_friendlist_friends
    ADD CONSTRAINT accounts_friendlist_friends_pkey PRIMARY KEY (id);


--
-- TOC entry 3796 (class 2606 OID 36954)
-- Name: accounts_friendlist accounts_friendlist_pkey; Type: CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_friendlist
    ADD CONSTRAINT accounts_friendlist_pkey PRIMARY KEY (id);


--
-- TOC entry 3798 (class 2606 OID 36956)
-- Name: accounts_friendlist accounts_friendlist_user_id_key; Type: CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_friendlist
    ADD CONSTRAINT accounts_friendlist_user_id_key UNIQUE (user_id);


--
-- TOC entry 3792 (class 2606 OID 36946)
-- Name: accounts_friendrequest accounts_friendrequest_pkey; Type: CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_friendrequest
    ADD CONSTRAINT accounts_friendrequest_pkey PRIMARY KEY (id);


--
-- TOC entry 3814 (class 2606 OID 43570)
-- Name: accounts_ingredient accounts_ingredient_pkey; Type: CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_ingredient
    ADD CONSTRAINT accounts_ingredient_pkey PRIMARY KEY (id);


--
-- TOC entry 3819 (class 2606 OID 43669)
-- Name: accounts_ingredientvalue accounts_ingredientvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_ingredientvalue
    ADD CONSTRAINT accounts_ingredientvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 3812 (class 2606 OID 43450)
-- Name: accounts_rd_update accounts_rd_update_pkey; Type: CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_rd_update
    ADD CONSTRAINT accounts_rd_update_pkey PRIMARY KEY (id);


--
-- TOC entry 3821 (class 2606 OID 43685)
-- Name: accounts_recipe_ingredients accounts_recipe_ingredie_recipe_id_ingredientvalu_61b386d8_uniq; Type: CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_recipe_ingredients
    ADD CONSTRAINT accounts_recipe_ingredie_recipe_id_ingredientvalu_61b386d8_uniq UNIQUE (recipe_id, ingredientvalue_id);


--
-- TOC entry 3824 (class 2606 OID 43677)
-- Name: accounts_recipe_ingredients accounts_recipe_ingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_recipe_ingredients
    ADD CONSTRAINT accounts_recipe_ingredients_pkey PRIMARY KEY (id);


--
-- TOC entry 3816 (class 2606 OID 43607)
-- Name: accounts_recipe accounts_recipe_pkey; Type: CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_recipe
    ADD CONSTRAINT accounts_recipe_pkey PRIMARY KEY (id);


--
-- TOC entry 3806 (class 2606 OID 43430)
-- Name: accounts_restaurant_likes accounts_restaurant_like_restaurant_id_account_id_c5f0e1d8_uniq; Type: CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_restaurant_likes
    ADD CONSTRAINT accounts_restaurant_like_restaurant_id_account_id_c5f0e1d8_uniq UNIQUE (restaurant_id, account_id);


--
-- TOC entry 3809 (class 2606 OID 43428)
-- Name: accounts_restaurant_likes accounts_restaurant_likes_pkey; Type: CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_restaurant_likes
    ADD CONSTRAINT accounts_restaurant_likes_pkey PRIMARY KEY (id);


--
-- TOC entry 3725 (class 2606 OID 34739)
-- Name: accounts_restaurant accounts_restaurant_pkey; Type: CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_restaurant
    ADD CONSTRAINT accounts_restaurant_pkey PRIMARY KEY (id);


--
-- TOC entry 3727 (class 2606 OID 34747)
-- Name: accounts_restaurant_tags accounts_restaurant_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_restaurant_tags
    ADD CONSTRAINT accounts_restaurant_tags_pkey PRIMARY KEY (id);


--
-- TOC entry 3730 (class 2606 OID 34780)
-- Name: accounts_restaurant_tags accounts_restaurant_tags_restaurant_id_tag_id_91ce4eb4_uniq; Type: CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_restaurant_tags
    ADD CONSTRAINT accounts_restaurant_tags_restaurant_id_tag_id_91ce4eb4_uniq UNIQUE (restaurant_id, tag_id);


--
-- TOC entry 3723 (class 2606 OID 34728)
-- Name: accounts_tag accounts_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_tag
    ADD CONSTRAINT accounts_tag_pkey PRIMARY KEY (id);


--
-- TOC entry 3764 (class 2606 OID 36524)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 3769 (class 2606 OID 36510)
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 3772 (class 2606 OID 36499)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3766 (class 2606 OID 36489)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 3759 (class 2606 OID 36501)
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 3761 (class 2606 OID 36481)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 3755 (class 2606 OID 36461)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 3750 (class 2606 OID 36449)
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 3752 (class 2606 OID 36447)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 3713 (class 2606 OID 34696)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3775 (class 2606 OID 36533)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 3714 (class 1259 OID 34778)
-- Name: accounts_account_email_348850e2_like; Type: INDEX; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE INDEX accounts_account_email_348850e2_like ON public.accounts_account USING btree (email varchar_pattern_ops);


--
-- TOC entry 3721 (class 1259 OID 43623)
-- Name: accounts_article_recipe_id_fba4e9c0; Type: INDEX; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE INDEX accounts_article_recipe_id_fba4e9c0 ON public.accounts_article USING btree (recipe_id);


--
-- TOC entry 3741 (class 1259 OID 34823)
-- Name: accounts_comment_account_id_849c395e; Type: INDEX; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE INDEX accounts_comment_account_id_849c395e ON public.accounts_comment USING btree (account_id);


--
-- TOC entry 3744 (class 1259 OID 34824)
-- Name: accounts_comment_restaurant_id_6036e8c0; Type: INDEX; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE INDEX accounts_comment_restaurant_id_6036e8c0 ON public.accounts_comment USING btree (restaurant_id);


--
-- TOC entry 3785 (class 1259 OID 36663)
-- Name: accounts_entry_authors_author_id_9c601684; Type: INDEX; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE INDEX accounts_entry_authors_author_id_9c601684 ON public.accounts_entry_authors USING btree (author_id);


--
-- TOC entry 3786 (class 1259 OID 36662)
-- Name: accounts_entry_authors_entry_id_a15a58ee; Type: INDEX; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE INDEX accounts_entry_authors_entry_id_a15a58ee ON public.accounts_entry_authors USING btree (entry_id);


--
-- TOC entry 3781 (class 1259 OID 36649)
-- Name: accounts_entry_blog_id_a5dc3774; Type: INDEX; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE INDEX accounts_entry_blog_id_a5dc3774 ON public.accounts_entry USING btree (blog_id);


--
-- TOC entry 3784 (class 1259 OID 36648)
-- Name: accounts_entry_point_id; Type: INDEX; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE INDEX accounts_entry_point_id ON public.accounts_entry USING gist (point);


--
-- TOC entry 3734 (class 1259 OID 34798)
-- Name: accounts_food_restaurant_id_1df0c6ed; Type: INDEX; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE INDEX accounts_food_restaurant_id_1df0c6ed ON public.accounts_food USING btree (restaurant_id);


--
-- TOC entry 3735 (class 1259 OID 34811)
-- Name: accounts_food_tags_food_id_bb793960; Type: INDEX; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE INDEX accounts_food_tags_food_id_bb793960 ON public.accounts_food_tags USING btree (food_id);


--
-- TOC entry 3740 (class 1259 OID 34812)
-- Name: accounts_food_tags_tag_id_cdc0f328; Type: INDEX; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE INDEX accounts_food_tags_tag_id_cdc0f328 ON public.accounts_food_tags USING btree (tag_id);


--
-- TOC entry 3801 (class 1259 OID 36995)
-- Name: accounts_friendlist_friends_account_id_6d8eb886; Type: INDEX; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE INDEX accounts_friendlist_friends_account_id_6d8eb886 ON public.accounts_friendlist_friends USING btree (account_id);


--
-- TOC entry 3802 (class 1259 OID 36994)
-- Name: accounts_friendlist_friends_friendlist_id_0b502a98; Type: INDEX; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE INDEX accounts_friendlist_friends_friendlist_id_0b502a98 ON public.accounts_friendlist_friends USING btree (friendlist_id);


--
-- TOC entry 3793 (class 1259 OID 36975)
-- Name: accounts_friendrequest_receiver_id_00d3c194; Type: INDEX; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE INDEX accounts_friendrequest_receiver_id_00d3c194 ON public.accounts_friendrequest USING btree (receiver_id);


--
-- TOC entry 3794 (class 1259 OID 36976)
-- Name: accounts_friendrequest_sender_id_487101ba; Type: INDEX; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE INDEX accounts_friendrequest_sender_id_487101ba ON public.accounts_friendrequest USING btree (sender_id);


--
-- TOC entry 3817 (class 1259 OID 43683)
-- Name: accounts_ingredientvalue_ingredient_id_b895bd90; Type: INDEX; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE INDEX accounts_ingredientvalue_ingredient_id_b895bd90 ON public.accounts_ingredientvalue USING btree (ingredient_id);


--
-- TOC entry 3822 (class 1259 OID 43697)
-- Name: accounts_recipe_ingredients_ingredientvalue_id_f5ff15f2; Type: INDEX; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE INDEX accounts_recipe_ingredients_ingredientvalue_id_f5ff15f2 ON public.accounts_recipe_ingredients USING btree (ingredientvalue_id);


--
-- TOC entry 3825 (class 1259 OID 43696)
-- Name: accounts_recipe_ingredients_recipe_id_651c8b1b; Type: INDEX; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE INDEX accounts_recipe_ingredients_recipe_id_651c8b1b ON public.accounts_recipe_ingredients USING btree (recipe_id);


--
-- TOC entry 3807 (class 1259 OID 43442)
-- Name: accounts_restaurant_likes_account_id_4a53a6b4; Type: INDEX; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE INDEX accounts_restaurant_likes_account_id_4a53a6b4 ON public.accounts_restaurant_likes USING btree (account_id);


--
-- TOC entry 3810 (class 1259 OID 43441)
-- Name: accounts_restaurant_likes_restaurant_id_14e56f00; Type: INDEX; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE INDEX accounts_restaurant_likes_restaurant_id_14e56f00 ON public.accounts_restaurant_likes USING btree (restaurant_id);


--
-- TOC entry 3728 (class 1259 OID 34791)
-- Name: accounts_restaurant_tags_restaurant_id_219c1b01; Type: INDEX; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE INDEX accounts_restaurant_tags_restaurant_id_219c1b01 ON public.accounts_restaurant_tags USING btree (restaurant_id);


--
-- TOC entry 3731 (class 1259 OID 34792)
-- Name: accounts_restaurant_tags_tag_id_a04c3cc0; Type: INDEX; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE INDEX accounts_restaurant_tags_tag_id_a04c3cc0 ON public.accounts_restaurant_tags USING btree (tag_id);


--
-- TOC entry 3762 (class 1259 OID 36525)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 3767 (class 1259 OID 36521)
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- TOC entry 3770 (class 1259 OID 36522)
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- TOC entry 3757 (class 1259 OID 36507)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- TOC entry 3753 (class 1259 OID 36472)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- TOC entry 3756 (class 1259 OID 36473)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- TOC entry 3773 (class 1259 OID 36535)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- TOC entry 3776 (class 1259 OID 36534)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 3826 (class 2606 OID 43618)
-- Name: accounts_article accounts_article_recipe_id_fba4e9c0_fk_accounts_recipe_id; Type: FK CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_article
    ADD CONSTRAINT accounts_article_recipe_id_fba4e9c0_fk_accounts_recipe_id FOREIGN KEY (recipe_id) REFERENCES public.accounts_recipe(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3832 (class 2606 OID 51248)
-- Name: accounts_comment accounts_comment_account_id_849c395e_fk_accounts_account_id; Type: FK CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_comment
    ADD CONSTRAINT accounts_comment_account_id_849c395e_fk_accounts_account_id FOREIGN KEY (account_id) REFERENCES public.accounts_account(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3833 (class 2606 OID 51253)
-- Name: accounts_comment accounts_comment_restaurant_id_6036e8c0_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_comment
    ADD CONSTRAINT accounts_comment_restaurant_id_6036e8c0_fk_accounts_ FOREIGN KEY (restaurant_id) REFERENCES public.accounts_restaurant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3841 (class 2606 OID 36657)
-- Name: accounts_entry_authors accounts_entry_authors_author_id_9c601684_fk_accounts_author_id; Type: FK CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_entry_authors
    ADD CONSTRAINT accounts_entry_authors_author_id_9c601684_fk_accounts_author_id FOREIGN KEY (author_id) REFERENCES public.accounts_author(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3840 (class 2606 OID 36652)
-- Name: accounts_entry_authors accounts_entry_authors_entry_id_a15a58ee_fk_accounts_entry_id; Type: FK CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_entry_authors
    ADD CONSTRAINT accounts_entry_authors_entry_id_a15a58ee_fk_accounts_entry_id FOREIGN KEY (entry_id) REFERENCES public.accounts_entry(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3839 (class 2606 OID 36643)
-- Name: accounts_entry accounts_entry_blog_id_a5dc3774_fk_accounts_blog_id; Type: FK CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_entry
    ADD CONSTRAINT accounts_entry_blog_id_a5dc3774_fk_accounts_blog_id FOREIGN KEY (blog_id) REFERENCES public.accounts_blog(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3829 (class 2606 OID 51243)
-- Name: accounts_food accounts_food_restaurant_id_1df0c6ed_fk_accounts_restaurant_id; Type: FK CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_food
    ADD CONSTRAINT accounts_food_restaurant_id_1df0c6ed_fk_accounts_restaurant_id FOREIGN KEY (restaurant_id) REFERENCES public.accounts_restaurant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3830 (class 2606 OID 34801)
-- Name: accounts_food_tags accounts_food_tags_food_id_bb793960_fk_accounts_food_id; Type: FK CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_food_tags
    ADD CONSTRAINT accounts_food_tags_food_id_bb793960_fk_accounts_food_id FOREIGN KEY (food_id) REFERENCES public.accounts_food(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3831 (class 2606 OID 34806)
-- Name: accounts_food_tags accounts_food_tags_tag_id_cdc0f328_fk_accounts_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_food_tags
    ADD CONSTRAINT accounts_food_tags_tag_id_cdc0f328_fk_accounts_tag_id FOREIGN KEY (tag_id) REFERENCES public.accounts_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3846 (class 2606 OID 36989)
-- Name: accounts_friendlist_friends accounts_friendlist__account_id_6d8eb886_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_friendlist_friends
    ADD CONSTRAINT accounts_friendlist__account_id_6d8eb886_fk_accounts_ FOREIGN KEY (account_id) REFERENCES public.accounts_account(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3845 (class 2606 OID 36984)
-- Name: accounts_friendlist_friends accounts_friendlist__friendlist_id_0b502a98_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_friendlist_friends
    ADD CONSTRAINT accounts_friendlist__friendlist_id_0b502a98_fk_accounts_ FOREIGN KEY (friendlist_id) REFERENCES public.accounts_friendlist(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3844 (class 2606 OID 36977)
-- Name: accounts_friendlist accounts_friendlist_user_id_10ac0d6b_fk_accounts_account_id; Type: FK CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_friendlist
    ADD CONSTRAINT accounts_friendlist_user_id_10ac0d6b_fk_accounts_account_id FOREIGN KEY (user_id) REFERENCES public.accounts_account(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3842 (class 2606 OID 36965)
-- Name: accounts_friendrequest accounts_friendreque_receiver_id_00d3c194_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_friendrequest
    ADD CONSTRAINT accounts_friendreque_receiver_id_00d3c194_fk_accounts_ FOREIGN KEY (receiver_id) REFERENCES public.accounts_account(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3843 (class 2606 OID 36970)
-- Name: accounts_friendrequest accounts_friendreque_sender_id_487101ba_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_friendrequest
    ADD CONSTRAINT accounts_friendreque_sender_id_487101ba_fk_accounts_ FOREIGN KEY (sender_id) REFERENCES public.accounts_account(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3849 (class 2606 OID 43678)
-- Name: accounts_ingredientvalue accounts_ingredientv_ingredient_id_b895bd90_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_ingredientvalue
    ADD CONSTRAINT accounts_ingredientv_ingredient_id_b895bd90_fk_accounts_ FOREIGN KEY (ingredient_id) REFERENCES public.accounts_ingredient(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3851 (class 2606 OID 43691)
-- Name: accounts_recipe_ingredients accounts_recipe_ingr_ingredientvalue_id_f5ff15f2_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_recipe_ingredients
    ADD CONSTRAINT accounts_recipe_ingr_ingredientvalue_id_f5ff15f2_fk_accounts_ FOREIGN KEY (ingredientvalue_id) REFERENCES public.accounts_ingredientvalue(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3850 (class 2606 OID 43686)
-- Name: accounts_recipe_ingredients accounts_recipe_ingr_recipe_id_651c8b1b_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_recipe_ingredients
    ADD CONSTRAINT accounts_recipe_ingr_recipe_id_651c8b1b_fk_accounts_ FOREIGN KEY (recipe_id) REFERENCES public.accounts_recipe(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3847 (class 2606 OID 43472)
-- Name: accounts_restaurant_likes accounts_restaurant__account_id_4a53a6b4_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_restaurant_likes
    ADD CONSTRAINT accounts_restaurant__account_id_4a53a6b4_fk_accounts_ FOREIGN KEY (account_id) REFERENCES public.accounts_account(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3848 (class 2606 OID 43477)
-- Name: accounts_restaurant_likes accounts_restaurant__restaurant_id_14e56f00_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_restaurant_likes
    ADD CONSTRAINT accounts_restaurant__restaurant_id_14e56f00_fk_accounts_ FOREIGN KEY (restaurant_id) REFERENCES public.accounts_restaurant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3827 (class 2606 OID 34781)
-- Name: accounts_restaurant_tags accounts_restaurant__restaurant_id_219c1b01_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_restaurant_tags
    ADD CONSTRAINT accounts_restaurant__restaurant_id_219c1b01_fk_accounts_ FOREIGN KEY (restaurant_id) REFERENCES public.accounts_restaurant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3828 (class 2606 OID 34786)
-- Name: accounts_restaurant_tags accounts_restaurant_tags_tag_id_a04c3cc0_fk_accounts_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.accounts_restaurant_tags
    ADD CONSTRAINT accounts_restaurant_tags_tag_id_a04c3cc0_fk_accounts_tag_id FOREIGN KEY (tag_id) REFERENCES public.accounts_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3838 (class 2606 OID 36516)
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3837 (class 2606 OID 36511)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3836 (class 2606 OID 36502)
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3834 (class 2606 OID 36462)
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3835 (class 2606 OID 36467)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_accounts_account_id; Type: FK CONSTRAINT; Schema: public; Owner: hsa_2020ws_pyweb_plantyoptions
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_accounts_account_id FOREIGN KEY (user_id) REFERENCES public.accounts_account(id) DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2021-12-16 17:35:57 CET

--
-- PostgreSQL database dump complete
--

