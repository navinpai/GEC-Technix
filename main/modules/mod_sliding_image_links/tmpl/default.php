<?php
/**
* @package      Sliding Image Links
* @copyright    Copyright (C) 2010 FalsinSoft. All rights reserved.
* @license      GNU/GPL2
* @website      http://www.falsinsoft.co.nr
* @email        falsinsoft@gmail.com
* 
*/

defined('_JEXEC') or die('Restricted access'); 

?>

<style type="text/css">
#imageMenu<?php echo $module->id; ?> {
	position: relative;
	overflow: hidden;
	margin: 0 auto;
}

#imageMenu<?php echo $module->id; ?> ul {
	list-style: none;
	margin: 0px;
	display: block;
	width: 1000px;
}

#imageMenu<?php echo $module->id; ?> ul li {
	float: left;
	margin: 0px;
}

#imageMenu<?php echo $module->id; ?> ul li a {
	text-indent: -1000px;
	background:#FFFFFF none repeat scroll 0%;
	border-right: 2px solid #fff;
	cursor:pointer;
	display:block;
	overflow:hidden;
}
</style>

<?php

$panels_number = count($panels_data_array);

if($panels_number > 0)
{
	$document = &JFactory::getDocument();

	$document->addScript(JURI::root(true).'/modules/mod_sliding_image_links/imagemenu/ImageMenu.js');
	$document->addScriptDeclaration('window.addEvent("domready", function(){var modMenu'.$module->id.' = new ImageMenu($$("#imageMenu'.$module->id.' a"),{openWidth:'.$params->get('open_width', 300).', border:2});});');

	echo '<style type="text/css">';
	for($i = 0; $i < $panels_number; $i++)
	{
		echo '#imageMenu'.$module->id.' ul li.Panel'.($i+1).' a { background: url('.JURI::root().$panels_data_array[$i]['image_path'].') repeat scroll 0%; ';
		if(($i+1) == $panels_number) echo 'width:'.$params->get('close_width', 100).'px; ';
		echo '} ';
	}			
	echo '#imageMenu'.$module->id.' ul { height:'.$params->get('height', 100).'px; } ';
	echo '#imageMenu'.$module->id.' ul li a { height:'.$params->get('height', 100).'px; width:'.$params->get('close_width', 100).'px; } ';
	echo '</style>';
	
	echo '<div id="imageMenu'.$module->id.'" style="width:'.(($params->get('close_width', 100)*$panels_number)+$params->get('close_width', 100)).'px; height:'.$params->get('height', 100).'px;"><ul>';
	for($i = 0; $i < $panels_number; $i++)
	{
		echo '<li class="Panel'.($i+1).'"><a href="'.$panels_data_array[$i]['url'].'"></a>Panel'.($i+1).'</li>';
	}
	echo '</ul></div>';
}

?>


