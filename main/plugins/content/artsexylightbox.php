<?php
/**
* @module		Art Sexy Lightbox
* @copyright	Copyright (C) 2009 artetics.com
* @license		GPL
*/

defined("_JEXEC") or die("Restricted access");

jimport("joomla.plugin.plugin");
error_reporting(E_ERROR);
require_once(JPATH_SITE . DS . 'plugins' . DS . 'content' . DS . 'artsexylightbox' . DS . 'library' . DS . 'json.php');
require_once(JPATH_SITE . DS . 'plugins' . DS . 'content' . DS . 'artsexylightbox' . DS . 'library' . DS . 'asido' . DS . 'class.asido.php');


class plgContentartsexylightbox extends JPlugin {
	function plgContentartsexylightbox(&$subject, $params) {
		parent::__construct($subject, $params);
	}

	function onPrepareContent(&$article, &$params, $limitstart) {
		$regexp = '/\{artsexylightbox((\s+[a-z\_0-9]+=(?:"[^"]*"|&quot;.*?&quot;|[^\s}]*))*\s*)\}(?:(.*?){\/artsexylightbox\})?/si';
		if($params && $params->get("enabled","1") == "0") {
			$article->text = preg_replace($regex, "", $article->text);
		} else {
			$artParams = array("path" => "",
					   "name" => "SLB",
					   "zIndex" => 65555,
					   "color" => "black",
					   "find" => "sexylightbox",
					   "imagesdir" => JURI::BASE() . "plugins/content/artsexylightbox/images",
					   "background" => "bgSexy.png",
					   "backgroundIE" => "bgSexy.gif",
					   "closeButton" => "SexyClose.png",
					   "displayed" => 0,
					   "modal" => 0,
					   "showDuration" => 200,
					   "showEffect" => "linear",
					   "closeDuration" => 400,
					   "closeEffect" => "linear",
					   "moveDuration" => 800,
					   "resizeDuration" => 800,
					   "moveEffect" => "easeOutBack",
					   "resizeEffect" => "easeOutBack",
					   "noConflict" => false,
					   "previewWidth" => "",
					   "previewHeight" => "");
			
			$pluginParams = plgContentartsexylightbox::getPluginParams($artParams);
			
			if (preg_match_all($regexp, $article->text, $matches, PREG_SET_ORDER) > 0) {
				plgContentartsexylightbox::loadExtensions();
				plgContentartsexylightbox::addResources();
				$i = 0;
				$matchesCount = count($matches);
				foreach ($matches as $match) {
					$adjustedMatch = plgContentartsexylightbox::adjustMatch($match[1]);
					$adjustedMatch = parse_str($adjustedMatch, $clientParams);
					$finalParams = plgContentartsexylightbox::getClientParams($clientParams, $pluginParams);
					$article->text = preg_replace($regexp, plgContentartsexylightbox::getSexyLightboxCode($i, $finalParams, $match[3]), $article->text, 1);
					$i++;
					$finalParams = $pluginParams;
	        	}
			}
		}
	}
	
	function adjustMatch($text) {
		$adjustedMatch = ltrim($text);
		$adjustedMatch = rtrim($adjustedMatch);
		$adjustedMatch = str_replace('&', '|||', $adjustedMatch);
		$adjustedMatch = str_replace(' =', '=', $adjustedMatch);
		$adjustedMatch = str_replace('= ', '=', $adjustedMatch);
		$adjustedMatch = str_replace('="', '=', $adjustedMatch);
		$adjustedMatch = str_replace('= ', '=', $adjustedMatch);
		$adjustedMatch = str_replace('" ', '"', $adjustedMatch);
		$adjustedMatch = str_replace(' "', '"', $adjustedMatch);
		$adjustedMatch = str_replace('"', '&', $adjustedMatch);
		$adjustedMatch = str_replace(' ', '+', $adjustedMatch);
		$adjustedMatch = rtrim($adjustedMatch, '&');
		return $adjustedMatch;
	}
	
	function getSexyLightboxCode($id, $finalParams, $content = '') {
		$path = $finalParams['path'];
		$theme = $finalParams['theme'];
		$previewWidth = $finalParams['previewWidth'];
		$previewHeight = $finalParams['previewHeight'];
		$noConflict = $finalParams['noConflict'];
		$flickr = $finalParams['flickr'];
		$thumbnailPath = $finalParams['thumbnailPath'];
		$singleImage = $finalParams['singleImage'];
		$singleText = $finalParams['singleText'];
		$thumbnailPreviewCount = $finalParams['thumbnailPreviewCount'];
		$popup = $finalParams['popup'];
		$autoGenerateThumbs = $finalParams['autoGenerateThumbs'];
		$flickrNumberOfImages = $finalParams['flickrNumberOfImages'];
		$numberOfImages = $finalParams['numberOfImages'];
		$sort = $finalParams['sort'];
		if (!$flickrNumberOfImages) $flickrNumberOfImages = 20;
		
		$imagesCode = '';
		$jsCode = '<script type="text/javascript" charset="utf-8">';
		if ($noConflict) {
			$document = &JFactory::getDocument();
			$document->addCustomTag('<script type="text/javascript" charset="utf-8">jQuery.noConflict();</script>');
		}
		$jsonHandler = new ART_Services_JSON(SERVICES_JSON_LOOSE_TYPE);
		$dFP = !empty($finalParams) ? $jsonHandler->encode($finalParams) : '';
		if ($path) {
			if ($thumbnailPath) {
				$thumbs = array();
				$thumb_directory_stream = @ opendir (JPATH_SITE.DS . $thumbnailPath . DS);
				if ($thumb_directory_stream) {
					while ($entry = readdir ($thumb_directory_stream)) {
						if ($entry != '.' && $entry != '..' && plgContentartsexylightbox::isImage($thumbnailPath . $entry)) {
							$thumbs[$entry] = $entry;
						}
					}
				}
			}
			$file_handle = @fopen(JPATH_SITE.DS . $path . DS . "artsexylightbox.txt", "rb");
			$descriptionArray = array();
			if ($file_handle) {
				while (!feof($file_handle) ) {
					$line_of_text = fgets($file_handle);
					$parts = explode('=', $line_of_text);
					$descriptionArray[$parts[0]] = $parts[1];
				}
				fclose($file_handle);
			}
			
			$id = uniqid('artgallery_', false);
			$jsCode .= 'if (!window.sexylightboxEnabled) {jQuery(document).ready(function(){SexyLightbox.initialize(' . $dFP . ')});} if (!window.sexylightboxEnabled) {window.sexylightboxEnabled = true;}</script>';
			$directory_stream = @ opendir (JPATH_SITE.DS . $path . DS) or die ("Could not open a directory stream for <i>" . JPATH_SITE . DS . $path . DS . "</i>");
			$filelist = array();
			while ($entry = readdir ($directory_stream)) {
				if ($entry != '.' && $entry != '..' && plgContentartsexylightbox::isImage($path . $entry)) {
					$filelist[] = $entry;
				}
			}
			if ($sort == 'desc') {
				usort ($filelist, 'artSLFileDescSort');
			} else {
				usort ($filelist, 'artSLFileAscSort');
			}
		    if ($thumbnailPreviewCount && ($thumbnailPreviewCount > count($filelist))) {
		      $thumbnailPreviewCount = count($filelist);
		    }
			if ($singleImage) {
				$imagesCode .= "<a onclick='jQuery(\"a[rel*=" . $id . "]\").eq(0).click();return false;'><img class='artsexylightbox_singleimage' src='" . JURI::root() . $singleImage . "'";
				if ($previewHeight) {
					$imagesCode .= " height='$previewHeight'";
				}
				if ($previewWidth) {
					$imagesCode .= " width='$previewWidth' ";
				}
				$imagesCode .= " /></a>";
			} else if ($singleText) {
				$imagesCode .= "<a onclick='jQuery(\"a[rel*=" . $id . "]\").eq(0).click();return false;'><span class='artsexylightbox_singletext'>" . $singleText . "</span></a>";
			} else if ($thumbnailPreviewCount && $thumbnailPreviewCount > 0) {
				$thumbsCount = 0;
				while ((list ($key, $entry) = each ($filelist)) && ($thumbsCount < $thumbnailPreviewCount)) {
					if ($entry != '.' && $entry != '..' && plgContentartsexylightbox::isImage($path . $entry)) {
						$imagePath = JPATH_SITE . DS . $path . DS . $entry;
						if ($thumbs && isset($thumbs[$entry])) {
							$imagesCode .= "<a onclick='jQuery(\"a[rel*=" . $id . "]\").eq(0).click();return false;'><img class='artsexylightbox_singleimage' src='" . JURI::root() . $thumbnailPath . '/' . $entry . "'";
						} else {
							$imagesCode .= "<a onclick='jQuery(\"a[rel*=" . $id . "]\").eq(0).click();return false;'><img class='artsexylightbox_singleimage' src='" . JURI::root() . $path . '/' . $entry . "'";
						}
						if ($previewHeight) {
							$imagesCode .= " height='$previewHeight'";
						}
						if ($previewWidth) {
							$imagesCode .= " width='$previewWidth' ";
						}
						$imagesCode .= " /></a>";
						$thumbsCount++;
					}
				}
			}
			reset ($filelist);
			$imagesCount = 0; 
			while ((list ($key, $entry) = each ($filelist)) && ($numberOfImages > 0 ? ($imagesCount < $numberOfImages) : 1==1)) {
				if ($entry != '.' && $entry != '..' && plgContentartsexylightbox::isImage($path . $entry)) {
					$title = '';
					if (isset($descriptionArray[$entry])) {
						$title = $descriptionArray[$entry];
					}
					$imagesCode .= "<a href='" . JURI::root() . "$path/$entry' rel='sexylightbox[" . $id . "]' class='artsexylightboxpreview' ";
					if ($title) {
						$imagesCode .= " title='" . $title . "'";
					}
					$imagesCode .= "><img class='artsexylightbox' ";
					if ($singleImage || $thumbnailPreviewCount || $singleText) {
						$imagesCode .= " style='display:none;'";
					}
					$imagesCode .= " src='"; 
					$imagePath = JPATH_SITE . DS . $path . DS . $entry;
					if ($thumbs && isset($thumbs[$entry])) {
						$imagesCode .= JURI::root() . "$thumbnailPath/$entry' ";
					} else if (@is_readable($imagePath) && ($previewWidth > 0 || $previewHeight > 0) && isset($autoGenerateThumbs) && $autoGenerateThumbs != 'false') {
						if (!plgContentartsexylightbox::isExtensionsLoaded()) {
							plgContentartsexylightbox::loadExtensions();
						}
						if (!plgContentartsexylightbox::isExtensionsLoaded()) {
							$imagesCode .= JURI::root() . "$path/$entry' ";
						} else {
							$imagePathInfo = pathinfo($imagePath);
							$generatedThumbName = sprintf('%s_%s_%s.%s',
								md5('artsexythumb_' . $imagePath),
								$previewWidth,
								$previewHeight,
								$imagePathInfo['extension']);
							if (!file_exists(JPATH_SITE . DS . 'images' . DS . 'artsexylightbox_tmp')) {
								mkdir (JPATH_SITE . DS . 'images' . DS . 'artsexylightbox_tmp');
							}
							$thumbPath = JPATH_SITE . DS . 'images' . DS . 'artsexylightbox_tmp' . DS . $generatedThumbName;
							
							if (!@file_exists($thumbPath)) {
								$img = asido::image($imagePath, $thumbPath);
								
								if (!$previewWidth) {
									Asido::height($img, $previewHeight);
								} else if (!$previewHeight) {
									Asido::width($img, $previewWidth);
								} else {
									Asido::resize($img, $previewWidth, $previewHeight, ASIDO_RESIZE_STRETCH);
								}
								$img->save(ASIDO_OVERWRITE_ENABLED);
							}
							$imagesCode .= JURI::root() . "images/artsexylightbox_tmp/$generatedThumbName' ";
						}
					} else {
						$imagesCode .= JURI::root() . "$path/$entry' ";
					}
					if ($previewHeight) {
						$imagesCode .= " height='$previewHeight' ";
					}
					if ($previewWidth) {
						$imagesCode .= "width='$previewWidth' ";
					}
					$imagesCode .= "/></a>";
				}
				$imagesCount++;
			}
			if (isset($popup) && $popup == 'false') {
				return $imagesCode;
			}
			return $imagesCode.$jsCode;
		} else if ($flickr) {
			$flickrApiKey = $finalParams['flickrApiKey'];
			$flickrSet = $finalParams['flickrSet'];
			
			$flickrThumbSize = $finalParams['flickrThumbSize'];
			if (!isset ($flickrThumbSize)) {	
				$flickrThumbSize = "s";
			}
			
			$flickrImageSize = $finalParams['flickrImageSize'];
			if (!isset ($flickrImageSize)) {	
				$flickrImageSize = "m";
			}
			
			$id = uniqid('artgallery_', false);
			if (isset($flickrApiKey) && isset($flickrSet)) {
				$imagesCode .= "<div id='$id' class='artflickrgallery'></div>";
				$jsCode .= 'jQuery(document).ready(function(){jQuery("#' . $id . '").flickr({find: "' . $id . '", thumb_size:"' . $flickrThumbSize . '",size:"' . $flickrImageSize . '",per_page:' . $flickrNumberOfImages . ',api_key:"' . $flickrApiKey . '",photoset_id:"' . $flickrSet . '", user_id: "' . $flickr . '", type: "photoset",
				callback: function(el) {SexyLightbox.initialize(' . $dFP . ')}
				})})</script>';				
			} else {
				$flickrLargeImages = $finalParams['flickrLargeImages'];
				$flickrSmallThumbs = $finalParams['flickrSmallThumbs'];
				
				$jsCode .= 'if (!window.sexylightboxEnabled) {jQuery(document).ready(function(){SexyLightbox.initialize(' . $dFP . ')});} if (!window.sexylightboxEnabled) {window.sexylightboxEnabled = true;}</script>';
				if (strstr($flickr, ',')) {
					$ids = explode(',', $flickr);
				} else {
					$id = $flickr;
				}
				if ($id) {
					$url = 'http://api.flickr.com/services/feeds/photos_public.gne?format=php_serial&id=' . $id;
				} else {
					$url = 'http://api.flickr.com/services/feeds/photos_public.gne?format=php_serial&ids=' . $ids;
				}
				if ($fp = fopen($url, 'r')) {
				   $content = '';
				   while ($line = fread($fp, 1024)) {
					  $content .= $line;
				   }
				   $rsp_obj = unserialize($content);
				   
				   $i = 1;
				   foreach ($rsp_obj['items'] as $image) {
						if ($i > $flickrNumberOfImages) {
							break;
						}
						$title = $image['title'];
						$largeImagePath = $image['m_url'];
						$smallThumbPath = $image['m_url'];
						if ($flickrLargeImages) {
							$largeImagePath = $image['l_url'];
						}
						if ($flickrSmallThumbs) {
							$smallThumbPath = $image['t_url'];
						}
						
						$imagesCode .= "<a href='" . $largeImagePath . "' rel='sexylightbox[" . $id . "]' class='artsexylightboxpreview' ";
						if ($title) {
							$imagesCode .= "title='" . $title . "'";
						}
						$imagesCode .= "><img class='artsexylightbox' src='" . $smallThumbPath . "'";
						if ($previewHeight) {
							$imagesCode .= " height='$previewHeight' ";
						}
						if ($previewWidth) {
							$imagesCode .= "width='$previewWidth' ";
						}
						$imagesCode .= "/></a>";
						$i++;
					}	   
				}
			}
			if (isset($popup) && $popup == 'false') {
				return $imagesCode;
			}
			return $imagesCode.$jsCode;
		} else if (isset($content) && !empty($content)) {
			$theme = $finalParams['theme'];
			$width = $finalParams['width'];
			$height = $finalParams['height'];
			$background = $finalParams['background'];
			$modal = $finalParams['modal'];
			$text = $finalParams['text'];
			$title = $finalParams['title'];
			$hideContent = $finalParams['hideContent'];
			$id = uniqid('artinline_', false);
			$url = "#TB_inline?inlineId=$id";
			if (!$height) $height = "100";
			if (!$width) $width = "300";
			if (isset($height) && !empty($height)) $url .= "&height=$height";
			if (isset($width) && !empty($width)) $url .= "&width=$width";
			if (isset($modal) && !empty($modal)) $url .= "&modal=$modal";
			$inlineCode = "<span id='$id'>$content</span><a href='$url' rel='sexylightbox' title='$title'>$text</a>";
			$jsCode .= 'jQuery(document).ready(function(){SexyLightbox.initialize(' . $dFP . ');';
			if ($hideContent) {
				$jsCode .= 'document.getElementById("' . $id . '").style.display = "none";';
			}
			$jsCode .= '}); if (!window.sexylightboxEnabled) {window.sexylightboxEnabled = true;}</script>';
			return $jsCode.$inlineCode;
		} else {
			$jsCode .= 'if (!window.sexylightboxEnabled) {jQuery(document).ready(function(){SexyLightbox.initialize(' . $dFP . ')});} if (!window.sexylightboxEnabled) {window.sexylightboxEnabled = true;}</script>';
			return $jsCode;
		}
	}
	
	function addResources() {
		$document = &JFactory::getDocument();
		$document->addScript( JURI::root() . 'plugins/content/artsexylightbox/js/jquery.js' );
		$document->addScript( JURI::root() . 'plugins/content/artsexylightbox/js/jquery.easing.1.3.js' );
		$document->addScript( JURI::root() . 'plugins/content/artsexylightbox/js/sexylightbox.v2.2.jquery.min.js' );
		$document->addScript( JURI::root() . 'plugins/content/artsexylightbox/js/jquery.flickr.js' );
		$document->addStyleSheet( JURI::root() . 'plugins/content/artsexylightbox/css/sexylightbox.css' );
	}

	function getPluginParams($params) {
		$pluginParams = $params;
		if (!empty ($params)) {
			foreach($params as $key => $value) {
				$pValue = $params[$key];
				if (isset ($pValue) && !empty($pValue)) {
					$pluginParams[$key] = $params[$key];
				}
			}
		}
		return $pluginParams;
	}
	
	function getClientParams($params, $finalParams) {
		foreach($params as $key => $value) {
			if(@$params[$key]) $finalParams[$key] = htmlspecialchars($params[$key], ENT_QUOTES);
		}
		return $finalParams;
	}
	
	function clearParams($params) {
		foreach($params as $key => $value) {
			$params[$key] = '';
		}
		return $params;
	}
	
	function isImage($fileName) {
		$extensions = array('.jpeg', '.jpg', '.gif', '.png', '.bmp', '.tiff', '.tif', '.ico', '.rle', '.dib', '.pct', '.pict');
		$extension = substr($fileName, strrpos($fileName,"."));
		if (in_array(strtolower($extension), $extensions)) return true;
		return false;
	}
	
	function isExtensionsLoaded($drivers = array('imagick', 'gd', 'magickwand')) {
		reset($drivers);

		foreach ($drivers as $driver) {
			if ($driver == 'imagick' && !function_exists('imagick_readImage')) continue;
			
			if (@extension_loaded($driver)) {
				return true;
			}
		}
		
		return false;
	}
	
	function loadExtensions($drivers = array('imagick', 'gd', 'magickwand')) {
		$driverAliases = array('imagick' => 'imagick_ext', 'magickwand' => 'magick_wand');
		
		reset($drivers);

		foreach ($drivers as $driver) {
			if (@extension_loaded($driver)) {
				if ($driver == 'imagick' && !function_exists('imagick_readImage')) continue ;
				
				if (array_key_exists($driver, $driverAliases)) $driver = $driverAliases[$driver];
				asido::driver($driver);
				return true;
			}
		}

		return false;
	}

}

function artSLFileAscSort($a, $b) {
	list ($anum, $aalph) = explode ('.', $a);
	list ($bnum, $balph) = explode ('.', $b);
	
	if ($anum == $bnum) return strcmp($aalph, $balph);
	return $anum < $bnum ? -1 : 1;
}

function artSLFileDescSort($a, $b) {
	list ($anum, $aalph) = explode ('.', $a);
	list ($bnum, $balph) = explode ('.', $b);
	
	if ($anum == $bnum) return !strcmp($aalph, $balph);
	return $anum > $bnum ? -1 : 1;
}

?>