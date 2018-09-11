-- phpMyAdmin SQL Dump
-- version 4.4.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 11, 2018 at 09:52 AM
-- Server version: 5.6.26
-- PHP Version: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pkimle`
--

-- --------------------------------------------------------

--
-- Table structure for table `td_approval`
--

CREATE TABLE IF NOT EXISTS `td_approval` (
  `kd_approval` int(3) NOT NULL,
  `kd_permohonan` int(5) NOT NULL,
  `nip_petugas` varchar(18) NOT NULL,
  `catatan` varchar(400) NOT NULL,
  `tgl_approval` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(50) NOT NULL DEFAULT 'Request',
  `boole` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `td_approval`
--

INSERT INTO `td_approval` (`kd_approval`, `kd_permohonan`, `nip_petugas`, `catatan`, `tgl_approval`, `status`, `boole`) VALUES
(54, 166, '199209182015021003', 'Masih piloting di kantor malang saja', '2018-09-08 03:00:57', 'Testing', '0'),
(53, 165, '199209182015021003', 'Sudah aktif di production', '2018-09-08 00:42:34', 'Release', '0'),
(52, 161, '199209182015021003', 'Hasil tes menu di aplikasi inhouse, Online bisa diakses tanpa error', '2018-09-06 03:19:33', 'Release', '0'),
(51, 157, '199112122015022009', 'sudah release', '2018-08-29 01:17:52', 'Release', '0'),
(55, 163, '199209182015021003', 'sudah dipasang F5 poduction dan datapower production \r\nhttp://datapower.customs.go.id/SKA/Service.wsdl\r\nhttp://10.242.245.42:85/SKA/Service/Service.wsdl', '2018-09-08 14:24:48', 'Release', '0'),
(56, 164, '199209182015021003', 'Rollback ke war sebelumnya', '2018-09-09 02:57:28', 'Rollback', '0'),
(57, 162, '199411062018012005', '', '2018-09-11 07:15:28', 'Assesment', '0');

-- --------------------------------------------------------

--
-- Table structure for table `td_deploy_file`
--

CREATE TABLE IF NOT EXISTS `td_deploy_file` (
  `kd_deploy_file` int(3) NOT NULL,
  `kd_permohonan` int(5) NOT NULL,
  `file_name` varchar(200) NOT NULL,
  `type_file` varchar(50) NOT NULL,
  `deskripsi` varchar(400) NOT NULL,
  `deskripsi_usman` text NOT NULL,
  `deskripsi_detail` text NOT NULL,
  `deskripsi_uat` text NOT NULL,
  `fileusman` text NOT NULL,
  `filedetail` text NOT NULL,
  `fileuat` text NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=135 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `td_deploy_file`
--

INSERT INTO `td_deploy_file` (`kd_deploy_file`, `kd_permohonan`, `file_name`, `type_file`, `deskripsi`, `deskripsi_usman`, `deskripsi_detail`, `deskripsi_uat`, `fileusman`, `filedetail`, `fileuat`) VALUES
(134, 166, 'WAR_07092018.rar', 'application/octet-stream', 'upload/WAR_07092018-1536368432-2276/WAR_07092018.rar', '', '', '', '', '', ''),
(133, 165, 'fileservice-1.0-SNAPSHOT.war', 'application/octet-stream', 'upload/fileservice-1-1536366945-4134/fileservice-1.0-SNAPSHOT.war', '', '', '', '', '', ''),
(130, 162, 'Deploy 7 sept 2018.zip', 'application/x-zip-compressed', 'upload/Deploy 7 sept 2018-1536288504-2294/Deploy 7 sept 2018.zip', '', '', '', '', '', ''),
(131, 163, 'SKAService.war', 'application/octet-stream', 'upload/SKAService-1536311205-3491/SKAService.war', '', '', '', '', '', ''),
(132, 164, '070918.rar', 'application/octet-stream', 'upload/070918-1536314245-6261/070918.rar', '', '', '', '', '', ''),
(129, 161, 'Deploy 05 September 2018.zip', 'application/x-zip-compressed', 'upload/Deploy 05 September 2018-1536195496-4226/Deploy 05 September 2018.zip', '', '', '', '', '', ''),
(128, 160, '917-dhl.zip', 'application/octet-stream', 'upload/917-dhl-1535505873-8769/917-dhl.zip', '', '', 'upload/user manual BCare-1535505873-180/user manual BCare.pdf', '', '', 'user manual BCare.pdf'),
(127, 159, 'PIBK WAOSKHI MENDROFA AJO NO 3 edit1.XML', 'text/xml', 'upload/PIBK WAOSKHI MENDROFA AJO NO 3 edit1-1535505042-8370/PIBK WAOSKHI MENDROFA AJO NO 3 edit1.XML', '', '', 'upload/NOTULA 24042018-Tambah Panjang Karakter-1535505042-7404/NOTULA 24042018-Tambah Panjang Karakter.docx', '', '', 'NOTULA 24042018-Tambah Panjang Karakter.docx'),
(125, 157, '917-dhl.zip', 'application/octet-stream', 'upload/917-dhl-1535504902-4205/917-dhl.zip', 'upload/BIODATA MAHASISWA - Copy-1535504902-7303/BIODATA MAHASISWA - Copy.doc', '', '', 'BIODATA MAHASISWA - Copy.doc', '', ''),
(126, 158, 'Notula migrasi barkir.doc', 'application/msword', 'upload/Notula migrasi barkir-1535504970-8866/Notula migrasi barkir.doc', '', 'upload/Panduan Penulisan Jurnal Paper SIA-1535504970-9863/Panduan Penulisan Jurnal Paper SIA.pdf', '', '', 'Panduan Penulisan Jurnal Paper SIA.pdf', ''),
(124, 156, 'Label CD.docx', 'application/vnd.openxmlformats-officedocument.word', 'upload/Label CD-1535504857-3326/Label CD.docx', 'upload/01-1535504857-1953/01. COVER.docx', 'upload/Label CD(2)-1535504857-7358/Label CD(2).docx', 'upload/Label CD(1)-1535504857-3196/Label CD(1).docx', '01. COVER.docx', 'Label CD(2).docx', 'Label CD(1).docx');

-- --------------------------------------------------------

--
-- Table structure for table `td_permohonan`
--

CREATE TABLE IF NOT EXISTS `td_permohonan` (
  `kd_permohonan` int(5) NOT NULL,
  `no_nd` varchar(40) NOT NULL,
  `tgl_deploy` date NOT NULL,
  `kd_aplikasi` int(3) NOT NULL,
  `nip_pemohon` varchar(18) NOT NULL,
  `nip_atasan_pemohon` int(18) NOT NULL,
  `jns_deploy` int(2) NOT NULL,
  `ket_fitur` text NOT NULL,
  `ket_service` text NOT NULL,
  `ket_table` text NOT NULL,
  `file_name` varchar(250) NOT NULL,
  `fileusman` text NOT NULL,
  `filedetail` text NOT NULL,
  `fileuat` text NOT NULL,
  `catatan` varchar(400) NOT NULL,
  `status` varchar(250) NOT NULL DEFAULT 'Request',
  `tgl_rekam` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM AUTO_INCREMENT=167 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `td_permohonan`
--

INSERT INTO `td_permohonan` (`kd_permohonan`, `no_nd`, `tgl_deploy`, `kd_aplikasi`, `nip_pemohon`, `nip_atasan_pemohon`, `jns_deploy`, `ket_fitur`, `ket_service`, `ket_table`, `file_name`, `fileusman`, `filedetail`, `fileuat`, `catatan`, `status`, `tgl_rekam`) VALUES
(166, '40', '2018-08-09', 34, '199102192014021001', 2147483647, 3, 'perbaikan pada setiap controller untuk masalah redirect ke index', 'perbaikan pada service menu ck1 dan p3c', '', 'WAR_07092018.rar', '', '', '', '', 'Request', '2018-09-08 08:00:32'),
(165, '', '2018-09-08', 99, '199110082014021002', 2147483647, 0, 'Penambahan Fitur untuk upload dan download di aplikasi SAC2 (eXIST)', '', '', 'fileservice-1.0-SNAPSHOT.war', '', '', '', '', 'Request', '2018-09-08 07:35:45'),
(164, '-', '2018-09-07', 36, '198807182014021004', 2147483647, 1, 'tambah menu browse asal data pib', '', '', '070918.rar', '', '', '', '', 'Request', '2018-09-07 16:57:25'),
(163, '-', '2018-09-07', 36, '198807182014021004', 2147483647, 3, '', 'perubahan pada parser', '', 'SKAService.war', '', '', '', '', 'Request', '2018-09-07 16:06:45'),
(162, '', '2018-09-07', 62, '199504152015021004', 2147483647, 1, 'penambahan filter jalur merah pada gate, perbaikan parameter pencarian gate', '', '', 'Deploy 7 sept 2018.zip', '', '', '', '', 'Request', '2018-09-07 09:48:24'),
(161, '', '2018-09-06', 62, '199103062013101001', 2147483647, 1, 'PKB, filter browse parameter jalur', '', '', 'Deploy 05 September 2018.zip', '', '', '', '', 'Request', '2018-09-06 07:58:16'),
(160, '', '2018-08-20', 60, '198312072002121001', 2147483647, 0, '', '', '1 tabel', '917-dhl.zip', '', '', 'user manual BCare.pdf', '', 'Request', '2018-08-29 08:24:33'),
(159, '', '2018-08-27', 9, '199104222014021002', 2147483647, 2, '', '', 'tabel c', 'PIBK WAOSKHI MENDROFA AJO NO 3 edit1.XML', '', '', 'NOTULA 24042018-Tambah Panjang Karakter.docx', '', 'Request', '2018-08-29 08:13:56'),
(158, '', '2018-08-27', 60, '199104232014022002', 2147483647, 2, '', 'cek service', '', 'Notula migrasi barkir.doc', '', 'Panduan Penulisan Jurnal Paper SIA.pdf', '', '', 'Request', '2018-08-29 08:13:22'),
(157, '', '2018-08-28', 8, '199603202018012004', 2147483647, 2, 'fitur 2', '', '', '917-dhl.zip', 'BIODATA MAHASISWA - Copy.doc', '', '', '', 'Request', '2018-08-29 08:08:22'),
(156, '123', '2018-08-28', 1, '199006092015021002', 2147483647, 1, 'fitur', 'service', 'table', 'Label CD.docx', '01. COVER.docx', 'Label CD(2).docx', 'Label CD(1).docx', '', 'Request', '2018-08-29 08:07:37');

-- --------------------------------------------------------

--
-- Table structure for table `tr_aplikasi`
--

CREATE TABLE IF NOT EXISTS `tr_aplikasi` (
  `kd_aplikasi` int(2) NOT NULL,
  `nm_aplikasi_pendek` varchar(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tr_aplikasi`
--

INSERT INTO `tr_aplikasi` (`kd_aplikasi`, `nm_aplikasi_pendek`) VALUES
(0, 'Portal Intranet'),
(1, 'Apps Manager'),
(2, 'DIKCare '),
(3, 'Content Management'),
(4, 'CEISA SIMANTAP'),
(5, 'Sipuma'),
(6, 'CEHRIS'),
(7, 'Sistem Referensi'),
(8, 'Background Proses'),
(9, 'SI-MAWAS'),
(10, 'Perijinan Online'),
(11, 'OA Nasional'),
(12, 'Bank Data Berkas'),
(13, 'Silfiana'),
(14, 'Sau Sai'),
(15, 'Billing System'),
(16, 'PIBK'),
(17, 'Si Imut'),
(18, 'KITE'),
(19, 'Ensiklopedia Perijinan'),
(20, 'Kuesioner 2017'),
(21, 'Denisa'),
(22, 'Public Service'),
(23, 'SIMEKO'),
(24, 'P53'),
(25, 'LHP'),
(26, 'CEISA Perijinan TPB'),
(27, 'CEISA PKSI'),
(28, 'CEISA Kepatuhan Internal'),
(29, 'SIAPRI'),
(30, 'PNRGOV'),
(31, 'CEISA Kepatuhan Pengguna '),
(32, 'CEISA Perbendaharaan'),
(33, 'SAP Keberatan'),
(34, 'CEISA SAC 2'),
(35, 'Registrasi Kepabeanan'),
(36, 'CEISA Impor'),
(37, 'CEISA Ekspor'),
(38, 'CEISA Manifes Inward'),
(39, 'Regina Batam'),
(40, 'CEISA BC 2.3'),
(41, 'CEISA SAC Online'),
(42, 'TPS Online'),
(43, 'SIAPTANDING'),
(44, 'CEISA SAC Tools'),
(45, 'Simpeg Web'),
(46, 'CEISA Manifes Outward'),
(47, 'Impor Sementara'),
(48, 'CEISA Patroli Laut'),
(49, 'DASHBOARD'),
(50, 'SMIP'),
(51, 'DBNP New'),
(52, 'CEISA FTZ_OLD'),
(53, 'CEISA TPB'),
(54, 'Simaudi'),
(55, 'PAU'),
(57, 'Sidia'),
(58, 'Denada'),
(59, 'CEISA Laboratorium'),
(60, 'Sistem Barang Kiriman'),
(61, 'EDIS'),
(62, 'FTZ'),
(63, 'Haki'),
(69, 'PERFORMA'),
(70, 'Download Data'),
(99, 'Aplikasi Lainya');

-- --------------------------------------------------------

--
-- Table structure for table `tr_history`
--

CREATE TABLE IF NOT EXISTS `tr_history` (
  `id_history` int(11) NOT NULL,
  `kd_approval` int(11) NOT NULL,
  `kd_permohonan` int(5) NOT NULL,
  `nip_petugas` varchar(18) NOT NULL,
  `status` varchar(50) NOT NULL,
  `tanggal_proses` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `catatan` varchar(200) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tr_history`
--

INSERT INTO `tr_history` (`id_history`, `kd_approval`, `kd_permohonan`, `nip_petugas`, `status`, `tanggal_proses`, `catatan`) VALUES
(41, 35, 77, '199411062018012005', 'Release', '2018-07-11 13:47:21', 'jjj'),
(42, 39, 84, '199411062018012005', 'Assesment', '2018-07-11 13:52:02', 'naik kelas'),
(43, 39, 84, '199411062018012005', 'Deployed', '2018-07-11 13:54:06', 'Done'),
(44, 40, 85, '199411062018012005', 'Deploying', '2018-07-11 14:12:14', ''),
(45, 40, 85, '199411062018012005', 'Testing', '2018-07-11 14:13:46', ''),
(46, 41, 86, '199411062018012005', 'Assesment', '2018-07-11 14:33:39', ''),
(47, 41, 86, '199411062018012005', 'Deploying', '2018-07-11 14:46:56', ''),
(48, 42, 80, '199112122015022009', 'Testing', '2018-08-15 07:54:05', 'okay'),
(49, 43, 120, '199112122015022009', 'Assesment', '2018-08-16 10:18:16', 'asse'),
(50, 43, 120, '199112122015022009', 'Approval', '2018-08-16 10:18:50', 'app'),
(51, 43, 120, '199112122015022009', 'Deploying', '2018-08-16 10:19:56', 'dept'),
(52, 43, 120, '199112122015022009', 'Deployed', '2018-08-16 10:20:27', 'deptyedddd'),
(53, 43, 120, '199112122015022009', 'Deployment Failed', '2018-08-16 10:20:58', 'deptyedddd falid'),
(54, 43, 120, '199112122015022009', 'Testing', '2018-08-16 10:23:14', 'testing'),
(55, 44, 134, '199411062018012005', 'Deploying', '2018-08-21 18:31:12', 'kerem'),
(56, 45, 137, '199411062018012005', 'Deploying', '2018-08-21 21:17:56', 'caca'),
(57, 45, 137, '199411062018012005', 'Deployed', '2018-08-22 01:34:33', 'caca'),
(58, 46, 139, '199411062018012005', 'Deploying', '2018-08-22 06:43:24', ''),
(59, 47, 146, '199411062018012005', 'Deploying', '2018-08-22 10:56:18', 'yaya'),
(60, 48, 142, '199411062018012005', 'Testing', '2018-08-23 14:39:26', ''),
(61, 49, 152, '199411062018012005', 'Approval', '2018-08-24 15:07:36', 'tes dulu'),
(62, 49, 152, '199411062018012005', 'Deploying', '2018-08-24 15:08:04', 'proses deploy samai dengan jam 15:00'),
(63, 49, 152, '199411062018012005', 'Deployment Failed', '2018-08-24 15:08:28', 'file gagal deploy'),
(64, 49, 152, '199411062018012005', 'Assesment', '2018-08-24 15:27:28', 'ulang tahap 2'),
(65, 49, 152, '199411062018012005', 'Deploying', '2018-08-24 15:27:45', 'ulang tahap 2 - deploying'),
(66, 50, 145, '199411062018012005', 'Assesment', '2018-08-28 08:33:57', 'dokumen tidak lengkap'),
(67, 51, 157, '199112122015022009', 'Assesment', '2018-08-29 08:16:37', 'ok asses'),
(68, 51, 157, '199112122015022009', 'Approval', '2018-08-29 08:16:49', 'sudah approv'),
(69, 51, 157, '199112122015022009', 'Deploying', '2018-08-29 08:16:59', 'sedang deploy'),
(70, 51, 157, '199112122015022009', 'Deployed', '2018-08-29 08:17:10', 'ok deployed'),
(71, 51, 157, '199112122015022009', 'Testing', '2018-08-29 08:17:27', 'ok sudah testing'),
(72, 51, 157, '199112122015022009', 'Release', '2018-08-29 08:17:52', 'sudah release'),
(73, 52, 161, '199209182015021003', 'Assesment', '2018-09-06 08:09:55', ''),
(74, 52, 161, '199209182015021003', 'Approval', '2018-09-06 08:27:03', ''),
(75, 52, 161, '199209182015021003', 'Deploying', '2018-09-06 08:27:20', ''),
(76, 52, 161, '199209182015021003', 'Deployed', '2018-09-06 09:01:24', ''),
(77, 52, 161, '199209182015021003', 'Testing', '2018-09-06 10:16:14', 'Hasil tes menu di aplikasi inhouse, Online bisa diakses tanpa error'),
(78, 52, 161, '199209182015021003', 'Release', '2018-09-06 10:19:33', 'Hasil tes menu di aplikasi inhouse, Online bisa diakses tanpa error'),
(79, 53, 165, '199209182015021003', 'Assesment', '2018-09-08 07:37:25', 'war lama sudah dibackup, file war baru sudah siap deploy'),
(80, 53, 165, '199209182015021003', 'Deploying', '2018-09-08 07:38:20', 'Tidak ada masalah waktu deploy, harus diundeploy dulu file yg lama'),
(81, 53, 165, '199209182015021003', 'Deployed', '2018-09-08 07:39:02', 'war sudah dideploy dan tidak ada error'),
(82, 53, 165, '199209182015021003', 'Testing', '2018-09-08 07:41:57', 'Sudah dites untuk upload/download file gambar berhasil '),
(83, 53, 165, '199209182015021003', 'Release', '2018-09-08 07:42:34', 'Sudah aktif di production'),
(84, 54, 166, '199209182015021003', 'Assesment', '2018-09-08 08:38:45', 'file war ada siap dideploy'),
(85, 54, 166, '199209182015021003', 'Deploying', '2018-09-08 08:45:01', 'deploy service dan aplikasi inhouse'),
(86, 54, 166, '199209182015021003', 'Deployed', '2018-09-08 08:48:41', 'Berhasil deploy tidak ada error saat deploy'),
(87, 54, 166, '199209182015021003', 'Deployed', '2018-09-08 10:00:13', 'Berhasil deploy'),
(88, 54, 166, '199209182015021003', 'Testing', '2018-09-08 10:00:57', 'Masih piloting di kantor malang saja'),
(89, 55, 163, '199209182015021003', 'Assesment', '2018-09-08 10:02:40', 'file lengkap, siap di deploy'),
(90, 55, 163, '199209182015021003', 'Deploying', '2018-09-08 10:04:14', 'deploy service SKA di dmgr 10.242.245.45'),
(91, 55, 163, '199209182015021003', 'Deploying', '2018-09-08 11:04:44', 'Aplikasi berhasil dideploy tanpa error, tetapi belum diaktifkan'),
(92, 55, 163, '199209182015021003', 'Deployed', '2018-09-08 21:16:52', 'Sudah dideploy dan tidak muncul error di log'),
(93, 55, 163, '199209182015021003', 'Testing', '2018-09-08 21:23:11', 'testing akses URL wsdl dari server backend dan dari datapower berhasil'),
(94, 55, 163, '199209182015021003', 'Release', '2018-09-08 21:24:48', 'sudah dipasang F5 poduction dan datapower production \r\nhttp://datapower.customs.go.id/SKA/Service.wsdl\r\nhttp://10.242.245.42:85/SKA/Service/Service.wsdl'),
(95, 56, 164, '199209182015021003', 'Assesment', '2018-09-09 08:57:05', 'file war lengkap, siap dideploy'),
(96, 56, 164, '199209182015021003', 'Assesment', '2018-09-09 08:57:56', 'war impor inhouse dideploy di cluster kecil, madya, priok'),
(97, 56, 164, '199209182015021003', 'Deploying', '2018-09-09 09:55:25', 'war impor inhouse dideploy di cluster kecil, madya, priok'),
(98, 56, 164, '199209182015021003', 'Deployed', '2018-09-09 09:56:12', 'Sudah dideploy disemua node'),
(99, 56, 164, '199209182015021003', 'Testing', '2018-09-09 09:56:47', 'Error including page: null waktu di tes akses aplikasi'),
(100, 56, 164, '199209182015021003', 'Rollback', '2018-09-09 09:57:28', 'Rollback ke war sebelumnya'),
(101, 57, 162, '199411062018012005', 'Assesment', '2018-09-11 14:15:28', '');

-- --------------------------------------------------------

--
-- Table structure for table `tr_jns_deploy`
--

CREATE TABLE IF NOT EXISTS `tr_jns_deploy` (
  `kd_jns_deploy` int(2) NOT NULL,
  `ur_deploy` varchar(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tr_jns_deploy`
--

INSERT INTO `tr_jns_deploy` (`kd_jns_deploy`, `ur_deploy`) VALUES
(1, 'Minor'),
(2, 'Mayor'),
(3, 'Emergency'),
(4, 'Aplikasi Baru');

-- --------------------------------------------------------

--
-- Table structure for table `tr_pegawai`
--

CREATE TABLE IF NOT EXISTS `tr_pegawai` (
  `nip_pegawai` varchar(18) NOT NULL,
  `nm_pegawai` varchar(50) NOT NULL,
  `jabatan` varchar(225) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `crypt` varchar(500) NOT NULL DEFAULT '3365cdeb71ad7146a8f0a2b65bddf136',
  `key` varchar(500) NOT NULL DEFAULT 'e58a5e23cb26998e029ab3a734244226',
  `grub` varchar(8) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tr_pegawai`
--

INSERT INTO `tr_pegawai` (`nip_pegawai`, `nm_pegawai`, `jabatan`, `username`, `password`, `crypt`, `key`, `grub`) VALUES
('197001251990121001', 'MOCHAMAD AGUS ROFIUDIN', 'DIREKTUR INFORMASI KEPABEANAN DAN CUKAI', 'agus.rofiudin', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('197005111996031001', 'YACOBUS AGUS WAHYUDIONO', 'KEPALA SUBDIREKTORAT PENGELOLAAN DAN LAYANAN DATA DIREKTORAT INFORMASI', 'yacobus.agus', '1', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pld'),
('197102131996031004', 'ARI SETYO WIDODO', 'KEPALA SUBDIREKTORAT STRATEGI DAN PERENCANAAN SISTEM INFORMASI DIREKTO', 'hari.setyo', '2', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'spsi'),
('197902092002121002', 'YAN INDERAYANA', 'KEPALA SUBDIREKTORAT PENGENDALIAN KEAMANAN INFORMASI, MANAJEMEN LAYANA', 'yan.indera', '3', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pkimle'),
('196907181990011001', 'DANANG YULIANTO', 'KEPALA SUBDIREKTORAT PENGEMBANGAN SISTEM INFORMASI DIREKTORAT INFORMAS', 'danang.yulianto', '4', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('197801172002121001', 'PURWADI', 'KEPALA SEKSI ARSITEKTUR DAN ANALISIS KAPASITAS TEKNOLOGI INFORMASI DIR', 'purwadi', '5', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'spsi'),
('197202091992011001', 'SUWARNO', 'KEPALA SEKSI PENGENDALIAN KEAMANAN INFORMASI DAN PENGELOLAAN INFRASTRU', 'suwarno', '6', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pkimle'),
('197202111998031002', 'BUDI SATRIA', 'KEPALA SEKSI MANAJEMEN KUALITAS DATA DIREKTORAT INFORMASI KEPABEANAN D', 'budi.satria.001', '7', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pld'),
('196912121996032001', 'FITRI AJUNING WARDHANI', 'KEPALA SUBBAGIAN TATA USAHA DIREKTORAT INFORMASI KEPABEANAN DAN CUKAI', 'fitri.ajuning', '8', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pld'),
('197209301998031004', 'SURYAWAN PRIHATIN', 'KEPALA SEKSI MANAJEMEN LAYANAN TEKNOLOGI INFORMASI DIREKTORAT INFORMAS', 'suryawan.prihatin', '9', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pkimle'),
('197006131989121001', 'DIDIT RUDY SETYAWAN', 'KEPALA SEKSI PENGEMBANGAN SISTEM INFORMASI I DIREKTORAT INFORMASI KEPA', 'didit.rudy', '10', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('196205301984031001', 'DARYONO', 'KEPALA SEKSI PERENCANAAN DAN TATA KELOLA KEBIJAKAN TEKNOLOGI INFORMASI', 'daryono.s', '11', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'spsi'),
('197711061999031001', 'M. ROFIUDZDZIKRI', 'KEPALA SEKSI PENGENDALIAN MUTU SISTEM INFORMASI DIREKTORAT INFORMASI K', 'dzikri', '12', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('197611141999031003', 'ACHMAD SETIAWAN', 'KEPALA SEKSI PERANCANGAN SISTEM INFORMASI DIREKTORAT INFORMASI KEPABEA', 'achmad.setiawan', '13', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('196904291989121001', 'EKO TJAHJONO', 'KEPALA SEKSI EVALUASI LAYANAN TEKNOLOGI INFORMASI DIREKTORAT INFORMASI', 'eko.tjahjono', '14', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pkimle'),
('197606291999031001', 'SLAMET SUBUR', 'KEPALA SEKSI MANAJEMEN PROGRAM TEKNOLOGI INFORMASI DIREKTORAT INFORMAS', 'subur', 'subur', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'spsi'),
('197903032000011001', 'KHILMI MUBAROK', 'KEPALA SEKSI PENGEMBANGAN SISTEM INFORMASI II DIREKTORAT INFORMASI KEP', 'khilmi.mubarok', '14', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('197202261992011001', 'MOHAMMAD DIAN ANHAR', 'KEPALA SEKSI ANALISA DAN LAYANAN DATA DIREKTORAT INFORMASI KEPABEANAN ', 'mohammad.dian', '15', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pld'),
('198802172015021002', 'FEBRIAN BAHARI ADI', 'PEGAWAI PADA DIREKTORAT INFORMASI KEPABEANAN DAN CUKAI', '', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', ''),
('199112122015022009', 'SHIFA AULIA', 'PEGAWAI PADA SEKSI PERENCANAAN DAN TATA KELOLA KEBIJAKAN TEKNOLOGI INF', 'shifa.aulia', 'shifa', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'spsi'),
('199507232018011003', 'VANANDA RAHADIKA', 'PEGAWAI PADA SEKSI PERANCANGAN SISTEM INFORMASI DIREKTORAT INFORMASI K', 'vananda.rahadika', 'vananda', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pld'),
('199411202018011007', 'RIZKY IRFAN ADITOMO', 'PEGAWAI PADA SEKSI EVALUASI LAYANAN TEKNOLOGI INFORMASI DIREKTORAT INF', 'rizky.irfan', 'rizky', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pkimle'),
('199507072018012004', 'SITI YULIANI SARI', 'PEGAWAI PADA SEKSI PENGENDALIAN KEAMANAN INFORMASI DAN PENGELOLAAN INF', 'siti.yuliani', 'siti', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pkimle'),
('199401262018012002', 'UNTARI ZAECA WARJANI', 'PEGAWAI PADA SEKSI PENGEMBANGAN SISTEM INFORMASI I DIREKTORAT INFORMAS', 'untari.zaeca', 'untari', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('199412022018011002', 'PETRUS ANTONIO TARIGAN', 'PEGAWAI PADA SEKSI PENGENDALIAN MUTU SISTEM INFORMASI DIREKTORAT INFOR', 'antonio.tarigan', 'antonio', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('199609042018011003', 'MUHAMMAD NUIM', 'PEGAWAI PADA SEKSI PENGEMBANGAN SISTEM INFORMASI II DIREKTORAT INFORMA', 'muhammad.nuim', 'muhammad', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('199309222018012002', 'NELA RIZKY', 'PEGAWAI PADA SEKSI PENGEMBANGAN SISTEM INFORMASI I DIREKTORAT INFORMAS', 'nela.rizky', 'nela', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('199305122018012001', 'INTAN SARI', 'PEGAWAI PADA SEKSI PERANCANGAN SISTEM INFORMASI DIREKTORAT INFORMASI K', 'intan.sari', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('199003192018011003', 'MICHEL MULIA SIBARANI', 'PEGAWAI PADA SEKSI PERANCANGAN SISTEM INFORMASI DIREKTORAT INFORMASI K', 'mulia.sibarani', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('199505072018011005', 'MOHAMMAD ANDI TRIANSYAH', 'PEGAWAI PADA SEKSI MANAJEMEN LAYANAN TEKNOLOGI INFORMASI DIREKTORAT IN', 'andi.triansyah', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pkimle'),
('199506222018011004', 'MUHAMAD IBNU YUSUFADHI', 'PEGAWAI PADA SEKSI MANAJEMEN LAYANAN TEKNOLOGI INFORMASI DIREKTORAT IN', 'muhamad.ibnu', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pkimle'),
('199505182018011003', 'AGA CHANDRA PURNAMA', 'PEGAWAI PADA SEKSI PENGENDALIAN MUTU SISTEM INFORMASI DIREKTORAT INFOR', 'aga.chandra', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('199411062018012005', 'A''INUN FATIKAH BUDIYATI', 'PEGAWAI PADA SEKSI MANAJEMEN LAYANAN TEKNOLOGI INFORMASI DIREKTORAT IN', 'ainun.fatikah', 'c27cd12c8034c739304c22a3a3748e39', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pkimle'),
('199504102018011005', 'AGNIA DZIKRI ALMADANI', 'PEGAWAI PADA SEKSI PENGENDALIAN KEAMANAN INFORMASI DAN PENGELOLAAN INF', 'dzikri.almadani', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pkimle'),
('199506092018011002', 'AL FARUQI HASNUL', 'PEGAWAI PADA SEKSI PENGEMBANGAN SISTEM INFORMASI II DIREKTORAT INFORMA', 'al.faruqi', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('199412032018011005', 'ARIYOGI H SIHITE', 'PEGAWAI PADA SEKSI PENGEMBANGAN SISTEM INFORMASI II DIREKTORAT INFORMA', 'ariyogi.h', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('199310032018011001', 'YOHANES BELLA KURNIAWAN', 'PEGAWAI PADA SEKSI ANALISA DAN LAYANAN DATA DIREKTORAT INFORMASI KEPAB', 'yohanes.bella', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pld'),
('199409152018012001', 'BETTY PURBA', 'PEGAWAI PADA SEKSI PENGEMBANGAN SISTEM INFORMASI II DIREKTORAT INFORMA', 'betty.purba', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('199502022018011003', 'ANDRE FIRMANSYAH', 'PEGAWAI PADA SEKSI ARSITEKTUR DAN ANALISIS KAPASITAS TEKNOLOGI INFORMA', 'andre.firmansyah', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'spsi'),
('199410122018011002', 'ANGGIAT LIBERTO JESIAN SIHOMBING', 'PEGAWAI PADA SEKSI PENGEMBANGAN SISTEM INFORMASI I DIREKTORAT INFORMAS', 'anggiat.liberto', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('199601282018011004', 'ANWAR HIDAYAT', 'PEGAWAI PADA SEKSI MANAJEMEN LAYANAN TEKNOLOGI INFORMASI DIREKTORAT IN', 'anwar.hidayat.001', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pkimle'),
('199610042018012002', 'AVIDA ENDRIANI', 'PEGAWAI PADA SEKSI PERANCANGAN SISTEM INFORMASI DIREKTORAT INFORMASI K', 'avida.endriani', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('199409102018011003', 'FRANS ABADI', 'PEGAWAI PADA SEKSI MANAJEMEN LAYANAN TEKNOLOGI INFORMASI DIREKTORAT IN', 'frans.abadi', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pkimle'),
('199612162018012001', 'GLORY NATHALIA PURBA', 'PEGAWAI PADA SEKSI PENGENDALIAN MUTU SISTEM INFORMASI DIREKTORAT INFOR', 'glory.nathalia', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('199102162018012003', 'NURITA BUDI MARTATI', 'PEGAWAI PADA SEKSI PENGEMBANGAN SISTEM INFORMASI I DIREKTORAT INFORMAS', 'nurita.budi', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('199604052018012002', 'NURUL FAUZIAH HSB', 'PEGAWAI PADA SEKSI PENGEMBANGAN SISTEM INFORMASI II DIREKTORAT INFORMA', 'fauziah.hsb', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('199403162018012002', 'RAHMAWATI', 'PEGAWAI PADA SEKSI PERANCANGAN SISTEM INFORMASI DIREKTORAT INFORMASI K', 'rahmawati', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('199410072018012004', 'REIGY KARRINA', 'PEGAWAI PADA SEKSI PENGENDALIAN KEAMANAN INFORMASI DAN PENGELOLAAN INF', 'reigy.karrina', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pkimle'),
('199008042018012004', 'BETHA SRI AMBARWATI', 'PEGAWAI PADA SEKSI ANALISA DAN LAYANAN DATA DIREKTORAT INFORMASI KEPAB', 'betha.sri', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pld'),
('199511292018011004', 'CAESAR GILANG PRATAMA', 'PEGAWAI PADA SEKSI ARSITEKTUR DAN ANALISIS KAPASITAS TEKNOLOGI INFORMA', 'caesar.gilang', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'spsi'),
('199602242018012002', 'CLARA STEFHANI SILALAHI', 'PEGAWAI PADA SEKSI PENGEMBANGAN SISTEM INFORMASI II DIREKTORAT INFORMA', '', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', ''),
('199504142018011002', 'IRFAN SETIA PERMANA', 'PEGAWAI PADA SEKSI PENGENDALIAN MUTU SISTEM INFORMASI DIREKTORAT INFOR', '', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', ''),
('199612282018012001', 'DESTIA NURVANNY', 'PEGAWAI PADA SEKSI MANAJEMEN KUALITAS DATA DIREKTORAT INFORMASI KEPABE', '', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', ''),
('199603032018011005', 'IZA RISKIANA', 'PEGAWAI PADA SEKSI MANAJEMEN LAYANAN TEKNOLOGI INFORMASI DIREKTORAT IN', 'iza.riskiana', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pkimle'),
('199601012018011008', 'JOSAFATINO MORGANI', 'PEGAWAI PADA SEKSI PENGENDALIAN MUTU SISTEM INFORMASI DIREKTORAT INFOR', 'josafatino.morgani', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('199111252018012002', 'KRISTI NOVIALA SIANIPAR', 'PEGAWAI PADA SEKSI PERANCANGAN SISTEM INFORMASI DIREKTORAT INFORMASI K', 'kristi.noviala', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('199002072018012002', 'RIKA PRASTIKA GINTING', 'PEGAWAI PADA SEKSI PERENCANAAN DAN TATA KELOLA KEBIJAKAN TEKNOLOGI INF', 'rika.prastika', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'spsi'),
('199412162018012003', 'RISNA PURWITA SIWI', 'PEGAWAI PADA SEKSI PERANCANGAN SISTEM INFORMASI DIREKTORAT INFORMASI K', '', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', ''),
('199412052018012001', 'RIZKI EKANINGSARI', 'PEGAWAI PADA SEKSI PENGEMBANGAN SISTEM INFORMASI I DIREKTORAT INFORMAS', '', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', ''),
('199411152018011005', 'FADLY SYAHPUTRA', 'PEGAWAI PADA SEKSI ANALISA DAN LAYANAN DATA DIREKTORAT INFORMASI KEPAB', '', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', ''),
('199201042018012001', 'DWINA ARTATI', 'PEGAWAI PADA SEKSI PERENCANAAN DAN TATA KELOLA KEBIJAKAN TEKNOLOGI INF', '', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', ''),
('199601292018011004', 'EKI PRATAMA WAHYU SYAHPUTRA', 'PEGAWAI PADA SEKSI EVALUASI LAYANAN TEKNOLOGI INFORMASI DIREKTORAT INF', 'eki.pratama', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pkimle'),
('199507112018012003', 'ELYA YULANDARI', 'PEGAWAI PADA SEKSI PENGEMBANGAN SISTEM INFORMASI I DIREKTORAT INFORMAS', '', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', ''),
('199603202018012004', 'ENJEL KEKE MARTADANIA', 'PEGAWAI PADA SEKSI MANAJEMEN LAYANAN TEKNOLOGI INFORMASI DIREKTORAT IN', 'keke.martadania', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pkimle'),
('199608042018011004', 'MUHAMMAD ALIF DJORDY', 'PEGAWAI PADA SEKSI PENGENDALIAN MUTU SISTEM INFORMASI DIREKTORAT INFOR', '', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', ''),
('199509222018011006', 'MUHAMMAD IHCSAN KAMIL SUPRI', 'PEGAWAI PADA SEKSI PENGEMBANGAN SISTEM INFORMASI I DIREKTORAT INFORMAS', '', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', ''),
('199501282018012002', 'GLADIS WHARAS TYAN', 'PEGAWAI PADA SEKSI PENGELOLAAN BASIS DATA DIREKTORAT INFORMASI KEPABEA', '', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', ''),
('199105042018011002', 'IBRAH SAULIAN', 'PEGAWAI PADA SEKSI PERENCANAAN DAN TATA KELOLA KEBIJAKAN TEKNOLOGI INF', '', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', ''),
('199006092015021002', 'DITE ARDHIAN', 'PEGAWAI PADA SEKSI PENGENDALIAN KEAMANAN INFORMASI DAN PENGELOLAAN INF', 'dite.ardhian', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pkimle'),
('199604282018011004', 'TRY IFDIL', 'PEGAWAI PADA SEKSI PENGENDALIAN MUTU SISTEM INFORMASI DIREKTORAT INFOR', 'try.ifdil', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('198204022003122001', 'MARIAH QIBTIYYAH', 'PEGAWAI PADA SEKSI MANAJEMEN KUALITAS DATA DIREKTORAT INFORMASI KEPABE', 'mariah.qibtiyyah', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pld'),
('198912262012101001', 'ILMAR PUNGU SIMANJUNTAK', 'PEGAWAI PADA SUBBAGIAN TATA USAHA DIREKTORAT INFORMASI KEPABEANAN DAN ', 'ilmar.pungu', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'spsi'),
('199001042010011004', 'SAHRUL SAHRONI', 'PEGAWAI PADA SEKSI EVALUASI LAYANAN TEKNOLOGI INFORMASI DIREKTORAT INF', '', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', ''),
('198509212010121004', 'YOGA ANGGORO', 'PEGAWAI PADA SEKSI EVALUASI LAYANAN TEKNOLOGI INFORMASI DIREKTORAT INF', 'yoga.anggoro', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pkimle'),
('198605222010121004', 'LALU FAISAL AMRI RAHMAN', 'PEGAWAI PADA SEKSI MANAJEMEN KUALITAS DATA DIREKTORAT INFORMASI KEPABE', 'lalu.faisal', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pld'),
('198510032007011002', 'YUAFANDA KHOLFI HARTONO', 'PEGAWAI PADA SUBBAGIAN TATA USAHA DIREKTORAT INFORMASI KEPABEANAN DAN ', 'yuafanda.kholfi', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pld'),
('198406192010121006', 'DHARIEL INDRIANSYAH', 'PEGAWAI PADA SEKSI PERANCANGAN SISTEM INFORMASI DIREKTORAT INFORMASI K', 'dhariel.indriansyah', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('198507312006021002', 'ANDI ASHAR MAWARDI', 'PEGAWAI PADA SEKSI EVALUASI LAYANAN TEKNOLOGI INFORMASI DIREKTORAT INF', 'andi.ashar.001', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pkimle'),
('198312072002121001', 'ERWIN DUADJA BETHA SASANA', 'PEGAWAI PADA DIREKTORAT INFORMASI KEPABEANAN DAN CUKAI', 'erwin.duadja', 'psi', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('198512152007011002', 'TAGARA PRIMADISTA', 'PEGAWAI PADA SEKSI MANAJEMEN LAYANAN TEKNOLOGI INFORMASI DIREKTORAT IN', 'tagara.primadista', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pkimle'),
('198704052010122005', 'LISMAWARTI NURFITRI', 'PEGAWAI PADA SEKSI PENGENDALIAN MUTU SISTEM INFORMASI DIREKTORAT INFOR', 'lismawarti.nurfitri', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('198704252010121003', 'HARI SETYO NUGROHO', 'PEGAWAI PADA SEKSI PERANCANGAN SISTEM INFORMASI DIREKTORAT INFORMASI K', '', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', ''),
('198609282010121004', 'ANGGA GATRA', 'PEGAWAI PADA SUBBAGIAN TATA USAHA DIREKTORAT INFORMASI KEPABEANAN DAN ', '', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', ''),
('198003162003121002', 'KOYO SUMANTRI ADHIGUNO', 'PEGAWAI PADA SEKSI PERANCANGAN SISTEM INFORMASI DIREKTORAT INFORMASI K', 'ks.adhiguno', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('198206192003121003', 'ZULFADLY', 'PEGAWAI PADA SEKSI PENGELOLAAN BASIS DATA DIREKTORAT INFORMASI KEPABEA', '', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', ''),
('198309062009011005', 'MIRZA CHAIDIR RACHMAN', 'PEGAWAI PADA SUBBAGIAN TATA USAHA DIREKTORAT INFORMASI KEPABEANAN DAN ', 'mirza.chaidir', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pld'),
('199209242013101001', 'I KETUT CATUR PRADNYANA', 'PEGAWAI PADA SEKSI MANAJEMEN LAYANAN TEKNOLOGI INFORMASI DIREKTORAT IN', 'i.ketut.014', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'spsi'),
('199209282013101001', 'WAHYU PRIMA NADIA', 'PEGAWAI PADA SEKSI MANAJEMEN LAYANAN TEKNOLOGI INFORMASI DIREKTORAT IN', 'wahyu.prima', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pkimle'),
('199103062013101001', 'ANDHIKA YUDHISTIRA KUSUMA', 'PEGAWAI PADA SEKSI PENGEMBANGAN SISTEM INFORMASI II DIREKTORAT INFORMA', 'andhika.yudhistira', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('199107212009121001', 'GALANT IHDIANTO', 'PEGAWAI PADA SEKSI EVALUASI LAYANAN TEKNOLOGI INFORMASI DIREKTORAT INF', 'galant.ihdianto', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pkimle'),
('199210052012101001', 'IRPAN RISWANTO', 'PEGAWAI PADA SUBBAGIAN TATA USAHA DIREKTORAT INFORMASI KEPABEANAN DAN ', 'irpan.riswanto', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pld'),
('199204222013101001', 'DOAN FRITS POHAN', 'PEGAWAI PADA SEKSI MANAJEMEN LAYANAN TEKNOLOGI INFORMASI DIREKTORAT IN', 'doan.frits', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'spsi'),
('199111022012101001', 'AMSAL WALNOVEMBRY', 'PEGAWAI PADA SUBBAGIAN TATA USAHA DIREKTORAT INFORMASI KEPABEANAN DAN ', '', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', ''),
('199303122013101001', 'AHMAD HASANUDDIN', 'PEGAWAI PADA SUBBAGIAN TATA USAHA DIREKTORAT INFORMASI KEPABEANAN DAN ', '', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', ''),
('199205012012101001', 'HERI DARMAWAN', 'PEGAWAI PADA SUBBAGIAN TATA USAHA DIREKTORAT INFORMASI KEPABEANAN DAN ', 'heri.darmawan', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pld'),
('199208122012101001', 'AUGUSTA SURYA DEVARA', 'PEGAWAI PADA SUBBAGIAN TATA USAHA DIREKTORAT INFORMASI KEPABEANAN DAN ', '', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', ''),
('198712012010121007', 'FAISAL WIRAKUSUMA', 'PEGAWAI PADA SEKSI ANALISA DAN LAYANAN DATA DIREKTORAT INFORMASI KEPAB', 'faisal.wirakusuma', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pld'),
('199004062010011001', 'BOY UDUT BINARTA', 'PEGAWAI PADA SEKSI EVALUASI LAYANAN TEKNOLOGI INFORMASI DIREKTORAT INF', 'boy.udut', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'spsi'),
('198808182010121006', 'MUGI AYOMI', 'PEGAWAI PADA SUBBAGIAN TATA USAHA DIREKTORAT INFORMASI KEPABEANAN DAN ', 'mugi.ayomi', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('199603272015021001', 'MUHAMMAD RIZKI SAPUTRA', 'PEGAWAI PADA DIREKTORAT INFORMASI KEPABEANAN DAN CUKAI', '', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', ''),
('198711072014022003', 'DIAN RISMALASARI', 'PEGAWAI PADA SEKSI PENGENDALIAN MUTU SISTEM INFORMASI DIREKTORAT INFOR', 'dian.rismalasari', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('199209182015021003', 'SEPTIAN DWI UTOMO', 'PEGAWAI PADA SEKSI EVALUASI LAYANAN TEKNOLOGI INFORMASI DIREKTORAT INF', 'dwi.utomo', 'dwi.utomo', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pkimle'),
('199203232015021002', 'WAHYU RAMADHAN', 'PEGAWAI PADA SEKSI PENGEMBANGAN SISTEM INFORMASI I DIREKTORAT INFORMAS', 'wahyu.ramadhan.001', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('199303272014111001', 'FAHMI MAULANA AINULYAKIN', 'PEGAWAI PADA SEKSI PENGEMBANGAN SISTEM INFORMASI I DIREKTORAT INFORMAS', 'fahmi.maulana', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('199312302013101003', 'M FAJRI ANDIKA PURBAYA', 'PEGAWAI PADA SEKSI MANAJEMEN LAYANAN TEKNOLOGI INFORMASI DIREKTORAT IN', 'm.fajri', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pkimle'),
('198612242014021003', 'STEWART PATRAS', 'PEGAWAI PADA SEKSI EVALUASI LAYANAN TEKNOLOGI INFORMASI DIREKTORAT INF', '', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', ''),
('199101162014021005', 'T. M. KHAIRI AMAMI', 'PEGAWAI PADA SEKSI ARSITEKTUR DAN ANALISIS KAPASITAS TEKNOLOGI INFORMA', '', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', ''),
('199101252014021002', 'INDRA PRAJA', 'PEGAWAI PADA SEKSI PERENCANAAN DAN TATA KELOLA KEBIJAKAN TEKNOLOGI INF', 'ina.praja', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'spsi'),
('199101292014022007', 'HELMIDA PRIANDINI', 'PEGAWAI PADA SEKSI PENGENDALIAN MUTU SISTEM INFORMASI DIREKTORAT INFOR', 'helmida.priandini', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('199103162014022007', 'DEWI SRI RAHAYUNINGSIH', 'PEGAWAI PADA SEKSI PENGELOLAAN BASIS DATA DIREKTORAT INFORMASI KEPABEA', 'dewi.sri', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pld'),
('199104222014021002', 'KETUT APRIANA', 'PEGAWAI PADA SEKSI PENGENDALIAN KEAMANAN INFORMASI DAN PENGELOLAAN INF', 'ketut.apriana', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pkimle'),
('199104232014022002', 'DHITA AIDILLA', 'PEGAWAI PADA SEKSI MANAJEMEN LAYANAN TEKNOLOGI INFORMASI DIREKTORAT IN', 'dhita.aidilla', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pkimle'),
('198807152014021007', 'ANDI KURNIAWAN', 'PEGAWAI PADA SEKSI MANAJEMEN PROGRAM TEKNOLOGI INFORMASI DIREKTORAT IN', 'andi.kurniawan', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'spsi'),
('199112112014022003', 'MINNY NURJANNAH', 'PEGAWAI PADA SEKSI ANALISA DAN LAYANAN DATA DIREKTORAT INFORMASI KEPAB', 'minny.nurjannah', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pld'),
('199208012014022004', 'RATRI RACHMA PRAMESTI', 'PEGAWAI PADA SEKSI PENGENDALIAN MUTU SISTEM INFORMASI DIREKTORAT INFOR', 'ratri.rachma', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('199309222013101002', 'MUKHAMAD MUJI HIDAYAT', 'PEGAWAI PADA SUBBAGIAN TATA USAHA DIREKTORAT INFORMASI KEPABEANAN DAN ', 'mukhamad.muji', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pkimle'),
('199012152014022001', 'DIES LARASSANTI RAHAYU', 'PEGAWAI PADA SEKSI PENGELOLAAN BASIS DATA DIREKTORAT INFORMASI KEPABEA', 'dies.larassanti', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pld'),
('199006042014021003', 'CANRAKERTA', 'PEGAWAI PADA SUBBAGIAN TATA USAHA DIREKTORAT INFORMASI KEPABEANAN DAN ', 'canrakerta', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('199007172014021004', 'TRY FAUZAN', 'PEGAWAI PADA SEKSI PENGENDALIAN KEAMANAN INFORMASI DAN PENGELOLAAN INF', 'try.fauzan', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pkimle'),
('199310082013101002', 'SABDA AWAL', 'PEGAWAI PADA DIREKTORAT INFORMASI KEPABEANAN DAN CUKAI', '', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', ''),
('198808162015021001', 'EDISON MARPAUNG', 'PEGAWAI PADA SEKSI PENGEMBANGAN SISTEM INFORMASI I DIREKTORAT INFORMAS', 'edison.marpaung', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('199201042015021003', 'APRIZAL NUARI PUTRA', 'PEGAWAI PADA SEKSI EVALUASI LAYANAN TEKNOLOGI INFORMASI DIREKTORAT INF', 'aprizal.nuari', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pkimle'),
('199208012015021003', 'DIVA ARYA YUDHAPRASTA PUTRA', 'PEGAWAI PADA SEKSI PENGENDALIAN KEAMANAN INFORMASI DAN PENGELOLAAN INF', 'arya.yudhaprasta', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pkimle'),
('199211202015022004', 'NOVA ESTERINA SILITONGA', 'PEGAWAI PADA SEKSI PERENCANAAN DAN TATA KELOLA KEBIJAKAN TEKNOLOGI INF', 'nova.esterina', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('199511222015021002', 'ANDI IVAN NOVIAWAL', 'PEGAWAI PADA DIREKTORAT INFORMASI KEPABEANAN DAN CUKAI', 'andi.ivan', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pkimle'),
('199504152015021004', 'LENDRA ZULFIKAR RISMIADI', 'PEGAWAI PADA DIREKTORAT INFORMASI KEPABEANAN DAN CUKAI', '', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', ''),
('198610162010121002', 'SIGIT PRAMONO', 'PEGAWAI PADA SUBBAGIAN TATA USAHA DIREKTORAT INFORMASI KEPABEANAN DAN ', 'sigit.pramono', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pld'),
('199508242015121001', 'MUHAMMAD SIDIQ ANSORI', 'PEGAWAI PADA SEKSI ANALISA DAN LAYANAN DATA DIREKTORAT INFORMASI KEPAB', 'sidiq.ansori', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pld'),
('199505202015122001', 'MAYNIASARI LUSI NURINGTYAS', 'PEGAWAI PADA SEKSI MANAJEMEN LAYANAN TEKNOLOGI INFORMASI DIREKTORAT IN', 'mayniasari.lusi', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pkimle'),
('199702042015122002', 'SITI RAHMA ANNIDA RACHIM', 'PEGAWAI PADA SUBBAGIAN TATA USAHA DIREKTORAT INFORMASI KEPABEANAN DAN ', 'annida.rachim', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pld'),
('199608162015121004', 'BAGAS KURNIA ADI', 'PEGAWAI PADA SEKSI EVALUASI LAYANAN TEKNOLOGI INFORMASI DIREKTORAT INF', 'bagas.kurnia', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pkimle'),
('199605222015121001', 'YUSUF EKO NUGROHO', 'PEGAWAI PADA SEKSI MANAJEMEN LAYANAN TEKNOLOGI INFORMASI DIREKTORAT IN', 'yusuf.eko', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pkimle'),
('199409242016122001', 'RESTI SEPTIANTI', 'PEGAWAI PADA SUBBAGIAN TATA USAHA DIREKTORAT INFORMASI KEPABEANAN DAN ', '', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', ''),
('199302112015021002', 'ADISURYA AULIA RAHMAN', 'PEGAWAI PADA DIREKTORAT INFORMASI KEPABEANAN DAN CUKAI', '', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', ''),
('199108142014021002', 'RICCO ADITYA MARZUKI', 'PEGAWAI PADA SEKSI ARSITEKTUR DAN ANALISIS KAPASITAS TEKNOLOGI INFORMA', 'ricco.aditya', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'spsi'),
('198503272010121002', 'RIO KRISNA', 'PEGAWAI PADA SUBBAGIAN TATA USAHA DIREKTORAT INFORMASI KEPABEANAN DAN ', '', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', ''),
('198811122015021004', 'RICKY SUMARDI NASUTION', 'PEGAWAI PADA SEKSI ANALISA DAN LAYANAN DATA DIREKTORAT INFORMASI KEPAB', 'ricky.sumardi', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pld'),
('198305102009011015', 'MUHAMMAD MUHTADI FIRDAUS', 'PEGAWAI PADA SEKSI ARSITEKTUR DAN ANALISIS KAPASITAS TEKNOLOGI INFORMA', 'muhammad.muhtadi', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'spsi'),
('199208112013101002', 'SONI', 'PEGAWAI PADA SEKSI PENGEMBANGAN SISTEM INFORMASI I DIREKTORAT INFORMAS', '', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', ''),
('198906022010011001', 'ADI RAHMAN SAPUTRA', 'PEGAWAI PADA SEKSI MANAJEMEN PROGRAM TEKNOLOGI INFORMASI DIREKTORAT IN', '', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', ''),
('198504092010121004', 'AVRIYANGGU', 'PEGAWAI PADA SEKSI PERANCANGAN SISTEM INFORMASI DIREKTORAT INFORMASI K', 'avriyanggu.s', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('198205192003121003', 'SYAIFUL BACHTIAR', 'PEGAWAI PADA SEKSI MANAJEMEN LAYANAN TEKNOLOGI INFORMASI DIREKTORAT IN', 'syaiful.bachtiar', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pkimle'),
('198505222004121001', 'WYRAHADI UTAMA', 'PEGAWAI PADA SEKSI MANAJEMEN LAYANAN TEKNOLOGI INFORMASI DIREKTORAT IN', 'wyrahadi.utama', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pkimle'),
('198907042009121001', 'YULIAN ALEXANDER', 'PEGAWAI PADA SUBBAGIAN TATA USAHA DIREKTORAT INFORMASI KEPABEANAN DAN ', '', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', ''),
('199201012014022007', 'DHEA JUNESTYA PRADIPTA', 'PEGAWAI PADA SEKSI PENGENDALIAN MUTU SISTEM INFORMASI DIREKTORAT INFOR', 'dhea.junestya', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('198702062014021004', 'DENNY FEBRIANTO', 'PEGAWAI PADA SEKSI PERENCANAAN DAN TATA KELOLA KEBIJAKAN TEKNOLOGI INF', 'denny.febrianto', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'spsi'),
('199609212015121002', 'ARIF WASKITO AJI', 'PEGAWAI PADA SEKSI MANAJEMEN LAYANAN TEKNOLOGI INFORMASI DIREKTORAT IN', 'arif.waskito', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pkimle'),
('199507112015121003', 'WAHYU KURNIAWAN', 'PEGAWAI PADA SEKSI PENGEMBANGAN SISTEM INFORMASI I DIREKTORAT INFORMAS', 'wahyu.kurniawan', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('199202282014022002', 'FARIDA INDAH RIANTINI', 'PEGAWAI PADA SEKSI MANAJEMEN KUALITAS DATA DIREKTORAT INFORMASI KEPABE', 'farida.indah', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'spsi'),
('198907282014021005', 'RAHMAD HIDAYAD', 'PEGAWAI PADA SUBBAGIAN TATA USAHA DIREKTORAT INFORMASI KEPABEANAN DAN ', '', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', ''),
('199403012015021005', 'RADITYA MAHENDRA WIRAYOGA', 'PEGAWAI PADA SUBBAGIAN TATA USAHA DIREKTORAT INFORMASI KEPABEANAN DAN ', 'raditya.mahendra', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pld'),
('199607222015121001', 'GALIH BAYUTAMA PUTRA', 'PEGAWAI PADA SEKSI PENGENDALIAN MUTU SISTEM INFORMASI DIREKTORAT INFOR', 'galih.bayutama', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('199707132018011001', 'BAGAS ADI PRABOWO', 'PEGAWAI PADA DIREKTORAT INFORMASI KEPABEANAN DAN CUKAI', 'bagas.adi', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pkimle'),
('199804162018011002', 'BAYU WISNU MURTI', 'PEGAWAI PADA DIREKTORAT INFORMASI KEPABEANAN DAN CUKAI', 'bayu.wisnu', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'spsi'),
('199804192018012002', 'ARISTIA YOSSICA PRAMONO', 'PEGAWAI PADA DIREKTORAT INFORMASI KEPABEANAN DAN CUKAI', 'aristia.yossica', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pld'),
('199710272018012001', 'TRISTHA SEVY HANGGARI', 'PEGAWAI PADA DIREKTORAT INFORMASI KEPABEANAN DAN CUKAI', 'tristha.sevy', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pld'),
('199804272018011001', 'YOSUA YEDISTA REYFERDO SARAGIH', 'PEGAWAI PADA DIREKTORAT INFORMASI KEPABEANAN DAN CUKAI', 'yosua.yedista', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pld'),
('199704172016122001', 'AMINAH YUSRI UTAMI', 'PEGAWAI PADA SEKSI MANAJEMEN LAYANAN TEKNOLOGI INFORMASI DIREKTORAT IN', 'aminah.yusri', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pkimle'),
('198612212015021001', 'DIAN PERDANA', 'PEGAWAI PADA SEKSI MANAJEMEN LAYANAN TEKNOLOGI INFORMASI DIREKTORAT IN', 'dian.perdana', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pkimle'),
('199112142015021005', 'ANDI PRASETYO', 'PEGAWAI PADA SEKSI MANAJEMEN LAYANAN TEKNOLOGI INFORMASI DIREKTORAT IN', 'andi.prasetyo', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pkimle'),
('199110122015021004', 'FENDIKA PUJI ANTARA', 'PEGAWAI PADA SEKSI MANAJEMEN LAYANAN TEKNOLOGI INFORMASI DIREKTORAT IN', 'fendika.puji', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pkimle'),
('199405142015021001', 'AH. AQIL MUYASSAR ASADDULLAH', 'PEGAWAI PADA SEKSI MANAJEMEN LAYANAN TEKNOLOGI INFORMASI DIREKTORAT IN', 'aqil.muyassar', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pkimle'),
('199202102015021004', 'FERDIAN PRAWIRA', 'PEGAWAI PADA SEKSI MANAJEMEN LAYANAN TEKNOLOGI INFORMASI DIREKTORAT IN', 'ferdian.prawira', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pkimle'),
('196807081989121001', 'JAMIN', 'PEGAWAI PADA DIREKTORAT INFORMASI KEPABEANAN DAN CUKAI', '', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', ''),
('198402012009011007', 'HERID FEBRIADI', 'PEGAWAI PADA SEKSI PERENCANAAN DAN TATA KELOLA KEBIJAKAN TEKNOLOGI INF', 'herid.febriadi', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'spsi'),
('199201212015022004', 'TRI JAYANTI LASTARI', 'PEGAWAI PADA SEKSI PENGELOLAAN BASIS DATA DIREKTORAT INFORMASI KEPABEA', 'tri.jayanti', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pld'),
('199103252014021003', 'HADI LHEENA', 'PEGAWAI PADA SEKSI ANALISA DAN LAYANAN DATA DIREKTORAT INFORMASI KEPAB', 'hadi.lheena', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pld'),
('199107072014022003', 'RENI AFINI', 'PEGAWAI PADA SEKSI PENGELOLAAN BASIS DATA DIREKTORAT INFORMASI KEPABEA', 'reni.afini', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pld'),
('199102192014021001', 'CHAMAL LUDIANTO', 'PEGAWAI PADA SEKSI PENGEMBANGAN SISTEM INFORMASI I DIREKTORAT INFORMAS', 'chamal.ludianto', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('199311262015022001', 'KRISTIANI SIRAIT', 'PEGAWAI PADA SEKSI PENGEMBANGAN SISTEM INFORMASI I DIREKTORAT INFORMAS', 'kristiani.sirait', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pld'),
('199211292015021002', 'HADI PERMANA', 'PEGAWAI PADA SEKSI PENGEMBANGAN SISTEM INFORMASI II DIREKTORAT INFORMA', 'hadi.permana', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('199203242015022003', 'FENI FAUZIAH', 'PEGAWAI PADA SEKSI PENGEMBANGAN SISTEM INFORMASI II DIREKTORAT INFORMA', 'feni.fauziah', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('199210122014021001', 'SENDI BENI SUSANDI', 'PEGAWAI PADA SEKSI PENGEMBANGAN SISTEM INFORMASI II DIREKTORAT INFORMA', 'sendi.beni', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('199208162014022003', 'SARI AGUSTIA NINGTYAS', 'PEGAWAI PADA SEKSI ANALISA DAN LAYANAN DATA DIREKTORAT INFORMASI KEPAB', 'sari.agustia', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pld'),
('199208012014022003', 'NATASYA ERENT YOLANDA', 'PEGAWAI PADA SEKSI PENGENDALIAN MUTU SISTEM INFORMASI DIREKTORAT INFOR', 'natasya.erent', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('199204032014022003', 'MOLYSA TRIAGINA', 'PEGAWAI PADA SEKSI ANALISA DAN LAYANAN DATA DIREKTORAT INFORMASI KEPAB', 'molysa.triagina', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pld'),
('199203242014021003', 'I GUSTI AGUNG NGURAH ANGGAWIJAYA', 'PEGAWAI PADA SEKSI PENGEMBANGAN SISTEM INFORMASI I DIREKTORAT INFORMAS', 'ngurah.angga', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('199104142014022005', 'HERTA APRIANI SILABAN', 'PEGAWAI PADA SEKSI ANALISA DAN LAYANAN DATA DIREKTORAT INFORMASI KEPAB', 'herta.apriani', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pld'),
('199104032014021005', 'ANDI ZULKIFLI', 'PEGAWAI PADA SEKSI PENGEMBANGAN SISTEM INFORMASI II DIREKTORAT INFORMA', 'andi.zulkifli', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('199101192014021002', 'RIZKIAWAN ACHADI', 'PEGAWAI PADA SEKSI PENGEMBANGAN SISTEM INFORMASI II DIREKTORAT INFORMA', 'rizkiawan.achadi', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('199109072015021004', 'SEVTIANDY MUHAMMAD', 'PEGAWAI PADA SEKSI PENGELOLAAN BASIS DATA DIREKTORAT INFORMASI KEPABEA', 'sevtiandy.muhammad', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pld'),
('199201172015021001', 'NURUL FAHMI', 'PEGAWAI PADA SEKSI PENGEMBANGAN SISTEM INFORMASI I DIREKTORAT INFORMAS', 'nurul.fahmi', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('199110082014021002', 'DEWA GDE ADI MURTHI UDAYANA', 'PEGAWAI PADA SEKSI PENGEMBANGAN SISTEM INFORMASI I DIREKTORAT INFORMAS', 'dewa.gde', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('199107302014022008', 'SUSILAWATI', 'PEGAWAI PADA SEKSI PENGENDALIAN MUTU SISTEM INFORMASI DIREKTORAT INFOR', 'susilawati', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('199107262014022008', 'YOLA DAFWITA CHANDRA', 'PEGAWAI PADA SEKSI PENGEMBANGAN SISTEM INFORMASI II DIREKTORAT INFORMA', 'yola.dafwita', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('199105062014021003', 'RIZKI SAPUTRA ONI', 'PEGAWAI PADA SEKSI PENGEMBANGAN SISTEM INFORMASI II DIREKTORAT INFORMA', 'rizki.saputra.001', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('199105252014021004', 'DONA HAYATUL NURMIKDAR', 'PEGAWAI PADA SEKSI PENGEMBANGAN SISTEM INFORMASI I DIREKTORAT INFORMAS', 'dona.hayatul', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('199107042014022007', 'SYEFIRA SALSIBILA', 'PEGAWAI PADA SEKSI MANAJEMEN KUALITAS DATA DIREKTORAT INFORMASI KEPABE', 'syefa.salsibila', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pld'),
('199107222014021005', 'ADHITYA WILLY WIDIATMOKO', 'PEGAWAI PADA SEKSI PENGEMBANGAN SISTEM INFORMASI II DIREKTORAT INFORMA', 'adhitya.willy', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('198307192010121003', 'FAWAZI BAHTIAR AHMAD', 'PEGAWAI PADA SEKSI PERANCANGAN SISTEM INFORMASI DIREKTORAT INFORMASI K', 'fawazi.bahtiar', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('198605192010121006', 'AMIR HAMSAH', 'PEGAWAI PADA SEKSI PERENCANAAN DAN TATA KELOLA KEBIJAKAN TEKNOLOGI INF', 'amir.hamsah', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'spsi'),
('199001182015021006', 'ARIF WIDODO', 'PEGAWAI PADA SEKSI PENGEMBANGAN SISTEM INFORMASI II DIREKTORAT INFORMA', 'arif.widodo.001', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('198808022014021002', 'ADITYA PRASETYA', 'PEGAWAI PADA SEKSI PENGENDALIAN KEAMANAN INFORMASI DAN PENGELOLAAN INF', 'aditya.prasetya', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pkimle'),
('198807182014021004', 'ADRYAN NAULI SIREGAR', 'PEGAWAI PADA SEKSI PENGEMBANGAN SISTEM INFORMASI I DIREKTORAT INFORMAS', 'adryan.nauli', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('198904182014021008', 'BIMA SURYAPRANA HARJA', 'PEGAWAI PADA SEKSI PENGEMBANGAN SISTEM INFORMASI I DIREKTORAT INFORMAS', 'bima.suryaprana', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('199107212014021002', 'I NYOMAN PRAMA PRADNYANA', 'PEGAWAI PADA SEKSI PENGEMBANGAN SISTEM INFORMASI II DIREKTORAT INFORMA', 'nyoman.prama', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('198805272014021002', 'MUHAMMAD YUSRUL HANA', 'PEGAWAI PADA SEKSI PENGEMBANGAN SISTEM INFORMASI II DIREKTORAT INFORMA', 'muhammad.yusrul', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('198604142014021005', 'HENDRO WIBOWO UTOMO', 'PEGAWAI PADA SEKSI PENGEMBANGAN SISTEM INFORMASI I DIREKTORAT INFORMAS', 'hendro.wibowo', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('197701121999031001', 'HENDRAWAN ISTANTO', 'PEGAWAI PADA SEKSI PERANCANGAN SISTEM INFORMASI DIREKTORAT INFORMASI K', 'hendrawan', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('198805052014021006', 'CAHYO PAMBUDI', 'PEGAWAI PADA SEKSI PENGEMBANGAN SISTEM INFORMASI I DIREKTORAT INFORMAS', 'cahyo.pambudi', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('198801072014022003', 'EVA MAULINA ARITONANG', 'PEGAWAI PADA SEKSI PENGENDALIAN MUTU SISTEM INFORMASI DIREKTORAT INFOR', 'eva.maulina', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('198706272014021002', 'DARTONO', 'PEGAWAI PADA SEKSI PENGEMBANGAN SISTEM INFORMASI II DIREKTORAT INFORMA', 'dartono', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('198510302010121002', 'BUDI DWI OKTIANTO', 'PEGAWAI PADA SEKSI PERANCANGAN SISTEM INFORMASI DIREKTORAT INFORMASI K', 'budi.dwi', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi'),
('198603162010121003', 'MUHAMMAD ARYA PRIASTAMA PUTRA', 'PEGAWAI PADA SEKSI EVALUASI LAYANAN TEKNOLOGI INFORMASI DIREKTORAT INF', 'muhammad.arya', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pkimle'),
('198704182010121004', 'DANU FIRMANSYAH', 'PEGAWAI PADA SEKSI PERENCANAAN DAN TATA KELOLA KEBIJAKAN TEKNOLOGI INF', 'danu.firmansyah', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'spsi'),
('198412162010121007', 'DICKI KURNIAWAN', 'PEGAWAI PADA SEKSI ANALISA DAN LAYANAN DATA DIREKTORAT INFORMASI KEPAB', 'dicki.kurniawan', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pld'),
('198610212010121004', 'NURUL BUDI UTOMO', 'PEGAWAI PADA SEKSI MANAJEMEN LAYANAN TEKNOLOGI INFORMASI DIREKTORAT IN', 'nurul.budi', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'pkimle'),
('198407032009011004', 'SEVEN JULIANUS SIREGAR', 'PEGAWAI PADA SEKSI ARSITEKTUR DAN ANALISIS KAPASITAS TEKNOLOGI INFORMA', 'seven.siregar', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'spsi'),
('198108032003122001', 'FITRIA', 'PEGAWAI PADA SEKSI PERANCANGAN SISTEM INFORMASI DIREKTORAT INFORMASI K', 'fitriasan', '', '3365cdeb71ad7146a8f0a2b65bddf136', 'e58a5e23cb26998e029ab3a734244226', 'psi');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `td_approval`
--
ALTER TABLE `td_approval`
  ADD PRIMARY KEY (`kd_approval`);

--
-- Indexes for table `td_deploy_file`
--
ALTER TABLE `td_deploy_file`
  ADD PRIMARY KEY (`kd_deploy_file`);

--
-- Indexes for table `td_permohonan`
--
ALTER TABLE `td_permohonan`
  ADD PRIMARY KEY (`kd_permohonan`);

--
-- Indexes for table `tr_aplikasi`
--
ALTER TABLE `tr_aplikasi`
  ADD PRIMARY KEY (`kd_aplikasi`);

--
-- Indexes for table `tr_history`
--
ALTER TABLE `tr_history`
  ADD PRIMARY KEY (`id_history`);

--
-- Indexes for table `tr_jns_deploy`
--
ALTER TABLE `tr_jns_deploy`
  ADD PRIMARY KEY (`kd_jns_deploy`);

--
-- Indexes for table `tr_pegawai`
--
ALTER TABLE `tr_pegawai`
  ADD PRIMARY KEY (`nip_pegawai`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `td_approval`
--
ALTER TABLE `td_approval`
  MODIFY `kd_approval` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=58;
--
-- AUTO_INCREMENT for table `td_deploy_file`
--
ALTER TABLE `td_deploy_file`
  MODIFY `kd_deploy_file` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=135;
--
-- AUTO_INCREMENT for table `td_permohonan`
--
ALTER TABLE `td_permohonan`
  MODIFY `kd_permohonan` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=167;
--
-- AUTO_INCREMENT for table `tr_history`
--
ALTER TABLE `tr_history`
  MODIFY `id_history` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=102;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
