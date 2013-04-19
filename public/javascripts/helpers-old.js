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
		// do nothing
	}
	else {
		// featuresAnimation();
		/* if (! $.browser.safari) */ webKitAnimation();
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

function featuresInit() {
	var originalHeight = $("span.background", this).css("height");
	var headlineLineHeight = $("span.headline", this).css("line-height");
	var originalHeadlineHeight = $("span.headline", this).css("height");
	$("span.background", this).css({
		height: headlineLineHeight,
		minHeight: headlineLineHeight,
		maxHeight: originalHeight
	});
	// IE 8 crashes when setting the commented-out attributes
	$("span.headline", this).css({
		height: headlineLineHeight,
		minHeight: headlineLineHeight,
		maxHeight: originalHeadlineHeight,
		whiteSpace: "nowrap",
		textOverflow: "ellipsis"
	});
	$("span.lead", this).css({
		opacity: "0"
	});
		
	$(this).bind("mouseenter", {e: this}, featuresIn).bind("mouseleave", {e: this}, featuresOut).bind("mousedown", {e: this}, featuresClick).bind("mouseup", {e: this}, featuresUnClick);
}

function featuresIn(e) {
	var animationSpeed = globalAnimationSpeed;
	if (e.shiftKey) animationSpeed = 4 * globalAnimationSpeed;
	// var newHeight = parseInt($("span.headline", this).css("height")) + parseInt($("span.lead", this).css("height"));
	var newHeight = $("span.background", this).css("max-height");
	var newHeadlineHeight = $("span.headline", this).css("max-height");
	$("span.background", this).stop().animate({
		height: newHeight,
		opacity: "1"
	}, animationSpeed);
	$("span.headline", this).stop().css({
		whiteSpace: "normal",
		textOverflow: "normal"
	}).animate({
		height: newHeadlineHeight
	}, animationSpeed);
	$("span.lead", this).stop().animate({
		opacity: "1"
	}, animationSpeed);
}

function featuresOut(e) {
	var animationSpeed = globalAnimationSpeed;
	if (e.shiftKey) animationSpeed = 4 * globalAnimationSpeed;
	var oldHeight = $("span.background", this).css("min-height")
	var oldHeadlineHeight = $("span.headline", this).css("min-height");
	$("span.lead", this).stop().animate({
		opacity: "0"
	}, animationSpeed);
	$("span.background", this).stop().animate({
		height: oldHeight,
		opacity: "1"
	}, animationSpeed);
	$("span.headline", this).stop().animate({
		height: oldHeadlineHeight
	}, animationSpeed, function() {
		$(this).css({
			whiteSpace: "nowrap",
			textOverflow: "ellipsis"
		});
	});
}

function featuresClick(e) {
	var animationSpeed = globalAnimationSpeed;
	if (e.shiftKey) animationSpeed = 4 * globalAnimationSpeed;
	// $("span.background", this).stop().animate({
	// 	bottom: "-8px"
	// }, animationSpeed / 2);
	$("span.background", this).stop().animate({
		opacity: "0.85"
	}, animationSpeed / 2);
}

function featuresUnClick(e) {
	var animationSpeed = globalAnimationSpeed;
	if (e.shiftKey) animationSpeed = 4 * globalAnimationSpeed;
	// $("span.background", this).stop().animate({
	// 	bottom: "0"
	// }, animationSpeed / 4);
	$("span.background", this).stop().animate({
		opacity: "1"
	}, animationSpeed / 2);
}

function featuresAnimation() {
	// $("#features h3 a").each(featuresInit).hover({e: thfeaturesIn}, featuresOut).focus(featuresIn).blur(featuresOut);
	$("#features h3 a").each(featuresInit);
}

function webKitAnimation() {
	$('html #navigation a').not("li.current a").animateToSelector({
	    selectors: ['html #navigation a:hover, html #navigation a:focus, html #adminControls a:hover, html #adminControls a:focus'],
	    properties: ['background-color'],
		duration: globalAnimationSpeed,
	    events: ['mouseover', 'mouseout']
	}).animateToSelector({
	    selectors: ['html #navigation a:active, html #adminControls a:active'],
	    properties: ['background-color'],
		duration: globalAnimationSpeed,
	    events: ['mousedown', 'mouseup']
	});
	
	$('#sidebar a').not("a.current").animateToSelector({
		selectors: ['html #sidebar dd li a:hover, html #sidebar dd li a:focus, html #sidebar dd li a:active, html #sidebar dd li a.current'],
		properties: ['background-color'],
		duration: globalAnimationSpeed,
		events: ['mouseover', 'mouseout']
	}).animateToSelector({
		selectors: ['html #sidebar dd li a:active'],
		properties: ['background-color'],
		duration: globalAnimationSpeed,
	    events: ['mousedown', 'mouseup']
	});
	
	$("#features h3 a").bind("mouseenter", function() {
		$("span", this).trigger("parentMouseenter");
	}).bind("mouseleave", function() {
		$("span", this).trigger("parentMouseleave");
	}).bind("mousedown", function() {
		$("span", this).trigger("parentMousedown");
	}).bind("mouseup", 	function() {
		$("span", this).trigger("parentMouseup");
	});
	
	// Disable -webkit-transition; jQuery animates things more smoothly.
	if ($.browser.safari)
		$("#features h3 a span").css("-webkit-transition-property", "none");
	
	$("#features h3 a span.background").animateToSelector({
		selectors: ['body #features h3 a:hover span.background'],
		properties: ['height'],
		duration: globalAnimationSpeed,
		events: ['parentMouseenter', 'parentMouseleave']
	}).animateToSelector({
		selectors: ['body #features h3 a:active span.background'],
		properties: ['opacity'],
		duration: globalAnimationSpeed,
		events: ['parentMousedown', 'parentMouseup']
	});
	
	$("#features h3 a span.headline").animateToSelector({
		selectors: ['body #features h3 a:hover span.headline'],
		properties: ['height'],
		duration: globalAnimationSpeed,
		events: ['parentMouseenter', 'parentMouseleave']
	});
	
	$("#features h3 a span.lead").animateToSelector({
		selectors: ['body #features h3 a:hover span.lead'],
		properties: ['opacity'],
		duration: globalAnimationSpeed,
		events: ['parentMouseenter', 'parentMouseleave']
	});
}