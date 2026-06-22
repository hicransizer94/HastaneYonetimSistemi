USE HASTANE

CREATE TABLE HASTA (
    Hasta_ID INT PRIMARY KEY,
    AdSoyad VARCHAR(50),
	DoğumTarihi DATE,
	Cinsiyet BIT CHECK (Cinsiyet IN (0,1)),
	TCKimlikNo CHAR(11) CHECK (LEN(TCKimlikNo)=11) ,
    TelefonNo CHAR(11), 
    Alerjiler VARCHAR(100),
	KronikHastalıklar VARCHAR(100),
    MevcutDurum VARCHAR(50),
    YATAN TEXT,
    AYAKTAN TEXT,
);

ALTER TABLE HASTA ADD password VARCHAR(50);

UPDATE HASTA SET password = '12345'  WHERE Hasta_ID = 1;
UPDATE HASTA SET password = '54321'  WHERE Hasta_ID = 2;
UPDATE HASTA SET password = '4680'   WHERE Hasta_ID= 3;
UPDATE HASTA SET password = '122421' WHERE Hasta_ID= 4;
UPDATE HASTA SET password = '334655' WHERE Hasta_ID= 5;
UPDATE HASTA SET password = '748297' WHERE Hasta_ID = 6;
UPDATE HASTA SET password = '016628' WHERE Hasta_ID= 7;
UPDATE HASTA SET password = '497511' WHERE Hasta_ID = 8;

INSERT INTO HASTA (Hasta_ID, AdSoyad, DoğumTarihi, Cinsiyet, TCKimlikNo, TelefonNo, Alerjiler, KronikHastalıklar, MevcutDurum, YATAN, AYAKTAN) 
VALUES (1, 'Ali Veli', '1985-05-20', 1, '12345678901', '05551234567', 'Penicillin', 'Diabetes', 'Stable', 'Yes', 'No');

INSERT INTO HASTA (Hasta_ID,AdSoyad, DoğumTarihi, Cinsiyet, TCKimlikNo, TelefonNo, Alerjiler, KronikHastalıklar, MevcutDurum, YATAN, AYAKTAN) 
VALUES (2,'Fatma Kaya', '1990-08-15', 0, '53698541211', '05559876543', 'None', 'Asthma', 'Stable', 'No', 'Yes');

INSERT INTO HASTA (Hasta_ID, AdSoyad, DoğumTarihi, Cinsiyet, TCKimlikNo, TelefonNo, Alerjiler, KronikHastalıklar, MevcutDurum, YATAN, AYAKTAN) 
VALUES (3, 'Mehmet Yılmaz', '1978-11-02', 1, '22662896580', '05559998877', 'None', 'Hypertension', 'Critical', 'No', 'Yes');
INSERT INTO HASTA (Hasta_ID, AdSoyad, DoğumTarihi, Cinsiyet, TCKimlikNo, TelefonNo, Alerjiler, KronikHastalıklar, MevcutDurum, YATAN, AYAKTAN) 
VALUES (4, 'Ali Demir', '1980-05-10', 1, '89565512319', '05001234567', 'Penisilin', 'Diabet', 'Stabil', 'Yok', 'Kontrol altında'), 
(5, 'Ayşe Kılıç', '1985-07-15', 0, '71231033333', '05007654321', 'Lateks', 'Hipertansiyon', 'İyi', 'Yok', 'Kontrol altında'), 
(6, 'Mehmet Yılmaz', '1990-03-20', 1, '31485112200', '05006543210', 'Yok', 'Astım', 'Stabil', 'Yok', 'Kontrol altında'), 
(7, 'Fatma Demir', '1992-09-25', 0, '62313589500', '05005432109', 'Aspirin', 'Obezite', 'İyi', 'Yok', 'Kontrol altında'),
(8, 'Osman Kaya', '1988-12-30', 1, '44442638858', '05004321098', 'Fıstık', 'Kolesterol', 'Stabil', 'Yok', 'Kontrol altında');

CREATE TABLE RADYOLOJI (
    RadyolojiSonucID INT PRIMARY KEY,
    RadyolojiSonuclari TEXT,
    Hasta_ID INT,
	FOREIGN KEY (Hasta_ID) REFERENCES HASTA (Hasta_ID),
    GoruntulemeTuru VARCHAR(50),
    CekimTarihi DATE
);

CREATE TABLE HASTANE (
    HastaneID INT PRIMARY KEY,
	FınansID INT,
	FOREIGN KEY (FınansID) REFERENCES FINANS (FınansID),
    Adres VARCHAR(50) UNIQUE,
	HastaneAdı TEXT ,
);

INSERT INTO HASTANE (HastaneID, FınansID, Adres, HastaneAdı) 
VALUES (1, 1, 'Erzurum, Merkez, Atatürk Caddesi No:45', 'Erzurum Devlet Hastanesi'), 
(2, 2, 'Erzurum, Yakutiye, Cumhuriyet Caddesi No:12', 'Atatürk Üniversitesi Hastanesi'),
(3, 3, 'Erzurum, Palandöken, Şehitler Caddesi No:8', 'Bölge Eğitim ve Araştırma Hastanesi'), 
(4, 4, 'Erzurum, Merkez, Şifa Sokak No:10', 'Erzurum Şehir Hastanesi'),
(5, 5, 'Erzurum, Merkez, Hastane Sokak No:9', 'Erzurum Özel Hastane'), 
(6, 1, 'Erzurum, Palandöken, Gazi Caddesi No:6', 'Erzurum Çocuk Hastanesi'),
(7, 2, 'Erzurum, Yakutiye, Fatih Caddesi No:4', 'Erzurum Kadın Hastalıkları Hastanesi'),
(8, 3, 'Erzurum, Merkez, Aydın Sokak No:7', 'Erzurum Diş Hastanesi'),
(9, 4, 'Erzurum, Palandöken, Türkmen Caddesi No:11', 'Erzurum Onkoloji Hastanesi'), 
(10, 5, 'Erzurum, Merkez, Serhat Caddesi No:13', 'Erzurum Göz Hastanesi');

CREATE TABLE YONETIM (
    YonetimID INT PRIMARY KEY,
    HastaneID INT,
	FOREIGN KEY (HastaneID) REFERENCES HASTANE (HastaneID),
    Hastane VARCHAR(50) UNIQUE,    
    Idari VARCHAR(50),
    Telefon VARCHAR(15) NOT NULL,
	Eposta VARCHAR(50),
    Gorev VARCHAR(50) NOT NULL,
	AdSoyad VARCHAR(50) NOT NULL,
);

INSERT INTO YONETIM (YonetimID, HastaneID, Hastane, Idari, Telefon, Eposta, Gorev, AdSoyad) 
VALUES (1, 1, 'Erzurum Devlet Hastanesi', 'Başhekim', '04422222222', 'baskhekim@erzurumhastane.gov.tr', 'Başhekim', 'Dr. Ali Veli'),
(2, 2, 'Atatürk Üniversitesi Hastanesi', 'Genel Müdür', '04424444444', 'genelmudur@ataturkhastane.gov.tr', 'Genel Müdür', 'Mehmet Demir'),
(3, 3, 'Bölge Eğitim ve Araştırma Hastanesi', 'Finans Müdürü', '04426666666', 'finans@bolgehastane.gov.tr', 'Finans Müdürü', 'Hakan Çelik'), 
(4, 4, 'Erzurum Şehir Hastanesi', 'Başhekim Yardımcısı', '04428888888', 'baskhekimyardimcisi@erzurumsehir.gov.tr', 'Başhekim Yardımcısı', 'Ahmet Şahin'),
(5, 5, 'Erzurum Özel Hastane', 'Genel Müdür', '04420000000', 'genelmudur@ozelhastane.gov.tr', 'Genel Müdür', 'Yusuf Karaca'), 
(6, 6, 'Erzurum Çocuk Hastanesi', 'Başhekim', '04422222223', 'baskhekim@cocukhastane.gov.tr', 'Başhekim', 'Dr. Selin Güney'),
(7, 7, 'Erzurum Kadın Hastalıkları Hastanesi', 'Başhekim', '04424444445', 'baskhekim@kadinhastane.gov.tr', 'Başhekim', 'Dr. Sibel Arslan'),
(8, 8, 'Erzurum Diş Hastanesi', 'Genel Müdür', '04426666667', 'genelmudur@dishastane.gov.tr', 'Genel Müdür', 'Burak Yıldız'), 
(9, 9, 'Erzurum Onkoloji Hastanesi', 'Başhekim', '04428888889', 'baskhekim@onkoloji.gov.tr', 'Başhekim', 'Dr. Canan Demir'),
(10, 10, 'Erzurum Göz Hastanesi', 'Genel Müdür', '04420000001', 'genelmudur@gozhastane.gov.tr', 'Genel Müdür', 'Nuri Korkmaz');

 CREATE TABLE DOKTOR (
DoktorID INT PRIMARY KEY,
AdSoyad VARCHAR(30),
BölümID INT,
FOREIGN KEY (BölümID) REFERENCES BÖLÜM (BölümID),
Branş TEXT, 
UZMAN TEXT,
ASİSTAN TEXT,
PROF TEXT,
AmeliyatTakvimi TEXT,
NöbetTakvimi TEXT,
Randevular TEXT
);
ALTER TABLE DOKTOR ADD TcNo VARCHAR(11);
UPDATE DOKTOR SET TcNo = '12345678901' WHERE DoktorID = 1; 
UPDATE DOKTOR SET TcNo = '23456789012' WHERE DoktorID = 2;
UPDATE DOKTOR SET TcNo = '34567890123' WHERE DoktorID = 3; 
UPDATE DOKTOR SET TcNo = '45678901234' WHERE DoktorID = 4;
UPDATE DOKTOR SET TcNo = '56789012345' WHERE DoktorID = 5;

ALTER TABLE DOKTOR
ADD password NVARCHAR(50);
UPDATE DOKTOR SET password = 'password1' WHERE DoktorID = 1;
UPDATE DOKTOR SET password = 'password2' WHERE DoktorID = 2;
UPDATE DOKTOR SET password = 'password3' WHERE DoktorID = 3;
UPDATE DOKTOR SET password = 'password4' WHERE DoktorID = 4;
UPDATE DOKTOR SET password = 'password5' WHERE DoktorID = 5;
UPDATE DOKTOR SET password = 'password6' WHERE DoktorID = 6;
UPDATE DOKTOR SET password = 'password7' WHERE DoktorID = 7;
UPDATE DOKTOR SET password = 'password8' WHERE DoktorID = 8;
UPDATE DOKTOR SET password = 'password9' WHERE DoktorID = 9;
UPDATE DOKTOR SET password = 'password10' WHERE DoktorID = 10;


INSERT INTO DOKTOR (DoktorID, AdSoyad, BölümID, Branş, UZMAN, ASİSTAN, PROF, AmeliyatTakvimi, NöbetTakvimi, Randevular) 
VALUES (1, 'Dr. Ahmet Yılmaz', 1, 'Kardiyolog', 'Evet', 'Hayır', 'Hayır', 'Hafta içi', 'Hafta sonu', 'Randevu bilgisi 1'),
(2, 'Dr. Fatma Kaya', 2, 'Nörolog', 'Evet', 'Hayır', 'Evet', 'Hafta içi', 'Hafta içi', 'Randevu bilgisi 2'),
(3, 'Dr. Mehmet Öz', 3, 'Ortopedist', 'Hayır', 'Evet', 'Hayır', 'Cuma', 'Pazartesi', 'Randevu bilgisi 3'),
(4, 'Dr. Zeynep Demir', 4, 'Pediatrist', 'Hayır', 'Hayır', 'Evet', 'Salı', 'Çarşamba', 'Randevu bilgisi 4'),
(5, 'Dr. Ali Can', 5, 'Onkolog', 'Evet', 'Hayır', 'Evet', 'Perşembe', 'Cuma', 'Randevu bilgisi 5'),
(6, 'Dr. Ayşe Aksoy', 6, 'Dermatolog', 'Hayır', 'Evet', 'Hayır', 'Pazartesi', 'Çarşamba', 'Randevu bilgisi 6'),
(7, 'Dr. Hasan Çetin', 7, 'Gastroenterolog', 'Evet', 'Hayır', 'Evet', 'Salı', 'Perşembe', 'Randevu bilgisi 7'),
(8, 'Dr. Elif Kara', 8, 'Endokrinolog', 'Hayır', 'Evet', 'Hayır', 'Cuma', 'Cumartesi', 'Randevu bilgisi 8'),
(9, 'Dr. Kemal Yıldız', 1, 'Kardiyolog', 'Evet', 'Hayır', 'Evet', 'Salı', 'Perşembe', 'Randevu bilgisi 9'),
(10, 'Dr. Fikret Bülbül', 2, 'Nörolog', 'Evet', 'Evet', 'Hayır', 'Çarşamba', 'Pazartesi', 'Randevu bilgisi 10');

CREATE TABLE BÖLÜM (
    BölümID INT PRIMARY KEY,
    BölümAdı VARCHAR(15),
    Konum TEXT,
);

INSERT INTO BÖLÜM (BölümID, BölümAdı, Konum) 
VALUES (1, 'Kardiyoloji', '1. Kat, A Blok'), 
(2, 'Nöroloji', '2. Kat, B Blok'), 
(3, 'Ortopedi', '3. Kat, C Blok'), 
(4, 'Pediatri', '4. Kat, D Blok'), 
(5, 'Dermatoloji', '5. Kat, E Blok'), 
(6, 'Genel Cerrahi', '1. Kat, F Blok'), 
(7, 'Gastroloji', '2. Kat, G Blok'),
(8, 'Üroloji', '3. Kat, H Blok'), 
(9, 'KBB', '4. Kat, I Blok'), 
(10, 'Göz', '5. Kat, J Blok'), 
(11, 'Dahiliye', '1. Kat, K Blok'),
(12, 'Endokrinoloji', '2. Kat, L Blok'), 
(13, 'Onkoloji', '3. Kat, M Blok'),
(14, 'Radyoloji', '4. Kat, N Blok'), 
(15, 'Fizik Tedavi', '5. Kat, O Blok');


CREATE TABLE HEMŞİRE (
HemşireID INT PRIMARY KEY,
BölümID INT,
FOREIGN KEY (BölümID) REFERENCES BÖLÜM (BölümID),
AdSoyad VARCHAR(30),
NöbetTakvimi TEXT,
);

INSERT INTO HEMŞİRE (HemşireID, BölümID, AdSoyad, NöbetTakvimi) 
VALUES (1, 1, 'Hemşire Ayşe Kılıç', 'Nöbet: 22.12.2024 08:00-20:00'), 
(2, 1, 'Hemşire Burcu Yılmaz', 'Nöbet: 23.12.2024 20:00-08:00'), 
(3, 2, 'Hemşire Canan Güneş', 'Nöbet: 24.12.2024 08:00-20:00'), 
(4, 3, 'Hemşire Derya Demir', 'Nöbet: 25.12.2024 20:00-08:00'), 
(5, 3, 'Hemşire Ebru Aydın', 'Nöbet: 26.12.2024 08:00-20:00');

CREATE TABLE RANDEVU (
RandevuID INT IDENTITY (1,1) PRIMARY KEY,
Hasta_ID INT,
FOREIGN KEY (Hasta_ID) REFERENCES HASTA (Hasta_ID),
DoktorID INT,
FOREIGN KEY (DoktorID) REFERENCES DOKTOR (DoktorID),
BölümID INT,
FOREIGN KEY (BölümID) REFERENCES BÖLÜM (BölümID),
RandevuDurumu VARCHAR(50) CHECK (RandevuDurumu IN ('Planlanmış', 'Gerçekleşmiş', 'İptal Edilmiş')), --BELLİ DEĞERLERİ ALSIN
Tarih DATE CHECK (Tarih >= '1900-01-01'), -- Tarih geçerli oLACAK
Saat DATETIME
);

INSERT INTO RANDEVU ( Hasta_ID, DoktorID, BölümID, RandevuDurumu, Tarih, Saat)
VALUES ( 1, 1, 1, 'Planlanmış', '2024-12-28', '2024-12-28 10:00:00'),
(2, 2, 2, 'Gerçekleşmiş', '2024-11-20', '2024-11-20 11:30:00'),
(3, 3, 3, 'İptal Edilmiş', '2024-10-15', '2024-10-15 14:00:00'),
(4, 4, 4, 'Planlanmış', '2024-09-10', '2024-09-10 16:00:00'), 
(1, 5, 1, 'Gerçekleşmiş', '2024-08-05', '2024-08-05 09:00:00'),
(2, 6, 2, 'İptal Edilmiş', '2024-07-25', '2024-07-25 13:30:00'),
(3, 7, 3, 'Planlanmış', '2024-06-30', '2024-06-30 15:00:00'),
(4, 8, 4, 'Gerçekleşmiş', '2024-05-20', '2024-05-20 17:00:00'),
(1, 1, 1, 'Planlanmış', '2024-04-10', '2024-04-10 12:00:00'), 
(2, 2, 2, 'İptal Edilmiş', '2024-03-15', '2024-03-15 10:30:00');

CREATE TABLE İLAÇ (
İlaçID INT PRIMARY KEY,
İlaçAdı VARCHAR(20),
YanEtkiler TEXT,
KullanımTalimatları TEXT,
SonKullanımTarihi DATE,
StokDurumu BIT DEFAULT 0, -- 0 yok 1 var
ÜretimTarihi DATE DEFAULT GETDATE() -- bugun uretildi
);
CREATE TABLE TEDAVİ (
TedaviID INT PRIMARY KEY,
Hasta_ID INT,
FOREIGN KEY (Hasta_ID) REFERENCES HASTA (Hasta_ID),
DoktorID INT,
FOREIGN KEY (DoktorID) REFERENCES DOKTOR (DoktorID),
TedaviTürü NVARCHAR(100) DEFAULT 'Genel Tedavi', -- VARSAYILAN
BaşlangıçTarihi DATE DEFAULT GETDATE(), -- Başlangıç BUGUN
BitisTarihi DATE,
);

ALTER TABLE TEDAVİ ADD İlaçID INT
ALTER TABLE TEDAVİ ADD FOREIGN KEY (İlaçID) REFERENCES İLAÇ (İlaçID)

INSERT INTO TEDAVİ (TedaviID, Hasta_ID, DoktorID, TedaviTürü,  BitisTarihi) 
VALUES (1, 1, 1, 'Kalp Ameliyatı', '2024-01-20'), 
(2, 2, 2, 'Beyin Cerrahisi', '2024-02-25'), 
(3, 2, 3, 'Ortopedik Cerrahi', '2024-03-15'), 
(4, 3, 4, 'Pediatrik Tedavi','2024-04-20'), 
(5, 3, 5, 'Dermatolojik Tedavi', '2024-05-25'), 
(6, 1, 1, 'Kalp Kontrolü', '2024-06-20'), 
(7, 4, 2, 'Nörolojik Kontrol',  '2024-07-25'),
(8, 5, 3, 'Fizik Tedavi','2024-08-20'),
(9, 5, 4, 'Çocuk Aşısı', '2024-09-25'), 
(10, 6, 5, 'Cilt Bakımı', '2024-10-20');

UPDATE TEDAVİ SET İlaçID = 1 WHERE TedaviID = 1; 
UPDATE TEDAVİ SET İlaçID = 2 WHERE TedaviID = 2; 
UPDATE TEDAVİ SET İlaçID = 1 WHERE TedaviID = 3; 
UPDATE TEDAVİ SET İlaçID = 2 WHERE TedaviID = 4;
UPDATE TEDAVİ SET İlaçID = 1 WHERE TedaviID = 5;
UPDATE TEDAVİ SET İlaçID = 2 WHERE TedaviID = 6;
UPDATE TEDAVİ SET İlaçID = 1 WHERE TedaviID = 7; 
UPDATE TEDAVİ SET İlaçID = 2 WHERE TedaviID = 8; 
UPDATE TEDAVİ SET İlaçID = 1 WHERE TedaviID = 9; 
UPDATE TEDAVİ SET İlaçID = 2 WHERE TedaviID = 10;


INSERT INTO İLAÇ (İlaçID, İlaçAdı, YanEtkiler, KullanımTalimatları, SonKullanımTarihi, StokDurumu, ÜretimTarihi) 
VALUES (1, 'Parasetamol', 'Baş ağrısı, mide bulantısı', 'Günde 2 kez', '2025-12-31', 1, '2023-01-15'),
(2, 'İbuprofen', 'Cilt döküntüsü, baş dönmesi', 'Günde 3 kez', '2024-11-30', 1, '2022-12-20'), 
(3, 'Aspirin', 'Mide ağrısı, hazımsızlık', 'Günde 1 kez', '2025-10-15', 1, '2023-02-10'), 
(4, 'Amoksisilin', 'Diyare, alerjik reaksiyon', 'Günde 2 kez', '2024-09-10', 1, '2022-11-05'),
(5, 'Lorantadin', 'Uykusuzluk, baş ağrısı', 'Günde 1 kez', '2025-08-20', 1, '2023-03-01'),
(6, 'Omeprazol', 'Karın ağrısı, şişkinlik', 'Günde 1 kez', '2024-07-25', 1, '2022-10-15'), 
(7, 'Metformin', 'Baş dönmesi, mide bulantısı', 'Günde 2 kez', '2025-06-30', 1, '2023-04-10'), 
(8, 'Simvastatin', 'Kas ağrısı, mide rahatsızlığı', 'Günde 1 kez', '2024-05-15', 1, '2022-09-25'), 
(9, 'Levotiroksin', 'Kalp çarpıntısı, titreme', 'Günde 1 kez', '2025-04-10', 1, '2023-05-20'), 
(10, 'Ramipril', 'Öksürük, baş ağrısı', 'Günde 1 kez', '2024-03-20', 1, '2022-08-30');

CREATE TABLE REÇETE (
ReçeteID INT PRIMARY KEY,
İlaçID INT,
FOREIGN KEY (İlaçID) REFERENCES İLAÇ (İlaçID),
Hasta_ID INT,
FOREIGN KEY (Hasta_ID) REFERENCES HASTA (Hasta_ID),
TedaviID INT,
FOREIGN KEY (TedaviID) REFERENCES TEDAVİ (TedaviID),
Dozaj INT,
KullanımSıklığı TEXT,
);

INSERT INTO REÇETE (ReçeteID, İlaçID, Hasta_ID, TedaviID, Dozaj, KullanımSıklığı) 
VALUES (1, 1, 1, 1, 500, 'Günde 2 kez 500 mg'), 
(2, 2, 1, 1, 200, 'Günde 3 kez 200 mg'), 
(3, 3, 2, 2, 100, 'Günde 1 kez 100 mg'),
(4, 4, 2, 2, 850, 'Günde 2 kez 850 mg'), 
(5, 5, 3, 3, 10, 'Günde 1 kez 10 mg'), 
(6, 6, 3, 3, 250, 'Günde 2 kez 250 mg'),
(7, 7, 4, 4, 20, 'Cerrahi sonrası günde 1 kez 20 mg'),
(8, 8, 4, 4, 40, 'Günde 1 kez 40 mg'), 
(9, 9, 1, 5, 50, 'Radyoterapi sonrası günde 1 kez 50 mg'), 
(10, 10, 2, 5, 5, 'Günde 1 kez 5 mg');

CREATE TABLE AMELİYATHANE (
AmeliyathaneID INT PRIMARY KEY,
Hasta_ID INT,
FOREIGN KEY (Hasta_ID) REFERENCES HASTA (Hasta_ID),
AmeliyatTürü VARCHAR(100),
CerrahAdı VARCHAR(100),
AmeliyatTarihi DATE,
KullanımDurumu BIT,
EkipmanBilgileri TEXT,
);

INSERT INTO AMELİYATHANE (AmeliyathaneID, Hasta_ID, AmeliyatTürü, CerrahAdı, AmeliyatTarihi, KullanımDurumu, EkipmanBilgileri) 
VALUES (1, 1, 'Kalp Ameliyatı', 'Dr. Ahmet Yılmaz', '2024-01-10', 1, 'Kalp pompası, stent'), 
(2, 2, 'Beyin Cerrahisi', 'Dr. Banu Uğur', '2024-02-15', 1, 'Mikrocerrahi ekipmanları, beyin stimülatörü'), 
(3, 4, 'Ortopedik Cerrahi', 'Dr. Cem Kara', '2024-03-05', 0, 'Protez, ortopedik matkap'), 
(4, 6, 'Pediatrik Cerrahi', 'Dr. Derya Güneş', '2024-04-10', 1, 'Pediatrik aletler, genel cerrahi seti'), 
(5, 8, 'Dermatolojik Cerrahi', 'Dr. Eren Can', '2024-05-15', 0, 'Lazer cihazı, doku biyopsi aletleri');

CREATE TABLE FINANS (
    FınansID INT PRIMARY KEY,
    Hasta_ID INT,
	FOREIGN KEY (Hasta_ID) REFERENCES HASTA (Hasta_ID),
    Tutar INT,
	ÖdemeTarihi DATE,
);

-- FINANS tablosuna kayıt ekleme
INSERT INTO FINANS (FınansID, Hasta_ID, Tutar, ÖdemeTarihi) 
VALUES (1, 1, 1500, '2024-12-30'),
(2, 2, 2300, '2024-12-29'),
(3, 1, 450, '2024-12-28'), 
(4, 3, 3000, '2024-12-27'),
(5, 2, 1250, '2024-12-26'), 
(6, 3, 2100, '2024-12-25'),
(7, 1, 1750, '2024-12-24'),
(8, 2, 2900, '2024-12-23'),
(9, 3, 3300, '2024-12-22'), 
(10, 1, 5000, '2024-12-21');

CREATE TABLE SIGORTA (
    SigortaID INT PRIMARY KEY,
    Hasta_ID INT,
	FOREIGN KEY (Hasta_ID) REFERENCES HASTA (Hasta_ID),
    SigortaSirketi VARCHAR(50)
);

CREATE TABLE ACİLSERVİS (
AcilServis_ID INT PRIMARY KEY,
HastaneID INT,
FOREIGN KEY (HastaneID) REFERENCES HASTANE (HastaneID),
[Kapasite] INT,
Yapılan_Müdehale TEXT,
Görevli_Personel VARCHAR(30) NOT NULL,
Kayıtlar TEXT,
);

CREATE TABLE LABORATUVAR(
LabaratuvarSonuçları_ID INT PRIMARY KEY,
Hasta_ID INT,
FOREIGN KEY (Hasta_ID) REFERENCES HASTA (Hasta_ID),
TARİH DATE,
İSTENEN_TEST_ADI VARCHAR(20),
TAHLİL_SONUCLARI TEXT,
);

INSERT INTO LABORATUVAR (LabaratuvarSonuçları_ID, Hasta_ID, TARİH, İSTENEN_TEST_ADI, TAHLİL_SONUCLARI) 
VALUES (1, 1, '2024-01-15', 'Kan Testi', 'Hemoglobin: 13.5, Beyaz Kan Hücresi: 7500'), 
(2, 2, '2024-02-20', 'Biyokimya', 'Glukoz: 90, Karaciğer Enzimleri: Normal'), 
(3, 3, '2024-03-25', 'İdrar Tahlili', 'Protein: Negatif, Glukoz: Negatif'), 
(4, 4, '2024-04-30', 'Hormon Testi', 'TSH: 2.5, T4: 1.2'), 
(5, 5, '2024-05-10', 'Kolesterol', 'Toplam Kolesterol: 180, HDL: 50, LDL: 100');


CREATE TABLE PERSONEL(
Personel_ID INT PRIMARY KEY,
GÖREVİ VARCHAR(20),
HastaneID INT,
FOREIGN KEY (HastaneID) REFERENCES HASTANE (HastaneID),
Ad_Soyad VARCHAR(50) NOT NULL,
Dogum_Tarihi DATE,
Cinsiyet CHAR(1) NOT NULL, 
TcKimlikNo CHAR(11) NOT NULL,
TelefonNo VARCHAR(14) NOT NULL,
Eposta VARCHAR(100),
Tur VARCHAR(50)
);

INSERT INTO PERSONEL (Personel_ID, GÖREVİ, Ad_Soyad, Dogum_Tarihi, Cinsiyet, TcKimlikNo, TelefonNo, Eposta) 
VALUES (1, 'Teknisyen', 'Mehmet Kaya', '1990-03-20', 'E', '34875942166', '05006543210', 'mehmet.kaya@example.com'), 
(2, 'Resepsiyonist', 'Fatma Demir', '1992-09-25', 'K', '235412993', '05005432109', 'fatma.demir@example.com'), 
(3, 'Temizlik Görevlisi', 'Ali Veli', '1988-12-30', 'E', '12879558333', '05004321098', 'ali.veli@example.com'),
(4, 'Eczacı', 'Sevim Aydın', '1983-02-05', 'K', '17887975153', '05003210987', 'sevim.aydin@example.com'),
(5, 'Laborant', 'Osman Çelik', '1986-08-15', 'E', '78955985600', '05002109876', 'osman.celik@example.com'),
(6, 'Diyetisyen', 'Gülşen Şahin', '1993-11-20', 'K', '30598625868', '05001098765', 'gulsen.sahin@example.com'), 
(7, 'Güvenlik', 'Yusuf Karadağ', '1981-04-10', 'E', '10682627444', '05000987654', 'yusuf.karadag@example.com'), 
(8, 'Radyolog', 'Ayhan Keskin', '1989-06-15', 'E', '17975375256', '05009876543', 'ayhan.keskin@example.com'), 
(9, 'Fizyoterapist', 'Selin Yıldız', '1987-01-15', 'K', '96386280066', '05008765432', 'selin.yildiz@example.com'),
(10, 'Aşçı', 'Murat Ak', '1985-04-20', 'E', '23423423456', '53456764379', 'murat.ak@example.com');

CREATE TABLE EKIPMAN (
EkipmanID INT PRIMARY KEY,
BölümID INT,
FOREIGN KEY (BölümID) REFERENCES BÖLÜM (BölümID),
EkipmanAdi VARCHAR(30),
EkipmanDurumu VARCHAR(50)
);

CREATE TABLE YATAK (
YatakID INT PRIMARY KEY,
Hasta_ID INT,
FOREIGN KEY (Hasta_ID) REFERENCES HASTA(Hasta_ID) ,
YatakDurumu VARCHAR(50),
YogunBakim BIT,
Servis BIT,
);

CREATE TABLE RADYOLOJI (
RadyolojiSonucID INT PRIMARY KEY,
RadyolojiSonuclari TEXT,
Hasta_ID INT,
FOREIGN KEY (Hasta_ID) REFERENCES HASTA (Hasta_ID),
GoruntulemeTuru VARCHAR(50),
CekimTarihi DATE
);

CREATE TABLE YONETIM (
    YonetimID INT PRIMARY KEY,
    HastaneID INT,
	FOREIGN KEY (HastaneID) REFERENCES HASTANE (HastaneID), 
    Hastane VARCHAR(50),
    Idari VARCHAR(50),
    Telefon VARCHAR(15),
	Eposta VARCHAR(50),
    Gorev VARCHAR(50) NOT NULL,
	AdSoyad VARCHAR(50) NOT NULL,
);

INSERT INTO YONETIM (YonetimID, HastaneID, Hastane, Idari, Telefon, Eposta, Gorev, AdSoyad)
VALUES (1, 1, 'Erzurum Devlet Hastanesi', 'Başhekim', '04422222222', 'baskhekim@erzurumhastane.gov.tr', 'Başhekim', 'Dr. Ali Veli'),
(2, 1, 'Erzurum Devlet Hastanesi', 'Müdür Yardımcısı', '04423333333', 'muduryardimcisi@erzurumhastane.gov.tr', 'Müdür Yardımcısı', 'Fatma Kaya'), 
(3, 2, 'Atatürk Üniversitesi Hastanesi', 'Genel Müdür', '04424444444', 'genelmudur@ataturkhastane.gov.tr', 'Genel Müdür', 'Mehmet Demir'), 
(4, 2, 'Atatürk Üniversitesi Hastanesi', 'Halkla İlişkiler Müdürü', '04425555555', 'halkiliskiler@ataturkhastane.gov.tr', 'Halkla İlişkiler Müdürü', 'Elif Yılmaz'), (5, 3, 'Bölge Eğitim ve Araştırma Hastanesi', 'Finans Müdürü', '04426666666', 'finans@bolgehastane.gov.tr', 'Finans Müdürü', 'Hakan Çelik'), 
(6, 3, 'Bölge Eğitim ve Araştırma Hastanesi', 'İnsan Kaynakları Müdürü', '04427777777', 'ik@bolgehastane.gov.tr', 'İnsan Kaynakları Müdürü', 'Zeynep Demir'),
(7, 4, 'Erzurum Şehir Hastanesi', 'Başhekim Yardımcısı', '04428888888', 'baskhekimyardimcisi@erzurumsehir.gov.tr', 'Başhekim Yardımcısı', 'Ahmet Şahin');





--TRUNCATE TABLE HASTA
--TRUNCATE TABLE PERSONEL


   SELECT TOP 10 * 
   FROM AMELİYATHANE 

   SELECT Branş,AdSoyad,AmeliyatTakvimi FROM DOKTOR
	
	SELECT * FROM HASTA
	WHERE Cinsiyet=0 OR AdSoyad NOT LIKE 'A%'

	SELECT DISTINCT AdSoyad,NöbetTakvimi
	FROM DOKTOR;

	ALTER TABLE DOKTOR 
	ALTER COLUMN NöbetTakvimi VARCHAR(255);

	--DROP TABLE PERSONEL
	--DELETE FROM PERSONEL
	--TRUNCATE TABLE PERSONEL

	UPDATE LABORATUVAR SET TARİH = GETDATE();
	ALTER TABLE LABORATUVAR 
	ADD YIL_FARKI INT; 
	UPDATE LABORATUVAR SET YIL_FARKI = DATEDIFF(YEAR, TARİH, GETDATE());

	SELECT Cinsiyet FROM HASTA
	WHERE Cinsiyet<> 1

	SELECT TOP 2 PERCENT * FROM HASTA
	ORDER BY 1

	ALTER TABLE İLAÇ ALTER COLUMN YanEtkiler VARCHAR(255); 
	ALTER TABLE İLAÇ ALTER COLUMN KullanımTalimatları VARCHAR(255);

	SELECT İlaçAdı, YanEtkiler, KullanımTalimatları FROM İLAÇ 
	WHERE İlaçAdı = 'İbuprofen' ORDER BY YanEtkiler DESC, KullanımTalimatları;

    SELECT Adres FROM HASTANE
	WHERE Adres IN ('İSTANBUL','ANKARA')  
	
	ALTER TABLE HASTA ADD HastaYaşı INT;
	UPDATE HASTA SET HastaYaşı = DATEDIFF(YEAR, DoğumTarihi, GETDATE());

	SELECT * FROM RADYOLOJI
    WHERE GoruntulemeTuru LIKE 'mr%'

	SELECT *FROM TEDAVİ
	WHERE BitisTarihi BETWEEN '2010-01-01' AND '2023-12-31' 

	SELECT YonetimID,HastaneID
	FROM YONETIM
	ORDER BY YonetimID ASC,HastaneID DESC

	UPDATE DOKTOR SET AdSoyad = 'FATMA BETÜL OREN', UZMAN = 'Kardiyoloji'
	WHERE DoktorID = 2;
	
	SELECT DISTINCT BolumID,AdSoyad
	FROM HEMŞİRE
	ORDER BY AdSoyad ASC 

	--AGREGA FONKSİYONLAR--
	SELECT COUNT(*) FROM RANDEVU 
	SELECT COUNT(*) AS ToplamHastaneSayisi FROM HASTANE;
	SELECT AVG(DATEDIFF(YEAR, DoğumTarihi, GETDATE())) AS OrtalamaYas FROM HASTA
	SELECT Hasta_ID, SUM(Tutar) AS ToplamOdeme FROM FINANS GROUP BY Hasta_ID;  --Her hasta için toplam ödeme miktarı
	
	SELECT MIN(DATEDIFF(YEAR, DoğumTarihi, GETDATE())) AS MinYas, 
	MAX(DATEDIFF(YEAR, DoğumTarihi, GETDATE())) AS MaxYas, 
	AVG(DATEDIFF(YEAR, DoğumTarihi, GETDATE())) AS OrtalamaYas FROM HASTA;

	SELECT BolumID, COUNT(*) AS HemsireSayisi FROM HEMŞİRE GROUP BY BolumID; --Her bölümdeki hemşire sayısı
	
	SELECT HastaneID, HastaneAdı, CONVERT(VARCHAR, Adres) AS Adres, CONVERT(VARCHAR, TelefonNo) FROM HASTANE
	
	SELECT DATEPART (MONTH,'1990-12-01')   --tarih bileşeni döndürür

	SELECT AMELİYATHANE.*,HASTA.MevcutDurum
	FROM AMELİYATHANE,HASTA
	WHERE AMELİYATHANE.Hasta_ID=HASTA.Hasta_ID AND AmeliyathaneID=3;

	SELECT H.AdSoyad AS İSİM_SOYİSİM,H.DoğumTarihi YAŞ,H.KronikHastalıklar HASTANIN,
	D.AdSoyad DOKTORUN,T.TedaviTürü ,R.Dozaj ,L.TAHLİL_SONUCLARI
	FROM HASTA H,DOKTOR D, TEDAVİ T,REÇETE R,LABORATUVAR L
	WHERE H.Hasta_ID=T.Hasta_ID 

	
	--SAKLI PROSEDUR--
	CREATE PROCEDURE POLİÇE
	@Hasta_ID INT
	AS 
	BEGIN 
	   SELECT Tutar,ÖdemeTarihi FROM FINANS
	   WHERE Hasta_ID=@Hasta_ID
    END
	 
	EXEC POLİÇE @Hasta_ID=4
	--DROP PROCEDURE POLİÇE
   
	
	--TETKLEYİCİ--
	CREATE TRIGGER YENİTEDAVİ
	ON TEDAVİ
	AFTER INSERT
	AS BEGIN
	SELECT ' YENİ BİR HÜCRE TEDAVİSİ KEŞFEDİLDİ.'
	END

	INSERT INTO TEDAVİ (TedaviID, Hasta_ID, DoktorID, TedaviTürü, BitisTarihi)
    VALUES (11, 7, 6, 'Kök Hücre Tedavisi', '2024-12-31');
	INSERT INTO TEDAVİ (TedaviID, Hasta_ID, DoktorID, TedaviTürü, BitisTarihi)
    VALUES (12, 8, 6, 'Kök Hücre Tedavisi', '2024-12-31');


	CREATE TRIGGER DoktorEkleme 
	ON DOKTOR 
	AFTER INSERT 
	AS BEGIN
	PRINT 'HASTANEYE YENİ BİR DOKTOR GELDİ.' 
	END;
	
    INSERT INTO DOKTOR (AdSoyad, DoktorID) VALUES ('AYŞE YILMAZ', 11);
	INSERT INTO DOKTOR (AdSoyad, DoktorID) VALUES ('ALİ YILMAZ', 12);
	select * from DOKTOR
	

	--CURSOR--  TEDAVİLER VE VERİLEN İLAÇLARI VEREN CURSOR
	DECLARE @TedaviID INT;      --YEREL DEĞİŞKENLER TANIMLANDI
	DECLARE @TedaviTürü NVARCHAR(100);     
	DECLARE @İlaçAdı VARCHAR(20);
	-- Tedavi kursörü 
	DECLARE TedaviCursor CURSOR FOR           -- TedaviCursor adlı bir kursör tanımlıyoruz ve TEDAVİ tablosundan TedaviID ve TedaviTürü sütunlarını seçiyoruz. Kursörü açarak ilk kaydı @TedaviID ve @TedaviTürü değişkenlerine alıyoruz.
	SELECT TedaviID, TedaviTürü FROM TEDAVİ;   
	OPEN TedaviCursor; 
	FETCH NEXT FROM TedaviCursor INTO @TedaviID, @TedaviTürü; 
	WHILE @@FETCH_STATUS = 0 
	BEGIN
	PRINT 'Tedavi Türü: ' + @TedaviTürü;    --WHILE @@FETCH_STATUS = 0 döngüsü içinde, her bir tedavi kaydı için ilgili ilaçları almak üzere iç içe bir kursör tanımlayacağız. Döngü, FETCH NEXT komutu ile sonraki kaydı alarak devam eder.
	-- İlaç kursörü 
	DECLARE İlacCursor CURSOR FOR      --İç içe bir kursör olan İlacCursor tanımlıyoruz ve her tedavi için REÇETE tablosundaki ilaç adlarını seçiyoruz. İlgili ilaç adlarını @İlaçAdı değişkenine alıyoruz.
	SELECT İlaçAdı FROM İLAÇ WHERE EXISTS (SELECT 1 FROM TEDAVİ WHERE TEDAVİ.TedaviID = @TedaviID);
	OPEN İlacCursor;
	FETCH NEXT FROM İlacCursor INTO @İlaçAdı; 
	WHILE @@FETCH_STATUS = 0 BEGIN PRINT ' İlaç: ' + @İlaçAdı;     --WHILE @@FETCH_STATUS = 0 döngüsü içinde, her bir ilaç kaydını yazdırıyoruz ve FETCH NEXT komutu ile sonraki kaydı alarak devam ediyoruz.
	FETCH NEXT FROM İlacCursor INTO @İlaçAdı;
	END;
	CLOSE İlacCursor;   -- İlacCursor içindeki tüm kayıtlar işlendiğinde kursörü kapatıyor ve belleği serbest bırakıyoruz.
	DEALLOCATE İlacCursor;
	FETCH NEXT FROM TedaviCursor INTO @TedaviID, @TedaviTürü;   --FETCH NEXT komutu ile TedaviCursor kursöründe sonraki kaydı alıyoruz ve döngüye devam ediyoruz.
	END;
	CLOSE TedaviCursor;   --TedaviCursor içindeki tüm kayıtlar işlendiğinde kursörü kapatıyor ve belleği serbest bırakıyoruz.
	DEALLOCATE TedaviCursor;


	---VİEW--   Her hastanın radyoloji ve laboratuvar sonuçlarını gösterecek bir VIEW 
	CREATE VIEW HastaSonucView 
	AS
	SELECT H.Hasta_ID,
	H.AdSoyad AS HastaAdı,
	R.RadyolojiSonuclari 
	AS RadyolojiSonuclari,
	R.GoruntulemeTuru AS RadyolojiGoruntulemeTuru,
	R.CekimTarihi AS RadyolojiCekimTarihi, 
	L.TAHLİL_SONUCLARI AS LaboratuvarSonuclari,
	L.İSTENEN_TEST_ADI AS LaboratuvarTestAdi,
	L.TARİH AS LaboratuvarTestTarihi 
	FROM HASTA H
	LEFT JOIN RADYOLOJI R ON H.Hasta_ID = R.Hasta_ID
	LEFT JOIN LABORATUVAR L ON H.Hasta_ID = L.Hasta_ID
	SELECT * FROM HastaSonucView;