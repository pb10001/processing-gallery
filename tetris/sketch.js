var current;
var field = new Field();
var BLOCK_UNIT = 20;
var isGameOver = true;
var isPaused = false;
var offsets = [
  /* Reverse L-shape */
  [
    {x: 0, y: + BLOCK_UNIT},
    {x: 0, y: + 2 * BLOCK_UNIT},
    {x: - BLOCK_UNIT, y: 0}
  ],
  /* L-shape */
  [
    {x: 0, y: + BLOCK_UNIT},
    {x: 0, y: + 2 * BLOCK_UNIT},
    {x: BLOCK_UNIT, y: 0}
  ],
  /* T-shape */
  [
    {x: 0, y: + BLOCK_UNIT},
    {x: BLOCK_UNIT, y: 0},
    {x: - BLOCK_UNIT, y: 0}
  ],
  /* Square */
  [
    {x: 0, y: + BLOCK_UNIT},
    {x: - BLOCK_UNIT, y: 0},
    {x: - BLOCK_UNIT, y: BLOCK_UNIT}
  ],
  /* Z-shape */
  [
    {x: 0, y: - BLOCK_UNIT},
    {x: - BLOCK_UNIT, y: -BLOCK_UNIT},
    {x:  BLOCK_UNIT, y: 0}    
  ],
  /* Reverse Z-shape */
  [
    {x: 0, y: - BLOCK_UNIT},
    {x: BLOCK_UNIT, y: -BLOCK_UNIT},
    {x: - BLOCK_UNIT, y: 0}    
  ],
  /* I-shape */
  [
    {x: 0, y: - BLOCK_UNIT},
    {x: 0, y: - 2 * BLOCK_UNIT},
    {x: 0, y: - 3 * BLOCK_UNIT}    
  ]
]
function setup() {
  var canvas = createCanvas(400, 400);
  canvas.parent("p5");
  frameRate(7);
}

function draw() {
  background(220);
  fill(0);
  rect(100, 0, 200, 400); // render the field
  if(isGameOver) {
    fill(255);
    textAlign(CENTER);
    text("Press Enter to Start", 200, 200);
    return;
  }
  /* in play */
  if (field.removeRows()) {
    current = new Cluster(new Block(400 / 2, -BLOCK_UNIT),  pickOffset());
  } else if (current.allBlocks().map((b) => field.isEmpty(b.x, b.y + BLOCK_UNIT)).reduce((a, b) => a & b, true)) {
    current.fall();
  } else {
    var tmp = current;
    field.addBlocks(current.allBlocks());
    current = new Cluster(new Block(400 / 2, - BLOCK_UNIT),  pickOffset());
    if(!field.isEmpty(current.root.x, current.root.y + BLOCK_UNIT)) {
        isGameOver = true;
    }
  }
  current.show();
  field.show();
}

function keyPressed() {
  if (keyCode === 13) {
    isGameOver = false;
    init();
  } else if (keyCode === 37) {
    if(current.allBlocks().map((b) => field.isEmpty(b.x - BLOCK_UNIT, b.y)).reduce((a, b) => a & b, true)) {
      current.moveLeft();
    }
  } else if (keyCode === 39) {
    if(current.allBlocks().map((b) => field.isEmpty(b.x + BLOCK_UNIT, b.y)).reduce((a, b) => a & b, true)) {
      current.moveRight();
    }
  } else if (keyCode === 65) {
    current.rotateLeft();
    if(!current.allBlocks().map((b) => field.isEmpty(b.x, b.y)).reduce((a, b) => a & b, true)) {
      current.rotateRight();
    }
  } else if (keyCode === 83) {
    current.rotateRight();
    if(!current.allBlocks().map((b) => field.isEmpty(b.x, b.y)).reduce((a, b) => a & b, true)) {
      current.rotateLeft();
    }
  } else if(keyCode === 80) {
    if (isPaused) {
      loop();
      isPaused = false;
    } else {
      noLoop();
      isPaused = true;
    }
  } else {
    console.log(keyCode);
  }
}

function init() {
  current = new Cluster(new Block(400 / 2, - BLOCK_UNIT), pickOffset());
  field.clear();
}
function pickOffset() {
  var num = Math.floor(random(7));
  return offsets[num];
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
