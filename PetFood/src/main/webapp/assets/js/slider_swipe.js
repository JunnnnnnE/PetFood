let sliderBody = document.querySelector('#sliderBody'),
	pageBody = document.querySelector('body'),
	beginTouch = 0,
	isTouch = false;

sliderBody.onmousedown = (event) => {
	beginTouch = event.clientX;
	isTouch = true;
}

sliderBody.ontouchstart = (event) => {
	beginTouch = event.changedTouches[0].clientX;
	isTouch = true;
}

pageBody.onmouseup = (event) => {
	if (isTouch) {
		let endTouch = event.clientX,
			isSwipe = Math.abs(beginTouch - endTouch) > 150 ? true : false;
		// console.log(beginTouch, endTouch);
		if (beginTouch < endTouch && isSwipe) {
			console.log('to the left');
			switchPrev();
		}
		else if (beginTouch > endTouch && isSwipe) {
			console.log('to the right');
			switchNext();
		}
		isTouch = false;
	}
}

pageBody.ontouchend = (event) => {
	if (isTouch) {
		let endTouch = event.changedTouches[0].clientX,
			isSwipe = Math.abs(beginTouch - endTouch) > 50 ? true : false;
		if (beginTouch < endTouch && isSwipe) {
			// console.log('to the left');
			switchPrev();
		}
		else if (beginTouch > endTouch && isSwipe) {
			// console.log('to the right');
			switchNext();
		}
		setTimeout(() => {isTouch = false}, 4);
	}
}