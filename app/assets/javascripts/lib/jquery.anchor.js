/*******

	***	Anchor Slider by Cedric Dugas   ***
	*** Http://www.position-absolute.com ***
	
	Never have an anchor jumping your content, slide it.

	Don't forget to put an id to your anchor !
	You can use and modify this script for any project you want, but please leave this comment as credit.
	
*****/

$(function () {
  $('.anchorLink').anchorAnimate({ topOffset: -100 });
});

jQuery.fn.anchorAnimate = function(settings) {
 	settings = jQuery.extend({ speed: 500, topOffset: 0 }, settings);	
    this.click(function (e) {
        var locationHref, elementClick, destination;

        //if (navigator.appName === 'Microsoft Internet Explorer') {
            //settings.topOffset = 0;
        //} else {
            //e.preventDefault();
            //e.stopPropagation();
        //}

        //locationHref = window.location.href;
        elementClick = $(this).attr("href");
        destination = $(elementClick).offset().top + settings.topOffset;

        // O callback depois da animação servia para adicionar o hash ao endereço,
        // isso fazia o pulo acontecer, coisa que eu não gostei.
        $("html:not(:animated),body:not(:animated)").animate({ scrollTop: destination }, settings.speed);

        return false;
    });
    return this;
};

//plugin scroll to top
jQuery.fn.topLink = function(settings) {
	settings = jQuery.extend({
		min: 1,
		fadeSpeed: 200
	}, settings);
	return this.each(function() {
		//listen for scroll
		var el = $(this);
		el.hide(); //in case the user forgot
		$(window).scroll(function() {
			if($(window).scrollTop() >= settings.min)
			{
				el.fadeIn(settings.fadeSpeed);
			}
			else
			{
				el.fadeOut(settings.fadeSpeed);
			}
		});
	});
};

