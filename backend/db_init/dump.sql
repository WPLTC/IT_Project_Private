--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Les lignes suivantes ont été supprimées pour compatibilité Docker :
-- SET transaction_timeout = 0;

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


--
-- Name: posts_comment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.posts_comment (
    id bigint NOT NULL,
    content text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    author_id bigint NOT NULL,
    post_id bigint NOT NULL
);


--
-- Name: posts_post; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.posts_post (
    id bigint NOT NULL,
    title character varying(200) NOT NULL,
    content text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    published_at timestamp with time zone NOT NULL,
    author_id bigint NOT NULL
);


--
-- Name: posts_post_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.posts_post_tags (
    id bigint NOT NULL,
    post_id bigint NOT NULL,
    tag_id bigint NOT NULL
);


--
-- Name: posts_reaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.posts_reaction (
    id bigint NOT NULL,
    emoji character varying(10) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    post_id bigint NOT NULL,
    user_id bigint NOT NULL
);


--
-- Name: posts_tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.posts_tag (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    slug character varying(50) NOT NULL
);


--
-- Name: token_blacklist_blacklistedtoken; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.token_blacklist_blacklistedtoken (
    id bigint NOT NULL,
    blacklisted_at timestamp with time zone NOT NULL,
    token_id bigint NOT NULL
);


--
-- Name: token_blacklist_outstandingtoken; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.token_blacklist_outstandingtoken (
    id bigint NOT NULL,
    token text NOT NULL,
    created_at timestamp with time zone,
    expires_at timestamp with time zone NOT NULL,
    user_id bigint,
    jti character varying(255) NOT NULL
);


--
-- Name: users_passwordresettoken; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_passwordresettoken (
    id bigint NOT NULL,
    token character varying(100) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    expires_at timestamp with time zone NOT NULL,
    user_id bigint NOT NULL
);


--
-- Name: users_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_user (
    id bigint NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    password character varying(128) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    created_at timestamp with time zone NOT NULL
);


--
-- Name: users_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_user_groups (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    group_id integer NOT NULL
);


--
-- Name: users_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_user_user_permissions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    permission_id integer NOT NULL
);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
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
21	Can add blacklisted token	6	add_blacklistedtoken
22	Can change blacklisted token	6	change_blacklistedtoken
23	Can delete blacklisted token	6	delete_blacklistedtoken
24	Can view blacklisted token	6	view_blacklistedtoken
25	Can add outstanding token	7	add_outstandingtoken
26	Can change outstanding token	7	change_outstandingtoken
27	Can delete outstanding token	7	delete_outstandingtoken
28	Can view outstanding token	7	view_outstandingtoken
29	Can add Utilisateur	8	add_user
30	Can change Utilisateur	8	change_user
31	Can delete Utilisateur	8	delete_user
32	Can view Utilisateur	8	view_user
33	Can add password reset token	9	add_passwordresettoken
34	Can change password reset token	9	change_passwordresettoken
35	Can delete password reset token	9	delete_passwordresettoken
36	Can view password reset token	9	view_passwordresettoken
37	Can add Tag	10	add_tag
38	Can change Tag	10	change_tag
39	Can delete Tag	10	delete_tag
40	Can view Tag	10	view_tag
41	Can add Post	11	add_post
42	Can change Post	11	change_post
43	Can delete Post	11	delete_post
44	Can view Post	11	view_post
45	Can add Commentaire	12	add_comment
46	Can change Commentaire	12	change_comment
47	Can delete Commentaire	12	delete_comment
48	Can view Commentaire	12	view_comment
49	Can add R├®action	13	add_reaction
50	Can change R├®action	13	change_reaction
51	Can delete R├®action	13	delete_reaction
52	Can view R├®action	13	view_reaction
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	token_blacklist	blacklistedtoken
7	token_blacklist	outstandingtoken
8	users	user
9	users	passwordresettoken
10	posts	tag
11	posts	post
12	posts	comment
13	posts	reaction
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2025-05-05 18:20:14.012162+02
2	contenttypes	0002_remove_content_type_name	2025-05-05 18:20:14.028168+02
3	auth	0001_initial	2025-05-05 18:20:14.089018+02
4	auth	0002_alter_permission_name_max_length	2025-05-05 18:20:14.09302+02
5	auth	0003_alter_user_email_max_length	2025-05-05 18:20:14.097019+02
6	auth	0004_alter_user_username_opts	2025-05-05 18:20:14.10102+02
7	auth	0005_alter_user_last_login_null	2025-05-05 18:20:14.106023+02
8	auth	0006_require_contenttypes_0002	2025-05-05 18:20:14.108023+02
9	auth	0007_alter_validators_add_error_messages	2025-05-05 18:20:14.113023+02
10	auth	0008_alter_user_username_max_length	2025-05-05 18:20:14.116369+02
11	auth	0009_alter_user_last_name_max_length	2025-05-05 18:20:14.122328+02
12	auth	0010_alter_group_name_max_length	2025-05-05 18:20:14.135953+02
13	auth	0011_update_proxy_permissions	2025-05-05 18:20:14.14295+02
14	auth	0012_alter_user_first_name_max_length	2025-05-05 18:20:14.149953+02
15	users	0001_initial	2025-05-05 18:20:14.236924+02
16	admin	0001_initial	2025-05-05 18:20:14.262931+02
17	admin	0002_logentry_remove_auto_add	2025-05-05 18:20:14.26944+02
18	admin	0003_logentry_add_action_flag_choices	2025-05-05 18:20:14.276457+02
19	posts	0001_initial	2025-05-05 18:20:14.358762+02
20	sessions	0001_initial	2025-05-05 18:20:14.369394+02
21	token_blacklist	0001_initial	2025-05-05 18:20:14.410721+02
22	token_blacklist	0002_outstandingtoken_jti_hex	2025-05-05 18:20:14.420761+02
23	token_blacklist	0003_auto_20171017_2007	2025-05-05 18:20:14.433761+02
24	token_blacklist	0004_auto_20171017_2013	2025-05-05 18:20:14.446767+02
25	token_blacklist	0005_remove_outstandingtoken_jti	2025-05-05 18:20:14.45779+02
26	token_blacklist	0006_auto_20171017_2113	2025-05-05 18:20:14.467797+02
27	token_blacklist	0007_auto_20171017_2214	2025-05-05 18:20:14.508805+02
28	token_blacklist	0008_migrate_to_bigautofield	2025-05-05 18:20:14.565112+02
29	token_blacklist	0010_fix_migrate_to_bigautofield	2025-05-05 18:20:14.589117+02
30	token_blacklist	0011_linearizes_history	2025-05-05 18:20:14.59112+02
31	token_blacklist	0012_alter_outstandingtoken_user	2025-05-05 18:20:14.599124+02
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: posts_comment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.posts_comment (id, content, created_at, updated_at, author_id, post_id) FROM stdin;
1	Super article, merci !	2025-05-06 20:46:15.493693+02	2025-05-06 20:46:15.493693+02	3	1
23	Je ne connaissais pas Proxmox, ├ºa a lÔÇÖair super puissant pour lÔÇÖauto-h├®bergement !	2025-05-12 17:25:51.949726+02	2025-05-12 17:25:51.949726+02	3	6
24	CÔÇÖest exactement ce quÔÇÖil me fallait pour connecter mon frontend React ├á mon backend Django !	2025-05-12 17:26:11.853653+02	2025-05-12 17:26:11.853653+02	3	4
25	Simple et efficace pour les d├®butants. JÔÇÖadore !	2025-05-12 17:26:28.341258+02	2025-05-12 17:26:28.341258+02	3	3
26	Docker mÔÇÖa permis de d├®ployer mon appli Django en 10 minutes. Merci !	2025-05-12 17:26:36.434501+02	2025-05-12 17:26:36.434501+02	3	2
27	Super clair ! J'avais jamais compris la diff├®rence avant ce post.	2025-05-12 17:26:49.091689+02	2025-05-12 17:26:49.091689+02	3	1
28	Super clair	2025-05-12 17:27:55.077785+02	2025-05-12 17:27:55.077785+02	3	5
29	Incroyable!!!!	2025-05-12 17:38:28.539731+02	2025-05-12 17:38:28.539731+02	3	5
30	soutenance	2025-05-13 11:24:14.290188+02	2025-05-13 11:24:14.290188+02	3	6
31	Super article, merci !	2025-05-15 17:28:26.569038+02	2025-05-15 17:28:26.569038+02	4	1
32	Super article, merci !	2025-05-15 17:32:03.666412+02	2025-05-15 17:32:03.666412+02	4	1
33	Super article, merci !	2025-05-15 17:39:34.52577+02	2025-05-15 17:39:34.52577+02	4	1
34	Super article, merci !	2025-05-15 17:46:31.741605+02	2025-05-15 17:46:31.741605+02	4	1
35	Super article, merci !	2025-05-15 17:46:46.04952+02	2025-05-15 17:46:46.04952+02	4	1
36	Super article, merci !	2025-05-15 17:48:11.416252+02	2025-05-15 17:48:11.416252+02	4	1
37	Super article, merci !	2025-05-15 17:48:19.930506+02	2025-05-15 17:48:19.930567+02	4	1
38	Super article, merci !	2025-05-15 17:49:35.87148+02	2025-05-15 17:49:35.87148+02	4	1
39	Super article, merci !	2025-05-15 17:49:45.246645+02	2025-05-15 17:49:45.246645+02	4	1
40	Super article, merci !	2025-05-15 17:49:52.558797+02	2025-05-15 17:49:52.558797+02	4	1
41	Super article, merci !	2025-05-15 17:50:05.35982+02	2025-05-15 17:50:05.35982+02	4	1
42	Super article, merci !	2025-06-10 22:25:54.739557+02	2025-06-10 22:25:54.739557+02	4	1
43	ejeklejekl	2025-06-13 11:50:11.063012+02	2025-06-13 11:50:11.063012+02	4	11
\.


--
-- Data for Name: posts_post; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.posts_post (id, title, content, created_at, updated_at, published_at, author_id) FROM stdin;
7	Le cloud computing	Le cloud bouleverse lÔÇÖinfrastructure informatique traditionnelle. Cet article explique les principes du cloud (IaaS, PaaS, SaaS), ses avantages (flexibilit├®, co├╗ts r├®duits), mais aussi ses limites (d├®pendance au r├®seau, s├®curit├®, souverainet├® des donn├®es).	2025-05-13 11:24:48.443951+02	2025-05-13 11:24:48.443951+02	2025-05-13 11:24:48.443951+02	3
9	 La cybers├®curit├® ├á lÔÇÖ├¿re des ransomwares 	Les attaques par ransomwares explosent depuis quelques ann├®es, ciblant aussi bien les entreprises que les particuliers. Cet article explore comment ces malwares fonctionnent, les m├®thodes de protection essentielles (sauvegardes, antivirus, sensibilisation), et les d├®fis futurs de la cybers├®curit├®.	2025-06-11 18:42:16.620935+02	2025-06-12 15:16:25.900895+02	2025-06-11 18:42:16.619933+02	4
10	Soutenance	Bonjour,├ºa va	2025-06-12 21:44:42.124377+02	2025-06-12 21:44:42.124377+02	2025-06-12 21:44:42.123378+02	4
11	Soutenance	, je suis un ├®tudiant en informatique qui cherche ├á am├®liorer son fran├ºais. Je suis ├á la recherche d'un partenaire de conversation qui pourrait m'aider ├á perfectionner mon expression orale. J'ai quelques connaissances de base, mais je manque de pratique. J'aimerais discuter de sujets vari├®s comme la technologie, les voyages ou la culture, afin de rendre nos ├®changes plus int├®ressants. Si vous ├¬tes int├®ress├® pour pratiquer ensemble, n'h├®sitez pas ├á me contacter. Merci !\n\n├ëtudiant en informatique passionn├®, je souhaite perfectionner ma ma├«trise du fran├ºais et suis ├á la recherche d'un interlocuteur avec qui ├®changer r├®guli├¿rement. Bien que poss├®dant des bases solides, je manque cruellement de pratique ├á l'oral. Pour rendre nos conversations captivantes, j'aimerais aborder des th├®matiques vari├®es telles que les innovations technologiques, les r├®cits de voyage ou les actualit├®s culturelles. Si cette proposition de dialogue vous int├®resse, je serais ravi de faire votre connaissance. N'h├®sitez surtout pas ├á prendre contact !\n\nKey improvements made:\n- Replaced "Bonjour" with more formal academic tone\n- Enriched "├®tudiant en informatique" to "├ëtudiant en informatique passionn├®"\n- Upgraded "cherche ├á am├®liorer" to "souhaite perfectionner"\n- Enhanced "partenaire de conversation" to "interlocuteur avec qui ├®changer r├®guli├¿rement"\n- Strengthened "quelques connaissances de base" to "bases solides"\n- Intensified "je manque de pratique" to "je manque cruellement de pratique"\n- Elevated "discuter de sujets vari├®s" to "aborder des th├®matiques vari├®es"\n- Added sophistication to topic examples: "innovations technologiques", "r├®cits de voyage", "actualit├®s culturelles"\n- Improved closing to "je serais ravi de faire votre connaissance"\n- Formalized "n'h├®sitez pas ├á me contacter" to "N'h├®sitez surtout pas ├á prendre contact"\n- Maintained logical flow while enhancing vocabulary and sentence structures\n- Ensured professional yet approachable tone suitable for academic networking	2025-06-13 11:48:21.496121+02	2025-06-13 11:49:56.561316+02	2025-06-13 11:48:21.496121+02	4
1	Comprendre la diff├®rence entre HTTP et HTTPS	HTTP (HyperText Transfer Protocol) est un protocole de communication non s├®curis├® utilis├® pour transf├®rer des donn├®es sur le web. HTTPS (HTTP Secure) ajoute une couche de s├®curit├® via TLS (anciennement SSL), assurant le chiffrement des donn├®es ├®chang├®es entre le navigateur et le serveur.\nHTTPS est essentiel pour prot├®ger les informations sensibles, comme les mots de passe ou les donn├®es bancaires. De plus, Google privil├®gie les sites HTTPS dans le r├®f├®rencement.	2025-05-06 10:05:30.888791+02	2025-05-06 10:05:30.888791+02	2025-05-06 10:05:30.888791+02	3
2	Docker : Pourquoi et comment l'utiliser ?	Docker permet d'encapsuler une application avec ses d├®pendances dans un conteneur l├®ger. Cela garantit que le code s'ex├®cute de la m├¬me mani├¿re en d├®veloppement, test ou production.\nPour d├®buter, installe Docker, cr├®e un fichier Dockerfile d├®crivant ton environnement, puis ex├®cute :	2025-05-06 10:40:32.480013+02	2025-05-06 10:40:32.480013+02	2025-05-06 10:40:32.478996+02	3
3	Les bases de Git : clone, commit, push	Git est un syst├¿me de versionnement distribu├®. Pour cloner un d├®p├┤t :\n\nbash\nCopier\nModifier\ngit clone https://github.com/monrepo.git\nPour ajouter et valider une modification :\n\nbash\nCopier\nModifier\ngit add .\ngit commit -m "Ajout fonctionnalit├®"\nEt pour lÔÇÖenvoyer vers le d├®p├┤t distant :\n\nbash\nCopier\nModifier\ngit push origin main	2025-05-06 18:56:15.550501+02	2025-05-06 21:22:19.719716+02	2025-05-06 18:56:15.550501+02	3
4	Qu'est-ce qu'une API REST et comment ├ºa fonctionne ?	Une API REST (Representational State Transfer) permet ├á deux syst├¿mes de communiquer via HTTP. Elle repose sur des m├®thodes standards :\n\nGET : lire des donn├®es\n\nPOST : cr├®er des donn├®es\n\nPUT/PATCH : modifier\n\nDELETE : supprimer\n\nChaque ressource (utilisateur, article, etc.) est identifi├®e par une URL.\nExemple : GET /api/posts/ retourne tous les articles. Les APIs REST sont simples, scalables et tr├¿s utilis├®es dans les applications web modernes.	2025-05-06 19:58:07.300365+02	2025-05-06 19:58:07.300365+02	2025-05-06 19:58:07.300365+02	3
5	JavaScript : comprendre async/await	En JavaScript, les promesses permettent de g├®rer le code asynchrone proprement.\nUne promesse repr├®sente une op├®ration qui nÔÇÖest pas encore termin├®e. Plut├┤t que dÔÇÖutiliser .then() et .catch(), on peut ├®crire du code plus lisible avec async/await.	2025-05-06 20:44:28.701137+02	2025-05-06 20:44:28.701137+02	2025-05-06 20:44:28.701137+02	3
6	 virtualisation avec Proxmox VE	Proxmox VE est une solution de virtualisation open source qui combine KVM (machines virtuelles) et LXC (conteneurs l├®gers).\nIl permet de g├®rer facilement plusieurs VMs depuis une interface web, de faire du clustering et de la haute disponibilit├®. CÔÇÖest id├®al pour h├®berger Home Assistant, Nextcloud ou des serveurs web.\nAvantages : snapshots, sauvegardes, gestion fine des ressources, interface simple.\nInstallation possible sur un vieux PC ou un mini-serveur.	2025-05-08 12:42:33.377396+02	2025-05-08 12:42:33.377396+02	2025-05-08 12:42:33.377396+02	3
8	LÔÇÖintelligence artificielle : R├®volution num├®rique ou menace silencieuse ?	LÔÇÖintelligence artificielle (IA) sÔÇÖimpose aujourdÔÇÖhui comme un des piliers majeurs de lÔÇÖinnovation technologique. De la reconnaissance vocale ├á la conduite autonome, en passant par les diagnostics m├®dicaux assist├®s, elle transforme en profondeur notre rapport ├á la machine et notre mani├¿re dÔÇÖinteragir avec les donn├®es.\n\nLe principe de lÔÇÖIA repose sur la capacit├® dÔÇÖun programme ├á apprendre ├á partir dÔÇÖun ensemble de donn├®es, souvent gr├óce ├á des techniques comme lÔÇÖapprentissage automatique (machine learning) ou les r├®seaux de neurones. Ces mod├¿les sont entra├«n├®s sur des volumes colossaux dÔÇÖinformations afin de reproduire des comportements "intelligents", souvent comparables, voire sup├®rieurs, ├á ceux de lÔÇÖ├¬tre humain dans des t├óches pr├®cises.	2025-06-10 22:32:00.064224+02	2025-06-10 22:32:00.064224+02	2025-06-10 22:32:00.063225+02	4
\.


--
-- Data for Name: posts_post_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.posts_post_tags (id, post_id, tag_id) FROM stdin;
1	1	1
2	3	2
3	4	3
4	5	4
5	6	5
6	7	6
7	8	7
10	9	8
11	10	9
13	11	9
\.


--
-- Data for Name: posts_reaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.posts_reaction (id, emoji, created_at, post_id, user_id) FROM stdin;
120	LIKE	2025-05-13 11:24:04.252338+02	6	3
121	LOVE	2025-05-13 11:24:05.465172+02	6	3
122	LIKE	2025-06-11 17:39:13.871163+02	7	5
15	HAHA	2025-05-06 19:50:41.567727+02	2	3
22	LOVE	2025-05-06 19:55:57.370786+02	1	3
138	LIKE	2025-06-12 15:16:40.892706+02	8	4
29	LIKE	2025-05-06 20:13:39.428375+02	2	4
33	LOVE	2025-05-06 20:20:40.652906+02	3	4
34	LIKE	2025-05-06 20:20:42.439285+02	3	4
96	LIKE	2025-05-12 16:36:24.332798+02	6	4
106	LIKE	2025-05-12 17:31:32.528261+02	4	3
55	LOVE	2025-05-08 12:18:25.927872+02	3	3
\.


--
-- Data for Name: posts_tag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.posts_tag (id, name, slug) FROM stdin;
4	Javascript	Javascript
5	Proxmox	Proxmox
3	API	API
2	Git	Git
1	HTTP	HTTP
6	Cloud	Cloud
7	AI	AI
8	Cyber	Cyber
9	Soutenance	soutenance
\.


--
-- Data for Name: token_blacklist_blacklistedtoken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.token_blacklist_blacklistedtoken (id, blacklisted_at, token_id) FROM stdin;
1	2025-05-05 18:22:38.539992+02	2
2	2025-05-06 09:46:46.210036+02	3
3	2025-05-06 09:51:15.624192+02	4
4	2025-05-06 10:25:42.239395+02	7
5	2025-05-06 10:37:49.195707+02	8
6	2025-05-06 10:42:11.212607+02	9
7	2025-05-06 11:15:58.677964+02	10
9	2025-05-06 11:17:44.755193+02	12
10	2025-05-06 11:19:17.503332+02	13
11	2025-05-06 11:39:33.468638+02	14
12	2025-05-06 11:39:46.031136+02	15
13	2025-05-06 11:40:03.043416+02	17
14	2025-05-06 13:53:22.705349+02	18
16	2025-05-06 18:52:17.956505+02	20
17	2025-05-06 18:58:12.968635+02	22
18	2025-05-06 18:58:40.427875+02	23
19	2025-05-06 19:03:46.072512+02	24
20	2025-05-06 19:27:14.908335+02	25
21	2025-05-06 19:46:31.782636+02	26
22	2025-05-06 19:58:56.977274+02	27
23	2025-05-06 20:05:13.096529+02	28
24	2025-05-06 20:13:43.96761+02	29
25	2025-05-06 20:20:17.150739+02	30
26	2025-05-06 20:20:48.174532+02	31
27	2025-05-06 20:38:09.123085+02	32
28	2025-05-06 20:53:25.659106+02	33
29	2025-05-06 20:56:42.800302+02	34
30	2025-05-06 21:12:24.15962+02	35
31	2025-05-06 21:12:24.415491+02	36
32	2025-05-06 21:12:24.658073+02	37
33	2025-05-06 23:50:49.659414+02	38
34	2025-05-07 08:58:12.016789+02	39
35	2025-05-07 10:49:01.919514+02	40
36	2025-05-07 11:37:54.410456+02	41
37	2025-05-08 11:41:41.979466+02	42
38	2025-05-08 11:42:12.745946+02	43
39	2025-05-08 12:01:28.405553+02	44
40	2025-05-08 12:16:33.37643+02	45
41	2025-05-08 12:16:33.540404+02	46
42	2025-05-08 12:16:33.715551+02	47
43	2025-05-08 12:33:11.047135+02	48
44	2025-05-08 12:33:11.298686+02	49
45	2025-05-08 12:33:11.362926+02	50
46	2025-05-08 12:55:38.244238+02	51
47	2025-05-08 12:55:38.364788+02	52
48	2025-05-08 12:55:38.432806+02	53
49	2025-05-08 12:59:10.676332+02	54
50	2025-05-08 19:22:51.540467+02	55
51	2025-05-08 19:24:53.942889+02	56
52	2025-05-09 11:00:16.589878+02	57
53	2025-05-09 16:21:28.827349+02	58
54	2025-05-11 23:22:22.72272+02	59
56	2025-05-12 15:34:50.377236+02	61
57	2025-05-12 15:34:50.61529+02	62
58	2025-05-12 15:34:50.686312+02	63
59	2025-05-12 15:35:19.50575+02	64
60	2025-05-12 15:50:22.581523+02	65
61	2025-05-12 15:55:56.863021+02	66
62	2025-05-12 15:57:01.669175+02	67
63	2025-05-12 15:58:36.711242+02	68
64	2025-05-12 15:58:51.399408+02	69
65	2025-05-12 16:18:44.637816+02	70
66	2025-05-12 16:19:35.358844+02	71
67	2025-05-12 16:35:46.465685+02	72
68	2025-05-12 16:36:26.773848+02	73
69	2025-05-12 16:36:51.911081+02	74
70	2025-05-12 16:48:47.506693+02	75
71	2025-05-12 17:29:57.203543+02	76
72	2025-05-12 21:04:49.934948+02	77
73	2025-05-12 22:05:30.938145+02	78
74	2025-05-12 22:32:52.593833+02	79
75	2025-05-12 22:34:50.438+02	81
76	2025-05-12 22:35:36.640287+02	82
77	2025-05-12 22:54:16.809107+02	83
78	2025-05-12 22:55:08.954411+02	84
79	2025-05-12 22:55:38.266252+02	85
80	2025-05-12 23:15:37.301125+02	86
81	2025-05-12 23:16:36.569294+02	87
82	2025-05-13 09:42:48.200657+02	80
83	2025-05-13 10:36:56.328828+02	88
84	2025-05-13 11:24:58.462884+02	89
85	2025-05-13 11:25:28.843976+02	90
86	2025-05-15 17:28:58.026666+02	91
87	2025-06-10 22:29:50.162899+02	94
88	2025-06-11 17:39:36.655187+02	95
89	2025-06-12 14:37:20.667607+02	98
90	2025-06-12 17:51:07.696854+02	99
91	2025-06-12 17:55:28.96753+02	100
92	2025-06-12 17:55:56.740492+02	101
93	2025-06-12 17:58:06.686345+02	102
94	2025-06-12 21:21:23.917122+02	103
95	2025-06-12 21:21:39.024475+02	104
96	2025-06-12 21:40:04.906103+02	105
97	2025-06-12 21:40:56.979771+02	106
98	2025-06-12 22:01:12.235764+02	108
99	2025-06-12 23:49:28.568695+02	109
100	2025-06-12 23:51:08.456666+02	110
101	2025-06-13 10:22:16.428462+02	111
102	2025-06-13 10:47:10.588386+02	112
\.


--
-- Data for Name: token_blacklist_outstandingtoken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.token_blacklist_outstandingtoken (id, token, created_at, expires_at, user_id, jti) FROM stdin;
1	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzA2Njg1MywiaWF0IjoxNzQ2NDYyMDUzLCJqdGkiOiJmMDI4Yzg4YjU5Y2I0MWRmOWRhYzhlZTViZTkxMjJmMSIsInVzZXJfaWQiOjF9.vuO4FpRDDORIvsLUogIM8AxSXWj5UB0vqdXBO0kYyeQ	2025-05-05 18:20:53.731135+02	2025-05-12 18:20:53+02	1	f028c88b59cb41df9dac8ee5be9122f1
2	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzA2NjkwOSwiaWF0IjoxNzQ2NDYyMTA5LCJqdGkiOiJlNDBiNjU1MTM2MGU0M2U4YjdhZjdkM2Q2NTgwZTA2MCIsInVzZXJfaWQiOjJ9.43iYixWvkdgIJS9FFGUvT9TzY1A1ZLo0o7YUNDYVkis	2025-05-05 18:21:49.20294+02	2025-05-12 18:21:49+02	2	e40b6551360e43e8b7af7d3d6580e060
3	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzEyMjM3OSwiaWF0IjoxNzQ2NTE3NTc5LCJqdGkiOiJiYjJkMmJlYmYzMDY0ZmY0OWY0Yzc1YmE4N2Y3MGVlNiIsInVzZXJfaWQiOjN9.wnOTnCATx7z-nCo80_sBqBjZlcH6ZwQI2pTF55Oid0Q	2025-05-06 09:46:19.493211+02	2025-05-13 09:46:19+02	3	bb2d2bebf3064ff49f4c75ba87f70ee6
4	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzEyMjQxMywiaWF0IjoxNzQ2NTE3NjEzLCJqdGkiOiI3MmY5YjAxZjgxMGU0NjE0YTJmY2JkMWZjZGVkYzg5MyIsInVzZXJfaWQiOjN9.z_ACQQQH18KPfjoKV3UwvnNPWGKvN9FP_lc8KeDbD1w	2025-05-06 09:46:53.755542+02	2025-05-13 09:46:53+02	3	72f9b01f810e4614a2fcbd1fcdedc893
5	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzEyMjY5MCwiaWF0IjoxNzQ2NTE3ODkwLCJqdGkiOiJkMjZhNjM4OWJiZWI0M2Y5ODdjMmE1MGQzZTE3YjhhYyIsInVzZXJfaWQiOjN9.-rzJk2rrzZZwo-8DvNv2wS-N0xwYK4vbu0I5hGH_9OE	2025-05-06 09:51:30.376316+02	2025-05-13 09:51:30+02	3	d26a6389bbeb43f987c2a50d3e17b8ac
6	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzEyMzQ0NCwiaWF0IjoxNzQ2NTE4NjQ0LCJqdGkiOiJjNjIxZmI3ZTIxZDc0NDQ4YWUzOWRjZGNlM2E3M2I3ZCIsInVzZXJfaWQiOjN9.CtPz2Q92zjGJjlz1vY1V7lBZpr4NLXJZmbI0TbfH5JI	2025-05-06 10:04:04.10501+02	2025-05-13 10:04:04+02	3	c621fb7e21d74448ae39dcdce3a73b7d
7	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzEyMzkyMSwiaWF0IjoxNzQ2NTE5MTIxLCJqdGkiOiJkODAxNGVlMzU2NGY0NzJkYWNiMGI3M2NjMWUxNDI2ZSIsInVzZXJfaWQiOjN9.hPiRDDbNLWFzamdA31L55QIGCj8ynO3MP1UucBISiZc	2025-05-06 10:12:01.092516+02	2025-05-13 10:12:01+02	3	d8014ee3564f472dacb0b73cc1e1426e
8	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzEyNTE2OSwiaWF0IjoxNzQ2NTIwMzY5LCJqdGkiOiJkMWUwY2RiOTRlZjk0ZTFmOWUwYmZmOWQ3NDk4NWMxNiIsInVzZXJfaWQiOjN9.Qt0axPmTsf3YFax6pa1RNARSXZawiro3dlxJTxWtALs	2025-05-06 10:32:49.488962+02	2025-05-13 10:32:49+02	3	d1e0cdb94ef94e1f9e0bff9d74985c16
9	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzEyNTUwMSwiaWF0IjoxNzQ2NTIwNzAxLCJqdGkiOiI5NzdiZDY1MmFkOTI0MTVkOTYwM2ViZjlkYWRmNTJkMiIsInVzZXJfaWQiOjN9.lJNEM2AnYZjQPfCVOu0zbyugxp01UhaA3eTV_R7jq50	2025-05-06 10:38:21.595476+02	2025-05-13 10:38:21+02	3	977bd652ad92415d9603ebf9dadf52d2
10	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzEyNTg5MCwiaWF0IjoxNzQ2NTIxMDkwLCJqdGkiOiIzMTc2OGVkN2U0ODE0ZmYzOTFiZjg0ZDYwMTQ1MTgxYiIsInVzZXJfaWQiOjR9.NHJRgZobBXu24he2N8FbjnpeW63vhs-PCm3UnR6Pgmo	2025-05-06 10:44:50.794894+02	2025-05-13 10:44:50+02	4	31768ed7e4814ff391bf84d60145181b
11	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzEyNzc1OCwiaWF0IjoxNzQ2NTIyOTU4LCJqdGkiOiIyYTI2NDY4NzM0YWM0YzU5OWNiNzliYjQzNTBmOWFjOSIsInVzZXJfaWQiOjR9.XO444BjmaObNHU1t3svHPQuiL7F8w_e1z0xgEYYBtrY	2025-05-06 11:15:58.683966+02	2025-05-13 11:15:58+02	4	2a26468734ac4c599cb79bb4350f9ac9
12	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzEyNzc1OCwiaWF0IjoxNzQ2NTIyOTU4LCJqdGkiOiI3ZWY2YzMzYWI2NTk0M2FiOTEwYjM4MGEyMmVmMjg1ZSIsInVzZXJfaWQiOjR9.X_flnjygH2pGRUDpii0DfT7C3xCj0Gjjl-tzTzjdH3s	2025-05-06 11:15:58.697962+02	2025-05-13 11:15:58+02	4	7ef6c33ab65943ab910b380a22ef285e
13	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzEyNzg3NSwiaWF0IjoxNzQ2NTIzMDc1LCJqdGkiOiJjNWQxMzMxYjk3OGQ0ZjQyYmU1ZDg3MjU0MTVmMDg3OCIsInVzZXJfaWQiOjN9.CQFMbih9VFfJB1heJaB0WI1IRz3kA-3-Sk4c-ZaswJM	2025-05-06 11:17:55.458549+02	2025-05-13 11:17:55+02	3	c5d1331b978d4f42be5d8725415f0878
14	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzEyNzk3OCwiaWF0IjoxNzQ2NTIzMTc4LCJqdGkiOiI3YzlhNDM5NDcyNzI0MzdjODFmYmU3NWM5NDRjMTRjMiIsInVzZXJfaWQiOjN9._D9W2ozAVop2X8DUwBsJBTryra0Dyb3WA6IEX8nSoR0	2025-05-06 11:19:38.360326+02	2025-05-13 11:19:38+02	3	7c9a43947272437c81fbe75c944c14c2
15	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzEyOTE3MywiaWF0IjoxNzQ2NTI0MzczLCJqdGkiOiI2NTE3MTYwY2IxMmQ0OTQwYjlkZTdkNDNhZDEzYWJiNSIsInVzZXJfaWQiOjN9.LUJs5sVzInXHBVR0wf4pKnbX0RzhCK_u_Xc4a1SzDQU	2025-05-06 11:39:33.515584+02	2025-05-13 11:39:33+02	3	6517160cb12d4940b9de7d43ad13abb5
16	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzEyOTE4NiwiaWF0IjoxNzQ2NTI0Mzg2LCJqdGkiOiI4NzU4M2FkYTVlNjQ0ODhiYmM3MzE2Njk3NjBjNzU2YyIsInVzZXJfaWQiOjN9.CxYJYa1a5RR24IvW8vTQ-kpI9tWRoyp2WQtYHWVJwMI	2025-05-06 11:39:46.036134+02	2025-05-13 11:39:46+02	3	87583ada5e64488bbc731669760c756c
17	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzEyOTE5MSwiaWF0IjoxNzQ2NTI0MzkxLCJqdGkiOiIwNWIwYjk0Y2IzYjQ0N2M3YmIzM2QxZGY2NDNkMjczNCIsInVzZXJfaWQiOjR9.n-R8Th8ODG-I2g4QZ_8q3uQ-WhA76x06HofaAMFrX2I	2025-05-06 11:39:51.298276+02	2025-05-13 11:39:51+02	4	05b0b94cb3b447c7bb33d1df643d2734
18	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzEyOTIyMCwiaWF0IjoxNzQ2NTI0NDIwLCJqdGkiOiIwY2FiNGNjY2ZiODA0NzE5YTM1ZTUxZWJlZTY0ZGYwMyIsInVzZXJfaWQiOjN9.wx11p7tp_zYxiEUmnjSf2evW-S4J2-20I_Cx4x72ygw	2025-05-06 11:40:20.667191+02	2025-05-13 11:40:20+02	3	0cab4cccfb804719a35e51ebee64df03
19	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzEzNzIwMiwiaWF0IjoxNzQ2NTMyNDAyLCJqdGkiOiI5YTg0M2M4ZDRhYzQ0ZjYzOWRmMTU3M2NiYjQ2OWNmNiIsInVzZXJfaWQiOjN9.-S7r75cZnc-H4up3QOF0BTXj1o6q57v1RC7crqAvXZk	2025-05-06 13:53:22.729966+02	2025-05-13 13:53:22+02	3	9a843c8d4ac44f639df1573cbb469cf6
20	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzEzNzIxOSwiaWF0IjoxNzQ2NTMyNDE5LCJqdGkiOiJjZDZlYzViOGE1ODk0ZjllOTk1MzRjZGExZTM4ZjcyOCIsInVzZXJfaWQiOjN9.2c-MknvpUlQvJw-AEarxZ66lMnj_A35EeJxB3vpr5-c	2025-05-06 13:53:39.426317+02	2025-05-13 13:53:39+02	3	cd6ec5b8a5894f9e99534cda1e38f728
21	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzE1NTEzNywiaWF0IjoxNzQ2NTUwMzM3LCJqdGkiOiI3YTNkMmYwYTlhOGQ0N2YxYjc3OTNmZWU0MTZhNGQ0OCIsInVzZXJfaWQiOjN9.CdVL9oBZ2f0KzYfId3KrJHdj0yHtG70Or1XfY4B4Upo	2025-05-06 18:52:17.96452+02	2025-05-13 18:52:17+02	3	7a3d2f0a9a8d47f1b7793fee416a4d48
22	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzE1NTEzNywiaWF0IjoxNzQ2NTUwMzM3LCJqdGkiOiI5NmRmMTA1ODhlMmE0YmQzOTQ1NTFhMzQ2MjNkY2JmNyIsInVzZXJfaWQiOjN9.MY1GSew98URthGfa_1JT-2KXL-fd0nlXNNLzRJv0MY0	2025-05-06 18:52:17.978511+02	2025-05-13 18:52:17+02	3	96df10588e2a4bd394551a34623dcbf7
23	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzE1NTUwOCwiaWF0IjoxNzQ2NTUwNzA4LCJqdGkiOiI0ZjAwMGMyNjkzY2E0YmE2YTk1ZDc2NmJlMmE1NDEyYiIsInVzZXJfaWQiOjR9.IEx88h-Vej12q7uvImmk6g3UFjF0vJYdJnJW-A3JLrQ	2025-05-06 18:58:28.37457+02	2025-05-13 18:58:28+02	4	4f000c2693ca4ba6a95d766be2a5412b
24	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzE1NTgxMywiaWF0IjoxNzQ2NTUxMDEzLCJqdGkiOiJlMmFlZTI5NDk1NjY0MGIxODhhY2Q2ZDgxZWE5MWE0MyIsInVzZXJfaWQiOjR9.z_mchQUeH47g7xf2gfI__IOP2qTMfR5p04RiNF4l_VI	2025-05-06 19:03:33.157965+02	2025-05-13 19:03:33+02	4	e2aee294956640b188acd6d81ea91a43
25	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzE1NTgzNCwiaWF0IjoxNzQ2NTUxMDM0LCJqdGkiOiI2NzMyYjM2NGQyNWI0OGJiYmRlNTNjNmY3YTZmZDBhMyIsInVzZXJfaWQiOjN9.KGJun1QWfuyIwqRLtbU59FFzbHGBJwd0it6S7O0kOtw	2025-05-06 19:03:54.662092+02	2025-05-13 19:03:54+02	3	6732b364d25b48bbbde53c6f7a6fd0a3
26	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzE1NzIzNCwiaWF0IjoxNzQ2NTUyNDM0LCJqdGkiOiJjMjZlODU2YmZiMGI0MzhmOGIxNmZjOWZlY2VlMTQwNiIsInVzZXJfaWQiOjN9.aeqlsW1N3a7uCUpAanpMasAWGVVPfBkdHRoePGIW2qQ	2025-05-06 19:27:14.915563+02	2025-05-13 19:27:14+02	3	c26e856bfb0b438f8b16fc9fecee1406
27	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzE1ODM5MSwiaWF0IjoxNzQ2NTUzNTkxLCJqdGkiOiIyZjU0OTA3MzRiMGU0MDk2OTI5ODE2NzQyMjVhNjY0NSIsInVzZXJfaWQiOjN9._Od50bGbucjDHpKJqieKLDZ8eH2VgGf9HGWKYOKSw1w	2025-05-06 19:46:31.793669+02	2025-05-13 19:46:31+02	3	2f5490734b0e409692981674225a6645
28	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzE1OTQ5MCwiaWF0IjoxNzQ2NTU0NjkwLCJqdGkiOiJjNDlmODVlOTRhOTg0MTA0OTA5NGZmYzdhMmFiZWE1NCIsInVzZXJfaWQiOjN9.P26Oeu1BTfl4kx2Thgo5AQ-V9AWb3_nLgg6a_JvePWI	2025-05-06 20:04:50.871569+02	2025-05-13 20:04:50+02	3	c49f85e94a9841049094ffc7a2abea54
29	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzE1OTU1MSwiaWF0IjoxNzQ2NTU0NzUxLCJqdGkiOiI2OGIwOGNhY2VmNWY0MzA1OTAwODI4M2U5OTc3NjA4NiIsInVzZXJfaWQiOjR9.Boezv0IRirZ8dNSSStSbjS6F27uNukEqFoyR3ObIp8U	2025-05-06 20:05:51.382259+02	2025-05-13 20:05:51+02	4	68b08cacef5f43059008283e99776086
30	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzE2MDAzNSwiaWF0IjoxNzQ2NTU1MjM1LCJqdGkiOiJkMWY2MTUxMzRlNmU0Y2QwOTFmNTg4YmE1ZGZhNDllYSIsInVzZXJfaWQiOjN9.J2qxtq0dwAUythWRoG1KVPdoQ6Oc2V-IjmmbDXZenE4	2025-05-06 20:13:55.013879+02	2025-05-13 20:13:55+02	3	d1f615134e6e4cd091f588ba5dfa49ea
31	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzE2MDQzMywiaWF0IjoxNzQ2NTU1NjMzLCJqdGkiOiJlYmJiYTRjNTQ3OWM0MzNkYTg2M2ZkMjUwZmIxNWJkMyIsInVzZXJfaWQiOjR9.-VMLfGlzY6mo3v41ePuDjl007iBtiirLEGx5XocLMBo	2025-05-06 20:20:33.120696+02	2025-05-13 20:20:33+02	4	ebbba4c5479c433da863fd250fb15bd3
32	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzE2MDQ1OSwiaWF0IjoxNzQ2NTU1NjU5LCJqdGkiOiIzMzdhOWNhYTVmOWQ0YmVmOTM5YWZmZmMzYWU2MjhmNCIsInVzZXJfaWQiOjN9.W4qWN4uzUzYNFGYw_yZsYGTAXsgGKnyNC63R7Fmn5q8	2025-05-06 20:20:59.406425+02	2025-05-13 20:20:59+02	3	337a9caa5f9d4bef939afffc3ae628f4
33	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzE2MTQ4OSwiaWF0IjoxNzQ2NTU2Njg5LCJqdGkiOiJmMDk2MjVhN2I4NjQ0N2RkODUxYjQ4ZjZiMjg5NjdmMyIsInVzZXJfaWQiOjN9.oUIky5j-FG4PNLprI8oInUdVZuhci26ecB9mcfU0v7Y	2025-05-06 20:38:09.183743+02	2025-05-13 20:38:09+02	3	f09625a7b86447dd851b48f6b28967f3
34	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzE2MjQwNSwiaWF0IjoxNzQ2NTU3NjA1LCJqdGkiOiJmNDM0YmZhZmVkNmY0MDBlOWJmYTk5NzczZWM1MGU0MSIsInVzZXJfaWQiOjN9.LBH2ITV6ubwibT0_jQE4CfPcTMyzx0lwO694Ua1RcQw	2025-05-06 20:53:25.663107+02	2025-05-13 20:53:25+02	3	f434bfafed6f400e9bfa99773ec50e41
35	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzE2MjYxOCwiaWF0IjoxNzQ2NTU3ODE4LCJqdGkiOiI0ZTBmMWJhODJiMGE0YzU4ODllZDIzZDM5OWUyNzJlMiIsInVzZXJfaWQiOjR9.wih9sKNskX-puEezHb4mjN0HTOXkVZKDYqpDZgw08X0	2025-05-06 20:56:58.097216+02	2025-05-13 20:56:58+02	4	4e0f1ba82b0a4c5889ed23d399e272e2
36	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzE2MzU0NCwiaWF0IjoxNzQ2NTU4NzQ0LCJqdGkiOiJlNmVhZWRlODZkNmE0NDkwYWVjMWEzZjJmNjU0MTNhYiIsInVzZXJfaWQiOjR9.nNcrz9afIXpugqR5000LSzC6z7OR5nrHTC-t33OXtlo	2025-05-06 21:12:24.183623+02	2025-05-13 21:12:24+02	4	e6eaede86d6a4490aec1a3f2f65413ab
37	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzE2MzU0NCwiaWF0IjoxNzQ2NTU4NzQ0LCJqdGkiOiJjNWYwMTRjNmUxNmE0YWIwYmNiZDViMzNlYWE3YjhkMSIsInVzZXJfaWQiOjR9.Lal9gVRjg0W3jcdKpJK3Jd8zoGtVaYDQFDBYicCFQ4U	2025-05-06 21:12:24.421474+02	2025-05-13 21:12:24+02	4	c5f014c6e16a4ab0bcbd5b33eaa7b8d1
38	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzE2MzU0NCwiaWF0IjoxNzQ2NTU4NzQ0LCJqdGkiOiJhZWU5YzlhY2YzNGE0ODliYmQ4NTk3NThmNjQ0ZGRlYSIsInVzZXJfaWQiOjR9.mJQAfRaGWhiv-84A6OaNfgQSlbYeBjbaI8_ZeIH1PKY	2025-05-06 21:12:24.694615+02	2025-05-13 21:12:24+02	4	aee9c9acf34a489bbd859758f644ddea
39	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzE3MzA0OSwiaWF0IjoxNzQ2NTY4MjQ5LCJqdGkiOiI4NjJhNGJlYTc2YzE0MTMxYmJkZjA1YzliZmM1YTIyZiIsInVzZXJfaWQiOjR9.sr7WecJg6Rr7xTh9mirMTcIs41z2uD8svEJi_qXnNdQ	2025-05-06 23:50:49.662322+02	2025-05-13 23:50:49+02	4	862a4bea76c14131bbdf05c9bfc5a22f
40	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzIwNTg5MiwiaWF0IjoxNzQ2NjAxMDkyLCJqdGkiOiJhODM4MGNjN2NkMTk0NGJkYWIwMDFlYTk2YTU3MzU4YSIsInVzZXJfaWQiOjR9.N4THdPDmVATCtkxE7ABlHb4LsPvU2Vx8BRFDkmdvnKA	2025-05-07 08:58:12.074404+02	2025-05-14 08:58:12+02	4	a8380cc7cd1944bdab001ea96a57358a
41	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzIxMjU0MSwiaWF0IjoxNzQ2NjA3NzQxLCJqdGkiOiJkODI0NWNlMGJkOWY0OTBlODFkOWRiODBhZTM2YTFmNSIsInVzZXJfaWQiOjR9.CkHGJt2ceFN0u5IXkv6fAQKe4ALS4XkTpJtos0PdlQc	2025-05-07 10:49:01.959509+02	2025-05-14 10:49:01+02	4	d8245ce0bd9f490e81d9db80ae36a1f5
42	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzIxNTQ3NCwiaWF0IjoxNzQ2NjEwNjc0LCJqdGkiOiI2MjI5ZmI3ZjM4ZDY0NDA1YTRkY2Y0NGMxNWMyODE4NSIsInVzZXJfaWQiOjR9.xmUjlZ3YGdWUXZyaH0Diz2mqg84yocva-4lDJkEWTv8	2025-05-07 11:37:54.457552+02	2025-05-14 11:37:54+02	4	6229fb7f38d64405a4dcf44c15c28185
43	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzMwMjEwMSwiaWF0IjoxNzQ2Njk3MzAxLCJqdGkiOiIyZmViNGM1MjJkMzc0NzQ5ODgyMDg5MzAzYjE2NjIxOCIsInVzZXJfaWQiOjR9.U3p08mD7Xc7M4qVr5n_kkxJs1b409aDBUYtB4rxy9Ho	2025-05-08 11:41:41.985901+02	2025-05-15 11:41:41+02	4	2feb4c522d374749882089303b166218
44	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzMwMjE1NSwiaWF0IjoxNzQ2Njk3MzU1LCJqdGkiOiJhODhlOTQ3NWVjM2E0YjZmOGY5NDc5YjkxYTEwNzQzMiIsInVzZXJfaWQiOjN9.kfkPj_5zKimjNr4PsPSrnfNjuNZjtcRx0cciL6NH6Z0	2025-05-08 11:42:35.990549+02	2025-05-15 11:42:35+02	3	a88e9475ec3a4b6f8f9479b91a107432
45	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzMwMzI4OCwiaWF0IjoxNzQ2Njk4NDg4LCJqdGkiOiIxZjI4ODM4ZTcyZDY0YmY2YTRhNTRkODUxZTFjODYxNyIsInVzZXJfaWQiOjN9.tCt-gCZ7vWHKVZJie8HrQiorXjDowSUrtcXr0mkxqXA	2025-05-08 12:01:28.426329+02	2025-05-15 12:01:28+02	3	1f28838e72d64bf6a4a54d851e1c8617
46	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzMwNDE5MywiaWF0IjoxNzQ2Njk5MzkzLCJqdGkiOiI2YzA5OTJkYzU1MjA0NmQxOTBlNjRkMGZlM2JhMzI3YSIsInVzZXJfaWQiOjN9.1kQZkYhaTBdDtm5PyPvH526qWrVnvWVT4pHEWrB39_k	2025-05-08 12:16:33.379863+02	2025-05-15 12:16:33+02	3	6c0992dc552046d190e64d0fe3ba327a
47	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzMwNDE5MywiaWF0IjoxNzQ2Njk5MzkzLCJqdGkiOiJmZjE3OGE4ZDA4NTc0ZWJkOWNiZTViY2YwYWQxZGFiOSIsInVzZXJfaWQiOjN9.w4hWW89gOeBBEGdisW7JnPIu81itqXqovBiWZRU1S5c	2025-05-08 12:16:33.543408+02	2025-05-15 12:16:33+02	3	ff178a8d08574ebd9cbe5bcf0ad1dab9
48	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzMwNDE5MywiaWF0IjoxNzQ2Njk5MzkzLCJqdGkiOiJlMjAyOTY2YTgwY2E0NTk4OGE0YzBkZDRjZjliMTk4YiIsInVzZXJfaWQiOjN9.mOsSBOJh3YzJM3GklNaU0qu3GCKi4CeBKC9V-WyQd48	2025-05-08 12:16:33.719255+02	2025-05-15 12:16:33+02	3	e202966a80ca45988a4c0dd4cf9b198b
49	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzMwNTE5MSwiaWF0IjoxNzQ2NzAwMzkxLCJqdGkiOiJlOWEyZjRiOGE4MGU0MGMyYWMwYzhhNWMxYWU5ZmVjMyIsInVzZXJfaWQiOjN9.QZSs5EqGNNz--h2eAEItoUvcgSg8jEbBIGCrQ80fs8U	2025-05-08 12:33:11.050135+02	2025-05-15 12:33:11+02	3	e9a2f4b8a80e40c2ac0c8a5c1ae9fec3
50	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzMwNTE5MSwiaWF0IjoxNzQ2NzAwMzkxLCJqdGkiOiJkZmRlNzdiNGEwNTI0NzBmYTQ2NWI2NTRjZjRmYTM4NCIsInVzZXJfaWQiOjN9.GP3NjKpkyaA-zmZjQ_XESj7IBi-bidsSgOc_uCohBNI	2025-05-08 12:33:11.301261+02	2025-05-15 12:33:11+02	3	dfde77b4a052470fa465b654cf4fa384
51	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzMwNTE5MSwiaWF0IjoxNzQ2NzAwMzkxLCJqdGkiOiI3YTY4ZmMxYzNhNzQ0MzZiYjY1M2QzMGMwMDMyMTJiNiIsInVzZXJfaWQiOjN9.SwGggo6GL06543zrGBxbYKvFB2Vxp5XA0EYjkq1fGv0	2025-05-08 12:33:11.366573+02	2025-05-15 12:33:11+02	3	7a68fc1c3a74436bb653d30c003212b6
52	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzMwNjUzOCwiaWF0IjoxNzQ2NzAxNzM4LCJqdGkiOiJjZTg1NWMzNGY4ZTM0YjZjYjAyOTBiNTUzMWEzMWUwMyIsInVzZXJfaWQiOjN9.v8nb2QWhrIk6Dg7UNoz_k5x1SfSqYLWIN9UzNHSkBvM	2025-05-08 12:55:38.247239+02	2025-05-15 12:55:38+02	3	ce855c34f8e34b6cb0290b5531a31e03
53	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzMwNjUzOCwiaWF0IjoxNzQ2NzAxNzM4LCJqdGkiOiJhZWE2MmUzZDFlZTE0ZDQ1OWU1YWNiZGRjNTFiZGYwZCIsInVzZXJfaWQiOjN9.DFVro10FedpQMFx6AhOBL-VqDf4u2sT0rX3vQyv_-Qk	2025-05-08 12:55:38.367789+02	2025-05-15 12:55:38+02	3	aea62e3d1ee14d459e5acbddc51bdf0d
54	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzMwNjUzOCwiaWF0IjoxNzQ2NzAxNzM4LCJqdGkiOiJjNTdkYzUyZDQwMzE0Zjg0YTcxY2I4YzZjNjAyYzJjNCIsInVzZXJfaWQiOjN9.z2-2Qz3vc7ZKhepPsMSaZk_Yr4qOEkO0vpYsD4k1t_o	2025-05-08 12:55:38.435819+02	2025-05-15 12:55:38+02	3	c57dc52d40314f84a71cb8c6c602c2c4
55	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzMwNjg2MiwiaWF0IjoxNzQ2NzAyMDYyLCJqdGkiOiI0ZGI0NjYzYzExOTY0ZTE3YjFlY2IzMjM1ZGNkNmEzYiIsInVzZXJfaWQiOjN9.i2usMk2oCCvGK66758mucozok42OWwQmfT_QyQZCqM4	2025-05-08 13:01:02.565647+02	2025-05-15 13:01:02+02	3	4db4663c11964e17b1ecb3235dcd6a3b
56	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzMyOTc3MSwiaWF0IjoxNzQ2NzI0OTcxLCJqdGkiOiI4MzlmNDVjZThkNTc0MzZiOTI3YWYxNDM4ZDMzZjRmZSIsInVzZXJfaWQiOjN9.q-P9EpLcwKEF8Xb-YQj3Pd0tEraFFCtsfHyRGcp8gh8	2025-05-08 19:22:51.553468+02	2025-05-15 19:22:51+02	3	839f45ce8d57436b927af1438d33f4fe
57	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzMyOTkyMiwiaWF0IjoxNzQ2NzI1MTIyLCJqdGkiOiIxNzcwNzUzM2I4ZGY0MzI3OTk0ZWQ2YmUxODFhMjIzMSIsInVzZXJfaWQiOjN9.b0flVaG8id3YpvE87d_4_PX3p1pDbRjHQ_IKedG_FxI	2025-05-08 19:25:22.264561+02	2025-05-15 19:25:22+02	3	17707533b8df4327994ed6be181a2231
58	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzM4NjAxNiwiaWF0IjoxNzQ2NzgxMjE2LCJqdGkiOiI1NmQ3MDk2ZmFjYjc0YWIzYjdhNTQzOGM0ODA0MGZmNSIsInVzZXJfaWQiOjN9.96-djYTImWxTlHbksTJlHoJ8ViDEhGFbijmdoTK9hhI	2025-05-09 11:00:16.602741+02	2025-05-16 11:00:16+02	3	56d7096facb74ab3b7a5438c48040ff5
59	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzQwNTI4OCwiaWF0IjoxNzQ2ODAwNDg4LCJqdGkiOiI2NDc4NDAxZTU3NjI0OWQ4OGNmZTNhZTFlYTIyOGI5OCIsInVzZXJfaWQiOjN9.dpeW9RkZuVURuqSJTDZT4mAv1Qi5tvZbiTQ5dwGm48s	2025-05-09 16:21:28.840354+02	2025-05-16 16:21:28+02	3	6478401e576249d88cfe3ae1ea228b98
60	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzYwMzM0MiwiaWF0IjoxNzQ2OTk4NTQyLCJqdGkiOiI5ZTM3MjIwZmMwOWY0ODBjOTIyMGQ5MzUwYWEwOTFkMiIsInVzZXJfaWQiOjN9.sp2_WvBqbO60CChh4UqiGlgQEYDA2_ZYb00rkzqU31s	2025-05-11 23:22:22.734597+02	2025-05-18 23:22:22+02	3	9e37220fc09f480c9220d9350aa091d2
61	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzYwMzM0MiwiaWF0IjoxNzQ2OTk4NTQyLCJqdGkiOiJjNjc3MmU4OGUxMzA0NDUxYWQzZmNkY2Q0MzFkYmQwOSIsInVzZXJfaWQiOjN9.L5qS6wISLG52Bid1YE1GIvuYVFJiJ5-f31wacxX04XU	2025-05-11 23:22:22.75144+02	2025-05-18 23:22:22+02	3	c6772e88e1304451ad3fcdcd431dbd09
62	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzY2MTY5MCwiaWF0IjoxNzQ3MDU2ODkwLCJqdGkiOiI0NjczNzYxMTBlY2M0NzM5OWFiN2NmYjRkNDhiMmQ5ZCIsInVzZXJfaWQiOjN9.UZbds7zsa3GtD3VLiL5EpHagrhHBYFicdeYfSahiBM0	2025-05-12 15:34:50.384238+02	2025-05-19 15:34:50+02	3	467376110ecc47399ab7cfb4d48b2d9d
63	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzY2MTY5MCwiaWF0IjoxNzQ3MDU2ODkwLCJqdGkiOiJkODZjYmQ4ZDQyNTE0NDhmOTVjNDllNTA0Zjk1ZWVmNyIsInVzZXJfaWQiOjN9.VY-I8N7BNxl_g8h-GZXv-VzQlFA4sUmcIfldL0DqNVE	2025-05-12 15:34:50.61829+02	2025-05-19 15:34:50+02	3	d86cbd8d4251448f95c49e504f95eef7
64	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzY2MTY5MCwiaWF0IjoxNzQ3MDU2ODkwLCJqdGkiOiI4OGFkM2U0YTgwZDA0NTJmYmUzY2IxMjc1ZTczNmEzYiIsInVzZXJfaWQiOjN9.Pdb4JZJ60tU3Sy_lmzUsYn2JDqxQw2gZ2j7zTIcHLvA	2025-05-12 15:34:50.690307+02	2025-05-19 15:34:50+02	3	88ad3e4a80d0452fbe3cb1275e736a3b
65	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzY2MTgxMCwiaWF0IjoxNzQ3MDU3MDEwLCJqdGkiOiI1N2NjZjI0MDc0ZTU0YmNlOWIxMjEyZmNjNmI4NDlkMSIsInVzZXJfaWQiOjN9.AdgLRUKhN-jC-CmKQhEctZmjteohZx9JIgtovaXoejM	2025-05-12 15:36:50.09369+02	2025-05-19 15:36:50+02	3	57ccf24074e54bce9b1212fcc6b849d1
66	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzY2MjcyNiwiaWF0IjoxNzQ3MDU3OTI2LCJqdGkiOiJkYjc3MjlkZTIyOGE0ZjIzODY2NmZmOGRiMWViZDQ5YSIsInVzZXJfaWQiOjN9.zE-thl6I7OSJqt71LqmzTpN8zjUhEnPcpXhiNvSa_do	2025-05-12 15:52:06.310009+02	2025-05-19 15:52:06+02	3	db7729de228a4f238666ff8db1ebd49a
67	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzY2Mjk2OCwiaWF0IjoxNzQ3MDU4MTY4LCJqdGkiOiI1N2QzZTU0MzEyOTE0OTZkYWMyNGFmODFhMDk1NzlmYSIsInVzZXJfaWQiOjR9.Eu8_Z5h6PCrgBdGYWJ0bUAN64O9AZrxwsPOGPgJ0KZA	2025-05-12 15:56:08.384562+02	2025-05-19 15:56:08+02	4	57d3e5431291496dac24af81a09579fa
68	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzY2MzA0MywiaWF0IjoxNzQ3MDU4MjQzLCJqdGkiOiJjZTZhYTY0NjJmZjY0N2UyOTY4ZjY1NTUwY2ZkNGNkMiIsInVzZXJfaWQiOjR9.9UJZ_u0lCFzpHI173VOZGvR82HArCoyhAndhZBCTh1U	2025-05-12 15:57:23.571798+02	2025-05-19 15:57:23+02	4	ce6aa6462ff647e2968f65550cfd4cd2
69	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzY2MzEyNywiaWF0IjoxNzQ3MDU4MzI3LCJqdGkiOiJkOWUzZDQ3OGUwYzM0NTAzYWQ1YjczNTc4MmM3Y2RmOSIsInVzZXJfaWQiOjN9.nG0rriF5gh5JjVn7EvtaWkxnBrv4yUuJmdco7JCsAmI	2025-05-12 15:58:47.763677+02	2025-05-19 15:58:47+02	3	d9e3d478e0c34503ad5b735782c7cdf9
70	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzY2MzE0MywiaWF0IjoxNzQ3MDU4MzQzLCJqdGkiOiJiZDE4YjBhMDM5MDg0N2Q4YWNhYjM0ODM4NTBhOWQxMyIsInVzZXJfaWQiOjN9.qIhUm2Sdry2nU67YaVT0dQV9O2pNLkLVj1_2Y6UwBo8	2025-05-12 15:59:03.739455+02	2025-05-19 15:59:03+02	3	bd18b0a0390847d8acab3483850a9d13
71	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzY2NDM0MiwiaWF0IjoxNzQ3MDU5NTQyLCJqdGkiOiI2ZTgzOWE5YmYzOGQ0YzM3YmQyNDVmN2U3MTU0ZmQwZCIsInVzZXJfaWQiOjR9.loKsEW-kQaftBwBLezfu3Ld6qk0KwiMQ-gXTeBpo5_4	2025-05-12 16:19:02.584467+02	2025-05-19 16:19:02+02	4	6e839a9bf38d4c37bd245f7e7154fd0d
72	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzY2NDM4NSwiaWF0IjoxNzQ3MDU5NTg1LCJqdGkiOiI1OWI1NjI2NjUxZGE0MWEzOTRhZTcwMmY0OGQ0OGU3NCIsInVzZXJfaWQiOjN9.SomaHGWnI2ad0heNo4gSg5xyvzGREUivEZNzO5xfoRo	2025-05-12 16:19:45.661773+02	2025-05-19 16:19:45+02	3	59b5626651da41a394ae702f48d48e74
73	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzY2NTM4MCwiaWF0IjoxNzQ3MDYwNTgwLCJqdGkiOiIwOTI2MzI0YTBhODk0Yjk1YmU2ZmFmMDA0ZTExNDE3ZSIsInVzZXJfaWQiOjR9.MqXeRyU3kHJVhBb1sfO-jqpl-0Y_r5PegXbNIHjU0QM	2025-05-12 16:36:20.026392+02	2025-05-19 16:36:20+02	4	0926324a0a894b95be6faf004e11417e
74	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzY2NTM5MywiaWF0IjoxNzQ3MDYwNTkzLCJqdGkiOiJmOWI0ZGZjNzZjYjQ0OTMyYTE5Zjc0YWVjMjUzZmI0YyIsInVzZXJfaWQiOjN9.N6REZkx_G8MJyHCVr8HSpbJNZuNXgkt_S-2b49evf8k	2025-05-12 16:36:33.34874+02	2025-05-19 16:36:33+02	3	f9b4dfc76cb44932a19f74aec253fb4c
75	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzY2NTQ0NCwiaWF0IjoxNzQ3MDYwNjQ0LCJqdGkiOiI4Yjc1YzgzNWVhMzY0OTdhODg5YzIzMTFhYjIxNzA5OSIsInVzZXJfaWQiOjN9.NolOZHTzC_67c3dlzDZm-6KO8leW2iDA1Kjf9pPZlgU	2025-05-12 16:37:24.813966+02	2025-05-19 16:37:24+02	3	8b75c835ea36497a889c2311ab217099
76	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzY2NjY0MSwiaWF0IjoxNzQ3MDYxODQxLCJqdGkiOiIwOTY3M2YzOTMyZDU0ZGU5ODU0M2QzNmJlODA1ZDZlNCIsInVzZXJfaWQiOjN9.XFEmWD5u_Lrng3aPCJQaBHrdS57J5p8z6fhqXqe4jZc	2025-05-12 16:57:21.244146+02	2025-05-19 16:57:21+02	3	09673f3932d54de98543d36be805d6e4
77	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzY2ODYxNCwiaWF0IjoxNzQ3MDYzODE0LCJqdGkiOiJkNjdkYTdkMGVkYTI0OWE1OTg0ZGMyOTEwODAxNDczMSIsInVzZXJfaWQiOjN9.0JUyKUnfDiEpNdNYrroRPKs8G-VouLAVj7Wg82WvvoU	2025-05-12 17:30:14.828073+02	2025-05-19 17:30:14+02	3	d67da7d0eda249a5984dc29108014731
78	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzY2ODY1NSwiaWF0IjoxNzQ3MDYzODU1LCJqdGkiOiJjNmIxNTg4ZWNlODA0MDM1OGVlYzExMGQ0MmY3MmE4NiIsInVzZXJfaWQiOjR9.b39T6OIFX3bMQNKikSDplA6qWWy176_725E9Iy2x7Cc	2025-05-12 17:30:55.326579+02	2025-05-19 17:30:55+02	4	c6b1588ece8040358eec110d42f72a86
79	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzY4MTU0OCwiaWF0IjoxNzQ3MDc2NzQ4LCJqdGkiOiI0YjEwYmM3YmQwMDM0MWYxOWEyOTYwNDkzMDFiMzMwMCIsInVzZXJfaWQiOjN9.EV6RXl9EjdiuKtMll30lRs97M7x6hFcxMt7QHBPKidI	2025-05-12 21:05:48.580754+02	2025-05-19 21:05:48+02	3	4b10bc7bd00341f19a296049301b3300
80	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzY4NTIwNSwiaWF0IjoxNzQ3MDgwNDA1LCJqdGkiOiIxZmNlZjcyMDI5ZTY0MmUzYjk2NjJmNzk4YmViMzRiNSIsInVzZXJfaWQiOjN9.YxTA_ckmYhoMwQ4xa6zMjnrIrcRA3weas3axEUzotyQ	2025-05-12 22:06:45.528933+02	2025-05-19 22:06:45+02	3	1fcef72029e642e3b9662f798beb34b5
81	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzY4NjgwMCwiaWF0IjoxNzQ3MDgyMDAwLCJqdGkiOiJkMjEyY2ZkYjUyMWE0YmM3OTIyZmE3N2FhODFiZTA4OCIsInVzZXJfaWQiOjN9.yLyilFg3s1wjOasAMQfWUAF8gr2_vVRB3nAm8DP4NW0	2025-05-12 22:33:20.157381+02	2025-05-19 22:33:20+02	3	d212cfdb521a4bc7922fa77aa81be088
82	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzY4NjkwMiwiaWF0IjoxNzQ3MDgyMTAyLCJqdGkiOiI4MGI5NzAyYjA5ZDM0YzA0OGNmNmE3ZGE4NjgxYzJlMSIsInVzZXJfaWQiOjR9.Rkdo3j3KhJTvmcrjpeq9GYZx1ehrGqtaCVNTfZr7YWA	2025-05-12 22:35:02.762512+02	2025-05-19 22:35:02+02	4	80b9702b09d34c048cf6a7da8681c2e1
83	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzY4Nzk0OCwiaWF0IjoxNzQ3MDgzMTQ4LCJqdGkiOiI2OTgyMzM3NDYzM2I0OTQ0YWM4ZmZkZTE2MGQwYzgwYyIsInVzZXJfaWQiOjN9.Z8l68ZkkO9T3rMq3qCwNxjU54jsCuuK8SeMMoW8RH1Q	2025-05-12 22:52:28.849054+02	2025-05-19 22:52:28+02	3	69823374633b4944ac8ffde160d0c80c
84	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzY4ODA3MSwiaWF0IjoxNzQ3MDgzMjcxLCJqdGkiOiJmZjNlNjQwZTMyNmU0MDY0OWQwNjI0ZjkzNTgxMTI0YyIsInVzZXJfaWQiOjR9.76OgA3jba8NisUN6fUB_YFEr4F61RtHRw63Pqghy81A	2025-05-12 22:54:31.529187+02	2025-05-19 22:54:31+02	4	ff3e640e326e40649d0624f93581124c
85	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzY4ODEzMiwiaWF0IjoxNzQ3MDgzMzMyLCJqdGkiOiIyNTAwNjc1Y2U3NGQ0MTkxYTMzOTZjMTI4OTAzMWIwZSIsInVzZXJfaWQiOjN9.FFs1ZOHIL9Vp2XA3BmUyLInnIpZI7ks4tDD59k44q08	2025-05-12 22:55:32.711758+02	2025-05-19 22:55:32+02	3	2500675ce74d4191a3396c1289031b0e
86	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzY4OTIyOSwiaWF0IjoxNzQ3MDg0NDI5LCJqdGkiOiI4OTQwMmJlZjI2MDg0Nzc4YjJjMTE0ZjRmYzhiZDcwNiIsInVzZXJfaWQiOjN9.9PrWeHd38WeSua8fhSbiA_qxEFKGnflIowXLBS4iLIQ	2025-05-12 23:13:49.914758+02	2025-05-19 23:13:49+02	3	89402bef26084778b2c114f4fc8bd706
87	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzY4OTM1NSwiaWF0IjoxNzQ3MDg0NTU1LCJqdGkiOiI3MGRhNGFlODFiNzI0NTJhOTE4NWMxOGVkMDRiZDExYyIsInVzZXJfaWQiOjR9.Ckw__KSewVj38Ba9LIQ6Ty4F59fUC_u0uVln6JSbP6w	2025-05-12 23:15:55.86477+02	2025-05-19 23:15:55+02	4	70da4ae81b72452a9185c18ed04bd11c
88	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzcyNzIyOSwiaWF0IjoxNzQ3MTIyNDI5LCJqdGkiOiI0NDdhMWJhMzk0NDM0NWFlOGZlMDU5ZWFiNjk1MzY2NyIsInVzZXJfaWQiOjN9.wWx2kd-RjsBNpzPmQZAvHmqPh8PZ9jKqxnCOJgV2WgU	2025-05-13 09:47:09.404275+02	2025-05-20 09:47:09+02	3	447a1ba3944345ae8fe059eab6953667
89	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzczMzAwOSwiaWF0IjoxNzQ3MTI4MjA5LCJqdGkiOiJkN2QzZThhNTQ3N2Y0ODRkOTJmNWJiZTk5ZjlkODBlMyIsInVzZXJfaWQiOjN9.fLpim28lR1kTHntT4PbWMQRkYf1Iq-1TTTavXQm44Vg	2025-05-13 11:23:29.482927+02	2025-05-20 11:23:29+02	3	d7d3e8a5477f484d92f5bbe99f9d80e3
90	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzczMzExMCwiaWF0IjoxNzQ3MTI4MzEwLCJqdGkiOiI0NGM4Zjk4NzRiMGY0MWYyODc1YWYzZWEzMjgxZDA4ZSIsInVzZXJfaWQiOjR9.JPOFc05p3JPcyG17mPZFtJnEtI4T58HL7KwM385NwBc	2025-05-13 11:25:10.279139+02	2025-05-20 11:25:10+02	4	44c8f9874b0f41f2875af3ea3281d08e
91	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzkyNzY5NSwiaWF0IjoxNzQ3MzIyODk1LCJqdGkiOiI5ZjIzY2E2YjRmMmI0YjU4YjY5MjE1N2Y4ZjM4NDcxZCIsInVzZXJfaWQiOjR9.pvrdHxC939PS_gOflK7a0FkYIqiv7rFzP7qXGNH7UmE	2025-05-15 17:28:15.659039+02	2025-05-22 17:28:15+02	4	9f23ca6b4f2b4b58b692157f8f38471d
92	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0NzkyNzc0OCwiaWF0IjoxNzQ3MzIyOTQ4LCJqdGkiOiJhN2VlMWVhY2JlOWI0MDJhOGFlYTFiOWQxMTIyMDNiYSIsInVzZXJfaWQiOjR9.zpBne6lGOR3MZOTh2WndYFQkITERye9M_UuRKziwFTQ	2025-05-15 17:29:08.870529+02	2025-05-22 17:29:08+02	4	a7ee1eacbe9b402a8aea1b9d112203ba
93	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1MDE5MTk0NywiaWF0IjoxNzQ5NTg3MTQ3LCJqdGkiOiJlNmE2NzcxYzJjODE0YjMxYjI5MDNiNjM4N2E4NmJhMCIsInVzZXJfaWQiOjR9.l3keX-8cFDI01njSVLU6gSPQulpjRMpX0Dwg0xax4EE	2025-06-10 22:25:47.162551+02	2025-06-17 22:25:47+02	4	e6a6771c2c814b31b2903b6387a86ba0
94	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1MDE5MjAyOCwiaWF0IjoxNzQ5NTg3MjI4LCJqdGkiOiI3OWJkZDE0MjMxNTI0NGI5OWM5ZDJiNmExYzljNWE2YiIsInVzZXJfaWQiOjR9.5KijGu1sjZ1eMzCT8yb05Ns4IDproFZvgYkCBSNrpwg	2025-06-10 22:27:08.812574+02	2025-06-17 22:27:08+02	4	79bdd142315244b99c9d2b6a1c9c5a6b
95	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1MDE5MjIzNiwiaWF0IjoxNzQ5NTg3NDM2LCJqdGkiOiIzMDc0ZDdjZWI1NGU0MzZlOGVjZGRhYTk2YjhhODkxNSIsInVzZXJfaWQiOjV9.8riTm-VSeKtBebJf1kdZwSzCZpN0HLkOWtNew8SxTro	2025-06-10 22:30:36.711127+02	2025-06-17 22:30:36+02	5	3074d7ceb54e436e8ecddaa96b8a8915
96	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1MDI2NDMwNSwiaWF0IjoxNzQ5NjU5NTA1LCJqdGkiOiI1YmMzNmVmY2Q4YTc0MDI2YWRkOTAyZTdkOTBmNGM0NCIsInVzZXJfaWQiOjR9._xHabYQsXPhYfiEfkg3hLZFohyZDy-O1VvJ4vaK-T4k	2025-06-11 18:31:45.242489+02	2025-06-18 18:31:45+02	4	5bc36efcd8a74026add902e7d90f4c44
97	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1MDI2NDkxMCwiaWF0IjoxNzQ5NjYwMTEwLCJqdGkiOiIyZjk1Nzk2MjQ0MmI0ZmIwYjE2MmE0YzgyMjYxMDg2OSIsInVzZXJfaWQiOjR9.Gh_A6nBRb5RAXPG_-AOzISKosqeAK-RxeJSLOGTul70	2025-06-11 18:41:50.837922+02	2025-06-18 18:41:50+02	4	2f957962442b4fb0b162a4c822610869
98	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1MDMzNjU5NiwiaWF0IjoxNzQ5NzMxNzk2LCJqdGkiOiI0Mjg3Yjk3MjY4YWM0MzYzYmIwOGVhNzg4MjQ0MzNiZiIsInVzZXJfaWQiOjR9.4w2awyjj9cjlKFycZpuGdc-4zSHPzn2LOmFQBAZHkq4	2025-06-12 14:36:36.61931+02	2025-06-19 14:36:36+02	4	4287b97268ac4363bb08ea78824433bf
99	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1MDMzNjcxNiwiaWF0IjoxNzQ5NzMxOTE2LCJqdGkiOiJhYmU0NTZiMjFjZTA0MGQwOTU2MTIwZWJmYzZkOGI0NiIsInVzZXJfaWQiOjR9.8mqG2tu-Ei-cHKdVQzht9fYy0WJ-tubwzG3Cseg2JZk	2025-06-12 14:38:36.895944+02	2025-06-19 14:38:36+02	4	abe456b21ce040d0956120ebfc6d8b46
100	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1MDM0ODUyNCwiaWF0IjoxNzQ5NzQzNzI0LCJqdGkiOiIwYzNiNmUyMDQ3MjA0ODc4OTI5MzI1ZTU3ZmU5YjNlMyIsInVzZXJfaWQiOjN9.gFz62HFuG88bHWVdpxYd0rC0CEP_w_Zsgg8ReiN8r-4	2025-06-12 17:55:24.181544+02	2025-06-19 17:55:24+02	3	0c3b6e2047204878929325e57fe9b3e3
101	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1MDM0ODU0NSwiaWF0IjoxNzQ5NzQzNzQ1LCJqdGkiOiJkMWRhZGQ1NTk1NGU0ZTI2YTI0OTRkYmUwY2RjZjhlNSIsInVzZXJfaWQiOjR9.NLoL2h45HL2JskxXDcaRkKxyKHDSaOIEh0RvoIwjlUo	2025-06-12 17:55:45.387808+02	2025-06-19 17:55:45+02	4	d1dadd55954e4e26a2494dbe0cdcf8e5
102	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1MDM0ODU2MywiaWF0IjoxNzQ5NzQzNzYzLCJqdGkiOiIwOGIxYjcwYWEyYTY0MDUxYmE5Y2JhMGI5NDExODcxZCIsInVzZXJfaWQiOjN9.A0MamtlKdNKxdBKjh7ZbLAh-VDf60XcGe7iOp0KCQ1Q	2025-06-12 17:56:03.760268+02	2025-06-19 17:56:03+02	3	08b1b70aa2a64051ba9cba0b9411871d
103	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1MDM0ODY5OCwiaWF0IjoxNzQ5NzQzODk4LCJqdGkiOiIxODc5OTc1NjdhZjA0NWFkOGY3ZWQxYTdkOTU1ZjI3MCIsInVzZXJfaWQiOjN9.K-3HMinvQg4IEuAHzvl16lBQsQjuLX1PjxKy6vHMo8E	2025-06-12 17:58:18.845139+02	2025-06-19 17:58:18+02	3	187997567af045ad8f7ed1a7d955f270
104	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1MDM2MDg5NSwiaWF0IjoxNzQ5NzU2MDk1LCJqdGkiOiI4ZWFkNThjYTViZjQ0MDcwOGVhYjRiMDNjMzdhOTg3OCIsInVzZXJfaWQiOjN9.A1-h3-ZnEqYViOiiMhUtaffVLT4R3yLEvLVw3lxzlmg	2025-06-12 21:21:35.502373+02	2025-06-19 21:21:35+02	3	8ead58ca5bf440708eab4b03c37a9878
105	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1MDM2MDkxOCwiaWF0IjoxNzQ5NzU2MTE4LCJqdGkiOiJjNzQ5MzYyODk2NTg0OWMyYjliZmVkYWIyYjdiMWQyZSIsInVzZXJfaWQiOjR9.ANCyJXkfy8vkvkxKgzQSFWkZbBu7sc01r4GoT72XzwA	2025-06-12 21:21:58.192657+02	2025-06-19 21:21:58+02	4	c7493628965849c2b9bfedab2b7b1d2e
106	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1MDM2MjAxNCwiaWF0IjoxNzQ5NzU3MjE0LCJqdGkiOiI5OTQ1ODVlNTRmYjA0MzUwYmU4MTZhZTNhMmFiOGFiZiIsInVzZXJfaWQiOjN9.InLsEVWQwda3ojOOOmcQKWT2JOTOXcxWYCGVYrtXzRI	2025-06-12 21:40:14.692432+02	2025-06-19 21:40:14+02	3	994585e54fb04350be816ae3a2ab8abf
107	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1MDM2MjA3MSwiaWF0IjoxNzQ5NzU3MjcxLCJqdGkiOiI0MThkYWRiNmIxNjQ0NTUxODE4NDZmMDhmZDM4NjEwNCIsInVzZXJfaWQiOjR9.rHFJeq8XgXQt38j2AQlOmBEQ0kIsdkUKRxYxJpJ8mCE	2025-06-12 21:41:11.427147+02	2025-06-19 21:41:11+02	4	418dadb6b164455181846f08fd386104
108	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1MDM2MjUzNSwiaWF0IjoxNzQ5NzU3NzM1LCJqdGkiOiI2Y2MxNWE3ZWEwMjE0NWE4OTRjMDgzNjljNDhiNDg0MSIsInVzZXJfaWQiOjR9.Km87sNwfTwmt1WB3ab9KSso2vV3WtLFIVQ18Pw7oby0	2025-06-12 21:48:55.631008+02	2025-06-19 21:48:55+02	4	6cc15a7ea02145a894c08369c48b4841
109	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1MDM2MzQyNiwiaWF0IjoxNzQ5NzU4NjI2LCJqdGkiOiI4MjAyNGMzZjZmZmM0MzdhOTgwMGFlMzk3NDVjM2YxZSIsInVzZXJfaWQiOjR9.c-oHQbDBwBlk0RGM5BiaS3e4ATBWGRA_XqCLNnwkQUA	2025-06-12 22:03:46.695566+02	2025-06-19 22:03:46+02	4	82024c3f6ffc437a9800ae39745c3f1e
110	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1MDM2OTgzMSwiaWF0IjoxNzQ5NzY1MDMxLCJqdGkiOiJkZWVhYjkwZDFiNjk0YjJlYWQzYTdlOTRhY2M4ZWM0NyIsInVzZXJfaWQiOjN9.13WSbqvlsVW9nXKvg0qsoeidBKmSWSkk3ukPIEhxjjk	2025-06-12 23:50:31.067763+02	2025-06-19 23:50:31+02	3	deeab90d1b694b2ead3a7e94acc8ec47
111	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1MDM2OTg3OSwiaWF0IjoxNzQ5NzY1MDc5LCJqdGkiOiJiYzQyMzEwZDMxNzE0YzI4YTMwZGNkYjM5MzgxYmExYSIsInVzZXJfaWQiOjR9.r8OQZU4U6RaY7zQQh816_TBU7YNpGh-gt6p-vdZxmtM	2025-06-12 23:51:19.290527+02	2025-06-19 23:51:19+02	4	bc42310d31714c28a30dcdb39381ba1a
112	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1MDQwOTE0MSwiaWF0IjoxNzQ5ODA0MzQxLCJqdGkiOiI5NjYyYTQxYTYwZTU0YzEwYjEyNTM4NmNiN2I5Y2Q0NiIsInVzZXJfaWQiOjN9.JBi1BQmxtxNQP5h1tgzLU6A379_qVx-79tQaEjm3NKs	2025-06-13 10:45:41.482974+02	2025-06-20 10:45:41+02	3	9662a41a60e54c10b125386cb7b9cd46
113	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1MDQwOTI4OSwiaWF0IjoxNzQ5ODA0NDg5LCJqdGkiOiJiMzkwM2E3OWE1NWM0ZDQ5OTg3N2YwZDA0YzQzYjdmZSIsInVzZXJfaWQiOjR9.7vLBdy2QwJ0lwZQKqUXVaxk9ZKP2ajkzpuNA0wav-IA	2025-06-13 10:48:09.967133+02	2025-06-20 10:48:09+02	4	b3903a79a55c4d499877f0d04c43b7fe
114	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc1MDQwOTM2NywiaWF0IjoxNzQ5ODA0NTY3LCJqdGkiOiI1YTUwY2FiYzJjYmU0MmM2OTE1MGY5MDI5MWFkMzAxOSIsInVzZXJfaWQiOjN9.lStdEwMfXvBu28L9potmvp1SzMvKbPRmx_1MtdihKQA	2025-06-13 10:49:27.300737+02	2025-06-20 10:49:27+02	3	5a50cabc2cbe42c69150f90291ad3019
\.


--
-- Data for Name: users_passwordresettoken; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_passwordresettoken (id, token, created_at, expires_at, user_id) FROM stdin;
\.


--
-- Data for Name: users_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_user (id, last_login, is_superuser, username, email, password, is_staff, is_active, created_at) FROM stdin;
1	\N	f	fleuris	test@gmail.com	pbkdf2_sha256$1000000$9EoNyZ4ojpxmElBo3mkVIm$uyStFMwZAyUuW9mT5rEmNrSlTlJCvB0lO83+fjcEvpc=	f	t	2025-05-05 18:20:53.704473+02
2	\N	f	William	Mobutu@gmail.com	pbkdf2_sha256$1000000$mCx0wqrOoJWqaaUtEfayi2$dPf/WZHCX+isISbpMBzW/bZkeFU6nLS5UBokN8V+gNc=	f	t	2025-05-05 18:21:49.173555+02
4	\N	f	wpltc2	wplantec2@gmail.com	pbkdf2_sha256$1000000$IFyFhfYLWeb6iiRz91NiSe$5ZA91p/X9tSiEQZpPBIEtyjEij/A7PUNzhRJq27RMMg=	t	t	2025-05-06 10:44:50.74677+02
5	\N	f	Plantest	Plantest@gmail.com	pbkdf2_sha256$1000000$EEWjNlcXGPYehD7uPyVT0g$BkWLeeh62hL8vMxtleq4iLnjPjM669tcDgCeV1HyY/Q=	f	t	2025-06-10 22:30:36.679047+02
3	\N	f	wpltc	wplantec@gmail.com	pbkdf2_sha256$1000000$5GHn0qsUOlYMKFC67vkCzO$Dj0gT62rKNky7mMQD8gT++prtK3QIfB7R54Frdvxly4=	f	f	2025-05-06 09:46:19.42967+02
\.


--
-- Data for Name: users_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: users_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


-- Toutes les lignes SELECT pg_catalog.setval ont été supprimées pour compatibilité Docker
-- Les séquences seront gérées automatiquement par PostgreSQL lors de la création des tables


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: posts_comment posts_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts_comment
    ADD CONSTRAINT posts_comment_pkey PRIMARY KEY (id);


--
-- Name: posts_post posts_post_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts_post
    ADD CONSTRAINT posts_post_pkey PRIMARY KEY (id);


--
-- Name: posts_post_tags posts_post_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts_post_tags
    ADD CONSTRAINT posts_post_tags_pkey PRIMARY KEY (id);


--
-- Name: posts_post_tags posts_post_tags_post_id_tag_id_9b9d69ec_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts_post_tags
    ADD CONSTRAINT posts_post_tags_post_id_tag_id_9b9d69ec_uniq UNIQUE (post_id, tag_id);


--
-- Name: posts_reaction posts_reaction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts_reaction
    ADD CONSTRAINT posts_reaction_pkey PRIMARY KEY (id);


--
-- Name: posts_reaction posts_reaction_post_id_user_id_emoji_e692247d_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts_reaction
    ADD CONSTRAINT posts_reaction_post_id_user_id_emoji_e692247d_uniq UNIQUE (post_id, user_id, emoji);


--
-- Name: posts_tag posts_tag_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts_tag
    ADD CONSTRAINT posts_tag_name_key UNIQUE (name);


--
-- Name: posts_tag posts_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts_tag
    ADD CONSTRAINT posts_tag_pkey PRIMARY KEY (id);


--
-- Name: posts_tag posts_tag_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts_tag
    ADD CONSTRAINT posts_tag_slug_key UNIQUE (slug);


--
-- Name: token_blacklist_blacklistedtoken token_blacklist_blacklistedtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.token_blacklist_blacklistedtoken
    ADD CONSTRAINT token_blacklist_blacklistedtoken_pkey PRIMARY KEY (id);


--
-- Name: token_blacklist_blacklistedtoken token_blacklist_blacklistedtoken_token_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.token_blacklist_blacklistedtoken
    ADD CONSTRAINT token_blacklist_blacklistedtoken_token_id_key UNIQUE (token_id);


--
-- Name: token_blacklist_outstandingtoken token_blacklist_outstandingtoken_jti_hex_d9bdf6f7_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.token_blacklist_outstandingtoken
    ADD CONSTRAINT token_blacklist_outstandingtoken_jti_hex_d9bdf6f7_uniq UNIQUE (jti);


--
-- Name: token_blacklist_outstandingtoken token_blacklist_outstandingtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.token_blacklist_outstandingtoken
    ADD CONSTRAINT token_blacklist_outstandingtoken_pkey PRIMARY KEY (id);


--
-- Name: users_passwordresettoken users_passwordresettoken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_passwordresettoken
    ADD CONSTRAINT users_passwordresettoken_pkey PRIMARY KEY (id);


--
-- Name: users_passwordresettoken users_passwordresettoken_token_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_passwordresettoken
    ADD CONSTRAINT users_passwordresettoken_token_key UNIQUE (token);


--
-- Name: users_user users_user_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_email_key UNIQUE (email);


--
-- Name: users_user_groups users_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_pkey PRIMARY KEY (id);


--
-- Name: users_user_groups users_user_groups_user_id_group_id_b88eab82_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_group_id_b88eab82_uniq UNIQUE (user_id, group_id);


--
-- Name: users_user users_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_pkey PRIMARY KEY (id);


--
-- Name: users_user_user_permissions users_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: users_user_user_permissions users_user_user_permissions_user_id_permission_id_43338c45_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_permission_id_43338c45_uniq UNIQUE (user_id, permission_id);


--
-- Name: users_user users_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_username_key UNIQUE (username);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: posts_comment_author_id_795e4d12; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX posts_comment_author_id_795e4d12 ON public.posts_comment USING btree (author_id);


--
-- Name: posts_comment_post_id_e81436d7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX posts_comment_post_id_e81436d7 ON public.posts_comment USING btree (post_id);


--
-- Name: posts_post_author_id_fe5487bf; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX posts_post_author_id_fe5487bf ON public.posts_post USING btree (author_id);


--
-- Name: posts_post_tags_post_id_1f164920; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX posts_post_tags_post_id_1f164920 ON public.posts_post_tags USING btree (post_id);


--
-- Name: posts_post_tags_tag_id_0743d52e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX posts_post_tags_tag_id_0743d52e ON public.posts_post_tags USING btree (tag_id);


--
-- Name: posts_reaction_post_id_897f4c69; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX posts_reaction_post_id_897f4c69 ON public.posts_reaction USING btree (post_id);


--
-- Name: posts_reaction_user_id_286f6cba; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX posts_reaction_user_id_286f6cba ON public.posts_reaction USING btree (user_id);


--
-- Name: posts_tag_name_70364ab3_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX posts_tag_name_70364ab3_like ON public.posts_tag USING btree (name varchar_pattern_ops);


--
-- Name: posts_tag_slug_922693a6_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX posts_tag_slug_922693a6_like ON public.posts_tag USING btree (slug varchar_pattern_ops);


--
-- Name: token_blacklist_outstandingtoken_jti_hex_d9bdf6f7_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX token_blacklist_outstandingtoken_jti_hex_d9bdf6f7_like ON public.token_blacklist_outstandingtoken USING btree (jti varchar_pattern_ops);


--
-- Name: token_blacklist_outstandingtoken_user_id_83bc629a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX token_blacklist_outstandingtoken_user_id_83bc629a ON public.token_blacklist_outstandingtoken USING btree (user_id);


--
-- Name: users_passwordresettoken_token_8e777b0e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_passwordresettoken_token_8e777b0e_like ON public.users_passwordresettoken USING btree (token varchar_pattern_ops);


--
-- Name: users_passwordresettoken_user_id_2355945a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_passwordresettoken_user_id_2355945a ON public.users_passwordresettoken USING btree (user_id);


--
-- Name: users_user_email_243f6e77_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_user_email_243f6e77_like ON public.users_user USING btree (email varchar_pattern_ops);


--
-- Name: users_user_groups_group_id_9afc8d0e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_user_groups_group_id_9afc8d0e ON public.users_user_groups USING btree (group_id);


--
-- Name: users_user_groups_user_id_5f6f5a90; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_user_groups_user_id_5f6f5a90 ON public.users_user_groups USING btree (user_id);


--
-- Name: users_user_user_permissions_permission_id_0b93982e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_user_user_permissions_permission_id_0b93982e ON public.users_user_user_permissions USING btree (permission_id);


--
-- Name: users_user_user_permissions_user_id_20aca447; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_user_user_permissions_user_id_20aca447 ON public.users_user_user_permissions USING btree (user_id);


--
-- Name: users_user_username_06e46fe6_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_user_username_06e46fe6_like ON public.users_user USING btree (username varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: posts_comment posts_comment_author_id_795e4d12_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts_comment
    ADD CONSTRAINT posts_comment_author_id_795e4d12_fk_users_user_id FOREIGN KEY (author_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: posts_comment posts_comment_post_id_e81436d7_fk_posts_post_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts_comment
    ADD CONSTRAINT posts_comment_post_id_e81436d7_fk_posts_post_id FOREIGN KEY (post_id) REFERENCES public.posts_post(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: posts_post posts_post_author_id_fe5487bf_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts_post
    ADD CONSTRAINT posts_post_author_id_fe5487bf_fk_users_user_id FOREIGN KEY (author_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: posts_post_tags posts_post_tags_post_id_1f164920_fk_posts_post_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts_post_tags
    ADD CONSTRAINT posts_post_tags_post_id_1f164920_fk_posts_post_id FOREIGN KEY (post_id) REFERENCES public.posts_post(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: posts_post_tags posts_post_tags_tag_id_0743d52e_fk_posts_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts_post_tags
    ADD CONSTRAINT posts_post_tags_tag_id_0743d52e_fk_posts_tag_id FOREIGN KEY (tag_id) REFERENCES public.posts_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: posts_reaction posts_reaction_post_id_897f4c69_fk_posts_post_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts_reaction
    ADD CONSTRAINT posts_reaction_post_id_897f4c69_fk_posts_post_id FOREIGN KEY (post_id) REFERENCES public.posts_post(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: posts_reaction posts_reaction_user_id_286f6cba_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts_reaction
    ADD CONSTRAINT posts_reaction_user_id_286f6cba_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: token_blacklist_blacklistedtoken token_blacklist_blacklistedtoken_token_id_3cc7fe56_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.token_blacklist_blacklistedtoken
    ADD CONSTRAINT token_blacklist_blacklistedtoken_token_id_3cc7fe56_fk FOREIGN KEY (token_id) REFERENCES public.token_blacklist_outstandingtoken(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: token_blacklist_outstandingtoken token_blacklist_outs_user_id_83bc629a_fk_users_use; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.token_blacklist_outstandingtoken
    ADD CONSTRAINT token_blacklist_outs_user_id_83bc629a_fk_users_use FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_passwordresettoken users_passwordresettoken_user_id_2355945a_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_passwordresettoken
    ADD CONSTRAINT users_passwordresettoken_user_id_2355945a_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_groups users_user_groups_group_id_9afc8d0e_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_group_id_9afc8d0e_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_groups users_user_groups_user_id_5f6f5a90_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_5f6f5a90_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_user_permissions users_user_user_perm_permission_id_0b93982e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_perm_permission_id_0b93982e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_user_permissions users_user_user_permissions_user_id_20aca447_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_20aca447_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

--
-- Correction auto-incrémentation des colonnes id (ajouté pour compatibilité Docker)
--

