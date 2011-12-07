<?php
/**
* @package   yoo_bloc Template
* @file      index.php
* @version   5.5.7 November 2010
* @author    YOOtheme http://www.yootheme.com
* @copyright Copyright (C) 2007 - 2010 YOOtheme GmbH
* @license   YOOtheme Proprietary Use License (http://www.yootheme.com/license)
*/

// no direct access
defined('_JEXEC') or die('Restricted access');

// include config	
include_once(dirname(__FILE__).'/config.php');

//find the content in /layouts/template.php

echo $warp->template->render('template');