--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
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
-- Name: main_project; Type: TABLE; Schema: public; Owner: rodo; Tablespace: 
--

CREATE TABLE main_project (
    id integer NOT NULL,
    name character varying(31) NOT NULL,
    sidebar_image character varying(100) NOT NULL,
    large_image character varying(100) NOT NULL,
    content_html text NOT NULL,
    "order" smallint NOT NULL,
    slug character varying(50) NOT NULL,
    CONSTRAINT main_project_order_check CHECK (("order" >= 0))
);


ALTER TABLE public.main_project OWNER TO rodo;

--
-- Name: main_project_id_seq; Type: SEQUENCE; Schema: public; Owner: rodo
--

CREATE SEQUENCE main_project_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_project_id_seq OWNER TO rodo;

--
-- Name: main_project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rodo
--

ALTER SEQUENCE main_project_id_seq OWNED BY main_project.id;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: rodo
--

ALTER TABLE ONLY main_project ALTER COLUMN id SET DEFAULT nextval('main_project_id_seq'::regclass);


--
-- Data for Name: main_project; Type: TABLE DATA; Schema: public; Owner: main_project
--

COPY main_project (id, name, sidebar_image, large_image, content_html, "order", slug) FROM stdin;
3	Kravitz	projects/sidebar/kravitz_small.png	projects/large/kravitz_large.png	<p>\r\n<b>KR4VITZ</b> is a new streamer and potentially a YouTuber from Germany who was looking for some well made designs for his Twitch page and YouTube page as well. He is a beast infantry player in Battlefield 3 and definitely will gain a large audience in the next Battlefield titles. His logo came out in a subtraction method applying his initial letter to a rounded box.\r\n</p>\r\n\r\n<p>\r\nYou can check his logo applied to all his pages following the links below:\r\n</p>\r\n<div class="social-icons">\r\n<a target="_blank" href="http://www.twitch.tv/kravitz7/old"><img src="/static/img/twitch.png" title="Twitch.TV"></a>\r\n<a target="_blank" href="http://www.youtube.com/kr4vitz"><img src="/static/img/youtube.png" title="YouTube"></a>\r\n<a target="_blank" href="https://www.facebook.com/Kr4vitz"><img src="/static/img/facebook.png" title="Facebook"></a>\r\n<a target="_blank" href="https://twitter.com/kr4vitz"><img src="/static/img/twitter.png" title="Facebook"></a>\r\n</div>	3	kravitz
11	honorBR	projects/sidebar/honor2_1.png	projects/large/honor.png	<p>\r\n<b>HonorBR</b> is a brazilian BF4 clan.\r\n</p>\r\n\r\n<p>\r\nYou can check their logo applied to all their pages following the links below:\r\n</p>\r\n<div class="social-icons">\r\n<a target="_blank" href="http://www.twitch.tv/honorbr"><img src="/static/img/twitch.png" title="Twitch.TV"></a>\r\n<a target="_blank" href="http://www.youtube.com/channel/UCXoeXfFZBQ41qjHIQrfoKdg"><img src="/static/img/youtube.png" title="YouTube"></a>\r\n<a target="_blank" href="https://www.facebook.com/HonorBRClan"><img src="/static/img/facebook.png" title="Facebook"></a>\r\n<a target="_blank" href="https://twitter.com/HonorBRClan"><img src="/static/img/twitter.png" title="Twitter"></a>\r\n</div>	9	honorbr
4	Widgitybear	projects/sidebar/widgitybear_small.png	projects/large/widgitybear_large.png	<p>\r\n<b>WidgityBear</b> is a Battlefield 3 pro pilot, who streams nearly every day and has plans to upload pro heli footage on youtube as well. A player of the community, Widgity plays for <b>LevelBF</b> in its tournaments and also plays for <b>Team Reddit</b> when they have big wars against other communities.\r\n</p>\r\n\r\n<p>\r\nYou can check his logo applied to all his pages following the links below:\r\n</p>\r\n<div class="social-icons">\r\n<a target="_blank" href="http://www.twitch.tv/widgitybear/old"><img src="/static/img/twitch.png" title="Twitch.TV"></a>\r\n<a target="_blank" href="http://www.youtube.com/user/DoucheMarnold"><img src="/static/img/youtube.png" title="YouTube"></a>\r\n<a target="_blank" href="https://twitter.com/Widgitybear" title="Twitter"></a>\r\n</div>	4	widgitybear
2	Xfactor	projects/sidebar/x2_1.png	projects/large/x.png	<p>\r\n<b>XFactor</b> is a well known YouTuber in the Battlefield 3 community. Former member of the <b>rivaL</b> clan, xfactor has a channel focused on helping new Battlefielders become better players and discussing the game inside out. He was looking to brand himself and give more identity on his youtube channel and this 3d logo came out as his new visual identity.\r\n\r\n<p>\r\nYou can check his logo applied to all his pages following the links below:\r\n</p>\r\n<div class="social-icons">\r\n<a target="_blank" href="http://www.twitch.tv/rivalxfactor/old"><img src="/static/img/twitch.png" title="Twitch.TV"></a>\r\n<a target="_blank" href="http://www.youtube.com/user/rivaLxfactor"><img src="/static/img/youtube.png" title="YouTube"></a>\r\n<a target="_blank" href="https://www.facebook.com/pages/Rivalxfactor/128213810681860?ref=stream"><img src="/static/img/facebook.png" title="Facebook"></a>\r\n<a target="_blank" href="https://twitter.com/rivaLxfactor"><img src="/static/img/twitter.png" title="Twitter"></a>\r\n</div>	2	xfactor
6	Top Ten Gamer	projects/sidebar/tt2_1.png	projects/large/tt.png	<p>\r\n<b>TopTenGamer</b> are a group of people that bring us the best reviews of gaming equipment and technologies in general. They were looking to boost their visualization by aggregating a new visual identity to their group and this 3d logo + icon came out as a result.\r\n</p>\r\n\r\n<p>\r\nYou can check his logo applied to all his pages following the links below:\r\n</p>\r\n<div class="social-icons">\r\n<a target="_blank" href="http://www.youtube.com/user/TOPT3NGAM3R"><img src="/static/img/youtube.png" title="YouTube"></a>\r\n<a target="_blank" href="https://www.facebook.com/TopTenGamer"><img src="/static/img/facebook.png" title="Facebook"></a>\r\n<a target="_blank" href="https://twitter.com/toptengamer"><img src="/static/img/twitter.png" title="Facebook"></a>\r\n</div>	6	top-ten-gamer
1	Nicz	projects/sidebar/nicz_small_1.png	projects/large/nicz_large.png	<p>\r\n<b>Nicz_DK</b> is a well known tanker in Battlefield 3. Competitive & Community player, member of <b>LevelBF</b>, <b>Team Denmark</B> and <b>VIP Gaming</b>. He was looking for a visual ID to brand himself and to promote his stream and youtube page and this logo came out as a result.\r\n</p>\r\n\r\n<p>\r\nYou can check his logo applied to all his pages following the links below:\r\n</p>\r\n<div class="social-icons">\r\n<a target="_blank" href="http://www.twitch.tv/nicz_dk/old"><img src="/static/img/twitch.png" title="Twitch.TV"></a>\r\n<a target="_blank" href="http://www.youtube.com/user/Niccc1991"><img src="/static/img/youtube.png" title="YouTube"></a>\r\n<a target="_blank" href="https://www.facebook.com/TheNiczDK"><img src="/static/img/facebook.png" title="Facebook"></a>\r\n<a target="_blank" href="https://twitter.com/nicz_dk"><img src="/static/img/twitter.png" title="Twitter"></a>\r\n</div>	1	nicz
10	BruteForceOAP	projects/sidebar/bf2.png	projects/large/bf.png	<p>\r\n<b>BruteForceOAP</b> is a 64 years old FPS player. He stream's on a regular schedule and entertain people with a imense variety of games.\r\n</p>\r\n\r\n<p>\r\nYou can check his logo applied to all his pages following the links below:\r\n</p>\r\n<div class="social-icons">\r\n<a target="_blank" href="http://www.twitch.tv/bruteforceoap"><img src="/static/img/twitch.png" title="Twitch.TV"></a>\r\n<a target="_blank" href="http://www.youtube.com/bruteforceoap"><img src="/static/img/youtube.png" title="YouTube"></a>\r\n<a target="_blank" href="https://www.facebook.com/Bruteforceoap"><img src="/static/img/facebook.png" title="Facebook"></a>\r\n<a target="_blank" href="https://twitter.com/BruteForceOAP"><img src="/static/img/twitter.png" title="Facebook"></a>\r\n</div>	7	bruteforceoap
14	gabrilos	projects/sidebar/gg2.png	projects/large/gg.png	<p>\r\n<b>GabrilosGaming</b> is a youtuber from Brazil who have a growing fan-base over the last two years. His logo consists in a double G immersion with cutout effects to harmonize the final result.\r\n</p>\r\n\r\n<p>\r\nYou can check his logo applied to all his pages following the links below:\r\n</p>\r\n<div class="social-icons">\r\n<a target="_blank" href="http://www.twitch.tv/gabrilosgaming"><img src="/static/img/twitch.png" title="Twitch.TV"></a>\r\n<a target="_blank" href="http://www.youtube.com/channel/UC_hOhndaaBhnbG83jKCKldA"><img src="/static/img/youtube.png" title="YouTube"></a>\r\n<a target="_blank" href="https://www.facebook.com/GabrilosG"><img src="/static/img/facebook.png" title="Facebook"></a>\r\n<a target="_blank" href="https://twitter.com/gabrilosgaming"><img src="/static/img/twitter.png" title="Twitter"></a>\r\n</div>	11	gabrilos
13	1ron-tjunfisk	projects/sidebar/tjun2_1.png	projects/large/tjun.png	<p>\r\n<b>1ron-tjunfisk</b> is a well known youtube producer on the Battlefield scene. Creator of stunning machinima videos, he was looking to brand himself this logo came out as a result.\r\n\r\n<p>\r\nYou can check his logo applied to all his pages following the links below:\r\n</p>\r\n<div class="social-icons">\r\n<a target="_blank" href="http://www.twitch.tv/irontjunfisk"><img src="/static/img/twitch.png" title="Twitch.TV"></a>\r\n<a target="_blank" href="http://www.youtube.com/channel/UCKoduoC096rhTVk5HVuDdHw"><img src="/static/img/youtube.png" title="YouTube"></a>\r\n<a target="_blank" href="https://www.facebook.com/irontjunfisk"><img src="/static/img/facebook.png" title="Facebook"></a>\r\n</div>	10	1ron-tjunfisk
12	kaken1nja	projects/sidebar/kake2_1.png	projects/large/kake.png	<p>\r\n<b>Kaken1nja</b> is a streamer who has a good background on the BF3 dogfighting community.\r\n</p>\r\n\r\n<p>\r\nYou can check his logo applied to all his pages following the links below:\r\n</p>\r\n<div class="social-icons">\r\n<a target="_blank" href="http://www.twitch.tv/kakeninja/profile"><img src="/static/img/twitch.png" title="Twitch.TV"></a>\r\n<a target="_blank" href="http://www.youtube.com/user/kakeninja"><img src="/static/img/youtube.png" title="YouTube"></a>\r\n<a target="_blank" href="https://www.facebook.com/Kakeninja?ref=hl"><img src="/static/img/facebook.png" title="Facebook"></a>\r\n<a target="_blank" href="https://twitter.com/kakeninja"><img src="/static/img/twitter.png" title="Twitter"></a>\r\n</div>	8	kaken1nja
\.


--
-- Name: main_project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: main_project
--

SELECT pg_catalog.setval('main_project_id_seq', 14, true);


--
-- Name: main_project_pkey; Type: CONSTRAINT; Schema: public; Owner: main_project; Tablespace: 
--

ALTER TABLE ONLY main_project
    ADD CONSTRAINT main_project_pkey PRIMARY KEY (id);


--
-- Name: main_project_slug; Type: INDEX; Schema: public; Owner: main_project; Tablespace: 
--

CREATE INDEX main_project_slug ON main_project USING btree (slug);


--
-- Name: main_project_slug_like; Type: INDEX; Schema: public; Owner: main_project; Tablespace: 
--

CREATE INDEX main_project_slug_like ON main_project USING btree (slug varchar_pattern_ops);


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

