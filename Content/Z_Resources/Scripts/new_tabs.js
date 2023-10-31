// PD-3859: tabs for code examples
// Source code: https://codepen.io/LCJohnson/pen/XWWeLNR
$(document).ready(function() {

		$('ul.tabs li').click(function() {
				var tab_id = $(this).attr('data-tab');

				$('ul.tabs li').removeClass('current');
				$('.tab-content').removeClass('current');

				$(this).addClass('current');
				$("#" + tab_id).addClass('current');
			})

	})