<?php
/**
* @package   yoo_bloc Template
* @file      default.php
* @version   5.5.7 November 2010
* @author    YOOtheme http://www.yootheme.com
* @copyright Copyright (C) 2007 - 2010 YOOtheme GmbH
* @license   YOOtheme Proprietary Use License (http://www.yootheme.com/license)
*/

// no direct access
defined('_JEXEC') or die('Restricted access');
?>
<span class="breadcrumbs">
<?php for ($i = 0; $i < $count; $i ++) :

	// clean subtitle from breadcrumb
	if ($pos = strpos($list[$i]->name, '||')) {
		$name = trim(substr($list[$i]->name, 0, $pos));
	} else {
		$name = $list[$i]->name;
	}
	
	// if not the last item in the breadcrumbs add the separator
	if ($i < $count -1) {
		if(!empty($list[$i]->link)) {
			echo '<a href="'.$list[$i]->link.'" class="box-1"><span class="box-2"><span class="box-3">'.$name.'</span></span></a>';
		} else {
			echo '<span class="separator box-1"><span class="box-2"><span class="box-3">'.$name.'</span></span></span>';
		}
		//echo ' '.$separator.' ';
	} else { // when $i == $count -1
	    echo '<span class="current box-1"><span class="box-2"><span class="box-3">'.$name.'</span></span></span>';
	}	
endfor; ?>
</span>