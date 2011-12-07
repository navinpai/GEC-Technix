<?php
/**
* @package      Sliding Image Links
* @copyright    Copyright (C) 2009 FalsinSoft. All rights reserved.
* @license      GNU/GPL
* @website      http://www.falsinsoft.co.nr
* @email        falsinsoft@gmail.com
* 
*/

defined('_JEXEC') or die('Restricted access');

class modSlidingImageLinksHelper
{
    function getPanelsDataArray($params)
    {
		$panels_data_array = array();
		
		for($i = 0; $i < 8; $i++)
		{
			$image_path = trim($params->get('panel_image_path'.($i+1)));
			$url 		= trim($params->get('panel_url'.($i+1)));
			
			if($image_path != '' && $url != '') 
			{
				$panels_data_array[$i]['image_path'] = $image_path;
				$panels_data_array[$i]['url'] 		 = $url;
			}
		}

		return $panels_data_array;
    }    
}

?>

