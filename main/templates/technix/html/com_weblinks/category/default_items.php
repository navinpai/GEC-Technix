<?php
/**
* @package   yoo_bloc Template
* @file      default_items.php
* @version   5.5.7 November 2010
* @author    YOOtheme http://www.yootheme.com
* @copyright Copyright (C) 2007 - 2010 YOOtheme GmbH
* @license   YOOtheme Proprietary Use License (http://www.yootheme.com/license)
*/

// no direct access
defined('_JEXEC') or die('Restricted access');
?>

<script language="javascript" type="text/javascript">
	function tableOrdering( order, dir, task ) {
	var form = document.adminForm;

	form.filter_order.value 	= order;
	form.filter_order_Dir.value	= dir;
	document.adminForm.submit( task );
}
</script>

<form action="<?php echo JFilterOutput::ampReplace($this->action); ?>" method="post" name="adminForm">

<div class="filter">
<?php
	echo JText::_('Display Num') .'&nbsp;';
	echo $this->pagination->getLimitBox();
?>
</div>

<table width="100%" border="0" cellspacing="0" cellpadding="0" class="joomlatable">
	<?php if ( $this->params->def( 'show_headings', 1 ) ) : ?>
	<tr>
		<th width="10" align="right">
			<?php echo JText::_('Num'); ?>
		</th>
		<th align="left" width="90%">
			<?php echo JHTML::_('grid.sort',  'Web Link', 'title', $this->lists['order_Dir'], $this->lists['order'] ); ?>
		</th>
		<?php if ( $this->params->get( 'show_link_hits' ) ) : ?>
		<th width="30" align="right" nowrap="nowrap">
			<?php echo JHTML::_('grid.sort',  'Hits', 'hits', $this->lists['order_Dir'], $this->lists['order'] ); ?>
		</th>
		<?php endif; ?>
	</tr>
	<?php endif; ?>
	
	<?php foreach ($this->items as $item) : ?>
	<tr class="<?php if ($item->odd) { echo 'even'; } else { echo 'odd'; } ?>">
		<td align="right">
			<?php echo $this->pagination->getRowOffset( $item->count ); ?>
		</td>
		<td>
			<?php if ( $item->image ) : ?>
				&nbsp;&nbsp;<?php echo $item->image;?>&nbsp;&nbsp;
			<?php endif; ?>
			<?php echo $item->link; ?>
			<?php if ( $this->params->get( 'show_link_description' ) ) : ?>
				<br /><span class="description"><?php echo nl2br($item->description); ?></span>
			<?php endif; ?>
		</td>
		<?php if ( $this->params->get( 'show_link_hits' ) ) : ?>
		<td align="center">
			<?php echo $item->hits; ?>
		</td>
		<?php endif; ?>
	</tr>
	<?php endforeach; ?>
	
</table>

<div class="pagination">
	<p class="results">
		<?php echo $this->pagination->getPagesCounter(); ?>
	</p>
	<?php echo $this->pagination->getPagesLinks(); ?>
</div>

<input type="hidden" name="filter_order" value="<?php echo $this->lists['order']; ?>" />
<input type="hidden" name="filter_order_Dir" value="" />
<input type="hidden" name="viewcache" value="0" />
</form>