<?php
/**
* @version      $Id: slidingimagelinks.php
* @package      Sliding Image Links
* @copyright    Copyright (C) 2010 FalsinSoft. All rights reserved.
* @license      GNU/GPL
* @website      http://www.falsinsoft.co.nr
* @email        falsinsoft@gmail.com
* 
*/
defined( '_JEXEC' ) or die( 'Restricted access' );

jimport( 'joomla.plugin.plugin' );
 
class plgContentSlidingImageLinks extends JPlugin
{
	function plgContentSlidingImageLinks(&$subject, $params)
	{
		parent::__construct($subject, $params);
	}

	function onPrepareContent(&$article, &$params, $limitstart)
	{
		$document =& JFactory::getDocument();
		$control_html ='';
		
		if(JString::strpos($article->text, 'slidingimagelinks') === false) return true;
				
		if(preg_match('/({slidingimagelinks.*?}.*?{\/slidingimagelinks})/s', $article->text, $tag_control) == 0) return true;
				
		preg_match('/{slidingimagelinks.*?}/', $tag_control[0], $plg_params);
		$params_line = trim(substr($plg_params[0], 18, strlen($plg_params[0])-19));
		preg_match_all('/(.*?)="(.*?)"/', $params_line, $plg_params);
	
		$params_control = array(
			'height' => 100,
			'openwidth' => 310,
			'closewidth' => 100
		);
	
		for($n = count($plg_params[1]), $p = 0; $p < $n; $p++)
		{
			$param_name  = trim($plg_params[1][$p]);
			$param_value = trim($plg_params[2][$p]);
			
			if($param_name == 'height' 
			|| $param_name == 'openwidth'
			|| $param_name == 'closewidth')
			{
				$params_control[$param_name] = $param_value;
			}
		}
		
		preg_match_all('/({imagelink.*?})/s', $tag_control[0], $image_links);
		
		for($n = count($image_links[0]), $i = 0; $i < $n; $i++)
		{
			$params_line = trim(substr($image_links[0][$i], 10, strlen($image_links[0][$i])-11));
			preg_match_all('/(.*?)="(.*?)"/', $params_line, $plg_params);
			
			for($p = 0; $p < count($plg_params[1]); $p++)
			{
				$param_name  = trim($plg_params[1][$p]);
				$param_value = trim($plg_params[2][$p]);
				
				$params_link[$i][$param_name] = $param_value;
			}			
		}
		
		$links_number = count($params_link);
		
		if($links_number > 0)
		{
			$document->addScript(JURI::root(true).'/plugins/content/slidingimagelinks/ImageMenu.js');
			$document->addStyleSheet(JURI::root(true).'/plugins/content/slidingimagelinks/ImageMenu.css');
			$document->addScriptDeclaration('window.addEvent("domready", function(){var plgMenu = new ImageMenu($$("#imageMenu a"),{openWidth:'.$params_control['openwidth'].', border:2});});');
			
			$control_html .= '<style type="text/css">';
			for($i = 0; $i < $links_number; $i++)
			{
				if(isset($params_link[$i]['name']) && isset($params_link[$i]['image']))
				{
					$control_html .= '#imageMenu ul li.'.$params_link[$i]['name'].' a { background: url('.JURI::root().$params_link[$i]['image'].') repeat scroll 0%; ';
					if(($i+1) == $links_number) $control_html .= 'width:'.$params_control['closewidth'].'px; ';
					$control_html .= '} ';
				}
			}			
			$control_html .= '#imageMenu ul { height:'.$params_control['height'].'px; } ';
			$control_html .= '#imageMenu ul li a { height:'.$params_control['height'].'px; width:'.$params_control['closewidth'].'px; } ';
			$control_html .= '</style>';
			
			$control_html .= '<div id="imageMenu" style="width:'.(($params_control['closewidth']*$links_number)+$links_number).'px; height:'.$params_control['height'].'px;"><ul>';
			for($i = 0; $i < $links_number; $i++)
			{
				if(isset($params_link[$i]['name']) && isset($params_link[$i]['link']))
				{
					$control_html .= '<li class="'.$params_link[$i]['name'].'"><a href="'.$params_link[$i]['link'].'">'.$params_link[$i]['name'].'</a></li>';
				}
			}
			$control_html .= '</ul></div>';
		}

		$article->text = str_replace($tag_control[0], $control_html, $article->text);

		return true;	
	}	
}