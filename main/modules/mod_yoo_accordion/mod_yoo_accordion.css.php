<?php 

if (extension_loaded('zlib') && !ini_get('zlib.output_compression')) @ob_start('ob_gzhandler');
header('Content-type: text/css; charset=UTF-8');
header('Expires: ' . gmdate('D, d M Y H:i:s', time() + 86400) . ' GMT');

define('DS', DIRECTORY_SEPARATOR);
define('PATH_ROOT', dirname(__FILE__) . DS);

/* ie browser */
$is_ie7 = strpos(strtolower($_SERVER['HTTP_USER_AGENT']), 'msie 7') !== false;	
$is_ie6 = strpos(strtolower($_SERVER['HTTP_USER_AGENT']), 'msie 6') !== false;

/* general styling */
include(PATH_ROOT . 'styles/style.css');

if ($is_ie6 && !$is_ie7) include(PATH_ROOT . 'styles/ie6hacks.css');

/* default styling */
include(PATH_ROOT . 'styles/default/style.css');

include(PATH_ROOT . 'styles/default/black/style.css');

/* watermark styling */
include(PATH_ROOT . 'styles/watermark/style.css');

include(PATH_ROOT . 'styles/watermark/black/style.css');

/* whitespace styling */
include(PATH_ROOT . 'styles/whitespace/style.css');

include(PATH_ROOT . 'styles/whitespace/black/style.css');

?>