<?php
/**
* @package   yoo_bloc Template
* @file      template.php
* @version   5.5.7 November 2010
* @author    YOOtheme http://www.yootheme.com
* @copyright Copyright (C) 2007 - 2010 YOOtheme GmbH
* @license   YOOtheme Proprietary Use License (http://www.yootheme.com/license)
*/

// get template configuration
include(dirname(__FILE__).'/template.config.php');

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<?php echo $this->warp->config->get('language'); ?>" lang="<?php echo $this->warp->config->get('language'); ?>" dir="<?php echo $this->warp->config->get('direction'); ?>" >
<head>
<!-- 
 ______               __                              ______        __     
/\__  _\             /\ \              __            /\  ___\     /'__`\   
\/_/\ \/    __    ___\ \ \___     ___ /\_\   __  _   \ \ \__/    /\ \/\ \  
   \ \ \  /'__`\ /'___\ \  _ `\ /' _ `\/\ \ /\ \/'\   \ \___``\  \ \ \ \ \ 
    \ \ \/\  __//\ \__/\ \ \ \ \/\ \/\ \ \ \\/>  </    \/\ \L\ \__\ \ \_\ \
     \ \_\ \____\ \____\\ \_\ \_\ \_\ \_\ \_\/\_/\_\    \ \____/\_\\ \____/
      \/_/\/____/\/____/ \/_/\/_/\/_/\/_/\/_/\//\/_/     \/___/\/_/ \/___/ 
                                                                           
																		   
 _   _      _             _     __   __               ___ _                   _   
| | | |_ _ | |___ __ _ __| |_   \ \ / /__ _  _ _ _   | __| |___ _ __  ___ _ _| |_ 
| |_| | ' \| / -_) _` (_-< ' \   \ V / _ \ || | '_|  | _|| / -_) '  \/ -_) ' \  _|
 \___/|_||_|_\___\__,_/__/_||_|   |_|\___/\_,_|_|    |___|_\___|_|_|_\___|_||_\__|
                                                                 
 -->                            
                         
                       
                         
<?php echo $this->warp->template->render('head'); ?>
<link rel="apple-touch-icon" href="<?php echo $this->warp->path->url('template:apple_touch_icon.png'); ?>" />
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-17194989-2']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
</head>

<body id="page" class="yoopage <?php echo $this->warp->config->get('columns'); ?> <?php echo $this->warp->config->get('itemcolor'); ?>">

	<?php if($this->warp->modules->count('absolute')) : ?>
	<div id="absolute">
		<?php echo $this->warp->modules->render('absolute'); ?>
	</div>
	<?php endif; ?>

	<div id="page-body">
		<div class="page-body-2">
			<div class="page-body-3">
				<div class="wrapper">
		
		<!--<img src="/technix/templates/yoo_bloc/images/header.png" /> -->
					<div id="header" class="<?php if (!$this->warp->modules->count('header')) echo 'wrapper-box-1';?>">
						<?php if ($this->warp->modules->count('header')) : ?>
						<div class="wrapper-box-1">
							<?php echo $this->warp->modules->render('header'); ?>
						</div>
						<div class="wrapper-box-b1">
							<div class="wrapper-box-b2">
								<div class="wrapper-box-b3"></div>
							</div>
						</div>
						<?php endif; ?>
		
						<?php if ($this->warp->modules->count('header') && ($this->warp->config->get('date') || $this->warp->modules->count('toolbarleft + toolbarright'))) : ?>
						<div id="toolbar">
						
							<?php if ($this->warp->config->get('date')) : ?>
							<div id="date">
								<?php echo $this->warp->config->get('actual_date'); ?>
							</div>
							<?php endif; ?>
						
							<?php if ($this->warp->modules->count('toolbarleft')) : ?>
							<div class="left">
								<?php echo $this->warp->modules->render('toolbarleft'); ?>
							</div>
							<?php endif; ?>
							
							<?php if ($this->warp->modules->count('toolbarright')) : ?>
							<div class="right">
								<?php echo $this->warp->modules->render('toolbarright'); ?>
							</div>
							<?php endif; ?>
							
						</div>
						<?php endif; ?>
		
						<div id="logo">
							<?php echo $this->warp->modules->render('logo'); ?>
						</div>
						
		
						<?php if ($this->warp->modules->count('search')) : ?>
						<div id="search">
							<?php echo $this->warp->modules->render('search'); ?>
						</div>
						<?php endif; ?>
		
						<div id="menubar">
							<div class="menubar-1">
								<div class="menubar-2">
									<div class="menubar-3">
									
									<?php if ($this->warp->modules->count('logo2')) : ?>
									<div id="logo2">
										<?php echo $this->warp->modules->render('logo2'); ?>
									</div>
									<?php endif; ?>
									
									<?php if ($this->warp->modules->count('menu')) : ?>
									<div id="menu">
										<?php echo $this->warp->modules->render('menu'); ?>
									</div>
									<?php endif; ?>
									
									</div>
								</div>
							</div>
						</div>
		
						<?php if ($this->warp->modules->count('banner')) : ?>
						<div id="banner">
							<?php echo $this->warp->modules->render('banner'); ?>
						</div>
						<?php endif;  ?>
		
					</div>
					<!-- header end -->
		
					<?php  if ($this->warp->modules->count('top + topblock')) : ?>
					<div id="top">
		
						<?php if($this->warp->modules->count('topblock')) : ?>
						<div class="topblock width100 float-left">
							<?php echo $this->warp->modules->render('topblock'); ?>
						</div>
						<?php endif; ?>
			
						<?php if ($this->warp->modules->count('top')) : ?>
						<div class="wrapper-box-1">
							 <?php echo $this->warp->modules->render('top', array('wrapper'=>"topbox float-left", 'layout'=>$this->warp->config->get('top'))); ?>
						</div>
							
						<div class="wrapper-box-b1">
							<div class="wrapper-box-b2">
								<div class="wrapper-box-b3"></div>
							</div>
						</div>
						<?php endif; ?>
		
					</div>
					<!-- top end -->
					<?php endif; ?>
		
					<div class="wrapper-middle-1">
						<div class="left-bg">
							<div class="right-bg">
								<div class="wrapper-middle-2">
									<div id="middle">
										<div id="middle-expand">
						
											<div id="main">
												<div id="main-shift">
						
													<?php if ($this->warp->modules->count('maintop')) : ?>
													<div id="maintop">
														<?php echo $this->warp->modules->render('maintop', array('wrapper'=>"maintopbox float-left", 'layout'=>$this->warp->config->get('maintop'))); ?>														
													</div>
													<!-- maintop end -->
													<?php endif; ?>
						
													<div class="contentleft-bg">
														<div class="contentright-bg">
															<div id="mainmiddle">
																<div id="mainmiddle-expand">
																
																	<div id="content">
																		<div id="content-shift">
								
																			<?php if ($this->warp->modules->count('contenttop')) : ?>
																			<div id="contenttop">
																				<?php echo $this->warp->modules->render('contenttop', array('wrapper'=>"contenttopbox float-left", 'layout'=>$this->warp->config->get('contenttop'))); ?>
																			</div>
																			<!-- contenttop end -->
																			<?php endif; ?>
								
																			<?php if ($this->warp->modules->count('breadcrumbs')) : ?>
																			<div id="breadcrumbs" align="center">
																				<?php echo $this->warp->modules->render('breadcrumbs'); ?>
																			</div>
																			<?php endif; ?>
								
																			<div id="component" class="floatbox">
																				<?php echo $this->warp->template->render('content'); ?>
																			</div>
												
																			<?php if ($this->warp->modules->count('contentbottom')) : ?>
																			<div id="contentbottom">
																				<?php echo $this->warp->modules->render('contentbottom', array('wrapper'=>"contentbottombox float-left", 'layout'=>$this->warp->config->get('contentbottom'))); ?>
																			</div>
																			<!-- mainbottom end -->
																			<?php endif; ?>
																		
																		</div>
																	</div>
																	<!-- content end -->
																	
																	<?php if($this->warp->modules->count('contentleft')) : ?>
																	<div id="contentleft">
																		<?php echo $this->warp->modules->render('contentleft'); ?>
																	</div>
																	<?php endif; ?>
																	
																	<?php if($this->warp->modules->count('contentright')) : ?>
																	<div id="contentright">
																		<?php echo $this->warp->modules->render('contentright'); ?>
																	</div>
																	<?php endif; ?>
																	
																</div>
															</div>
															<!-- mainmiddle end -->
														</div>
													</div>
						
													<?php if ($this->warp->modules->count('mainbottom')) : ?>
													<div id="mainbottom">
														<?php echo $this->warp->modules->render('mainbottom', array('wrapper'=>"mainbottombox float-left", 'layout'=>$this->warp->config->get('mainbottom'))); ?>
													</div>
													<!-- mainbottom end -->
													<?php endif; ?>
																									
												</div>
											</div>
											
											<?php if($this->warp->modules->count('left')) : ?>
											<div id="left">
											<?php echo $this->warp->modules->render('left'); ?>
											</div>
											<?php endif; ?>
											
											<?php if($this->warp->modules->count('right')) : ?>
											<div id="right">
												<?php echo $this->warp->modules->render('right'); ?>
											</div>
											<?php endif; ?>
						
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<div class="wrapper-box-b1">
							<div class="wrapper-box-b2">
								<div class="wrapper-box-b3"></div>
							</div>
						</div>
					</div>
		
					
					
					<?php if ($this->warp->modules->count('bottom + bottomblock')) : ?>
					<div id="bottom">
					
						<?php if($this->warp->modules->count('bottomblock')) : ?>
						<div class="bottomblock width100 float-left">
							<?php echo $this->warp->modules->render('bottomblock'); ?>
						</div>
						<?php endif; ?>
					
						<?php if ($this->warp->modules->count('bottom')) : ?>
						<div class="wrapper-box-1">
							<?php echo $this->warp->modules->render('bottom', array('wrapper'=>"bottombox float-left", 'layout'=>$this->warp->config->get('bottom'))); ?>
						</div>
						
						<div class="wrapper-box-b1">
							<div class="wrapper-box-b2">
								<div class="wrapper-box-b3"></div>
							</div>
						</div>
						<?php endif; ?>
		
					</div>
					<!-- bottom end -->
					<?php endif; ?>
		
					<?php if ($this->warp->modules->count('footer + debug')) : ?>
					<div id="footer">
		
						<a class="anchor" href="#page"></a>
						<?php echo $this->warp->modules->render('footer'); ?>
						<?php echo $this->warp->modules->render('debug'); ?>
		
					</div>
					
					<div class="footer-box-b1">
						<div class="footer-box-b2">
							<div class="footer-box-b3"></div>
						</div>
					</div>
					<!-- footer end -->
					<?php endif; ?>
		
				</div>
			</div>
		</div>
	</div>

	<?php echo $this->render('footer'); ?>
	<div align="center">
	<br/>
	<div>Copyright &#169; 2011 <b>Team CURSOR</b>.</div>
<div>Designed by <a title="The Robot Ain't Dead Yet" alt="The Robot Ain't Dead Yet"> R[o]b[o] Zombie Productions</a></div>
<br/>
</div>
	
</body>
</html>