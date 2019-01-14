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
  if (isGameOver) {
    fill(255);
    textAlign(CENTER);
    text("Press Enter to Start", 200, 200);
    return;
  }
  var counts = {};
  for (var key in blocks) {
    var block = blocks[key];
    if (counts[block.y]) {
      counts[block.y]++;
    } else {
      counts[block.y] = 1;
    }
  }
  var removedRowExists = false;
  for (var key in counts) {
    if (counts[key] === 10) {
      removedRowExists = true;
      blocks = blocks.filter((b) => b.y !== parseInt(key));
      for (var k in blocks) {
        var bl = blocks[k];
        if (bl.y < parseInt(key)) {
          blocks[k].fall();
        }
      }
    }
  }
  if (removedRowExists) {
    b = new Tetrimino(400 / 2, 0);
  } /* else */
  if (isEmpty(b.b1.x, b.b1.y + BLOCK_UNIT) &&
    isEmpty(b.b2.x, b.b2.y + BLOCK_UNIT)) {
    b.fall();
  } else {
    var tmp = Object.assign({}, b);
    blocks.push(tmp.b1);
    blocks.push(tmp.b2);
    b = new Tetrimino(400 / 2, -BLOCK_UNIT);
    if (!isEmpty(b.b1.x, b.b1.y + BLOCK_UNIT) ||
      !isEmpty(b.b2.x, b.b2.y + BLOCK_UNIT)) {
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
    if (isEmpty(b.b1.x - BLOCK_UNIT, b.b1.y) &&
      isEmpty(b.b2.x - BLOCK_UNIT, b.b2.y)) {
      b.moveLeft();
    }
  } else if (keyCode === 39) {
    if (isEmpty(b.b1.x + BLOCK_UNIT, b.b1.y) &&
      isEmpty(b.b2.x + BLOCK_UNIT, b.b2.y)) {
      b.moveRight();
    }
  } else if (keyCode === 65) {
    b.rotateLeft();
    if (!isEmpty(b.b2.x, b.b2.y)) {
    	b.rotateRight(); 
    }
  } else if (keyCode === 83) {
    b.rotateRight();
    if (!isEmpty(b.b2.x, b.b2.y)) {
    	b.rotateLeft();
    }
  } else {
    console.log(keyCode);
  }
}

function init() {
  b = new Tetrimino(400 / 2, -BLOCK_UNIT);
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

function Tetrimino(x, y) {
  this.rotateType = 0;
  this.b1 = new Block(x, y);
  this.b2 = new Block(x + BLOCK_UNIT, y);
  this.rotate = function() {
    if (this.rotateType === 0) {
      this.b2 = new Block(this.b1.x + BLOCK_UNIT, this.b1.y);
    } else if (this.rotateType === 1) {
      this.b2 = new Block(this.b1.x, this.b1.y + BLOCK_UNIT);
    } else if (this.rotateType === 2) {
      this.b2 = new Block(this.b1.x - BLOCK_UNIT, this.b1.y);
    } else if (this.rotateType === 3) {
      this.b2 = new Block(this.b1.x, this.b1.y - BLOCK_UNIT);
    }
  }
  this.rotateLeft = function() {
    if (this.rotateType === 3) {
      this.rotateType = 0;
    } else {
      this.rotateType++;
    }
    this.rotate();
  }
  this.rotateRight = function() {
  	if (this.rotateType === 0) {
    	this.rotateType = 3;
    } else {
    	this.rotateType--;
    }
    this.rotate();
  }
  this.moveLeft = function() {
    this.b1.moveLeft();
    this.b2.moveLeft();
  }
  this.moveRight = function() {
    this.b1.moveRight();
    this.b2.moveRight();
  }
  this.fall = function() {
    this.b1.fall();
    this.b2.fall();
  }
  this.show = function() {
    this.b1.show();
    this.b2.show();
  }
}
