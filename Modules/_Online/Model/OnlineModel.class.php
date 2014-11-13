<?php
class OnlineModel extends BaseModel{

	protected $_auto = array (
	    array('create_time','time',1,'function'),
	    array("update_time","time",3,"function"),
	);

}
