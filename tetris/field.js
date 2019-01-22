function Field() {
  this.leftX = 200;
  this.rightX = 600;
  this.bottomY = 800;
  this.blocks = [];
  this.clear = function() {
    this.blocks = [];
  }
  this.addBlocks = function(bs) {
    for(var key in bs) {
      this.blocks.push(bs[key]);
    }
  }
  this.isEmpty = function(x, y) {
    if (x < this.leftX || x >= this.rightX || y >=  this.bottomY) {
      return false;
    }
    for (var key in this.blocks) {
      var bl = this.blocks[key];
      if (x === bl.x &&
        y ===bl.y) {
        return false;
      }
    }
    return true;
  }
  this.removeRows = function() {
    var counts = {};
    var removedCount = 0;
    for (var key in this.blocks) {
      var block = this.blocks[key];
      if (counts[block.y]) {
        counts[block.y]++;
      } else {
        counts[block.y] = 1;
      }
    }
    for (var key in counts) {
      if (counts[key] === 10) {
        removedCount++;
        this.blocks = this.blocks.filter((b) => b.y !== parseInt(key));
        for (var k in this.blocks) {
          var bl = this.blocks[k];
          if (bl.y < parseInt(key)) {
            bl.fall();
          }
        }
      }
    }
    return removedCount;
  }
  this.show = function() {
    for(var key in this.blocks) {
      this.blocks[key].show();
    }
  }
}
