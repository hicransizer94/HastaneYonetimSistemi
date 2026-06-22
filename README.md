HASTANE BİLGİ YÖNETİM VE TAKİP SİSTEMİ PROJESİ

1. Projenin Amacı
Bu proje, hastane bünyesindeki idari ve klinik süreçlerin dijital bir platform üzerinden yönetimini amaçlamaktadır. Sistemin temel hedefi, manuel kayıt tutma süreçlerinden kaynaklanan zaman kayıplarını önlemek, sağlık personelinin iş yükünü optimize etmek ve hasta hizmetlerinin verimliliğini artırmaktır.

2. Problem Tanımı ve Motivasyon
•	Mevcut Durum: Hastanelerdeki yüksek hasta ve personel hacmi, birimler arası koordinasyonun kağıt üzerinde veya dağınık sistemlerle yürütülmesini zorlaştırmaktadır.
•	Önem: Bilgi akışındaki aksaklıklar ve hatalı veri girişleri, tedavi süreçlerini doğrudan etkileyebilecek kritik riskler taşımaktadır.
•	Çözüm Yaklaşımı: Önerilen sistem, poliklinik, laboratuvar ve eczane gibi birimleri tek bir çatı altında toplayarak veri bütünlüğünü sağlamayı hedeflemektedir.

3. Projenin Hedefleri
•	Hasta kayıtlarının dijital ortamda güvenli ve düzenli bir yapıda depolanması.
•	Doktor, hasta ve hemşire bilgilerinin merkezi bir veritabanından yönetilmesi.
•	Randevu süreçlerinin dijitalleştirilmesiyle hastane içi yığılmaların önlenmesi.
•	Laboratuvar ve görüntüleme sonuçlarına yetkili personel tarafından hızlı erişim sağlanması.
•	İlaç ve tıbbi malzeme stoklarının takibiyle operasyonel hataların minimize edilmesi.

4. Fonksiyonel Gereksinimler
•	Kayıt Yönetimi: Hasta kabul, bilgi güncelleme ve silme işlemlerinin gerçekleştirilmesi.
•	Randevu Sistemi: Randevu oluşturma, güncelleme ve iptal fonksiyonlarının sunulması.
•	Klinik Takip: Muayene bulguları, reçete girişleri ve hasta geçmişinin takibi.
•	Güvenlik ve Yetkilendirme: Kullanıcı rollerine göre (Admin, Doktor, Hasta) veri erişim sınırlarının belirlenmesi.



5. Ders Konularının Projede Kullanımı
Sistemin geliştirilmesinde, "İleri Düzey Programlama" dersi kapsamında işlenen teknik prensipler temel alınmıştır:
•	Nesne Yönelimli Programlama (OOP): Sistem modüler bir yapıda tasarlanmıştır. Kisi sınıfı üst sınıf (parent) olarak belirlenmiş; Doktor, Hasta ve Hemsire sınıfları bu sınıftan türetilmiştir (Inheritance). Veri gizliliği için private erişim belirleyicileri kullanılmış (Encapsulation), sınıflar arası hiyerarşik bir düzen kurulmuştur.
•	Koleksiyonlar (Collections): Dinamik verilerin (hasta listeleri, randevu kayıtları vb.) yönetimi için ArrayList ve Map gibi yapılar kullanılarak verimli bir veri işleme süreci oluşturulmuştur.
•	Hata Yönetimi (Exceptions): Veritabanı bağlantı sorunları veya hatalı kullanıcı girişleri gibi durumlarda sistemin kararlılığını korumak amacıyla try-catch blokları ve özel istisna yapıları entegre edilmiştir.
•	Grafik Kullanıcı Arayüzü (GUI): Kullanıcı etkileşimini sağlamak amacıyla Java Swing kütüphanesi kullanılarak pencereler, formlar ve veri tabloları tasarlanmıştır.
•	Veritabanı Bağlantısı (JDBC): Verilerin kalıcılığını sağlamak için SQL Server kullanılmış; Java ile veritabanı arasındaki iletişim JDBC protokolü üzerinden yürütülmüştür.

6. Sistem Mimarisi ve Tasarım
UML diyagram çizlildi. Katmanlı yapı anlatıldı. Eklenecek .draw uzantılı dosyadadır.

7. Kullanılacak Teknolojiler

•	Programlama Dili: Java
•	Java Sürümü: Java SE 17 (JDK 17)
•	Veritabanı Yönetim Sistemi: Microsoft SQL Server
•	Veritabanı Sürümü: SQL Server Express
•	Veritabanı Erişimi: JDBC (Microsoft SQL Server JDBC Driver)
•	Grafiksel Kullanıcı Arayüzü (GUI): Java Swing    
         JFrame, JPanel, JButton, JTable, JTextField, JPasswordField bileşenleri kullanılmıştır.
•	Arayüz tasarımları NetBeans GUI Builder ile oluşturulmuştur.
•	IDE : Apache NetBeans IDE
•	Mimari Yaklaşım:
   Katmanlı yapı (View – Database/Connection katmanı)
             Veritabanı işlemleri MssqlBaglanti sınıfı üzerinden merkezi olarak yönetilmiştir


8. Beklenen Çıktılar
•	Uygulama çalışıyor
•	Admin girişi açılıyor 
•	Hasta ekleme çalışıyor
•	Doktor ekleme ekranı açılıyor 

Uygulama NetBeans IDE üzerinde çalıştırılmıştır. Yönetici giriş ekranı üzerinden sisteme giriş yapılabilmekte, hasta ve doktor ekleme işlemleri gerçekleştirilmektedir.

    Yönetici Girişi ekranı proje çalıştırıldığında açılıyor
  TC ve şifre doğru girildiğinde Admin Panel açılır. Burada Hasta Ekle, Doktor Ekle, Randevular, Hasta Listele, Çıkış butonları bulunuyor.
 Hasta ekle butonuna basıldığında gerekli bilgiler doldurulup Kaydet butonuna basıldığında kasta veritabanına kaydedilir.
 Kayıt yapıldığında Hasta başarıyla kaydedildi ekranı açılır.

 Doktor Ekle butonuna basıldığında bilgiler doldurulup Kaydet tıklandığında kayıt yapılır.

 Doktor eklemesi yapılır.
 
Randevular butonu ile Randevular listesine gidilir.
 
Hasta Listele butonu ile Hasta listesine gidilir.

 Projede bulunan sınıfların listesi.

 
Bu sınıf SQL veritabanı ile bağlantıyı sağlar.



 
Admin panel kodu
 

Admin giriş ekranını yöetir.

 Veritanında bulunan tablolar
 

Randevu sınıfı

 
Main metodu

OOP kullanımı	        Encapsulation ve katmanlı yapı uygulandı
GUI	                         Java Swing ile arayüz tasarlandı
JDBC	                      SQL Server bağlantısı JDBC ile sağlandı
CRUD	                     Hasta ve doktor ekleme işlemleri yapıldı
Veritabanı	               Microsoft SQL Server kullanılmıştır



