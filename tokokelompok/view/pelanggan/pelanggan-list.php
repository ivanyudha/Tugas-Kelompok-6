<?php
require_once "controller/pelanggan_controller.php";
$pelangganController = new pelangganController();
$pelangganController->callasset();
$pelanggan_list = $pelangganController->pelanggan_list();
?>
<html>

<head>
</head>
<div class="clm-12 np">
  <div class="container-full" id="daftarproduk">
    <h1>List pelanggan</h1>
    <input type="hidden" id="totalcheck" value="0" />
    <table class="table table-bordered" style="margin-top:10px">
      <?php if ($pelanggan_list != null) : ?>
        <thead>
          <th>No</th>
          <th>Nama pelanggan</th>
          <th>No HP</th>
          <th>Alamat</th>
          <th></th>
        </thead>

        <?php $no = 1;
        foreach ($pelanggan_list as  $pelanggan) : ?>
          <tr>
            <td><?php echo $no;
                $no++ ?></td>
            <td style="width:200px"><?php echo $pelanggan['nama_pelanggan'] ?></td>
            <td><?php echo $pelanggan['no_hp_pelanggan'] ?></td>
            <td><?php echo $pelanggan['alamat_pelanggan'] ?></td>
            <td class="text-center">
              <a href="submit.php?pelanggan-edit=<?php echo $pelanggan['id_pelanggan'] ?>"><button class="btn btn-warning">Edit</button></a>
              <a href="submit.php?pelanggan-delete=<?php echo $pelanggan['id_pelanggan'] ?>"><button class="btn btn-danger">Hapus</button></a>
            </td>
          </tr>
        <?php endforeach ?>
      <?php else : ?>
        <tr>
          <td colspan="7" style="text-align:center">Tidak Ada Data.</td>
        </tr>
      <?php endif ?>
    </table>
  </div>
</div>
<div class="fly-right">
  <a href="?page=pelanggan&&subpage=pelanggan-detail">
    <img src="assets/img/add_blue.png" class="flyitem" style="width:65px; height:65px;">
  </a>
</div>
</html>