<?php
include('database.php');
class Order{
    public $id;
    public $name;
    public $totalprice;

    function __construct($d_name, $d_totalprice,$d_id=0) {
        $this->id =$d_id;
        $this->name = $d_name;
        $this->totalprice = $d_totalprice;
    }
}
class OrderRepository{

    public static function create($name, $totalprice) {
        $mysqli = ConnectionDB::getInstance();
        return $mysqli->query("INSERT INTO orders (name, totalprice) VALUES ('$name', '$totalprice')");
    }

    public static function read() {
        $response = [];
        $mysqli = ConnectionDB::getInstance();
        $result = $mysqli->query("SELECT * FROM orders");
        foreach ($result as $row){
            $response[count($response)] = new Order($row['name'], $row['totalprice'], $row['ID']);
        }
        return $response;
    }

    public static function update($id, $name, $totalprice) {
        $mysqli = ConnectionDB::getInstance();
        return $mysqli->query("UPDATE orders SET name = '$name', totalprice = '$totalprice' WHERE id = '$id'");
    }

    public static function delete($id) {
        $mysqli = ConnectionDB::getInstance();
        return $mysqli->query("DELETE FROM orders where id = '$id'");
    }
}
?>