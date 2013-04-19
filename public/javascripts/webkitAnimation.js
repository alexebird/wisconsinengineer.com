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
