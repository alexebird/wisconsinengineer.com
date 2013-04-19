// Authored by Joe Kohlmann

var globalAnimationSpeed = 250;

$(document).ready(function() {
	searchBoxAddPlaceholderText("Search WEM");
	// $("#header input[type='text']").attr("value", $(window).width());
	
	adjustAdDisplay();
	$(window).resize(function() {
		adjustAdDisplay();
		// $("#header input[type='text']").attr("value", $(window).width());
	});
	
	// #wrapper shadow for IE 8 only
	if ($.browser.msie) {
		if (parseInt(jQuery.browser.version) == 8)
			$("#wrapper").wrap('<div id="wrapperShadowIE"></div>');
	}
	
	if (navigator.userAgent.match(/iPad/i) || navigator.userAgent.match(/iPhone/i) || navigator.userAgent.match(/iPod/i)) {
		$("#sidebar a, #navigation a").css("-webkit-transition", "none");
	} else if (! $.browser.msie) {
		if (typeof featuresAnimation == "function") featuresAnimation();
		if (typeof webKitAnimation == "function" && ! $.browser.safari) webKitAnimation();
	}
});

function searchBoxAddPlaceholderText(placeholderText) {
	$("#searchBox").addClass("placeholder").attr("value", placeholderText).focus(function() {
		// On focus, clear the text field's value so that the user may type a search query.
		if ($(this).attr("value") == placeholderText) {
			$(this).removeClass("placeholder").attr("value", "");
		}
	}).blur(function() {
		// On blur, restore the placeholder text if the text field's value is empty.
		if ($(this).attr("value") == "") {
			$(this).addClass("placeholder").attr("value", placeholderText);
		}
	});
}

function adjustAdDisplay() {
	// window.alert($("#content").width() + " vs. " + $("#content").css("min-width"));
	if ($(window).width() <= 893)
		$("body").addClass("noVerticalAds");
	else
		$("body").removeClass("noVerticalAds");
}
