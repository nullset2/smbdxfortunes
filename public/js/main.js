function doExitRoutine(){
    playSound('fortune_opening');
    setTimeout(redirect(), 3000);
    animateMarquee();
}

function redirect(){
    window.location = "/result";
}

function playSound(name){
	var audio = new Audio('./wav/'+name+'.wav');
	audio.play();
}

function animateMarquee(){
	var marquee = document.getElementById("marquee");
	marquee.classList.add("animated-marquee");
}
