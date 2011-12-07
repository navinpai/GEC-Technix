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

require_once(dirname(__FILE__).DS.'helper.php');

$panels_data_array = modSlidingImageLinksHelper::getPanelsDataArray($params);

require(JModuleHelper::getLayoutPath('mod_sliding_image_links'));

?>
