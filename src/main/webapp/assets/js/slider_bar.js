function changeNavbarCurrent() {
	document.querySelector('.slider-navbar_cur-btn').classList.remove('slider-navbar_cur-btn');
	navbarBtns[current].classList.add('slider-navbar_cur-btn');
}

for (let i = 0; i < slides.length; i++) {
	let sliderNavBtn = document.createElement('button');
	if (i == current) {
		sliderNavBtn.className = 'slider-navbar_cur-btn';
	}
	navbar.append(sliderNavBtn);
}

let navbarBtns = document.querySelectorAll('#sliderNavbar button');

function switchSlideViaBar(clickedSlide) {
	if (clickedSlide != current && isSlideStop) {
		isSlideStop = false;
		setTimeout(() => {isSlideStop = true;}, transitionSpeed * 1.2);
		// 1 means clicked slide is in the right, -1 is in the left
		let curMove = (clickedSlide > current) ? -1 : 1,
			clickedMove = (curMove == 1) ? -1 : 1;
		slides[clickedSlide].style.transition = 'none';
		slides[clickedSlide].style.transform = 'translateX(' + (100 * clickedMove) + '%)';
		slides[current].style.transition = transitionValue;
		setTimeout(() => {slides[clickedSlide].style.transition = transitionValue}, 0);
		setTimeout(() => {
			slides[clickedSlide].style.transform = 'translateX(0%)';;
			slides[current].style.transform = 'translateX(' + (100 * curMove) + '%)';
		}, 1);
		setTimeout(() => {
			current = clickedSlide
			changeNavbarCurrent();
		}, 2);
	}
}

for (let i = 0; i < navbarBtns.length; i++) {
	navbarBtns[i].onclick = () => {
		switchSlideViaBar(i);
	};
}

if (isAutoplay) {
	navbar.classList.add('slider-navbar_autoplay');
	timer = setInterval(() => {
		switchNext();
	}, 3000);
}