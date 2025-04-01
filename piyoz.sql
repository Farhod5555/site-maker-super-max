-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 25 2024 г., 14:10
-- Версия сервера: 8.0.30
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `piyoz`
--

-- --------------------------------------------------------

--
-- Структура таблицы `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int NOT NULL,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add category', 7, 'add_category'),
(26, 'Can change category', 7, 'change_category'),
(27, 'Can delete category', 7, 'delete_category'),
(28, 'Can view category', 7, 'view_category'),
(29, 'Can add news', 8, 'add_news'),
(30, 'Can change news', 8, 'change_news'),
(31, 'Can delete news', 8, 'delete_news'),
(32, 'Can view news', 8, 'view_news'),
(33, 'Can add contact', 9, 'add_contact'),
(34, 'Can change contact', 9, 'change_contact'),
(35, 'Can delete contact', 9, 'delete_contact'),
(36, 'Can view contact', 9, 'view_contact');

-- --------------------------------------------------------

--
-- Структура таблицы `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int NOT NULL,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$720000$MgWow54lK1UogV95WJLH52$6jqVrPcrYV34ya1GJ4ZrfpPyeSt5hmJUNx9nOc6H930=', '2024-11-25 10:30:02.713978', 1, 'admin', '', '', 'admin@gmail.com', 1, 1, '2024-11-21 14:11:52.511044');

-- --------------------------------------------------------

--
-- Структура таблицы `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `blog_category`
--

CREATE TABLE `blog_category` (
  `id` bigint NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `blog_category`
--

INSERT INTO `blog_category` (`id`, `name`) VALUES
(1, 'Iqtisod'),
(2, 'Sport'),
(3, 'UZB'),
(4, 'Jaxon');

-- --------------------------------------------------------

--
-- Структура таблицы `blog_contact`
--

CREATE TABLE `blog_contact` (
  `id` bigint NOT NULL,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `blog_news`
--

CREATE TABLE `blog_news` (
  `id` bigint NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `publish_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `status` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `category_id_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `blog_news`
--

INSERT INTO `blog_news` (`id`, `title`, `slug`, `body`, `image`, `created_time`, `publish_time`, `update_time`, `status`, `category_id_id`) VALUES
(1, 'Qishloq xo‘jaligi kooperativlari haqidagi uzoq kutilgan qonun imzolandi. Sohada nima o‘zgaradi?', 'qishloq-xojaligi-kooperativlari-haqidagi-uzoq-kutilgan-qonun-imzolandi-sohada-nima-ozgaradi', 'Kun.uz jurnalisti Shokir Sharipov bu mavzuda Qishloq xo‘jaligi vazirligi departament direktori Soatmurod Qulmirzayev va vazirlik boshqarma boshlig‘i Sunnatilla Rashidov hamda Agrobiznes assotsiatsiyasi rahbari Kamoliddin Ikromov bilan suhbat qurdi.\r\n\r\nSh.Sharipov: Birinchi savolim, kooperativ o‘zi nima?\r\n\r\nS.Qulmirzayev: Avvalambor barcha dehqonlarimiz va fermerlarimizni qishloq xo‘jalik kooperativi to‘g‘risidagi qonun qabul qilingani bilan tabriklaymiz. Kooperativ degani bir guruh yuridik yoki jismoniy shaxslarning bir maqsad sari kuch va resurslarini birlashtirgan holda muvaffaqiyatga erishishidir. Masalan, oxirgi uch-to‘rt yilda davlatimiz rahbari tashabbusi bilan 270 mingdan ortiq yer maydonlari tarqatildi. Bu yer maydonlarida 800 mingdan ortiq, salkam 900 mingta dehqon va dehqon xo‘jaliklari tashkil etildi, ya’ni kichik ishlab chiqaruvchilar.\r\n\r\nDemak, kichik ishlab chiqaruvchilar o‘zaro ixtiyoriy ravishda birlashib, mahsulotlarni sifatli va jahon talabiga javob bera oladigan darajada ishlab chiqarish, saqlash, qayta ishlash uchun hamkorlik qila boshlaydi. Ular resurslarda tejamkorlikka erishib, kam xarajat bilan yuqori daromadni ta’minlash maqsadida o‘zaro birlashadi. Bu jarayonga nafaqat fermer va dehqonlar, balki ta’minotchilar, qayta ishlovchilar, eksportyor korxonalar va boshqa agro tadbirkorlik sub’yektlari ham a’zo bo‘lishi mumkin. Bularning barchasi bir maqsad sari, kooperativ a’zolarning manfaati uchun ishlaydi.\r\n\r\nSh.Sharipov: Men ikki yil oldin nemis mutaxassisi Karl Krugdan kooperativlar to‘g‘risida intervyu olgandim, u davlatimizga ushbu qonunni ishlab chiqishda yordam bergan bo‘lib, kooperativ huquqi bo‘yicha xalqaro ekspert hisoblanadi. U aytdiki, fermerlarning birlashuvi degani fermerlar batamom birlashib ketadi degani emas, har bir fermer o‘z faoliyatini davom etaveradi, faqat kerak bo‘lganda resurslarni birlashtiradi, degan edi.\r\n\r\nS.Qulmirzayev: Shunday. Masalan, kimdir mahsulotni saqlovchi omborxonaga ega, boshqa birining esa mahsulotni qayta ishlovchi korxonasi bor, ular imkoniyatni birlashtirishadi. Bundan tashqari, kimdir turli xil xizmatlar ko‘rsatadi, masalan, o‘g‘itlarni va urug‘larni yetkazib beradi. Bu jarayonda hamma manfaat topadi.\r\n\r\nDeylik, 50 ta kichik dehqon xo‘jaligi bir kooperativga birikdi. Eksportyor korxona bu kooperativga taklif qiladi, masalan, “menga sabzi yetishtirib beringlar” deydi. Kooperativ mahsulotni yetishtirib, saqlab, qayta ishlab beradi. Fermerlar birlashishadi, kimdir texnikaga ega, kimdir mablag‘ga. Qonunchiligimizda “investitsiya kirituvchi a’zolar” degan yangi institutlar qo‘shilgan, ular o‘z mablag‘i bilan kooperativ faoliyatini rivojlantirishga hissa qo‘shadi.\r\n\r\nK.Ikromov: Hali aytilganidek, 270 ming gektar dehqonlarga yer ajratildi. Shu yerda ta’kidlash kerakki, mazkur dehqonlarda “bizlarni majburiy birlashtirib, kooperatsiyalarga qo‘shishadi, yoki yerimiz ketib qoladi” degan xavotir paydo bo‘lishi mumkin. Yo‘q, unday emas. Ular kooperativga birlashib ishlashlari ham mumkin. Qulay tomoni – misol uchun, qirq sotix yeri bor bitta dehqon yerini haydatmoqchi bo‘lsa, yerini bir million so‘mga haydashadi. Ammo o‘n gektar yerni katta texnikada haydatganda, 300 ming so‘mdan haydaydi gektarini...\r\n\r\nXuddi shunday boshqa ishlar ham bor, birlashib buxgalter olishlari mumkin, iqtisodchi, yurist yollashlari mumkin, qayta ishlash zanjirlarini o‘tkazish uchun muzlatkichlar qo‘yishlari mumkin. Bular birlashib qilinganida arzon va qulay bo‘ladi, o‘zlariga yaqin joyga qo‘yishadi, bu esa daromadlarining o‘sishiga olib keladi.\r\n\r\nSh.Sharipov: Kooperativlarning aynan joriy vaziyatdagi ahamiyati haqida gaplashsak.\r\n\r\nS.Rashidov: Bugungi kungacha ham tabiiy ravishda birlashib kelgan kooperativlarimiz bor edi. Lekin huquqiy asos fundamenti yo‘q edi. Ma’lum bir qarorlarning qanaqadir qismida ko‘rsatib ketilgandi yoki normativ huquqiy hujjatlarda ko‘rsatib berilgandi faoliyatni qanday tashkil etish. Birja orqali xomashyoni sotish boshlandi. Hamma narsa birja orqali amalga oshirilmoqda. Lekin bitta muammo fermerlarni qiynab kelmoqda: xalqaro tajribadagi kabi kooperativlarga birlashgandan keyin fermerlar oxirgi qayta ishlangan mahsulotdan ham o‘zining ulushiga ega bo‘lmayapti. Bizning fermerlar faqatgina yetishtirgan mahsulotini sotadi, xolos. Ya’ni foydasi chegaralanadi. Endilikda kooperativga birlashadigan bo‘lsa, mahsulotini birlamchi qayta ishlashdan ham ma’lum darajada foyda olishni boshlaydi.\r\n\r\nPaxtachilikni misol qilib aytadigan bo‘lsak, kooperativga qo‘shilgan fermer paxta xomashyosini tergandan keyin, tolasini va chigitini alohida qilib qayta ishlab sotadigan bo‘lsa, xomashyoni sotishdan ko‘ra yuqoriroq daromad olish imkoni paydo bo‘ladi.\r\n\r\nBunda davlat tomonidan berilayotgan imtiyozli kreditlarni kamaytirish mumkin bo‘ladi. Bora-bora kooperativlarga birlashgan fermerlar o‘z mahsulotlarini mustaqil yetishtirishni boshlaydi, o‘z texnikasi bo‘ladi, o‘z agronomi bo‘ladi va hokazo. O‘n gektardan o‘nta fermer birlashsa, faqat bitta agronomga mablag‘, ya’ni oylik to‘laydi. Agar ular alohida harakat qilmoqchi bo‘lsa, juda ko‘p xarajatlar qilishi kerak bo‘ladi.\r\n\r\nDunyo bozorida raqobat juda katta. Mahsulotimiz raqobatbardosh bo‘lishi uchun eng birinchi o‘rinda xarajatni kamaytirishimiz kerak. Xarajatni kamaytirish uchun kooperativ – haqiqiy yechim deb ayta olamiz, ya’ni kooperativlarga birlashish.\r\n\r\nS.Qulmirzayev: Yana bir muhim jihati shuki, fermerlar birlashib yil davomida zaruriy resurslarni ham birja orqali sotib olishlari mumkin. Kam miqdordagi zaruriy resurslarni sotib olib, olib kelish bir fermerga qimmatga tushadi, turli qiyinchiliklar ham yuzaga keldi.\r\n\r\nTajribadan aytish mumkinki, fermerlar moddiy resurslarni birlashib sotib olish va saqlash orqali o‘ttiz besh-qirq foizgacha xarajatlarni qisqartirishga erishilyapti. Biz buni Germaniya tajribasida tahlil qilganmiz.\r\n\r\nIkkinchi muhim masala shundaki, fermerlarimiz jahon bozoriga sekin-sekin o‘z mahsulotlari bilan kirib borishadi. Jahon bozoriga kirib borishdagi eng muhim qadam bu – kooperativlarga birlashish. Jahon bozori talab qiladigan har qanday sertifikatlarni bitta fermer qo‘lga kirita olmaydi. GLOBALG.A.P. deysizmi, boshqasimi, jahon bozorida talab qilinadigan sertifikatlarni olish kerak. Ellikta fermer kooperativga birlashganda, bu osonlashadi.\r\n\r\nBu yoqda marketing va logistika bor, kompleks loyihalar ishlab chiqish bor – bularni ham birlashib qilish oson.\r\n\r\nSh.Sharipov: Xorijdan mutaxassislarni jalb qilish mumkin...\r\n\r\nS.Qulmirzayev: Ha. Qonunchilik bo‘yicha endilikda tajribali menejerlarni, xorijiy ekspertlarni va yetakchi mutaxassislarni yollash boshqaruvda, masalan, ijrochi direktor sifatida misol keltirish mumkin.\r\n\r\nKooperativlar xalqaro grantlar va moliya institutlaridan mablag‘ jalb qilishda xalqaro aloqalarini boyitadi. Huquqiy yordam ko‘rsatish kooperativning asosiy faoliyatidan biridir. Bu ham muhim hisoblanadi. Davlat aralashmasligi kerak. Kooperativ tijorat tashkiloti sifatida tan olinadi va erkin faoliyat qiladi, mahsulotni yetishtiradi, qayta ishlaydi, sotadi va eksport qiladi. Xizmat ko‘rsatish asosan o‘z a’zolariga yo‘naltirilgan.\r\n\r\nFermerlar moliyaviy boshqaruv tushunchalaridan bexabar bo‘lishi mumkin. Zamonaviy savdo jarayonlarini qanday boshqarish kerakligini tushunish uchun o‘qitish talab etiladi. Elektron tizimga o‘tganimiz sababli elektron kalitlardan qanday foydalanishni bilish muhimdir. Ishlarning moliyaviy tomonini, mablag‘lar aylanmasini, uning tekshiruvlarini, shaffofligini ta’minlashga alohida mutaxassislar jalb qilinishi mumkin bo‘ladi. Bu xarajat va daromad hisob-kitobi o‘z vaqtida yuritilishiga, o‘z vaqtida soliq organlariga, davlat tashkilotlariga hisobotlar topshirilishida juda muhim ahamiyatga ega.\r\n\r\nSh.Sharipov: Besh, o‘n yoki yigirma fermerlar birlashib, kooperativ tuzaylik, dedi. Ularning birinchi harakati nimadan iborat bo‘lishi kerak, nima qilishlari kerak bo‘ladi?\r\n\r\nS.Qulmirzayev: Qonunchilikda ko‘zda tutilgan, kooperativni tashkil etish uchun alohida belgilangan ma’lumotlar asosida harakat qilishlari kerak. Birinchi qadam – kooperativ tashkil etishni istagan tashabbuskorlar, xoh jismoniy yoki yuridik shaxslar bo‘lsin, kooperativning ta’sis hujjatlarini tayyorlashlari kerak.\r\n\r\nDastavval o‘zlarining ichidan, o‘zlari istagan holda, rahbar saylaydi. Rahbar tomonidan ta’sis hujjatlari imzolanadi, va kooperativning nizomi ishlab chiqiladi. Kooperativning asosiy masalalari nizomda bo‘ladi. Ta’sischilar tomonidan ishlab chiqilgan ustav joylardagi davlat xizmatlari markazlaridan ro‘yxatdan o‘tkaziladi. Bu jarayonda tuman hokimining qarori kerak emas, aksincha, qonunda keltirilganidek, qishloq xo‘jaligi kooperativi ixtiyoriy ravishda birlashgan jismoniy yoki yuridik shaxslarni ifodalaydi.\r\n\r\nShu paytgacha tugab ketgan kooperativlar faoliyatni tekshirganimizda, omadsizlik sababi boshqaruvdagi yoki ta’sis hujjatlardagi xatoliklar ekanini ko‘rishimiz mumkin. Shu uchun qonunda ikir-chikirigacha batafsil belgilandi.\r\n\r\nUchtaga organlar bo‘ladi. Umumiy yig‘ilish (oliy organ), kuzatuv kengashi (nazorat organi) va ijro organi – boshqaruvda muhim ahamiyatga ega. Ro‘yxatga olingandan keyin, bu organlar o‘z ishlash tartibini belgilaydilar. Umumiy yig‘ilishda ular o‘zlarining uch yillik, besh yillik maqsadlarini, yo‘nalishini belgilaydilar.\r\n\r\nBu yilgi reja mahsulotni saqlab sotish bo‘lsa, kelasi yil dastlabki qayta ishlab sotish, undan keyingi yilda chuqur qayta ishlab sotish va hokazo.\r\n\r\nEng asosiysi, bu yerda teng huquqlilik bo‘ladi: har bir a’zo bitta ovozga ega, u yuz gektar yeri bo‘lsa ham, o‘n gektar yeri bo‘lsa ham bir xil ovozga ega. Kooperatorlarning tugab ketishiga aynan shu sabab bo‘lgan – ichidan yuqoriroq ulushga ega bo‘lgan operativ a’zosi doim boshqalarni bosim ostida ushlashga harakat qilgan. Shundan kelib chiqqan holda, har bir a’zo bitta ovozga ega bo‘lish qonunda belgilandi. Majburiy paybadal ham bor. Majburiy paybadali ham teng miqdorda belgilangan.\r\n\r\nKooperativning nizomida bo‘lishi kerak: har bir a’zoning kirishi, chiqishi, qabul qilinishi, kooperativdan chiqarilishi, paybadallar, bo‘linmas jamg‘armalar, zaxira jamg‘armalardan qanday foydalanish, zararlarni qanday taqsimlash, foydani qanday taqsimlash, barchasi ustavda o‘z aksini topadi. Ustavda a’zolarga qo‘yiladigan talablar ham bor, talabiga javob berish kerak. Bu talablar ham muhim hujjat hisoblanadi.\r\n\r\nK.Ikromov: Ustavni sodda dehqoncha tilda aytadigan bo‘lsak, qonunni buzmagan holda o‘zaro kelishib ish yuritish usuli bu. Kelishuv ustavda aks etadi, bu kelishuv qonunda ko‘rsatilgan barchasini o‘z ichiga oladi. Bundan tashqari, qonunni buzmagan holda o‘zaro shartlarni yozib qo‘yib kelishib ishlashadi, o‘zaro sherikchilik shartnomasidek. Teng ovozga egalik foydani taqsimlashda teng olaman degani emas. Sof foyda taqsimotida o‘sha yer maydoniga mutanosib ravishda taqsimot qilinadi.\r\n\r\nS.Rashidov: Yuz gektar yerga ega bo‘lgan a’zo olgan hosiliga qarab foiz oladi, o‘n gektarlik yeri bor a’zosi o‘n gektarga mutanosib ravishda foydasini oladi. Ya’ni hamma teng huquqli bitta ovozga ega, lekin foydani taqsimlashda kimda ko‘proq yer bo‘lsa, o‘shanga mutanosib ravishda foyda olinadi. Bu narsa ham ustavda aniq ko‘rsatilishi kerak. Boshqa holatlar nazarda tutilishi kerak bo‘lsa, uni ham yozish imkoni bor. Ya’ni ustavda chegaralarni belgilamaganmiz. Qonunchilikda taqiqlanmagan boshqa yo‘nalishlarda ham bemalol ko‘rsatish mumkin bo‘ladi.\r\n\r\nSh.Sharipov: Kooperativ rahbarni saylash bu – a’zolardan qaysidir fermer saylanadimi rahbar qilib yoki chetdan ish yurituvchi yollanishi mumkinmi?\r\n\r\nS.Qulmirzayev: A’zolar ichidan saylanadi. Siz aytayotganday, menejerlarni va boshqa mutaxassislarni yollash ijro organining vakolatida. Umumiy yig‘ilishga masala qo‘yiladi: \"Kooperativimizga tajribali menejer kerak\". Qonunchilikda bunga taqiqlov qo‘yilmagan.\r\n\r\nKuzatuv kengashi ham kooperativ a’zolari ichidan saylanadi. O‘nta fermer kooperativ tuzmoqchi, ta’sis yig‘ilishini o‘tkazmoqda. O‘n kishi yig‘ilishida kelishib oladi va aytadi: \"Endi kimdir hujjatlarni ro‘yxatdan o‘tkazishi kerak\". O‘n kishi hujjatni ko‘tarib yurmaydi-ku, ichidan bir kishini tayinlaydi. Hujjatga imzo qo‘yish va uni ro‘yxatdan o‘tkazish uchun vakolat beradi. O‘n kishi nomidan vakolat beriladi.\r\n\r\nRo‘yxatdan o‘tkazgandan keyin, birinchi qilinadigan ish: umumiy yig‘ilish chaqiriladi, yana o‘sha o‘n kishi yig‘iladi. Endi ular aytadi: \"Mana, tashkilotni, ya’ni kooperativni ro‘yxatdan o‘tkazdik. Qishloq xo‘jaligi kooperativi tashkil etildi\". O‘n kishi ta’sischi. Endi, mana shu o‘n kishi ham ta’sischi, ham a’zo.\r\n\r\nKooperativning umumiy yig‘ilishi – eng oliy organ. Bu hamma a’zolar tomonidan o‘tkaziladigan yig‘ilish bo‘lib, hamma teng ovozga ega. Keyin umumiy yig‘ilishda bitta ijrochi direktor, yoniga buxgalter, agronom, masalan, tayinlashi mumkin. Bu tashkil etilgandan keyingi qilinadigan ishlardir. Kuzatuv kengashi esa usha aynan kooperativ a’zolarining ichidan tayinlanadi. Ular o‘sha kooperativdagi ijrochi direktorni kuzatib boradi: o‘tkazmalar, pul bilan muomala, hisobotlar topshirishi.\r\n\r\nK.Ikromov: Kooperativlar 250 yillik tarixga ega. Yaponiya, Xitoy yoki Amerikada kooperativlar juda ham rivojlangan tizimdir. Sababi – xarajatlarni kamaytirish va daromadni oshirish ilinji. Moliyaviy muammolarni hal qilish maqsadida birlashganlar. Keyinchalik moliyaviy jihatdan rivojlanib ketganlar. Qishloq xo‘jaligi yuqori tavakkalchilikka asoslangani uchun banklar juda yuqori foizlarda kredit bergan. Shu sababli ular o‘z banklarini tashkil etishgan. Ko‘pgina davlatlarda kooperativlar o‘z banklariga ega. Ular arzon kreditlar orqali rivojlanishni keyingi bosqichga o‘tkazishgan.\r\n\r\nMisol uchun, Germaniyada Raiffeisen Bank degan bank bor. U dunyo bo‘yicha top o‘ntalikka kiradi. Yaponiyada ham shunday bank mavjud bo‘lib, top yigirmatalikdagi banklardan biri hisoblanadi. Kooperativlar faqat qishloq xo‘jaligi bilan cheklanib qolmasdan, ijtimoiy masalalar bilan ham shug‘ullanadi. Kooperativlar mavjud bo‘lgan joyda maktablar va boshqa ijtimoiy obektlar rivojlanadi. Ya’ni ko‘plab ijtimoiy masalalarni hal qilishadi.\r\n\r\nKooperativlar sanoatlashtirishni yo‘lga qo‘yib, zavodlarini qurib bo‘lishgan. Endi qishloq rivojlanishi, infratuzilmasini yaxshilash va odamlarning farovonligini oshirishga harakat qilishmoqda.\r\n\r\nS.Qulmirzayev: Xorijiy davlatlarda kooperativlarda ijtimoiy g‘amxo‘rlik prinsipi asosiy tamoyillardan biri sifatida kiritilgan. Bu prinsip bizning qonunimizdan, yangi qonundan ham joy olgan.\r\n\r\nK.Ikromov: Germaniya, AQSh, Kanada, Xitoy, Yaponiyada kichik ishlab chiqaruvchilarning 70 foizdan ortig‘i resurslarni kooperativ orqali olishadi, mahsulotni ham kooperativ orqali sotishadi. Shuni ko‘rishimiz mumkin, 70 foiz kishilik ishlab chiqaruvchilar kooperativlar orqali resurslar va mahsulotlarni sotishadi.\r\n\r\nS.Qulmirzayev: Yaponiyada, Germaniyada kooperativlarning uyushmalari mavjud. Bu uyushmalar yon-atrof tuman, viloyat va milliy darajada tashkil qilinadi. Ular asosan ijtimoiy masalalarni hal qilish, uy-joy bilan ta’minlash, kooperativ a’zolariga kreditlar berish, sog‘lomlashtirish maskanlari va shuningdek ularning kasalxonalari bilan shug‘ullanadi. A’zolar va ularning oila a’zolariga xizmat ko‘rsatadigan maktablar, hammasi kooperativlar orqali amalga oshiriladi.\r\n\r\nSh.Sharipov: Muhimi, bu jarayonda hammasi ko‘ngilli ravishda amalga oshiriladi, majburlov bilan emas.\r\n\r\nK.Ikromov: Tabiiy va ixtiyoriy ko‘rinishda. Tizim dehqonning o‘ziga nima va qachon qilish kerakligini bilish imkonini beradi. Kooperativ buyurtma beradi va mahsulotlarni yetkazib beradi. Mahsulotning narxidan xavotirlanmaydi, sababi kooperativ kerakli vaqtda qulay narxda mahsulotni sotadi.\r\n\r\nS.Qulmirzayev: Kooperativlar aniq yo‘nalishlarga asoslangan: meva-sabzavotchilikda olma kooperativlari, guruch ishlab chiqaruvchilar kooperativlari misol bo‘ladi. Yaponiyada guruch ishlab chiqaruvchilar kooperativini o‘rganib, boshqaruvi bilan hamkorlikda ishlashini ko‘rdik. Guruch yetishtirilgandan keyin kelishilgan narxda ichki bozorda shakllangan narxda a’zolariga yetkaziladi. Guruch saqlanib, jahon bozorida sotiladi.\r\n\r\nJahon bozorida sotilgandan keyin, a’zolarni yana bir marta yig‘ib, “biz guruch uchun o‘n so‘mdan bergan edik, lekin jahon bozorida yigirma so‘mdan sotdik, besh so‘mni kooperativning faoliyatini rivojlantirishga, zaxiraga, jamg‘armalarga va hokazolar uchun olamiz, har bir a’zoga ulushi bo‘yicha besh so‘mni taqsimlab chiqamiz yoki agar qayta ishlangan bo‘lsa, oxirgi daromaddan ulushni taqsimlab beramiz”, deyiladi.\r\n\r\nSh.Sharipov: Demak, qanday mahsulot yetishtirish masalasini hal qilayotganda pragmatik yondashiladi, kimdir \"buni ekasan\" demaydi.\r\n\r\nK.Ikromov: Nafaqat “paxta, g‘alla yoki daraxt ekasan\" degan narsa bor, hattoki navlarni kelishib tanlashadi. Masalan, o‘n yil oldin olma o‘stirishgan bo‘lsa, “bu nav eskirdi” deb, yangi nav ekib yuborishadi kelishib. Asosiysi, bir xil nav ekishadi, chunki “obyom” kerak. Mahsulotni katta savdo tarmoqlariga yetkazib berish maqsadida tez-tez navlarini o‘zgartirib turishadi va ishlariga hech kim aralashmaydi.\r\n\r\nSh.Sharipov: Kooperativda qarorlar kollegial tarzda qabul qilinadi. Kvorum masalasi qanday bo‘ladi?\r\n\r\nK.Ikromov: Bu ustavda belgilab ketiladi. O‘zaro kelishilgan holda hal qilinadi.\r\n\r\nSh.Sharipov: Hamma jihatlarni hisobga olish kerak, kelgusi xavotirlar haqida, kimda qanday xavotirlar bor?\r\n\r\nK.Ikromov: Dehqonlarda xavotir bo‘lishi mumkin. Ular bu yangi tizimni eski kolxoz deb o‘ylashlari mumkin. Lekin kooperativga majburlanmaydi. Kooperativga o‘tganda ham yerlar o‘zlarida qoladi, uzoq muddatli ijara ular uchun saqlanib qoladi. Hisob raqamlari o‘zlarida qoladi. Istasa kooperativga kiradi, xohlasa chiqib ketadi. Ustavlarda belgilangan chiqish muddati bor, mavsumning oxirida chiqib ketib qolinsa, jarimalar qo‘llanishi mumkin.\r\n\r\nBoshqa kooperativlar bilan ishlash imkoni ham bor. Agarda klaster tizimi qulay bo‘lsa, ularga qo‘shilib ishlash mumkin. Joylarda yaxshi klasterlarimiz ham bor va ular bilan ishlash qulay bo‘lsa, kooperativlar o‘z ishlarini bemalol davom ettirishadi. Ular bilan ham ishlayveradi, unda hech qanday muammo yo‘q.\r\n\r\nSh.Sharipov: Karl Krug bilan gaplashganimda aytdi bu klasterlarning ham manfaatiga to‘g‘ri keladi, chunki kooperativ mahsulotni tayyor qilib beradi.\r\n\r\nS.Qulmirzayev: Shu yeri juda muhim: kooperativlar mahsulotlarni tayyor holda yoki birlamchi qayta ishlagan holda klasterlarga yetkazib berishi mumkin. Bu jarayonda klaster umuman ishlab chiqarishga mablag‘ tikishi yoki qandaydir mexanizatsiya xizmatlari ko‘rsatishi shart emas. Klaster boshqa majburiyatlarni bajarishga majbur bo‘lmaydi. Klaster kooperativdan birja orqali mahsulotni sotib olishi mumkin. Ya’ni klaster o‘zining faoliyat yo‘nalishi bilan shug‘ullanadi, har bir fermer bilan alohida ishlash o‘rniga.\r\n\r\nS.Rashidov: Klaster uchun qulaylik tomoni shundaki, katta hajmdagi mahsulot tayyorlanadi, sifatini ko‘radi, narxini kelishadi, olib ketadi. Vaqtdan yutiladi: ham dehqon vaqtdan yutadi, ham klaster vaqtdan yutadi. Vaqt juda qimmat narsa. Eng asosiysi klaster o‘z yo‘nalishini rivojlantira oladi, chunki u mahsulot yetishtirishga o‘zini chalg‘itmaydi.\r\n\r\nItaliya tajribasini o‘rganganimizda, ularda o‘zlarining \"MOF\" degan bir tajribasi bor. Har bir kooperativning supermarketda joyi bor. Bu qo‘shma kooperativlarning natijasi. Shu darajaga yetishgan. Italiya tajribasida katta-katta ishlab chiqaruvchilarning, qayta ishlovchi korxonalarning kooperativga qo‘shilishi natijasida uch ming-to‘rt ming a’zo shakllangan. Natijada, mayda ishlab chiqaruvchilar o‘sha qayta ishlovchi korxonalar sotgan mahsulotidan ham ma’lum ma’noda o‘z foydasini olishga erishgan, qo‘shilgan qiymatdan foyda olishni boshlagan. Bu juda katta motivatsiya bergan ishlab chiqaruvchiga.\r\n\r\nEndilikda bizning klasterlarda ham imkoniyat bor, fermer bilan bemalol birlashib bitta kooperativda ishlashi mumkin. Klasterlar uchun hech qanday chegara qo‘yilmagan, ular bemalol hududidagi fermerlar bilan bitta kooperativda bo‘lishi mumkin. Bu yangi bir ko‘rinish, ya’ni yangi bir tizim shakllanishiga olib keladi. Men o‘ylaymanki, bu klasterlarga ham juda katta imkoniyat ochib beradi, ya’ni kooperativlarning shakllanishi va rivojlanishi ertaga kattaroq korporatsiyalarda birlashishga olib keladi.\r\n\r\nBilasiz, viloyat doirasida katta-katta qayta ishlovchi korxonalarimiz ham mavjud. G‘allachilikda yoki paxtachilikda beshta bosqichga ega bo‘lgan, to‘rtta bosqichdan o‘tib tayyor mahsulotgacha yetkazadigan zavodlarga ega korxonalar mavjud.\r\n\r\nDunyodagi eng yaxshi rivojlangan davlatlardan, Germaniya, Italiya, Amerika, Koreyadan kooperativlar bo‘yicha andazalarni o‘zlashtirdik va o‘zimizga mos modul yaratdik.\r\n\r\nSh.Sharipov: Deylik, kooperativ paxta yetishtirdi, hosil tayyor bo‘ldi, sotish masalasi kelib chiqadi...\r\n\r\nS.Rashidov: Oddiy tajribadan oddiy qilib tushuntiraman: bugungi kungacha ko‘plab kooperativlar tabiiy ravishda shakllandi, fermerlar paxta yetishtirgan holda kooperativ sifatida ro‘yxatga turib, saqlash punktlarini tayyorlashdi, o‘zlarining tarozi va laboratoriyalarini o‘rnatishdi. Paxtani saqlaydigan punktlar xavfsizlik talablariga javob beradigan holatga keltirildi.\r\n\r\nShundan so‘ng Favqulodda vaziyatlar vazirligi, Agroinspeksiya, qishloq xo‘jaligi bo‘limi va boshqa tashkilotlar kelib, kooperativning saqlash punktini tekshirganlari va tayyorligini tasdiqlagach, ular paxtani saqlashga ruxsat oldilar. Endi ular o‘z paxtalarini erkin holda, ya’ni spot-shartnomalari va birja savdolari orqali ixtiyoriy tadbirkorlik sub’yektlariga sotishi mumkin. Bu Vazirlar mahkamasining 680-sonli qarorida ham belgilangan.\r\n\r\nS.Qulmirzayev: Aynan bir muddatda sotish talab etilmaydi. Misol uchun, saqlayotgan xomashyosini bozordagi narxning ko‘tarilishiga qarab xohlagan paytda sotish mumkin va uni qayta ishlab, qo‘shilgan qiymat qo‘shib sotish mumkin. Deylik, paxtani tola sifatida, chigitini ajratib, qayta ishlab, shrot va boshqa turdagi mahsulotlarni ham sotishi mumkin. “Dovalicheskiy” tolani ham ip-kalava qilib sotishi mumkin. Xohlasa xomashyo sifatida, xohlasa qayta ishlab sotadi. Pul zaruratiga qarab.\r\n\r\nK.Ikromov: Nega kooperativ, MChJ emas degan savol tug‘ilishi mumkin. Mas’uliyati cheklangan jamiyat bilan kooperativning nima farqi bor, desa: kooperativda har bir a’zo o‘zining bitta ovoziga ega, mas’uliyati cheklangan jamiyatda esa kim ko‘proq ulush kiritgan bo‘lsa, o‘sha asosiy ovozga ega. Masalan, 51 foiz ulush kiritgan odam asosiy qarorlarni qabul qiladi. Kooperativda esa bu demokratik prinsiplarga asoslangan bo‘lgani uchun har bir a’zo yeridan yoki o‘sha qo‘shgan paybadalidan qat’i nazar bittadan ovozga ega. Mahsulotni kimga sotishni, masalan, o‘zaro kelishgan holda ovoz berish yo‘li bilan hal qilishadi.\r\n\r\nS.Qulmirzayev: Keyingi bosqichdagi eng muhim maqsadimiz – O‘zbekistondagi kooperativlarni xalqaro darajaga ko‘tarish. Keyingi bosqichda bizning kooperativlarimiz xalqaro kooperativlar alyansiga a’zo bo‘lishi kerak. Xalqaro kooperativ alyansiga a’zo bo‘lishning juda muhim sabablari bor: xalqaro moliya bozoridan arzon kreditlarni to‘g‘ridan to‘g‘ri jalb qilish, jahon bozorida o‘rin topish, xalqaro alyanslar tomonidan berilayotgan imtiyozlardan foydalanish va xalqaro grantlarni faoliyatga jalb qilish.\r\n\r\nBu borada Qishloq xo‘jaligi vazirligi va tegishli vazirlik idoralari bilan muhim ishlar amalga oshiriladi. Tegishli qonunosti hujjatlari qabul qilinadi va umuman mamlakatimizda qishloq xo‘jalik kooperativlari faoliyati jahon talablari asosida rivojlanishi uchun muhim tadbirlar amalga oshiriladi. Mazkur qonunning qabul qilinishi ham bir qadam oldinga siljish bo‘ldi. Endi buning ko‘ngildagidek ishlashi yo‘lida fermerlarning roli katta, ya’ni fermerlar o‘z ustidan ishlab, qonunlar bilan tanishib, o‘zlashtirishiga bog‘liq bo‘ladi.', 'news/images/Снимок_экрана_1_KhjODIn.png', '2024-11-21 14:23:47.176811', '2024-11-21 14:23:05.000000', '2024-11-21 14:23:47.176811', 'PB', 1),
(2, 'Ummon O‘zbekistondan qishloq xo‘jaligi mahsulotlarini import qilmoqchi', 'ummon-ozbekistondan-qishloq-xojaligi-mahsulotlarini-import-qilmoqchi', 'Muloqot chog‘ida O‘zbekiston-Ummon munosabatlarining hozirgi holati va uni yanada rivojlantirish istiqbollari muhokama qilindi.\r\n\r\nJanubiy ash-Sharqiya muhofazasi hokimiga Sirdaryo viloyati bilan hududlararo aloqalarni yo‘lga qo‘yish,  ushbu masalalarni muhokama qilish maqsadida muhofaza delegatsiyasining yurtimizga tashrifini uyushtirish, ikki viloyat tadbirkorlari ishtirokida biznes-forum o‘tkazish taklifi bildirildi.\r\n\r\nHokim Yah’yo bin Badr al-Mavali bildirilgan takliflarni qo‘llab-quvvatlashini va mamlakatlarimiz o‘rtasida rivojlanib borayotgan aloqalarga o‘z hissasini qo‘shishga tayyorligini bildirdi. U, shuningdek, O‘zbekistondan qishloq xo‘jaligi mahsulotlarini import qilish imkoniyatlari mavjudligini ham ta’kidladi.\r\n\r\nO‘zbekiston diplomatlari, shuningdek, Ummon Savdo-sanoat palatasining Janubiy ash-Sharqiya muhofazasi boshqarmasi rahbari Anvar as-Sananiy va hudud tadbirkorlari bilan uchrashdilar. Unda O‘zbekistonda yaratilgan qulay investitsiyaviy muhit va investorlarga berilayotgan imkoniyatlar, mamlakatimizga sarmoya kiritishning afzalliklari borasida atroflicha ma’lumot berildi. Ummonlik tadbirkorlar O‘zbekiston bilan savdo-iqtisodiy aloqalarni o‘rnatishga chaqirildilar.\r\n\r\nMuloqot yakunida joriy yilda Sirdaryo viloyatida O‘zbekiston-Ummon biznes-forumini o‘tkazish yuzasidan ahdlashib olindi.', 'news/images/QiYavU1Bpt1_twoiOaxMAw8QJzCOINQi.jpg', '2024-11-21 14:24:17.139355', '2024-11-21 14:23:47.000000', '2024-11-21 14:24:17.139355', 'PB', 1),
(3, 'O‘zbekiston qishloq xo‘jaligida importni 50 foizga qisqartirish rejalashtirilmoqda', 'ozbekiston-qishloq-xojaligida-importni-50-foizga-qisqartirish-rejalashtirilmoqda', 'Prezident Shavkat Mirziyoyev ishtirokida Oliy Majlis Qonunchilik palatasining majlisi bo‘lib o‘tyapti.\r\n\r\nPrezident aholi soni ko‘payib borayotgan hozirgi sharoitda oziq-ovqat xavfsizligini ta’minlash eng dolzarb vazifa bo‘lib qolishini ta’kidladi.\r\n\r\nBu borada qishloq xo‘jaligining barcha tarmoqlari, avvalo, meva-sabzavotchilikni intensiv rivojlantirish, yangi urug‘ navlarini yaratib, importni 50 foizga qisqartirish bo‘yicha dasturlar bor.\r\n\r\nHukumat bu dasturlar ijrosini ta’minlab, qishloq xo‘jaligida ishlab chiqarishni 1,3 barobar oshirish, har gektar yerdan olinadigan o‘rtacha daromadni 5 ming dollarga yetkazish, sohada eksport hajmi 10 milliard dollardan iborat bo‘lishi, suv tejaydigan texnologiyalar bilan qamrab olingan yer maydonlarini 2 karra oshirish bo‘yicha ishni samarali tashkil etishi zarur.\r\n\r\nYangi yilda suv tejaydigan texnologiyalarni joriy qilishga 5 trillion so‘m, kanallarni betonlashga 800 milliard so‘m yo‘naltiriladi.', 'news/images/7Buc7DKKCgqDBmMc9-2d4GN6MBDObM58.jpg', '2024-11-21 14:24:47.472326', '2024-11-21 14:24:17.000000', '2024-11-21 14:24:47.472326', 'PB', 1),
(4, 'Shavkat Mirziyoyev Samarqand viloyatini rivojlantirish yuzasidan yig‘ilish o‘tkazdi', 'shavkat-mirziyoyev-samarqand-viloyatini-rivojlantirish-yuzasidan-yigilish-otkazdi', 'Aholi va tadbirkorlar bilan uchrashuvlar o‘tkazilib, 4,1 milliard dollarlik 120 ta loyihani amalga oshirish imkoniyati aniqlangan. Kelgusi yilda Samarqand viloyatida hududiy dasturlar doirasida kamida 1 milliard 850 million dollar investitsiyalarni o‘zlashtirish, 20 ming ish o‘rni yaratish va qo‘shimcha 1,2 trillion so‘mlik mahsulot ishlab chiqarish hisob-kitob qilingan.\r\n\r\nPast Darg‘om tumani “Chimboyobod” hududida hokimlik zaxirasida turgan 234 gektar yerda maxsus sanoat zonasini tashkil qilish mumkin. Tadbirkorlar u yerga 500 million dollar investitsiya kiritib, farmatsevtika, kimyo, elektrotexnika, qurilish materiallari va oziq-ovqat loyihalarini boshlashga tayyorligini bildirgan.', 'news/images/7N-5rO_FXIXK8LoMdqnIzP4Fc0Eddkf2.jpg', '2024-11-21 14:25:34.130554', '2024-11-21 14:24:47.000000', '2024-11-21 14:25:34.130554', 'PB', 1),
(5, 'Shavkat Mirziyoyev Samarqand viloyatini rivojlantirish yuzasidan yig‘ilish o‘tkazdi', 'shavkat-mirziyoyev-samarqand-viloyatini-rivojlantirish-yuzasidan-yigilish-otkazdi', 'Zarafshon daryosi atrofidagi 25 gektar toshloq yer “Urgut” erkin iqtisodiy zonasiga qo‘shilsa, 30 million dollarlik loyihalarga joy bo‘ladi. Darg‘om kanali bo‘yida 35 kilometrli turistik yo‘lak, Narpay kanalida gastronomik ko‘prik tashkil etish orqali birinchi bosqichda 500 milliard so‘mlik loyihalar amalga oshiriladi.\r\n\r\nViloyatdagi yaylov va lalmi yerlarni iqtisodiy aktivga aylantirish kerak. Samarqand tumanida 350 gektar lalmi yerda turistik-rekreatsion hudud tashkil qilib, mingta tadbirkorni joylashtirish va 3,5 mingta ish o‘rni yaratish mumkin.\r\n\r\nBulung‘urning tuprog‘i, iqlimi meva-sabzavotchilikka qulay. Tumandagi 6 ming gektar samarasi kam g‘alla maydonlari meva-sabzavot yetishtirishga ixtisoslashtirilsa, gektaridan daromad 10 ming dollardan oshadi, 45 ming odam ishli bo‘ladi. Mahsulotlarning yarmi eksportga chiqarilib, qo‘shimcha 52 million dollar eksport tushumi ta’minlanadi.', 'news/images/YfeIrI18tOKWCn62D2wBs5L0CtEuwPHR.jpg', '2024-11-21 14:29:43.609995', '2024-11-21 14:25:34.000000', '2024-11-21 14:29:43.609995', 'PB', 1),
(6, 'Millatlar ligasida fors-major. Vengriya murabbiyi hushini yo‘qotdi, Ruminiya va Kosovo o‘yinida siyosiy mojaro', 'millatlar-ligasida-fors-major-vengriya-murabbiyi-hushini-yoqotdi-ruminiya-va-kosovo-oyinida-siyosiy-mojaro', 'Millatlar ligasi guruh bosqichi 5-turi doirasida Niderlandiya va Vengriya o‘rtasidagi uchrashuv vaqtida qo‘rqinchli epizod yuzaga keldi. «Yohan Kroyf Arena» stadionidagi o‘yinning birinchi bo‘limi mehmonlar murabbiylar shtabi vakili Adam Salai o‘zini yomon his qilishi tufayli to‘xtatildi.\r\n\r\nO‘yinning sakkizinchi daqiqasida Vengriya futboli yaqin o‘tmishi afsonasi, jamoa safida 86 o‘yinda maydonga tushib, 26 gol urgan yulduz futbolchi, ko‘p yillar davomida «Mayns», «Shalke» va «Hoffenhaym» klublarida sermahsul o‘yin namoyish etgan 36 yoshli Adam Salai hushidan ketdi.\r\n\r\nAvvaliga Adamning oldiga hamkasblari yugurib bordi, keyin shifokorlar yordamga keldi va bu joyda tibbiyot palatkasi tiklandi. Futbolchilar esa uning atrofida halqa hosil qilib, uni tribuna hamda kameralardan yashirishdi.\r\n\r\n\r\n\r\nTribunalar jimlikka cho‘mdi, bosh hakam Xesus Xil Mansano futbolchilar bilan gaplashdi, shundan keyin o‘yin taxminan 15 daqiqaga to‘xtadi — Salaiga tibbiy yordam ko‘rsatildi, keyin zambilda tribunalar ostiga olib ketishdi. Keyinroq murabbiy Amsterdam shifoxonasiga yotqizilgan.\r\n\r\nHozircha Salaiga aynan nima bo‘lgani ma’lum emas. «Uning holati barqaror va u o‘ziga kelgan. Bir necha daqiqa oldin tekshiruv o‘tkazish uchun tez yordam mashinasida Amsterdamdagi shifoxonaga olib borishdi», — deyilgan vengrlar milliy jamoasining ijtimoiy tarmoqlarida.\r\n\r\n\r\n\r\nO‘yin tiklanganidan bir necha daqiqa o‘tib hali o‘ziga kelmagan vengrlar penalti tufayli gol o‘tkazib yuborishdi, o‘yin yakunigacha hisob 0:4 ko‘rinishini oldi.\r\n\r\nVengrlar bilan bog‘liq boshqa xavotirli holatlar\r\n\r\nYevro-2024 vaqtida vengrlar hujumchisi Barnabash Varga Shotlandiya bilan o‘yinda og‘ir jarohat olgandi. Ikkinchi bo‘lim o‘rtalarida britanlar darvozaboni Angus Gann bilan to‘qnashuv ro‘y bergandi — kuchli zarba Varganing boshiga kelgan, shundan keyin bir necha daqiqa davomida unga tibbiy yordam ko‘rsatilgandi. Uni ham shifoxonaga olib ketishgan — unda miya chayqalishi hamda suyaklari bir necha joyda singani aniqlangan va jarrohlik amaliyoti o‘tkazilgandi. Varga 2024/25 yillar mavsumi boshini o‘tkazib yubordi, ammo hozirga kelib tiklanib safga qaytgan va «Ferensvarosh» safida barcha turnirlar doirasida olti gol urishga ulgurdi. Forvard shanba kuni Niderlandiyaga qarshi kechgan o‘yinda ham maydonga tushdi.\r\n\r\nVengriyalik boshqa bir futbolchi Miklosh Fexer bilan ro‘y bergan hodisa ancha ayanchli. 2004 yilda 24 yoshda bo‘lgan forvard «Benfika»ning «Vitoriya» Gimaraynshga qarshi o‘yini vaqtida klinik o‘limni boshdan kechirgan. Feher zaxiradan maydonga tushib, golli uzatma ham bergan, o‘yin oxirida raqib aut amalga oshirishga to‘sqinlik qilgani uchun sariq kartochka bilan jazolangan, biroz o‘tib hushsiz holda gazonga yiqilgan. Mikloshning yuragi to‘xtab qolgandi — shifoxonada uni ikki bor o‘ziga keltirishgan, ammo yakunda futbolchi baribir hayotdan ko‘z yumgan.\r\n\r\nSiyosat yana sportga aralashdi\r\n\r\n\r\n\r\nMillatlar ligasining shanba kungi o‘yinlari doirasida Buxarestda Ruminiyaning Kosovoga qarshi o‘yini navbatdagi mojaro tufayli oxiriga yetmay qoldi. Mezbon muxlislarning o‘zini tutishi tufayli o‘yinda qisqa tanaffus qilishga to‘g‘ri keldi, keyin esa o‘yin butunlay to‘xtatildi. O‘yin qachon davom ettirilishi haqida hozircha ma’lum qilinmadi.\r\n\r\nNima bo‘ldi?\r\n\r\nKosovolik futbolchilar o‘yin davomida mahalliy fanatlarning xatti-harakatlari yuzasidan shikoyat qilishdi. Tribunalarda Serbiya bayroqlari ham ko‘tarilgan. Qo‘shimcha daqiqalarda futbolchilar o‘rtasida janjal kelib chiqdi, Ruminiya muxlislari esa «Serbiya, Serbiya!» deb hayqirib, maydonga turli buyumlar uloqtirishdi.\r\n\r\nShu bilan birga, mehmonlar tomonidan ham provokatsiya bo‘lgandi, jamoa himoyachisi Lyumbard Delov mojaroli «alban burguti» jyestini ko‘rsatgan.\r\n\r\nYakunda Kosovo futbolchilari norozilik ifodasi sifatida to‘liq tarkibda maydondan chiqib ketishdi, mezbonlar esa bosh hakam qarorini kutib, yana biroz vaqt davomida maydonda qolishdi. O‘yinda bir soatga yaqin tanaffus qilindi, keyin esa to‘liq to‘xtatildi. Bu vaqtda tabloda hisob 0:0 edi.\r\n\r\nBu jamoalar o‘rtasidagi birinchi mojaro emas\r\n\r\nBarchasi 2023 yil iyunida safar uchrashuvida ruminlar haqorat qilinishidan boshlangandi. O‘sha yil sentabrida Yevropa chempionati saralash turniri doirasidagi o‘zaro o‘yin ruminiyalik fanatlar «Kosovo — bu Serbiya» yozuvli banner ko‘tarishgani tufayli bir soatga to‘xtatilgandi.\r\n\r\n\r\n\r\nBir yil o‘tib UYeFA apellyatsiya qo‘mitasi Millatlar ligasi doirasidagi birinchi o‘zaro o‘yin vaqtida tribunadagi tartibsizlik tufayli Kosovo futbol federatsiyasini jarimaga tortishga qaror qildi. Kosovolik muxlislar maydonga yugurib chiqib, turli buyumlar uloqtirgan, pirotexnikadan foydalangan, madhiya ijro etilishi vaqtida shovqin ko‘targan hamda tribunalardagi o‘tish joylarini to‘sib qo‘ygandi. Shu munosabat bilan federatsiyaga 51 ming yevrolik jarima yozilgan.', 'news/images/-DODFmNW8vV7a2__KRfr7QZMTJWcQwd6_kovKxWk.jpg', '2024-11-21 14:33:15.282193', '2024-11-21 14:29:43.000000', '2024-11-21 14:33:15.282193', 'PB', 2),
(7, 'Ruben Amorim - Ronaldu unga qo‘ygan laqab, yangi uslub va «MYu»da nimalarni o‘zgartirmoqchiligi haqida', 'ruben-amorim-ronaldu-unga-qoygan-laqab-yangi-uslub-va-myuda-nimalarni-ozgartirmoqchiligi-haqida', '«Manchester Yunayted»ning yangi bosh murabbiyi Ruben Amorim klub boshqaruviga kelganidan keyingi birinchi intervyusini «qizil iblislar» YouTube sahifasi uchun berdi va unda portugaliyalik mutaxassis katta jamoani boshqarish oldidan kechirayotgan hissiyotlari haqida gapirgan.\r\n\r\n— Xush kelibsan, Ruben. Bu savol eng osoni bo‘lsa kerak: nega «Manchester Yunayted»ga qo‘shilding?\r\n\r\n— Birinchi navbatda men o‘zimda klub bilan bog‘liqlikni his qildim. Klub deganimda ko‘pchilik uning birlik sifatidagi siymosini ko‘z oldiga keltirgan bo‘lsa kerak. Yo‘q, avvalo, men unda ishlayotgan insonlar bilan bog‘liqlikni tuydim va bu men uchun juda muhim. Boisi, men o‘zim yoqtiradigan odamlar bilan ishlashni yoqtiraman. Ikkinchi sabab — klubning boy tarixi. Bu yerda hamma g‘alabalarga tashna. Bunday klubda bo‘lish orqali sen qandaydir alohida voqealarning bir qismiga aylana olasan va bu mening tanlovimdagi asosiy sabablardan biri. Men shunchaki qaysidir klubning navbatdagi murabbiyi bo‘lishni yoqtirmayman, Manchesterda ham oddiy murabbiylar ishlamaydi. Yana bir sabab, albatta, muxlislar. Portugaliyada ham media juda yaxshi ishlaydi, biroq bu yerdagi bilan solishtirib bo‘lmaydi. Manchester muxlislarining klubga nisbatan jonkuyarligi, o‘zini dahldordek sezishi ushbu klubni qolganlardan ajralib turishining asosiy sababidir.', 'news/images/a5zS4m3gvelO7aQP1ne5e-XRN_KIi5J5.png', '2024-11-21 14:37:35.971980', '2024-11-21 14:33:15.000000', '2024-11-21 14:37:35.971980', 'PB', 2),
(8, 'Ruben Amorim - Ronaldu unga qo‘ygan laqab, yangi uslub va «MYu»da nimalarni o‘zgartirmoqchiligi haqida', 'ruben-amorim-ronaldu-unga-qoygan-laqab-yangi-uslub-va-myuda-nimalarni-ozgartirmoqchiligi-haqida', '— Sen klubdagi odamlar haqida gapirganda Omar, Den va Jyeysonni nazarda tutdingmi?\r\n\r\n— Albatta. Ser Jim va Ser Deyvni ham e’tirof etish kerak, biroq yuqoridagi 3 inson mening tanlovimda katta rol o‘ynashdi. Men ular bilan o‘zimda qandaydir bog‘liqlik his qildim. Menimcha, ular bilan o‘xshash vaziyatdamiz: hech birimizning kelganimizga ko‘p bo‘lmagan va o‘ziga xos klubda katta natijalarga erishmoqchimiz. Bu bizlarni birlashtirib turuvchi muhim nuqta.\r\n\r\n— Krishtianu seni shoir deb atashi haqida aytishadi, shu rostmi?\r\n\r\n— Ha, lekin bu shunchaki hazil sifatida shakllangan narsa. Men gapirganimda yuragimdan so‘zlayman. Meni taniydiganlar buni yaxshi biladi va bu taxallus shunchaki hazil tariqasida qo‘yilgan.\r\n\r\n— Sen «Old Trafford»da 2 marta o‘ynagansan. Qanday xotiralar qolgan?\r\n\r\n— Juda ham yaxshi emas. Chunki men bu yerda g‘alaba qozonmaganman, menga g‘olib bo‘lish yoqadi. Menga hayotdan zavqlanish muhim, biroq bunga g‘alaba bilan erishishni xohlayman. Muxlislar mening yodimda qolgan. «Braga» bilan kelganimizda 2:0 hisobida yutayotgandik, keyin esa ular ishga tushishgan va o‘sha o‘yinni boy berganmiz. Demakki, bu o‘ziga xos stadion.\r\n\r\n— Endi mana shu tribunalar kuchini murabbiy sifatida ishlatishni istaysanmi?\r\n\r\n— Sen murabbiy bo‘lsang, futboldagi eng muhim unsurdan unumli foydalana olishing kerak. Ha, futbolchilar maydonda o‘ynashda davom etaveradilar. Biroq stadiondagi atmosfera juda muhim va u yaxshi bo‘lsa, maydondagi yigitlarning o‘yini o‘xshaydi. Uchrashuvlarda g‘alabalar qozonishimiz uchun muxlislar ko‘magiga muhtojmiz.\r\n\r\n— Ko‘rib turganingdek, stadion ajoyib. Bu yerda turar ekansan, qandaydir o‘ziga xos bir qadamjoda ekanligingni his qilasan. Bu go‘zallikning markazida bo‘lishdan quvongandirsan?\r\n\r\n— «Manchester Yunayted» men bilan gaplashganda, xususan Omar menga klubning rejalari haqida aytib bergandi. Ular uchun men birinchi raqamli da’vogar bo‘lganim meni faxrlantiradi. O‘ziga yarasha ma’suliyati ham bor, biroq baribir bu kabi katta bir voqelikning bir qismi bo‘lishdan iftixor tuyishing tabiiy. Biz bilamizki, jamoa g‘alabalarga erisha boshlasa, muxlislarning kayfiyati ham yaxshilanadi va ular yangi g‘oyalarga, o‘zgarishlarga, yangi stadion qurilishi kabi rejalarga ishona boshlaydilar. Biz bu y', 'news/images/NgsrrMhoCfMadjujLf08d5jQnD3Lno.jpg', '2024-11-21 14:38:22.523992', '2024-11-21 14:37:36.000000', '2024-11-21 14:38:22.523992', 'PB', 2),
(9, 'Farg‘ona aeroportida havo kemalarini qabul qilishga vaqtinchalik cheklovlar joriy etildi', 'fargona-aeroportida-havo-kemalarini-qabul-qilishga-vaqtinchalik-cheklovlar-joriy-etildi', 'Ob-havo sharoiti yomonlashgani sababli joriy etilgan cheklovlar vaqtida barcha reyslar muqobil aerodromlarga yo‘naltiriladi.\r\n\r\nMahalliy vaqt bilan soat 17:02 dan boshlab ob-havo sharoiti yomonlashgani sababli Farg‘ona xalqaro aeroportida havo kemalarini qabul qilishga vaqtinchalik cheklovlar joriy etildi. Bu haqda Uzbekistan Airports matbuot xizmati xabar berdi.\r\n\r\nQayd etilishicha, cheklovlar vaqtida barcha reyslar muqobil aerodromlarga yo‘naltiriladi.\r\n\r\nUzbekistan Airways aviakompaniyasining Novosibirsk — Farg‘ona yo‘nalishidagi HY-670 reysi Namangan muqobil aeroportiga yo‘naltirilgan.\r\n\r\nAvvalroq Uzbekistan Airports joriy yil 9 oyida mamlakat xalqaro aeroportlari tomonidan 82 637 ta reysga xizmat ko‘rsatilgani to‘g‘risida xabar bergandi. Shundan 4 092 ta reys Farg‘ona xalqaro aeroporti hisobiga to‘g‘ri keladi.', 'news/images/W8kzIykyTsFI20xoH9wE2ocFpKIIbLpO.jpg', '2024-11-21 14:40:31.256058', '2024-11-21 14:38:22.000000', '2024-11-21 14:40:31.256058', 'PB', 3),
(10, 'Farg‘onada sodir bo‘lgan YTHda voyaga yetmagan qiz halok bo‘ldi', 'fargonada-sodir-bolgan-ythda-voyaga-yetmagan-qiz-halok-boldi', 'Farg‘ona viloyati Dang‘ara tumanida yo‘l-transport hodisasi oqibatida voyaga yetmagan qiz halok bo‘ldi. Haydovchiga nisbatan sud hukmi e’lon qilindi.\r\n\r\n4 iyun kuni Qo‘qon-Toshkent yo‘nalishining 9-kilometrida Lacetti yo‘l harakati qoidalarini buzib, bir yo‘nalishda harakatlanib ketayotgan Damas`ning orqa qismiga borib urilgan.\r\n\r\nLacetti haydovchisi S. tanishi H. bilan birgalikda qaytayotgan bo‘lgan. Yarim yo‘lda mashina boshqaruvini H. olgan va avtomobilni soatiga 130 kilometr tezlikda haydab ketgan.\r\n\r\nBuning oqibatida mashina fuqaro A. boshqaruvida bo‘lgan Damas avtomobilining orqa tomoniga zarb bilan urilgan. Oqibatda ikkala mashina haydovchilari va yo‘lovchilari, jami 4 kishi turli darajadagi tan jarohatlari olib, shifoxonaga yotqizilgan.\r\n\r\nKo‘rsatilgan tibbiy yordamga qaramay Damas salonida bo‘lgan voyaga yetmagan qiz shifoxonada vafot etgan.\r\n\r\nHolat yuzasidan o‘tkazilgan sud ishida ayblanuvchi H. aybiga qisman iqror bo‘lib, jabrlanuvchilarga yetkazilgan moddiy va ma’naviy zararni qoplay olmasligi to‘g‘risida ko‘rsatma bergan.\r\n\r\nSudda ayblanuvchi H. o‘z aybiga qisman iqror bo‘lib, jabrlanuvchilarga keltirilgan moddiy va ma’naviy zararni qoplay olmasligini aytgan. Sud jabrlanuvchilarga jami bo‘lib 113 million so‘m miqdorda zararni undirishni belgiladi.\r\n\r\nSudlanuvchi Jinoyat kodeksining 266-moddasi (Transport vositalari harakati yoki ulardan foydalanish xavfsizligi qoidalarini buzish) 2-qismida ko‘zda tutilgan jinoyatni sodir etgan deb topilib, 3 yil avtomobil boshqarish huquqidan mahrum etildi va 6 yilga ozodlikdan mahrum qilindi.', 'news/images/fcyl-J0VRDrm3eaxWFIhcy1sXW4MSWxt.jpg', '2024-11-21 14:42:19.061461', '2024-11-21 14:40:31.000000', '2024-11-21 14:42:19.061461', 'PB', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-11-21 14:23:47.181872', '1', 'Qishloq xo‘jaligi kooperativlari haqidagi uzoq kutilgan qonun imzolandi. Sohada nima o‘zgaradi?', 1, '[{\"added\": {}}]', 8, 1),
(2, '2024-11-21 14:24:17.140390', '2', 'Ummon O‘zbekistondan qishloq xo‘jaligi mahsulotlarini import qilmoqchi', 1, '[{\"added\": {}}]', 8, 1),
(3, '2024-11-21 14:24:47.473324', '3', 'O‘zbekiston qishloq xo‘jaligida importni 50 foizga qisqartirish rejalashtirilmoqda', 1, '[{\"added\": {}}]', 8, 1),
(4, '2024-11-21 14:25:34.131553', '4', 'Shavkat Mirziyoyev Samarqand viloyatini rivojlantirish yuzasidan yig‘ilish o‘tkazdi', 1, '[{\"added\": {}}]', 8, 1),
(5, '2024-11-21 14:29:43.610993', '5', 'Shavkat Mirziyoyev Samarqand viloyatini rivojlantirish yuzasidan yig‘ilish o‘tkazdi', 1, '[{\"added\": {}}]', 8, 1),
(6, '2024-11-21 14:33:15.285334', '6', 'Millatlar ligasida fors-major. Vengriya murabbiyi hushini yo‘qotdi, Ruminiya va Kosovo o‘yinida siyosiy mojaro', 1, '[{\"added\": {}}]', 8, 1),
(7, '2024-11-21 14:37:35.972979', '7', 'Ruben Amorim - Ronaldu unga qo‘ygan laqab, yangi uslub va «MYu»da nimalarni o‘zgartirmoqchiligi haqida', 1, '[{\"added\": {}}]', 8, 1),
(8, '2024-11-21 14:38:22.524990', '8', 'Ruben Amorim - Ronaldu unga qo‘ygan laqab, yangi uslub va «MYu»da nimalarni o‘zgartirmoqchiligi haqida', 1, '[{\"added\": {}}]', 8, 1),
(9, '2024-11-21 14:40:31.260390', '9', 'Farg‘ona aeroportida havo kemalarini qabul qilishga vaqtinchalik cheklovlar joriy etildi', 1, '[{\"added\": {}}]', 8, 1),
(10, '2024-11-21 14:42:19.062459', '10', 'Farg‘onada sodir bo‘lgan YTHda voyaga yetmagan qiz halok bo‘ldi', 1, '[{\"added\": {}}]', 8, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int NOT NULL,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(7, 'blog', 'category'),
(9, 'blog', 'contact'),
(8, 'blog', 'news'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Структура таблицы `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-11-21 14:07:20.885297'),
(2, 'auth', '0001_initial', '2024-11-21 14:07:21.158647'),
(3, 'admin', '0001_initial', '2024-11-21 14:07:21.245924'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-11-21 14:07:21.251159'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-11-21 14:07:21.267914'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-11-21 14:07:21.301397'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-11-21 14:07:21.327739'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-11-21 14:07:21.343727'),
(9, 'auth', '0004_alter_user_username_opts', '2024-11-21 14:07:21.348197'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-11-21 14:07:21.368930'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-11-21 14:07:21.370898'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-11-21 14:07:21.375882'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-11-21 14:07:21.408765'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-11-21 14:07:21.442782'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-11-21 14:07:21.454803'),
(16, 'auth', '0011_update_proxy_permissions', '2024-11-21 14:07:21.459780'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-11-21 14:07:21.495704'),
(18, 'blog', '0001_initial', '2024-11-21 14:07:21.550579'),
(19, 'blog', '0002_contact', '2024-11-21 14:07:21.558402'),
(20, 'sessions', '0001_initial', '2024-11-21 14:07:21.571765');

-- --------------------------------------------------------

--
-- Структура таблицы `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('el3ve00b4eab5vrf5whu1a1224czp3fh', '.eJxVjEsOAiEQBe_C2hBokY9L956BNHQjowaSYWZlvLtOMgvdvqp6LxFxXWpcB89xInEWWhx-t4T5wW0DdMd26zL3tsxTkpsidzrktRM_L7v7d1Bx1G_NFthBClRcyOWokJzOmY12oMiCO4H31pikgjfsEV0GtDqRQWDmYsX7A-ipODk:1tFWLy:dRVf0eSwM3ZuguXQV6IhO-5Q927tNJyY7CV8GgXW650', '2024-12-09 10:30:02.715141'),
('im5jxz9p16zzff56njhb928zy092cld2', '.eJxVjEsOAiEQBe_C2hBokY9L956BNHQjowaSYWZlvLtOMgvdvqp6LxFxXWpcB89xInEWWhx-t4T5wW0DdMd26zL3tsxTkpsidzrktRM_L7v7d1Bx1G_NFthBClRcyOWokJzOmY12oMiCO4H31pikgjfsEV0GtDqRQWDmYsX7A-ipODk:1tE84R:-xJfIIg5hlvb_cWjZyPEe1UwTTZB5XuHMF1ORA8MTy8', '2024-12-05 14:22:11.022394');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Индексы таблицы `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Индексы таблицы `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Индексы таблицы `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Индексы таблицы `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Индексы таблицы `blog_category`
--
ALTER TABLE `blog_category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `blog_contact`
--
ALTER TABLE `blog_contact`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `blog_news`
--
ALTER TABLE `blog_news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_news_category_id_id_6c965783_fk_blog_category_id` (`category_id_id`),
  ADD KEY `blog_news_slug_2df73d99` (`slug`);

--
-- Индексы таблицы `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Индексы таблицы `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Индексы таблицы `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT для таблицы `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `blog_category`
--
ALTER TABLE `blog_category`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `blog_contact`
--
ALTER TABLE `blog_contact`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `blog_news`
--
ALTER TABLE `blog_news`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Ограничения внешнего ключа таблицы `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Ограничения внешнего ключа таблицы `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ограничения внешнего ключа таблицы `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Ограничения внешнего ключа таблицы `blog_news`
--
ALTER TABLE `blog_news`
  ADD CONSTRAINT `blog_news_category_id_id_6c965783_fk_blog_category_id` FOREIGN KEY (`category_id_id`) REFERENCES `blog_category` (`id`);

--
-- Ограничения внешнего ключа таблицы `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
