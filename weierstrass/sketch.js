const MAX_N = 100;
const RESOLUTION = 10;
const PADDING = 10;
const A = 0.7;
const B = 5

let currentScale = 1;
let centerX = 0;
let centerY = 0;

function setup() {
  let canvas = createCanvas(1000, 600);
  canvas.parent("p5");
  centerX = width / 2;
  centerY = height / 2;
}

function draw() {
  background(255);
  strokeWeight(1);
  stroke(0);
  line(width / 2, PADDING,width / 2, height) - PADDING;
  line(PADDING, height / 2, width - PADDING, height / 2);
  translate(centerX, centerY);
  scale(currentScale);
  noStroke();
  fill("red");
  ellipse(0, 0, 10 / currentScale, 10 / currentScale);
  beginShape();
	stroke("gray");
  strokeWeight(.3);
	noFill();
	for (let x = - 2 * width * RESOLUTION; x <  2 * width * RESOLUTION; x++) {
		let y =  height / 10 * weierstrass(MAX_N, x / width / RESOLUTION);
    vertex(x / RESOLUTION,  - y);
	}
  endShape();
  noLoop();
}

function mousePressed(event) {
  if(mouseX < 0 || mouseY < 0 || mouseX > width || mouseY > height) return;
  centerX = centerX + (width / 2 - mouseX);
  centerY = centerY + (height / 2 - mouseY);
  loop();
}

function mouseWheel(event) {
  if(mouseX < 0 || mouseY < 0 || mouseX > width || mouseY > height) return true;
  let val = event.delta;
  let dx = centerX - width  / 2;
  dx /= currentScale;
  let dy = centerY - height / 2; 
  dy /= currentScale;
  if(val < 0) {
    currentScale = Math.min(30, currentScale * 1.25);
  } else{
    currentScale = Math.max(0.3, currentScale * 0.8);
  }
  centerX = width / 2 + dx * currentScale;
  centerY = height / 2 + dy * currentScale;
  loop();
  return false;
}

function weierstrass(n, x) {
	let res = 0;
	for (let i = 0; i < n; i++) {
		res += Math.pow(A, i) * Math.cos(Math.pow(B, i) * Math.PI * x);
	}
	return res;
}