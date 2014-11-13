<?php
class ProductModel extends _ContentModel{
    public function find($options=array()) {
        $data = parent :: find($options);
        isset($data["img"]) && $data["newimg"] = json_decode($data["img"],true);
        return $this->data=$data;
     }
}
