<?php

class pelanggan {
    private $id_pelanggan;
    private $nama_pelanggan;
    private $no_hp_pelanggan;
    private $alamat_pelanggan;

    function set_id_pelanggan($id_pelanggan) {
        $this->id_pelanggan = $id_pelanggan;
    }

    function set_nama_pelanggan($nama_pelanggan) {
        $this->nama_pelanggan = $nama_pelanggan;
    }

    function set_no_hp_pelanggan($no_hp_pelanggan) {
        $this->no_hp_pelanggan = $no_hp_pelanggan;
    }

    function set_alamat_pelanggan($alamat_pelanggan) {
        $this->alamat_pelanggan = $alamat_pelanggan;
    }

    function get_id_pelanggan() {
        return $this->id_pelanggan;
    }

    function get_nama_pelanggan() {
        return $this->nama_pelanggan;
    }

    function get_no_hp_pelanggan() {
        return $this->no_hp_pelanggan;
    }

    function get_alamat_pelanggan() {
        return $this->alamat_pelanggan;
    }

}