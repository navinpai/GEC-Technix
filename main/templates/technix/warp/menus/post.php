<?php
/**
* @package   Warp Theme Framework
* @file      post.php
* @version   5.5.9
* @author    YOOtheme http://www.yootheme.com
* @copyright Copyright  2007 - 2010 YOOtheme GmbH
* @license   YOOtheme Proprietary Use License (http://www.yootheme.com/license)
*/


/*
	Class: WarpMenuPost
		Menu base class
*/
class WarpMenuPost extends WarpMenu {
	
	/*
		Function: process

		Returns:
			Xml Object
	*/	
	function process(&$module, &$xmlobj) {
		
		$this->_process($module, $xmlobj);
		
		return $xmlobj;
	}
	
	function _process(&$module, &$xmlobj, $level=0) {
		
		for($i=0,$max=count($xmlobj->_children);$i<$max;$i++){
    	        
	            if(count($xmlobj->_children[$i]->_children)){
    	            $this->_process($module, $xmlobj->_children[$i],($level+1)); 
    	        }
                
                $attributes = $xmlobj->_children[$i]->_attributes;
                $clean      = array();
                
                foreach ($attributes as $name=>$value) {
                    if(strpos($name,"data-menu-") === false) $clean[$name] = $value;
                }
    
                $xmlobj->_children[$i]->_attributes = $clean;
	    }
	}

}