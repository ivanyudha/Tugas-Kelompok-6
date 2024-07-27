SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- Drop tables if they exist in reverse order of dependencies
DROP TABLE IF EXISTS `penjualan`;
DROP TABLE IF EXISTS `pembelian`;
DROP TABLE IF EXISTS `barang`;
DROP TABLE IF EXISTS `supplier`;
DROP TABLE IF EXISTS `pelanggan`;
DROP TABLE IF EXISTS `pengguna`;
DROP TABLE IF EXISTS `hak_akses`;

-- Create tables
CREATE TABLE `hak_akses` (
  `id_akses` int NOT NULL AUTO_INCREMENT,
  `nama_akses` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id_akses`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE `pengguna` (
  `id_pengguna` INT NOT NULL AUTO_INCREMENT,
  `nama_pengguna` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_akses` INT NULL DEFAULT NULL,
  `nama_depan` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nama_belakang` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `no_hp` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `alamat` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id_pengguna`) USING BTREE,
  INDEX `id_akses` (`id_akses` ASC) USING BTREE,
  CONSTRAINT `pengguna_ibfk_1` FOREIGN KEY (`id_akses`) REFERENCES `hak_akses` (`id_akses`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 CHARACTER SET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=Dynamic;

CREATE TABLE `pelanggan` (
  `id_pelanggan` int NOT NULL AUTO_INCREMENT,
  `nama_pelanggan` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `alamat_pelanggan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `no_hp_pelanggan` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_pelanggan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE `supplier` (
  `id_supplier` int NOT NULL AUTO_INCREMENT,
  `nama_supplier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `alamat_supplier` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `no_hp_supplier` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_supplier`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE `barang` (
  `id_barang` int NOT NULL AUTO_INCREMENT,
  `nama_barang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `satuan` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `stok`int NULL DEFAULT NULL,
  `id_pengguna` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_barang`) USING BTREE,
  INDEX `id_pengguna` (`id_pengguna` ASC) USING BTREE,
  CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`id_pengguna`) REFERENCES `pengguna` (`id_pengguna`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE `pembelian` (
  `id_pembelian` int NOT NULL AUTO_INCREMENT,
  `jumlah_pembelian` int NULL DEFAULT NULL,
  `harga_beli` double NULL DEFAULT NULL,
  `id_barang` int NULL DEFAULT NULL,
  `id_supplier` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_pembelian`) USING BTREE,
  INDEX `id_barang` (`id_barang` ASC) USING BTREE,
  INDEX `id_supplier` (`id_supplier` ASC) USING BTREE,
  CONSTRAINT `pembelian_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pembelian_ibfk_2` FOREIGN KEY (`id_supplier`) REFERENCES `supplier` (`id_supplier`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE `penjualan` (
  `id_penjualan` int NOT NULL AUTO_INCREMENT,
  `jumlah_penjualan` int NULL DEFAULT NULL,
  `harga_jual` double NULL DEFAULT NULL,
  `id_barang` int NULL DEFAULT NULL,
  `id_pelanggan` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_penjualan`) USING BTREE,
  INDEX `id_barang` (`id_barang` ASC) USING BTREE,
  INDEX `id_pelanggan` (`id_pelanggan` ASC) USING BTREE,
  CONSTRAINT `penjualan_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `penjualan_ibfk_2` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- Insert records
INSERT INTO `pelanggan` VALUES (2, 'Aftha', 'Sriwijaya', '087238123891');
INSERT INTO `pelanggan` VALUES (3, 'Malvin', 'Jl. jaya', '087282381892');

INSERT INTO `hak_akses` VALUES (1, 'Super Admin', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus nec mi tellus. Aliquam erat volutpat. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.');
INSERT INTO `hak_akses` VALUES (2, 'General Manager', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus nec mi tellus. Aliquam erat volutpat. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.');
INSERT INTO `hak_akses` VALUES (3, 'Supervisor', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus nec mi tellus. Aliquam erat volutpat. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.');
INSERT INTO `hak_akses` VALUES (4, 'Account Officer', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus nec mi tellus. Aliquam erat volutpat. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.');
INSERT INTO `hak_akses` VALUES (5, 'Head Store', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus nec mi tellus. Aliquam erat volutpat. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.');
INSERT INTO `hak_akses` VALUES (6, 'Staff', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus nec mi tellus. Aliquam erat volutpat. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.');

INSERT INTO `pengguna` (`id_pengguna`, `nama_pengguna`, `password`, `id_akses`, `nama_depan`, `nama_belakang`, `no_hp`, `alamat`) VALUES
(1, 'Admin', 'Admin', 1, 'Indra', 'Yana', '081238123123', 'Jl Test'),
(2, 'Moniska', 'P@sswod13', 2, 'Moniska', 'Azahra', '0819288321', 'Jl.Mars no.14');

INSERT INTO `supplier` VALUES (5, 'Gugun Darmawan', 'Bandung', '082231289123');
INSERT INTO `supplier` VALUES (6, 'Dewi Prunama', 'Jakarta', '082231123123');

SET FOREIGN_KEY_CHECKS = 1;
