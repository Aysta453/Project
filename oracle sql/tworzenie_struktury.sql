
  CREATE TABLE "KRZYSIEK"."historia" 
   (	"id" NUMBER(*,0), 
	"id_rejestracji" NUMBER, 
	"id_klienta" NUMBER, 
	"data" DATE, 
	 CONSTRAINT "PK_HISTORIA_ID" PRIMARY KEY ("id")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "FK_HISTORIA_ID_KLIENTA" FOREIGN KEY ("id_klienta")
	  REFERENCES "KRZYSIEK"."klienci" ("id") ON DELETE SET NULL ENABLE, 
	 CONSTRAINT "FK_HISTORIA_ID_REJESTRACJI" FOREIGN KEY ("id_rejestracji")
	  REFERENCES "KRZYSIEK"."rejestracja" ("id") ON DELETE SET NULL ENABLE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
  
  
  
  CREATE TABLE "KRZYSIEK"."klienci" 
   (	"id" NUMBER(*,0), 
	"imie" VARCHAR2(50 BYTE), 
	"nazwisko" VARCHAR2(50 BYTE), 
	"pesel" FLOAT(126), 
	"miasto" VARCHAR2(50 BYTE), 
	"telefon" NUMBER(*,0), 
	"kod_indeks" NUMBER(*,0), 
	"email" VARCHAR2(50 BYTE), 
	 CONSTRAINT "KEY_klienci_id" UNIQUE ("id")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;



  CREATE TABLE "KRZYSIEK"."kolory" 
   (	"id" NUMBER(*,0), 
	"nazwa" NVARCHAR2(50), 
	 CONSTRAINT "PK_KOLORY_ID" PRIMARY KEY ("id")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;



  CREATE TABLE "KRZYSIEK"."kontakt" 
   (	"id" NUMBER(*,0), 
	"imie" NVARCHAR2(50), 
	"email" VARCHAR2(50 BYTE), 
	"temat" NVARCHAR2(50), 
	"wiadomosc" NVARCHAR2(50), 
	 CONSTRAINT "PK_KONTAKT_ID" PRIMARY KEY ("id")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;


  CREATE TABLE "KRZYSIEK"."marki" 
   (	"id" NUMBER(*,0), 
	"nazwa" NVARCHAR2(50), 
	 CONSTRAINT "PK_MARKI_ID" PRIMARY KEY ("id")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;



  CREATE TABLE "KRZYSIEK"."modele" 
   (	"id" NUMBER(*,0), 
	"nazwa" NVARCHAR2(50), 
	"id_marki" NUMBER(*,0), 
	 CONSTRAINT "PK_MODELE_ID" PRIMARY KEY ("id")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "FK_MODELE_ID_MARKI" FOREIGN KEY ("id_marki")
	  REFERENCES "KRZYSIEK"."marki" ("id") ON DELETE SET NULL ENABLE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;


  CREATE TABLE "KRZYSIEK"."pojazdy" 
   (	"id" NUMBER(*,0), 
	"id_modelu" NUMBER, 
	"id_silnika" NUMBER, 
	"id_koloru" NUMBER, 
	"rok_produkcji" NUMBER, 
	"cena" NUMBER, 
	"przebieg" NUMBER, 
	"opis" VARCHAR2(50 BYTE), 
	 CONSTRAINT "PK_POJAZDY_ID" PRIMARY KEY ("id")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "FK_POJAZDY_ID_MODELU" FOREIGN KEY ("id_modelu")
	  REFERENCES "KRZYSIEK"."modele" ("id") ON DELETE SET NULL ENABLE, 
	 CONSTRAINT "FK_POJAZDY_ID_SILNIKA" FOREIGN KEY ("id_silnika")
	  REFERENCES "KRZYSIEK"."silniki" ("id") ENABLE, 
	 CONSTRAINT "FK_POJAZDY_ID_KOLORU" FOREIGN KEY ("id_koloru")
	  REFERENCES "KRZYSIEK"."kolory" ("id") ON DELETE SET NULL ENABLE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;


  CREATE TABLE "KRZYSIEK"."rejestracja" 
   (	"id" NUMBER(*,0), 
	"id_pojazdu" NUMBER, 
	"nazwa" NVARCHAR2(50), 
	 CONSTRAINT "PK_REJESTRACJA_ID" PRIMARY KEY ("id")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "FK_REJESTRACJA_ID_POJAZDU" FOREIGN KEY ("id_pojazdu")
	  REFERENCES "KRZYSIEK"."pojazdy" ("id") ON DELETE SET NULL ENABLE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;



  CREATE TABLE "KRZYSIEK"."serwis" 
   (	"id" NUMBER(*,0), 
	"id_pojazdu" NUMBER, 
	"przebieg" NUMBER, 
	"opis" NVARCHAR2(50), 
	"przyczyna" NVARCHAR2(50), 
	"decyzja" NVARCHAR2(50), 
	 CONSTRAINT "PK_SERWIS_ID" PRIMARY KEY ("id")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "FK_SERWIS_ID_POJAZDU" FOREIGN KEY ("id_pojazdu")
	  REFERENCES "KRZYSIEK"."pojazdy" ("id") ENABLE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;



  CREATE TABLE "KRZYSIEK"."silniki" 
   (	"id" NUMBER(*,0), 
	"nazwa" NVARCHAR2(50), 
	"typ_silnika" NVARCHAR2(50), 
	"moc_silnika" NUMBER, 
	"pojemnosc_silnika" NUMBER, 
	 CONSTRAINT "PK_SILNIKI_ID" PRIMARY KEY ("id")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;



  CREATE TABLE "KRZYSIEK"."transakcje" 
   (	"id" NUMBER(*,0), 
	"id_klienta" NUMBER, 
	"id_pojazdu" NUMBER, 
	"data_transakcji" DATE, 
	"typ_transakcji" NVARCHAR2(50), 
	"kwota" NUMBER, 
	"status_zakupu" NVARCHAR2(50), 
	 CONSTRAINT "PK_TRANSAKCJE_ID" PRIMARY KEY ("id")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "FK_TRANSAKCJE_ID_KLIENTA" FOREIGN KEY ("id_klienta")
	  REFERENCES "KRZYSIEK"."klienci" ("id") ON DELETE SET NULL ENABLE, 
	 CONSTRAINT "FK_TRANSAKCJE_ID_POJAZDU" FOREIGN KEY ("id_pojazdu")
	  REFERENCES "KRZYSIEK"."pojazdy" ("id") ON DELETE SET NULL ENABLE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
