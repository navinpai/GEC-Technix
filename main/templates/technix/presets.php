<?php
/**
* @package   yoo_bloc Template
* @file      presets.php
* @version   5.5.7 November 2010
* @author    YOOtheme http://www.yootheme.com
* @copyright Copyright (C) 2007 - 2010 YOOtheme GmbH
* @license   YOOtheme Proprietary Use License (http://www.yootheme.com/license)
*/

/*
 * Presets
 */

$default_preset = array();

$warp->config->addPreset('default', 'Business',array_merge($default_preset,array(
	'color' => 'default'
)));

$warp->config->addPreset('robot', 'Robot', array_merge($default_preset,array(
	'color' => 'robot'
)));

$warp->config->addPreset('architecture', 'Architecture', array_merge($default_preset,array(
	'color' => 'architecture'
)));

$warp->config->addPreset('distortion', 'Distortion', array_merge($default_preset,array(
	'color' => 'distortion'
)));

$warp->config->addPreset('stadium', 'Stadium', array_merge($default_preset,array(
	'color' => 'stadium'
)));

$warp->config->addPreset('curly', 'Curly', array_merge($default_preset,array(
	'color' => 'curly'
)));

$warp->config->addPreset('spaceship', 'Spaceship', array_merge($default_preset,array(
	'color' => 'spaceship'
)));

$warp->config->addPreset('retro', 'Retro', array_merge($default_preset,array(
	'color' => 'retro'
)));

$warp->config->addPreset('caribbean', 'Caribbean', array_merge($default_preset,array(
	'color' => 'caribbean'
)));

$warp->config->addPreset('stripes', 'Stripes', array_merge($default_preset,array(
	'color' => 'stripes'
)));

$warp->config->applyPreset();