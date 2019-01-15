function Cluster() {
    this.blocks = blocks;
    this.fall = function() {

    }
    this.moveLeft = function() {
        for(var key in this.blocks) {
            blocks[key].moveLeft();
        }

    }
    this.moveRight = function() {
        for(var key in this.blocks) {
            blocks[key].moveRight();
        }

    }
    this.rotateLeft = function() {

    }
    this.rotateRight = function() {

    }
    this.show = function() {
        for(var key in this.blocks) {
            blocks[key].show();
        }
    }
}