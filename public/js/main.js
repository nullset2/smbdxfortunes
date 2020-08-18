Array.from(document.querySelectorAll(".card")).forEach(
	function(el) {
		el.addEventListener("click", cardClickListener);
		el.addEventListener("mouseover", cardMouseoverListener);
	}
);

function cardClickListener(e) {
	e.preventDefault();
    playSound('fortune_opening');
    doExitRoutine();
}

function cardMouseoverListener(e) {
	e.preventDefault();
    playSound('fortune_pick_option');
}

function doExitRoutine(){
    animateMarquee();
    setTimeout(function() {
    	window.location = "/result";
	}, 4000);
}

function playSound(name){
	var audio = new Audio('./wav/'+name+'.wav');
	audio.play();
}

function animateMarquee(){
	var marquee = document.getElementById("marquee");
	marquee.classList.add("animated-marquee");
}
