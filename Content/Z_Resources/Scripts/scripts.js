jQuery(document).ready(function(jQuery) {
	/**
	 * Toggle menu for mobile
	 */
	jQuery(".menu-btn").click(function() {
		jQuery(this).toggleClass("active");
		jQuery(".menu-overlay").toggleClass("open");
		jQuery("html, body").toggleClass("no-overflow");
		jQuery(".main-menu ul li.active").removeClass("active");
		jQuery(".main-menu ul.sub-menu").slideUp();
	});
})
