var b;
var blocks = [];
var BLOCK_UNIT = 20;
var isGameOver = true;
function setup() {
  var canvas = createCanvas(400, 400);
  canvas.parent("p5");
  frameRate(10);
}

function draw() {
  background(220);
  fill(0);
  rect(100, 0, 200, 400);
  if(isGameOver) {
    fill(255);
    textAlign(CENTER);
    text("Press Enter to Start", 200, 200);
    return;
  }
  var filtered = blocks.filter((b) => b.y === 400 - BLOCK_UNIT);
  if (filtered.length === 10) {
    blocks = blocks.filter((b) => b.y !== 400 - BLOCK_UNIT);
    blocks.map((b) => b.fall());
    b = new Block(400 / 2, 0);
  } else if (isEmpty(b.x, b.y + BLOCK_UNIT)) {
    b.fall();
  } else {
    var tmp = Object.assign({}, b);
    blocks.push(tmp);
    b = new Block(400 / 2, - BLOCK_UNIT);
    if(!isEmpty(b.x, b.y + BLOCK_UNIT)) {
        isGameOver = true;
    }
  }
  b.show();
  for (var key in blocks) {
    blocks[key].show();
  }
}

function isEmpty(x, y) {
  if (x < 100 || x >= 300 || y >= 400) {
    return false;
  }
  for (var key in blocks) {
    if (x === blocks[key].x &&
      	y === blocks[key].y) {
      return false;
    }
  }
  return true;
}

function keyPressed() {
  if (keyCode === 13) {
    isGameOver = false;
    init();
  } else if (keyCode === 37) {
    if(isEmpty(b.x - BLOCK_UNIT, b.y)) {
      b.moveLeft();
    }
  } else if (keyCode === 39) {
    if(isEmpty(b.x + BLOCK_UNIT, b.y)) {
      b.moveRight();
    }
  }
}

function init() {
    b = new Block(400 / 2, - BLOCK_UNIT);
    blocks = [];
}
function Block(x, y) {
  this.x = x;
  this.y = y;
  this.fall = function() {
    this.y += BLOCK_UNIT;
  };
  this.moveLeft = function() {
    this.x -= BLOCK_UNIT;
  };
  this.moveRight = function() {
    this.x += BLOCK_UNIT;
  };
  this.show = function() {
    fill(255);
    rect(this.x, this.y, BLOCK_UNIT, BLOCK_UNIT);
  };
}
