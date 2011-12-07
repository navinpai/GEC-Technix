/* Copyright (C) 2007 - 2010 YOOtheme GmbH, YOOtheme Proprietary Use License (http://www.yootheme.com/license) */

var WarpTemplate = {
		
	start: function() {

		/* Accordion menu */
		new Warp.AccordionMenu('div#middle ul.menu li.toggler', 'ul.accordion', { accordion: 'slide' });

		/* Dropdown menu */
		var dropdown = new Warp.Menu('menu', {
            mode: 'default', 
            dropdownSelector: 'div.dropdown', 
            transition: Fx.Transitions.Expo.easeOut,
            
            fancy: { mode: 'move', transition: Fx.Transitions.expoOut, duration: 500 }
        });
		dropdown.matchUlHeight();

		/* set hover color */
		switch (Warp.Settings.color) {
			case 'stripes':
				var menuEnter = '#8c8c8c';
				var menuLeave = '#919191';
				break;
			case 'caribbean':
				var menuEnter = '#e64f55';
				var menuLeave = '#fc575d';
				break;
			case 'retro':
				var menuEnter = '#d76010';
				var menuLeave = '#e7791c';
				break;
			case 'spaceship':
				var menuEnter = '#f47005';
				var menuLeave = '#fe7f04';
				break;
			case 'curly':
				var menuEnter = '#9f38ba';
				var menuLeave = '#ad3dcb';
				break;
			case 'stadium':
				var menuEnter = '#5f8e00';
				var menuLeave = '#669900';
				break;
			case 'distortion':
				var menuEnter = '#8babec';
				var menuLeave = '#96b9ff';
				break;
			case 'architecture':
				var menuEnter = '#797d90';
				var menuLeave = '#818599';
				break;
			case 'robot':
				var menuEnter = '#9DB670';
				var menuLeave = '#AAC579';
				break;	
			default:
				var menuEnter = '#3F92D0';
				var menuLeave = '#429ADB';
		}


		/* Morph: main menu - level2 (bg) */
		var menuEnter = { 'background-color': menuEnter };
		var menuLeave = { 'background-color': menuLeave };

		new Warp.Morph('#menu a.level2', menuEnter, menuLeave,
			{ transition: Fx.Transitions.linear, duration: 0, ignore: '#menu li.level2 a.parent' },
			{ transition: Fx.Transitions.sineIn, duration: 500 });

		/* Morph: mod-fading sub menu - level1 (bg) */
		var submenuEnter = { 'background-color': submenuEnter };
		var submenuLeave = { 'background-color': submenuLeave };

		new Warp.Morph('div.mod-sidebar ul.menu li.level2 a, div.mod-sidebar ul.menu li.levek2 span.separator', submenuEnter, submenuLeave,
			{ transition: Fx.Transitions.linear, duration: 0 },
			{ transition: Fx.Transitions.sineIn, duration: 300 });

		/* Smoothscroll */
		new SmoothScroll({ duration: 500, transition: Fx.Transitions.Expo.easeOut });

		/* Match height of div tags */
		Warp.Base.matchHeight('div.headerbox div.deepest', 20);
		Warp.Base.matchHeight('div.topbox div.deepest', 20);
		Warp.Base.matchHeight('div.bottombox div.deepest', 20);
		Warp.Base.matchHeight('div.maintopbox div.deepest', 20);
		Warp.Base.matchHeight('div.mainbottombox div.deepest', 20);
		Warp.Base.matchHeight('div.contenttopbox div.deepest', 20);
		Warp.Base.matchHeight('div.contentbottombox div.deepest', 20);

	}

};

/* Add functions on window load */
window.addEvent('domready', WarpTemplate.start);