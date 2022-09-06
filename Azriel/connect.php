<?php
$servername = "localhost";
$database = "perpustakaan";
$username = "root";
$password = '';

$conn = mysqli_connect($servername, $username, $password, $database);

if (!$conn) {
    die("connection failed:" . mysqli_connect_error());
}

// echo "BERHASIL";
// mysqli_close($conn);

$sql = "SELECT * FROM buku ORDER BY `id_penerbit` ASC";
$sql = "SELECT * FROM buku";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        echo "buku : ", $row["isbn"], "", $row["judul"], "<br>";
    }
}
