/* 
 * Bavely v1.2
 * Design_mylife
 */


//team carousel


			var slider = new MasterSlider();
		slider.setup('teamslider' , {
			loop:true,
			width:240,
			height:240,
			speed:20,
			view:'focus',
			preload:'all',
			space:0,
			wheel:true
		});
		slider.control('arrows');
		slider.control('slideinfo',{insertTo:'#staff-info'});

		$('#myTab a').click(function (e) {
		  e.preventDefault();
		  $(this).tab('show');
		});
                
                
//team carousel 2 in parallax demo  

var slider = new MasterSlider();
		slider.setup('teamslider-parallaxdemo' , {
			loop:true,
			width:240,
			height:240,
			speed:20,
			view:'fadeBasic',
			preload:0,
			space:0,
			wheel:true
		});
		slider.control('arrows');
		slider.control('slideinfo',{insertTo:'#staff-info'});


		$('#myTab a').click(function (e) {
		  e.preventDefault();
		  $(this).tab('show');
		});
                
                
//team carousel 3 in video slider demo

	var slider = new MasterSlider();
		slider.setup('teamslider-videodemo' , {
			loop:true,
			width:240,
			height:240,
			speed:20,
			view:'focus',
			preload:0,
			space:0,
			space:35,
			viewOptions:{centerSpace:1.6}
		});
		slider.control('arrows');
		slider.control('slideinfo',{insertTo:'#staff-info'});

		$('#myTab a').click(function (e) {
		  e.preventDefault()
		  $(this).tab('show')
		});