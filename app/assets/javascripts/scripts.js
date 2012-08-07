
/*TOOL TIP*/
$(document).ready(function(){
	$(".thumbWrap a").hover(function() {
		$(this).next(".tooltipThumbs").animate({opacity: "show", top: "-175"}, "normal");
		}, function() {
			$(this).next(".tooltipThumbs").animate({opacity: "hide", top: "-200"}, "fast");
		
	});
});

/*CART TOOL TIP*/
$(document).ready(function(){
	$("a.cartView").click(function() {
		$(".tooltipCart").fadeToggle(500, function() {
			$(this).animate({top: "90"}, "normal");	
			$(this).animate({top: "104"}, "normal");
		}); 
		
	});	
});

/*MODAL WINDOW*/
$(document).ready(function(){
	$(".thumbWrap a").colorbox({
	overlayClose:false,
	scrolling:false,
	});
});