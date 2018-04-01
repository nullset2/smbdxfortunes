function doExitRoutine(){
	playSound('fortune_opening');
    animateMarquee();
    setTimeout(function() {
    	window.location = "/result";
	}, 3000);
}

function playSound(name){
	var audio = new Audio('./wav/'+name+'.wav');
	audio.play();
}

function animateMarquee(){
	var marquee = document.getElementById("marquee");
	marquee.classList.add("animated-marquee");
}
