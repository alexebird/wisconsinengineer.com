function featuresInit() {
	var fullHeight = $("span.background", this).css("height");
	var smallHeight = $("span.headline", this).css("line-height");
	var fullHeadlineHeight = $("span.headline", this).css("height");
	
	if (smallHeight < fullHeadlineHeight || $("span.lead", this).length != 0)
		$(this).addClass("truncated");
	
	$("span.background", this).css("height", smallHeight);
	// Store the new and original heights.
	jQuery.data($("span.background", this).get(0), "smallHeight", smallHeight);
	jQuery.data($("span.background", this).get(0), "fullHeight", fullHeight);
	
	$("span.headline", this).css("height", smallHeight);
	jQuery.data($("span.headline", this).get(0), "smallHeight", smallHeight);
	jQuery.data($("span.headline", this).get(0), "fullHeight", fullHeadlineHeight);
	
	$("span.lead", this).css("opacity", "0");
		
	$(this).bind("mouseenter", {e: this}, featuresIn).bind("mouseleave", {e: this}, featuresOut).bind("mousedown", {e: this}, featuresClick).bind("mouseup", {e: this}, featuresUnClick).bind("focus", {e: this}, featuresFocus).bind("blur", {e: this}, featuresBlur);
}

function featuresIn(e) {
	var animationSpeed = globalAnimationSpeed;
	if (e.shiftKey) animationSpeed = 4 * globalAnimationSpeed;
	
	var fullHeight = jQuery.data($("span.background", this).get(0), "fullHeight");
	var fullHeadlineHeight = jQuery.data($("span.headline", this).get(0), "fullHeight");
	
	// if ($(this).hasClass("truncated")) $(this).removeClass("truncated");
	
	$("span.background", this).stop().animate({
		height: fullHeight,
		opacity: "1"
	}, animationSpeed);
	
	$("span.headline", this).stop().animate({
		height: fullHeadlineHeight
	}, animationSpeed);
	
	$("span.lead", this).stop().animate({
		opacity: "1"
	}, animationSpeed);
}

function featuresOut(e) {
	var animationSpeed = globalAnimationSpeed;
	if (e.shiftKey) animationSpeed = 4 * globalAnimationSpeed;
	
	var smallHeight = jQuery.data($("span.background", this).get(0), "smallHeight");
	var smallHeadlineHeight = jQuery.data($("span.headline", this).get(0), "smallHeight");
	
	var fullHeadlineHeight = jQuery.data($("span.headline", this).get(0), "fullHeight");
	
	$("span.background", this).stop().animate({
		height: smallHeight,
		opacity: "1"
	}, animationSpeed);
	
	$("span.headline", this).stop().animate({
		height: smallHeadlineHeight
	}, animationSpeed, function() {
		// if (smallHeadlineHeight < fullHeadlineHeight)
		// 	$(this).parent().parent().addClass("truncated");
	});
	
	$("span.lead", this).stop().animate({
		opacity: "0"
	}, animationSpeed);
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

function featuresFocus(e) {
	var animationSpeed = globalAnimationSpeed;
	if (e.shiftKey) animationSpeed = 4 * globalAnimationSpeed;
	
	var fullHeight = jQuery.data($("span.background", this).get(0), "fullHeight");
	var fullHeadlineHeight = jQuery.data($("span.headline", this).get(0), "fullHeight");
	
	$("span.background", this).stop().animate({
		height: fullHeight,
		opacity: "0.85"
	}, animationSpeed);
	
	$("span.headline", this).stop().animate({
		height: fullHeadlineHeight
	}, animationSpeed);
	
	$("span.lead", this).stop().animate({
		opacity: "1"
	}, animationSpeed);
}

function featuresBlur(e) {
	var animationSpeed = globalAnimationSpeed;
	if (e.shiftKey) animationSpeed = 4 * globalAnimationSpeed;
	
	var smallHeight = jQuery.data($("span.background", this).get(0), "smallHeight");
	var smallHeadlineHeight = jQuery.data($("span.headline", this).get(0), "smallHeight");
	
	$("span.background", this).stop().animate({
		height: smallHeight,
		opacity: "1"
	}, animationSpeed);
	
	$("span.headline", this).stop().animate({
		height: smallHeadlineHeight
	}, animationSpeed, function() {
		// if ($.browser.safari) {
		// 	$(this).css({
		// 		whiteSpace: "nowrap",
		// 		textOverflow: "ellipsis"
		// 	});
		// }
	});
	
	$("span.lead", this).stop().animate({
		opacity: "0"
	}, animationSpeed);
}

function featuresAnimation() {
	// $("#features h3 a").each(featuresInit).hover({e: thfeaturesIn}, featuresOut).focus(featuresIn).blur(featuresOut);
	$("#features h3 a").each(featuresInit);
}
