window.onload = function onLoad() {
 var progressValue = $("#progress").attr('value');
 console.log(progressValue)
   var circle = new ProgressBar.Circle('#progress', {
       color: '#FCB03C ',
       strokeWidth: 4,
       trailWidth: 1,
       duration: 3000,
       easing: 'easeInOut',
       text: {
         autoStyleContainer: false
       },from: { color: '#aaa', width: 1 },
       to: { color: '#333', width: 4 },
       // Set default step function for all animate calls
       step: function(state, circle) {
         circle.path.setAttribute('stroke', state.color);
         circle.path.setAttribute('stroke-width', state.width);

         var value = Math.round(circle.value() * 100);
         if (value === 0) {
           circle.setText('');
         } else {
           circle.setText(value);
         }
       }
   });

   circle.animate(progressValue);
};

$(function() {

    $('a[href="#toggle-search"], .navbar-bootsnipp .bootsnipp-search .input-group-btn > .btn[type="reset"]').on('click', function(event) {
		event.preventDefault();
		$('.navbar-bootsnipp .bootsnipp-search .input-group > input').val('');
		$('.navbar-bootsnipp .bootsnipp-search').toggleClass('open');
		$('a[href="#toggle-search"]').closest('li').toggleClass('active');

		if ($('.navbar-bootsnipp .bootsnipp-search').hasClass('open')) {
			/* I think .focus dosen't like css animations, set timeout to make sure input gets focus */
			setTimeout(function() {
				$('.navbar-bootsnipp .bootsnipp-search .form-control').focus();
			}, 100);
		}
	});

	$(document).on('keyup', function(event) {
		if (event.which == 27 && $('.navbar-bootsnipp .bootsnipp-search').hasClass('open')) {
			$('a[href="#toggle-search"]').trigger('click');
		}
	});

});
