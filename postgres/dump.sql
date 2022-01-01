--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

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
-- Name: AddressInvoices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "AddressInvoices" (
    "Address" text NOT NULL,
    "InvoiceDataId" text,
    "CreatedTime" timestamp with time zone
);


ALTER TABLE "AddressInvoices" OWNER TO postgres;

--
-- Name: ApiKeys; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "ApiKeys" (
    "Id" character varying(50) NOT NULL,
    "StoreId" character varying(50),
    "Type" integer DEFAULT 0 NOT NULL,
    "UserId" character varying(50),
    "Label" text,
    "Blob" bytea
);


ALTER TABLE "ApiKeys" OWNER TO postgres;

--
-- Name: Apps; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Apps" (
    "Id" text NOT NULL,
    "AppType" text,
    "Created" timestamp with time zone NOT NULL,
    "Name" text,
    "Settings" text,
    "StoreDataId" text,
    "TagAllInvoices" boolean DEFAULT false NOT NULL
);


ALTER TABLE "Apps" OWNER TO postgres;

--
-- Name: AspNetRoleClaims; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "AspNetRoleClaims" (
    "Id" integer NOT NULL,
    "ClaimType" text,
    "ClaimValue" text,
    "RoleId" text NOT NULL
);


ALTER TABLE "AspNetRoleClaims" OWNER TO postgres;

--
-- Name: AspNetRoles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "AspNetRoles" (
    "Id" text NOT NULL,
    "ConcurrencyStamp" text,
    "Name" character varying(256),
    "NormalizedName" character varying(256)
);


ALTER TABLE "AspNetRoles" OWNER TO postgres;

--
-- Name: AspNetUserClaims; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "AspNetUserClaims" (
    "Id" integer NOT NULL,
    "ClaimType" text,
    "ClaimValue" text,
    "UserId" text NOT NULL
);


ALTER TABLE "AspNetUserClaims" OWNER TO postgres;

--
-- Name: AspNetUserLogins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "AspNetUserLogins" (
    "LoginProvider" character varying(255) NOT NULL,
    "ProviderKey" character varying(255) NOT NULL,
    "ProviderDisplayName" text,
    "UserId" text NOT NULL
);


ALTER TABLE "AspNetUserLogins" OWNER TO postgres;

--
-- Name: AspNetUserRoles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "AspNetUserRoles" (
    "UserId" text NOT NULL,
    "RoleId" text NOT NULL
);


ALTER TABLE "AspNetUserRoles" OWNER TO postgres;

--
-- Name: AspNetUserTokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "AspNetUserTokens" (
    "UserId" text NOT NULL,
    "LoginProvider" character varying(64) NOT NULL,
    "Name" character varying(64) NOT NULL,
    "Value" text
);


ALTER TABLE "AspNetUserTokens" OWNER TO postgres;

--
-- Name: AspNetUsers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "AspNetUsers" (
    "Id" text NOT NULL,
    "AccessFailedCount" integer NOT NULL,
    "ConcurrencyStamp" text,
    "Email" character varying(256),
    "EmailConfirmed" boolean NOT NULL,
    "LockoutEnabled" boolean NOT NULL,
    "LockoutEnd" timestamp with time zone,
    "NormalizedEmail" character varying(256),
    "NormalizedUserName" character varying(256),
    "PasswordHash" text,
    "PhoneNumber" text,
    "PhoneNumberConfirmed" boolean NOT NULL,
    "SecurityStamp" text,
    "TwoFactorEnabled" boolean NOT NULL,
    "UserName" character varying(256),
    "RequiresEmailConfirmation" boolean DEFAULT false NOT NULL,
    "Created" timestamp with time zone,
    "DisabledNotifications" text
);


ALTER TABLE "AspNetUsers" OWNER TO postgres;

--
-- Name: Fido2Credentials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Fido2Credentials" (
    "Id" text NOT NULL,
    "Name" text,
    "ApplicationUserId" text,
    "Blob" bytea,
    "Type" integer NOT NULL
);


ALTER TABLE "Fido2Credentials" OWNER TO postgres;

--
-- Name: Files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Files" (
    "Id" text NOT NULL,
    "FileName" text,
    "StorageFileName" text,
    "Timestamp" timestamp without time zone NOT NULL,
    "ApplicationUserId" text
);


ALTER TABLE "Files" OWNER TO postgres;

--
-- Name: HistoricalAddressInvoices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "HistoricalAddressInvoices" (
    "InvoiceDataId" text NOT NULL,
    "Address" text NOT NULL,
    "Assigned" timestamp with time zone NOT NULL,
    "UnAssigned" timestamp with time zone,
    "CryptoCode" text
);


ALTER TABLE "HistoricalAddressInvoices" OWNER TO postgres;

--
-- Name: InvoiceEvents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "InvoiceEvents" (
    "InvoiceDataId" text NOT NULL,
    "UniqueId" text NOT NULL,
    "Message" text,
    "Timestamp" timestamp with time zone NOT NULL,
    "Severity" integer DEFAULT 0 NOT NULL
);


ALTER TABLE "InvoiceEvents" OWNER TO postgres;

--
-- Name: InvoiceSearches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "InvoiceSearches" (
    "Id" integer NOT NULL,
    "InvoiceDataId" character varying(255),
    "Value" character varying(512)
);


ALTER TABLE "InvoiceSearches" OWNER TO postgres;

--
-- Name: InvoiceSearches_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "InvoiceSearches_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "InvoiceSearches_Id_seq" OWNER TO postgres;

--
-- Name: InvoiceSearches_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "InvoiceSearches_Id_seq" OWNED BY "InvoiceSearches"."Id";


--
-- Name: InvoiceWebhookDeliveries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "InvoiceWebhookDeliveries" (
    "InvoiceId" character varying(255) NOT NULL,
    "DeliveryId" character varying(100) NOT NULL
);


ALTER TABLE "InvoiceWebhookDeliveries" OWNER TO postgres;

--
-- Name: Invoices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Invoices" (
    "Id" text NOT NULL,
    "Blob" bytea,
    "Created" timestamp with time zone NOT NULL,
    "CustomerEmail" text,
    "ExceptionStatus" text,
    "ItemCode" text,
    "OrderId" character varying(100),
    "Status" text,
    "StoreDataId" text,
    "Archived" boolean DEFAULT false NOT NULL,
    "CurrentRefundId" text
);


ALTER TABLE "Invoices" OWNER TO postgres;

--
-- Name: Notifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Notifications" (
    "Id" character varying(36) NOT NULL,
    "Created" timestamp with time zone NOT NULL,
    "ApplicationUserId" character varying(50) NOT NULL,
    "NotificationType" character varying(100) NOT NULL,
    "Seen" boolean NOT NULL,
    "Blob" bytea
);


ALTER TABLE "Notifications" OWNER TO postgres;

--
-- Name: OffchainTransactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "OffchainTransactions" (
    "Id" character varying(64) NOT NULL,
    "Blob" bytea
);


ALTER TABLE "OffchainTransactions" OWNER TO postgres;

--
-- Name: PairedSINData; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "PairedSINData" (
    "Id" text NOT NULL,
    "Label" text,
    "PairingTime" timestamp with time zone NOT NULL,
    "SIN" text,
    "StoreDataId" text
);


ALTER TABLE "PairedSINData" OWNER TO postgres;

--
-- Name: PairingCodes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "PairingCodes" (
    "Id" text NOT NULL,
    "DateCreated" timestamp without time zone NOT NULL,
    "Expiration" timestamp with time zone NOT NULL,
    "Facade" text,
    "Label" text,
    "SIN" text,
    "StoreDataId" text,
    "TokenValue" text
);


ALTER TABLE "PairingCodes" OWNER TO postgres;

--
-- Name: PayjoinLocks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "PayjoinLocks" (
    "Id" character varying(100) NOT NULL
);


ALTER TABLE "PayjoinLocks" OWNER TO postgres;

--
-- Name: PaymentRequests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "PaymentRequests" (
    "Id" text NOT NULL,
    "StoreDataId" text,
    "Status" integer NOT NULL,
    "Blob" bytea,
    "Created" timestamp with time zone DEFAULT '1970-01-01 00:00:00+00'::timestamp with time zone NOT NULL,
    "Archived" boolean DEFAULT false NOT NULL
);


ALTER TABLE "PaymentRequests" OWNER TO postgres;

--
-- Name: Payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Payments" (
    "Id" text NOT NULL,
    "Blob" bytea,
    "InvoiceDataId" text,
    "Accounted" boolean DEFAULT false NOT NULL
);


ALTER TABLE "Payments" OWNER TO postgres;

--
-- Name: Payouts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Payouts" (
    "Id" character varying(30) NOT NULL,
    "Date" timestamp with time zone NOT NULL,
    "PullPaymentDataId" character varying(30),
    "State" character varying(20) NOT NULL,
    "PaymentMethodId" character varying(20) NOT NULL,
    "Destination" text,
    "Blob" bytea,
    "Proof" bytea
);


ALTER TABLE "Payouts" OWNER TO postgres;

--
-- Name: PendingInvoices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "PendingInvoices" (
    "Id" text NOT NULL
);


ALTER TABLE "PendingInvoices" OWNER TO postgres;

--
-- Name: PlannedTransactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "PlannedTransactions" (
    "Id" character varying(100) NOT NULL,
    "BroadcastAt" timestamp with time zone NOT NULL,
    "Blob" bytea
);


ALTER TABLE "PlannedTransactions" OWNER TO postgres;

--
-- Name: PullPayments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "PullPayments" (
    "Id" character varying(30) NOT NULL,
    "StoreId" character varying(50),
    "Period" bigint,
    "StartDate" timestamp with time zone NOT NULL,
    "EndDate" timestamp with time zone,
    "Archived" boolean NOT NULL,
    "Blob" bytea
);


ALTER TABLE "PullPayments" OWNER TO postgres;

--
-- Name: Refunds; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Refunds" (
    "InvoiceDataId" text NOT NULL,
    "PullPaymentDataId" text NOT NULL
);


ALTER TABLE "Refunds" OWNER TO postgres;

--
-- Name: Settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Settings" (
    "Id" text NOT NULL,
    "Value" text
);


ALTER TABLE "Settings" OWNER TO postgres;

--
-- Name: StoreWebhooks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "StoreWebhooks" (
    "StoreId" character varying(50) NOT NULL,
    "WebhookId" character varying(25) NOT NULL
);


ALTER TABLE "StoreWebhooks" OWNER TO postgres;

--
-- Name: Stores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Stores" (
    "Id" text NOT NULL,
    "DerivationStrategy" text,
    "SpeedPolicy" integer NOT NULL,
    "StoreCertificate" bytea,
    "StoreName" text,
    "StoreWebsite" text,
    "StoreBlob" bytea,
    "DerivationStrategies" text,
    "DefaultCrypto" text
);


ALTER TABLE "Stores" OWNER TO postgres;

--
-- Name: U2FDevices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "U2FDevices" (
    "Id" text NOT NULL,
    "Name" text,
    "KeyHandle" bytea NOT NULL,
    "PublicKey" bytea NOT NULL,
    "AttestationCert" bytea NOT NULL,
    "Counter" integer NOT NULL,
    "ApplicationUserId" text
);


ALTER TABLE "U2FDevices" OWNER TO postgres;

--
-- Name: UserStore; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "UserStore" (
    "ApplicationUserId" text NOT NULL,
    "StoreDataId" text NOT NULL,
    "Role" text
);


ALTER TABLE "UserStore" OWNER TO postgres;

--
-- Name: WalletTransactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "WalletTransactions" (
    "WalletDataId" text NOT NULL,
    "TransactionId" text NOT NULL,
    "Labels" text,
    "Blob" bytea
);


ALTER TABLE "WalletTransactions" OWNER TO postgres;

--
-- Name: Wallets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Wallets" (
    "Id" text NOT NULL,
    "Blob" bytea
);


ALTER TABLE "Wallets" OWNER TO postgres;

--
-- Name: WebhookDeliveries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "WebhookDeliveries" (
    "Id" character varying(25) NOT NULL,
    "WebhookId" character varying(25) NOT NULL,
    "Timestamp" timestamp with time zone NOT NULL,
    "Blob" bytea NOT NULL
);


ALTER TABLE "WebhookDeliveries" OWNER TO postgres;

--
-- Name: Webhooks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Webhooks" (
    "Id" character varying(25) NOT NULL,
    "Blob" bytea NOT NULL
);


ALTER TABLE "Webhooks" OWNER TO postgres;

--
-- Name: __EFMigrationsHistory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL
);


ALTER TABLE "__EFMigrationsHistory" OWNER TO postgres;

--
-- Name: InvoiceSearches Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "InvoiceSearches" ALTER COLUMN "Id" SET DEFAULT nextval('"InvoiceSearches_Id_seq"'::regclass);


--
-- Data for Name: AddressInvoices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "AddressInvoices" ("Address", "InvoiceDataId", "CreatedTime") FROM stdin;
11b4f29bd158d0ff911d3812f7cdcf77e78a0351#BTC	8JauWbGFaKKzMp3Dz8nTZW	2021-12-30 18:45:37.570044+00
2155ff56c700e6d16c14fbee3d1d8a6f156c2a77#BTC	EFx9y1mpPMzPRJPTmtTer9	2021-12-30 18:53:30.592814+00
\.


--
-- Data for Name: ApiKeys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "ApiKeys" ("Id", "StoreId", "Type", "UserId", "Label", "Blob") FROM stdin;
\.


--
-- Data for Name: Apps; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Apps" ("Id", "AppType", "Created", "Name", "Settings", "StoreDataId", "TagAllInvoices") FROM stdin;
42hJp6UL4pEzzHMde3iaWZnqKi6m	PointOfSale	2021-12-30 18:30:33.116579+00	XYZ POS	\N	BnHUknz5aGSLHBT2eb8TFZ1LZeZPBmEKHj3qKFmYhpLC	f
\.


--
-- Data for Name: AspNetRoleClaims; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "AspNetRoleClaims" ("Id", "ClaimType", "ClaimValue", "RoleId") FROM stdin;
\.


--
-- Data for Name: AspNetRoles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "AspNetRoles" ("Id", "ConcurrencyStamp", "Name", "NormalizedName") FROM stdin;
fcac3457-fe76-4bee-a2af-038095b5675f	d99561c0-33f5-4f28-bbec-d2d6184b6f7d	ServerAdmin	SERVERADMIN
\.


--
-- Data for Name: AspNetUserClaims; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "AspNetUserClaims" ("Id", "ClaimType", "ClaimValue", "UserId") FROM stdin;
\.


--
-- Data for Name: AspNetUserLogins; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "AspNetUserLogins" ("LoginProvider", "ProviderKey", "ProviderDisplayName", "UserId") FROM stdin;
\.


--
-- Data for Name: AspNetUserRoles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "AspNetUserRoles" ("UserId", "RoleId") FROM stdin;
3779f81b-b0f4-4b4f-aaf3-2c560b15a003	fcac3457-fe76-4bee-a2af-038095b5675f
\.


--
-- Data for Name: AspNetUserTokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "AspNetUserTokens" ("UserId", "LoginProvider", "Name", "Value") FROM stdin;
\.


--
-- Data for Name: AspNetUsers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "AspNetUsers" ("Id", "AccessFailedCount", "ConcurrencyStamp", "Email", "EmailConfirmed", "LockoutEnabled", "LockoutEnd", "NormalizedEmail", "NormalizedUserName", "PasswordHash", "PhoneNumber", "PhoneNumberConfirmed", "SecurityStamp", "TwoFactorEnabled", "UserName", "RequiresEmailConfirmation", "Created", "DisabledNotifications") FROM stdin;
3779f81b-b0f4-4b4f-aaf3-2c560b15a003	0	90547248-494c-4be2-a7d2-868bc7e0ae3e	diego@velascommerce.com	f	t	\N	DIEGO@VELASCOMMERCE.COM	DIEGO@VELASCOMMERCE.COM	AQAAAAEAACcQAAAAEKY9gxgKTfeIJSj0klXAbCQ2pbmB2vNm+q2FkwYvK+KLX4Yn6Iuf3eW7KT+GMWXPyA==	\N	f	XYHCOOBJQJOJJKXX7KWXKO7GCRGZS6V3	f	diego@velascommerce.com	f	2021-12-30 17:20:45.373633+00	\N
\.


--
-- Data for Name: Fido2Credentials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Fido2Credentials" ("Id", "Name", "ApplicationUserId", "Blob", "Type") FROM stdin;
\.


--
-- Data for Name: Files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Files" ("Id", "FileName", "StorageFileName", "Timestamp", "ApplicationUserId") FROM stdin;
\.


--
-- Data for Name: HistoricalAddressInvoices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "HistoricalAddressInvoices" ("InvoiceDataId", "Address", "Assigned", "UnAssigned", "CryptoCode") FROM stdin;
8JauWbGFaKKzMp3Dz8nTZW	bcrt1qr3qaqccklg9l0rrmlgm9gvs8sfayn730r8gpyp#BTC	2021-12-30 18:45:37.588865+00	2021-12-30 18:48:24.356028+00	BTC
EFx9y1mpPMzPRJPTmtTer9	bcrt1qlpxyzrq5e9hmfqeje6wvdd2zl68ewy40nj2sas#BTC	2021-12-30 18:53:30.593512+00	2021-12-30 18:54:38.884127+00	BTC
\.


--
-- Data for Name: InvoiceEvents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "InvoiceEvents" ("InvoiceDataId", "UniqueId", "Message", "Timestamp", "Severity") FROM stdin;
8JauWbGFaKKzMp3Dz8nTZW	e401c63b7bc8de87e914	Creation of invoice starting	2021-12-30 18:45:36.205039+00	0
8JauWbGFaKKzMp3Dz8nTZW	c16bf60e85f2081f553a	BTC_USD: The rating rule is coingecko(BTC_USD)	2021-12-30 18:45:37.09749+00	0
8JauWbGFaKKzMp3Dz8nTZW	78fb370c4109ee0cc66e	BTC_USD: The evaluated rating rule is 47682.212	2021-12-30 18:45:37.097637+00	0
8JauWbGFaKKzMp3Dz8nTZW	3f94f7066121e34e61fd	BTC (On-Chain): Payjoin is enabled for this invoice.	2021-12-30 18:45:37.122266+00	0
8JauWbGFaKKzMp3Dz8nTZW	ed42286db4d3468508a4	BTC (On-Chain): Payment method details creation took 33 milliseconds	2021-12-30 18:45:37.133119+00	0
8JauWbGFaKKzMp3Dz8nTZW	4af16d010c405bf00a71	Saving invoice took 638 milliseconds	2021-12-30 18:45:37.817078+00	0
8JauWbGFaKKzMp3Dz8nTZW	a18372c7c037dab85e11	Invoice 8JauWbGFaKKzMp3Dz8nTZW new event: invoice_created (1001)	2021-12-30 18:45:37.845787+00	0
8JauWbGFaKKzMp3Dz8nTZW	d89490ed46014b5ae488	Invoice 8JauWbGFaKKzMp3Dz8nTZW new event: invoice_receivedPayment (1002)	2021-12-30 18:48:24.316314+00	0
8JauWbGFaKKzMp3Dz8nTZW	c6ecf4b906d485b60e4e	Invoice status is paid	2021-12-30 18:48:24.407007+00	0
8JauWbGFaKKzMp3Dz8nTZW	0e44b202c18341161bbb	Invoice 8JauWbGFaKKzMp3Dz8nTZW new event: invoice_paidInFull (1003)	2021-12-30 18:48:24.421653+00	0
8JauWbGFaKKzMp3Dz8nTZW	208c4defb2b1e037ccf3	Invoice status is confirmed	2021-12-30 18:50:35.941615+00	0
8JauWbGFaKKzMp3Dz8nTZW	14b7b4f34b99f10e3382	Invoice 8JauWbGFaKKzMp3Dz8nTZW new event: invoice_confirmed (1005)	2021-12-30 18:50:35.951364+00	0
EFx9y1mpPMzPRJPTmtTer9	68bf6479f21607bccd08	Creation of invoice starting	2021-12-30 18:53:30.514802+00	0
EFx9y1mpPMzPRJPTmtTer9	2de9a89f917a7c3c9938	Invoice EFx9y1mpPMzPRJPTmtTer9 new event: invoice_created (1001)	2021-12-30 18:53:30.628222+00	0
EFx9y1mpPMzPRJPTmtTer9	3d9beae27d9f8acac5db	BTC_USD: The rating rule is coingecko(BTC_USD)	2021-12-30 18:53:30.525951+00	0
EFx9y1mpPMzPRJPTmtTer9	7f7d1c5d68221461f770	BTC_USD: The evaluated rating rule is 47742.813	2021-12-30 18:53:30.525957+00	0
EFx9y1mpPMzPRJPTmtTer9	83b72701815285c9aec5	BTC (On-Chain): Payjoin is enabled for this invoice.	2021-12-30 18:53:30.584422+00	0
EFx9y1mpPMzPRJPTmtTer9	a63168f967878bb73ca2	BTC (On-Chain): Payment method details creation took 54 milliseconds	2021-12-30 18:53:30.584936+00	0
EFx9y1mpPMzPRJPTmtTer9	5d72ad128238ea09a028	Saving invoice took 40 milliseconds	2021-12-30 18:53:30.626968+00	0
EFx9y1mpPMzPRJPTmtTer9	da4e61b88c25a45e887e	Invoice EFx9y1mpPMzPRJPTmtTer9 new event: invoice_receivedPayment (1002)	2021-12-30 18:54:38.860639+00	0
EFx9y1mpPMzPRJPTmtTer9	dedbad85a4bf46565356	Invoice status is paid	2021-12-30 18:54:38.921778+00	0
EFx9y1mpPMzPRJPTmtTer9	6316d4882967c6160666	Invoice EFx9y1mpPMzPRJPTmtTer9 new event: invoice_paidInFull (1003)	2021-12-30 18:54:38.943175+00	0
EFx9y1mpPMzPRJPTmtTer9	e1bca25f8262680294e4	Invoice status is complete	2021-12-30 18:54:50.149852+00	0
EFx9y1mpPMzPRJPTmtTer9	c203753b0207021fcbf7	Invoice EFx9y1mpPMzPRJPTmtTer9 new event: invoice_confirmed (1005)	2021-12-30 18:54:50.173886+00	0
EFx9y1mpPMzPRJPTmtTer9	b31fe42c518d0fe036d6	Invoice EFx9y1mpPMzPRJPTmtTer9 new event: invoice_completed (1006)	2021-12-30 18:54:50.201355+00	0
EFx9y1mpPMzPRJPTmtTer9	4381c3de90177f43e323	Invoice EFx9y1mpPMzPRJPTmtTer9 is not monitored anymore.	2021-12-30 18:54:50.223074+00	0
8JauWbGFaKKzMp3Dz8nTZW	1131b4a160a70a6bcff0	Invoice status is complete	2021-12-30 18:54:50.31661+00	0
8JauWbGFaKKzMp3Dz8nTZW	b4da1bef335ebabf271f	Invoice 8JauWbGFaKKzMp3Dz8nTZW new event: invoice_completed (1006)	2021-12-30 18:54:50.360966+00	0
8JauWbGFaKKzMp3Dz8nTZW	b4e6a72c1766038cef87	Invoice 8JauWbGFaKKzMp3Dz8nTZW is not monitored anymore.	2021-12-30 18:54:50.386355+00	0
\.


--
-- Data for Name: InvoiceSearches; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "InvoiceSearches" ("Id", "InvoiceDataId", "Value") FROM stdin;
1	8JauWbGFaKKzMp3Dz8nTZW	bcrt1qr3qaqccklg9l0rrmlgm9gvs8sfayn730r8gpyp
2	8JauWbGFaKKzMp3Dz8nTZW	0.00002098
3	8JauWbGFaKKzMp3Dz8nTZW	8JauWbGFaKKzMp3Dz8nTZW
4	8JauWbGFaKKzMp3Dz8nTZW	12/30/2021 18:45:36 +00:00
5	8JauWbGFaKKzMp3Dz8nTZW	1.0
6	8JauWbGFaKKzMp3Dz8nTZW	BnHUknz5aGSLHBT2eb8TFZ1LZeZPBmEKHj3qKFmYhpLC
7	8JauWbGFaKKzMp3Dz8nTZW	a5f235a699182e49ab7756d366d5eae4eafcf10d6b7eed4bc97c1d437db2d62d
8	EFx9y1mpPMzPRJPTmtTer9	bcrt1qlpxyzrq5e9hmfqeje6wvdd2zl68ewy40nj2sas
9	EFx9y1mpPMzPRJPTmtTer9	0.06283669
10	EFx9y1mpPMzPRJPTmtTer9	EFx9y1mpPMzPRJPTmtTer9
11	EFx9y1mpPMzPRJPTmtTer9	12/30/2021 18:53:30 +00:00
12	EFx9y1mpPMzPRJPTmtTer9	3000.0
13	EFx9y1mpPMzPRJPTmtTer9	test
14	EFx9y1mpPMzPRJPTmtTer9	BnHUknz5aGSLHBT2eb8TFZ1LZeZPBmEKHj3qKFmYhpLC
15	EFx9y1mpPMzPRJPTmtTer9	3b66b079af47f3d9b4b813ce204b16c3cb5df7677bfe9f716dddf1ee1bc5707e
\.


--
-- Name: InvoiceSearches_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"InvoiceSearches_Id_seq"', 15, true);


--
-- Data for Name: InvoiceWebhookDeliveries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "InvoiceWebhookDeliveries" ("InvoiceId", "DeliveryId") FROM stdin;
\.


--
-- Data for Name: Invoices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Invoices" ("Id", "Blob", "Created", "CustomerEmail", "ExceptionStatus", "ItemCode", "OrderId", "Status", "StoreDataId", "Archived", "CurrentRefundId") FROM stdin;
EFx9y1mpPMzPRJPTmtTer9	\\x1f8b080000000000000ac455cb76e23810fd176db2e1041b9c18bc4bc26b786408382f9a5e08bbc04a6cc9c8b2c1e4f065bde84fea5f981276d30cbde9737a9115a8aa54ba75abeafac7b7ef1f24039930c18953ab10e61387b43bdb666e46f178b41b4ffa6337522ec826a990440909ffe8905bde7b7ce7bb2bda9d0e7bb76e0d160db733338733988d6fa3f6a0f7565f0f3ad16b100feff4c518c01f8b90793971cc0af16149d3500d295fa57405c4e169185688a40aff5bb66dd52e1b661de1f04c300f5c16a1ddbcb68c46d3b04ca342601b338c46d8a73eb3ae7d3ec42261eac6f7252409825d785299eb30dee63bb9be8266102dd7f006d79bccf76bbbf0ba019bdc32f85b2da109828d40519f2a4a9c0f22a40ff250b18244a1330ef284793424ce928609ecd122112171ea86615ce2eb5e2a25705d27799cb6c8b1d631cd23e06a042a1007065d4d0ce30a24a7a14b5788f4cb571d2e5976a86caa341fabfc273bbf7918e8ea3ee63ad71cd1ce49c2569cf1d500723ccf898ad345abb55ce5c871f7b96f5b4f91bd6bf59fdd2c7e794e76dd5a631ad7e96e3298b6efaca1f534c96e1683c1cb7d7ab7ee8dd60fd32e67137bd6e9bf4ecdba17bc7a37eba565f59b9b6b315e4b6b3dd8a6edf7fb6ee3e961a6d2f8e5754e2a0841a4d283c3f3f7b72f71881323bbc04123f60f112ce909f54cc31014862999021aa9e78994abd6b1c64f2b801648fe956cc5b0339f8d037b3905a5b0ab0942f9824d9642a80e9e41e2e871cde19cd8a6d9b47de3eaece698aae0e06f581755f3a26a5c9c057c4e75fbaf0822a40bd0eceae1deef0fea4255aa279ac3068fb0f5202ea6bdb4ebf52bb6a8dc1509cb94fb741142b98e3f4d23cac2a3a880cf2478ea71323c37dda44a44386db8cf617e4ca1b61dc084b8cb4b8cbe178a2d31422349ca7125fcc4d88e4e1e3b759c3c988044957d94184702a562a75a356bf6250ac6a5e9989669d5b0364fe6b112ad5279b43ee0cf6f9218ff5f473eb0994aaf0cf84770a03642be631123e11785fc324d0ef9cc42ab30d79b60bccd3585c7fbefc5dc2054a36a1254b8e5d9b592203c197f2db77bcc1f09cef0cb8223dd3eca7a21e94ddbb6b5a4074c7f7a749fca67b4f215d4d20ce9d7f84b4f8f26c12f2f6c15701ffcb32e969d86ac98a522b664d615218a15d79a7ea8964a2f6099a6a7bcf527737a9a79ff1f000000ffff03000546702366070000	2021-12-30 18:53:30+00	\N		\N	test	complete	BnHUknz5aGSLHBT2eb8TFZ1LZeZPBmEKHj3qKFmYhpLC	f	\N
8JauWbGFaKKzMp3Dz8nTZW	\\x1f8b080000000000000ac455cd92e236107e959472980b35d8e005c38d7fc2cf84e5679861d983b01b5b8b2dcbb2cc60a678b21cf2487985b40cc392d92495aa1ca6381875b75a5f7feafef4c76fbfbf923dc884459cd44b05c25c5227f680a6cb4daf4b87c3e35894db479bcf574b5220898a24fca2439abcbfd8f1e327da9b8dfacd790936f6bcbb32472b584d9a6167d8ff568e87ddf0d917a396de2800dc491430272375b3405cd8d2345023cabd947a40ea3c0d82029154e17fab5ab14bf72553c3e1fb8839306721dacd8a65d876ad56ae14081c04c368847de3ab19b6f6b920a284a986eb4a481204bb71a43263598e69ec38bbc0ab05869461e085356f9fd8c99666bc5a36a4ed894c20d8101475a9a2a4fe4a9882b015b97802d904d4d9fda480628836b721713413b9799e9b859f25cca101a96f6990c0092d12e123bc7ba3409c544ae09a01b298b5c9958509cd42e06a0cca8fdc372a185720390de6d4c312be90c664f2b355f207a2b21859a2733cf6c72e94195dae783c6495907cd5f924dbe7a4cc94a6d2cbdeb2fde061a089795d93e6bcb5c642d724611e67dc1b4286eb355122ddb4db5b2fc3ebe92d0755eb31ac1edb83e57c2f9e96c9b157b267a24c8fd3e1acd3b246d6e374dfd80c874f0f692bee8fe3cfb31e67d3eaaa3b789e9965c77f761af1d6b206b5974a3489a5150f0f6967f7d0b31f3faf542a9e9ed7a48010a2543a901fffd07c1201369bec01078dd8cd2358d28fd4920601280c5332053452c78952aedad71a3fac007a46f2ab641ec3bbfb681c789733500a6f3541285ff0926514a92eae41626372cde19a544db356758d4fef764ea8f273bf6ddd15cdbba271f72ee063aa3b7d451001dd80665737f7e9940b1355a9ee680e2fb8848303e2dced17bb1ecef398e969c25991b04db94b37015c86f5cd34a62cb8ea11b84c82a316d311e6f09512f562d12c55ef0dfc9975d332ad52910a9114ff6d348b2847e47bb246aaa210fb147522c8ae87ab4317100acac4168f7e8814db6284ae21b9343ae137c64e7803f3d691433d9b139028ed0b19fc237644e5c84ca8a87d913b5403fdf94187c55f25ea15db40e96103f70a0ed44b247758c438974be3d634cdf399061e9de7fa1631dee19afcebfeddb9e310aa5134082ae7f6ddb60b41b8328cffabf127cc1f469ce17386c3d0b9be25e777a456ad96f43be233fddee97bba1ca335f34c2ddd23fd1affc5d3a789ffdd0b0705dc05f76f6f11f6e7263c875e889d4701aa1cd74f455e2c958ecff69a9d4b7bfc9706bfcd7cfa130000ffff03000988393eda070000	2021-12-30 18:45:36+00	\N		black tea	\N	complete	BnHUknz5aGSLHBT2eb8TFZ1LZeZPBmEKHj3qKFmYhpLC	f	\N
\.


--
-- Data for Name: Notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Notifications" ("Id", "Created", "ApplicationUserId", "NotificationType", "Seen", "Blob") FROM stdin;
47386095-7ad0-4903-ba7f-e4bbfad00605	2021-12-30 18:50:35.972395+00	3779f81b-b0f4-4b4f-aaf3-2c560b15a003	invoicestate	t	\\x1f8b080000000000000a7abf7b7fb592675e597e6672aa678a929592855762697892bb5ba2b777956f81b14b95455e4854b8928e926b596a5e0950412644717c727e5e5a66516e6a0a50ce330528979996995a8450505c9258921a8f4db55f3e486d726249667e5e4865412a9a1ea55a00000000ffff030023073d4795000000
316baa86-85d7-4578-85cd-0558ef2ea9b6	2021-12-30 18:54:50.162899+00	3779f81b-b0f4-4b4f-aaf3-2c560b15a003	invoicestate	f	\\x1f8b080000000000000a7abf7b7fb592675e597e6672aa678a929592ab5b8565a5616e41806f5540905740486e49486a91a5928e926b596a5e0950412644717c727e5e5a66516e6a0a50ce330528979996995a8450505c9258921a8f4db55f3e486d726249667e5e4865412a9a1ea55a00000000ffff030056dfd7ad95000000
\.


--
-- Data for Name: OffchainTransactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "OffchainTransactions" ("Id", "Blob") FROM stdin;
\.


--
-- Data for Name: PairedSINData; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "PairedSINData" ("Id", "Label", "PairingTime", "SIN", "StoreDataId") FROM stdin;
\.


--
-- Data for Name: PairingCodes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "PairingCodes" ("Id", "DateCreated", "Expiration", "Facade", "Label", "SIN", "StoreDataId", "TokenValue") FROM stdin;
\.


--
-- Data for Name: PayjoinLocks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "PayjoinLocks" ("Id") FROM stdin;
\.


--
-- Data for Name: PaymentRequests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "PaymentRequests" ("Id", "StoreDataId", "Status", "Blob", "Created", "Archived") FROM stdin;
\.


--
-- Data for Name: Payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Payments" ("Id", "Blob", "InvoiceDataId", "Accounted") FROM stdin;
3b66b079af47f3d9b4b813ce204b16c3cb5df7677bfe9f716dddf1ee1bc5707e-1	\\x1f8b080000000000000a6c8f3d52c3301085efb2b50724db916c9784a182991429dde867459cc89223cb0e4e2627a3e0485c0111a063abdd6fe7bd7dfbf9fe718119c3d879070dcd20a0c26e46bded7a7c19136225a96a52f28ad3320387f1e4c3e109111a724732f0531c7ce72234c09113b5a212d150ad99e6b43606b964dcf095565215c94ce644212d64254b5d9ba2e4c2f05a12c60a4928b915fcb84ec9d34dd6662094f2938ba8a18961c20c545886e8d75ea714f0b05d27c50fda88a547171f4514697369417967bad08b98fe5b7f9bb4d014246b2148935a23ec8869125a071cc7445a902a447ab4c3db720ec715d6bbde1c718fec346b9d9f2dabf0b494c4edf3512441121f70d988b8bb89c93dbdb159d8091361795530562762f155a8e5efe6f5bfc8db65f87de8b93b205cbf000000ffff030049054a669d010000	EFx9y1mpPMzPRJPTmtTer9	t
a5f235a699182e49ab7756d366d5eae4eafcf10d6b7eed4bc97c1d437db2d62d-1	\\x1f8b080000000000000a6c8f3d4ec4301085ef3275044e9c3fa7641115485b6c9966624f4214c7ce3a4e90b5da93517024ae8059a063aa996ff4de9bf97cffb8c04e6e1dad81264dc091a47127751a677a59232a73560b96325ea73c0143fecdbae989081a76c712b09b5fec683c349029557659a5729eaa4a4a9177a42a2a3ba6fab497849413aaa22c152fcaaac22e1719a5b51058f2a2cfb08821b7821fd72d7a9a4deb04504abb194f0a1aef364a40bab0787bb02a5e010fa74354fca02386998c7f448f717369415ad38f6e461fff3b7c9bb4d0709eb4e0ba3eb63dea95e2844a395ad7485ae8a4f3e9d9f1339ea59cf42034736ed6c32c867dadd71e83a93873f5b084a585289e281cd1bfdec4ec9eddd88e7aa3483226ea386a1a5086bfc0eb7ff79ec2f2fbcdf338115cbf000000ffff0300a8b0f12b9a010000	8JauWbGFaKKzMp3Dz8nTZW	t
\.


--
-- Data for Name: Payouts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Payouts" ("Id", "Date", "PullPaymentDataId", "State", "PaymentMethodId", "Destination", "Blob", "Proof") FROM stdin;
\.


--
-- Data for Name: PendingInvoices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "PendingInvoices" ("Id") FROM stdin;
\.


--
-- Data for Name: PlannedTransactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "PlannedTransactions" ("Id", "BroadcastAt", "Blob") FROM stdin;
\.


--
-- Data for Name: PullPayments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "PullPayments" ("Id", "StoreId", "Period", "StartDate", "EndDate", "Archived", "Blob") FROM stdin;
\.


--
-- Data for Name: Refunds; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Refunds" ("InvoiceDataId", "PullPaymentDataId") FROM stdin;
\.


--
-- Data for Name: Settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Settings" ("Id", "Value") FROM stdin;
BTCPayServer.HostedServices.RatesHostedService+ExchangeRatesCache	{"Created":1640890421,"States":[{"ExchangeName":"coingecko","LastRequested":1640890410,"LastUpdated":1640890421,"Rates":["BTC_ETH|12.718|12.718","BTC_LTC|319.726|319.726","BTC_BCH|110.298|110.298","BTC_BNB|91.438|91.438","BTC_EOS|15436.057|15436.057","BTC_XRP|56183.82|56183.82","BTC_XLM|174927.857|174927.857","BTC_LINK|2365.849|2365.849","BTC_DOT|1693.65|1693.65","BTC_YFI|1.644|1.644","BTC_USD|47744.293|47744.293","BTC_AED|175364.788|175364.788","BTC_ARS|4904360.114|4904360.114","BTC_AUD|65873.278|65873.278","BTC_BDT|4097252.529|4097252.529","BTC_BHD|17998.07|17998.07","BTC_BMD|47744.293|47744.293","BTC_BRL|266229.531|266229.531","BTC_CAD|61008.755|61008.755","BTC_CHF|43698.728|43698.728","BTC_CLP|40678137.807|40678137.807","BTC_CNY|304269.606|304269.606","BTC_CZK|1049568.431|1049568.431","BTC_DKK|314059.096|314059.096","BTC_EUR|42231.211|42231.211","BTC_GBP|35406.356|35406.356","BTC_HKD|372396.176|372396.176","BTC_HUF|15562252.368|15562252.368","BTC_IDR|681206026.535|681206026.535","BTC_ILS|148279.928|148279.928","BTC_INR|3555803.98|3555803.98","BTC_JPY|5498757.992|5498757.992","BTC_KRW|56884460.691|56884460.691","BTC_KWD|14444.892|14444.892","BTC_LKR|9688732.231|9688732.231","BTC_MMK|84912252.811|84912252.811","BTC_MXN|979514.757|979514.757","BTC_MYR|199404.04|199404.04","BTC_NGN|19634840.578|19634840.578","BTC_NOK|420936.367|420936.367","BTC_NZD|69941.904|69941.904","BTC_PHP|2452504.981|2452504.981","BTC_PKR|8510420.263|8510420.263","BTC_PLN|194028.271|194028.271","BTC_RUB|3563724.758|3563724.758","BTC_SAR|179254.85|179254.85","BTC_SEK|432787.217|432787.217","BTC_SGD|64586.999|64586.999","BTC_THB|1590603.419|1590603.419","BTC_TRY|625089.198|625089.198","BTC_TWD|1325056.87|1325056.87","BTC_UAH|1302827.318|1302827.318","BTC_VEF|4780.636|4780.636","BTC_VND|1089763492.316|1089763492.316","BTC_ZAR|761893.022|761893.022","BTC_XDR|33980.902|33980.902","BTC_XAG|2075.208|2075.208","BTC_XAU|26.329|26.329","BTC_BITS|1000000|1000000","BTC_SATS|100000000|100000000"]}]}
BTCPayServer.Services.MigrationSettings	{"MigrateHotwalletProperty2":true,"MigrateU2FToFIDO2":true,"UnreachableStoreCheck":true,"DeprecatedLightningConnectionStringCheck":true,"ConvertMultiplierToSpread":true,"ConvertNetworkFeeProperty":true,"ConvertCrowdfundOldSettings":true,"ConvertWalletKeyPathRoots":true,"CheckedFirstRun":true,"PaymentMethodCriteria":true,"TransitionToStoreBlobAdditionalData":true,"TransitionInternalNodeConnectionString":true,"MigratedInvoiceTextSearchPages":null}
BTCPayServer.Services.ThemeSettings	{"CustomTheme":false,"CustomThemeCssUri":null,"CssUri":"/main/themes/default.css","FirstRun":false}
\.


--
-- Data for Name: StoreWebhooks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "StoreWebhooks" ("StoreId", "WebhookId") FROM stdin;
\.


--
-- Data for Name: Stores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Stores" ("Id", "DerivationStrategy", "SpeedPolicy", "StoreCertificate", "StoreName", "StoreWebsite", "StoreBlob", "DerivationStrategies", "DefaultCrypto") FROM stdin;
BnHUknz5aGSLHBT2eb8TFZ1LZeZPBmEKHj3qKFmYhpLC	\N	1	\N	XYZ store	\N	\\x7b226e6574776f726b4665654d6f6465223a224d756c7469706c655061796d656e74734f6e6c79222c227265717569726573526566756e64456d61696c223a66616c73652c226c696768746e696e67416d6f756e74496e5361746f736869223a66616c73652c226c696768746e696e6750726976617465526f75746548696e7473223a66616c73652c226f6e436861696e576974684c6e496e766f69636546616c6c6261636b223a66616c73652c226c617a795061796d656e744d6574686f6473223a66616c73652c2272656469726563744175746f6d61746963616c6c79223a66616c73652c2273686f775265636f6d6d656e646564466565223a747275652c227265636f6d6d656e646564466565426c6f636b546172676574223a312c2264656661756c7443757272656e63795061697273223a5b5d2c2264656661756c744c616e67223a6e756c6c2c226d6f6e69746f72696e6745787069726174696f6e223a313434302c22696e766f69636545787069726174696f6e223a31352c22737072656164223a302e302c2270726566657272656445786368616e6765223a22636f696e6765636b6f222c227061796d656e744d6574686f644372697465726961223a5b5d2c22637573746f6d435353223a6e756c6c2c22637573746f6d4c6f676f223a6e756c6c2c2268746d6c5469746c65223a6e756c6c2c226175746f4465746563744c616e6775616765223a66616c73652c2272617465536372697074696e67223a66616c73652c2272617465536372697074223a6e756c6c2c22616e796f6e6543616e496e766f696365223a66616c73652c226c696768746e696e674465736372697074696f6e54656d706c617465223a225061696420746f207b53746f72654e616d657d20284f726465722049443a207b4f7264657249647d29222c227061796d656e74546f6c6572616e6365223a302e302c226578636c756465645061796d656e744d6574686f6473223a5b5d2c22656d61696c53657474696e6773223a6e756c6c2c227061794a6f696e456e61626c6564223a747275652c2268696e7473223a7b2277616c6c6574223a66616c73652c226c696768746e696e67223a747275657d7d	{\r\n  "BTC": {\r\n    "signingKey": "tpubDDfgyageGWJ74Vm7zDJWTvpXWszG28Sp3azRKSEC4L4VRvAbKKXNuCqHMqQSGniR7ZFJYS13chYcAqf44J9w6oPqr4qKxuEkNG8VQZtupXY",\r\n    "source": "NBXplorerGenerated",\r\n    "isHotWallet": true,\r\n    "accountDerivation": "tpubDDfgyageGWJ74Vm7zDJWTvpXWszG28Sp3azRKSEC4L4VRvAbKKXNuCqHMqQSGniR7ZFJYS13chYcAqf44J9w6oPqr4qKxuEkNG8VQZtupXY",\r\n    "accountOriginal": "tpubDDfgyageGWJ74Vm7zDJWTvpXWszG28Sp3azRKSEC4L4VRvAbKKXNuCqHMqQSGniR7ZFJYS13chYcAqf44J9w6oPqr4qKxuEkNG8VQZtupXY",\r\n    "accountKeySettings": [\r\n      {\r\n        "rootFingerprint": "71197d05",\r\n        "accountKeyPath": "84'/1'/0'",\r\n        "accountKey": "tpubDDfgyageGWJ74Vm7zDJWTvpXWszG28Sp3azRKSEC4L4VRvAbKKXNuCqHMqQSGniR7ZFJYS13chYcAqf44J9w6oPqr4qKxuEkNG8VQZtupXY"\r\n      }\r\n    ],\r\n    "label": null\r\n  }\r\n}	\N
\.


--
-- Data for Name: U2FDevices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "U2FDevices" ("Id", "Name", "KeyHandle", "PublicKey", "AttestationCert", "Counter", "ApplicationUserId") FROM stdin;
\.


--
-- Data for Name: UserStore; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "UserStore" ("ApplicationUserId", "StoreDataId", "Role") FROM stdin;
3779f81b-b0f4-4b4f-aaf3-2c560b15a003	BnHUknz5aGSLHBT2eb8TFZ1LZeZPBmEKHj3qKFmYhpLC	Owner
\.


--
-- Data for Name: WalletTransactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "WalletTransactions" ("WalletDataId", "TransactionId", "Labels", "Blob") FROM stdin;
S-BnHUknz5aGSLHBT2eb8TFZ1LZeZPBmEKHj3qKFmYhpLC-BTC	a5f235a699182e49ab7756d366d5eae4eafcf10d6b7eed4bc97c1d437db2d62d	[\r\n  {\r\n    "ref": "8JauWbGFaKKzMp3Dz8nTZW",\r\n    "type": "invoice",\r\n    "text": "invoice"\r\n  },\r\n  {\r\n    "ref": "42hJp6UL4pEzzHMde3iaWZnqKi6m",\r\n    "type": "app",\r\n    "text": "app"\r\n  }\r\n]	\\x1f8b080000000000000a7abf7b7fb592737e6e6e6a5e89929592522d000000ffff030036bc6ad911000000
S-BnHUknz5aGSLHBT2eb8TFZ1LZeZPBmEKHj3qKFmYhpLC-BTC	3b66b079af47f3d9b4b813ce204b16c3cb5df7677bfe9f716dddf1ee1bc5707e	[\r\n  {\r\n    "ref": "EFx9y1mpPMzPRJPTmtTer9",\r\n    "type": "invoice",\r\n    "text": "invoice"\r\n  }\r\n]	\\x1f8b080000000000000a7abf7b7fb592737e6e6e6a5e89929592522d000000ffff030036bc6ad911000000
\.


--
-- Data for Name: Wallets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Wallets" ("Id", "Blob") FROM stdin;
S-BnHUknz5aGSLHBT2eb8TFZ1LZeZPBmEKHj3qKFmYhpLC-BTC	\\x1f8b080000000000000a7abf7b7fb5924f62526a8e737e4e7e51b19255b552665e597e6672aa92959272726a4ab291a1928e52624101886f6a6069ec64a6545b0b000000ffff0300f170741638000000
\.


--
-- Data for Name: WebhookDeliveries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "WebhookDeliveries" ("Id", "WebhookId", "Timestamp", "Blob") FROM stdin;
\.


--
-- Data for Name: Webhooks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Webhooks" ("Id", "Blob") FROM stdin;
\.


--
-- Data for Name: __EFMigrationsHistory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "__EFMigrationsHistory" ("MigrationId", "ProductVersion") FROM stdin;
20170913143004_Init	3.1.4
20170926073744_Settings	3.1.4
20170926084408_RequiresEmailConfirmation	3.1.4
20171006013443_AddressMapping	3.1.4
20171010082424_Tokens	3.1.4
20171012020112_PendingInvoices	3.1.4
20171023101754_StoreBlob	3.1.4
20171024163354_RenewUsedAddresses	3.1.4
20171105235734_PaymentAccounted	3.1.4
20171221054550_AltcoinSupport	3.1.4
20180106095215_DerivationStrategies	3.1.4
20180109021122_defaultcrypto	3.1.4
20180114123253_events	3.1.4
20180402095640_appdata	3.1.4
20180429083930_legacyapikey	3.1.4
20180719095626_CanDeleteStores	3.1.4
20190121133309_AddPaymentRequests	3.1.4
20190219032533_AppsTagging	3.1.4
20190225091644_AddOpenIddict	3.1.4
20190324141717_AddFiles	3.1.4
20190425081749_AddU2fDevices	3.1.4
20190701082105_sort_paymentrequests	3.1.4
20190802142637_WalletData	3.1.4
20200110064617_OpenIddictUpdate	3.1.4
20200119130108_ExtendApiKeys	3.1.4
20200224134444_Remove_OpenIddict	3.1.4
20200225133433_AddApiKeyLabel	3.1.4
20200402065615_AddApiKeyBlob	3.1.4
20200413052418_PlannedTransactions	3.1.4
20200507092343_AddArchivedToInvoice	3.1.4
20200625064111_refundnotificationpullpayments	3.1.4
20200901161733_AddInvoiceEventLogSeverity	3.1.4
20201002145033_AddCreateDateToUser	3.1.4
20201007090617_u2fDeviceCascade	3.1.4
20201015151438_AddDisabledNotificationsToUser	3.1.4
20201108054749_webhooks	3.1.4
20201208054211_invoicesorderindex	3.1.4
20201228225040_AddingInvoiceSearchesTable	3.1.4
20210314092253_Fido2Credentials	3.1.4
\.


--
-- Name: AddressInvoices PK_AddressInvoices; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "AddressInvoices"
    ADD CONSTRAINT "PK_AddressInvoices" PRIMARY KEY ("Address");


--
-- Name: ApiKeys PK_ApiKeys; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "ApiKeys"
    ADD CONSTRAINT "PK_ApiKeys" PRIMARY KEY ("Id");


--
-- Name: Apps PK_Apps; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Apps"
    ADD CONSTRAINT "PK_Apps" PRIMARY KEY ("Id");


--
-- Name: AspNetRoleClaims PK_AspNetRoleClaims; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "AspNetRoleClaims"
    ADD CONSTRAINT "PK_AspNetRoleClaims" PRIMARY KEY ("Id");


--
-- Name: AspNetRoles PK_AspNetRoles; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "AspNetRoles"
    ADD CONSTRAINT "PK_AspNetRoles" PRIMARY KEY ("Id");


--
-- Name: AspNetUserClaims PK_AspNetUserClaims; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "AspNetUserClaims"
    ADD CONSTRAINT "PK_AspNetUserClaims" PRIMARY KEY ("Id");


--
-- Name: AspNetUserLogins PK_AspNetUserLogins; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "AspNetUserLogins"
    ADD CONSTRAINT "PK_AspNetUserLogins" PRIMARY KEY ("LoginProvider", "ProviderKey");


--
-- Name: AspNetUserRoles PK_AspNetUserRoles; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "AspNetUserRoles"
    ADD CONSTRAINT "PK_AspNetUserRoles" PRIMARY KEY ("UserId", "RoleId");


--
-- Name: AspNetUserTokens PK_AspNetUserTokens; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "AspNetUserTokens"
    ADD CONSTRAINT "PK_AspNetUserTokens" PRIMARY KEY ("UserId", "LoginProvider", "Name");


--
-- Name: AspNetUsers PK_AspNetUsers; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "AspNetUsers"
    ADD CONSTRAINT "PK_AspNetUsers" PRIMARY KEY ("Id");


--
-- Name: Fido2Credentials PK_Fido2Credentials; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Fido2Credentials"
    ADD CONSTRAINT "PK_Fido2Credentials" PRIMARY KEY ("Id");


--
-- Name: Files PK_Files; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Files"
    ADD CONSTRAINT "PK_Files" PRIMARY KEY ("Id");


--
-- Name: HistoricalAddressInvoices PK_HistoricalAddressInvoices; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "HistoricalAddressInvoices"
    ADD CONSTRAINT "PK_HistoricalAddressInvoices" PRIMARY KEY ("InvoiceDataId", "Address");


--
-- Name: InvoiceEvents PK_InvoiceEvents; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "InvoiceEvents"
    ADD CONSTRAINT "PK_InvoiceEvents" PRIMARY KEY ("InvoiceDataId", "UniqueId");


--
-- Name: InvoiceSearches PK_InvoiceSearches; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "InvoiceSearches"
    ADD CONSTRAINT "PK_InvoiceSearches" PRIMARY KEY ("Id");


--
-- Name: InvoiceWebhookDeliveries PK_InvoiceWebhookDeliveries; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "InvoiceWebhookDeliveries"
    ADD CONSTRAINT "PK_InvoiceWebhookDeliveries" PRIMARY KEY ("InvoiceId", "DeliveryId");


--
-- Name: Invoices PK_Invoices; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Invoices"
    ADD CONSTRAINT "PK_Invoices" PRIMARY KEY ("Id");


--
-- Name: Notifications PK_Notifications; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Notifications"
    ADD CONSTRAINT "PK_Notifications" PRIMARY KEY ("Id");


--
-- Name: OffchainTransactions PK_OffchainTransactions; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "OffchainTransactions"
    ADD CONSTRAINT "PK_OffchainTransactions" PRIMARY KEY ("Id");


--
-- Name: PairedSINData PK_PairedSINData; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "PairedSINData"
    ADD CONSTRAINT "PK_PairedSINData" PRIMARY KEY ("Id");


--
-- Name: PairingCodes PK_PairingCodes; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "PairingCodes"
    ADD CONSTRAINT "PK_PairingCodes" PRIMARY KEY ("Id");


--
-- Name: PayjoinLocks PK_PayjoinLocks; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "PayjoinLocks"
    ADD CONSTRAINT "PK_PayjoinLocks" PRIMARY KEY ("Id");


--
-- Name: PaymentRequests PK_PaymentRequests; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "PaymentRequests"
    ADD CONSTRAINT "PK_PaymentRequests" PRIMARY KEY ("Id");


--
-- Name: Payments PK_Payments; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Payments"
    ADD CONSTRAINT "PK_Payments" PRIMARY KEY ("Id");


--
-- Name: Payouts PK_Payouts; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Payouts"
    ADD CONSTRAINT "PK_Payouts" PRIMARY KEY ("Id");


--
-- Name: PendingInvoices PK_PendingInvoices; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "PendingInvoices"
    ADD CONSTRAINT "PK_PendingInvoices" PRIMARY KEY ("Id");


--
-- Name: PlannedTransactions PK_PlannedTransactions; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "PlannedTransactions"
    ADD CONSTRAINT "PK_PlannedTransactions" PRIMARY KEY ("Id");


--
-- Name: PullPayments PK_PullPayments; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "PullPayments"
    ADD CONSTRAINT "PK_PullPayments" PRIMARY KEY ("Id");


--
-- Name: Refunds PK_Refunds; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Refunds"
    ADD CONSTRAINT "PK_Refunds" PRIMARY KEY ("InvoiceDataId", "PullPaymentDataId");


--
-- Name: Settings PK_Settings; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Settings"
    ADD CONSTRAINT "PK_Settings" PRIMARY KEY ("Id");


--
-- Name: StoreWebhooks PK_StoreWebhooks; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "StoreWebhooks"
    ADD CONSTRAINT "PK_StoreWebhooks" PRIMARY KEY ("StoreId", "WebhookId");


--
-- Name: Stores PK_Stores; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Stores"
    ADD CONSTRAINT "PK_Stores" PRIMARY KEY ("Id");


--
-- Name: U2FDevices PK_U2FDevices; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "U2FDevices"
    ADD CONSTRAINT "PK_U2FDevices" PRIMARY KEY ("Id");


--
-- Name: UserStore PK_UserStore; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "UserStore"
    ADD CONSTRAINT "PK_UserStore" PRIMARY KEY ("ApplicationUserId", "StoreDataId");


--
-- Name: WalletTransactions PK_WalletTransactions; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "WalletTransactions"
    ADD CONSTRAINT "PK_WalletTransactions" PRIMARY KEY ("WalletDataId", "TransactionId");


--
-- Name: Wallets PK_Wallets; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Wallets"
    ADD CONSTRAINT "PK_Wallets" PRIMARY KEY ("Id");


--
-- Name: WebhookDeliveries PK_WebhookDeliveries; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "WebhookDeliveries"
    ADD CONSTRAINT "PK_WebhookDeliveries" PRIMARY KEY ("Id");


--
-- Name: Webhooks PK_Webhooks; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Webhooks"
    ADD CONSTRAINT "PK_Webhooks" PRIMARY KEY ("Id");


--
-- Name: __EFMigrationsHistory PK___EFMigrationsHistory; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "__EFMigrationsHistory"
    ADD CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId");


--
-- Name: EmailIndex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "EmailIndex" ON "AspNetUsers" USING btree ("NormalizedEmail");


--
-- Name: IX_AddressInvoices_InvoiceDataId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_AddressInvoices_InvoiceDataId" ON "AddressInvoices" USING btree ("InvoiceDataId");


--
-- Name: IX_ApiKeys_StoreId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_ApiKeys_StoreId" ON "ApiKeys" USING btree ("StoreId");


--
-- Name: IX_ApiKeys_UserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_ApiKeys_UserId" ON "ApiKeys" USING btree ("UserId");


--
-- Name: IX_Apps_StoreDataId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Apps_StoreDataId" ON "Apps" USING btree ("StoreDataId");


--
-- Name: IX_AspNetRoleClaims_RoleId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_AspNetRoleClaims_RoleId" ON "AspNetRoleClaims" USING btree ("RoleId");


--
-- Name: IX_AspNetUserClaims_UserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_AspNetUserClaims_UserId" ON "AspNetUserClaims" USING btree ("UserId");


--
-- Name: IX_AspNetUserLogins_UserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_AspNetUserLogins_UserId" ON "AspNetUserLogins" USING btree ("UserId");


--
-- Name: IX_AspNetUserRoles_RoleId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_AspNetUserRoles_RoleId" ON "AspNetUserRoles" USING btree ("RoleId");


--
-- Name: IX_Fido2Credentials_ApplicationUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Fido2Credentials_ApplicationUserId" ON "Fido2Credentials" USING btree ("ApplicationUserId");


--
-- Name: IX_Files_ApplicationUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Files_ApplicationUserId" ON "Files" USING btree ("ApplicationUserId");


--
-- Name: IX_InvoiceSearches_InvoiceDataId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_InvoiceSearches_InvoiceDataId" ON "InvoiceSearches" USING btree ("InvoiceDataId");


--
-- Name: IX_InvoiceSearches_Value; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_InvoiceSearches_Value" ON "InvoiceSearches" USING btree ("Value");


--
-- Name: IX_Invoices_Id_CurrentRefundId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Invoices_Id_CurrentRefundId" ON "Invoices" USING btree ("Id", "CurrentRefundId");


--
-- Name: IX_Invoices_OrderId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Invoices_OrderId" ON "Invoices" USING btree ("OrderId");


--
-- Name: IX_Invoices_StoreDataId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Invoices_StoreDataId" ON "Invoices" USING btree ("StoreDataId");


--
-- Name: IX_Notifications_ApplicationUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Notifications_ApplicationUserId" ON "Notifications" USING btree ("ApplicationUserId");


--
-- Name: IX_PairedSINData_SIN; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_PairedSINData_SIN" ON "PairedSINData" USING btree ("SIN");


--
-- Name: IX_PairedSINData_StoreDataId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_PairedSINData_StoreDataId" ON "PairedSINData" USING btree ("StoreDataId");


--
-- Name: IX_PaymentRequests_Status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_PaymentRequests_Status" ON "PaymentRequests" USING btree ("Status");


--
-- Name: IX_PaymentRequests_StoreDataId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_PaymentRequests_StoreDataId" ON "PaymentRequests" USING btree ("StoreDataId");


--
-- Name: IX_Payments_InvoiceDataId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Payments_InvoiceDataId" ON "Payments" USING btree ("InvoiceDataId");


--
-- Name: IX_Payouts_Destination; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IX_Payouts_Destination" ON "Payouts" USING btree ("Destination");


--
-- Name: IX_Payouts_PullPaymentDataId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Payouts_PullPaymentDataId" ON "Payouts" USING btree ("PullPaymentDataId");


--
-- Name: IX_Payouts_State; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Payouts_State" ON "Payouts" USING btree ("State");


--
-- Name: IX_PullPayments_StoreId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_PullPayments_StoreId" ON "PullPayments" USING btree ("StoreId");


--
-- Name: IX_Refunds_PullPaymentDataId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_Refunds_PullPaymentDataId" ON "Refunds" USING btree ("PullPaymentDataId");


--
-- Name: IX_U2FDevices_ApplicationUserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_U2FDevices_ApplicationUserId" ON "U2FDevices" USING btree ("ApplicationUserId");


--
-- Name: IX_UserStore_StoreDataId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_UserStore_StoreDataId" ON "UserStore" USING btree ("StoreDataId");


--
-- Name: IX_WebhookDeliveries_WebhookId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_WebhookDeliveries_WebhookId" ON "WebhookDeliveries" USING btree ("WebhookId");


--
-- Name: RoleNameIndex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "RoleNameIndex" ON "AspNetRoles" USING btree ("NormalizedName");


--
-- Name: UserNameIndex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "UserNameIndex" ON "AspNetUsers" USING btree ("NormalizedUserName");


--
-- Name: AddressInvoices FK_AddressInvoices_Invoices_InvoiceDataId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "AddressInvoices"
    ADD CONSTRAINT "FK_AddressInvoices_Invoices_InvoiceDataId" FOREIGN KEY ("InvoiceDataId") REFERENCES "Invoices"("Id") ON DELETE CASCADE;


--
-- Name: ApiKeys FK_ApiKeys_AspNetUsers_UserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "ApiKeys"
    ADD CONSTRAINT "FK_ApiKeys_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES "AspNetUsers"("Id") ON DELETE CASCADE;


--
-- Name: ApiKeys FK_ApiKeys_Stores_StoreId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "ApiKeys"
    ADD CONSTRAINT "FK_ApiKeys_Stores_StoreId" FOREIGN KEY ("StoreId") REFERENCES "Stores"("Id") ON DELETE CASCADE;


--
-- Name: Apps FK_Apps_Stores_StoreDataId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Apps"
    ADD CONSTRAINT "FK_Apps_Stores_StoreDataId" FOREIGN KEY ("StoreDataId") REFERENCES "Stores"("Id") ON DELETE CASCADE;


--
-- Name: AspNetRoleClaims FK_AspNetRoleClaims_AspNetRoles_RoleId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "AspNetRoleClaims"
    ADD CONSTRAINT "FK_AspNetRoleClaims_AspNetRoles_RoleId" FOREIGN KEY ("RoleId") REFERENCES "AspNetRoles"("Id") ON DELETE CASCADE;


--
-- Name: AspNetUserClaims FK_AspNetUserClaims_AspNetUsers_UserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "AspNetUserClaims"
    ADD CONSTRAINT "FK_AspNetUserClaims_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES "AspNetUsers"("Id") ON DELETE CASCADE;


--
-- Name: AspNetUserLogins FK_AspNetUserLogins_AspNetUsers_UserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "AspNetUserLogins"
    ADD CONSTRAINT "FK_AspNetUserLogins_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES "AspNetUsers"("Id") ON DELETE CASCADE;


--
-- Name: AspNetUserRoles FK_AspNetUserRoles_AspNetRoles_RoleId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "AspNetUserRoles"
    ADD CONSTRAINT "FK_AspNetUserRoles_AspNetRoles_RoleId" FOREIGN KEY ("RoleId") REFERENCES "AspNetRoles"("Id") ON DELETE CASCADE;


--
-- Name: AspNetUserRoles FK_AspNetUserRoles_AspNetUsers_UserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "AspNetUserRoles"
    ADD CONSTRAINT "FK_AspNetUserRoles_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES "AspNetUsers"("Id") ON DELETE CASCADE;


--
-- Name: AspNetUserTokens FK_AspNetUserTokens_AspNetUsers_UserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "AspNetUserTokens"
    ADD CONSTRAINT "FK_AspNetUserTokens_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES "AspNetUsers"("Id") ON DELETE CASCADE;


--
-- Name: Fido2Credentials FK_Fido2Credentials_AspNetUsers_ApplicationUserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Fido2Credentials"
    ADD CONSTRAINT "FK_Fido2Credentials_AspNetUsers_ApplicationUserId" FOREIGN KEY ("ApplicationUserId") REFERENCES "AspNetUsers"("Id") ON DELETE CASCADE;


--
-- Name: Files FK_Files_AspNetUsers_ApplicationUserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Files"
    ADD CONSTRAINT "FK_Files_AspNetUsers_ApplicationUserId" FOREIGN KEY ("ApplicationUserId") REFERENCES "AspNetUsers"("Id") ON DELETE RESTRICT;


--
-- Name: HistoricalAddressInvoices FK_HistoricalAddressInvoices_Invoices_InvoiceDataId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "HistoricalAddressInvoices"
    ADD CONSTRAINT "FK_HistoricalAddressInvoices_Invoices_InvoiceDataId" FOREIGN KEY ("InvoiceDataId") REFERENCES "Invoices"("Id") ON DELETE CASCADE;


--
-- Name: InvoiceEvents FK_InvoiceEvents_Invoices_InvoiceDataId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "InvoiceEvents"
    ADD CONSTRAINT "FK_InvoiceEvents_Invoices_InvoiceDataId" FOREIGN KEY ("InvoiceDataId") REFERENCES "Invoices"("Id") ON DELETE CASCADE;


--
-- Name: InvoiceSearches FK_InvoiceSearches_Invoices_InvoiceDataId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "InvoiceSearches"
    ADD CONSTRAINT "FK_InvoiceSearches_Invoices_InvoiceDataId" FOREIGN KEY ("InvoiceDataId") REFERENCES "Invoices"("Id") ON DELETE CASCADE;


--
-- Name: InvoiceWebhookDeliveries FK_InvoiceWebhookDeliveries_Invoices_InvoiceId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "InvoiceWebhookDeliveries"
    ADD CONSTRAINT "FK_InvoiceWebhookDeliveries_Invoices_InvoiceId" FOREIGN KEY ("InvoiceId") REFERENCES "Invoices"("Id") ON DELETE CASCADE;


--
-- Name: InvoiceWebhookDeliveries FK_InvoiceWebhookDeliveries_WebhookDeliveries_DeliveryId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "InvoiceWebhookDeliveries"
    ADD CONSTRAINT "FK_InvoiceWebhookDeliveries_WebhookDeliveries_DeliveryId" FOREIGN KEY ("DeliveryId") REFERENCES "WebhookDeliveries"("Id") ON DELETE CASCADE;


--
-- Name: Invoices FK_Invoices_Refunds_Id_CurrentRefundId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Invoices"
    ADD CONSTRAINT "FK_Invoices_Refunds_Id_CurrentRefundId" FOREIGN KEY ("Id", "CurrentRefundId") REFERENCES "Refunds"("InvoiceDataId", "PullPaymentDataId") ON DELETE RESTRICT;


--
-- Name: Invoices FK_Invoices_Stores_StoreDataId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Invoices"
    ADD CONSTRAINT "FK_Invoices_Stores_StoreDataId" FOREIGN KEY ("StoreDataId") REFERENCES "Stores"("Id") ON DELETE CASCADE;


--
-- Name: Notifications FK_Notifications_AspNetUsers_ApplicationUserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Notifications"
    ADD CONSTRAINT "FK_Notifications_AspNetUsers_ApplicationUserId" FOREIGN KEY ("ApplicationUserId") REFERENCES "AspNetUsers"("Id") ON DELETE CASCADE;


--
-- Name: PairedSINData FK_PairedSINData_Stores_StoreDataId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "PairedSINData"
    ADD CONSTRAINT "FK_PairedSINData_Stores_StoreDataId" FOREIGN KEY ("StoreDataId") REFERENCES "Stores"("Id") ON DELETE CASCADE;


--
-- Name: PaymentRequests FK_PaymentRequests_Stores_StoreDataId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "PaymentRequests"
    ADD CONSTRAINT "FK_PaymentRequests_Stores_StoreDataId" FOREIGN KEY ("StoreDataId") REFERENCES "Stores"("Id") ON DELETE CASCADE;


--
-- Name: Payments FK_Payments_Invoices_InvoiceDataId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Payments"
    ADD CONSTRAINT "FK_Payments_Invoices_InvoiceDataId" FOREIGN KEY ("InvoiceDataId") REFERENCES "Invoices"("Id") ON DELETE CASCADE;


--
-- Name: Payouts FK_Payouts_PullPayments_PullPaymentDataId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Payouts"
    ADD CONSTRAINT "FK_Payouts_PullPayments_PullPaymentDataId" FOREIGN KEY ("PullPaymentDataId") REFERENCES "PullPayments"("Id") ON DELETE CASCADE;


--
-- Name: PendingInvoices FK_PendingInvoices_Invoices_Id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "PendingInvoices"
    ADD CONSTRAINT "FK_PendingInvoices_Invoices_Id" FOREIGN KEY ("Id") REFERENCES "Invoices"("Id") ON DELETE CASCADE;


--
-- Name: PullPayments FK_PullPayments_Stores_StoreId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "PullPayments"
    ADD CONSTRAINT "FK_PullPayments_Stores_StoreId" FOREIGN KEY ("StoreId") REFERENCES "Stores"("Id") ON DELETE CASCADE;


--
-- Name: Refunds FK_Refunds_Invoices_InvoiceDataId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Refunds"
    ADD CONSTRAINT "FK_Refunds_Invoices_InvoiceDataId" FOREIGN KEY ("InvoiceDataId") REFERENCES "Invoices"("Id") ON DELETE CASCADE;


--
-- Name: Refunds FK_Refunds_PullPayments_PullPaymentDataId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Refunds"
    ADD CONSTRAINT "FK_Refunds_PullPayments_PullPaymentDataId" FOREIGN KEY ("PullPaymentDataId") REFERENCES "PullPayments"("Id") ON DELETE CASCADE;


--
-- Name: StoreWebhooks FK_StoreWebhooks_Stores_StoreId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "StoreWebhooks"
    ADD CONSTRAINT "FK_StoreWebhooks_Stores_StoreId" FOREIGN KEY ("StoreId") REFERENCES "Stores"("Id") ON DELETE CASCADE;


--
-- Name: StoreWebhooks FK_StoreWebhooks_Webhooks_WebhookId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "StoreWebhooks"
    ADD CONSTRAINT "FK_StoreWebhooks_Webhooks_WebhookId" FOREIGN KEY ("WebhookId") REFERENCES "Webhooks"("Id") ON DELETE CASCADE;


--
-- Name: U2FDevices FK_U2FDevices_AspNetUsers_ApplicationUserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "U2FDevices"
    ADD CONSTRAINT "FK_U2FDevices_AspNetUsers_ApplicationUserId" FOREIGN KEY ("ApplicationUserId") REFERENCES "AspNetUsers"("Id") ON DELETE CASCADE;


--
-- Name: UserStore FK_UserStore_AspNetUsers_ApplicationUserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "UserStore"
    ADD CONSTRAINT "FK_UserStore_AspNetUsers_ApplicationUserId" FOREIGN KEY ("ApplicationUserId") REFERENCES "AspNetUsers"("Id") ON DELETE CASCADE;


--
-- Name: UserStore FK_UserStore_Stores_StoreDataId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "UserStore"
    ADD CONSTRAINT "FK_UserStore_Stores_StoreDataId" FOREIGN KEY ("StoreDataId") REFERENCES "Stores"("Id") ON DELETE CASCADE;


--
-- Name: WalletTransactions FK_WalletTransactions_Wallets_WalletDataId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "WalletTransactions"
    ADD CONSTRAINT "FK_WalletTransactions_Wallets_WalletDataId" FOREIGN KEY ("WalletDataId") REFERENCES "Wallets"("Id") ON DELETE CASCADE;


--
-- Name: WebhookDeliveries FK_WebhookDeliveries_Webhooks_WebhookId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "WebhookDeliveries"
    ADD CONSTRAINT "FK_WebhookDeliveries_Webhooks_WebhookId" FOREIGN KEY ("WebhookId") REFERENCES "Webhooks"("Id") ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

