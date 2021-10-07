-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 12 Ağu 2021, 23:41:27
-- Sunucu sürümü: 10.4.20-MariaDB
-- PHP Sürümü: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `myblog`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `article`
--

CREATE TABLE `article` (
  `articleID` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `articleText` text NOT NULL,
  `date` date NOT NULL,
  `aid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `article`
--

INSERT INTO `article` (`articleID`, `title`, `category`, `articleText`, `date`, `aid`) VALUES
(1, 'C++ Developer', 'Teknoloji', '2014 C++ Standarts', '2021-08-07', 1),
(2, 'C++ History', 'Teknoloji', 'Bjarne Stroustrup is the designer and original implementer of C++ as well as the author of The C++ Programming Language (Fourth Edition) and A Tour of C++, Programming: Principles and Practice using C++ (Second Edition), and many popular and academic publications. Dr. Stroustrup is a Managing Director in the technology division of Morgan Stanley in New York City as well as a visiting professor at Columbia University. He is a member of the US National Academy of Engineering, and an IEEE, ACM, and CHM fellow. His research interests include distributed systems, design, programming techniques, software development tools, and programming languages.  To make C++ a stable and up-to-date base for real-world software development, he has been a leading figure with the ISO C++ standards effort for more than 25 years. He holds a masterâs in Mathematics from Aarhus University and a PhD in Computer Science from Cambridge University, where he is an honorary fellow of Churchill College.', '2021-08-07', 1),
(3, 'Space-X SN15 Rocket', 'Uzay', 'On Wednesday, May 5, Starship serial number 15 (SN15) successfully completed SpaceXâs fifth high-altitude flight test of a Starship prototype from Starbase in Texas.\r\n\r\nSimilar to previous high-altitude flight tests of Starship, SN15 was powered through ascent by three Raptor engines, each shutting down in sequence prior to the vehicle reaching apogee â approximately 10 km in altitude. SN15 performed a propellant transition to the internal header tanks, which hold landing propellant, before reorienting itself for reentry and a controlled aerodynamic descent.\r\n\r\nThe Starship prototype descended under active aerodynamic control, accomplished by independent movement of two forward and two aft flaps on the vehicle. All four flaps were actuated by an onboard flight computer to control Starshipâs attitude during flight and enabled precise landing at the intended location. SN15âs Raptor engines reignited as the vehicle performed the landing flip maneuver immediately before touching down for a nominal landing on the pad.\r\n\r\nThese test flights of Starship are all about improving our understanding and development of a fully reusable transportation system designed to carry both crew and cargo on long-duration interplanetary flights, and help humanity return to the Moon, and travel to Mars and beyond.\r\n\r\nCongratulations to the entire SpaceX team on SN15âs successful flight and landing!', '2021-08-07', 2),
(5, 'NASA Perseverance Team Assessing First Mars Sampling Attempt', 'Uzay', 'Data sent to Earth by NASA\'s Perseverance rover after its first attempt to collect a rock sample on Mars and seal it in a sample tube indicate that no rock was collected during the initial sampling activity.\r\n\r\nThe rover carries 43 titanium sample tubes, and is exploring Jezero Crater, where it will be gathering samples of rock and regolith (broken rock and dust) for future analysis on Earth.\r\n\r\nWhile this is not the hole-in-oneâ we hoped for, there is always risk with breaking new ground, said Thomas Zurbuchen, associate administrator of NASAâs Science Mission Directorate in Washington. âIâm confident we have the right team working this, and we will persevere toward a solution to ensure future success.\r\n\r\nPerseverance\'s Sampling and Caching System uses a hollow coring bit and a percussive drill at the end of its 7-foot-long (2-meter-long) robotic arm to extract samples. Telemetry from the rover indicates that during its first coring attempt, the drill and bit were engaged as planned, and post-coring the sample tube was processed as intended.\r\n\r\nThe sampling process is autonomous from beginning to end,â said Jessica Samuels, the surface mission manager for Perseverance at NASAâs Jet Propulsion Laboratory in Southern California. âOne of the steps that occurs after placing a probe into the collection tube is to measure the volume of the sample. The probe did not encounter the expected resistance that would be there if a sample were inside the tube.â\r\n\r\nThe Perseverance mission is assembling a response team to analyze the data. One early step will be to use the WATSON (Wide Angle Topographic Sensor for Operations and eNgineering) imager â located at the end of the robotic arm â to take close-up pictures of the borehole. Once the team has a better understanding of what happened, it will be able to ascertain when to schedule the next sample collection attempt.\r\n\r\nâThe initial thinking is that the empty tube is more likely a result of the rock target not reacting the way we expected during coring, and less likely a hardware issue with the Sampling and Caching System,â said Jennifer Trosper, project manager for Perseverance at JPL. âOver the next few days, the team will be spending more time analyzing the data we have, and also acquiring some additional diagnostic data to support understanding the root cause for the empty tube.â \r\n\r\nPrevious NASA missions on Mars have also encountered surprising rock and regolith properties during sample collection and other activities. In 2008, the Phoenix mission sampled soil that was \"sticky\" and difficult to move into onboard science instruments, resulting in multiple tries before achieving success. Curiosity has drilled into rocks that turned out to be harder and more brittle than expected. Most recently, the heat probe on the InSight lander, known as the âmole,â was unable to penetrate the Martian surface as planned.\r\n\r\nâI have been on every Mars rover mission since the beginning, and this planet is always teaching us what we donât know about it,â said Trosper. âOne thing Iâve found is, itâs not unusual to have complications during complex, first-time activities.â', '2021-08-07', 1),
(11, 'deneme', 'Teknoloji', 'fgh', '2021-08-08', 1),
(12, 'deneme-tasarım', 'Tasarım-Sanat', 'deneme', '2021-08-08', 1),
(13, 'Java of History', 'Teknoloji', 'Java was started as a project called \"Oak\" by James Gosling in June 1991. Gosling\'s goals were to implement a virtual machine and a language that had a familiar C-like notation but with greater uniformity and simplicity than C/C++. The first public implementation was Java 1.0 in 1995. It made the promise of \"Write Once, Run Anywhere\", with free runtimes on popular platforms. It was fairly secure and its security was configurable, allowing for network and file access to be limited. The major web browsers soon incorporated it into their standard configurations in a secure \"applet\" configuration. popular quickly. New versions for large and small platforms (J2EE and J2ME) soon were designed with the advent of \"Java 2\". Sun has not announced any plans for a \"Java 3\".\r\n\r\nIn 1997, Sun approached the ISO/IEC JTC1 standards body and later the Ecma International to formalize Java, but it soon withdrew from the process. Java remains a proprietary de facto standard that is controlled through the Java Community Process. Sun makes most of its Java implementations available without charge, with revenue being generated by specialized products such as the Java Enterprise System. Sun distinguishes between its Software Development Kit (SDK) and Runtime Environment (JRE) which is a subset of the SDK, the primary distinction being that in the JRE the compiler is not present.', '2021-08-08', 1),
(18, 'The Perseids are on the Rise!', 'Uzay', 'Our meteor-tracking cameras spotted their first Perseid on July 26, but your best chance to see them will start the night of Aug. 11. With the crescent moon setting early, the skies will be dark for the peak viewing hours of midnight (local time) to dawn on Aug. 12.\r\nIf you’re in the Northern Hemisphere, and far away from light pollution, you might spot more than 40 Perseids an hour! (If you’re in a city, you may only see a few every hour; skywatchers in the Southern Hemisphere will also see fewer Perseids, with none visible below about 30 degrees south latitude.) The night of Aug. 12-13 will be another great opportunity to see the Perseids: with a full Moon (and lower meteor activity) during the Perseids’ peak in 2022 and a waning crescent high in the sky for 2023, this might be your best chance to do some summer skywatching for a few years.\r\nFind somewhere comfortable, avoiding bright lights as much as possible (yes, including your phone), and give your eyes some time to adjust to the dark—up to half an hour if you can. The Perseids will appear as quick, small streaks of light: they get their name because they look like they’re coming from the direction of the constellation Perseus (near Aries and Taurus in the night sky), but Perseids in that area can be hard to spot from the perspective of Earth. So just look up and enjoy the show!\r\n\r\nIf you can’t see the Perseids where you live, join NASA to watch them on social media! Tune in overnight Aug. 11-12 (10 PM–5 AM CDT; 3–10 AM UTC) on Facebook, Twitter and YouTube to look for meteors with space fans from around the world. If skies are cloudy the night of Aug. 11, we’ll try again the same time on Aug. 12-13. Our livestream is hosted by the Meteoroid Environment Office at NASA’s Marshall Space Flight Center, which tracks meteors, fireballs, and other uncommon sights in the night sky to inform the public and help keep our astronauts and spacecraft safe.', '2021-08-12', 2);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `author`
--

CREATE TABLE `author` (
  `aid` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `surname` varchar(64) NOT NULL,
  `email` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `author`
--

INSERT INTO `author` (`aid`, `name`, `surname`, `email`, `password`) VALUES
(1, 'eymen', 'eruyar', 'eruyareymen@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b'),
(2, 'ali', 'yılmaz', 'ali@mail.com', '827ccb0eea8a706c4c34a16891f84e7b');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `images`
--

CREATE TABLE `images` (
  `imageID` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `img_dir` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `images`
--

INSERT INTO `images` (`imageID`, `name`, `img_dir`, `category`) VALUES
(2, 'home-design', 'homePage/assets/img/portfolio/slider_image/home-design.jpg', 'Tasarım-Sanat'),
(4, 'software-tech', 'homePage/assets/img/portfolio/slider_image/software-tech.jpg', 'Teknoloji'),
(5, 'space-x', 'homePage/assets/img/portfolio/slider_image/space-x.jpg', 'Uzay');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `reader`
--

CREATE TABLE `reader` (
  `readerID` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `reader`
--

INSERT INTO `reader` (`readerID`, `name`, `email`, `subject`, `message`, `date`) VALUES
(1, 'EYÜP EYMEN', 'eruyar123@gmail.com', 'deneme', 'ğüğüğşişi', '2021-08-10'),
(6, 'Ali Bilmem', 'ali@mail.com', 'Java', 'Java EnterpriseJava EnterpriseJava EnterpriseJava EnterpriseJava EnterpriseJava EnterpriseJava EnterpriseJava EnterpriseJava EnterpriseJava EnterpriseJava EnterpriseJava EnterpriseJava EnterpriseJava EnterpriseJava EnterpriseJava EnterpriseJava EnterpriseJava EnterpriseJava EnterpriseJava EnterpriseJava EnterpriseJava EnterpriseJava EnterpriseJava EnterpriseJava EnterpriseJava EnterpriseJava EnterpriseJava EnterpriseJava EnterpriseJava EnterpriseJava EnterpriseJava EnterpriseJava Enterprise', '2021-08-11'),
(7, 'Ahmet', 'ahmet@mail.com', 'C++ Blog', 'Merhaba, ben Ahmet. Yapmış olduğunuz C++ haberini çok beğendim ancak yardım alınan kaynakları sitenizde göremedim. Kaynaklarınızı da bizimle paylaşırsanız çok seviniriz. Saygılar...', '2021-08-11');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`articleID`),
  ADD UNIQUE KEY `title` (`title`);

--
-- Tablo için indeksler `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`aid`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Tablo için indeksler `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`imageID`);

--
-- Tablo için indeksler `reader`
--
ALTER TABLE `reader`
  ADD PRIMARY KEY (`readerID`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `article`
--
ALTER TABLE `article`
  MODIFY `articleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Tablo için AUTO_INCREMENT değeri `author`
--
ALTER TABLE `author`
  MODIFY `aid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `images`
--
ALTER TABLE `images`
  MODIFY `imageID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `reader`
--
ALTER TABLE `reader`
  MODIFY `readerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
