let switchTimer = document.querySelector('#switchTimer');

switchTimer.onclick = () => {
	if (isAutoplay) {
		clearInterval(timer);
		isAutoplay = false;
		switchTimer.setAttribute('state', 'off');
		navbar.classList.remove('slider-navbar_autoplay');
	}
	else {
		isAutoplay = true;
		switchTimer.setAttribute('state', 'on');
		navbar.classList.add('slider-navbar_autoplay');
		timer = setInterval(() => {
			switchNext();
		}, 3000);
	}
}